import Foundation
import Alamofire
import SwiftyJSON

class AlamofireNetworkManager{

    static let baseURL = "https://api.vk.com/method/"

    public static let sharedManager: SessionManager = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        config.timeoutIntervalForRequest = 40
        config.timeoutIntervalForResource = 40
        let manager = Alamofire.SessionManager(configuration: config)
        return manager
    }()


    public static func request<T: DecodableProtocol>(clazz: T.Type , urlPath: String, params: Parameters, completion: (([T])->Void)? = nil ){

        AlamofireNetworkManager.sharedManager.request(baseURL + urlPath, method: .get, parameters: params).responseJSON{ response in
            switch response.result {
            case .success(let val):
                BKG_THREAD {
                    let arr:[T]? = parseJSON(val)
                    if let arr = arr {
                        completion?(arr)
                    }
                }
            case .failure(let err):
                print(err)
            }
        }
    }


    public static func downloadImage(url: URL?, _ completion: ((_: Data) -> Void)?){
        guard let url = url
            else {
                return
            }
        Alamofire.request(url).response{ (response) in
            guard response.error == nil
                else {
                    //print(response.error?.localizedDescription)
                    fatalError(response.error!.localizedDescription) // only for test
                    return
            }

            if let data = response.data {
                completion?(data)
            }
        }
    }


    public static func downloadImage(url: URL?, id: Int, imageFieldIndex: Int, _ completion: ((_: Data?, _: Int, _: Int) -> Void)?){
        guard let url = url
            else {
                return
        }
        Alamofire.request(url).response{ (response) in
            guard response.error == nil
                else {
                    //print(response.error?.localizedDescription)
                    fatalError(response.error!.localizedDescription) // only for test
                    return
            }
            completion?(response.data, id, imageFieldIndex)
           // if let data = response.data {
            //    completion?(data, id, imageFieldIndex)
           // }
        }
    }

    private static func parseJSON<T: DecodableProtocol>(_ val: Any)->[T]?{
        let json = JSON(val)
        var res: [T] = []
        let arr = json["response"]["items"].arrayValue
        for j in arr {
            let t: T = T()
            t.setup(json: j)
            res.append(t)
        }
        return res
    }
}
