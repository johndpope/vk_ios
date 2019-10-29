import Foundation

protocol PlainPresenterProtocol: PresenterProtocol {
    var numberOfSections: Int {get}
    var numberOfRowsInSection: Int {get}
    func getData(_ indexPath: IndexPath) -> PlainModelProtocol?
}