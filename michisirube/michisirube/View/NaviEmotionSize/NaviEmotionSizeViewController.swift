//
//  NaviEmotionSizeViewController.swift
//  michisirube
//
//  Created by 安保友香梨 on 2020/10/27.
//

import UIKit

class NaviEmotionSizeViewController: UIViewController {
    
    //前ページの感情の種類を表示
    @IBOutlet weak var emotionType: UILabel!
    
    @IBOutlet weak var emotionSizeSmallButton: UIButton!
    @IBOutlet weak var emotionSizeMediumButton: UIButton!
    @IBOutlet weak var emotionSizeLargeButton: UIButton!
    
    let buttonImageSmall :UIImage? = UIImage(named:"EmotionSmallButton.png")
    let buttonImageBig :UIImage? = UIImage(named:"EmotionBigButton.png")

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    @IBAction func emoionSizeDecision(_ sender: Any) {
        let storyboard = UIStoryboard(name: "NaviTimeSelect", bundle: nil)
        let naviTimeSelectViewController = storyboard.instantiateViewController(identifier: "NaviTimeSelectViewController") as NaviTimeSelectViewController
        self.navigationController?.pushViewController(naviTimeSelectViewController, animated: true)
    }
    
    @IBAction func emotionSizeSmallButton(_ sender: Any) {
        //感情の大きさを0.3として値を保存
        print(0.3)
        emotionSizeSmallButton.setImage(buttonImageBig!, forState: .Normal)
        emotionSizeMediumButton.setImage(buttonImageSmall!, forState: .Normal)
        emotionSizeLargeButton.setImage(buttonImageSmall!, forState: .Normal)
    }
    
    @IBAction func emotionSizeMediumButton(_ sender: Any) {
        //感情の大きさを0.6として値を保存
        print(0.6)
        emotionSizeSmallButton.setImage(buttonImageSmall!, forState: .Normal)
        emotionSizeMediumButton.setImage(buttonImageBig!, forState: .Normal)
        emotionSizeLargeButton.setImage(buttonImageSmall!, forState: .Normal)
    }
    
    @IBAction func emotionSizeLargeButton(_ sender: Any) {
        //感情の大きさを0.9として値を保存
        print(0.9)
        emotionSizeSmallButton.setImage(buttonImageSmall!, forState: .Normal)
        emotionSizeMediumButton.setImage(buttonImageSmall!, forState: .Normal)
        emotionSizeLargeButton.setImage(buttonImageBig!, forState: .Normal)
    }
    
}
