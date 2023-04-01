//
//  ViewController.swift
//  EmojiMixer
//
//  Created by Сергей Махленко on 01.04.2023.
//
//

import UIKit

class ViewController: UIViewController {
    lazy var emojiCollection: EmojiCollection = {
        EmojiCollection(controller: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        emojiCollection.configureAndAddView()
    }
}
