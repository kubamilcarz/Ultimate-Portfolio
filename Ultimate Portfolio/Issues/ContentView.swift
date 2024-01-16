//
//  ContentView.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.requestReview) var requestReview
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
        .onAppear(perform: askForReview)
    }
    
    
    init(dataController: DataController) {
        _viewModel = StateObject(wrappedValue: ViewModel(dataController: dataController))
    }
    
    
    func askForReview() {
        if viewModel.shouldRequesetReview {
            requestReview()
        }
    }
}

#Preview {
    ContentView(dataController: .preview)
}
