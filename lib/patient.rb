require_relative './doctor.rb'
require_relative './appointment.rb'
require 'pry'

class Patient
    attr_accessor :name, :date
    @@all = []

    def initialize (name)
        @name = name
        self.class.all << self
    end

    def appointments
        Appointment.all.select do |appointments|
            appointments.patient == self
        end
    end

    def new_appointment (doctor, date)
        Appointment.new(date, self, doctor)
    end

    def doctors
        doctors = []
        self.appointments.each do |appointment|
            # binding.pry
            doctors << appointment.doctor
        end
        return doctors
    end

    def self.all
        @@all
    end
end