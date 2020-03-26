User.create!(name: "Joey Ramone", email: "joey@ramones.com", password: "ramones", password_confirmation: "ramones", admin: true)
User.create!(name: "Johnny Ramone", email: "johnny@ramones.com", password: "ramones", password_confirmation: "ramones")

measures = ['Left bicep', 'Right bicep', 'Waist', 'Hips', 'Left thigh', 'Right thigh']

measures.each do |measure|
  Measure.create!(name: measure)
end