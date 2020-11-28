//
//  NaviSpotInformationViewController.swift
//  michisirube
//
//  Created by 安保友香梨 on 2020/11/09.
//

import UIKit

class NaviSpotInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    

    
     @IBAction func evaluateButton(_ sender: Any) {
     }
    

}
