//
//  Couston.swift
//  DZ_11
//
//  Created by Nikita Shipovskiy on 03/05/2024.
//

import UIKit

final class CustomTabBar: UITabBar {
    
    override func draw(_ rect: CGRect) {
        configShape()

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTabBar()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTabBar() {
        tintColor = .black
        unselectedItemTintColor = .black
        
        
    }

    
}

//MARK: - Draw Shape

extension CustomTabBar {
    
    private func configShape() {
        
        let path = getTabBarPath()
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 3

    
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.white.cgColor
        layer.insertSublayer(shape, at: 0)
       
        
    }
    
    private func getTabBarPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 100, y: 0))
        
        
        path.addLine(to: CGPoint(x: frame.width, y: 0))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        path.addLine(to: CGPoint(x: 0, y: frame.height))
        
        return path
    }
}
