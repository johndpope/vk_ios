import Foundation

class MyGroup {
    var id: Int!
    var name: String!
    var desc: String!
    var icon: String!
    
    init(_ id: Int, _ name: String, _ desc: String, _ icon: String){
        self.id = id;
        self.name = name
        self.desc = desc
        self.icon = icon
    }
    
    convenience init (group: Group) {
        self.init(group.id, group.name, group.desc, group.icon)
    }
    
    public class func list()->[MyGroup] {
        var groups: [MyGroup] = []
        for i in 0...100 {
            var index = Int(arc4random_uniform(UInt32(DataGenerator.groupNames.count-1)))
            let name = DataGenerator.groupNames[index]
            
            index = Int(arc4random_uniform(UInt32(DataGenerator.groupDesc.count-1)))
            let desc = DataGenerator.groupDesc[index]
            
            index = Int(arc4random_uniform(UInt32(DataGenerator.groupPictures.count-1)))
            let icon = DataGenerator.groupPictures[index]
            groups.append(MyGroup(i, name, desc, icon))
        }
        return groups
    }
}


