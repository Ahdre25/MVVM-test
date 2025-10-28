//
//  MainFlowModel.swift
//  MVVM test
//
//  Created by Fox on 27.10.2025
//

import SwiftUI

enum MainRoute: Hashable {
    case detail(id: Int)
}

final class MainFlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(MainRoute.detail(id: id)) }
}
