-- Disable foreign keys temporarily for the migration
PRAGMA foreign_keys=OFF;

-- Handle the Task table
CREATE TABLE "new_Task" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "text" TEXT NOT NULL,
    "completed" BOOLEAN NOT NULL DEFAULT false,
    "timer" DATETIME,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL, -- Ensure `userId` is required
    CONSTRAINT "Task_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Migrate existing data to the new Task table
-- Assign a placeholder userId (e.g., 1). Update this after migration if necessary.
INSERT INTO "new_Task" ("id", "text", "completed", "timer", "createdAt", "userId")
SELECT 
    "id", 
    "text", 
    "completed", 
    "timer", 
    "createdAt",
    1 AS "userId" -- Replace `1` with the appropriate userId or update these rows post-migration
FROM "Task";

-- Drop the old Task table and rename the new table
DROP TABLE "Task";
ALTER TABLE "new_Task" RENAME TO "Task";

-- Handle the User table
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP -- Retain or add `createdAt` with default
);

-- Migrate existing data to the new User table
INSERT INTO "new_User" ("id", "name", "email", "username", "password", "createdAt")
SELECT 
    "id", 
    "name", 
    "email", 
    "username", 
    "password",
    CURRENT_TIMESTAMP AS "createdAt" -- Use a placeholder if `createdAt` was missing earlier
FROM "User";

-- Drop the old User table and rename the new table
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";

-- Create unique indexes on User table
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- Enable foreign keys
PRAGMA foreign_keys=ON;
