//
//  NaviEmotionSelectViewController.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/26.
//

import UIKit

class NaviEmotionSelectViewController: UIViewController {
    
    var emotionNunber = 0 // 感情の種類の値
    let settingKey = "value" // UserDafaultを使う時のキー
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    // 幸せのボタン
    // 感情の種類:0
    @IBAction func happinessButton(_ sender: Any) {
        emotionNunber = 0
        userDefaults.register(defaults: [settingKey: emotionNunber])
        
        let storyboard = UIStoryboard(name: "NaviTimeSelect", bundle: nil)
        let naviTimeSelectViewController = storyboard.instantiateViewController(identifier: "NaviTimeSelectViewController") as NaviTimeSelectViewController
        self.navigationController?.pushViewController(naviTimeSelectViewController, animated: true)
    }
    
    // 穏やかのボタン
    // 感情の種類:1
    @IBAction func normalButton(_ sender: Any) {
        emotionNunber = 1
        userDefaults.register(defaults: [settingKey: emotionNunber])
        
        let storyboard = UIStoryboard(name: "NaviTimeSelect", bundle: nil)
        let naviTimeSelectViewController = storyboard.instantiateViewController(identifier: "NaviTimeSelectViewController") as NaviTimeSelectViewController
        self.navigationController?.pushViewController(naviTimeSelectViewController, animated: true)
    }
    
    // 一番上の列の一番左を押すと次の画面へ遷移する
    // 他のボタンを押すと押しても現状は何も起きない
    // モック通り、怒りのボタン
    // 感情の種類:2
    @IBAction func angryButton(_ sender: Any) {
        emotionNunber = 2
        userDefaults.register(defaults: [settingKey: emotionNunber])
        
        let storyboard = UIStoryboard(name: "NaviEmotionSize", bundle: nil)
        let naviEmotionSizeViewController = storyboard.instantiateViewController(identifier: "NaviEmotionSizeViewController") as NaviEmotionSizeViewController
        self.navigationController?.pushViewController(naviEmotionSizeViewController, animated: true)
    }
    
    // ショックのボタン
    // 感情の種類:3
    @IBAction func shockButton(_ sender: Any) {
        emotionNunber = 3
        userDefaults.register(defaults: [settingKey: emotionNunber])
        
        let storyboard = UIStoryboard(name: "NaviTimeSelect", bundle: nil)
        let naviTimeSelectViewController = storyboard.instantiateViewController(identifier: "NaviTimeSelectViewController") as NaviTimeSelectViewController
        self.navigationController?.pushViewController(naviTimeSelectViewController, animated: true)
    }
    
}
