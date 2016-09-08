require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

    test "Invalid signup information" do
        get signup_path
        assert_difference 'User.count', 1 do
            post users_path, params: { user: {name: "Example",
                                                                    email: "example@valid.com",
                                                                    password: "foobar",
                                                                    password_confirmation: "foobar"}}
        end
        follow_redirect!
        assert_template 'users/show'
        assert_not flash.empty?
        #assert_select 'div#<CSS id for error explanation>'
        #assert_select 'div.<CSS class for field with error>'
    end
end
