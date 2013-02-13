require 'spec_helper'
  describe Assignment do
    
    it { should validate_presence_of(:title) }
    
    before { @assignment = Assignment.new(:title => "Example Assignment") }
    subject { @assignment }
    

end