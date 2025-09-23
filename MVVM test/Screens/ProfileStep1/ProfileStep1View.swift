

import SwiftUI

struct ProfileStep1View: View {
    @EnvironmentObject var flow: MainRouteFlowModel
    @StateObject var selfflow: ProfileStep1FlowModel = ProfileStep1FlowModel()
    @StateObject var viewModel: ProfileStep1ViewModel

    var body: some View {
        NavigationStack(path: $selfflow.path) {
            VStack {
                TextField("Логин", text: $viewModel.username)
                TextField("Пароль", text: $viewModel.password)
                Button("Войти") {
//                    flow.openSettings()
                    viewModel.authorizationTap()
                }
                Button("Выйти") {
//                    flow.openSettings()
                    flow.cover = .none
                }
                
                
            }.padding().lineSpacing(18)
                .navigationDestination(for: ProfileStep1Route.self, destination: { route in
                    switch(route) {
                        
                    case .step2(data: let data):
                        ProfileStep2View(viewModel: ProfileStep2ViewModel())
                    case .step3(data: let data):
                        ProfileStep3View(viewModel: ProfileStep3ViewModel())
                    }
                    
                })
        }.onAppear {
            viewModel.onAuthorizationSuccess = {
                selfflow.step2(data: "")
            }
        }.environmentObject(selfflow)
    }
}

#Preview {
    ProfileStep1View(viewModel: ProfileStep1ViewModel())
}
