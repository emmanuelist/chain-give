;; Title: ChainGive - Next-Generation Philanthropic Infrastructure
;;
;; SUMMARY:
;; ChainGive revolutionizes charitable giving through blockchain technology,
;; creating an immutable ecosystem where every donation is tracked, every 
;; disbursement is verified, and every impact is measurable. Built on Stacks
;; blockchain for maximum transparency and donor confidence.
;;
;; DESCRIPTION:
;; ChainGive transforms traditional philanthropy by eliminating opacity and
;; introducing radical transparency to charitable operations. This smart contract
;; creates a trustless environment where donors can directly connect with causes,
;; track their contributions in real-time, and witness tangible impact through
;; milestone-based fund releases.
;;
;; Key innovations include:
;;   - Multi-tier governance with Admin, Moderator, and Beneficiary roles
;;   - Immutable donation ledger with complete audit trail
;;   - Milestone-driven fund distribution for accountability
;;   - Real-time impact tracking and progress monitoring
;;   - Zero-fee direct STX transfers between donors and causes
;;   - Automated compliance through smart contract enforcement
;;
;; Built for the future of giving - transparent, efficient, and impactful.

;; CONTRACT OWNERSHIP & GOVERNANCE

(define-data-var contract-owner principal tx-sender)

;; ERROR CODES & CONSTANTS

(define-constant ERR-NOT-AUTHORIZED (err u100))
(define-constant ERR-ALREADY-REGISTERED (err u101))
(define-constant ERR-NOT-FOUND (err u102))
(define-constant ERR-INSUFFICIENT-FUNDS (err u103))
(define-constant ERR-BENEFICIARY-NOT-FOUND (err u104))
(define-constant ERR-UTILIZATION-NOT-FOUND (err u105))
(define-constant ERR-INVALID-INPUT (err u106))

;; ROLE DEFINITIONS & ACCESS LEVELS

(define-constant ROLE-ADMIN u1)
(define-constant ROLE-MODERATOR u2)
(define-constant ROLE-BENEFICIARY u3)

;; DATA STRUCTURES & STORAGE MAPS

;; User role assignments for access control
(define-map roles 
  { user: principal } 
  { role: uint }
)

;; Beneficiary registry with funding details
(define-map beneficiaries
  { id: uint }
  { 
    name: (string-utf8 50), 
    description: (string-utf8 255), 
    target-amount: uint, 
    received-amount: uint, 
    status: (string-ascii 20)
  }
)