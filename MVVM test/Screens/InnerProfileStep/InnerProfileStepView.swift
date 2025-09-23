

import SwiftUI

struct InnerProfileStepView: View {
    
//    @StateObject var flow: InnerProfileStepFlowModel = InnerProfileStepFlowModel()
    @StateObject var viewModel: InnerProfileStepViewModel

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
//        }.navigationDestination(for: InnerProfileStepRoute.self, destination: { route in
//            switch(route) {
//            case .detail(id: let id):
//            
//            }
//            
//            
//        })
        .onAppear {
            viewModel.onAuthorizationSuccess = {
//                flow.openDetail(id: 0)
            }
        }
    }
}

#Preview {
    InnerProfileStepView(viewModel: InnerProfileStepViewModel())
}
