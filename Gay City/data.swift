//
//  data.swift
//  Gay City
//
//  Created by Ian Fahning on 4/14/21.
//

import Foundation
//
// MARK: - Section Data Structure
//
public struct Item {
    public var name: String           //title text of the item
    public var detail: String         //sub header under the title
    public var imageName: String      //image name that will add it under the title
    public var viewIdentifier: String //tapping on the cell will transition to the view with the viewIdentifier, if ""                                 then nothing will happen
    
    
    public init(name: String, detail: String, viewIdentifier: String) {
        self.name = name
        self.detail = detail
        self.imageName = ""
        self.viewIdentifier = viewIdentifier
    }
    
    public init(name: String, detail: String, imageName: String, viewIdentifier: String) {
        self.name = name
        self.detail = detail
        self.imageName = imageName
        self.viewIdentifier = viewIdentifier
    }
}

public struct Section {
    public var name: String
    public var items: [Item]
    public var viewIdentifier: String
    
    public init(name: String, items: [Item], viewIdentifier: String) {
        self.name = name
        self.items = items
        self.viewIdentifier = viewIdentifier
    }
}

public var menuData: [Section] = [
    Section(name: "Home", items: [
    ],viewIdentifier: "home"),
    Section(name: "Health", items: [
        Item(name: "Make an Appointment", detail: "", viewIdentifier: "appointment"),
        Item(name: "Get Test Results", detail: "", viewIdentifier: "results"),
        Item(name: "Health Care Enrollment", detail: "",viewIdentifier: "healthCare"),
        Item(name: "PrEP", detail: "",viewIdentifier: "prep")
    ],viewIdentifier: ""),
    Section(name: "Resources", items: [
        Item(name: "Resources Database", detail: "", viewIdentifier: "database"),
        Item(name: "ORCA LIFT", detail: "",viewIdentifier: "orca"),
        Item(name: "Outreach", detail: "",viewIdentifier: "outreach"),
        Item(name: "Technical Training", detail: "",viewIdentifier: "training"),
        Item(name: "Queer Community Conversations", detail: "",viewIdentifier: "qcc")
    ],viewIdentifier: ""),
    Section(name: "Get Involved", items: [
        Item(name: "Volunteer", detail: "",viewIdentifier: "volunteer"),
        Item(name: "Vote For Visibility", detail: "", viewIdentifier: "vote"),
        Item(name: "Ways to Give", detail: "",viewIdentifier: "give")
    ],viewIdentifier: ""),
    Section(name: "Connect with Us", items: [
    ],viewIdentifier: "connect")
]


