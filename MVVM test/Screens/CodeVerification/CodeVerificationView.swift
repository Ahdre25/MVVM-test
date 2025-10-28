

import SwiftUI

struct CodeVerificationView: View {
    @EnvironmentObject var rootFlow: RootFlowModel
    @EnvironmentObject var flow: AuthorizationFlowModel
    @StateObject var viewModel: CodeVerificationViewModel
    
    var body: some View {
        VStack {
            Text("Введите код")
            Text("Мы отправили его на номер")
            Text(viewModel.phone)
            SegmentedField(code: $viewModel.code)
            MainButton(title: !viewModel.isActiveButton ? "Отправить новый код: \(viewModel.time) сек" : "Отправить код", action: {
                viewModel.startTimer()
            }).auth(isActive: viewModel.isActiveButton)
        }.padding().lineSpacing(18)
            .onAppear {
                viewModel.startTimer()
                viewModel.onAuthorizationSuccess = {
                    withAnimation{
                        rootFlow.module = .main(user: "user")
                    }
                }
            }
            .loading(viewModel.isCodeCompleted)
    }
}

#Preview {
    CodeVerificationView(viewModel: CodeVerificationViewModel(phone: "999999999"))
}
