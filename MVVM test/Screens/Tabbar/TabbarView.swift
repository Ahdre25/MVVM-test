

import SwiftUI

struct TabbarView: View {
    
    @EnvironmentObject var flow: RootFlowModel
    @StateObject var viewModel: TabbarViewModel
    @State var selected: Int = 0

    var body: some View {
        TabView(selection: $selected) {
            MainView(viewModel: MainViewModel()).tag(0) .tabItem { Label("Main", systemImage: "house.fill") }
            PaymentView(viewModel: PaymentViewModel()).tag(1) .tabItem { Label("Pay", systemImage: "house.fill") }
            ProfileView(viewModel: ProfileViewModel()).tag(2) .tabItem { Label("Profile", systemImage: "gearshape") }
        }
            
        .onAppear {
            
        }
    }
}

#Preview {
    TabbarView(viewModel: TabbarViewModel(user: ""))
}
