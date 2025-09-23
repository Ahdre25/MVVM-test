//
//  AuthorizationView.swift
//  MVVM test
//
//  Created by Fox on 11.09.2025.
//

import SwiftUI





struct AuthorizationView: View {
    
    @EnvironmentObject var flow: MainRouteFlowModel
    @ObservedObject var viewModel: AuthorizationViewModel

    var body: some View {
//        NavigationStack(path: $flow.path) {
            VStack {
                TextField("Логин", text: $viewModel.username)
                TextField("Пароль", text: $viewModel.password)
                Button("Войти") {
//                    flow.openSettings()
                    viewModel.authorizationTap()
                }
                
                
                
            }.padding().lineSpacing(18)
//        }
                .onAppear {
            viewModel.onAuthorizationSuccess = {
                withAnimation {
                    flow.module = .main
                }
                
            }
                }
    }
    
    
    
    
}

#Preview {
    AuthorizationView(viewModel: AuthorizationViewModel())
}
