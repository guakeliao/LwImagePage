//
//  LwPageView.swift
//  LwImagePage
//
//  Created by 廖维 on 2020/3/18.
//

import UIKit

open class LwPageView: UIView,UIScrollViewDelegate {
    
    public var imageDatas = [UIImage]()
    var scroller = UIScrollView()
    let imageView0 = UIImageView()
    let imageView1 = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        comment()
    }
    override open func awakeFromNib() {
        super.awakeFromNib()
        comment()
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override open func layoutSubviews() {
        super.layoutSubviews()
        scroller.contentSize = CGSize(width: self.frame.size.width * CGFloat(imageDatas.count), height: self.frame.size.height)
        imageView0.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        imageView1.frame = CGRect.init(x: self.frame.size.width, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    func comment() {
//        scroller.isPagingEnabled = true
        scroller.translatesAutoresizingMaskIntoConstraints = false
        scroller.backgroundColor = .yellow
        scroller.delegate = self
        self.addSubview(scroller)
        NSLayoutConstraint.activate([
            scroller.leftAnchor.constraint(equalTo: self.leftAnchor),
            scroller.rightAnchor.constraint(equalTo: self.rightAnchor),
            scroller.topAnchor.constraint(equalTo: self.topAnchor),
            scroller.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scroller.heightAnchor.constraint(equalTo: self.heightAnchor),
            scroller.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        scroller.addSubview(imageView0)
        scroller.addSubview(imageView1)
        imageView0.backgroundColor = .blue
        imageView1.backgroundColor = .groupTableViewBackground
    }
    func prepareForReuse(scrollView:UIScrollView) -> UIImageView {
        _ = scrollView.contentOffset.x / scrollView.frame.width
        
        return UIImageView()
    }
    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    }
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var currentImageView:UIImageView
        var reuseImageView:UIImageView
        //找出需要重用的UIImageView
        if imageView0.frame.origin.x - imageView0.frame.size.width/2 <= scrollView.contentOffset.x &&
            imageView0.frame.origin.x + imageView0.frame.size.width/2 > scrollView.contentOffset.x
        {
            reuseImageView = imageView1
            currentImageView = imageView0
        }else
        {
            reuseImageView = imageView0
            currentImageView = imageView1
        }
        if currentImageView.frame.origin.x > scrollView.contentOffset.x
        {
            //scroller向左划
            reuseImageView.frame = CGRect.init(x: currentImageView.frame.origin.x - reuseImageView.frame.size.width, y: reuseImageView.frame.origin.y, width: reuseImageView.frame.size.width, height: reuseImageView.frame.size.height)
        }else
        {
            ////scroller向右划
            reuseImageView.frame = CGRect.init(x: currentImageView.frame.origin.x + reuseImageView.frame.size.width, y: reuseImageView.frame.origin.y, width: reuseImageView.frame.size.width, height: reuseImageView.frame.size.height)
        }
    }
}
