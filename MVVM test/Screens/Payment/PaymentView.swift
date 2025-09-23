

import SwiftUI

struct PaymentView: View {
    
    @EnvironmentObject var flow: MainRouteFlowModel
    @StateObject var viewModel: PaymentViewModel

    var body: some View {
//        NavigationStack(path: $flow.path) {
            VStack {
                TextField("Логин", text: $viewModel.username)
                TextField("Пароль", text: $viewModel.password)
                Button("Войти") {
//                    flow.openSettings()
                    viewModel.authorizationTap()
                }
                
                
            }.padding().lineSpacing(18).background(Color.red).cornerRadius(20)
//        }.navigationDestination(for: PaymentRoute.self, destination: { route in
//            switch(route) {
//            case .detail(id: let id): 
//                PaymentView(viewModel: PaymentViewModel())
//            }
            
            
//        })
        .onAppear {
            viewModel.onAuthorizationSuccess = {
                flow.openDetail(id: 0)
            }
        }
    }
}

//#Preview {
//    PaymentView(viewModel: PaymentViewModel())
//}
