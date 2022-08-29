//
//  ViewController.swift
//  ExURLSessionWebSocketTask
//
//  Created by 김종권 on 2022/08/29.
//

import UIKit
import Foundation

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    WebSocket.shared.url = URL(string: "ws://localhost:1337/")
    try? WebSocket.shared.openWebSocket()
    WebSocket.shared.delegate = self
    WebSocket.shared.onReceiveClosure = { (string, data) in
      print(string, data)
    }
    
    WebSocket.shared.send(message: "hello world")
  }
}

extension ViewController: URLSessionWebSocketDelegate {
  func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
    print("open")
  }
  func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
    print("close")
  }
}
