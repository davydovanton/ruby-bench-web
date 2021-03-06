class BenchmarkRun < ActiveRecord::Base
  belongs_to :initiator, polymorphic: true
  belongs_to :benchmark_type

  validates :result, presence: true
  validates :environment, presence: true
  validates :initiator_id, presence: true
  validates :initiator_type, presence: true
  validates :benchmark_type_id, presence: true

  scope :initiators, ->(initiators_ids, initiator_type) do
    where(initiator_id: initiators_ids, initiator_type: initiator_type)
  end
end
