import Foundation
import SwiftyJSON

class MyGroup: SectionModelProtocol, DecodableProtocol {
    
    var id: Double!
    var name: String = ""
    var desc: String = ""
    var avaURL50: URL?
    var avaURL200: URL?
    var groupBy: MyGroupByEnum = .name
    var coverURL400: URL?
    var membersCount: Int = 0
    var isClosed: Int = 0
    var isDeactivated: Int = 0
    
    
    required init(){}
    
    func setup(json: JSON?){
        if let json = json {
            id = json["id"].doubleValue
            name = json["name"].stringValue
            desc = json["description"].stringValue
            avaURL50 = URL(string: json["photo_50"].stringValue)
            avaURL200 = URL(string: json["photo_200"].stringValue)
            membersCount = json["members_count"].intValue
            coverURL400 = GroupParser.parseCoverURL400(json: json)
            isClosed = json["is_closed"].intValue
            isDeactivated = json["deactivated"].intValue
        }
    }
    
    func getId() -> typeId {
        return id
    }
    
    func getSortBy() -> String {
        if let id_ = id {
            return "\(id_)"
        }
        catchError(msg: "MyGroup: getSortBy(): return is nil")
        return ""
    }
    
    func getGroupBy() -> String {
         switch groupBy {
           case .name:
               return name
         }
    }
}


