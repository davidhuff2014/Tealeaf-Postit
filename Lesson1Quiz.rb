# 1) The tables relate to each other through keys
# 2) Sequentiag Query Language, language used to CRUD in relational tables
# 3) The crid like appearance of the data and the structure or format of the tables
# 4) Primary key defauts to id
# 5) Used as a pointer to another tables
# 6) Access the table which is related to a class to perform CRUD
# 7) crazy_monkies, you can get the name this way "CrazyMonkey".tableize
# 8)  
      class Project < ActiveRecord::Base
        has_many :issues, foreign_key: :project_id # would default to this
      end

      class Issue < ActiveRecord::Base
        belongs_to :projects, foreign_key: :project_id # would default to this
      end
#9 ) 
      class Animal < ActiveRecord::Base
        belongs_to :zoo
      end
      # zoos primary key id
      # animals primary key id foreign_key zoo_id
      # zoo.animals lists all animals
      # zoo.animals.first will list the first row of animals
      # zoo = Zoo.create(name: 'San Diego Zoo')  #create causes it to save
      # animal = Animal.create(name: 'Jumpster', zoo_id: 1) # Jumpster with foreign_key
# 10) Post.new(title: 'mypost', body: 'text text') # not automatically saved
    # Post.create(title: 'mysaved post' body: 'will autosave')
# 11) returns the first row for table animals
# 12) animal = Animal.create(name: 'Joe')
# 13) uses a join table consisting of foreign keys for both tables
# 14) has_many :through
    # has_and_belongs_to_many # not as flexible
# 15)
      class User < ActiveRecord::Base
        has_many :user_groups, foreing_key: :user_id
        has_many :groups, through: :user_groups
      end

      class UserGroup < ActiveRecord::Base
        belongs_to :user, foreign_key: :user_id
        belongs_to :group, foreign_key: :group_id
      end

      class Group < ActiveRecord::Base
        has_many :user_groups,  foreign_key: :group_id
        has_many :users, through: :user_groups
      end

