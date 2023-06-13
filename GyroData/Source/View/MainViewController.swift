//
//  MainViewController.swift
//  GyroData
//
//  Created by kjs on 2022/09/16.
//

import UIKit

final class MainViewController: UIViewController {
    typealias DataSource = UITableViewDiffableDataSource<Section, MoveData>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, MoveData>
    
    private let mainViewModel: MainViewModel = MainViewModel()
    private let moveDataTableView: UITableView = {
        let tableView: UITableView = .init(frame: .zero)
        tableView.register(MoveDataCell.self, forCellReuseIdentifier: MoveDataCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    private lazy var dataSource: UITableViewDiffableDataSource<Section, MoveData> = {
        let dataSource = DataSource(tableView: moveDataTableView) { tableView, indexPath, moveData in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MoveDataCell.identifier) as? MoveDataCell else {
                return UITableViewCell()
            }
            
            cell.configure(moveData: moveData)
            
            return cell
        }
        
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        configureUI()
        configureTableView()
        configureNavigation()
    }
    
    private func configureUI() {
        let safeArea = view.safeAreaLayoutGuide
        view.backgroundColor = .systemBackground
        
        view.addSubview(moveDataTableView)
        NSLayoutConstraint.activate([
            moveDataTableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            moveDataTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            moveDataTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            moveDataTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
    }
    
    private func configureTableView() {
        moveDataTableView.delegate = self
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
        let moveData = MoveData(moveType: .gyro, createDate: Date(), time: 1.0)
        
        mainViewModel.MoveDataList.append(moveData)
        applySnapshot(moveDataList: mainViewModel.MoveDataList)
    }
    
    private func applySnapshot(moveDataList: [MoveData]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(moveDataList)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeDeleteContextualAction(forRowAt: indexPath)
        ])
    }
    
    private func makeDeleteContextualAction(forRowAt indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            print("delete \(indexPath.row)")
        }
    }
}
