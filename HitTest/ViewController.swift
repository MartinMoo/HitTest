//
//  ViewController.swift
//  HitTest
//
//  Created by Moo Maa on 11/10/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .red
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        tableView.register(TestCell.self, forCellReuseIdentifier: "cellID")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }

    
    private func setupUI() {
//        let redView: UIView = {
//            let view = UIView()
//            view.backgroundColor = .red
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
//        let greenView: UIView = {
//            let view = TestView()
//            view.backgroundColor = .green
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
//        let orangeView: UIView = {
//            let view = UIView()
//            view.backgroundColor = .orange
//            view.translatesAutoresizingMaskIntoConstraints = false
//            return view
//        }()
//
//        view.addSubview(redView)
//        redView.addSubview(greenView)
//        greenView.addSubview(orangeView)
//
//        redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
//        redView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50).isActive = true
//        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
//        redView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
//
//
//        greenView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: 75).isActive = true
//        greenView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: -50).isActive = true
//        greenView.topAnchor.constraint(equalTo: redView.topAnchor, constant: 50).isActive = true
//        greenView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 250).isActive = true
//
//        orangeView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 5).isActive = true
//        orangeView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: 75).isActive = true
//        orangeView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 0).isActive = true
//        orangeView.bottomAnchor.constraint(equalTo: redView.bottomAnchor, constant: 100).isActive = true

        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
//        tableView.allowsSelection = false
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("⭕️ selected")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! TestCell
        if indexPath.row == 0 {
            cell.width = 0.9
        } else {
            cell.width = 0.3
        }

        cell.backgroundColor = .green
        return cell
    }
    
    
}

