import UIKit
import WebKit


class WallCell6: BaseWall {
    
    // header constraints
    @IBOutlet weak var reposterStackViewHeightCon: NSLayoutConstraint!
    @IBOutlet weak var authorStackViewHeightCon: NSLayoutConstraint!
    
    
    // reposter
    @IBOutlet weak var reposterNameLabel: UILabel!
    @IBOutlet weak var reposterDateLabel: UILabel!
    @IBOutlet weak var reposterAvaImageView: UIImageView!
    
    // author
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorDateLabel: UILabel!
    @IBOutlet weak var authorAvaImageView: UIImageView!
    
    // post message
    @IBOutlet weak var authorPostMsgLabel: UILabel!
    
    
    // media
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    
    @IBOutlet weak var imageButton1: UIButton!
    @IBOutlet weak var imageButton2: UIButton!
    @IBOutlet weak var imageButton3: UIButton!
    @IBOutlet weak var imageButton4: UIButton!
    @IBOutlet weak var imageButton5: UIButton!
    @IBOutlet weak var imageButton6: UIButton!
    
    
    @IBOutlet weak var likeView: WallLike_View!
    
    @IBOutlet weak var imageContentView: UIView!
    
    // expand button
    @IBOutlet weak var expandButton: UIButton!
    
    // footer height constraint
    @IBOutlet weak var footerHeightCon: NSLayoutConstraint!
    
    
    
    lazy var buttons = [imageButton1!,imageButton2!,imageButton3!,imageButton4!,imageButton5!,imageButton6!]
    lazy var imageViews = [imageView1!,imageView2!,imageView3!,imageView4!,imageView5!,imageView6!]
    
    override func prepareForReuse() {
        reposterStackViewHeightCon.constant = 35
        authorStackViewHeightCon.constant = 35
        expandButton.isHidden = true
        prepareReuse()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return getPreferredLayoutAttributesFitting(layoutAttributes)
    }
    
    @IBAction func doPressImage1(_ sender: Any) {
        pressImage(imageIdx: 0)
    }
    
    @IBAction func doPressImage2(_ sender: Any) {
        pressImage(imageIdx: 1)
    }
    
    @IBAction func doPressImage3(_ sender: Any) {
        pressImage(imageIdx: 2)
    }
    
    @IBAction func doPressImage4(_ sender: Any) {
        pressImage(imageIdx: 3)
    }
    
    @IBAction func doPressImage5(_ sender: Any) {
        pressImage(imageIdx: 4)
    }
    
    @IBAction func doPressImage6(_ sender: Any) {
        pressImage(imageIdx: 5)
    }
    
    @IBAction func doExpand(_ sender: Any) {
        didPressExpand()
    }
}



// MARK: - implementation ChildWallCellProtocol

extension WallCell6: ChildWallCellProtocol {
    
    func getImageContent() -> UIView {
        imageContentView
    }
    
    func setupOutlets(){
        expandButton.isHidden = true
        // footer
        likeView.likeImageView.delegate = self
        likeView.message.delegate = self
        likeView.share.delegate = self
    }
    
    func getButtons() -> [UIButton]{
        return buttons
    }
    
    func getFooterHeightCon() -> NSLayoutConstraint {
        return footerHeightCon
    }
}


// MARK: - implementation WallCellProtocol

extension WallCell6: WallCellProtocol {
    

    // header constraints
    func getReposterHeightCon() -> NSLayoutConstraint {
        return reposterStackViewHeightCon
    }
    
    func getAuthorHeightCon() -> NSLayoutConstraint {
        return authorStackViewHeightCon
    }
    
    // reposter
    func getReposterName() -> UILabel {
        return reposterNameLabel
    }
    
    func getReposterDate() -> UILabel {
        return reposterDateLabel
    }
    
    func getReposterAva() -> UIImageView {
        return reposterAvaImageView
    }
    
    // author
    func getAuthorName() -> UILabel {
        return authorNameLabel
    }
    
    func getAuthorDate() -> UILabel {
        return authorDateLabel
    }
    
    func getAuthorAva() -> UIImageView  {
        return authorAvaImageView
    }
    
    // post message
    func getAuthorPostMsg() -> UILabel {
        return authorPostMsgLabel
    }
    
    // media
    func getImagesView() -> [UIImageView] {
        return imageViews
    }
    
    // footer
    func getLikeView() -> WallLike_View {
        return likeView
    }
    
    func getExpandButton() -> UIButton {
        return expandButton
    }
    
    func getPreferedHeight() -> CGFloat {
        return preferedHeight
    }
    
    func getIndexRow() -> Int {
        return indexPath.row
    }
    
    func hideFooter() {
        getFooterHeightCon().constant = 0
        setNeedsLayout()
        layoutIfNeeded()
    }
}


