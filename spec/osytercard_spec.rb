require 'oystercard'

describe Oystercard do

  it { is_expected.to respond_to :top_up }

  it "has a balance of zero" do
    expect(subject.balance).to eq(0)
  end

  it 'increases the balance' do
    subject
    expect { subject.top_up(7) }.to change {subject.balance }.from(0).to(subject.balance+7)
  end

end
