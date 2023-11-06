//
//  IssueRow.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 10/26/23.
//

import SwiftUI

struct IssueRow: View {
    @EnvironmentObject var dataController: DataController
    @ObservedObject var issue: Issue

    var body: some View {
        NavigationLink(value: issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(issue.priority == 2 ? 1 : 0)
                    .accessibilityIdentifier(issue.priority == 2 ? "\(issue.issueTitle) High Priority" : "")

                VStack(alignment: .leading) {
                    Text(issue.issueTitle)
                        .font(.headline)
                        .lineLimit(1)

                    Text(issue.issueTagsList)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text(issue.issueFormattedCreationDate)
                        .font(.subheadline)
                        .accessibilityLabel(issue.issueCreationDate.formatted(date: .abbreviated, time: .omitted))

                    if issue.completed {
                        Text("Closed")
                            .textCase(.uppercase)
                            .font(.body.smallCaps())
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
        .accessibilityHint(issue.priority == 2 ? "High prorioty" : "")
        .accessibilityIdentifier(issue.issueTitle)
    }
}

#Preview {
    IssueRow(issue: .example)
}
