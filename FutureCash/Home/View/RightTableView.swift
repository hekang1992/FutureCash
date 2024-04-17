//
//  RightTableView.swift
//  FutureCash
//
//  Created by apple on 2024/4/17.
//

import UIKit

class RightTableView: UIView {
    
    let titleArray = ["Unpaid loan balance","Loan delinquency","Loan under review","Failed loan disbursement","Loan fully repaid",]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RightTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = RightViewCell(style: .subtitle, reuseIdentifier: "afad")
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.nameLable.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.px()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath>>>>>>>>\(indexPath.row)")
    }
    
}
