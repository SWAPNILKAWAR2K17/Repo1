//
//  ViewController.swift
//  HelloWorld
//
//  Created by Apple on 14/09/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var txtUserName: UITextField!
    var locationManager : CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate=self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter=20
        locationManager.startUpdatingLocation()
        print("viewDidLoad")
        
        
        print("This is the change 1")
        
        // top right
        addSubView(frame: CGRect(x: 10, y: 10, width: 100, height: 100), position: "top_left")
        
        // top left
        addSubView(frame: CGRect(x: view.frame.width-110, y: 10, width: 100, height: 100), position: "top_right")
        
        // bottom left
        addSubView(frame: CGRect(x: 10, y:
            view.frame.height-110, width: 100, height: 100), position: "bottom_left")
        
        // bottom right
        addSubView(frame: CGRect(x: view.frame.width-110, y: view.frame.height-110, width: 100, height: 100), position: "bottom_right")
        
        // centerView
        addSubView(frame: CGRect(x: view.center.x-50 , y: view.center.y-50 , width: 100, height: 100), position: "center")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var location = locations.last
    }
    
    func animateView(mView:UIView,fromValue:NSValue,toValue:NSValue)
    {
        let animation =  CABasicAnimation(keyPath: "position")
        animation.repeatCount=50
        animation.autoreverses=true
        animation.duration=0.5
        animation.fromValue = fromValue
        animation.toValue = toValue
        
        mView.layer.add(animation, forKey: "position")
        
        print("This is the change 2")

        
    }
    
    func addSubView(frame : CGRect,position : String){
        
        print("This is the change 3")

        let mView = UIView()
        mView.frame = frame
        mView.backgroundColor = UIColor.purple.withAlphaComponent(8)
        mView.translatesAutoresizingMaskIntoConstraints=true
        mView.layer.borderWidth = 0.5
        mView.layer.borderColor = UIColor.lightGray.cgColor
        mView.layer.cornerRadius =  mView.frame.width/2
        view.addSubview(mView)
        
        var  fromValue = NSValue()
        var toValue = NSValue()
        
        if position.isEqual(string: "center"){

            UIView.animate(withDuration: 10, animations: {
                mView.alpha = 0.0
            }, completion: { (isTrue) in
                mView.alpha = 10
            })
            
        }else if position.isEqual(string: "top_right"){
            fromValue = NSValue(cgRect: CGRect(x: view.frame.width-60     , y: 60, width: 0, height: 0))
            toValue = NSValue(cgRect: CGRect(x: view.frame.width + 60 , y: 60, width: 0, height: 0))
            
        }else if position.isEqual(string: "top_left"){
            fromValue = NSValue(cgRect: CGRect(x: mView.frame.origin.x+60     , y: 60, width: 0, height: 0))
            toValue = NSValue(cgRect: CGRect(x: mView.frame.origin.x - 60 , y: 60, width: 0, height: 0))
        }else if position.isEqual(string: "bottom_right"){
            
            fromValue = NSValue(cgRect: CGRect(x: view.frame.width-60     , y: view.frame.height-60, width: 0, height: 0))
            toValue = NSValue(cgRect: CGRect(x: view.frame.width + 60 , y: view.frame.height-60, width: 0, height: 0))
        }
        else{
            fromValue = NSValue(cgRect: CGRect(x: mView.frame.origin.x+60     , y: view.frame.height-60, width: 0, height: 0))
            toValue = NSValue(cgRect: CGRect(x: mView.frame.origin.x - 60 , y: view.frame.height-60, width: 0, height: 0))        }
        
        
        animateView(mView:mView, fromValue:fromValue , toValue: toValue)
        
    }
    
}

extension String{
    
    func isEqual(string:String) -> Bool{
        print("This is the change 4")

        return self == string
    }
}

