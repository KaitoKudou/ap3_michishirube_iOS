//
//  NaviDestinationPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/29.
//

import Foundation

class NaviDestinationPresenter {
    let userDefaults = UserDefaults.standard
    let settingKey = "value" // UserDafaultを使う時のキー
    // サーバーから目的地のリストを受け取る
    func getDestinationList(completion: @escaping ([SpotsQuery.Data.Spot]) -> Void) {
        let emotionTypeNumber = userDefaults.integer(forKey: settingKey)
        print("感情の種類の番号：\(emotionTypeNumber)")
        Network.shared.apollo.fetch(query: SpotsQuery(deviceLatitude: 41.796771, deviceLongitude: 140.757028, worktime: 0, emotion: emotionTypeNumber)) { [weak self] result in

            guard self != nil else {
              return
            }

            switch result {
            case .success(let graphQLResult):
                completion([graphQLResult.data!.spots])

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
