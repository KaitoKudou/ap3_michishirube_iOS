//
//  DetourInfomationViewController.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/11/03.
//

import UIKit

class DetourInfomationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}
