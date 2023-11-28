//
//  HomeViewController.swift
//  COESampleApp
//
//  Created by Irshad Ahmad on 25/11/23.
//

import NetworkInterface
import UIKit
import LayoutKit

final class HomeViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private let viewModel = HomeViewModel(service: HomeService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        observePublishers()
    }
    
    private func observePublishers() {
        viewModel.categories.sink { error in
            print(error)
        } receiveValue: { [weak self] _ in
            self?.collectionView.reloadData()
        }.store(in: &cancellables)

        viewModel.products.sink { error in
            print(error)
        } receiveValue: { [weak self] _ in
            self?.collectionView.reloadData()
        }.store(in: &cancellables)
    }
}

// MARK: - UICollectionView

extension HomeViewController {
    private func setupCollectionView() {
        collectionView.register(HomeCategoryCell.self)
        collectionView.register(HomeProductCell.self)
        collectionView.collectionViewLayout = collectionLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func collectionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ -> NSCollectionLayoutSection in
            switch self.viewModel.sections[section] {
            case .category:
                return LayoutKit.productListSection(
                    direction: .horizontal,
                    itemHeight: .absolute(40),
                    itemSpacing: 16,
                    contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16),
                    headerView: nil
                )
                
            case .products:
                return LayoutKit.verticleProductListing(
                    itemWidth: .absolute(self.collectionView.frame.size.width / 2 - 32),
                    itemHeight: .estimated(250),
                    itemSpacing: 8,
                    contentInsets: .init(top: 16, leading: 16, bottom: 16, trailing: 16),
                    headerView: nil
                )
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = viewModel.sections[indexPath.section]
        
        switch section {
        case .category:
            
            return HomeCategoryCell.loadFrom(
                collectionView: collectionView,
                atIndexPath: indexPath,
                withTitle: viewModel.categories.value[indexPath.item].capitalized,
                isSelected: viewModel.selectedCategory == indexPath.item
            )
            
        case .products:
            
            return HomeProductCell.loadFrom(
                collectionView: collectionView,
                atIndexPath: indexPath,
                withProduct: viewModel.products.value[indexPath.item]
            )
        }
    }
}

// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch viewModel.sections[indexPath.section] {
        case .category:
            viewModel.selectedCategory = indexPath.item
            collectionView.reloadData()
            viewModel.getProductsByCategory()
            
        default:
            break
        }
    }
}
