//
//  NaviEvaluationPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/29.
//

import Foundation

class NaviEvaluationPresenter {
    let userDefaults = UserDefaults.standard
    let settingKey = "value" // UserDafaultを使う時のキー(感情の値)
    let settingSpotidKey = "spotid" // UserDafaultを使う時のキー(spotid)
    let settingEvaluationStatusKey = "status" // UserDafaultを使う時のキー(評価のstatus)
    
    // 目的地の評価結果をサーバに送る
    func sendEvaluationResult() {
        let emotionTypeNumber = userDefaults.integer(forKey: settingKey)
        let spotid = userDefaults.string(forKey: settingSpotidKey)
        let evaluationStatus = userDefaults.bool(forKey: settingEvaluationStatusKey)
        let semaphore = DispatchSemaphore(value: 0)
        print("感情の種類の番号：\(emotionTypeNumber)")
        print("スポットID：\(String(describing: spotid))")
        print("評価のステータス：\(evaluationStatus)")
        
        Network.shared.apollo.perform(mutation: AddEvaluationMutation(spotid: spotid ?? "", emotion: emotionTypeNumber, status: evaluationStatus)) { [weak self] result in
            semaphore.signal()
            
            guard self != nil else {
              return
            }

            switch result {
            case .success(let graphQLResult):
                print("success! : \([graphQLResult.data?.addEvaluation])")

            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
        semaphore.wait()
    }
}
