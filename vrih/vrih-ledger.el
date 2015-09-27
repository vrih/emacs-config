(setq ledger-master-file "/home/dan/ledger/accounts.ledger")

(setq ledger-reports '(("bal" "ledger -f %(ledger-file) bal")
                       ("reg" "ledger -f %(ledger-file) reg")
                       ("payee" "ledger -f %(ledger-file) reg @%(payee)")
                       ("account" "ledger -f %(ledger-file) reg %(account)")
                       ("assets" "ledger -f %(ledger-file) bal -Vs bal ^ass ^lia")))


(provide 'vrih-ledger)
