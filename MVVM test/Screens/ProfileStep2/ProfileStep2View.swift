

import SwiftUI

struct ProfileStep2View: View {
    @EnvironmentObject var flow: MainRouteFlowModel
    @EnvironmentObject var selfflow: ProfileStep1FlowModel
    @StateObject var viewModel: ProfileStep2ViewModel

    var body: some View {
            VStack {
                TextField("Логин", text: $viewModel.username)
                TextField("Пароль", text: $viewModel.password)
                Button("Войти") {
//                    flow.openSettings()
                    viewModel.authorizationTap()
                }
                
                
            }.padding().lineSpacing(18)
        .onAppear {
            viewModel.onAuthorizationSuccess = {
                selfflow.step3(data: "")
            }
        }
    }
}

#Preview {
    ProfileStep2View(viewModel: ProfileStep2ViewModel())
}
