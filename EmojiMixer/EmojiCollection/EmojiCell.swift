//
// Created by Сергей Махленко on 01.04.2023.
//

import Foundation
import UIKit

final class EmojiCell: UICollectionViewCell {
    private let emojiLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(emojiLabel)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public func setEmoji(emoji: String) {
        emojiLabel.text = emoji
    }

    private func configure() {
        layer.masksToBounds = true
        layer.cornerRadius = 5

        emojiLabel.frame.size = contentView.bounds.size
        emojiLabel.textAlignment = .center

        emojiLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}
