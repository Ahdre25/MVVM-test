//
//  TabbarFlowModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

enum TabbarRoute: Hashable {
    case detail(id: Int)
}

final class TabbarFlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(TabbarRoute.detail(id: id)) }
}
