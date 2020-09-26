//
//  NaviTimeSelectViewController.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/26.
//

import UIKit

class NaviTimeSelectViewController: UIViewController {

    @IBOutlet weak var timeRequiredPicker: UIDatePicker!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        timeRequiredPicker.setValue(UIColor.white, forKey: "textColor")
        detailLabel.textColor = UIColor.white
    }

}
