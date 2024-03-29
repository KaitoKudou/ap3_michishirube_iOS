//
//  NaviSpotListViewController.swift
//  michisirube
//
//  Created by 安保友香梨 on 2020/09/28.
//

import UIKit

class NaviSpotListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func spotRegisterScreenTransitionButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaviSpotRegister", bundle: nil)
        let naviSpotRegisterViewController = storyboard.instantiateViewController(identifier: "NaviSpotRegisterViewController") as NaviSpotRegisterViewController
        //self.navigationController?.pushViewController(naviSpotRegisterViewController, animated: true)
        self.present(naviSpotRegisterViewController, animated: true, completion: nil)
    }
    
}
