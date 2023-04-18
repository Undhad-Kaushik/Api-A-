//
//  TableViewCell.swift
//  Api(A)
//
//  Created by undhad kaushik on 01/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dataSourceNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var datasetNameLabel: UILabel!
    @IBOutlet weak var datasetLinkLabel: UILabel!
    @IBOutlet weak var tabelIdLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    
    @IBOutlet weak var subTopicLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
