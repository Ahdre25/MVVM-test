//
//  MVVM_testApp.swift
//  MVVM test
//
//  Created by Fox on 10.09.2025.
//

import SwiftUI

@main
struct MVVM_testApp: App {
    @StateObject private var appViewModel = AppViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView().preferredColorScheme(.light).onOpenURL(perform: {
                url in
                appViewModel.handleDeepLink(url: url)
            }).environmentObject(appViewModel)
        }
    }
}



final class AppViewModel: ObservableObject {
    @Published var deepLink: DeepLink = .none
    @Published var isInitialLoaded: Bool = false
    @Published var isAuthorized: Bool = false
    var onCheckAuthorizationComplete: ((Bool) -> Void)?
    
    func handleDeepLink(url: URL) {
        let link = DeepLink(url: url)
        self.deepLink = link
    }
    
    func checkAuthorization() {
//        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//            DispatchQueue.main.async() {
                self.isInitialLoaded = true
                self.isAuthorized = StorageManager.shared.token != ""
                self.onCheckAuthorizationComplete?(self.isAuthorized)
                
//            }
            
//        }
    }
    
    
    
}
