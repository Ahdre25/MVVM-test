//
//  ProfileFlowModel.swift
//  MVVM test
//
//  Created by Fox on 17.09.2025
//

import SwiftUI

enum ProfileRoute: Hashable {
    case inner
    
}

final class ProfileFlowModel: BaseFlowModel {

    func openInner(id: Int) { path.append(ProfileRoute.inner) }
}
