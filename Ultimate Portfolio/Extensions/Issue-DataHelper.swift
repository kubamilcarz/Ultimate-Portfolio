//
//  Issue-DataHelper.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 10/25/23.
//

import Foundation

extension Issue {
    var issueTitle: String {
        get { title ?? "" }
        set { title = newValue }
    }

    var issueContent: String {
        get { content ?? "" }
        set { content = newValue }
    }

    /// for creationDate and modificationDate, getters & setters not needed
    var issueCreationDate: Date {
        creationDate ?? .now
    }

    var issueModificationDate: Date {
        modificationDate ?? .now
    }

    var issueStatus: String {
        if completed {
            NSLocalizedString("Closed", comment: "This has been resolved by the user")
        } else {
            NSLocalizedString("Open", comment: "This issue is currently unresolved.")
        }
    }
    
    var issueReminderTime: Date {
        get { reminderTime ?? .now }
        set { reminderTime = newValue }
    }

    var issueTags: [Tag] {
        let result = tags?.allObjects as? [Tag] ?? []

        return result.sorted()
    }

    var issueTagsList: String {
        let noTags = NSLocalizedString("No tags", comment: "The user has not created any tags yet.")
        guard let tags else { return noTags }

        // NSSet, so can't do .isEmpty
        if tags.count == 0 {
            return noTags
        } else {
            return issueTags.map(\.tagName).formatted()
        }
    }

    static var example: Issue {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let issue = Issue(context: viewContext)
        issue.title = "Example Issue"
        issue.content = "This is an example issue."
        issue.priority = 2
        issue.creationDate = .now

        return issue
    }
}

extension Issue: Comparable {
    public static func <(lhs: Issue, rhs: Issue) -> Bool {
        let left = lhs.issueTitle.localizedLowercase
        let right = rhs.issueTitle.localizedLowercase

        if left == right {
            return lhs.issueCreationDate < rhs.issueCreationDate
        } else {
            return left < right
        }
    }
}
