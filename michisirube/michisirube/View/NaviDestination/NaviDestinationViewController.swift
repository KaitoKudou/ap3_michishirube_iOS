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
    var spots = [SpotsQuery.Data.Spot]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        destinationLabel.text = ""
        //背景設定
        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        naviDestinationPresenter.getDestinationList(completion: { spots in
            self.spots = spots
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let randomInt = Int.random(in: 0 ..< 4)   // 0から3の範囲で整数（Int型）乱数を生成
        destinationLabel.text = self.spots[0].spots![randomInt]?.name
        print(self.spots[0].spots![randomInt] as Any) // self.spots[0(fix)].spots![0(variable)]
        destinationLatitude = (self.spots[0].spots![randomInt]?.locate!.latitude)!
        destinationLongitude = (self.spots[0].spots![randomInt]?.locate!.longitude)!
    }
    
    
    @IBAction func NaviDestinationUpdate(_ sender: Any) {
        
    }
    
    
    @IBAction func NaviDestinationDecision(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaviNavigating", bundle: nil)
        let naviNavigatingViewController = storyboard.instantiateViewController(identifier: "NaviNavigatingViewController") as NaviNavigatingViewController
        self.navigationController?.pushViewController(naviNavigatingViewController, animated: true)
        
        //Googleマップに遷移，もしGoogleマップのアプリがインストールされていなければ既存のマップアプリを起動する
        if UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!) {
            urlString = "comgooglemaps://?daddr=\(destinationLatitude),\(destinationLongitude)&directionsmode=walking&zoom=14"
        } else {
            urlString = "http://maps.apple.com/?daddr=\(destinationLatitude),\(destinationLongitude)&dirflg=w"
        }
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
        UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)
    }
    
}
