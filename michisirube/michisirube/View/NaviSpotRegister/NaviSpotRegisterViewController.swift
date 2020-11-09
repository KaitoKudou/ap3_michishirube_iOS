//
//  NaviSpotRegisterViewController.swift
//  michisirube
//
//  Created by 安保友香梨 on 2020/09/29.
//

import UIKit

protocol Base64SendProtocol {
    func sendBase64() -> String // UIImageをbase64に変更してサーバに送る
}

class NaviSpotRegisterViewController: UIViewController{

    @IBOutlet weak var selectEmotionLabel: UILabel!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var explainTextField: UITextField!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var spotImageView: UIImageView!{
        didSet {
            // デフォルトの画像を表示する
            spotImageView.image = UIImage(named: "no_image.png")
        }
    }
    @IBOutlet weak var emotionSelectButton: PickerViewKeyboard!
    
    let list: [String] = ["幸せ", "怒り", "ショック", "普通"]
    var base64String: String? = nil
    var naviSpotRegisterPresenter: NaviSpotRegisterPresenter!
    var emotionSellectNumber: Int!
    let userDefaults = UserDefaults.standard
    let settingEmotionSellectNumberKey = "emotionSellect" // UserDafaultを使う時のキー(感情の種類)
    let settingPlaceTextKey = "placeText" // UserDafaultを使う時のキー(場所の名前)
    let settingExplainTextKey = "explainText" // UserDafaultを使う時のキー(場所の詳細)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        naviSpotRegisterPresenter = NaviSpotRegisterPresenter(base64SendProtocol: self)
        photoButton.imageView?.contentMode = .scaleAspectFit
        photoButton.contentHorizontalAlignment = .fill
        photoButton.contentVerticalAlignment = .fill
        
        self.view.setBackground(name: "Background")
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        // NavigationBarを透明化
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        //下線の表示
        placeTextField.addBorderBottom(height: 1.0, color: UIColor.lightGray)
        explainTextField.addBorderBottom(height: 1.0, color: UIColor.lightGray)
        selectEmotionLabel.addBorderBottom(height: 1.0, color: UIColor.lightGray)
        
        selectEmotionLabel.text = list.first
        emotionSelectButton.delegate = self
        placeTextField.delegate = self
        explainTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) // キーボード外タップでキーボードを閉じる
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBAction func selectPictureButton(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
    
    @IBAction func spotRegisterButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension NaviSpotRegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 選択した写真を取得する
        let image = info[.originalImage] as! UIImage
        // ビューに表示する
        spotImageView.image = image
        // UIImageをbase64に変換する
        let imageData = spotImageView.image?.pngData()
        base64String = imageData?.base64EncodedString(options: .lineLength64Characters)
        naviSpotRegisterPresenter.show()
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
}

extension NaviSpotRegisterViewController: PickerViewKeyboardDelegate {
    func sendEmotionNumber(row: Int) {
        emotionSellectNumber = row
        userDefaults.register(defaults: [settingEmotionSellectNumberKey: emotionSellectNumber as Int])
    }
    
    func updateSelectEmotionLabel(selectedData: String) {
        selectEmotionLabel.text = selectedData
    }
    func titlesOfPickerViewKeyboard(sender: PickerViewKeyboard) -> Array<String> {
        return list
    }
    func initSelectedRow(sender: PickerViewKeyboard) -> Int {
        return list.count
    }
    func didDone(sender: PickerViewKeyboard, selectedData: String) {
        sender.resignFirstResponder()
    }
}

extension NaviSpotRegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userDefaults.register(defaults: [settingPlaceTextKey: placeTextField.text ?? ""])
        userDefaults.register(defaults: [settingExplainTextKey: explainTextField.text ?? ""])
        placeTextField.resignFirstResponder()
        explainTextField.resignFirstResponder()
        return true
    }
}

extension NaviSpotRegisterViewController: Base64SendProtocol {
    func sendBase64() -> String {
        return self.base64String ?? "nothing"
    }
}
