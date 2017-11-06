import StORM
import PostgresStORM


// OLd Code
public class ChatMessage: PostgresStORM, Codable {

  public var id                = ""
  public var hangout_id        = ""
  public var send_by           = ""
  public var text              = ""
  public var type              = ""
  public var status            = ""
  public var timestamp         = 0

  public override func table() -> String { return "chat_messages" }

  //    public static func chatSetup(_ str: String = "") {
  //        do {
  //            let obj = HangoutChannel()
  //            try obj.setup(str)
  //
  //            // add new column into table Example
  //            //let _ = try? obj.sql("ALTER TABLE chat_messages DROP COLUMN image;", params: [])
  //            let _ = try? obj.sql("ALTER TABLE chat_messages ADD COLUMN status VARCHAR;", params: [])
  //
  //        } catch {
  //            print("cant add column into Table \(self)")
  //        }
  //    }


  public override func to(_ this: StORMRow) {

    id                 = this.data["id"]               as? String ?? ""
    hangout_id         = this.data["hangout_id"]       as? String ?? ""
    send_by            = this.data["send_by"]          as? String ?? ""
    type               = this.data["type"]             as? String ?? ""
    text               = this.data["text"]             as? String ?? ""
    status             = this.data["status"]           as? String ?? ""
    timestamp          = this.data["timestamp"]        as? Int    ?? 0

  }

/*  let _r = URandom()

  public func makeID() {
    id = _r.secureToken
  }
*/
  func rows() -> [ChatMessage] {
    var rows = [ChatMessage]()

    for i in 0..<self.results.rows.count {
      let row = ChatMessage()
      row.to(self.results.rows[i])
      rows.append(row)
    }

    return rows
  }

  func asDictionary() -> [String: Any] {
    return [
      "id":                self.id,
      "hangout_id":        self.hangout_id,
      "send_by":           self.send_by,
      "type":              self.type,
      "text":              self.text,
      "status":            self.status,
      "timestamp":         self.timestamp,
    ]
  }

}

//New Code
