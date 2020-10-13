//
//  Network.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/10/12.
//

import Apollo
import Foundation
import KeychainSwift

class Network {
    static let shared = Network()
        private(set) lazy var apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["id": "hoge", "pass": "pass"]
        let client = URLSessionClient(sessionConfiguration: configuration, callbackQueue: .none)
    
        let endpointURL = URL(string: "https://miraikeitai2020-bff.herokuapp.com/query")!
        let transport = HTTPNetworkTransport(url: endpointURL,
        client: client)
        
        return ApolloClient(networkTransport: transport)
    }()
    
}
