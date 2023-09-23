class IpModel {
  static var ipDataList = [
    {"Department": "HRM Division ", "IpNumber": "345, 456"},
    {
      "Department": "IT Division ",
      "IpNumber": "254, 270, 274, 278, 290, 610, 662"
    },
    {"Department": "AC ", "IpNumber": "497"},
    {"Department": "AOF ", "IpNumber": "247, 395, 398, 451"},
    {"Department": "AMLD ", "IpNumber": "640, 641"},
    {"Department": "BACH (ID) ", "IpNumber": "633, 634"},
    {"Department": "BACH & BEFTN", "IpNumber": "631, 634"},
    {
      "Department":
          "BACH (Credit Failure) (Cheque Honored but CBS Failed Due to Account Dormant/Blocked)",
      "IpNumber": "428"
    },
    {"Department": "Banking Certificate", "IpNumber": "275"},
    {
      "Department": "BF Teller/Finastra ",
      "IpNumber": "270, 297, 215, 538, 665"
    },
    {"Department": "BFIU, CTR ", "IpNumber": "639-642"},
    {"Department": "bKash Issues ", "IpNumber": "508"},
    {"Department": "Card Division/Card Courier ", "IpNumber": "284"},
    {"Department": "Card IT ", "IpNumber": "284, 505, 502, 506, 514, 589"},
    {"Department": "Card ID Pass ", "IpNumber": "538"},
    {"Department": "Cash Remittance Issue ", "IpNumber": "662"},
    {"Department": "Cheque Book ", "IpNumber": "665, 552 , 366, 542"},
    {"Department": "CES ", "IpNumber": "398, 274, 538"},
    {"Department": "CES Branch Change ", "IpNumber": "516, 505, 451, 399"},
    {"Department": "CES (Static Data Update) ", "IpNumber": "365"},
    {"Department": "Clearing ", "IpNumber": "633, 634"},
    {"Department": "Currency Management Dept. ", "IpNumber": "371, 663"},
    {"Department": "Cybersecurity Incident ", "IpNumber": "555"},
    {"Department": "Courier Related Issue ", "IpNumber": "284"},
    {
      "Department": "Centralized Customer Service ",
      "IpNumber": "542, 543, 523, 506 "
    },
    {"Department": "Data Processing & IT Mgt. ", "IpNumber": "299"},
    {"Department": "DMS ", "IpNumber": "571, 573, 574, 654"},
    {"Department": "Dhaka Guard ", "IpNumber": "347"},
    {"Department": "Dormant Acc. ", "IpNumber": "366, 687"},
    {"Department": "Desktop Support ", "IpNumber": "253, 278, 680, 527, 386"},
    {"Department": "Email/Outlook/Login Problem ", "IpNumber": "299, 458 "},
    {"Department": "eKYC ", "IpNumber": "247 ,451"},
    {"Department": "E Approval ", "IpNumber": "538"},
    {"Department": "ERP ", "IpNumber": "253, 538, 329, 604"},
    {"Department": "Finance & Accounts Division ", "IpNumber": "446, 379"},
    {"Department": "Fusion Core Banking ", "IpNumber": "231, 516, 999096"},
    {"Department": "FB Party Related Issue ", "IpNumber": "247"},
    {"Department": "GB OPS ", "IpNumber": "538, 558"},
    {"Department": "Hardware Requisition Enquiry ", "IpNumber": "253"},
    {"Department": "Hardware Req. (After Approval) ", "IpNumber": "685"},
    {"Department": "Hardware ", "IpNumber": "274, 278"},
    {"Department": "Interior ", "IpNumber": "650"},
    {"Department": "IP Phone Problem ", "IpNumber": "1621562352"},
    {"Department": "ISS Report ", "IpNumber": "375, 486, 487"},
    {
      "Department":
          "Leads (Farjana Akter Biva, Supervisor, Sales Lead Monitoring) ",
      "IpNumber": "841"
    },
    {"Department": "Logistic ", "IpNumber": "617, 657, 648"},
    {
      "Department": "MYSIS Related Problem ",
      "IpNumber": "252, 297, 215, 358, 665, 999000"
    },
    {"Department": "MISYS Lock/Unlock ", "IpNumber": "538"},
    {"Department": "Network Related Problem ", "IpNumber": "517, 510, 540"},
    {"Department": "NID ", "IpNumber": "572"},
    {"Department": "Orbit (HRM) ", "IpNumber": "133"},
    {"Department": "Operations Support ", "IpNumber": "367, 538, 665"},
    {"Department": "Printer/UPS Problem ", "IpNumber": " 252, 297"},
    {"Department": "PC & Related Items Requisition ", "IpNumber": "253 , 386 "},
    {"Department": "Pool Acc. ", "IpNumber": "199"},
    {"Department": "Reconcilation Dept. ", "IpNumber": "528"},
    {"Department": "RTGS ", "IpNumber": "138"},
    {"Department": "Remittance ", "IpNumber": "144, 149, 413, 01713257896"},
    {"Department": "Sigue ", "IpNumber": "144"},
    {"Department": "Safety & Security ", "IpNumber": "684"},
    {"Department": "SigCap ", "IpNumber": "570"},
    {"Department": "Stationary ", "IpNumber": "602 , 608"},
    {"Department": "Vehicle Support Issue ", "IpNumber": "316"},
    {"Department": "WesternUnion Password ", "IpNumber": "149"},
    {"Department": "LO SUPPORT TEAM", "IpNumber": "204, 205, 350, 520"},
    {"Department": "New e-KYC Support Team", "IpNumber": "398,552,451,398"},
    {"Department": "e-KYC SUPPORT TEAM", "IpNumber": "523,451,398"},
    {"Department": "Operation Support ", "IpNumber": "538,665"},
    {"Department": "BACH   ", "IpNumber": "634"},
    {"Department": " BEFTN / BACH Scanner Problem   ", "IpNumber": "633"},
    {"Department": "RTGS   ", "IpNumber": "140,141"},
    {"Department": " Remittance  ", "IpNumber": "149"},
    {"Department": "Western Union   ", "IpNumber": "144"},
    {"Department": "IT Division   ", "IpNumber": "215,999,000"},
    {"Department": "Domain ", "IpNumber": "253"},
    {"Department": "Hardware  ", "IpNumber": "274,278,680"},
    {"Department": " PC Realted   ", "IpNumber": "527"},
    {"Department": " Net Problem   ", "IpNumber": "290,295"},
    {"Department": " Bkash  ", "IpNumber": "502,589"},
    {"Department": " MYSIS Printer   ", "IpNumber": "252, 297"},
    {"Department": "E-mail Password  ", "IpNumber": "299"},
    {"Department": " Software Update ", "IpNumber": "253,274,278,680"},
    {"Department": " TADA   ", "IpNumber": "226,220"},
    {"Department": "E-Leave", "IpNumber": "227"},
    {"Department": "LFA   ", "IpNumber": "133"},
    {"Department": " DMS   ", "IpNumber": "571"},
    {"Department": "NID Verification   ", "IpNumber": "572"},
    {"Department": " Sig Cap ", "IpNumber": "573"},
    {"Department": "Cheque Book  ", "IpNumber": "552"},
    {"Department": " E-kyc / Customer Experience ", "IpNumber": "398,451"},
    {"Department": " Debit Card  ", "IpNumber": "506,589"},
    {"Department": " PIN  ", "IpNumber": "284"},
    {"Department": " Retail Division   ", "IpNumber": "466"},
    {"Department": "Service & Estate Division   ", "IpNumber": "648,649"},
    {"Department": "Stationery  ", "IpNumber": "608"},
    {"Department": " Visiting Card   ", "IpNumber": "526, 648"},
    {"Department": "FAD  ", "IpNumber": " 190, 197,380 , 446"},
    {"Department": "AMLD   ", "IpNumber": "640, 641, 655, 643"},
    {"Department": "Card Delivery   ", "IpNumber": "284"},
    {"Department": "Safety & Security   ", "IpNumber": "372, 675"},
    {"Department": " CC TV & Branding   ", "IpNumber": "236"},
    {
      "Department": " CC TV Problem ",
      "IpNumber": " 690, 617,641, 01978018772/01713426914"
    },
    {"Department": " GB Ops   ", "IpNumber": "383"},
    {"Department": " Party Problem   ", "IpNumber": "669"},
    {"Department": " Procurement Department   ", "IpNumber": "685"},
    {"Department": " Maintenance (Door/Window/Gate)  ", "IpNumber": "493"},
    {"Department": "CIB ", "IpNumber": "176"},
    {
      "Department": "For remittance fund/Cash Incentive or any other issue: ",
      "IpNumber": " 144,    149,    413"
    },
    {
      "Department": "For User ID/Password related issue: ",
      "IpNumber": "538,    247,    665,    391,    367"
    },
    {
      "Department": "For network related issue:         ",
      "IpNumber": " 510,   517,   294,   540,   566"
    },
    {"Department": "Document Upload for CASA", "IpNumber": "571"},
    {"Department": "SP/ Bond Encashment", "IpNumber": "557"},
    {"Department": "Withdraw Debit Transaction Restriction", "IpNumber": "574"},
    {"Department": "Signature Card Upload", "IpNumber": "570"},
    {"Department": "PO Management", "IpNumber": "552"},
    {"Department": "SP/ Bond Issuance", "IpNumber": "556"},
    {"Department": "SP/ Bond Encashment", "IpNumber": "557"},
    {"Department": "Statement Generation", "IpNumber": "543"},
    {"Department": "Static Data update", "IpNumber": "365"},
    {
      "Department": "DM Courier HO (Stationary Item Delivery)",
      "IpNumber": "1534995377"
    },
    {"Department": "Home Loan Subsequent Disbursement", "IpNumber": "474"},
    {"Department": "LO Support Team", "IpNumber": "530, 533, 599"},
    {"Department": "Home Loan Pass", "IpNumber": "152, 581, RRM-163"},
    {"Department": "LO Implementation Team Shohoj rin", "IpNumber": "165, 177"},
    {
      "Department": "HR software Approver Change related Issue",
      "IpNumber": "559"
    },
    {"Department": "HR Helpline Number", "IpNumber": "345,456"},
    {
      "Department": "OTC Payment Issues, Reversal- cardops@ificbankbd.com",
      "IpNumber": " 507, 508, 515"
    },
    {"Department": "Hardware Support ", "IpNumber": "253"},
    {
      "Department": "User Manual - Business Systems Division",
      "IpNumber": "530, 533"
    },
    {
      "Department": "For Product Program Guide - Retail Banking Division ",
      "IpNumber": "466, 465"
    },
    {"Department": "Process Management ", "IpNumber": "395, 397"},
    {
      "Department": "Service & Estate Division",
      "IpNumber": "608, 493, 498,627"
    },
    {"Department": "Courier Service issue card pin ", "IpNumber": "284"},
    {"Department": "Cheque Book", "IpNumber": "552"},
    {"Department": "Corporate Communication & Branding", "IpNumber": "240,243"},
    {"Department": "Process Management Office", "IpNumber": "394, 395, 397"},
    {
      "Department": "Alternative Delivery Services ",
      "IpNumber": " 478, 589, 502, 505, 506, 508, 514,515"
    },
    {
      "Department":
          "Customer Service Center  (debit restriction mobile number)",
      "IpNumber": "543, 523, 451, 398, 383"
    },
    {"Department": "Currency remit confirmation call", "IpNumber": "660"},
    {"Department": "IP Phone Connect", "IpNumber": "680"},
    {
      "Department": "To withdrawal Debit restriction",
      "IpNumber": "366,571,573,574,542"
    },
    {"Department": "E-KYC", "IpNumber": "398,395,451,687"},
    {
      "Department": "Remittance Settlement Unit( western , moneygram)",
      "IpNumber": "144, 149, 413, 419"
    },
    {"Department": "RTGS", "IpNumber": " 138, 141"},
    {"Department": "AML & CFTD IP", "IpNumber": "641"},
    {"Department": "party problem ", "IpNumber": "451,254"},
    {"Department": "Operation Support/E APPROVAL", "IpNumber": "367, 538, 665"},
    {"Department": "BACH", "IpNumber": "634,453"},
    {"Department": "EFTN  ", "IpNumber": "633,634"},
    {"Department": "Accounts Payable, FAD", "IpNumber": "446"}
  ];
}
