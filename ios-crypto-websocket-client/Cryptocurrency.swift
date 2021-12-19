//
//  Cryptocurrency.swift
//  ios-crypto-websocket-client
//
//  Created by George Barker on 01.08.21.
//

import Foundation

struct Cryptocurrency: Identifiable {
    var id = UUID()
    var name: String
    var bid: Decimal
    var ask: Decimal
    var last: Decimal
    var fiatTickSize: Int
    
    var thumbnailName: String { return name.lowercased() + "Thumb" }
}

let testData = [
    Cryptocurrency(name: "Bitcoin", bid: 34_560.50, ask: 34_570.00, last: 34_565.22, fiatTickSize: 2),
    Cryptocurrency(name: "Litecoin", bid: 250.40, ask: 255.35, last: 252.00, fiatTickSize: 2),
    Cryptocurrency(name: "Ethereum", bid: 2000, ask: 2200, last: 2300, fiatTickSize: 2),
    Cryptocurrency(name: "Ripple", bid: 0.5, ask: 0.675, last: 0.666, fiatTickSize: 3),
    Cryptocurrency(name: "Dogecoin", bid: 0.25, ask: 0.21, last: 0.21, fiatTickSize: 2)
]
