//
//  PhotoCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Spencer Curtis on 8/2/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private var titleLabel = UILabel()
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubviews() {
        //MARK: imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        // now let's add some contraints
        
        //Y
        let imageViewYConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .top,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .top,
                                                      multiplier: 1.0,
                                                      constant: 8)
        //X
        
        let imageViewXConstraint = NSLayoutConstraint(item: imageView,
                                                      attribute: .leading,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .leading,
                                                      multiplier: 1.0,
                                                      constant: 4)
        
        
        //Width
        
        let imageViewWidthConstraint = NSLayoutConstraint(item: imageView,
                                                          attribute: .trailing,
                                                          relatedBy: .equal,
                                                          toItem: self,
                                                          attribute: .trailing,
                                                          multiplier: 1.0,
                                                          constant: -4)
        
        //Height
        let imageViewHeightConstraint = NSLayoutConstraint(item: imageView,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: imageView,
                                                           attribute: .height,
                                                           multiplier: 1,
                                                           constant: 0)
        
        
        NSLayoutConstraint.activate([imageViewYConstraint, imageViewXConstraint, imageViewWidthConstraint, imageViewHeightConstraint])
        
        //MARK: titleLabel
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        
        
        // Y
        let titleLabelYConstraint = NSLayoutConstraint(item: titleLabel,
                                                       attribute: .top,
                                                       relatedBy: .equal,
                                                       toItem: imageView.bottomAnchor,
                                                       attribute: .top,
                                                       multiplier: 1.0,
                                                       constant: 4)
        
        // X
        
        let titleLabelXConstraint = NSLayoutConstraint(item: titleLabel,
                                                       attribute: .leading,
                                                       relatedBy: .equal,
                                                       toItem: self.leadingAnchor,
                                                       attribute: .leading,
                                                       multiplier: 1.0,
                                                       constant: 4)
        
        // Width
        
        let titleLabelWidthConstraint = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: self.trailingAnchor, attribute: .trailing, multiplier: 1.0, constant: -4)
        
        NSLayoutConstraint.activate([titleLabelYConstraint, titleLabelXConstraint, titleLabelWidthConstraint])
        
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        let photoUImage = UIImage(data: photo.imageData)
        
        imageView.image = photoUImage
        titleLabel.text = photo.title
    }
}
