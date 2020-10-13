//
//  NaviDestinationPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/09/29.
//

import Foundation

class NaviDestinationPresenter {
    // サーバーから目的地のリストを受け取る
    func getDestinationList(completion: @escaping ([SpotsQuery.Data.Spot]) -> Void) {
        
        Network.shared.apollo.fetch(query: SpotsQuery(deviceLatitude: 41.796771, deviceLongitude: 140.757028, worktime: 0, emotion: 0)) { [weak self] result in

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
