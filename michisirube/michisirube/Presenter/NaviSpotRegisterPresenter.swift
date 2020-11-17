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
    let settingPhotoLatitudeKey = "photoLatitude" // UserDafaultを使う時のキー(写真の緯度)
    let settingPhotoLongitudeKey = "photoLongitude" // UserDafaultを使う時のキー(写真の緯度)
    
    init(base64SendProtocol: Base64SendProtocol) {
        self.base64SendProtocol = base64SendProtocol
    }
    
    func setSendAddSpotInfomation() {
        imageData = base64SendProtocol.sendBase64()
        placeText = userDefaults.string(forKey: settingPlaceTextKey)
        emotionSellectNumber = userDefaults.integer(forKey: settingEmotionSelectNumberKey)
        explainText = userDefaults.string(forKey: settingExplainTextKey)
        sendAddSpotInfomation()
    }
    
    // サーバーにスポット登録の情報を送る
    func sendAddSpotInfomation() {
        let latitude = userDefaults.double(forKey: settingPhotoLatitudeKey)
        let longitude = userDefaults.double(forKey: settingPhotoLongitudeKey)
        print(latitude)
        print(longitude)
        print(imageData)
        print(placeText)
        print(emotionSellectNumber)
        print(explainText)
//        Network.shared.apollo.perform(mutation: AddSpotMutation(name: placeText, description: explainText, image: "", latitude: latitude, longitude: longitude)){ [weak self] result in
//
//            guard self != nil else {
//              return
//            }
//
//            switch result {
//            case .success(let graphQLResult):
//                print([graphQLResult.data?.addSpot])
//
//            case .failure(let error):
//                print("Failure! Error: \(error)")
//            }
//        }
    }
}
