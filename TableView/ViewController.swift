//
//  ViewController.swift
//  TableView
//
//  Created by Дамир Нургалиев on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lableMarks: UILabel!
    
    @IBOutlet weak var labelModels: UILabel!
    
    @IBOutlet weak var labelDetailAbout: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
   var cars2 = Cars()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lableMarks.text = cars2.marks
        
        labelModels.text = cars2.models
        
        labelDetailAbout.text = cars2.detailAbout
        
        imageView.image = UIImage(named: cars2.imagename2)
        
        
    }


}

