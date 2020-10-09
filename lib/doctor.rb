require_relative './patient.rb'
require_relative './appointment.rb'
require 'pry'

class Doctor
    attr_accessor :name
    @@all = []

    def initialize (name)
        @name = name
        self.class.all << self
    end

    def appointments
        Appointment.all.select do |appointments|
            appointments.doctor == self
        end
    end

    def new_appointment (patient, date)
        Appointment.new(date, patient, self)
    end

    def patients
        patients = []
        self.appointments.each do |appointment|
            # binding.pry
            patients << appointment.patient
        end
        return patients
    end

    def self.all
        @@all
    end

end