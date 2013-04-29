class Comment < ActiveRecord::Base
  attr_accessible :contents, :post, :user

  def contHTML
  	return BlueCloth.new(self.contents).to_html
  end
end
