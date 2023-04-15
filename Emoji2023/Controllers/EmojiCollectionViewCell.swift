//
//  EmojiCollectionViewCell.swift
//  Emoji2023
//
//  Created by Jo Michael on 4/14/23.
//

import UIKit

class EmojiCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var emojiImageView: UIImageView!
    @IBOutlet weak var emojiNameLabel: UILabel!
    @IBOutlet weak var emojiDescriptionLabel: UILabel!
    
    func configure(with emoji: Emoji) {
        emojiNameLabel.text = emoji.name
        emojiDescriptionLabel.text = emoji.description
        emojiImageView.image = UIImage(named: emoji.urlImage)
    }
}
