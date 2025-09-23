//
//  TabbarService.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import Foundation

protocol TabbarServiceDelegate {
    func authorizationSuccess()
}

final class TabbarService: BaseService {
    var delegate: TabbarServiceDelegate!
    let network: TabbarNetwork = TabbarNetwork()
    
    
    func authorize() {
        delegate.authorizationSuccess()
    }
    

}
