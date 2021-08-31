require 'airport'

describe Airport do
  it {is_expected.to respond_to :land}
  it {is_expected.to respond_to :take_off}

  it 'can land a plane' do
    plane = Plane.new
    expect(subject.land(plane)) == "Plane has landed"
  end

  it 'a plane can take_off' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'raises error when trying to land when airport is full' do
    subject.land(Plane.new)
    subject.land(Plane.new)
    expect { subject.land(Plane.new) }.to raise_error "Airport is full" 
  end

  it 'raises error when trying to takeoff a non-existent plane' do
    expect { subject.take_off(Plane.new) }.to raise_error "Plane not at the airport!"
  end
end