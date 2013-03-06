require 'spec_helper'
require 'haml'

describe BootstrapHelper do
  before :each do
    helper.extend Haml
    helper.extend Haml::Helpers
    helper.send :init_haml_helpers
  end

  it "creates an alert message using Twitter Bootstrap layout" do
    message = <<-HTML
      <div class="alert alert-info">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Info</strong> Hey, this is an info message!
      </div>
    HTML
    helper.bootstrap_alert(t('info'), "Hey, this is an info message!", 'alert-info').should == message
  end

  it "asserts bootstrap success flash message" do
    flash[:success] = "Hey, this is an success message!"
    message = <<-HTML
      <div class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Success</strong> Hey, this is an success message!
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end

  it "asserts bootstrap error flash message" do
    flash[:error] = "Hey, this is an error message!"
    message = <<-HTML
      <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Error</strong> Hey, this is an error message!
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end

  it "asserts bootstrap alert flash message" do
    flash[:alert] = "Hey, this is an alert message!"
    message = <<-HTML
      <div class="alert ">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Attention</strong> Hey, this is an alert message!
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end

  it "asserts bootstrap notice flash message" do
    flash[:notice] = "Hey, this is an notice message!"
    message = <<-HTML
      <div class="alert alert-info">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>Info</strong> Hey, this is an notice message!
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end


end
