//
//  IssueViewToolbar.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 11/1/23.
//

import SwiftUI

struct IssueViewToolbar: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var issue: Issue

    var body: some View {
        Menu {
            Button("Copy Issue Title", systemImage: "doc.on.doc") {
                // MARK: Copy/Paste Clipboard
                UIPasteboard.general.string = issue.title
            }

            Button(issue.completed ? "Re-open Issue" : "Close Issue",
                   systemImage: "bubble.left.and.exclamationmark.bubble.right") {
                issue.completed.toggle()
                dataController.save()
            }
        } label: {
            Label("Actions", systemImage: "ellipsis.circle")
        }
    }
}

#Preview {
    IssueViewToolbar(issue: Issue.example)
}
