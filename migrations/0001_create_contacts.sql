-- Create contacts table for contact form submissions
CREATE TABLE IF NOT EXISTS contacts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  message TEXT NOT NULL,
  locale TEXT NOT NULL DEFAULT 'en',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  ip_address TEXT,
  user_agent TEXT
);

-- Create index on created_at for faster queries
CREATE INDEX idx_contacts_created_at ON contacts(created_at DESC);

-- Create index on locale for filtering by language
CREATE INDEX idx_contacts_locale ON contacts(locale);
