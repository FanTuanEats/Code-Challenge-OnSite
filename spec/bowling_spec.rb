require 'spec_helper'
require 'pry'

def score(scores)

end

RSpec.describe '#score' do
  it 'scores basic game with no strikes or spares' do
    scores = '55 55 55 55 55 55 55 55 55 55'
    expect(score(scores)).to eq(100)
  end
end


