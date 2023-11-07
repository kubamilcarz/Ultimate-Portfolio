//
//  IssueRow.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 10/26/23.
//

import SwiftUI

struct IssueRow: View {
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationLink(value: viewModel.issue) {
            HStack {
                Image(systemName: "exclamationmark.circle")
                    .imageScale(.large)
                    .opacity(viewModel.iconOpacity)
                    .accessibilityIdentifier(viewModel.iconIdentifier)

                VStack(alignment: .leading) {
                    Text(viewModel.issueTitle)
                        .font(.headline)
                        .lineLimit(1)

                    Text(viewModel.issueTagsList)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text(viewModel.creationDate)
                        .font(.subheadline)
                        .accessibilityLabel(viewModel.accessibilityCreationDate)

                    if viewModel.completed {
                        Text("Closed")
                            .textCase(.uppercase)
                            .font(.body.smallCaps())
                    }
                }
                .foregroundStyle(.secondary)
            }
        }
        .accessibilityHint(viewModel.accessibilityHint)
        .accessibilityIdentifier(viewModel.issueTitle)
    }
    
    init(issue: Issue) {
        _viewModel = StateObject(wrappedValue: ViewModel(issue: issue))
    }
}

#Preview {
    IssueRow(issue: .example)
}
