require 'rails_helper' 

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        @vote = Vote.create(value: 1)
        expect(@vote.valid?).to eq(true)
        @vote = Vote.create(value: -1)
        expect(@vote.valid?).to eq(true)
        @vote = Vote.create(value: 2)
        expect(@vote.valid?).to eq(false)
      end
    end
  end
  
   describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save       
     end
   end
  
end