# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :user_events
  has_many :attended_events, through: :user_events, source: :event
end
