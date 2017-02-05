class Division < ActiveRecord::Base
	has_many :staff_divisions

	enum main: ["Aromatherapy treatment","Magnolia Hair Treatments","Alfarparf : Intensive hair treatment","Aloe & Protein moisture infusion treatments","Hair Loss Treatment",:hair, :facial, :message, 'Full Body Wax']

	enum for: [:male, :female]

	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def avatar_url_medium
		avatar.url(:medium)
	end

	def avatar_url_thumb
		avatar.url(:thumb)
	end

	def avatar_url_original
		avatar.url()
	end

	def self.trigger_divisions
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

end
