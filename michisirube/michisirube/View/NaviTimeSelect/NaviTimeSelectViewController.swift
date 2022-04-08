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
    
    let naviTimeSelectPresenter = NaviTimeSelectPresenter()
    
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

    @IBAction func NaviTimeSelectDecision(_ sender: Any) {
        naviTimeSelectPresenter.format(date: timeRequiredPicker.date)
        let storyboard = UIStoryboard(name: "NaviDestination", bundle: nil)
        let naviDestinationViewController = storyboard.instantiateViewController(identifier: "NaviDestinationViewController") as NaviDestinationViewController
        self.navigationController?.pushViewController(naviDestinationViewController, animated: true)
    }
}
