//
//  EmojisCollectionViewController.swift
//  Emoji2023
//
//  Created by Jo Michael on 4/14/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class EmojisCollectionViewController: UICollectionViewController {

    // MARK: SearchController configuration
    private let searchController = UISearchController()
    
    var filteredEmojis = emojiDataSource
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        section.interGroupSpacing = 8
        
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let emojiDetailController = segue.destination as? EmojiDetailViewController
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)
            let selectedRow = emojiDataSource[(indexPath?.row)!]
            emojiDetailController?.emoji = selectedRow
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredEmojis.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? EmojiCollectionViewCell else { return UICollectionViewCell() }
        let emoji = filteredEmojis[indexPath.item]
        cell.configure(with: emoji)
        return cell
    }
}

// MARK: UISearchController extension and configuration
extension EmojisCollectionViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchEmoji = searchController.searchBar.text, searchEmoji.isEmpty == false {
            filteredEmojis = emojiDataSource.filter { (emoji) -> Bool in
                emoji.name.localizedCaseInsensitiveContains(searchEmoji)
            }
        } else {
            filteredEmojis = emojiDataSource
        }
        
        collectionView.reloadData()
    }
}
