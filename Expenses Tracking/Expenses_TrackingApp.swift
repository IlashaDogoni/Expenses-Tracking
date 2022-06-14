//
//  Expenses_TrackingApp.swift
//  Expenses Tracking
//
//  Created by Ilya Kokorin on 13.06.2022.
//

import SwiftUI

@main
struct Expenses_TrackingApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
