//
//  TestCell.swift
//  HitTest
//
//  Created by Moo Maa on 11/10/2021.
//

import UIKit

class TestCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var width: CGFloat = 0.5
    private var widthConstraint: NSLayoutConstraint?
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            let newWidth = frame.width * width // get 80% width here
//            let space = (frame.width - newWidth) / 2
            frame.size.width = newWidth
//            frame.origin.x += space

            super.frame = frame

        }
    }
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    func setupCellView() {
        contentView.addSubview(containerView)
        
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        containerView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -5).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        
        widthConstraint = containerView.widthAnchor.constraint(equalToConstant: contentView.frame.size.width)
        widthConstraint?.isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            UIView.animate(withDuration: 3, animations: { [weak self] in
                self?.widthConstraint?.constant = 50
                self?.layoutIfNeeded()
            })
        })
    }

}
