//
// Created by Сергей Махленко on 01.04.2023.
//

import Foundation
import UIKit

final class EmojiCollection: NSObject, UICollectionViewDelegate {
    private let controller: UIViewController

    private static let cellId = "emojiCell"
    private let perRow: CGFloat = 2.0
    private let marginsBetweenCells: CGFloat = 10.0

    private let emoji = [
        "🍇", "🍈", "🍉", "🍊", "🍋",
        "🍌", "🍍", "🥭", "🍎", "🍏",
        "🍐", "🍒", "🍓", "🫐", "🥝",
        "🍅", "🫒", "🥥", "🥑", "🍆",
        "🥔", "🥕", "🌽", "🌶️", "🫑",
        "🥒", "🥬", "🥦", "🧄", "🧅",
        "🍄"]

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    init(controller: UIViewController) {
        self.controller = controller
    }

    func configureAndAddView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EmojiCell.self, forCellWithReuseIdentifier: EmojiCollection.cellId)
        controller.view.addSubview(collectionView)

        constraintsConfigure()
    }

    private func constraintsConfigure() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: controller.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor)
        ])
    }
}

extension EmojiCollection: UICollectionViewDelegateFlowLayout {
    // set margin cells
    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            insetForSectionAt section: Int) -> UIEdgeInsets {
        let xySize = marginsBetweenCells / 2
        return UIEdgeInsets(top: xySize, left: xySize, bottom: xySize, right: xySize)
    }

    // set cell sizes
    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width / perRow - marginsBetweenCells
        return CGSize(width: width, height: 50)
    }
}

extension EmojiCollection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        emoji.count
    }

    func collectionView(
            _ collectionView: UICollectionView,
            cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EmojiCollection.cellId,
                for: indexPath) as? EmojiCell

        cell?.setEmoji(emoji: emoji[indexPath.row])
        cell?.backgroundColor = .lightText
        return cell!
    }
}