public var testResualtsData: [Section] = [
    Section(name: "First-Time Login", items: [
        Item(name: "", detail: "During your appointment, provide your tester with your email address and you will receive a passcode and temporary password.\n\n•Username: Your email address\n•Temporary Password: Provided by tester\n•Passcode: Please use to reset your password by phone", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Logging In", items: [
        Item(name: "", detail: "",imageName: "entry", viewIdentifier: ""),
        Item(name: "First Time User\n\nEnter your Username (email address)and the temporary password. Select the Sign In button. You will be asked to reset your password after logging in.\n\nReturning User\n\nEnter your Username (email address) and password. Select the Sign In button.\n\n*Always use a secure password to ensure the confidentiality of your medical records. Please also remember to sign out of your account, especially if you are on a public or shared device.", detail: "", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Forgot Password or ID", items: [
        Item(name: "If you ever forget your password, select “Forgot my Password”.", detail: "", viewIdentifier: ""),
        Item(name: "", detail: "",imageName: "forgot_password_red_box", viewIdentifier: ""),
        Item(name: "On the next screen, please complete these four fields:", detail: "", viewIdentifier: ""),
        Item(name: "", detail: "",imageName: "i_forgot_my_password", viewIdentifier: ""),
        Item(name: "•User Name: Should be the same as your email.\n•Email\n•Date of Birth you gave to the Tester\n•Zip Code you gave to Gay City during Registration.", detail: "", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Selecting My Messages", items: [
        Item(name: "Your Patient portal will include options to see the dashboard and messages from your Gay City tester.", detail: "",viewIdentifier: ""),
        Item(name: "", detail: "",imageName: "messages_one", viewIdentifier: ""),
        Item(name: "To check your results, select Messages, and select the blue document link to download your test results.", detail: "",viewIdentifier: ""),
        Item(name: "", detail: "",imageName: "messages_two", viewIdentifier: ""),
        Item(name: "You will receive a separate message for every location on your body where specimens were collected and tested (e.g. throat, back hole/rectum, front hole/vagina, blood).", detail: "",viewIdentifier: ""),
        Item(name: "", detail: "",imageName: "messages_three", viewIdentifier: ""),
        Item(name: "Keep good track of your results. Do not save the result on a public or shared device.\n\nPlease note: Testers will not respond to messages sent through the Patient Portal. If you have any inquiries about your results, please call 206-860-6969  x718 or email testing@gaycity.org.", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "View Prior Results", items: [
        Item(name: "In your Patient Portal, select “Forms/Documents”. You can then view all prior results and client documents (e.g. patient forms, messages).", detail: "",viewIdentifier: ""),
        Item(name: "", detail: "",imageName: "prior", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "How to Read Your Results", items: [
        Item(name: "Please note that Gay City generally will not release inconclusive results, nor will we release reactive/positive results without first connecting with clients.\n\nIn the Observation Identifier (i.e. test type), the keywords to look for on your results are:\n\n•Positive/reactive: Tested positive\n•Negative/nonreactive: Tested negative\n\nTest Types\n\nObservation Identifier     Screens For\nRPR (Rapid Plasma Reagin)    Syphilis\nNeisseria Gonorrhoeae    Gonorrhea\nChlamydia Trachomatis    Chlamydia\nHIV    Human Immunodeficiency Virus\n\nBelow is an example of where to view these identifiers on your HIV/STI testing results:", detail: "",viewIdentifier: ""),
        Item(name: "", detail: "",imageName: "interpreting_your_test_results", viewIdentifier: ""),
        Item(name: "In the test above, the HIV test indicates a negative result. For the RPR Qualitative (Syphilis), the STI test result is nonreactive (or negative).\n\nIf you have questions about your test results, please contact us at 206-860-6969 x718 or email us at testing@gaycity.org.", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Sending Results to Physician", items: [
        Item(name: "Gay City will fax your testing results to any physician with your approval. Please visit our Wellness Center to complete the proper documentation with a Wellness Center representative.\n\nDocumentation will need to be completed prior to each request to send results to a physician.", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "More Questions", items: [
        Item(name: "If you have additional questions about the Patient Portal/results, please contact us at 206-860-6969 x718 or email us at testing@gaycity.org.", detail: "",viewIdentifier: "")
    ],viewIdentifier: "")
]

public var HealthcareData: [Section] = [
    Section(name: "Types of Health Plans", items: [
        Item(name: "We enroll individuals in the following plans based on their eligibility:\n•Apple Health (Medicaid)\n•Qualified Health Plans (Private Care)", detail: "", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Eligibility", items: [
        Item(name: "To be eligible to enroll in health coverage, you:\n\n•Must live in the United States*\n•Must be a U.S. citizen or national** (or be lawfully present)***\n•Can’t be incarcerated\n•Have a qualifying event (if outside of special enrollment period)\n\n*Must be considered a “resident” of the United States for tax purposes. Generally, health insurance covers health care provided by doctors, hospitals, and other providers within the United States. If you’re living abroad, it’s important to know this before you consider signing up for insurance.\n\n**A U.S. national is someone who’s a U.S. citizen or a person who isn’t a U.S. citizen but owes permanent allegiance to the U.S. With extremely limited exception by which he or she is entitled to be protected, all non-citizen U.S. nationals are people born in American Samoa or abroad with one or more American Samoan parents under certain conditions.\n\n***Immigrants with the following statuses qualify:\n\n•Lawful Permanent Resident (LPR/Green Card holder)\n•Asylee\n•Refugee\n•Cuban/Haitian Entrant\n•Paroled into the U.S.\n•Conditional Entrant Granted before 1980\n•Battered Spouse, Child and Parent\n•Victim of Trafficking and his/her Spouse, Child, Sibling or Parent\n•Granted Withholding of Deportation or Withholding of Removal, under the immigration laws or under the Convention against Torture (CAT)\n•Individual with Non-immigrant Status, includes worker visas (such as H1, H-2A, H-2B), student visas, U-visa, T-visa, and other visas, and citizens of Micronesia, the Marshall Islands, and Palau\n•Temporary Protected Status (TPS)\n•Deferred Enforced Departure (DED)\n•Deferred Action Status (Exception: Deferred Action for Childhood Arrivals (DACA) is not an eligible immigration status for applying for health insurance)\n•Lawful Temporary Resident\n•Administrative order staying removal issued by the Department of Homeland Security\n•Member of a federally-recognized Indian tribe or American Indian Born in Canada\n•Resident of American Samoa\n\nApplicants for any of these statuses qualify:\n\n•Temporary Protected Status with Employment Authorization\n•Special Immigrant Juvenile Status\n•Victim of Trafficking Visa\n•Adjustment to LPR Status\n•Asylum (see note below)\n•Withholding of Deportation, or Withholding of Removal, under the immigration laws or under the Convention against Torture (CAT): Applicants for asylum are eligible for coverage only if they’ve been granted employment authorization or are under the age of 14 and have had an application pending for at least 180 days.\n\nPeople with the following statuses and who have employment authorization qualify:\n\n•Registry Applicants\n•Order of Supervision\n•Applicant for Cancellation of Removal or Suspension of Deportation\n•Applicant for Legalization under Immigration Reform and Control Act (IRCA)\n•Legalization under the LIFE Act\n\nRemember: Information about immigration status will be used only to determine eligibility for coverage and not for immigration enforcement.", detail: "", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Qualifying Events", items: [
        Item(name: "You may be eligible to enroll outside of open enrollment only if you have a qualifying life event. Meet with our affirming navigators today to find the best options for you.\n\nQualifying Event Examples\n\n•Experience a decrease in income\n•Loss of other coverage\n•Getting married\n•Deceased person on coverage\n•Child Birth\n•Eligible for subsidies (tax credits and/or cost-sharing reductions)\n•Had Minimum Essential Coverage for at least 1 day during the 60 days prior to\n•income change^\n\n^Customers must report this qualifying life event within 60 days of newly gaining tax credit eligibility.", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Canceling a Plan", items: [
        Item(name: "Our health navigators will help you cancel your plan.\n\nEnsure you are eligible for your employer’s health coverage at this time of the year and confirm your enrollment.\n\nPlease note: If you end all health coverage (both your insurance plan and employer-provided health insurance) and don’t replace it, the government may require you to pay a fee.", detail: "",viewIdentifier: "")
    ],viewIdentifier: "")
]

public var giveData: [Section] = [
    Section(name: "Mail a Check", items: [
        Item(name: "Mail a donation check to us through the following address:\nGay City: Seattle’s LGBTQ Center\nATTN: Development Department\n517 E. Pike St.\nSeattle, WA 98122", detail: "", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Planned Giving(Bequests & Stocks)", items: [
        Item(name: "Support our work for LGBTQ communities while also fulfilling your own financial goals and objectives. For more information, contact Director of Development Bekah Telew.", detail: "", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Host a Fundraiser", items: [
        Item(name: "We have all the tools and tips to help you host a fabulous fundraiser. For more details, contact us.", detail: "", viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Workplace Giving", items: [
        Item(name: "Did you know that you can donate to Gay City seamlessly through payroll deductions? Since companies often match employee contributions, workplace giving provides you with the opportunity to directly influence your company’s philanthropic endeavors.\n\nContact your Human Resources team today.", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Gifts-in-Kind", items: [
        Item(name: "Do you have a business you’d like to promote? Consider an in-kind donation to Gay City, it’s tax-deductible and a great way to show off your goods to Gay City supporters. For more information, contact Director of Development Bekah Telew.", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Gifts-in-Kind", items: [
        Item(name: "Amazon Smile is a quick and automated way for you to support your favorite charitable organization every time you shop, at no cost to you. Select Gay City as a charitable recipient through smile.amazon.com, and Amazon will donate a portion of the funds they receive from your purchase.", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "AmazonSmile", items: [
        Item(name: "Volunteer", detail: "",viewIdentifier: "")
    ],viewIdentifier: ""),
    Section(name: "Kroger Co. Family of Stores", items: [
        Item(name: "Kroger and its family of stores, like Fred Meyer, donate more than $2 million per year to non-profits across the Pacific Northwest with recommendations from their customers. Sign up for the Community Rewards program and link your Fred Meyer Rewards Card to Gay City Health Project (QI274) at fredmeyer.com/communityrewards. Every time you shop, Fred Meyer will donate a portion of its proceeds back to Seattle’s only LGBTQ center. For details about other Kroger stores", detail: "",viewIdentifier: "")
    ],viewIdentifier: "")
]

