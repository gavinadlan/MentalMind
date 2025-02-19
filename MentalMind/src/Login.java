
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;
public class Login extends javax.swing.JFrame {
    
    private LupaPassword lupaPasswordFrame;
     private static String loggedInUsername;
       
    private static int loggedInUserID;
    

    public static String getLoggedInUsername() {
        return loggedInUsername;
    }
    /**
     * Creates new form Login
     */
    public Login() {
        initComponents();
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        txUsername = new javax.swing.JTextField();
        txPassword = new javax.swing.JPasswordField();
        jLabel2 = new javax.swing.JLabel();
        btn_masuk = new javax.swing.JToggleButton();
        btn_daftar = new javax.swing.JToggleButton();
        btn_lupapassword = new javax.swing.JToggleButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        txUsername.setBackground(new java.awt.Color(197, 200, 205));
        txUsername.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        txUsername.setBorder(null);
        txUsername.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txUsernameActionPerformed(evt);
            }
        });
        getContentPane().add(txUsername, new org.netbeans.lib.awtextra.AbsoluteConstraints(670, 270, 310, 40));

        txPassword.setBackground(new java.awt.Color(197, 200, 205));
        txPassword.setFont(new java.awt.Font("Tahoma", 0, 16)); // NOI18N
        txPassword.setBorder(null);
        txPassword.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txPasswordActionPerformed(evt);
            }
        });
        getContentPane().add(txPassword, new org.netbeans.lib.awtextra.AbsoluteConstraints(670, 360, 310, 40));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/ui componen/Login (1).png"))); // NOI18N
        getContentPane().add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, -1));

        btn_masuk.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_masukActionPerformed(evt);
            }
        });
        getContentPane().add(btn_masuk, new org.netbeans.lib.awtextra.AbsoluteConstraints(719, 475, 220, 50));

        btn_daftar.setText("daftar");
        btn_daftar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_daftarActionPerformed(evt);
            }
        });
        getContentPane().add(btn_daftar, new org.netbeans.lib.awtextra.AbsoluteConstraints(890, 560, 70, 20));

        btn_lupapassword.setText("Lupa Password");
        btn_lupapassword.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btn_lupapasswordActionPerformed(evt);
            }
        });
        getContentPane().add(btn_lupapassword, new org.netbeans.lib.awtextra.AbsoluteConstraints(880, 430, -1, -1));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void txUsernameActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txUsernameActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txUsernameActionPerformed

    private void txPasswordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_txPasswordActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_txPasswordActionPerformed

    private void btn_masukActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_masukActionPerformed
        // Logika otentikasi di sini, Anda perlu memeriksa username dan password
   
        try{
       Connection c = Koneksi.getKoneksi();
       Statement s = c.createStatement();
       
      String sql = "SELECT * FROM users WHERE Username=? AND Password=?";
            
    try (PreparedStatement preparedStatement = c.prepareStatement(sql)) {
                preparedStatement.setString(1, txUsername.getText());
                preparedStatement.setString(2, txPassword.getText());

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        loggedInUsername = txUsername.getText();
                        loggedInUserID = resultSet.getInt("UserID"); // Ambil ID pengguna dari database
                        JOptionPane.showMessageDialog(null, "Login Berhasil");
                        this.dispose();

                        // Buka frame menu
                        Menu menuFrame = new Menu();
                        menuFrame.setUserID(loggedInUserID); // Setel ID pengguna di frame Menu
                        menuFrame.setVisible(true);
                    } else {
                        JOptionPane.showMessageDialog(null, "Username atau Password Salah");
                        txPassword.requestFocus();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JOptionPane.showMessageDialog(null, "Error saat login.", "Error Login", JOptionPane.ERROR_MESSAGE);
        }
    
    }//GEN-LAST:event_btn_masukActionPerformed

    private void btn_daftarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_daftarActionPerformed
        // Buka frame SignUp
    SignUp signUpFrame = new SignUp();
    signUpFrame.setVisible(true);

    // Tutup frame login (optional, tergantung pada kebutuhan)
    this.dispose();
    }//GEN-LAST:event_btn_daftarActionPerformed

    private void btn_lupapasswordActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btn_lupapasswordActionPerformed
        // Buka frame SendEmail
    SendEmail sendEmailFrame = new SendEmail();
    sendEmailFrame.setVisible(true);

    // Tutup frame login (optional, tergantung pada kebutuhan)
    this.dispose();
    }//GEN-LAST:event_btn_lupapasswordActionPerformed

    /**
     * @param args the command line arguments
     */
    
    public static int getLoggedInUserID() {
        return loggedInUserID;
    }
    
    public static void main(String args[]) {
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        java.awt.EventQueue.invokeLater(() -> {
            new Login().setVisible(true);
        });
    }
    
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton btn_daftar;
    private javax.swing.JToggleButton btn_lupapassword;
    private javax.swing.JToggleButton btn_masuk;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JPasswordField txPassword;
    private javax.swing.JTextField txUsername;
    // End of variables declaration//GEN-END:variables

    private void initSuccessDialog() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
