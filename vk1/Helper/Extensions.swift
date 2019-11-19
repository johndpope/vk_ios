import UIKit



//MARK: - UIPanGestureRecognizer

internal enum Direction {
    case up
    case down
    case left
    case right
}


internal extension UIPanGestureRecognizer {
    var direction: Direction? {
        let velocity = self.velocity(in: view)
        let isVertical = abs(velocity.y) > abs(velocity.x)

        switch (isVertical, velocity.x, velocity.y) {
            case (true, _, let y) where y < 0: return .up
            case (true, _, let y) where y > 0: return .down
            case (false, let x, _) where x > 0: return .right
            case (false, let x, _) where x < 0: return .left
            default: return nil
        }
    }
}


//MARK: - screen

var wScreen: CGFloat {
    return UIScreen.main.bounds.size.width
}

var hScreen: CGFloat {
    return UIScreen.main.bounds.size.height
}

var wHalfScreen: CGFloat {
    return UIScreen.main.bounds.size.width/2.0
}

var hHalfScreen: CGFloat {
    return UIScreen.main.bounds.size.height/2.0
}



//MARK:- THREAD

//PRESENTERS:

func PRESENTER_UI_THREAD(_ block: @escaping (() -> Void)) {
    DispatchQueue.main.async(execute: block)
}


private let concurrentQueue = DispatchQueue(label: "", attributes: .concurrent)

func THREAD_SAFETY(_ block: @escaping (() -> Void)) {
    concurrentQueue.async(flags: .barrier, execute: block)
}
    



//NETWORK LAYER:

func NET_THREAD(_ block: @escaping (() -> Void)) {
    DispatchQueue.global(qos: .background).async(execute: block)
}

func NET_DELAY_THREAD(_ block: @escaping (() -> Void)) {
    DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(Network.delayBetweenRequests), qos: .background){
        block()
    }
}

func NET_LDELAY_THREAD(_ block: @escaping (() -> Void)) {
    DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(Network.longDelayBetweenRequests), qos: .background){
        block()
    }
}



//MARK: - logger

func catchError(msg: String){
    #if DEBUG
        print("----------------------")
        print("ERROR: " + msg)
        print("----------------------")
        //fatalError()
    #else
        sendCrashlytics(msg)
    #endif
}

func console(msg: String) {
    #if DEBUG
        print(msg)
        print()
    #else
        logInf(msg)
    #endif
}

func logInf(msg: String) {
    //TODO
}

func sendCrashlytics(_ msg: String) {
    //TODO
}





//MARK: - MISC

func isRowPresentInTableView(indexPath: IndexPath, tableView: UITableView) -> Bool{
    if indexPath.section < tableView.numberOfSections{
        if indexPath.row < tableView.numberOfRows(inSection: indexPath.section){
            return true
        }
    }
    return false
}


func convertUnixTime(unixTime: Double) -> String {
    let date = Date(timeIntervalSince1970: unixTime)
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.medium
    dateFormatter.dateStyle = DateFormatter.Style.medium
    dateFormatter.timeZone = .current
    return dateFormatter.string(from: date)
}


func getRawClassName(object: AnyClass) -> String {
    
    let name = NSStringFromClass(object)
    let components = name.components(separatedBy: ".")
    return components.last ?? "Unknown"
}


func renderImage(imageView: UIImageView, color: UIColor) {
   if let image = imageView.image {
       let tintableImage = image.withRenderingMode(.alwaysTemplate)
       imageView.image = tintableImage
       imageView.tintColor = color
   }
}



//MARK:- Extensions

extension UITextView {
    func actualSize() -> CGSize {
        let fixedWidth = frame.size.width
        let newSize = sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        frame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        return frame.size
    }
}

extension Int {
    func toString() -> String
    {
        let myString = String(self)
        return myString
    }
}


//MARK: - DEBUG ONLY

func printFonts() {
    for family in UIFont.familyNames.sorted() {
        let names = UIFont.fontNames(forFamilyName: family)
        print("Family: \(family) Font names: \(names)")
    }
}
