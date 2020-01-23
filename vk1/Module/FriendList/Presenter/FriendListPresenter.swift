import Foundation

class FriendListPresenter: SectionedBasePresenter, ModulablePresenterProtocol, SyncablePresenterParametersProtocol {
    
    var module: ModuleEnum = .friendList
    
    var modelClass: ModelProtocol.Type {
        return Friend.self
    }
    var isViewReloadWhenNetFinish = true
    
    override func didSetContext() {
        synchronizer?.tryRunSync()
    }
}

extension FriendListPresenter: ViewableFriendListPresenterProtocol {
    func viewDidFilterInput(_ filterText: String) {
        self.filteredText = !filterText.isEmpty ? filterText : nil
        filterAndRegroupData()
        getView()?.viewReloadData(groupByIds: self.groupByIds)
    }
}


extension FriendListPresenter: GroupablePresenterProtocol, SortablePresenterProtocol{
    
    func sort() {
        let ds = dataSource as! [Friend]
        dataSource = ds.sorted {
            $0.firstName > $1.firstName
        }
    }

    func groupBy(model: ModelProtocol) -> String {
        (model as! Friend).firstName
    }
}

extension FriendListPresenter: ViewableTransitionPresenterProtocol {
    
    func didPressTransition(to module: ModuleEnum, selectedIndexPath: IndexPath) {
        
        guard let friend = getData(indexPath: selectedIndexPath) as? Friend
        else {
            Logger.catchError(msg: "FriendListPresenter(): didPressTransition(): selectImage: getData exception ")
            return
        }
        coordinator?.didPressTransition(to: module, model: friend)
    }
    
    func didPressBack() {
        coordinator?.didPressBack()
    }
}