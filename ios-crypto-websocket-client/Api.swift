//
//  Api.swift
//  ios-crypto-websocket-client
//
//  Created by George Barker on 19.12.21.
//

import Foundation

class Api {
    func setupWebSocket() {
        let webSocketTask = URLSession(configuration: .default)
            .webSocketTask(with: URL(string: "ws://localhost:8081/crypto-websocket-server/cryptocurrencies")!)
        
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
                self.receiveOnWebSocket(with: webSocketTask)
            }
        }
    }
}
