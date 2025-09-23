//
//  ProfileStep3FlowModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

enum ProfileStep3Route: Hashable {
    case detail(id: Int)
}

final class ProfileStep3FlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(ProfileStep3Route.detail(id: id)) }
}
