abstract class Pengguna {
    protected String id_pengguna;
    protected String password;
    protected String username;
    protected String address;
    protected String JenisKelamin;
    protected int NoTelp;
    protected ERole role;

    public boolean Login(String username, String password) {
        if (this.username.equals(username) && this.password.equals(password)) {
            return true;
        }
        return false;
    }

    public void viewReportPageError() {
        System.out.println("Error: Invalid credentials!");
    }

    public void changePassword() {
        System.out.println("Changing password for: " + this.username);
        System.out.println("Old password: " + this.password);
        this.password = "newpassword";
        System.out.println("New password set to: " + this.password);
    }
}

class LoginSystem {
    public static void main(String[] args) {
        // Create a karyawan user
        Karyawan karyawan = new Karyawan();
        karyawan.username = "staff123";
        karyawan.password = "password123";
        karyawan.role = ERole.karyawan;

        // Create an owner user
        Owner owner = new Owner();
        owner.username = "owner123";
        owner.password = "ownerpass123";
        owner.role = ERole.owner;

        // Test login for karyawan
        System.out.println("Testing Karyawan Login:");
        karyawan.Login("staff123", "password123");  // Should succeed
        karyawan.Login("staff123", "wrongpass");    // Should fail

        // Test login for owner
        System.out.println("\nTesting Owner Login:");
        owner.Login("owner123", "ownerpass123");    // Should succeed
        owner.Login("owner123", "wrongpass");       // Should fail

        // Test staff management
        System.out.println("\nTesting Staff Management:");
        KelolaStaff staffManager = new KelolaStaff();
        
        // Add new staff
        staffManager.addNewStaff("KRY002", 628123456, "newstaff", 
                                "pass123", "Jalan Maju No 1", "karyawan");
                                
        // Fetch staff by role
        staffManager.getStaff("karyawan");
    }
}
