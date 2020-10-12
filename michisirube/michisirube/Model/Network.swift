//
//  Network.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/10/12.
//

import Apollo
import Foundation

class Network {
    static let shared = Network()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://miraikeitai2020-bff.herokuapp.com/query")!)
}
