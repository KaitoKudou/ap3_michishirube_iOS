//
//  NaviDestinationViewController.swift
//  michisirube
//
//  Created by 安保友香梨 on 2020/09/27.
//

import UIKit
import MapKit

class NaviDestinationViewController: UIViewController {

    @IBOutlet weak var destinationView: UIView!
    @IBOutlet weak var destinationLabel: UILabel!
    
    //目的地の位置情報を0.0で初期化
    var destinationLatitude: Double = 0.0
    var destinationLongitude: Double = 0.0
    var urlString: String! = nil
    let naviDestinationPresenter = NaviDestinationPresenter()
    var spots = [SpotsQuery.Data.Spot.Spot?]()
    var detours = [[SpotsQuery.Data.Spot.Detour?]?]()
    var firstDetourLatitude: Double = 0.0 // 寄り道の緯度
    var firstDetourLongitude: Double = 0.0 // 寄り道の経度
    
    // 非同期のグループ
    let dispatchGroup = DispatchGroup()
    // 並列で実行
    let dispatchQueue = DispatchQueue(label: "queue", attributes: .concurrent)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationLabel.text = ""
        //背景設定
        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        // 1つ目の並列処理
        dispatchGroup.enter()
        dispatchQueue.async {
            print("-------------start--------------")
            self.naviDestinationPresenter.getDestinationList(completion: { spots in
                self.spots = spots
                print(self.spots)
                self.dispatchGroup.leave()
            })
        }
        
        // 2つ目の並列処理
        dispatchGroup.enter()
        dispatchQueue.async {
            self.naviDestinationPresenter.getDetourList(completion: { detour in
                self.detours = detour
                print(self.detours[0]![0] as Any)
                self.dispatchGroup.leave()
            })
        }
        
        dispatchGroup.notify(queue: .main) {
            // ↓ゆくゆく使う
            //let randomInt = Int.random(in: 0 ..< 4)   // 0から3の範囲で整数（Int型）乱数を生成
            self.destinationLabel.text = self.spots[0]?.name
            self.destinationLatitude = (self.spots[0]?.locate?.latitude)!
            self.destinationLongitude = (self.spots[0]?.locate?.longitude)!
            self.firstDetourLatitude = (self.detours[0]?[0]?.locate?.latitude)!
            self.firstDetourLongitude = (self.detours[0]?[0]?.locate?.longitude)!
            print("-------------end--------------")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    
    @IBAction func NaviDestinationUpdate(_ sender: Any) {
        
    }
    
    
    @IBAction func NaviDestinationDecision(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaviNavigating", bundle: nil)
        let naviNavigatingViewController = storyboard.instantiateViewController(identifier: "NaviNavigatingViewController") as NaviNavigatingViewController
        self.navigationController?.pushViewController(naviNavigatingViewController, animated: true)
        
        //Googleマップに遷移，もしGoogleマップのアプリがインストールされていなければ既存のマップアプリを起動する
        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
            urlString = "comgooglemapsurl://?daddr=\(firstDetourLatitude),\(firstDetourLongitude)+to:\(destinationLatitude),\(destinationLongitude)&directionsmode=walking&zoom=14"
        } else {
            urlString = "http://maps.apple.com/?daddr=\(destinationLatitude),\(destinationLongitude)&dirflg=w"
        }
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
        UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)
    }
    
}
