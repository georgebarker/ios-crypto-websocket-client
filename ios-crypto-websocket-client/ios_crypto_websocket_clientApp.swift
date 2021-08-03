//
//  ios_crypto_websocket_clientApp.swift
//  ios-crypto-websocket-client
//
//  Created by George Barker on 01.08.21.
//

import SwiftUI

@main
struct ios_crypto_websocket_clientApp: App {
    init() {
        setupWebSocket()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

private extension ios_crypto_websocket_clientApp {
    func setupWebSocket() {
        let urlSession = URLSession(configuration: .default)
        let url = URL(string: "ws://localhost:8081/crypto-websocket-server/cryptocurrencies")
        let webSocketTask = urlSession.webSocketTask(with: url!)
        

        webSocketTask.resume()
        receiveOnWebSocket(with: webSocketTask)
    }
    
    func receiveOnWebSocket(with webSocketTask: URLSessionWebSocketTask) {
        webSocketTask.receive { result in
            switch result {
            case .failure(let error):
                print("Failed to receive message: \(error)")
            case .success(let message):
                switch message {
                case .string(let text):
                    print("Received text message: \(text)")
                case .data(let data):
                    print("Received binary message: \(data)")
                @unknown default:
                    fatalError()
                }
                receiveOnWebSocket(with: webSocketTask)
            }
        }
    }
}
