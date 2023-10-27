//
//  NoIssueView.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 10/26/23.
//

import SwiftUI

struct NoIssueView: View {
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        Text("No Issue Selected")
            .font(.title)
            .foregroundStyle(.secondary)
        
        Button("New Issue") {
            // TODO: Make a new Issue
        }
    }
}

#Preview {
    NoIssueView()
}
