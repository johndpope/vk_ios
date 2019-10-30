import UIKit

class Friend_Controller: UIViewController {

    var presenter: SectionedPresenterProtocol!
    
    @IBOutlet weak var lettersSearchControl: LettersSearchControl!
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBOutlet weak var loupeImageView: UIImageView!
    @IBOutlet weak var loupeLeadingXConstraint: NSLayoutConstraint!
    @IBOutlet weak var loupeCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchTextCenterDxConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchContainerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchContainerBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var searchTextFieldHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonSearchCancel: UIButton!
    var searchTextWidth: CGFloat = 0
    
    var lastContentOffset: CGFloat = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        setupPresenter()
        setupAlphabetSearchControl()
        setupSearchTextField()
        UIControlThemeMgt.setupNavigationBarColor(navigationController: navigationController)
    }
    
    private func setupPresenter(){
        presenter = PresenterFactory.shared.getSectioned(vc: self)
    }
    
    private func setupAlphabetSearchControl(){
        lettersSearchControl.delegate = self
        lettersSearchControl.updateControl(with: presenter.getGroupingProperties())
    }
    
    private func setupSearchTextField(){
        searchTextField.layer.cornerRadius = 0
        searchTextField.layer.borderWidth = 1.0
        searchTextField.delegate = self
        searchTextWidth = searchTextWidthConstraint.constant
    }
    
    @IBAction func searchTextEditingChanged(_ sender: Any) {
        if searchTextField.text?.isEmpty ?? true {
            searchTextReset()
            return
        }
        presenter.filterData(searchTextField.text!)
        refreshDataSource()
        tableView.reloadData()
    }
    
    
    @IBAction func pressButtonSearchCancel(_ sender: Any) {
        searchTextReset()
    }
    
}

extension Friend_Controller: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(section: section)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! Friend_TableCell
        
        guard let data = presenter.getData(indexPath: indexPath)
           else {
               return UITableViewCell()
           }
       
        let friend = data as! Friend
        cell.setup(friend: friend)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "FriendDetailSegue", sender: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let hview = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
       
        
        let label = UILabel(frame: CGRect(x: 10, y: 7, width: view.frame.size.width, height: 20))
        label.text = presenter.sectionName(section: section)
        hview.addSubview(label)
        UIControlThemeMgt.setupTableHeader(view: hview, title: label)
        return hview
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.sectionName(section: section)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let presenter = presenter as? FriendPresenter
               else {
                   //TODO: throw err
                   return
               }
        if segue.identifier == "FriendDetailSegue" {
            if let dest = segue.destination as? FriendWall_Controller,
                let index = sender as? IndexPath {
                guard let friend = presenter.getData(indexPath: index) as? Friend
                    else { return }
                dest.presenter.setFriend(friend: friend)
            }
        }
    }
    
    func searchTextReset(){
        searchTextField.text = ""
        buttonSearchCancel.isEnabled = false
        buttonSearchCancel.setTitleColor(.clear, for: .normal)
        searchTextField.resignFirstResponder()
        UIView.animate(withDuration: 1.0, animations: {
            self.loupeLeadingXConstraint.isActive = false
            self.loupeCenterXConstraint.isActive = true
            self.searchTextWidthConstraint.constant = self.searchTextWidth
            self.searchTextCenterDxConstraint.isActive = false
            self.searchTextCenterXConstraint.isActive = true
            
            self.view.layoutIfNeeded()
        })
        presenter.filterData("")
        refreshDataSource()
        tableView.reloadData()
    }
    
}


extension Friend_Controller: AlphabetSearchViewControlProtocol {
    func didEndTouch() {
        // TODO
    }
    
    func didChange(indexPath: IndexPath) {
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    func getView() -> UIView {
        return self.view
    }
}


extension Friend_Controller: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchTextField?.text?.count != 0 {
            
        }
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard textField.text?.isEmpty ?? true else {return}
        buttonSearchCancel.isEnabled = true
        buttonSearchCancel.setTitleColor(.white, for: .normal)
        UIView.animate(withDuration: 1.0, animations: {
            self.loupeCenterXConstraint.isActive = false
            self.loupeLeadingXConstraint.isActive = true
            self.searchTextWidthConstraint.constant = self.searchTextWidth - 80
            self.searchTextCenterXConstraint.isActive = false
            self.searchTextCenterDxConstraint.isActive = true
            self.view.layoutIfNeeded()
        })
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? true{
            searchTextReset()
        }
        return true
    }
}


extension Friend_Controller: UIScrollViewDelegate {
    

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
       lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if lastContentOffset - 100 > scrollView.contentOffset.y {
                UIView.animate(withDuration: 0.4, animations: {
                    self.searchContainerTopConstraint.isActive = false
                    self.searchContainerBottomConstraint.isActive = true
                    self.searchTextFieldHeightConstraint.isActive = false
                    self.searchContainerHeightConstraint.isActive = false
                    self.searchView.alpha = 0
                    self.view.layoutIfNeeded()
                })
            
               } else if lastContentOffset + 100 < scrollView.contentOffset.y {
                   UIView.animate(withDuration: 0.4, animations: {
                        self.searchContainerTopConstraint.isActive = true
                        self.searchContainerBottomConstraint.isActive = false
                        self.searchContainerHeightConstraint.isActive = true
                        self.searchTextFieldHeightConstraint.isActive = true
                        self.searchView.alpha = 1
                        self.view.layoutIfNeeded()
                   })
               }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}


extension Friend_Controller: ViewProtocol{
     
    func className() -> String {
         return String(describing: Friend_Controller.self)
     }
    
    public func refreshDataSource(){
        self.presenter.refreshDataSource(){ [weak self] (names) in
            self?.lettersSearchControl.updateControl(with: names)
            self?.tableView.reloadData()
        }
    }
    
    func optimReloadCell(indexPath: IndexPath) {
        
        if isRowPresentInTableView(indexPath: indexPath, tableView: tableView) {
            tableView.beginUpdates()
            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.endUpdates();
        }
    }
}



