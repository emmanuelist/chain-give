# ChainGive - Next-Generation Philanthropic Infrastructure

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/emmanuelist/chain-give)
[![License: ISC](https://img.shields.io/badge/License-ISC-blue.svg)](https://opensource.org/licenses/ISC)
[![Stacks](https://img.shields.io/badge/Blockchain-Stacks-purple.svg)](https://www.stacks.co/)
[![Clarity](https://img.shields.io/badge/Language-Clarity-orange.svg)](https://clarity-lang.org/)

## 🎯 Mission Statement

ChainGive revolutionizes charitable giving through blockchain technology, creating an immutable ecosystem where every donation is tracked, every disbursement is verified, and every impact is measurable. Built on Stacks blockchain for maximum transparency and donor confidence.

## ✨ Key Features

- **🔐 Multi-tier Governance**: Admin, Moderator, and Beneficiary role-based access control
- **📊 Immutable Ledger**: Complete audit trail for all donations and fund utilization
- **🎯 Milestone-driven Distribution**: Accountability through milestone-based fund releases
- **📈 Real-time Impact Tracking**: Monitor progress and outcomes in real-time
- **💸 Zero-fee Transfers**: Direct STX transfers between donors and causes
- **⚖️ Automated Compliance**: Smart contract enforcement ensures regulatory adherence

## 🏗️ System Overview

ChainGive transforms traditional philanthropy by eliminating opacity and introducing radical transparency to charitable operations. The smart contract creates a trustless environment where donors can directly connect with causes, track their contributions in real-time, and witness tangible impact through milestone-based fund releases.

## 🔧 Contract Architecture

### Core Components

#### 1. **Role Management System**

```clarity
- ROLE-ADMIN (u1): Full system control and oversight
- ROLE-MODERATOR (u2): Beneficiary registration and management  
- ROLE-BENEFICIARY (u3): Fund utilization and milestone management
```

#### 2. **Data Storage Maps**

- **`roles`**: User role assignments for access control
- **`beneficiaries`**: Registry with funding details and status
- **`donations`**: Complete transaction history with timestamps
- **`utilization`**: Milestone tracking and fund distribution records

#### 3. **Global State Variables**

- **`contract-owner`**: Primary administrator principal
- **`beneficiary-count`**: Total registered beneficiaries
- **`donation-count`**: Total processed donations
- **`utilization-count`**: Total fund utilization records

### Smart Contract Functions

#### **Role Management**

- `set-role(user, role)` - Assign roles to users (Admin only)
- `remove-role(user)` - Remove user roles (Admin only)

#### **Beneficiary Management**

- `register-beneficiary(name, description, target-amount)` - Register new beneficiaries (Moderator+)
- `get-beneficiary(id)` - Retrieve beneficiary information

#### **Donation Processing**

- `donate(beneficiary-id, amount)` - Process STX donations
- `get-donation-by-id(donation-id)` - Retrieve donation details
- `get-donation-count()` - Get total donation count

#### **Fund Utilization**

- `add-utilization(beneficiary-id, description, amount)` - Create utilization proposals (Admin only)
- `approve-utilization(beneficiary-id, milestone)` - Approve fund releases (Admin only)
- `get-utilization-by-id(utilization-id)` - Retrieve utilization details
- `get-utilization-count()` - Get total utilization count

## 📊 Data Flow Architecture

```
┌─────────────────┐    ┌──────────────────┐    ┌─────────────────┐
│     Donors      │───▶│   ChainGive      │───▶│  Beneficiaries  │
│                 │    │   Contract       │    │                 │
│  • Send STX     │    │                  │    │  • Receive      │
│  • Track Impact │    │  • Role Mgmt     │    │    Funding      │
│  • Verify Use   │    │  • Donations     │    │  • Report       │
└─────────────────┘    │  • Milestones    │    │    Progress     │
                       │  • Transparency  │    └─────────────────┘
                       └──────────────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │   Immutable Ledger  │
                    │                     │
                    │  • All Transactions │
                    │  • Milestone Events │
                    │  • Audit Trail      │
                    │  • Compliance Data  │
                    └─────────────────────┘
```

### Transaction Flow

1. **Registration Phase**
   - Moderators register vetted beneficiaries
   - Target amounts and descriptions are set
   - Beneficiaries receive unique IDs

2. **Donation Phase**
   - Donors send STX directly to contract
   - Donations are tracked with timestamps
   - Beneficiary balances are updated automatically

3. **Utilization Phase**
   - Admins create milestone-based utilization proposals
   - Fund releases require explicit approval
   - All activities are permanently recorded

4. **Transparency Phase**
   - Real-time tracking of all activities
   - Public access to donation and utilization data
   - Complete audit trail for regulatory compliance

## 🚀 Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) CLI tool
- [Node.js](https://nodejs.org/) (v16 or higher)
- [Stacks Wallet](https://www.hiro.so/wallet) for testing

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/emmanuelist/chain-give.git
   cd chain-give
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Check contract syntax**

   ```bash
   clarinet check
   ```

4. **Run tests**

   ```bash
   npm test
   ```

### Local Development

1. **Start Clarinet console**

   ```bash
   clarinet console
   ```

2. **Deploy contract locally**

   ```clarity
   ::deploy_contract chain-give contracts/chain-give.clar
   ```

3. **Interact with contract**

   ```clarity
   (contract-call? .chain-give register-beneficiary u"Red Cross" u"Emergency relief operations" u1000000)
   ```

## 🧪 Testing

The project includes comprehensive test coverage using Vitest and Clarinet SDK:

```bash
# Run all tests
npm test

# Run tests with coverage report
npm run test:report

# Watch mode for development
npm run test:watch
```

Test files are located in the `tests/` directory and cover:

- Role management functionality
- Beneficiary registration and retrieval
- Donation processing and tracking
- Fund utilization and milestone management
- Error handling and edge cases

## 🔒 Security Considerations

### Access Control

- **Multi-level Authorization**: Three-tier role system prevents unauthorized access
- **Owner Protection**: Contract owner cannot remove their own admin role
- **Input Validation**: All user inputs are validated before processing

### Fund Security

- **Escrow Model**: Funds are held in contract until milestone approval
- **Balance Verification**: Utilization amounts verified against available funds
- **Immutable Records**: All transactions permanently recorded on-chain

### Best Practices

- **Principle of Least Privilege**: Minimal required permissions for each role
- **Fail-Safe Defaults**: Secure defaults for all operations
- **Comprehensive Error Handling**: Detailed error codes for debugging

## 📋 Error Codes

| Code | Constant | Description |
|------|----------|-------------|
| u100 | `ERR-NOT-AUTHORIZED` | Insufficient permissions for operation |
| u101 | `ERR-ALREADY-REGISTERED` | Entity already exists in system |
| u102 | `ERR-NOT-FOUND` | Requested entity does not exist |
| u103 | `ERR-INSUFFICIENT-FUNDS` | Inadequate balance for operation |
| u104 | `ERR-BENEFICIARY-NOT-FOUND` | Beneficiary ID not found |
| u105 | `ERR-UTILIZATION-NOT-FOUND` | Utilization record not found |
| u106 | `ERR-INVALID-INPUT` | Invalid input parameters |

## 🤝 Contributing

We welcome contributions to ChainGive! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/amazing-feature`)
3. **Commit your changes** (`git commit -m 'Add some amazing feature'`)
4. **Push to the branch** (`git push origin feature/amazing-feature`)
5. **Open a Pull Request**

### Development Guidelines

- Write comprehensive tests for new features
- Follow Clarity best practices and conventions
- Update documentation for any API changes
- Ensure all tests pass before submitting PR

## 📄 License

This project is licensed under the ISC License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Stacks Foundation** for the robust blockchain infrastructure
- **Hiro Systems** for excellent developer tools and documentation
- **Clarity Language** team for the secure smart contract language
