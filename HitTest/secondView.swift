//
//  secondView.swift
//  HitTest
//
//  Created by Moo Maa on 11/10/2021.
//

import UIKit

class TestView: UIView  {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
//        print ("⭕️", point, super.hitTest(point, with: event))
//        return super.hitTest(point, with: event)
        if clipsToBounds || isHidden || alpha == 0 {
            return nil
        }

        for subview in subviews.reversed() {
            let subPoint = subview.convert(point, from: self)
            if let result = subview.hitTest(subPoint, with: event) {
                print("⭕️", result)
                print ("⭕️", point, super.hitTest(point, with: event))
                return result
            }
        }

        return nil
    }
    
}
