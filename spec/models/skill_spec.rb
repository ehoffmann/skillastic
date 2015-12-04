describe Skill do

  subject { build(:skill, name: "Cooking") }
  it { should respond_to(:name) }

  it "#name is a string" do
    expect(subject.name).to match 'Cooking'
  end
end
