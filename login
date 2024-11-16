// Abstract class for base user
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
        // Implementation for changing password
    }
}

// Enum for user roles
enum ERole {
    karyawan,
    owner
}

// Class for employee users
class Karyawan extends Pengguna {
    private String id_karyawan;

    public boolean Login(String username, String password) {
        if (super.Login(username, password)) {
            if (this.role == ERole.karyawan) {
                System.out.println("Karyawan logged in successfully!");
                return true;
            }
            System.out.println("Invalid role for Karyawan!");
        }
        viewReportPageError();
        return false;
    }

    public void changePassword(int id_pengguna, String username, String password) {
        // Implementation for karyawan password change
    }
}

// Class for owner users
class Owner extends Pengguna {
    private String id_owner;

    public boolean Login(String username, String password) {
        if (super.Login(username, password)) {
            if (this.role == ERole.owner) {
                System.out.println("Owner logged in successfully!");
                return true;
            }
            System.out.println("Invalid role for Owner!");
        }
        viewReportPageError();
        return false;
    }

    public void changePassword(int id_pengguna, String username, String password) {
        // Implementation for owner password change
    }
}

// Class to manage staff
class KelolaStaff {
    private String id_pengguna;

    public void addNewStaff(String id_pengguna, int NoTelp, String username, 
                           String password, String address, String role) {
        // Implementation for adding new staff
    }

    public void updateStaff(String id_pengguna, int NoTelp, String username,
                           String password, String address, String role) {
        // Implementation for updating staff
    }

    public void deleteStaff(String id_pengguna) {
        // Implementation for deleting staff
    }
}

// Main class to demonstrate login
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
    }
}
