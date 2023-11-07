//
//  ContentView.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        List(selection: $viewModel.selectedIssue) {
            ForEach(viewModel.dataController.issuesForSelectedFilter()) { issue in
                IssueRow(issue: issue)
            }
            .onDelete(perform: viewModel.delete)
        }
        .navigationTitle("Issues")
        .searchable(
            text: $viewModel.filterText,
            tokens: $viewModel.filterTokens,
            suggestedTokens: .constant(viewModel.suggestedFilterTokens),
            prompt: "Filter issues, or type # to add tags"
        ) { tag in
            Text(tag.tagName)
        }

        .toolbar {
            ContentViewToolbar()
        }
    }
    
    init(dataController: DataController) {
        _viewModel = StateObject(wrappedValue: ViewModel(dataController: dataController))
    }
}

#Preview {
    ContentView(dataController: .preview)
}
