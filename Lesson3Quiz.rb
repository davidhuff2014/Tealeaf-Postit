# 1 Rendering displays the view redirecting sends a new request to the browser using the URL provided, currently defined instance variables will work in the rendered view but not the redirected path
# 2 Use a flash notice 
      flash[:notice] = "Welcome, #{@user.username} you are now registered and logged in!"
      redirect_to root_path
# 3 flash.now will display without user interaction on the same render request
# 4 passwords are not saved but their representation in a one way hash is saved in a password_digest
      using has_secured_password is one way using bcrypt for encryption
# 5 that method would belong in the application_controller.rb, to use it in a view it must be listed as a helper moethod
      helper_method :calc_page_hits
# 6 memoization my word for the week is a way of keeping a database result set available in memory (instance variable) for multiple requests
      saves IO on hard drives and speeds up responses
# 7 You need to modify the application_cotroller.rb to make these methods available to the whole system
  def current_user
    # if authenticated user, return the user obj
    # else return nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # turns into booleen 
    !!current_user
  end

  Then you need to have a before action in the controllers you want to manage.
    before_action :require_user, except: [:index, :show]
# 8 Setup a table with id, user_id, likeable_type, likeable_id
class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :user_id
      t.references :likeable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
# 9
class Vote < ActiveRecord::Base
  belongs_to :voteable, polymorphic: true
end
class Post < ActiveRecord::Base
  has_many :votes, as: :voteable
end
# 10 EntityRelationshipDiagram, used to layout data tables before beginning programming
