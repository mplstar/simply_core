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
    context "when email is invalid" do
      it "should have error on email" do
        email.email = "abc"
        email.save
        expect(email.errors.get(:email)).to eq(["invalid format"])
      end
    end
    context "when email is valid" do
      it "should have no error on email" do
        email.email = "abc@gmail.com"
        email.save
        expect(email.errors.get(:email)).to be_nil
      end
    end
  end

end
