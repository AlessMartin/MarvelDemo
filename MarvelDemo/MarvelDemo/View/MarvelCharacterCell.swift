//
//  MarvelCharacterCell.swift
//  MarvelDemo
//
//  Created by Alessandro Martin on 21/04/2020.
//  Copyright © 2020 Alessandro Martin. All rights reserved.
//

import Nuke
import UIKit

final class MarvelCharacterCell: UITableViewCell {
    enum UI {
        static let estimatedCellHeight = UI.imageHeight + (2 * UI.margin)
        
        fileprivate static let imageHeight: CGFloat = 120.0
        fileprivate static let imageSize = CGSize(width: UI.imageHeight, height: UI.imageHeight)
        fileprivate static let margin: CGFloat = 8.0
        fileprivate static let insets = NSDirectionalEdgeInsets(
            top: UI.margin,
            leading: UI.margin,
            bottom: UI.margin,
            trailing: UI.margin
        )
        fileprivate static let horizontalSpacing: CGFloat = 16.0
    }
    
    static let reuseIdentifier = String(describing: MarvelCharacterCell.self)
    
    private let characterImageView = UIImageView()
    private let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUp()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setUp() {
        let stackView = UIStackView()
        stackView.spacing = UI.horizontalSpacing
        stackView.alignment = .center
        contentView.addSubview(stackView)
        NSLayoutConstraint.pin(stackView, to: contentView, insets: UI.insets)
        
        stackView.addArrangedSubview(characterImageView)
        NSLayoutConstraint.setSize(of: characterImageView, to: UI.imageSize)
        
        nameLabel.numberOfLines = 0
        nameLabel.font = .preferredFont(forTextStyle: .body)
        stackView.addArrangedSubview(nameLabel)
    }
    
    func configure(marvelCharacter: MarvelCharacter) {
        nameLabel.text = marvelCharacter.name
        
        if let imageURL = marvelCharacter.thumbnail?.url {
            Nuke.loadImage(with: imageURL, into: characterImageView)
        } else {
            characterImageView.image = UIImage(systemName: "photo")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        }
    }
    
    func reset() {
        Nuke.cancelRequest(for: characterImageView)
        nameLabel.text = nil
        characterImageView.image = nil
    }
}
