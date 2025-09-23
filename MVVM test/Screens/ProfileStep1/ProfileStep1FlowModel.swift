//
//  ProfileStep1FlowModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

enum ProfileStep1Route: Hashable {
    case step2(data: String)
    case step3(data: String)
}

final class ProfileStep1FlowModel: BaseFlowModel {

    func step2(data: String) { path.append(ProfileStep1Route.step2(data: data)) }
    func step3(data: String) { path.append(ProfileStep1Route.step3(data: data)) }
}
