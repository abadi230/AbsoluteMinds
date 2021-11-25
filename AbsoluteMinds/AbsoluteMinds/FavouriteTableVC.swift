//
//  FavouriteTableVC.swift
//  AbsoluteMinds
//
//  Created by بندر عبيد ثاري الرشيدي on 18/04/1443 AH.
//

import UIKit

class FavouriteTableVC: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fackTitles = [
        "Ear, Nose, Throat, and Tracheobronchial Diseases in Dogs and Cats",
        "All Eye Cats",
        "Valentine Cappu & Cats",
        "Very British Cats",
        "I love Happy Cats",
        "Black CATS - Im Netz des Todes",
        "Vom Tod berührt - Die Black-Cats-Trilogie Socks, Gods, Cats and Demons - zweisprachige Ausgabe.",
        "Dr. Pitcairn's Complete Guide to Natural",
        "Health for Dogs & Cats",
        "Hemingway's Cats"
    ]
    let fakeDetails = [
        "        Ear, Nose, Throat, and Tracheobronchial Diseases in Dogs and Cats is the first textbook to provide a complete overview of all ENT diseases, both common and rare. It includes such problems as inflammation of the outer ear, deafness, nasal discharge, swallowing disorders, and cough. Detailed and up to date clinical information gives insight into ENT function and dysfunction for teachers and researchers, veterinarians in practice and veterinary students. Six chapters give key information on functional considerations, aetiology, clinical signs, diagnosis, and therapy of ENT disorders. Special diagnostic and imaging techniques are described in detail. Approximately 180 top quality illustrations emphasize and supplement the specific features of the diseases and disorders described in the text. A detailed index gives easy access to the content of this book. This unique textbook will provide a highly useful and informative reference guide to everyday practice, based on the author¿s 35 years as a specialist in ear, nose, throat, and tracheobronchial diseases in companion animals.",
        
        "Nächte können tagelang dauern. Jahrelang. Manchmal dauern sie ein ganzes Leben. Es fällt dir nicht auf. Jeden Morgen klingelt der Wecker, du ziehst die Vorhänge zurück und denkst: „Ein neuer Tag“, doch Irrtum, es ist noch Nacht; die Augen sind offen, doch du schläfst. Und es ist nicht nur Schlaf. Es ist ein Traum. Und dieser Traum ist voller Fehler.",
        
        "Mit zwei Geschichten, in denen Katzen eine nicht ganz unbedeutende Rolle spielen, bedanken wir uns bei unseren Lesern.Wir wünschen viel Vergnügen beim Lesen und einen schönen Valentinstag.",
        
        "Das Rassebuch der BKH & BLH - vom Säbelzahntiger zur British Kurzhaar - gesunde und artgerechte Ernährung - Beschreibung alter und neuer Farben - die High Society der Briten - Anatomie, Sinne und ihr Wesen - Gesundheit, Blutgruppen und rassebedingte Erbkrankheiten - Genetikgrundlagen - Showbusiness - 160 Farbfotos",
        
        "Das macht Katzen wirklich glücklich Haben Sie auch manchmal das Gefühl, Ihre Katze möchte Ihnen etwas sagen? Einen Hinweis darauf geben, wie Sie Ihren Stubentiger noch glücklicher machen könnten? Die sympathische Verhaltens-Therapeutin Anneleen Bru nimmt Sie mit in die Welt der Katzen und ihres manchmal mysteriösen Benehmens und gibt wertvolle Tipps, wie Sie mitunter schon durch Kleinigkeiten die Beziehung zu Ihrem Stubentiger verbessern. Background-Check: Ihr Zuhause aus der Katzenperspektive Emotion, Motivation, Kommunikation: Katzensprache verstehen Ernährung, Beschäftigung, Gesundheit: Umgebung und Beziehung optimieren Anneleen Bru weiß, wie man Katzen noch glücklicher und zufriedener macht. Alle Tipps und Erkenntnisse der erfolgreichen Verhaltenstrainerin jetzt als Buch Pflichtlektüre für alle Katzenfreunde.",
        
        "Der ehemalige FBI-Profiler Alec Lambert steigt bei den Black CATS ein - einer Spezialeinheit zur Bekämpfung von Internetkriminalität. Er übernimmt die Ermittlungen gegen einen berüchtigten Serienmörder, der sich als 'Der Professor' bezeichnet und sich seine Opfer im Internet sucht. Alec erhält Unterstützung von der Expertin Samantha Dalton, die mit ihrem attraktiven Äußeren und ihrer zurückhaltenden Art tiefe Gefühle in ihm weckt. Doch die Lage eskaliert, als Samantha selbst ins Visier des Serienmörders gerät ...",
        
        "        Alle drei Geschichten aus Leslie Parrishs Black-CATs-Reihe in einem E-Book vereint! Was kostet der Tod: FBI-Agent Dean Taggert schließt sich einer neuen Spezialeinheit an - dem Cyber Action Team. Aufgabe dieses Teams ist es, Mordfälle zu lösen, die mit dem Internet in Verbindung stehen. Taggert wird sofort mit einem äußerst brisanten Fall betraut: Er soll einen Serienmörder aufspüren, der auf einer Internetseite namens 'Satan's Playground' live Frauen umbringt. Seine Ermittlungen führen ihn in die Kleinstadt Hope Valley, wo ihm die äußerst fähige und attraktive Polizistin Stacey Rhodes zur Seite steht. Gemeinsam verfolgen sie die Spur des Täters. Und sie müssen sich beeilen, denn der Mörder hat bereits sein nächstes Opfer im Visier ... Im Netz des Todes: Der ehemalige FBI-Profiler Alec Lambert steigt bei den Black CATS ein - einer Spezialeinheit zur Bekämpfung von Internetkriminalität. Er übernimmt die Ermittlungen gegen einen berüchtigten Serienmörder, der sich als 'Der Professor' bezeichnet und sich seine Opfer im Internet sucht. Alec erhält Unterstützung von der Expertin Samantha Dalton, die mit ihrem attraktiven Äußeren und ihrer zurückhaltenden Art tiefe Gefühle in ihm weckt. Doch die Lage eskaliert, als Samantha selbst ins Visier des Serienmörders gerät ... Dem Tod versprochen: FBI-Agent Wyatt Blackstone steht vor einem Rätsel: In Hotelzimmern werden grausam verstümmelte Leichen gefunden. Der Mörder scheint es ausschließlich auf Sexualtäter abgesehen zu haben und hinterlässt an den Tatorten stets eine Lilie. Die Indizien wecken in Blackstone einen furchtbaren Verdacht. Er glaubt, dass ein ehemaliges Mitglied seines Teams die Taten begangen haben könnte - eine Frau, für die Wyatt insgeheim starke Gefühle hegt. Kann es sein, dass Lily Fletcher in Wahrheit eine kaltblütige Mörderin ist?",
        
        "Five different Stories who becomes a unexpectedly reality. A melancholy Demon-Hunter, two clever cats who uncover a kidnapping, decommissioned gods of Olympus, a writer with magical abilities and a mysterious artifact that brings to light almost unbelievable. That's the exciting mystical world of Barbara Wegener! Geschichten die unerwartet real werden: eine melancholische Dämonenjägerin, Katzen die eine Entführung aufklären, degenerierte Götter und ein geheimnisvolles Artefakt das schier unglaubliches zutage fördert. Das ist die spannend mystische Welt der Barbara Wegener!",
        
        "Discusses the nutritional value of commercial pet foods and recommends drug-free treatments for common diseases",
        
        "This unique biography of Ernest Hemingway, illustrated with more than two hundred photographs, reveals the legendary writer's affinity for the companion animals he kept throughout his lifetime."
    ]

    var result = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate=self
        tableView.dataSource=self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        for item in fackTitles {
            let newBook = Book(context: context)
            newBook.title = item
        }
        for item in fakeDetails {
            let newBook = Book(context: context)
            newBook.detail = item
        }
        self.saveData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return fackTitles.count
    }
    
    
    // Create
    
   
    func saveData(){
        
        
        
        do {
            try context.save()
        } catch {
            print("Unable to save")
        }
        fetchDataFromDB()
        tableView.reloadData()
    }
    
    //Update
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //self.result[indexPath.row].name = textBox?.text
        self.saveData()
        self.fetchDataFromDB()
        do { try! self.context.save(); self.fetchDataFromDB()}
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellBook", for: indexPath) as? BookCell
        cell?.titelLabel.text =  fackTitles[indexPath.row]
        cell?.titalDetal.text = fakeDetails[indexPath.row]
        
        return cell!
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
    
    
    //Read
    func fetchDataFromDB(){
        let request = Book.fetchRequest()
        do {
            result = try! context.fetch(request)
            //TDOD: if you want to display data in tableView Reload tableview tableView.reloadData()
        }
    }
    
    
    // Delete
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { let actionDelete = UIContextualAction(style: .destructive, title: "Delete") { _, _, handler in
        let itemToDelete = self.result[indexPath.row]
        self.context.delete(itemToDelete)
        self.saveData()
        self.fetchDataFromDB()
    }
        return UISwipeActionsConfiguration(actions: [actionDelete]) }
}


class BookCell: UITableViewCell {
    
    
    @IBOutlet weak var titelLabel: UILabel!
    
    @IBOutlet weak var titalDetal: UILabel!
}
