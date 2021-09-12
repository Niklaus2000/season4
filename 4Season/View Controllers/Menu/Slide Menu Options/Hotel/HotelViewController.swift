//
//  HotelViewController.swift
//  4Season
//
//  Created by Nika on 13.06.21.
//

import UIKit

class HotelViewController:  UITabBarController {
    
    private var viewIndicatorContainer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private var  stackViewIndicatorComponents: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        sv.spacing = 0
        return sv
    }()
    
    private var mainIndicator: UIView = {
        let v = UIView()
        v.backgroundColor = .black
        return v
    }()
    
    private var colors = [
        UIColor.red,
        UIColor.green,
        UIColor.blue,
        UIColor.orange,
    ]
  
    override func loadView() {
        super.loadView()
        view.addSubview(stackViewIndicatorComponents)
        viewIndicatorContainer.addSubview(stackViewIndicatorComponents)
        viewIndicatorContainer.addSubview(mainIndicator)
    }
  
    private func setupLayout() {
        NSLayoutConstraint.activate([
            
            
            viewIndicatorContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewIndicatorContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewIndicatorContainer.heightAnchor.constraint(equalToConstant: 2),
            viewIndicatorContainer.bottomAnchor.constraint(equalTo: tabBar.topAnchor)
            
        ])
        NSLayoutConstraint.activate([
            stackViewIndicatorComponents.topAnchor.constraint(equalTo: viewIndicatorContainer.topAnchor),
            stackViewIndicatorComponents.leadingAnchor.constraint(equalTo: viewIndicatorContainer.leadingAnchor),
            stackViewIndicatorComponents.trailingAnchor.constraint(equalTo: viewIndicatorContainer.trailingAnchor),
            stackViewIndicatorComponents.bottomAnchor.constraint(equalTo: viewIndicatorContainer.bottomAnchor)
        ])
    }
}
