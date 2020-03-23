//
//  SwipingController+extension.swift
//  ProgramatyLaout
//
//  Created by Jaime Uribe on 23/03/20.
//  Copyright © 2020 Jaime Uribe. All rights reserved.
//

import UIKit

extension SwipingController{
    
    //permite organizar las vista cuando se gira el telefono
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: {(_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0{
                self.collectionView.contentInset = .zero
            } else {
                let indexPath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }) { (_) in
            
        }
    }
    
}
