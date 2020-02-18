require 'bowling'
require 'pry'
require 'spec_helper'

### BOWLING RULES
#
#
# A game consists of 10 frames
# Each frame has two rolls to knock down 10 pins
#
# 10 pins knocked down on the first roll => STRIKE (X)
# 10 pins knocked down after second roll => SPARE  (/)
#
# Frame Scoring
# No strikes or spares: number of pins knocked down
# STRIKE: 10 + number of pins knocked down in next 2 rolls
# SPARE:  10 + number of pins knocked down in next roll
#
# If there is a STRIKE or SPARE in the final frame, the player gets bonus rolls.
# The bonus rolls only count toward the points of the Strike/Spare of the final frame
# STRIKE: 2 bonus rolls
# SPARE:  1 bonus roll
#

RSpec.describe '#total_score' do
  xit 'scores game with no strikes or spares' do
    scores = '23  23  23  23  23  23  23  23  23  23'
    # frames:  5,  5,  5,  5,  5,  5,  5,  5,  5,  5
    # total:   5, 10, 15, 20, 25, 30, 35, 40, 45, 50

    expect(Bowling.total_score(scores)).to eq(50)
  end

  xit 'scores game with spares' do
    scores = '2/  23  23  23  23  23  23  23  23  23'
    # frames: 12,  5,  5,  5,  5,  5,  5,  5,  5,  5
    # total:  12, 17, 22, 27, 32, 37, 42, 47, 52, 57

    expect(Bowling.total_score(scores)).to eq(57)
  end

  xit 'scores game with strikes' do
    scores =  'X  23  23  23  23  23  23  23  23  23'
    # frames: 15,  5,  5,  5,  5,  5,  5,  5,  5,  5
    # total:  15, 20, 25, 30, 35, 40, 45, 50, 55, 60

    expect(Bowling.total_score(scores)).to eq(60)
  end

  xit 'scores game with consecutive strikes' do
    scores =  'X   X   X  23  23  23  23  23  23  23'
    # frames: 30, 22, 15,  5,  5,  5,  5,  5,  5,  5
    # total:  30, 52, 67, 72, 77, 82, 87, 92, 97, 102

    expect(Bowling.total_score(scores)).to eq(102)
  end

  xit 'scores game with spare proceeding strike' do
    scores =  'X  2/  23  23  23  23  23  23  23  23'
    # frames: 15, 12,  5,  5,  5,  5,  5,  5,  5,  5
    # total:  20, 32, 37, 42, 47, 52, 57, 62, 67, 72

    expect(Bowling.total_score(scores)).to eq(72)
  end

  xit 'scores game with spare in tenth frame' do
    scores = '23  23  23  23  23  23  23  23  23  2/5'
    # frames:  5,  5,  5,  5,  5,  5,  5,  5,  5,  15
    # total:   5, 10, 15, 20, 25, 30, 35, 40, 45,  60

    expect(Bowling.total_score(scores)).to eq(60)
  end

  xit 'scores game with strike in tenth frame' do
    scores = '23  23  23  23  23  23  23  23  23  X53'
    # frames:  5,  5,  5,  5,  5,  5,  5,  5,  5,  18
    # total:   5, 10, 15, 20, 25, 30, 35, 40, 45,  63

    expect(Bowling.total_score(scores)).to eq(63)
  end
end


