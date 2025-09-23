//
//  InnerProfileStepFlowModel.swift
//  MVVM test
//
//  Created by Fox on 19.09.2025
//

import SwiftUI

enum InnerProfileStepRoute: Hashable {
    case detail(id: Int)
}

final class InnerProfileStepFlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(InnerProfileStepRoute.detail(id: id)) }
}
