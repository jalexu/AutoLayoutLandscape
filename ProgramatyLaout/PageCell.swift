//
//  PageCell.swift
//  ProgramatyLaout
//
//  Created by Jaime Uribe on 22/03/20.
//  Copyright © 2020 Jaime Uribe. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page?{
        didSet{
//            print(page?.imageName)
            guard let unwrappedPage = page else {return}
            marioBrossImage.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let marioBrossImage: UIImageView = {
        let image = UIImage(named: "flores")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? \nDon´t wait any larger! \nWe hope to see you in our stores soon", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        let topImageConteinerView = UIView()
        addSubview(topImageConteinerView)
        topImageConteinerView.translatesAutoresizingMaskIntoConstraints = false
        topImageConteinerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        //this is foor landscape
        topImageConteinerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageConteinerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageConteinerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageConteinerView.addSubview(marioBrossImage)
        marioBrossImage.centerXAnchor.constraint(equalTo: topImageConteinerView.centerXAnchor).isActive = true
        marioBrossImage.centerYAnchor.constraint(equalTo: topImageConteinerView.centerYAnchor).isActive = true
        marioBrossImage.heightAnchor.constraint(equalTo: topImageConteinerView.heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageConteinerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
