//
//  SwipingController+UICollectionView.swift
//  ProgramatyLaout
//
//  Created by Jaime Uribe on 23/03/20.
//  Copyright © 2020 Jaime Uribe. All rights reserved.
//

import UIKit

extension SwipingController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        return imagesNames.count
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        //        cell.marioBrossImage.image = UIImage(named: page.imageName)
        //        cell.descriptionTextView.text = page.headerText
        //        let imageName = imagesNames[indexPath.item]
        //        cell.marioBrossImage.image = UIImage(named: imageName)
        //        cell.descriptionTextView.text = headerStrings[indexPath.item]
        
        //definitely don´t try this, it is a very bad idea
        //        let imageView = UIImageView()
        //        cell.addSubview(imageView)
        //        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
