//
//  HomeCategoryCell.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 25/11/23.
//

import UIKit

final class HomeCategoryCell: UICollectionViewCell, ViewRegistrable {
    @IBOutlet private weak var titleLabel: UILabel!
    
    class func loadFrom(
        collectionView: UICollectionView,
        atIndexPath indexPath: IndexPath,
        withTitle title: String,
        isSelected: Bool)
    -> HomeCategoryCell
    {
        let cell: HomeCategoryCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.titleLabel.text = title
        cell.backgroundColor = isSelected ? .darkGray : .clear
        cell.titleLabel.textColor = isSelected ? .white : .black
        
        return cell
    }
}
