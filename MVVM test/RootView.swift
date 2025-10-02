//
//  ContentView.swift
//  MVVM test
//
//  Created by Fox on 10.09.2025.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var flow: MainRouteFlowModel = MainRouteFlowModel()
    
    var body: some View {
        ZStack {
                VStack {
                    switch (flow.module) {
                    case .authorization:
                        AuthorizationView(viewModel: AuthorizationViewModel()).transition(.move(edge: .trailing))
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
                 // как push
                
//        }
       
    }
        
        
    
}

#Preview {
    RootView()
}


enum MainRoute: Hashable {
    
    case detail
    case settings
}

enum SheetRoute: Identifiable {
    case filter
    case user
    
    var id: String {
        switch self {
        case .filter: return "filter"
        case .user: return "user_"
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

final class MainRouteFlowModel: BaseFlowModel {
    
    @Published var module: Module = .authorization
    
    func openDetail(id: Int) { path.append(MainRoute.detail) }
    func openSettings() { path.append(MainRoute.settings) }
}
