//
//  ContentView.swift
//  Expenses Tracking
//
//  Created by Ilya Kokorin on 13.06.2022.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var demoData: [Double] = [8, 2, 4, 6, 12, 9, 2]
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    CardView {
                        VStack {
                            ChartLabel("100$", type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                    .frame(height: 200)
                    RecentTransactionList_()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack )
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
