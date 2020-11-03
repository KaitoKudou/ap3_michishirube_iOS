//
//  SceneDelegate.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/25.
//  Copyright © 2020 工藤海斗. All rights reserved.
//

import CoreLocation
import UIKit
import UserNotifications

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var center: UNUserNotificationCenter!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIStoryboard(name: "Title", bundle: nil).instantiateInitialViewController()
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
        
        // 通知許可の取得
        center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {[weak self] (granted, error) in
            guard let self = self else { return }
            if error != nil {
                return
            }
            if granted {
                print("通知許可")
                self.center.delegate = self
            } else {
                print("通知拒否")
            }
        })
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    // バックグラウンドで通知を出したいからここに書く
    // フォアグラウンドからバックグラウンドになった時に実行されるメソッド
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        print("sceneWillResignActive")
        let userDefaults = UserDefaults.standard
        var destinationLatitude: Double
        var destinationLongitude: Double
        var firstDetourLatitude: Double
        var firstDetourLongitude: Double
        let destinationLatitudeKey = "destinationLatitude" // 目的地の緯度を永続化させるためのキー
        let destinationLongitudeKey = "destinationLongitude" // 目的地の経度を永続化させるためのキー
        let firstDetourLatitudeKey = "firstDetourLatitude" // 1つ目寄り道の緯度を永続化させるためのキー
        let firstDetourLongitudeKey = "firstDetourLongitude" // 1つ目寄り道の経度を永続化させるためのキー
        
        destinationLatitude = userDefaults.double(forKey: destinationLatitudeKey)
        destinationLongitude = userDefaults.double(forKey: destinationLongitudeKey)
        firstDetourLatitude = userDefaults.double(forKey: firstDetourLatitudeKey)
        firstDetourLongitude = userDefaults.double(forKey: firstDetourLongitudeKey)
        print("目的地：\(destinationLatitude), \(destinationLongitude)")
        print("1つ目の寄り道：\(firstDetourLatitude), \(firstDetourLongitude)")
        
        //保存した目的地の位置情報を読み込んで緯度・軽度の設定を作りだす
        let coordinateDestination = CLLocationCoordinate2DMake(destinationLatitude, destinationLongitude)
        //保存した1つ目の寄り道の位置情報を読み込んで緯度・軽度の設定を作りだす
        let coordinateFirstDetour = CLLocationCoordinate2DMake(firstDetourLatitude, firstDetourLongitude)
        //目的地範囲を作成。ここでは半径11メートルの範囲
        let regionDestination = CLCircularRegion.init(center: coordinateDestination, radius: 20, identifier: "MY_NOTIFICATION_DESTINATION")
        //1つ目の寄り道の範囲を作成。ここでは半径11メートルの範囲
        let regionFirstDetour = CLCircularRegion.init(center: coordinateFirstDetour, radius: 20, identifier: "MY_NOTIFICATION_FIRST_DETOUR")
        //目的地の範囲の中から外への移動は通知しないが、範囲の外から中へは通知する設定
        regionDestination.notifyOnExit = false
        regionDestination.notifyOnEntry = true
        //1つ目の寄り道の範囲の中から外への移動は通知しないが、範囲の外から中へは通知する設定
        regionFirstDetour.notifyOnExit = false
        regionFirstDetour.notifyOnEntry = true
        //作成した目的地の範囲に入った時に通知をするトリガーを作成
        let triggerDestination: UNNotificationTrigger = UNLocationNotificationTrigger(region: regionDestination, repeats: false)
        //作成した1つ目の寄り道の範囲に入った時に通知をするトリガーを作成
        let triggerDetour: UNNotificationTrigger = UNLocationNotificationTrigger(region: regionFirstDetour, repeats: false)
        //通知する内容を作成
        let contentDestination = UNMutableNotificationContent()
        let contentDetour = UNMutableNotificationContent()
        contentDestination.title = "目的地に到着しました"
        contentDestination.body = "ここをタップして評価画面へ"
        contentDetour.title = "寄り道に到着しました"
        contentDetour.body = "ここをタップして寄り道の詳細画面へ"
        //通知の時に音を設定
        contentDestination.sound = UNNotificationSound.default
        contentDetour.sound = UNNotificationSound.default
        //目的地到着通知のリクエストを作成
        let requestDestination = UNNotificationRequest(identifier: "destination", content: contentDestination, trigger: triggerDestination)
        //1つ目の寄り道到着通知のリクエストを作成
        let requestDetour = UNNotificationRequest(identifier: "detour", content: contentDetour, trigger: triggerDetour)
        //目的地到着通知のリクエストを登録
        self.center.add(requestDestination, withCompletionHandler: nil)
        //寄り道到着通知のリクエストを登録
        self.center.add(requestDetour, withCompletionHandler: nil)
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("sceneDidEnterBackground")
    }


}

extension SceneDelegate: UNUserNotificationCenterDelegate {
    // 通知をタップするとこのメソッドが呼ばれる
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("通知がタップされた")
    }
}
