describe Vote do
  describe "validations" do
    describe "value validation" do  
      it "only allows -1 or 1 as values" do
        expect( @validations ). to eq (true)
        expect( @value_validations ). to eq (1 || -1)

      end
    end
  end
end