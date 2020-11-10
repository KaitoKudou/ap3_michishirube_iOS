//
//  NaviDestinationPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/29.
//

import Foundation

class NaviDestinationPresenter {
    let userDefaults = UserDefaults.standard
    let settingKey = "value" // UserDafaultを使う時のキー(感情の値)
    let settingWorkTimeKey = "time" // UserDafaultを使う時のキー(所要時間)
    let settingDeviceLatitudeKey = "deviceLatitude" // デバイスの緯度
    let settingDeviceLongitudeKey = "deviceLongitude" // デバイスの経度
    
    // サーバーから目的地のリストを受け取る
    func getDestinationList(completion: @escaping ([SpotsQuery.Data.Spot.Spot?]) -> Void) {
        let emotionTypeNumber = userDefaults.integer(forKey: settingKey)
        let workTime = userDefaults.integer(forKey: settingWorkTimeKey)
        let latitude = userDefaults.double(forKey: settingDeviceLatitudeKey)
        let longitude = userDefaults.double(forKey: settingDeviceLongitudeKey)
        print("感情の種類の番号：\(emotionTypeNumber)")
        print("所要時間：\(workTime)分")
        print("デバイスの緯度\(latitude)")
        print("デバイスの経度\(longitude)")
        Network.shared.apollo.fetch(query: SpotsQuery(deviceLatitude: latitude, deviceLongitude: longitude, worktime: workTime, emotion: emotionTypeNumber)) { [weak self] result in

            guard self != nil else {
              return
            }

            switch result {
            case .success(let graphQLResult):
                completion([graphQLResult.data!.spots.spot])

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    // サーバから寄り道をもらう
    func getDetourList(completion: @escaping ([[SpotsQuery.Data.Spot.Detour?]?]) -> Void) {
        let emotionTypeNumber = userDefaults.integer(forKey: settingKey)
        print("感情の種類の番号：\(emotionTypeNumber)")
        Network.shared.apollo.fetch(query: SpotsQuery(deviceLatitude: 41.796771, deviceLongitude: 140.757028, worktime: 0, emotion: emotionTypeNumber)) { [weak self] result in

            guard self != nil else {
              return
            }

            switch result {
            case .success(let graphQLResult):
                completion([graphQLResult.data!.spots.detour])

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
