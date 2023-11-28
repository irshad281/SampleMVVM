//
//  HomeProductCell.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 25/11/23.
//

import UIKit
import Kingfisher

final class HomeProductCell: UICollectionViewCell, ViewRegistrable {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var productImageView: UIImageView!
    
    class func loadFrom(
        collectionView: UICollectionView,
        atIndexPath indexPath: IndexPath,
        withProduct product: Product)
    -> HomeProductCell
    {
        let cell: HomeProductCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.titleLabel.text = product.title
        cell.descLabel.text = product.description
        cell.priceLabel.text = "$" + product.price.description
        cell.productImageView.kf.setImage(with: URL(string: product.image))
        return cell
    }
}
