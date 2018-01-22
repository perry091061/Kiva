//
//  KivaLoanTableViewController.swift
//  KivaLoan
//
 

import UIKit

class KivaLoanTableViewController: UITableViewController {
    var loans = [KivaLoan]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let network = Network(callback:update)
        
        tableView.estimatedRowHeight = 92.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return loans.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KivaLoanTableViewCell

         cell.amountLabel.text = "\(loans[indexPath.row].amountLabel)"
         cell.useLabel.text = "\(loans[indexPath.row].useLabel)"
         cell.countryLabel.text = "\(loans[indexPath.row].countryLabel)"
         cell.nameLabel.text = "\(loans[indexPath.row].nameLabel)"
        return cell
    }
    
    func update(loans:[KivaLoan])
    {
        self.loans = loans
        tableView.reloadData()
    }

}
