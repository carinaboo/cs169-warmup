class UserController < ApplicationController

  def index
  	@users = User.all
  end

  def add
    user = params[:user]
    password = params[:password]
    num = User.add(user, password)
    if num < 0
      render json: {errCode: num}
    else 
      render json: {errCode: 1, count: num}
    end
  end

  def login
    user = params[:user]
    password = params[:password]
    num = User.login(user, password)
    if num < 0
      render json: {errCode: num}
    else
      render json: {errCode: 1, count: num}
    end
  end

  def reset_fixture
    User.destroy_all
    render json: {errCode: 1}
  end

  def unit_tests
    output = `rspec #{Rails.root}/spec/`
    example = /(\d+) example/.match(output)[1]
    failures = /(\d+) failures/.match(output)[1]
    render json: {nrFailed: failures, output: output, totalTests: example}
  end

  # TESTS: ADD USER

  # # user name empty
  # # ERR_BAD_USERNAME
  # User.add("","password")

  # # user name > 128 character
  # # ERR_BAD_USERNAME
  # User.add("usernameijofwjoefjwifowjfowjiefojowejfoiwejiofjwoiafjwejfowajfwalfwaifjwlijefilwjfiawjijflwjffwefwefwefweafwefwefwafeawefawefafw9", "password")

  # # user name not unique
  # # ERR_USER_EXISTS
  # User.add("user1", "password")
  # User.add("user1", "repeat")

  # # password > 128 character
  # # ERR_BAD_PASSWORD
  # User.add("user2", "passwordijofwjoefjwifowjfowjiefojowejfoiwejiofjwoiafjwejfowajfwalfwaifjwlijefilwjfiawjijflwjffwefwefwefweafwefwefwafeawefawefafw9")

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


end
