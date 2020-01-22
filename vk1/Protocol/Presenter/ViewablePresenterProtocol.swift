import Foundation


// view get access to presenter

//MARK: - Common
protocol ViewablePresenterProtocol: class {
    func getData(indexPath: IndexPath?) -> ModelProtocol?
    func getIndexPath(model: ModelProtocol) -> IndexPath?
    func didEndScroll()
}


//MARK: - Plain
protocol ViewablePlainPresenterProtocol: ViewablePresenterProtocol {
    func numberOfRowsInSection() -> Int
}


//MARK: - Sectioned
protocol ViewableSectionPresenterProtocol: ViewablePresenterProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSection (section: Int) -> Int
    func getSectionTitle(section: Int)->String
    
    // alphabet searching
    func getGroupBy() -> [String]
}


//MARK: - Transition
protocol ViewableTransitionPresenterProtocol {
    func didPressTransition(to module: ModuleEnum, selectedIndexPath: IndexPath)
    func didPressBack()
}


//MARK: - Specific Protocols
protocol ViewableWallPresenterProtocol: ViewablePlainPresenterProtocol {
    func getModule() -> ModuleEnum
    func isExpandedCell(indexPath: IndexPath) -> Bool
    func didPressExpandCell(isExpand: Bool, indexPath: IndexPath?)
    func didSelectImage(indexPath: IndexPath, imageIdx: Int)
    func didPressLike(indexPath: IndexPath)
    func didPressComment(indexPath: IndexPath)
    func didPressShare(indexPath: IndexPath)
}


//FriendList
protocol ViewableFriendListPresenterProtocol: ViewableSectionPresenterProtocol {
    func viewDidFilterInput(_ filterText: String)
}


//Login
protocol ViewableLoginPresenterProtocol {
    func viewDidLoad()
}


//MyGroupDetail
protocol ViewableMyGroupDetailPresenterProtocol: ViewablePlainPresenterProtocol {
    func getMyGroupWallPresenter() -> ViewableWallPresenterProtocol
}
