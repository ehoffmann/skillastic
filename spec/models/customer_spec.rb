describe Customer do

  subject { build(:customer, first_name: 'John', last_name: 'Doe') }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:fullname) }
  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }

  it "#email is a string" do
    expect(subject.email).to match 'john.doe@test.com'
  end

  it "#fullname is a string" do
    expect(subject.fullname).to match 'John Doe'
  end

  it "#encrypted_password is a string" do
    expect(subject.encrypted_password).not_to be_empty
  end

end
