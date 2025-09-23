//
//  ProfileStep2FlowModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

enum ProfileStep2Route: Hashable {
    case detail(id: Int)
}

final class ProfileStep2FlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(ProfileStep2Route.detail(id: id)) }
}
