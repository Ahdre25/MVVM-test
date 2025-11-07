

import SwiftUI

struct TabbarView: View {
    
    @EnvironmentObject var appViewModel: AppViewModel
    @EnvironmentObject var flow: RootFlowModel
    @StateObject var viewModel: TabbarViewModel
    

    var body: some View {
        TabView(selection: $viewModel.selected) {
            MainView(viewModel: MainViewModel()).tag(0) .tabItem { Label("Main", systemImage: "house.fill") }
            PaymentView(viewModel: PaymentViewModel()).tag(1) .tabItem { Label("Pay", systemImage: "house.fill") }
            ProfileView(viewModel: ProfileViewModel()).tag(2) .tabItem { Label("Profile", systemImage: "gearshape") }
        }
            
        .onAppear {
            viewModel.onFirstAppear()
            viewModel.onAppear()
            viewModel.handle(deeplink: appViewModel.deepLink)
        }.onReceive(appViewModel.$deepLink.compactMap { $0 }) { deepLink in
            print("deeplink: \(deepLink)")
            if viewModel.isVisible {
                viewModel.handle(deeplink: deepLink)
                
            }
        }
        .onDisappear {
            viewModel.onDisappear()
        }
    }
}

#Preview {
    TabbarView(viewModel: TabbarViewModel(user: ""))
}
