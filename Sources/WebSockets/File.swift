import Foundation
import WebSocket

let socket = WebSocket()

socket.onConnected = { ws in
  ws.send("hello")
}

socket.onData = { data, ws in
  print("Received", data)
  assert(data.text! == "hello")
  ws.disconnect()
}

socket.connect(url: URL(string: "wss://echo.websocket.org")!)
