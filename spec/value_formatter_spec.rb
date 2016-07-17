describe Brainshell::ValueFormatter do

  let(:dummy) { Class.new { include Brainshell::ValueFormatter }.new }

  it 'formats array values' do
    result = dummy.format_value([1, 2, 3])
    expect(result).to eql('1,2,3')
  end

end