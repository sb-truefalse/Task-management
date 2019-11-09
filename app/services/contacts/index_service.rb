class ContactsIndexService
  EMAIL = 'contacts@mail.com'
  PHONE = '+7999999999'
  def call(params = nil)
    Contact.new.tap do |contact|
      contact.email = EMAIL
      contact.phone = PHONE
    end
  end
end
