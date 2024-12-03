//
//  ViewCell.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/2/24.
//

import UIKit

class ViewCell : UITableViewCell {
    static let identifier = "CardCell"
    let margin : CGFloat = 20 * scaleMultiplier()
    
    public func setupCell(card: CardContent) {
        authorLabel.text = "\(card.name) \(card.surname)"
        headerLabel.text = card.header
        dateLabel.text = card.date
        descriptionLabel.text = card.text
        photoImageView.image = UIImage(named: card.image)
        setupConstraints()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cardView)
    }
    
    lazy var cardView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = Colorizer(.gray)
        $0.layer.cornerRadius = 20
        $0.addSubviews(headerView, authorLabel, headerLabel, dateLabel, descriptionLabel, nextButton, photoImageView)
        return $0
    }(UIView())
    
    lazy var authorLabel = setupLabel(textStyle: .header)
    lazy var photoImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    lazy var headerView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    lazy var headerLabel = setupLabel(textStyle: .megaHeader)
    lazy var dateLabel = setupLabel(textStyle: .subDescription, textAlignment: .right)
    lazy var descriptionLabel = setupLabel(textStyle: .description)
    lazy var nextButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Next", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = Colorizer(.green)
        return $0
    }(UIButton())
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1/2 * margin),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: margin),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -margin),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1/2 * margin),
            
            headerView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: margin),
            headerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: margin),
            headerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -margin),
            
            dateLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 2 * margin),
            dateLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: headerView.centerXAnchor, constant: margin),
            authorLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),

            photoImageView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 1/2 * margin),
            photoImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: margin),
            photoImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -margin),
            photoImageView.heightAnchor.constraint(equalTo: photoImageView.widthAnchor, multiplier: 9/16),

            headerLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: margin),
            headerLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 3/2 * margin),
            headerLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -3/2 * margin),
            
            descriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: margin),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: margin),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -margin),
            
            nextButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: margin),
            nextButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: margin),
            nextButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -margin),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -margin),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
