# This module add functionality to give a better aasm control to client apps
module Stateable
  extend ActiveSupport::Concern

  included do
    alias_attribute :aasm_field, :aasm_state
    alias_attribute :human_aasm_field, :human_state

    def self.reject_events
      []
    end

    def can_run_event? event
      self.aasm.events.map(&:name).include?(event.try(:to_sym))
    end
  
    def human_state
      self.aasm.human_state
    end
  
    # Shows all possible events for the current state
    def possible_events
      self.aasm.events.map do |event|
        {
          label: self.class.aasm.human_event_name(event.name),
          name: event.name,
          type: self.class.reject_events.include?(event.name) ? 'secondary' : 'primary'
        }
      end.sort_by do |event|
        self.class.reject_events.include?(event[:name]) ? 1 : 0
      end
    end
    
  end
end