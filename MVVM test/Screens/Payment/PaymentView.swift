

import SwiftUI

struct PaymentView: View {
    
    @EnvironmentObject var flow: RootFlowModel
    @StateObject var viewModel: PaymentViewModel

    var body: some View {
            VStack {
                List{
                    if viewModel.isInitialLoading {
                        ForEach(1...3, id: \.self) { item in
                            PaymentListCell(item: nil, onLikeTap: {})
                            
                        }.listStyle(.plain)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear).transition(.opacity)
                    } else {
                        ForEach(viewModel.shopItems, id: \.id) { item in
                            PaymentListCell(item: item, onLikeTap: {})
                        }.listStyle(.plain)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }
                
                
            }

        .onAppear {
            viewModel.onAuthorizationSuccess = {
                flow.openDetail(id: 0)
            }
            viewModel.loadItems()
        }
    }
}

#Preview {
    PaymentView(viewModel: PaymentViewModel())
}
