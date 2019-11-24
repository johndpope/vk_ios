import Foundation

// view get access to presenter
protocol PullPresenterProtocol: class {
    func getData(indexPath: IndexPath?) -> ModelProtocol?
    func getIndexPath(model: ModelProtocol) -> IndexPath?
    
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
