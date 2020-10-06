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
    //五稜郭の緯度経度
    let destinationLatitude = "41.796771"
    let destinationLongitude = "140.757028"
    var urlString: String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //背景設定
        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
               
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
