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
    @StateObject var dataController = DataController()
    @Environment(\.scenePhase) var scenePhase

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
        print("\n\n\nNOW IM IM HERE\n\n")
        
        if let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            print("\n\n\nIM HERE\n\n")
            
            dataController.selectedIssue = dataController.issue(with: uniqueIdentifier)
            dataController.selectedFilter = .all
        }
    }
}
