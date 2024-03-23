//
//  TableViewController.swift
//  TableView
//
//  Created by Дамир Нургалиев on 19.03.2024.
//

import UIKit

class TableViewController: UITableViewController {
    
//    var arrayMarks = ["bmw", "audi", "mercedes", ]
//    var arrayModel = ["m5", "a6", "e63",  "t1"]
//    var arrayImages = ["bmw", "audi", "mercedes", ]
    
    var arrayCars = [Cars(marks: "bmw", models: "m5", imagename: "bmw", detailAbout: """
                          BMW M5 — доработанная подразделением BMW Motorsport версия автомобиля BMW пятой серии. Первое поколение было представлено в 1986 году. Последующие поколения M5 сменялись совместно с каждым поколением автомобилей пятой серии, включающей E34, E39, E60/61, F10.
                          """, imagename2: "bmw1"),
                     Cars(marks: "audi", models: "a6", imagename: "audi", detailAbout: """
                          Audi 100, с 1994 года Audi A6, — семейство автомобилей бизнес-класса, выпускающихся под маркой Audi, внутреннее обозначение — «тип C». Премьера Audi 100 состоялась в 1968 году, с августа 1994 года этот модельный ряд носит название А6.В отличие от Audi 80/A4, где переименование совпало с выпуском новой модели, первый А6 представлял собой рестайлинговую версию последнего Audi 100 .Сегодня Audi A6 предлагается в четырехдверной версии с кузовом седан и в пятидверной версии Avant (универсал), ранее выпускались также двухдверные модели, купе и хэтчбек. Спортивная модификация А6 производится под наименованием Audi S6, а наиболее мощная версия A6 производится под наименованием RS6, что расшифровывается как RennSport
                          """, imagename2: "audi1"),
                     Cars(marks: "mercedes", models: "e63", imagename: "mercedes", detailAbout: """
                          Mercedes-Benz Е-класс (ориг. E-Klasse, ранее нем. Einspritzung — «топливный впрыск») — серия легковых автомобилей бизнес-класса немецкой торговой марки Mercedes-Benz, официально представленная с 1993 года и в настоящее время состоящая из пяти поколений.
                          """, imagename2: "mercedes1"),
                     Cars(marks: "volkswagen", models: "t1", imagename: "volkswagen", detailAbout: """
                          Volkswagen T1 — автомобиль концерна Volkswagen, производившийся с 1950 по 1967 годы (по 1975 в Бразилии). Один из первых гражданских минивэнов. Автомобиль также стал лицом целой эпохи и, наряду со своим преемником T2, был очень популярен среди хиппи. Также известен как «хиппимобиль» или «сплитти».
                          """, imagename2: "volkswagen1")]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    @IBAction func addCars(_ sender: Any) {
        
        arrayCars.append(Cars(marks: "new Marks ", models: "new Models ", imagename: "avatar", detailAbout: "something", imagename2: "avatar2"))
        
    
        tableView.reloadData()
    }
   
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayCars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        let labelMarks = cell.viewWithTag(1000) as! UILabel
        labelMarks.text = arrayCars[indexPath.row].marks
        
        let labelModel = cell.viewWithTag(1001) as! UILabel
        labelModel.text = arrayCars[indexPath.row].models
        
     
        let imageView = cell.viewWithTag(1002) as! UIImageView
        imageView.image = UIImage(named: arrayCars[indexPath.row].imagename)
       
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(identifier: "detailVeiwControler") as! ViewController
        
        detailVC.cars2 = arrayCars[indexPath.row]
        
        navigationController?.show(detailVC, sender: self)
        
        
        
        
//        detailVC.marks = arrayCars[indexPath.row].marks
//        detailVC.models = arrayCars[indexPath.row].models
//        detailVC.imageName = arrayCars[indexPath.row].imagename
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayCars.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
