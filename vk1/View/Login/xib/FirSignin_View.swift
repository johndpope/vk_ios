import UIKit


class FirSignin_View: UIView {
    
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var pswTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var signInCompletion: ((String, String)->Void)?
    var signUpCompletion: (()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    @IBAction func doPressSignIn(_ sender: Any) {
        guard let login = loginTextField.text,
            let psw = pswTextField.text
            else { return }
        signInCompletion?(login, psw)
    }
    
    @IBAction func doPressRegister(_ sender: Any) {
        signUpCompletion?()
    }
    
    func setup(login: String, psw: String, signInCompletion: ((String, String)->Void)?, signUpCompletion: (()->Void)?) {
        let scrollSize = CGSize(width: 400,
                                height: self.frame.size.height)
        scrollView.contentSize = scrollSize
        loginTextField.text = login
        pswTextField.text = psw
        self.signInCompletion = signInCompletion
        self.signUpCompletion = signUpCompletion
    }
}
