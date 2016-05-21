//
//  HomeController.swift
//  a1bank
//
//  Created by Panagiotis Papastamatis on 28/03/2016.
//  Copyright © 2016 Panagiotis Papastamatis. All rights reserved.
//

import UIKit
import SceneKit

class HomeController: UIViewController {

    @IBOutlet var contactUsButton: UIButton!
    
    @IBOutlet var sceneView: SCNView!
    @IBOutlet var locateUsButton: UIButton!
    
    let scene = SCNScene()
    let camDistance:CGFloat = 55.0
    let cameraNode = SCNNode()
    let floorNode = SCNNode()
    let floor = SCNFloor()
    
    @IBAction func mascotButtonPressed(sender: AnyObject)
    {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("mascotViewController") as! MascotViewController
        presentViewController(controller, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ApplicationService.populateData()
        self.drawCoin()
        
    }

    @IBAction func locateUsPressed(sender: UIButton)
    {
        
        let controller = storyboard?.instantiateViewControllerWithIdentifier("locateUsViewController") as! LocateUsViewController
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func contactUsPressed(sender: UIButton)
    {
        let controller = storyboard?.instantiateViewControllerWithIdentifier("aboutUsViewController") as! AboutViewController
        presentViewController(controller, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func drawCoin()
    {
        self.sceneView.allowsCameraControl = true
        self.sceneView.backgroundColor = UIColor.whiteColor()
        self.sceneView.autoenablesDefaultLighting  = true
        self.cameraNode.camera = SCNCamera()
        self.scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x: 0, y: 15.0, z: Float(camDistance))
        floor.reflectivity = 0.75
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.whiteColor()
        material.specular.contents = UIColor.yellowColor()
        material.shininess = 1.0
        material.locksAmbientWithDiffuse = true
        floorNode.geometry?.firstMaterial = material
        floor.firstMaterial = material
        floorNode.geometry = floor

        let floorShape = SCNPhysicsShape(geometry: floor, options: nil)
        let floorBody = SCNPhysicsBody(type: .Static, shape: floorShape)
        
        floorNode.physicsBody = floorBody;
        
        scene.rootNode.addChildNode(floorNode)
        self.dropCoins()
        self.sceneView.scene = self.scene
    }
    
    private func dropCoins()
    {
        for a in 0..<100
        {
            NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("deleteNode:"), userInfo: ["dropCoin:" :a], repeats: false)
        }
    }
    
    private func dropCoin(timer:NSTimer)
    {
        let node = SCNNode()
        
        let cylinder = SCNCylinder(radius: 0.2, height: 0.9)
        cylinder.radialSegmentCount = 8
        
        node.geometry = cylinder
        
        let rdx = randomF() * camDistance - camDistance / 2
        let rdy = randomF()  * 300
        let rdz = randomF()  * camDistance - camDistance / 2
        
        node.geometry = cylinder
        node.rotation = SCNVector4( x: 0, y: 0, z: 1, w: 1.5708)
        node.position = SCNVector3Make(Float(rdx), Float(rdy), Float(rdz))
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.yellowColor()
        material.specular.contents = UIColor.yellowColor()
        material.shininess = 1.0
        material.locksAmbientWithDiffuse = true
        
        node.geometry?.firstMaterial = material
        
        let coinShape = SCNPhysicsShape(geometry: cylinder, options: nil)
        let coinBody = SCNPhysicsBody(type: .Dynamic, shape: coinShape)
        
        node.physicsBody = coinBody;
        self.scene.rootNode.addChildNode(node)
        NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: Selector("deleteNode:"), userInfo: ["node" :node], repeats: false)
    }
    
    private func randomF() -> CGFloat
    {
        return CGFloat(arc4random()) /  CGFloat(UInt32.max)
    }
    
    func deleteNode(timer:NSTimer)
    {
        let userInfo = timer.userInfo as! Dictionary<String, AnyObject>
        if let node = userInfo["node"]
        {
            node.removeFromParentNode()
        }
        self.dropCoin(timer)
        timer.invalidate()
    }
    

}
