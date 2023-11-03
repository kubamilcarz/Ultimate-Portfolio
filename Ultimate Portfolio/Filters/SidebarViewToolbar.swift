//
//  SidebarViewToolbar.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 11/1/23.
//

import SwiftUI

struct SidebarViewToolbar: View {
    @EnvironmentObject var dataController: DataController
    @Binding var showingAwards: Bool

    var body: some View {
        Button(action: dataController.newTag) {
            Label("Add tag", systemImage: "plus")
        }

        Button("Showing awards", systemImage: "rosette") {
            showingAwards.toggle()
        }

        #if DEBUG
        Button("Add Samples", systemImage: "flame") {
            dataController.deleteAll()
            dataController.createSampleData()
        }
        #endif
    }
}

#Preview {
    SidebarViewToolbar(showingAwards: .constant(true))
}
