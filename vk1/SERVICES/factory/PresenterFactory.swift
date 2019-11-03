import UIKit


// Class-Factory for creating and storing presenters
class PresenterFactory {
    
    static let shared = PresenterFactory()
    private init(){}

    // store
    private lazy var presenters: [ModuleEnum:SynchronizedPresenterProtocol] = [:]
    
    
    //MARK: called from Synchronizer:
    public func getInstance<T: SynchronizedPresenterProtocol>(clazz: T.Type) -> SynchronizedPresenterProtocol {
        if let presenter: T = getPresenter() {
            return presenter
        }
        
        let presenter: T = T()
        let presenterEnum = ModuleEnum(presenter: presenter)
        presenters[presenterEnum] = presenter
        return presenter
    }
    
    
    //MARK: called from Anywhere:
    public func getInstance<T: SynchronizedPresenterProtocol>() -> T {
        if let presenter: T = getPresenter() {
            return presenter
        }
        
        let presenter: T = T()
        let presenterEnum = ModuleEnum(presenter: presenter)
        presenters[presenterEnum] = presenter
        return presenter
    }
    
    
    
    public func getPresenter<T: SynchronizedPresenterProtocol>() -> T? {
        let presenterEnum = ModuleEnum(presenterType: T.self)
        let res: T? = presenters[presenterEnum] as? T
        return res
    }
    

    //MARK: viewDidLoad called from VC >>
    
    public func getSectioned(viewDidLoad vc: PushViewProtocol) -> PullSectionPresenterProtocol? {
        return getPresenter(viewDidLoad: vc) as? PullSectionPresenterProtocol
    }
    
    public func getPlain(viewDidLoad vc: PushViewProtocol) -> PullPlainPresenterProtocol? {
        return getPresenter(viewDidLoad: vc) as? PullPlainPresenterProtocol
    }
    

    // private methods
    
    private func getPresenter(viewDidLoad vc: PushViewProtocol) -> SynchronizedPresenterProtocol? {
        
        let presenterEnum = ModuleEnum(vc: vc)
        
        var presenter = presenters[presenterEnum]
        
        if presenter == nil {
            presenter = createPresenter(clazz: presenterEnum.presenter, vc)
        } else {
            presenter?.setView(vc: vc)
        }
        SynchronizerManager.shared.viewDidLoad(presenterEnum: presenterEnum)
        return presenter
    }
    
    
    private func createPresenter(clazz: SynchronizedPresenterProtocol.Type, _ vc: PushViewProtocol) -> SynchronizedPresenterProtocol? {
        if let presenter = clazz.init(vc: vc) {
            let presenterEnum = ModuleEnum(presenter: presenter)
            presenters[presenterEnum] = presenter
            return presenter
        }
        return nil
    }
}
