//
//  NaviSpotRegisterPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/11/08.
//

import Firebase
import FirebaseStorage
import Foundation

class NaviSpotRegisterPresenter {
    var base64SendProtocol: Base64SendProtocol!
    var selectedJpagImageData: Data!
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
    var ref: DatabaseReference!
    
    init(base64SendProtocol: Base64SendProtocol) {
        self.base64SendProtocol = base64SendProtocol
        ref = Database.database().reference()
    }
    
    func setSendAddSpotInfomation() {
        imageData = base64SendProtocol.sendBase64()
        selectedJpagImageData = base64SendProtocol.sendJpegImageData()
        placeText = userDefaults.string(forKey: settingPlaceTextKey)
        emotionSellectNumber = userDefaults.integer(forKey: settingEmotionSelectNumberKey)
        explainText = userDefaults.string(forKey: settingExplainTextKey)
        
        // Firebase Storageに画像を保存
        //ストレージサーバのURLを取得
        let storage = Storage.storage().reference(forURL: "gs://michisirube.appspot.com")
        // パス: ストレージサーバのURL/detourImage/{placeText}.jpeg
        guard let placeText = placeText else { return }
        guard let explainText = explainText else { return }
        guard let emotionSellectNumber = emotionSellectNumber else { return }
        print("場所の名前：\(placeText)")
        print("感情の種類：\(emotionSellectNumber)")
        print("場所の説明：\(explainText)")
        print("選択された場所の画像：\(String(describing: selectedJpagImageData))")
        let imageRef = storage.child("detourImage").child("\(placeText).jpeg")
        //storageに画像を送信
        imageRef.putData(selectedJpagImageData, metadata: nil) { (metaData, error) in

            if error != nil {
                print(error.debugDescription)
                return
            }
            
            // ダウンロードURLを取得
            imageRef.downloadURL { (url, error) in
                if error != nil {
                    print(error.debugDescription)
                    return
                }
                let urlString = url!.absoluteString
                let addSpotInfomationDic = ["placeText": placeText, "emotionSellectNumber": emotionSellectNumber, "explainText": explainText, "detourImageURL": urlString] as [String : Any]
                self.ref.childByAutoId().setValue(addSpotInfomationDic)
            }
        }
        //sendAddSpotInfomation()
    }
    
    // サーバーにスポット登録の情報を送る
    func sendAddSpotInfomation() {
        let latitude = userDefaults.double(forKey: settingPhotoLatitudeKey)
        let longitude = userDefaults.double(forKey: settingPhotoLongitudeKey)
        
        Network.shared.apollo.perform(mutation: AddSpotMutation(name: placeText, description: explainText, image: imageData, latitude: latitude, longitude: longitude)){ [weak self] result in

            guard self != nil else {
              return
            }

            switch result {
            case .success(let graphQLResult):
                print([graphQLResult.data?.addSpot])

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
