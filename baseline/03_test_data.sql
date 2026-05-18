-- Test accounts (run after schema). Uses UNHEX(REPLACE(UUID(), ...)) for BINARY(16) ids.
INSERT INTO accounts (
    id,
    account_number,
    account_name,
    type,
    actual_balance,
    available_balance,
    status
) VALUES
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '00000000000000004821',
        'Everyday chequing',
        'CUSTOMER',
        942.3500,
        942.3500,
        'ACTIVE'
    ),
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '00000000000000006103',
        'High Interest Savings',
        'CUSTOMER',
        22430.0000,
        22430.0000,
        'ACTIVE'
    ),
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '90000000000000000001',
        'E-Transfer Settlement',
        'INTERNAL',
        0.0000,
        0.0000,
        'ACTIVE'
    ),
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '90000000000000000002',
        'Fee Revenue',
        'INTERNAL',
        0.0000,
        0.0000,
        'ACTIVE'
    ),
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '00000000000000010001',
        'Emily Chen',
        'CUSTOMER',
        10000.0000,
        10000.0000,
        'ACTIVE'
    ),
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '00000000000000010002',
        'Marcus Rivera',
        'CUSTOMER',
        10000.0000,
        10000.0000,
        'ACTIVE'
    ),
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '00000000000000010003',
        'Priya Sharma',
        'CUSTOMER',
        10000.0000,
        10000.0000,
        'ACTIVE'
    ),
    (
        UNHEX(REPLACE(UUID(), '-', '')),
        '00000000000000010004',
        'David Tremblay',
        'CUSTOMER',
        10000.0000,
        10000.0000,
        'ACTIVE'
    );

-- Contacts for "Send to" (owned by Everyday chequing). Priya uses phone as send-to id in contact_email (no phone column in schema).
INSERT INTO contacts (id, owner_account_id, contact_name, contact_email)
SELECT UNHEX(REPLACE(UUID(), '-', '')), id, 'Emily Chen', 'emily.chen@example.com'
FROM accounts WHERE account_number = '00000000000000004821' LIMIT 1;

INSERT INTO contacts (id, owner_account_id, contact_name, contact_email)
SELECT UNHEX(REPLACE(UUID(), '-', '')), id, 'Marcus Rivera', 'marcus.r@example.com'
FROM accounts WHERE account_number = '00000000000000004821' LIMIT 1;

INSERT INTO contacts (id, owner_account_id, contact_name, contact_email)
SELECT UNHEX(REPLACE(UUID(), '-', '')), id, 'Priya Sharma', 'priya.s@example.com'
FROM accounts WHERE account_number = '00000000000000004821' LIMIT 1;

INSERT INTO contacts (id, owner_account_id, contact_name, contact_email)
SELECT UNHEX(REPLACE(UUID(), '-', '')), id, 'David Tremblay', 'd.tremblay@example.com'
FROM accounts WHERE account_number = '00000000000000004821' LIMIT 1;
