//
//  EmojiDetailViewController.swift
//  Emoji2023
//
//  Created by Jo Michael on 4/14/23.
//

import UIKit

class EmojiDetailViewController: UIViewController {

    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var emojiImageView: UIImageView!
    @IBOutlet weak var emojiNameLabel: UILabel!
    @IBOutlet weak var emojiDescriptionLabel: UILabel!
    
    private var emojiTitle: String!
    private var emojiBackdrop: String!
    private var emojiImage: String!
    private var emojiDecription: String!
    
    var emoji: Emoji? {
        didSet {
            if let emojiName = emoji?.name, let setEmojiImage = emoji?.urlImage, let setEmojiDesc = emoji?.description, let setBackdrop = emoji?.backdrop {
                emojiTitle = emojiName
                emojiBackdrop = setBackdrop
                emojiImage = setEmojiImage
                emojiDecription = setEmojiDesc
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        backdropImageView.image = UIImage(named: emojiBackdrop)
        emojiImageView.image = UIImage(named: emojiImage)
        emojiNameLabel.text = emojiTitle
        emojiDescriptionLabel.text = emojiDecription
    }
    
}
