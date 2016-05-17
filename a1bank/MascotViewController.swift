//
//  MascotViewController.swift
//  a1bank
//
//  Created by Panagiotis Papasyamatis on 17/05/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit
import SceneKit


class MascotViewController: UIViewController
{
    
    let scene = SCNScene()
    
    
    let camDistance:CGFloat = 55.0
    
    
    let cameraNode = SCNNode()
    
    let floorNode = SCNNode()
    let floor = SCNFloor()
    
    @IBOutlet var mascotView: SCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: "tappy:")
        self.mascotView.addGestureRecognizer(gesture)
        
        self.cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        draw()

        
    }
    
    func tappy(sender:UITapGestureRecognizer){
        self.makeItRain()
    }
    
    private func draw()
    {
        self.mascotView.allowsCameraControl = true
        self.mascotView.backgroundColor = UIColor.grayColor()
        self.mascotView.autoenablesDefaultLighting  = true

        
        cameraNode.position = SCNVector3(x: 0, y: 15.0, z: Float(camDistance))
        
        floor.reflectivity = 0.25
        floorNode.geometry = floor
        
        // Floor Physics
        let floorShape = SCNPhysicsShape(geometry: floor, options: nil)
        let floorBody = SCNPhysicsBody(type: .Static, shape: floorShape)
        
        floorNode.physicsBody = floorBody;
        
        scene.rootNode.addChildNode(floorNode)
        
        makeItRain()
        
        
        self.mascotView.scene = scene

    }
    
    private func makeItRain()
    {
        // Add box nodes to the scene
        for _ in 0..<1000 {
            let node = SCNNode()
            let rdx = randomF() * camDistance - camDistance / 2
            let rdy = randomF()  * 300
            let rdz = randomF()  * camDistance - camDistance / 2
            node.position = SCNVector3Make(Float(rdx), Float(rdy), Float(rdz))
            let box = SCNBox(width: randomF() * randomF(), height: randomF()  * randomF(), length: randomF()  * randomF(), chamferRadius: 0.0)
            node.geometry = box
            
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.greenColor()
            material.specular.contents = UIColor.blueColor()
            material.locksAmbientWithDiffuse = true
            
            node.geometry?.firstMaterial = material
            
            let boxShape = SCNPhysicsShape(geometry: box, options: nil)
            let boxBody = SCNPhysicsBody(type: .Dynamic, shape: boxShape)
            
            node.physicsBody = boxBody;
            scene.rootNode.addChildNode(node)
        }
    }
    
    @IBAction func homeButtonPressed(sender: AnyObject)
    {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("homeViewController") as!HomeController
        presentViewController(controller, animated: true, completion: nil)
    }
    
    private func randomF() -> CGFloat
    {
        return CGFloat(arc4random()) /  CGFloat(UInt32.max)
    }
    
}