//
//  ViewController.swift
//  SolidRotation
//
//  Created by Ngmm_Jadon on 2017/6/1.
//  Copyright © 2017年 Ngmm_Jadon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let gestureView = UIView()
    var angle = CGPoint(x: 0, y: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.lightGray
        gestureView.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        gestureView.center = view.center
        view.addSubview(gestureView)
        
        for i in 0...5 {
            let rotateView = UIView()
            gestureView.addSubview(rotateView)
            rotateView.bounds = gestureView.bounds
            var transform = CATransform3DIdentity
            switch i {
            case 0:
                rotateView.backgroundColor = UIColor.red
                rotateView.center = CGPoint(x: gestureView.bounds.size.width/2, y: gestureView.bounds.size.height/2)
                transform = CATransform3DTranslate(transform, 0, 0, gestureView.bounds.size.width/2)
                rotateView.layer.transform = transform
            case 1:
                rotateView.backgroundColor = UIColor.blue
                rotateView.center = CGPoint(x: 0, y: gestureView.bounds.size.height/2)
                transform = CATransform3DRotate(transform, -CGFloat.pi/2, 0, 1, 0)
                rotateView.layer.transform = transform
            case 2:
                rotateView.backgroundColor = UIColor.green
                rotateView.center = CGPoint(x: gestureView.bounds.size.width, y: gestureView.bounds.size.height/2)
                transform = CATransform3DRotate(transform, CGFloat.pi/2, 0, 1, 0)
                rotateView.layer.transform = transform
            case 3:
                rotateView.backgroundColor = UIColor.purple
                rotateView.center = CGPoint(x: gestureView.bounds.size.width/2, y: gestureView.bounds.size.height/2)
                transform = CATransform3DTranslate(transform, 0, 0, -gestureView.bounds.size.width/2)
                rotateView.layer.transform = transform
            case 4:
                rotateView.backgroundColor = UIColor.orange
                rotateView.center = CGPoint(x: gestureView.bounds.size.width/2, y: 0)
                transform = CATransform3DRotate(transform, -CGFloat.pi/2, 1, 0, 0)
                rotateView.layer.transform = transform
            case 5:
                rotateView.backgroundColor = UIColor.yellow
                rotateView.center = CGPoint(x: gestureView.bounds.size.width/2, y: gestureView.bounds.size.height)
                transform = CATransform3DRotate(transform, CGFloat.pi/2, 1, 0, 0)
                rotateView.layer.transform = transform
            default : break
            }
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform))
        gestureView.addGestureRecognizer(panGesture)
    }
    
    func viewTransform(sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: gestureView)
        //旋转快慢因数
        let rotateSpeedFactor: CGFloat = 100.0;
        let angleX = angle.x + point.x/rotateSpeedFactor
        let angleY = angle.y - point.y/rotateSpeedFactor
        
        var transform = CATransform3DIdentity
        //立体形变-1/d，d越大立体形变越弱
        transform.m34 = -1/500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        gestureView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angleX
            angle.y = angleY
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

