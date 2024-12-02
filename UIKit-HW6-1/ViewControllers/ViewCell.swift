//
//  ViewCell.swift
//  UIKit-HW6-1
//
//  Created by Дима on 12/2/24.
//

import UIKit

class ViewCell : UITableViewCell {
    static let identifier = "CardCell"
    let margin : CGFloat = 20
    
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
        $0.addSubviews(authorLabel, headerLabel, dateLabel, descriptionLabel, nextButton, photoImageView)
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
            
            dateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: margin),
            dateLabel.widthAnchor.constraint(equalToConstant: 85), // ОЧЕНЬ ПЛОХО
            dateLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -margin),

            authorLabel.topAnchor.constraint(equalTo:  cardView.topAnchor, constant: margin),
            authorLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: margin),
            authorLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -margin),
            
            photoImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 1/2 * margin), // ПРОБЛЕМА, ЕСЛИ LABEL ВЫШЕ, ЧЕМ HEADER
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
