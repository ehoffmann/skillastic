describe Worker do

  subject { build(:worker, first_name: 'John',) }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:fullname) }
  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }

  it "#fullname match a string" do
    expect(subject.fullname).to match 'John Doe'
  end

  it "#encrypted_password is not empty" do
    expect(subject.encrypted_password).not_to be_empty
  end
end
