import UIKit

// view get access to presenter
protocol PullPresenterProtocol: class {
    func getData(indexPath: IndexPath?) -> ModelProtocol?
    func getIndexPath(model: ModelProtocol) -> IndexPath?
    
    func viewDidLoad()
    func viewDidDisappear()
    func viewDidFilterInput(_ filterText: String)
    func viewDidSeguePrepare(segueId: ModuleEnum.SegueIdEnum, indexPath: IndexPath)
    func didEndScroll()
    
    //complex:
    func getSubSectionPresenter() -> PullSectionPresenterProtocol?
    func getSubPlainPresenter() -> PullPlainPresenterProtocol?
}


protocol PullSectionPresenterProtocol: PullPresenterProtocol {
        
    func numberOfSections() -> Int
    func numberOfRowsInSection (section: Int) -> Int
    func getSectionTitle(section: Int)->String
    
    // alphabet searching
    func getGroupBy() -> [String]
}



protocol PullPlainPresenterProtocol: PullPresenterProtocol {
    func numberOfRowsInSection() -> Int
}


//MARK: - Specific Protocols

protocol PullWallPresenterProtocol: class{
    func selectImage(indexPath: IndexPath, imageIdx: Int)
    func expandCell(isExpand: Bool, indexPath: IndexPath?)
    func isExpandedCell(indexPath: IndexPath) -> Bool
    func disableExpanding(indexPath: IndexPath)
    func sendPostText(postText: CGRect)
    func getHeightForCell(indexPath: IndexPath) -> CGFloat
}
