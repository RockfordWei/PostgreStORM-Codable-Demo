import XCTest
@testable import CMsg

class CMsgTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let chat = ChatMessage()
        chat.id = "abcd1234"
        chat.text = "helloworld"
        chat.hangout_id = "myfirstdate"
        chat.send_by = "rocky"
        let enc = JSONEncoder()
        if let data = try? enc.encode(chat),
          let json = String(data: data, encoding: .utf8) {
          print(json)
          let dec = JSONDecoder()
          if let dat = json.data(using: .utf8),
            let chat2 = try? dec.decode(ChatMessage.self, from: dat) {
            XCTAssertEqual(chat.id, chat2.id)
            XCTAssertEqual(chat.text, chat2.text)
            XCTAssertEqual(chat.hangout_id, chat2.hangout_id)
            XCTAssertEqual(chat.send_by, chat2.send_by)
          }

        } else {
          XCTFail("failed")
        }
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}
