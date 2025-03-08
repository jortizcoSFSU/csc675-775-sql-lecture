# Instructions for Running SQL Scripts in DataGrip

Follow the steps below to connect to your MySQL database and execute the `create.sql` and `inserts.sql` scripts in **DataGrip**.

## Step 1: Connect to Your MySQL Database in DataGrip

1. **Open DataGrip**:
   - Launch DataGrip on your computer.

2. **Create a New Database Connection**:
   - In the **Database** view (on the left side), click the `+` sign or right-click and select **New Connection**.
   - Select **MySQL** from the list of database types.

3. **Enter Connection Details**:
   - **Host**: Enter the hostname of your MySQL server (e.g., `localhost` if it's on your machine).
   - **Port**: Enter the port number for MySQL (default is `3306`).
   - **User**: Enter your MySQL username.
   - **Password**: Enter your MySQL password.

4. **Test the Connection**:
   - Click **Test Connection** to ensure the connection is successful.
   - Once the connection is successful, click **OK**.

## Step 2: Running the `create.sql` and `inserts.sql` Scripts

1. **Open the `create.sql` Script**:
   - In the **Files** workspace, click on `create.sql`.
   - The script will open in a new tab.
   - Select all the code in the script, and click the **Run** button (or press `Ctrl + Enter`) to execute it.

2. **Open the `inserts.sql` Script**:
   - In the **Files** workspace, click on `inserts.sql`.
   - The script will open in a new tab.
   - Select all the code in the script, and click the **Run** button (or press `Ctrl + Enter`) to execute it.

## Step 3: Verify the Results

- After executing both scripts, check the **Results** tab for the expected output.
- If there are any errors, verify your connection settings, ensure that the correct database is selected, and check for any syntax issues in the SQL scripts.

---

**Note**: 
- If you encounter any issues, ensure you're connected to the correct MySQL instance and database (`MusicDB`).
- Read all the guidelines included in the script files as comments before getting started with the practice problems.
