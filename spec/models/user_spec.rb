require 'spec_helper'

describe User do
  describe "#new" do
    context "when initizalized" do
      it { should be_new_record }
      it { should respond_to(:email) }
    end
  end
end
