//
//  UICollectionViewExtension.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 25/11/23.
//

import Foundation

import UIKit

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: ViewRegistrable {
        register(T.nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    func registerSupplementaryView<T: UICollectionReusableView>(_: T.Type) where T: ViewRegistrable {
        register(T.nib, forSupplementaryViewOfKind: T.identifier, withReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ViewRegistrable {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        
        return cell
    }
    
    func supplementaryViewOfKind<T: UICollectionReusableView>(atIndexPath indexPath: IndexPath) -> T where T: ViewRegistrable {
        guard let view = dequeueReusableSupplementaryView(ofKind: T.identifier, withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue supplementaryElementOfKind with identifier: \(T.identifier)")
        }
        return view
    }
}
