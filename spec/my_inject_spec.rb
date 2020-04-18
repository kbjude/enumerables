require './lib/enumerables'

RSpec.describe Enumerable do

    let(:data) {[3,4,5,6,4]}
    
    describe '#my_inject' do
        xcontext 'When block is not given' do

            xit 'when a number and a symbol are passed' do
                expect(data.my_inject( 5, :* )).to eql(data.inject(3600,:+))
            end

            it 'when a symbol is given' do
                expect(data.my_inject(:*)).to eql(1440)
            end
        end
        context 'When block is given' do

            it 'when items of the array arrat multiplied against each other' do
                expect(data.my_inject { |i| i * i }).to eql(43046721)
            end

            it 'when a number and a symbol are passed' do
                expect(data.my_inject{ | v, i| 5 * i }).to eql(20)
            end

            it 'returns all the items in a range' do
                expect((2..15).my_inject(:*)).to eql(1307674368000)
            end
        end
    end
end