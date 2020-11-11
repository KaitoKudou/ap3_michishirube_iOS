//
//  NaviSpotRegisterPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/11/08.
//

import Foundation

class NaviSpotRegisterPresenter {
    var base64SendProtocol: Base64SendProtocol!
    var imageData: String!
    var placeText: String!
    var explainText: String!
    var emotionSellectNumber: Int!
    let userDefaults = UserDefaults.standard
    let settingEmotionSelectNumberKey = "emotionSellect" // UserDafaultを使う時のキー(感情の種類)
    let settingPlaceTextKey = "placeText" // UserDafaultを使う時のキー(場所の名前)
    let settingExplainTextKey = "explainText" // UserDafaultを使う時のキー(場所の詳細)
    
    init(base64SendProtocol: Base64SendProtocol) {
        self.base64SendProtocol = base64SendProtocol
    }
    
    func show() {
        imageData = base64SendProtocol.sendBase64()
        placeText = userDefaults.string(forKey: settingPlaceTextKey)
        emotionSellectNumber = userDefaults.integer(forKey: settingEmotionSelectNumberKey)
        explainText = userDefaults.string(forKey: settingExplainTextKey)
    }
}
