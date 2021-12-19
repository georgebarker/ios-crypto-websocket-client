//
//  ContentView.swift
//  ios-crypto-websocket-client
//
//  Created by George Barker on 01.08.21.
//

import SwiftUI

struct ContentView: View {
    var cryptocurrencies: [Cryptocurrency] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cryptocurrencies) { cryptocurrency in
                    CryptocurrencyCell(cryptocurrency: cryptocurrency)
                }
                HStack {
                    Spacer()
                    Text("\(cryptocurrencies.count) Cryptocurrencies")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }.navigationTitle("Cryptocurrencies")
        }.onAppear(perform: Api().setupWebSocket)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cryptocurrencies: testData)
    }
}

struct CryptocurrencyCell: View {
    var cryptocurrency: Cryptocurrency
    var body: some View {
        NavigationLink(destination: Text(cryptocurrency.name)) {
            Image(cryptocurrency.thumbnailName)
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
            
            
            let priceText = "$\(cryptocurrency.last)"
            VStack(alignment: .leading) {
                Text(cryptocurrency.name)
                Text(priceText)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            let bidText = "Bid: $\(cryptocurrency.bid)"
            let askText = "Ask: $\(cryptocurrency.ask)"
            VStack(alignment: .trailing) {
                
                Text(bidText)
                    .font(.subheadline)
                    .foregroundColor(Color.blue)
                
                
                Text(askText)
                    .font(.subheadline)
                    .foregroundColor(Color.red)
            }
        }
        .padding(.vertical, 4.0)
        .padding(.horizontal, 2.0)
    }
}
