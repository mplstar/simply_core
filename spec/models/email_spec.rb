require 'spec_helper'

describe Email do
  fixtures :emails
  let(:email) { Email.new(email: "johndoe@gmail.com") }
  subject { email }

  it "should load proper fixture" do
    emails(:one).email.should == 'user01@gmail.com'
    emails(:two).email.should == 'user02@gmail.com'
  end

  describe "#new" do
    context "when initizalized" do
      it { should be_new_record }
      it { should respond_to(:email) }
      it { should respond_to(:token) }
    end
  end

  describe "#save" do
    context "when newly initilized" do
      its(:token) { should be_nil }
    end
    context "when saved to db" do
      before { email.save }
      its(:token) { should_not be_nil }
      after { email.destroy }
    end
  end

end
