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

        let endpointURL = URL(string: "http://192.168.11.3:9020/query")!
        let transport = HTTPNetworkTransport(url: endpointURL, client: client)
        transport.delegate = self
        return ApolloClient(networkTransport: transport)
    }()
    
}

extension Network: HTTPNetworkTransportPreflightDelegate {
    // 送信すべきかどうかの取得
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
        shouldSend request: URLRequest) -> Bool {
        return true
    }
   
    // 送信前に呼ばれる
    func networkTransport(_ networkTransport: HTTPNetworkTransport,
        willSend request: inout URLRequest) {
        // 認証トークンの付加
        let keychain = KeychainSwift()
        if let token = keychain.get("value") {
            request.addValue(token, forHTTPHeaderField: "token")
        }
    }
}
