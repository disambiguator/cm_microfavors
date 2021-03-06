# frozen_string_literal: true

feature 'Jobseeker interactions' do
  FILE_PATH = File.absolute_path('./spec/features/materials.pdf')

  before do
    visit root_path
    expect(page).to have_content 'Need help in a hurry with your job search?'
  end

  scenario 'getting resume feedback' do
    name = Faker::Name.name
    email = Faker::Internet.email

    click_on 'Resume Feedback'
    expect(page).to have_content 'Resume Help'

    click_get_help

    expect(page).to have_content 'Provide Your Resume'

    fill_in 'Name', with: name
    fill_in 'Email', with: email

    attach_file('Resume', FILE_PATH)

    click_submit

    resume_evaluation = ResumeEvaluation.find_by_name(name)

    visit resume_evaluation_path(resume_evaluation.id)

    expect(page).to have_content 'Microfavors Request'
    expect(page).to have_content "Name: #{resume_evaluation.name}"
  end

  scenario 'cover letter feedback' do
    name = Faker::Name.name
    email = Faker::Internet.email

    click_on 'Cover Letter Feedback'
    expect(page).to have_content 'Cover Letter Help'

    click_get_help

    expect(page).to have_content 'Provide Your Cover Letter'

    fill_in 'Name', with: name
    fill_in 'Email', with: email

    attach_file('Cover letter', FILE_PATH)

    click_submit

    cover_letter_evaluation = CoverLetterEvaluation.find_by_name(name)

    visit cover_letter_evaluation_path(cover_letter_evaluation.id)

    expect(page).to have_content 'Microfavors Request'
    expect(page).to have_content "Name: #{cover_letter_evaluation.name}"
  end

  scenario 'am i qualified' do
    name = Faker::Name.name
    email = Faker::Internet.email
    job_posting = Faker::Internet.url

    click_on 'Evaluate Job Qualifications'
    expect(page).to have_content 'Job Qualifications Help'

    click_get_help

    expect(page).to have_content 'Provide Your Resume and Desired Job'

    fill_in 'Name', with: name
    fill_in 'Email', with: email
    fill_in 'Job posting', with: job_posting

    attach_file('Resume', FILE_PATH)

    click_submit

    qualification_evaluation = QualificationEvaluation.find_by_name(name)

    visit qualification_evaluation_path(qualification_evaluation.id)

    expect(page).to have_content 'Microfavors Request'
    expect(page).to have_content "Name: #{qualification_evaluation.name}"
  end

  private

  def click_get_help
    click_on 'Get Help'
  end

  def click_submit
    click_on 'Submit'

    expect(page).to have_content 'What Happens Next'
  end
end
