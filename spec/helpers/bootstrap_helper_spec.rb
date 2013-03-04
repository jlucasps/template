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
      <div class="alert alert-block alert-info">
        <a class="close" data-dismiss="alert" href="#"><i class="icon-large icon-remove-circle"></i></a>
        <div id="error_explanation">
          <p class="alert-heading">
            <b>Info</b>
          </p>
          <ul>Hey, this is an info message!</ul>
        </div>
      </div>
    HTML
    helper.bootstrap_alert(t('info'), "Hey, this is an info message!", 'alert-info').should == message
  end

  it "asserts bootstrap success flash message" do
    flash[:success] = "Hey, this is an success message!"
    message = <<-HTML
      <div class="alert alert-block alert-success">
        <a class="close" data-dismiss="alert" href="#"><i class="icon-large icon-remove-circle"></i></a>
        <div id="error_explanation">
          <p class="alert-heading">
            <b>Success</b>
          </p>
          <ul>Hey, this is an success message!</ul>
        </div>
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end

  it "asserts bootstrap error flash message" do
    flash[:error] = "Hey, this is an error message!"
    message = <<-HTML
      <div class="alert alert-block alert-error">
        <a class="close" data-dismiss="alert" href="#"><i class="icon-large icon-remove-circle"></i></a>
        <div id="error_explanation">
          <p class="alert-heading">
            <b>Error</b>
          </p>
          <ul>Hey, this is an error message!</ul>
        </div>
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end

  it "asserts bootstrap alert flash message" do
    flash[:alert] = "Hey, this is an alert message!"
    message = <<-HTML
      <div class="alert alert-block ">
        <a class="close" data-dismiss="alert" href="#"><i class="icon-large icon-remove-circle"></i></a>
        <div id="error_explanation">
          <p class="alert-heading">
            <b>Attention</b>
          </p>
          <ul>Hey, this is an alert message!</ul>
        </div>
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end

  it "asserts bootstrap notice flash message" do
    flash[:notice] = "Hey, this is an notice message!"
    message = <<-HTML
      <div class="alert alert-block alert-info">
        <a class="close" data-dismiss="alert" href="#"><i class="icon-large icon-remove-circle"></i></a>
        <div id="error_explanation">
          <p class="alert-heading">
            <b>Info</b>
          </p>
          <ul>Hey, this is an notice message!</ul>
        </div>
      </div>
    HTML
    helper.bootstrap_flash.should == message
  end


end
