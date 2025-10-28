

import SwiftUI

struct MainView: View {
    @EnvironmentObject var rootFlow: RootFlowModel
    @StateObject var flow: MainFlowModel = MainFlowModel()
    @StateObject var viewModel: MainViewModel

    let columns = [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ]
    
    var body: some View {
        NavigationStack(path: $flow.path) {
            VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        VStack(alignment: .leading, spacing: 0) {
                            Button(viewModel.selectedCity) {
                                viewModel.onCityTap()
                            }.frame(height: 40).padding(.horizontal).foregroundColor(.white)
                            MainTextField(title: "Поиск", text: $viewModel.search).padding([.horizontal, .bottom])
                        }
                    }.background(Color.blue)
                ScrollView {
                    BannerCarouselView().padding([.top])
                    TypePicker()
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(viewModel.products, id: \.id) { product in
                            if viewModel.isInitialLoading {
                                PaymentListCell(item: nil, onLikeTap: {})
                            } else {
                                PaymentListCell(item: product, onLikeTap: {
                                })
                            }
                                        
                        }
                    }.padding(.horizontal)
                }
            }
        }.navigationDestination(for: MainRoute.self, destination: { route in
            switch(route) {
            case .detail:
                AuthorizationView(viewModel: AuthorizationViewModel())
            }
            
            
        }).onAppear {
            viewModel.onAppear()
            viewModel.onGetCitiesSuccess = { cities in
                flow.sheet = .citySearch(cities: cities)
            }
        }
        .sheet(item: $flow.sheet) { sheet in
            switch sheet {
            case .citySearch(cities: let cities):
                RadioListView(items: cities, selectedItem: $viewModel.selectedCity)
                    .presentationDetents([.medium, .large])
            }
        }
    }
}


#Preview {
    MainView(viewModel: MainViewModel())
}
