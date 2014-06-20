# 1
get     '/posts'            post#index    posts_path     
get     '/posts/:obj/new'   posts#new     new_post_path
post    '/posts'            posts#create  
get     '/posts/:obj/edit'  posts#edit    edit_post_path(obj)
get     '/posts/:obj'       posts#show    post_path(obj)
patch   '/posts/:obj'       posts#update
put     '/posts/:obj'       posts#update
delete  '/posts/:obj'       posts#destroy
# 2 
REpresentational State Transfer - the effect of being stateless and transferring 
information using the http protocol
# 3
model backed helpers are tied to an object
non-model backed helpers might be an html mechanism
# 4
form_for understands the model object that is being passed to it and knows
what to do for it
# 5
From my project
def create
  @post = Post.new(post_params)
  @post.creator = User.first  # TODO: only until we have authentication

  if @post.save
    flash[:notice] = 'Your post was created.'
    redirect_to posts_path
  else
    render :new # this is a template
  end
end
def update
  if @post.update(post_params)
    flash[:notice] = 'The post was updated.'
    redirect_to posts_path
  else
    render :edit # this is a template
  end
end
  private

def post_params
  params.require(:post).permit(:title, :url, :description, category_ids: [])
end
def set_post
    @post = Post.find(params[:id])
end
There is also a before action run for update to get object currency
  before_action :set_post, only: [:show, :edit, :update]
# 6
validations are triggered when a modification is attempted to the database
there errors are attached to the in memory object themselves
From my project
<%= render 'shared/errors', obj: @post %> # use this to call this in your partial

 <%#=binding.pry %>
<% if obj.errors.any? %>
  <div class='row'>
    <div class='alert alert-error'>
      <h5>There were some errors:</h5>
      <ul>
        <% obj.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
      </ul>
    </div>
  </div>
<% end %>
# 7
helper methods used consolodate application logic used in more than one area
when placed in the application_helper.rb they are available to the whole application
# 8
views that are used to store shared html they begin with an underscore
# 9
partials are html
helpers are methods containing code 
# 10
non-model backed code is usually html not bound to objects
