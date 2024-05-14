//
//  RightOneView.swift
//  FutureCash
//
//  Created by apple on 2024/5/14.
//

import UIKit
import SnapKit

class RightOneView: UIView {

    var block1: (() -> Void)?
    
    var block2: (() -> Void)?
    
    var buttonHeightConstraints: [Constraint] = []
    
    let titleArray = ["Unpaid loan balance","Loan delinquency","Loan under review","Failed loan disbursement","Loan fully repaid"]
    
    lazy var bgImageView3: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "hongqi")
        return bgImageView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(RightViewCell.self, forCellReuseIdentifier: "RightViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bgImageView3)
        addSubview(tableView)
        bgImageView3.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalTo(self).offset(8.5.px())
            make.size.equalTo(CGSizeMake(180.px(), 217.5.px()))
        }
        tableView.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.top.equalTo(bgImageView3.snp.bottom).offset(13.5.px())
            make.bottom.equalTo(self).offset(-10.px())
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RightOneView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RightViewCell", for: indexPath) as? RightViewCell {
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            cell.nameLable.text = titleArray[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.px()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath>>>>>>>>\(indexPath.row)")
    }
    
}
