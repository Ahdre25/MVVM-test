//
//  ContentView.swift
//  MVVM test
//
//  Created by Fox on 10.09.2025.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var flow: RootFlowModel = RootFlowModel()
    
    var body: some View {
        ZStack {
            VStack {
                switch (flow.module) {
                case .authorization:
                    AuthorizationView(viewModel: AuthorizationViewModel())
                case .main(let user):
                    TabbarView(viewModel: TabbarViewModel(user: user))
                }
            }.animation(.easeInOut(duration: 0.3), value: flow.cover)
            
            //            .sheet(item: $flow.sheet) { sheet in
            //                                switch sheet {
            //                                case .filter:
            //                                    FilterSheet()
            //                                        .presentationDetents([.medium, .large])
            //                                        .interactiveDismissDisabled(false)
            //                                case .user(let user):
            //                                    UserSheet(user: user)
            //                                }
            //                            }
            if flow.cover == .profileEdit {
                ProfileStep1View(viewModel: ProfileStep1ViewModel()).transition(.move(edge: .trailing)).zIndex(1)
            }
        }
        
        .environmentObject(flow)
        .animation(.easeInOut(duration: 0.3), value: flow.cover)
        
    }
        
        
    
}

#Preview {
    RootView()
}


enum RootRoute: Hashable {
    
    case detail
    case settings
}

enum SheetRoute: Identifiable {
    case citySearch(cities: [String])
    
    var id: String {
        switch self {
        case .citySearch: return "citySearch_"
        }
    }
}

enum CoverRoute: Identifiable {
    case profileEdit
    
    var id: String {
        switch self {
        case .profileEdit: return "profileEdit"
        }
    }
}

enum Module {
    case authorization
    case main(user: String)
}

final class RootFlowModel: BaseFlowModel {
    
    @Published var module: Module = .authorization
    
    func openDetail(id: Int) { path.append(RootRoute.detail) }
    func openSettings() { path.append(RootRoute.settings) }
}
