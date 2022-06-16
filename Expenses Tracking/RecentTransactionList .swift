//
//  RecentTransactionList .swift
//  Expenses Tracking
//
//  Created by Ilya Kokorin on 16.06.2022.
//

import SwiftUI

struct RecentTransactionList_: View {
    
    @EnvironmentObject var TransactionListVM: TransactionListViewModel
    var body: some View {
        VStack{
            HStack{
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                NavigationLink{
                    
                }
            label:{
                HStack(spacing: 4){
                    Text("See all")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(Color.text)
            }
                
            }
            .padding(.top)
            ForEach(Array(TransactionListVM.transactions.prefix(5).enumerated()), id: \.element) {index, transaction in
                TransactionRow(transaction: transaction)
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.3), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList__Previews: PreviewProvider {
    static let transactionListVM : TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    static var previews: some View {
        Group {
            RecentTransactionList_()
            RecentTransactionList_()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
