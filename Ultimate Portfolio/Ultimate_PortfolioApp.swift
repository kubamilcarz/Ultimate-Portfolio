//
//  Ultimate_PortfolioApp.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 10/25/23.
//

import CoreSpotlight
import SwiftUI

@main
struct Ultimate_PortfolioApp: App {
    @StateObject var dataController: DataController
    @Environment(\.scenePhase) var scenePhase
    
    init() {
        let dataController = DataController()
        
        self._dataController = StateObject(wrappedValue: dataController)
    }

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView(dataController: dataController)
            } content: {
                ContentView(dataController: dataController)
            } detail: {
                DetailView()
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
            .onChange(of: scenePhase) { phase in
                if phase != .active {
                    dataController.save()
                }
            }
            .onContinueUserActivity(CSSearchableItemActionType, perform: loadSpotlightItem)
        }
    }
    
    func loadSpotlightItem(_ userActivity: NSUserActivity) {
        if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            dataController.selectedIssue = dataController.issue(with: uniqueIdentifier)
            dataController.selectedFilter = .all
        }
    }
}
