
import UIKit
import AlamofireImage

class FavoriteTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var servsAndTimeStackView: UIStackView!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientDetailsLabel: UILabel!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setAspect()
    }

    // MARK: - Configure

    func configure(with recipe: RecipeFormated) {
        if let imageUrl = recipe.imageUrl {
            recipeImageView.af.setImage(withURL: imageUrl, placeholderImage: UIImage(named: "default pic"))
        } else {
            recipeImageView.image = UIImage(named: "default pic")
        }

        servingsLabel.text = recipe.formatedServings
        timeLabel.text = recipe.formatedTotalTime
        recipeTitleLabel.text = recipe.recipeName
        ingredientDetailsLabel.text = recipe.formatedIngredientsPreview
    }

    // MARK: - Private

    private func setAspect() {
        servsAndTimeStackView.layer.cornerRadius = 5.0
        servsAndTimeStackView.layer.borderWidth = 1
        servsAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
