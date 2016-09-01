require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Úsuário Exemplo", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid"  do
      assert @user.valid?
  end

# Start - Validando presença
  test "name should be present" do
        @user.name = " "
        assert_not @user.valid?
  end

  test "email should be present" do
        @user.email = " "
        assert_not @user.valid?
  end

# Start - Validando Length (comprimento)
  test "name should not be too long" do
        @user.name = "a" * 51 # limite de 50 caracteres para ser valido.
        assert_not @user.valid?
  end

  test "email should not be too long" do
        @user.email = "a" * 244 + "@example.com" # limite de 244 caracteres no email antes do "@"
        assert_not @user.valid?
  end

  # Start- Validando Formato do email
    test "email validation should accept  valid addresses" do
        valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
            @user.email =valid_address
            assert @user.valid?, "#{valid_address.inspect} should be valid"
        end
    end

    test "email validation should reject invalid addresses" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
        invalid_addresses.each do |invalid_address|
            @user.email = invalid_address
            assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
         end
    end

    # Start- Validando unicidade
        test "email addresses should be unique" do
            duplicate_user = @user.dup # .dup duplica o objeto
            duplicate_user.email = @user.email.upcase
            @user.save
            assert_not duplicate_user.valid? # duplicado deve ser falso "assert_not"
        end

    # Start- Email deve ser salvo como lower case
      test "email addresses shold be saved as lower-case" do
          mixed_case_email = "Foo@ExAMPle.CoM"
          @user.email = mixed_case_email
          @user.save
          assert_equal mixed_case_email.downcase, @user.reload.email
      end

      # Start- Validando presença do campo password
        test "password should be present (nonblanck)" do
            @user.password = @user.password_confirmation = " " * 6
             assert_not @user.valid?
        end

        # Start- Validando comprimento minimo da senha (6)
          test "password should have a minimum length" do
              @user.password = @user.password_confirmation = "a" * 5
              assert_not @user.valid?
          end
end
