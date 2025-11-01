//
//  AuthorizationView.swift
//  MVVM test
//
//  Created by Fox on 11.09.2025.
//

import SwiftUI





struct AuthorizationView: View {
    
    @EnvironmentObject var rootFlow: RootFlowModel
    
    @StateObject var viewModel: AuthorizationViewModel
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            
            Spacer().frame(height: 30)
            VStack(alignment: .center) {
                Text("Введите номер телефона")
                Text("Мы отправим код на указанный номер телефона в СМС или позвоним. Отвечать на звонок не нужно.").multilineTextAlignment(.center).lineSpacing(0).font(.caption)
                Spacer().frame(height: 30)
                PhoneTextField(title: "(927) 999 - 99 - 99", text: $viewModel.login)
                Spacer()
                VStack(alignment: .leading) {
                    Checkbox(text: "Я принимаю Условия пользовательского соглашения", isChecked: $viewModel.isTermsChecked, linkText: "Условия пользовательского соглашения", link: URL(string: "https://google.ru"))
                    Checkbox(text: "Я даю свое согласие на Обработку персональных данных", isChecked: $viewModel.isPolicyChecked, linkText: "Обработку персональных данных", link: URL(string: "https://google.ru"))
                }
                MainButton(title: "Войти") {
                    viewModel.authorizationTap()
                }.auth(isActive: viewModel.isActiveButton)
                .frame(maxWidth: .infinity)
                .animation(.easeInOut, value: viewModel.isActiveButton)
                Button("Тест") {
                    viewModel.login = "99999123123"
                }
            }
            .padding()
            .lineSpacing(18)
            
            .onAppear {
                
            }
            .navigationDestination(for: AuthorizationRoute.self, destination: {
                route in
                switch route {
                case .code(let phone):
                    CodeVerificationView(viewModel: CodeVerificationViewModel(phone: phone))
                }
            })
        }.environmentObject(viewModel.authFlow)
            
    }
    
    
    
    
}

#Preview {
    AuthorizationView(viewModel: AuthorizationViewModel())
}
