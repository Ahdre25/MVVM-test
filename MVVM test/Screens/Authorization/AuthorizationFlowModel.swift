//
//  AuthorizationRouter.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025.
//

import SwiftUI

enum AuthorizationRoute: Hashable {
    case code(phone: String)
}

final class AuthorizationFlowModel: BaseFlowModel {

    func openCode(phone: String) { path.append(AuthorizationRoute.code(phone: phone)) }
}
