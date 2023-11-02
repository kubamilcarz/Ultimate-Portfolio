//
//  UserFilterRow.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 11/1/23.
//

import SwiftUI

struct UserFilterRow: View {
    var filter: Filter

    var rename: (Filter) -> Void
    var delete: (Filter) -> Void

    var body: some View {
        NavigationLink(value: filter) {
            Label(filter.name, systemImage: filter.icon)
                .badge(filter.activeIssuesCount)
                .contextMenu {
                    Button {
                        rename(filter)
                    } label: {
                        Label("Rename", systemImage: "pencil")
                    }

                    Button("Delete", systemImage: "trash", role: .destructive) {
                        delete(filter)
                    }
                }
                .accessibilityElement()
                .accessibilityLabel(filter.name)
                .accessibilityHint("\(filter.activeIssuesCount) issues")
        }
    }
}

#Preview {
    UserFilterRow(filter: .recent, rename: { _ in }, delete: { _ in })
}
