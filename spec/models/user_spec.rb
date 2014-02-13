# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user       :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  count      :integer
#

require 'spec_helper'

describe User do

  it "create valid account" do
    user = User.add("carina", "boo")

    expect(user).to eq(User::SUCCESS)
  end

  it "create account with empty user returns ERR_BAD_USERNAME" do
    user = User.add("", "password")

    expect(user).to eq(User::ERR_BAD_USERNAME)
  end

  it "create account with > 128 char user returns ERR_BAD_USERNAME" do
    user = User.add("usernameijofwjoefjwifowjfowjiefojowejfoiwejiofjwoiafjwejfowajfwalfwaifjwlijefilwjfiawjijflwjffwefwefwefweafwefwefwafeawefawefafw9", "password")

    expect(user).to eq(User::ERR_BAD_USERNAME)
  end

  it "create account with repeat user returns ERR_USER_EXISTS" do
    user1 = User.add("username", "password1")
    user2 = User.add("username", "password2")

    expect(user1).to eq(User::SUCCESS)
    expect(user2).to eq(User::ERR_USER_EXISTS)
  end

  it "create account with > 128 password returns ERR_BAD_PASSWORD" do
    user = User.add("user", "passwordijofwjoefjwifowjfowjiefojowejfoiwejiofjwoiafjwejfowajfwalfwaifjwlijefilwjfiawjijflwjffwefwefwefweafwefwefwafeawefawefafw9")

    expect(user).to eq(User::ERR_BAD_PASSWORD)
  end

  it "create account with empty password returns SUCCESS" do
    user = User.add("user", "")

    expect(user).to eq(User::SUCCESS)
  end

  it "login with incorrect password" do
    User.add("user1", "password")
    user = User.login("user1", "password")

    expect(user).to eq(User::ERR_BAD_CREDENTIALS)
  end


  # change later
  it "create account with empty user returns ERR_BAD_USERNAME" do
    user = User.add("", "password")

    expect(user).to eq(User::ERR_BAD_USERNAME)
  end

  it "create account with > 128 char user returns ERR_BAD_USERNAME" do
    user = User.add("usernameijofwjoefjwifowjfowjiefojowejfoiwejiofjwoiafjwejfowajfwalfwaifjwlijefilwjfiawjijflwjffwefwefwefweafwefwefwafeawefawefafw9", "password")

    expect(user).to eq(User::ERR_BAD_USERNAME)
  end

  it "create account with repeat user returns ERR_USER_EXISTS" do
    user1 = User.add("username", "password1")
    user2 = User.add("username", "password2")

    expect(user1).to eq(User::SUCCESS)
    expect(user2).to eq(User::ERR_USER_EXISTS)
  end

  it "create account with > 128 password returns ERR_BAD_PASSWORD" do
    user = User.add("user", "passwordijofwjoefjwifowjfowjiefojowejfoiwejiofjwoiafjwejfowajfwalfwaifjwlijefilwjfiawjijflwjffwefwefwefweafwefwefwafeawefawefafw9")

    expect(user).to eq(User::ERR_BAD_PASSWORD)
  end

  it "create account with empty password returns SUCCESS" do
    user = User.add("user", "")

    expect(user).to eq(User::SUCCESS)
  end

end



  # # password empty
  # # valid
  # User.add("user3", "")


  # # TESTS: LOGIN EXISTING USER

  # # user name empty
  # # ERR_BAD_USERNAME
  # User.login("","password")

  # # user name does not exist
  # # ERR_BAD_USERNAME
  # User.login("unknown","password")

  # # user name does not match password
  # # ERR_BAD_CREDENTIALS
  # User.login("user1","wrongpassword")
