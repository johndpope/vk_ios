import UIKit
import WebKit

class Wall_Cell_tp2: UICollectionViewCell {
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var likeView: WallLike_View!
    @IBOutlet weak var headerView: WallHeader_View!
    @IBOutlet weak var hConHeaderView: NSLayoutConstraint!
    
    @IBOutlet weak var imageButton1: UIButton!
    @IBOutlet weak var imageButton2: UIButton!
    
    @IBOutlet weak var imageContentView: UIView!
    
    var indexPath: IndexPath!
    var presenter: PullWallPresenterProtocol!
    var isExpanded = false
    var delegate: WallCellProtocolDelegate?
    var preferedHeight: CGFloat = WallCellConstant.cellHeight
    var wall: WallModelProtocol!
    lazy var buttons = [imageButton1!, imageButton2!]
    lazy var imageViews = [imageView1!, imageView2!]
    var baseWallVideo: BaseWallVideo = BaseWallVideo()
    
    
    @IBAction func doPressImage1(_ sender: Any) {
        pressImage(imageIdx: 0)
    }
    
    @IBAction func doPressImage2(_ sender: Any) {
        pressImage(imageIdx: 1)
    }
    
    private func pressImage(imageIdx: Int){
        baseWallVideo.pressImage(presenter: presenter, view: imageContentView, indexPath: indexPath, imageIdx: imageIdx)
        presenter.selectImage(indexPath: indexPath, imageIdx: imageIdx)
    }
    
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        setNeedsLayout()
    
        let preferredLayoutAttributes = layoutAttributes
        
        var fittingSize = UIView.layoutFittingCompressedSize
        fittingSize.width = preferredLayoutAttributes.size.width
        let size = systemLayoutSizeFitting(fittingSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .defaultLow)
        var adjustedFrame = preferredLayoutAttributes.frame
        adjustedFrame.size.height = ceil(size.height)
        preferredLayoutAttributes.frame = adjustedFrame
        preferedHeight = adjustedFrame.size.height
        return preferredLayoutAttributes
    }
    
    override func prepareForReuse() {
        for imageView in imageViews {
            imageView.image = UIImage(named: "placeholder")
        }
        baseWallVideo.prepareReuse(buttons: buttons)
    }
}

extension Wall_Cell_tp2: Wall_CellProtocol {
    
    
    func setup(_ wall: WallModelProtocol,
               _ indexPath: IndexPath,
               _ presenter: PullWallPresenterProtocol,
               isExpanded: Bool,
               delegate: WallCellProtocolDelegate) {
        
        self.indexPath = indexPath
        self.presenter = presenter
        self.isExpanded = isExpanded
        self.wall = wall
        self.delegate = delegate
        headerView.delegate = self
        headerView.prepare()
        
        if wall.getCellType() == .video {
            baseWallVideo.setup(buttons: buttons)
        }
        
        WallCellConfigurator.setupCell(cell: self, wall: wall, isExpanded: isExpanded)
        layoutIfNeeded()
    }
    
    func getPreferedHeight() -> CGFloat {
        return preferedHeight
    }
    
    func getImagesView() -> [UIImageView] {
        return imageViews
    }
    
    func getLikeView() -> WallLike_View {
        return likeView
    }
    
    func getIndexRow() -> Int {
        return indexPath.row
    }
    
    func getHeaderView() -> WallHeader_View {
        return headerView
    }
    
    func getHConHeaderView() -> NSLayoutConstraint {
        return hConHeaderView
    }
}


extension Wall_Cell_tp2: Video_CellProtocol {
    
    func play(url: URL, platformEnum: WallCellConstant.VideoPlatform) {
        baseWallVideo.play(url: url, platformEnum: platformEnum)
    }
    
    func showErr(err: String) {
        baseWallVideo.showErr(err: err)
    }
}

extension Wall_Cell_tp2: WallHeaderProtocolDelegate {
    func didPressExpand() {
        isExpanded = !isExpanded
        WallCellConfigurator.expandCell(cell: self, wall: wall, isExpanded: isExpanded)
        delegate?.didPressExpand(isExpand: isExpanded, indexPath: indexPath)
    }
}
