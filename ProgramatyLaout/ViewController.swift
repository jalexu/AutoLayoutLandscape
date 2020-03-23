//
//  ViewController.swift
//  ProgramatyLaout
//
//  Created by Jaime Uribe on 21/03/20.
//  Copyright © 2020 Jaime Uribe. All rights reserved.
//

import UIKit

extension UIColor{
    static var mainPink = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {

    //let´s avoid pulliting viewDidLoad
    private let marioBross: UIImageView = {
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
//        textView.text = "Join us today in our fun and games!"
//        textView.font = UIFont.boldSystemFont(ofSize: 18.0)
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    //make sure you apply the correct encapsulation principles in your classes
    private let previosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
//        let pinkColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //view.addSubview(marioBross)
        view.addSubview(descriptionTextView)
        setupLayout()
        setupBottomControls()
    }
    
    fileprivate func setupBottomControls(){
        //view.addSubview(previosButton)
        //previosButton.backgroundColor = .red
//        let yelloView = UIView()
//        yelloView.backgroundColor = .yellow
//
//        let greenView = UIView()
//        greenView.backgroundColor = .green
        
//        let blueView = UIView()
//        blueView.backgroundColor = .blue
        
        let buttomControlStackView = UIStackView(arrangedSubviews: [previosButton, pageControl, nextButton])
        buttomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomControlStackView.distribution = .fillEqually
        view.addSubview(buttomControlStackView)
//        previosButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        NSLayoutConstraint.activate([
            //previosButton.topAnchor.constraint(equalTo: view.topAnchor),
            buttomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttomControlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupLayout(){
        //view.backgroundColor = .red
        //imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        let topImageConteinerView = UIView()
        //topImageConteinerView.backgroundColor = .blue
        view.addSubview(topImageConteinerView)
        //topImageConteinerView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //enable auto layout
        topImageConteinerView.translatesAutoresizingMaskIntoConstraints = false
        topImageConteinerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //this is foor landscape
        topImageConteinerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageConteinerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        topImageConteinerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topImageConteinerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topImageConteinerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageConteinerView.addSubview(marioBross)
        marioBross.centerXAnchor.constraint(equalTo: topImageConteinerView.centerXAnchor).isActive = true
        marioBross.centerYAnchor.constraint(equalTo: topImageConteinerView.centerYAnchor).isActive = true
        marioBross.heightAnchor.constraint(equalTo: topImageConteinerView.heightAnchor, multiplier: 0.5).isActive = true
//        marioBross.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        //imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        marioBross.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        marioBross.widthAnchor.constraint(equalToConstant: 150).isActive  = true
//        marioBross.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageConteinerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }


}

