//
//  NaviEvaluationViewController.swift
//  michisirube
//
//  Created by 安保友香梨 on 2020/09/27.
//

import UIKit

class NaviEvaluationViewController: UIViewController {
    
    let userDefaults = UserDefaults.standard
    let settingEvaluationStatusKey = "status" // UserDafaultを使う時のキー(評価のstatus)
    let naviEvaluatioPresenter = NaviEvaluationPresenter()
    let dispatchGroup = DispatchGroup() // 非同期のグループ
    let dispatchQueue = DispatchQueue(label: "queue", attributes: .concurrent) // 並列で実行
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)

        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func evaluationGoodButton(_ sender: Any) {
        dispatchGroup.enter()
        dispatchQueue.async {
            print("-------------start--------------")
            self.userDefaults.register(defaults: [self.settingEvaluationStatusKey: true])
            self.naviEvaluatioPresenter.sendEvaluationResult()
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("-------------end--------------")
            let storyboard = UIStoryboard(name: "Title", bundle: nil)
            let naviDestinationViewController = storyboard.instantiateViewController(identifier: "TitleViewController") as TitleViewController
            self.navigationController?.pushViewController(naviDestinationViewController, animated: true)
        }
    }
    
    @IBAction func evaluationBadButton(_ sender: Any) {
        dispatchGroup.enter()
        dispatchQueue.async {
            print("-------------start--------------")
            self.userDefaults.register(defaults: [self.settingEvaluationStatusKey: false])
            self.naviEvaluatioPresenter.sendEvaluationResult()
            self.dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("-------------end--------------")
            let storyboard = UIStoryboard(name: "Title", bundle: nil)
            let naviDestinationViewController = storyboard.instantiateViewController(identifier: "TitleViewController") as TitleViewController
            self.navigationController?.pushViewController(naviDestinationViewController, animated: true)
        }
    }
    
}
