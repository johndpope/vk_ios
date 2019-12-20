import Foundation

class NewsPresenter: PlainPresenterProtocols {
    
    var netFinishViewReload: Bool = false
    
    var modelClass: AnyClass  {
        return News.self
    }
}


extension NewsPresenter: PaginationPresenterProtocol {
}



extension NewsPresenter: PullWallPresenterProtocol {
    
    func selectImage(indexPath: IndexPath, imageIdx: Int) {
        
        guard let news = getData(indexPath: indexPath) as? News
            else {
                Logger.catchError(msg: "NewsPresenter(): PullWallPresenterProtocol(): selectImage: getData exception ")
                return
            }
        
        guard let view = view as? PushWallViewProtocol
                 else {
                     Logger.catchError(msg: "NewsPresenter(): PullWallPresenterProtocol(): selectImage: protocol conform exception")
                     return
                 }
        
        if news.cellType == .video {
            let onSuccess: ((URL, WallCellConstant.VideoPlatform)->Void)? = { (url, platformEnum) in
                view.playVideo(url, platformEnum, indexPath)
            }
            let onError: ((String)->Void)? = {error in
                view.showError(indexPath, err: error)
            }
            SyncMgt.shared.doVideoGet(postId: news.videos[imageIdx].id, ownerId: news.videos[imageIdx].ownerId, onSuccess, onError )
           // SyncMgt.shared.doVideoSearch(q: news.title, completion: completion)
        } else {
            view.runPerformSegue(segueId: "NewsPostSegue", news, selectedImageIdx: imageIdx)
        }
    }
}
