//
//  MainFlowModel.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025
//

import SwiftUI

enum MainRoute: Hashable {
    case detail(id: UUID)
}

final class MainFlowModel: BaseFlowModel {

    func openDetail(id: UUID) { path.append(MainRoute.detail(id: id)) }
}
