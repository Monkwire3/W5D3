require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.results_as_hash = true
    end
end

class Users
    def self.find_by_id
        data = users.instance.execute("SELECT id FROM questions")
        data.map {|datum| questions.new(datum)}
    end

    def self.all
        users = QuestionsDatabase.instance.execute("SELECT * FROM users")

        users.map{|user| Users.new(user)}
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end



class Questions

    attr_accessor :id, :title, :body, :user_id
    
    def self.find_by_id
        data = questions.instance.execute("SELECT id FROM questions")
        data.map {|datum| questions.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @user_id = options['user_id']
    end
    
end

class QuestionFollows
    def self.find_by_id
        data = question_follows.instance.execute("SELECT id FROM questions")
        data.map {|datum| questions.new(datum)}
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end

class Replies
    def self.find_by_id
       data = questions.instance.execute("SELECT id FROM questions")
        data.map {|datum| questions.new(datum)} 
    end

    def initialize(options)
        @id = options['id']
        @parent_id = options['parent_id']
        @body = options['body']
        @author_id = options['author_id']

    end
end

class QuestionLikes
     def self.find_by_id
       data = questions.instance.execute("SELECT id FROM questions")
        data.map {|datum| questions.new(datum)} 
     end

     def initialize(options)
        @id = options['id']
        @like_count = options['like_count']
        @questions_id = options['questions_id']
    end
end

