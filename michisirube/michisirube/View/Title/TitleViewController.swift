//
//  TitleViewController.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/26.
//

import UIKit
import CoreLocation

class TitleViewController: UIViewController {
    
    /// ロケーションマネージャ
    var locationManager: CLLocationManager!
    // 現在のユーザの緯度
    var latitudeNow: String = ""
    // 現在のユーザの経度
    var longitudeNow: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(true, animated: true)
        // ロケーションマネージャのセットアップ
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        setupLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func NavigationButton(_ sender: Any) {
        // マネージャの設定
        let status = CLLocationManager.authorizationStatus()
        if status == .denied {
            showAlert()
        } else {
            print(latitudeNow)
            print(longitudeNow)
        }
        
        let storyboard = UIStoryboard(name: "NaviEmotionSelect", bundle: nil)
        let naviEmotionSelectViewController = storyboard.instantiateViewController(identifier: "NaviEmotionSelectViewController") as NaviEmotionSelectViewController
        self.navigationController?.pushViewController(naviEmotionSelectViewController, animated: true)
    }
    
    @IBAction func SpotListButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaviSpotList", bundle: nil)
        let naviSpotListViewController = storyboard.instantiateViewController(identifier: "NaviSpotListViewController") as NaviSpotListViewController
        self.navigationController?.pushViewController(naviSpotListViewController, animated: true)
    }
    /// ロケーションマネージャのセットアップ
    func setupLocationManager() {
        // 位置情報取得許可ダイアログの表示
        locationManager.requestWhenInUseAuthorization() // アプリ使用中のみなのでバックグラウンドでは位置情報は許可されない
        locationManager.requestAlwaysAuthorization() // アプリがバックグラウンドでも許可される
        // マネージャの設定
        let status = CLLocationManager.authorizationStatus()
        // ステータスごとの処理
        if status == .authorizedWhenInUse {
            print("authorizationStatus:\(status.rawValue)");
            locationManager.distanceFilter = 10
        } else if status == .authorizedAlways {
            print("authorizationStatus:\(status.rawValue)");
            locationManager.distanceFilter = 10
        }
    }
    
    /// アラートを表示する
    func showAlert() {
        let alertTitle = "位置情報取得が許可されていません。"
        let alertMessage = "設定アプリの「プライバシー > 位置情報サービス」から変更してください。"
        let alert: UIAlertController = UIAlertController(
            title: alertTitle,
            message: alertMessage,
            preferredStyle:  UIAlertController.Style.alert
        )
        // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(
            title: "OK",
            style: UIAlertAction.Style.default,
            handler: nil
        )
        // UIAlertController に Action を追加
        alert.addAction(defaultAction)
        // Alertを表示
        present(alert, animated: true, completion: nil)
    }
}

extension TitleViewController: CLLocationManagerDelegate {
    /// 位置情報が更新された際、位置情報を格納する
    /// - Parameters:
    ///   - manager: ロケーションマネージャ
    ///   - locations: 位置情報
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        let latitude = location?.coordinate.latitude
        let longitude = location?.coordinate.longitude
        // 位置情報を格納する
        self.latitudeNow = String(latitude!)
        self.longitudeNow = String(longitude!)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

