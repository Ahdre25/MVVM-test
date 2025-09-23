//
//  PaymentFlowModel.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025
//

import SwiftUI

enum PaymentRoute: Hashable {
    case detail(id: Int)
}

final class PaymentFlowModel: BaseFlowModel {

    func openDetail(id: Int) { path.append(PaymentRoute.detail(id: id)) }
}
