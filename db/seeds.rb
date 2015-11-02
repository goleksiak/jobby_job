# Admin user
admin = User.create(email: 'user@example.com', password: 'password', admin: true)

# Job
Job.create(title: 'Engineer', description: 'Work on Rails')
