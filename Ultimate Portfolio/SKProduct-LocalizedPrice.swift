//
//  SKProduct-LocalizedPrice.swift
//  Ultimate Portfolio
//
//  Created by Kuba Milcarz on 11/9/23.
//

import StoreKit

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        
        return formatter.string(from: price)!
    }
}
