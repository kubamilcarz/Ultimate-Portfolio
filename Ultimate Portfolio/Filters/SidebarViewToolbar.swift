//
//  SidebarViewToolbar.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 11/1/23.
//

import SwiftUI

struct SidebarViewToolbar: View {
    @EnvironmentObject var dataController: DataController
    
    @State private var showingAwards = false

    var body: some View {
        Button(action: dataController.newTag) {
            Label("Add tag", systemImage: "plus")
        }

        Button("Show awards", systemImage: "rosette") {
            showingAwards.toggle()
        }
        .sheet(isPresented: $showingAwards, content: AwardsView.init)

        #if DEBUG
        Button("Add Samples", systemImage: "flame") {
            dataController.deleteAll()
            dataController.createSampleData()
        }
        #endif
    }
}

#Preview {
    SidebarViewToolbar()
}
