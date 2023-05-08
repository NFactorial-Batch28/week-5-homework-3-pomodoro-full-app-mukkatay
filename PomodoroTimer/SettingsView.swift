//
//  SettingsView.swift
//  PomodoroTimer
//
//  Created by Akyl Mukatay  on 06.05.2023.
//

import UIKit

struct Settings {
    var name: String
}

extension Settings {
    static let labels = [Settings(name: "Focus time"),
                       Settings(name: "Break time"),
                       Settings(name: "Lunch time"),
                       Settings(name: "Read time"),
                       Settings(name: "Play time")
    ]
}

class SettingsView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView = {
       let tableView = UITableView()
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        configureListSubview()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.labels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SiteCell", for: indexPath) as? SettingsCell else {
            return UITableViewCell()
        }
        cell.configureView(cell: Settings.labels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74
    }
    
    private func configureListSubview() {
        self.navigationItem.title = "List"
        
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.fillView(self.view)
        tableView.register(SettingsCell.self, forCellReuseIdentifier: "SiteCell")
        tableView.anchor(top: self.view.topAnchor, bottom: self.view.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingBottom: 128)
        tableView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        
    }

}

class SettingsCell: UITableViewCell {
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private let linkIcon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "golink"))
        return icon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureView(cell: Settings) {
        self.nameLabel.text = cell.name
    }
    
    private func setUI() {
        self.backgroundColor =  UIColor(red: 242/255, green: 242/255, blue: 238/255, alpha: 1)
        [nameLabel, linkIcon].forEach{ self.addSubview($0) }
        
        nameLabel.anchor(bottom: self.bottomAnchor, left: self.leftAnchor, paddingBottom: 19, paddingLeft: 16)
        linkIcon.anchor(bottom: self.bottomAnchor, right: self.rightAnchor, paddingBottom: 19, paddingRight: 19)
    }
}

