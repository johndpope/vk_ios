import Foundation

// view get access to presenter
protocol PullPresenterProtocol: class {
    func getData(indexPath: IndexPath?) -> ModelProtocol?
    func getIndexPath(model: ModelProtocol) -> IndexPath?
}