//
//  BaseViewModel.swift
//  MVVM test
//
//  Created by Fox on 10.09.2025.
//
import Foundation
import SwiftUI
import Combine

@MainActor
class BaseViewModel: ObservableObject {
    
    @Published var isVisible: Bool = false
    
    var flowProvider: BaseFlowModel? {
        didSet {
            bindFlow()
        }
    }
    
    
    private(set) var hasAppeared = false
    
    func onAppear() {
        isVisible = true
    }
    
    func onDisappear() {
        isVisible = false
    }
    
    func onFirstAppear() {
    }
    
    func handleAppear() {
        guard !hasAppeared else { return }
        hasAppeared = true
        onFirstAppear()
    }
    
    
    @Published var path = NavigationPath()
    @Published var sheet: SheetRoute?
    @Published var cover: CoverRoute?
    
    init(flowProvider: BaseFlowModel? = nil) {
        self.flowProvider = flowProvider
        bindFlow()
    }
    
    private func bindFlow() {
        cancellables.removeAll()
        guard let flow = flowProvider else { return }
        flow.$path
            .receive(on: DispatchQueue.main)
            .assign(to: &$path)
        
        flow.$sheet
            .receive(on: DispatchQueue.main)
            .assign(to: &$sheet)
        
        flow.$cover
            .receive(on: DispatchQueue.main)
            .assign(to: &$cover)
    }
    
    
    var cancellables: Set<AnyCancellable> = []
    
}

