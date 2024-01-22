import Foundation

func Payment(loanAmount: Int, numberOfPayments: Int, interestRatePerPeriod: Float) -> Float {
    guard loanAmount > 0, numberOfPayments > 0, interestRatePerPeriod > 0 else {
        print("Invalid input values")
        return 0.0
    }

    let periodInterestRate = interestRatePerPeriod / 100
    let discountedFactor = pow(1 + periodInterestRate, Float(numberOfPayments))
    let payment = Float(loanAmount) * periodInterestRate * discountedFactor / (discountedFactor - 1)

    return round(payment * 100) / 100  // Rounding to two decimal places
}

// Example usage
let twoMonthPayment = Payment(loanAmount: 20000, numberOfPayments: 2, interestRatePerPeriod: 4.4 / 12)
print("2-month loan payment: \(twoMonthPayment)")

let thirtyYearPayment = Payment(loanAmount: 150000, numberOfPayments: 30, interestRatePerPeriod: 5.0)
print("30-year loan payment: \(thirtyYearPayment)")
