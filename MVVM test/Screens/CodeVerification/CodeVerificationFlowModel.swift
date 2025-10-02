//
//  CodeVerificationFlowModel.swift
//  MVVM test
//
//  Created by Fox on 30.09.2025
//

import SwiftUI

enum CodeVerificationRoute: Hashable {
    case detail(id: Int)
}

final class CodeVerificationFlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(CodeVerificationRoute.detail(id: id)) }
}
