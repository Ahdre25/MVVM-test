

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var flow: RootFlowModel
    @StateObject var selfFlow: ProfileFlowModel = ProfileFlowModel()
    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        NavigationStack(path: $selfFlow.path) {
            VStack {
                TextField("Логин", text: $viewModel.username)
                TextField("Пароль", text: $viewModel.password)
                Button("Войти") {
//                    flow.openSettings()
                    viewModel.authorizationTap()
                }
                Button("Войти внутри") {
//                    flow.openSettings()
                    selfFlow.openInner(id: 123)
                }
                
                
            }.padding().lineSpacing(18)
            
                .navigationDestination(for: ProfileRoute.self, destination: { route in
                    switch(route) {
                        
                    case .inner:
                        InnerProfileStepView(viewModel: InnerProfileStepViewModel())
                    
                    }
                    
                })
        }.onAppear {
            viewModel.onAuthorizationSuccess = {
                flow.cover = .profileEdit
            }
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewModel())
}
