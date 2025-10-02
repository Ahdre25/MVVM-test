

import SwiftUI

struct TabbarView: View {
    
    @EnvironmentObject var flow: MainRouteFlowModel
    @StateObject var viewModel: TabbarViewModel
    @State var selected: Int = 0

    var body: some View {
        TabView(selection: $selected) {
            PaymentView(viewModel: PaymentViewModel()).tag(0) .tabItem { Label("Main", systemImage: "house.fill") }
            ProfileView(viewModel: ProfileViewModel()).tag(1) .tabItem { Label("Profile", systemImage: "gearshape") }
        }
            
        .onAppear {
            
        }
    }
}

#Preview {
    TabbarView(viewModel: TabbarViewModel(user: ""))
}
