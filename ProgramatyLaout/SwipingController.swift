//
//  SwipingController.swift
//  ProgramatyLaout
//
//  Created by Jaime Uribe on 22/03/20.
//  Copyright © 2020 Jaime Uribe. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    let pages = [
        Page(imageName: "alas", headerText: "Join us today in our fun and games!", bodyText: "\n\n\nAre you ready for loads and loads of fun? \nDon´t wait any larger! \nWe hope to see you in our stores soon"),
        Page(imageName: "flores", headerText: "Suscribe and get coupons on our daily events", bodyText: "Get notified of teh saving inmmediatlu when we announce them on our website. Make sure to also give us any feedback you have"),
        Page(imageName: "luz", headerText: "VIP members special services", bodyText: " " )
    ]
    
    //make sure you apply the correct encapsulation principles in your classes
    private let previosButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpOutside)
        return button
    }()
    
    @objc private func handlePrev(){
        let nextItem = max(pageControl.currentPage - 1, 0)
        let indexPath  = IndexPath(item: nextItem, section: 0)
        pageControl.currentPage = nextItem
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        //        let pinkColor = UIColor(displayP3Red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpOutside)
        return button
    }()
    
    @objc private func handleNext(){
        let nextItem = min(pageControl.currentPage + 1, pages.count - 1)
        let indexPath  = IndexPath(item: nextItem, section: 0)
        pageControl.currentPage = nextItem
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    fileprivate func setupBottomControls(){
        
        let buttomControlStackView = UIStackView(arrangedSubviews: [previosButton, pageControl, nextButton])
        buttomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        buttomControlStackView.distribution = .fillEqually
        view.addSubview(buttomControlStackView)
        
        NSLayoutConstraint.activate([
            buttomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            buttomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttomControlStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //permite que el punto del page control se mueva cuando hacemos scroll
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        print(x, view.frame.width, x / view.frame.width)
    }
//    let imagesNames = ["alas", "flores", "luz"]
//    let headerStrings = ["Join us today in our fun and games!", "Suscribe and get coupons on our daily events", "VIP members special services"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .green
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
    }
}
