//  GyroData - MoveDataCell.swift
//  created by vetto on 2023/06/13

import UIKit

final class MoveDataCell: UITableViewCell {
    private let typeLabel: UILabel = {
        let label: UILabel = .init()
        
        return label
    }()
    
    private let createDateLabel: UILabel = {
        let label: UILabel = .init()
        
        return label
    }()
    
    private let playTimeLabel: UILabel = {
        let label: UILabel = .init()
        
        return label
    }()
    
    private let informationStackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let mainStackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(moveData: MoveData) {
        typeLabel.text = moveData.moveType.description
        createDateLabel.text = moveData.createDate.description
        playTimeLabel.text = "\(moveData.time)"
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        
        informationStackView.addArrangedSubview(createDateLabel)
        informationStackView.addArrangedSubview(typeLabel)
        mainStackView.addArrangedSubview(informationStackView)
        mainStackView.addArrangedSubview(playTimeLabel)
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
