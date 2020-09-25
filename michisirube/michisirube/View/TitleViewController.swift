//
//  TitleViewController.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/26.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func NavigationButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaviEmotionSelect", bundle: nil)
        let naviEmotionSelectViewController = storyboard.instantiateViewController(identifier: "NaviEmotionSelectViewController") as NaviEmotionSelectViewController
        self.navigationController?.pushViewController(naviEmotionSelectViewController, animated: true)
    }
    
    @IBAction func SpotListButton(_ sender: Any) {
    }
    
}
