//
//  NaviSpotRegisterPresenter.swift
//  michisirube
//
//  Created by 工藤海斗 on 2020/11/08.
//

import Foundation

class NaviSpotRegisterPresenter {
    var  base64SendProtocol: Base64SendProtocol!
    
    init(view: Base64SendProtocol) {
        self.base64SendProtocol = view
    }
    
    func showBase64() {
        let data = base64SendProtocol.sendBase64()
        print(data)
    }
}
