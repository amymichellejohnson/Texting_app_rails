require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039256735')
    expect(message.save).to eq(false)
  end
  
  it "adds and error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039256735')
    message.save
    expect(message.errors.messages[:base]).to eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
