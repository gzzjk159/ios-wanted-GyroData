//
//  MainViewController.swift
//  GyroData
//
//  Created by kjs on 2022/09/16.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        configureUI()
        configureNavigation()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureNavigation() {
        let rightButton: UIBarButtonItem = {
            let button = UIBarButtonItem(title: "측정",
                                         style: .plain,
                                         target: self,
                                         action: #selector(tappedMeasureButton))
            
            return button
        }()
        navigationItem.title = "목록"
        navigationItem.setRightBarButton(rightButton, animated: true)
    }
    
    @objc
    private func tappedMeasureButton() {
        print("tapped")
    }
}

