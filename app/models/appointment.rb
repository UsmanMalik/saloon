class Appointment < ActiveRecord::Base
	belongs_to :user

	enum status: [:pending, :approved, :declined]


	scope :appointments_today, -> { where(:appointment_date => (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)) }

	def trigger_appointment_notification

		require 'gcm'
		gcm = GCM.new("AIzaSyDIc9bME_zfUNbKa045xe21sIa6dmFjSC0")
		# you can set option parameters in here
		#  - all options are pass to HTTParty method arguments
		#  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L29-L60
		#  gcm = GCM.new("my_api_key", timeout: 3)

		registration_ids= ["APA91bHfQ6-QbEtcKGCT_eR8XHJ7WQe_mfvGvHIG1qbmEtYD5tD_kKkZvW8NNegqlnO35ZMh3lpyQQxoaplOeCkAAwdEHAtsMd_IGUGrTkYjCBiF0ZUXTAtl2fPGfcEU6Hf8knFMMq04oQIXmu15WMyl_Etm-1PNfg", "13"] # an array of one or more client registration tokens
		options = {data: {score: "123"}, collapse_key: "updated_score"}
		response = gcm.send(registration_ids, options)
		
	end

	def self.schedule_appointments
		require 'gcm'
		gcm = GCM.new("AIzaSyDIc9bME_zfUNbKa045xe21sIa6dmFjSC0")


		today_appointments = Appointment.all.appointments_today
		reg_keys = []

		today_appointments.each do |appointment|

			appointment_hour = 	appointment.appointment_time.hour

			if appointment_hour == (Time.now.hour + 2)
				# puts "Going to send a trigger"

				if !appointment.user.nil?
					if !appointment.user.device.nil?
						reg_keys << appointment.user.device.key
					end
				end
			end
		end

		options = {data: {score: "Your Appointment is coming up!"}, collapse_key: "updated_score"}
		response = gcm.send(reg_keys, options)

	end


	def appointment_status(status)
		
		require 'gcm'
		gcm = GCM.new("AIzaSyDIc9bME_zfUNbKa045xe21sIa6dmFjSC0")

		if status == :approved
			approved_appointment = "Your Appointment is approved for #{self.appointment_date}  at #{self.appointment_time} . See you then!"
			# puts "approved_appointment: " + approved_appointment
			options = {data: {operation_key: :operation_approved_appointment, approved_appointment: approved_appointment }}
		elsif status == :declined
			declined_appointment = "Your Appointment is declined by the admin for #{self.appointment_date} , #{self.appointment_time} ."
			# puts "declined_appointment: " + declined_appointment
			options = {data: {operation_key: :operation_decline_appointment, declined_appointment: declined_appointment }}
		end
		
		if !self.user.device.nil?
			response = gcm.send(self.user.device.key.split(","), options)
			return "user has been notified."
		else
			return "user will be notified shortly."
		end

		# puts "#{self.user.device.key}  ||||| Response: #{response}"
		
	end
end
