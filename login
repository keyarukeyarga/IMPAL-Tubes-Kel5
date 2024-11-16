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
        System.out.println("Changing password for: " + this.username);
        System.out.println("Old password: " + this.password);
        this.password = "newpassword";
        System.out.println("New password set to: " + this.password);
    }
}

enum ERole {
    karyawan,
    owner
}

class Karyawan extends Pengguna {
    private String id_karyawan;

    public Karyawan() {
        this.id_karyawan = "KRY001";
        this.id_pengguna = "USR001";
        this.address = "Default Address";
        this.JenisKelamin = "L";
        this.NoTelp = 0;
    }

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
        if (String.valueOf(id_pengguna).equals(this.id_pengguna)) {
            this.password = password;
            System.out.println("Password changed for karyawan: " + this.username);
        } else {
            System.out.println("Invalid ID for password change");
        }
    }
}

class Owner extends Pengguna {
    private String id_owner;

    public Owner() {
        this.id_owner = "OWN001";
        this.id_pengguna = "USR002";
        this.address = "Owner Address";
        this.JenisKelamin = "L";
        this.NoTelp = 0;
    }

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
        if (String.valueOf(id_pengguna).equals(this.id_pengguna)) {
            this.password = password;
            System.out.println("Password changed for owner: " + this.username);
        } else {
            System.out.println("Invalid ID for password change");
        }
    }
}

class KelolaStaff {
    private String id_pengguna;
    private Karyawan[] staffList;
    private int staffCount;
    private static final int MAX_STAFF = 100;

    public KelolaStaff() {
        this.id_pengguna = "KLOLA001";
        this.staffList = new Karyawan[MAX_STAFF];
        this.staffCount = 0;
    }

    public void addNewStaff(String id_pengguna, int NoTelp, String username, 
                           String password, String address, String role) {
        if (staffCount < MAX_STAFF) {
            Karyawan newStaff = new Karyawan();
            newStaff.id_pengguna = id_pengguna;
            newStaff.NoTelp = NoTelp;
            newStaff.username = username;
            newStaff.password = password;
            newStaff.address = address;
            newStaff.role = ERole.valueOf(role.toLowerCase());
            
            staffList[staffCount] = newStaff;
            staffCount++;
            
            System.out.println("Staff added successfully:");
            System.out.println("ID: " + id_pengguna);
            System.out.println("Username: " + username);
            System.out.println("Role: " + role);
        } else {
            System.out.println("Staff list is full. Cannot add more staff.");
        }
    }

    public void updateStaff(String id_pengguna, int NoTelp, String username,
                           String password, String address, String role) {
        boolean found = false;
        for (int i = 0; i < staffCount; i++) {
            if (staffList[i].id_pengguna.equals(id_pengguna)) {
                staffList[i].NoTelp = NoTelp;
                staffList[i].username = username;
                staffList[i].password = password;
                staffList[i].address = address;
                staffList[i].role = ERole.valueOf(role.toLowerCase());
                
                System.out.println("Staff updated successfully:");
                System.out.println("ID: " + id_pengguna);
                System.out.println("New Username: " + username);
                System.out.println("New Role: " + role);
                found = true;
                break;
            }
        }
        if (!found) {
            System.out.println("Staff with ID " + id_pengguna + " not found.");
        }
    }

    public void deleteStaff(String id_pengguna) {
        boolean found = false;
        for (int i = 0; i < staffCount; i++) {
            if (staffList[i].id_pengguna.equals(id_pengguna)) {
                // Shift remaining staff to fill the gap
                for (int j = i; j < staffCount - 1; j++) {
                    staffList[j] = staffList[j + 1];
                }
                staffList[staffCount - 1] = null;
                staffCount--;
                
                System.out.println("Staff with ID " + id_pengguna + " deleted successfully.");
                found = true;
                break;
            }
        }
        if (!found) {
            System.out.println("Staff with ID " + id_pengguna + " not found.");
        }
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
                                
        // Update staff
        staffManager.updateStaff("KRY002", 628123457, "updatedstaff", 
                                "newpass123", "Jalan Maju No 2", "karyawan");
                                
        // Delete staff
        staffManager.deleteStaff("KRY002");
    }
}
