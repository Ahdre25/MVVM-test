//
//  AuthorizationRouter.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025.
//

import SwiftUI

enum AuthorizationRoute: Hashable {
    case detail(id: Int)
    case settings
}

final class AuthorizationFlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(AuthorizationRoute.detail(id: id)) }
    func openSettings() { path.append(AuthorizationRoute.settings) }
}
