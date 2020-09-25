//
//  NaviEmotionSelectViewController.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/26.
//

import UIKit

class NaviEmotionSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // 一番上の列の一番左を押すと次の画面へ遷移する
    // 他のボタンを押すと押しても現状は何も起きない
    // モック通り、怒りのボタン
    @IBAction func angryButton(_ sender: Any) {
    }
    
    
}
