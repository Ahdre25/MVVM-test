

import SwiftUI

struct ProfileStep3View: View {
    @EnvironmentObject var flow: RootFlowModel
    @EnvironmentObject var selfflow: ProfileStep1FlowModel
    @StateObject var viewModel: ProfileStep3ViewModel

    var body: some View {
            VStack {
                TextField("Логин", text: $viewModel.username)
                TextField("Пароль", text: $viewModel.password)
                Button("Войти") {
//                    flow.openSettings()
                    viewModel.authorizationTap()
                }
                
                
            }.padding().lineSpacing(18).onAppear {
            viewModel.onAuthorizationSuccess = {
                flow.cover = .none
            }
        }
    }
}

#Preview {
    ProfileStep3View(viewModel: ProfileStep3ViewModel())
}
