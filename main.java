public class main {
    // This is the "Magic Link" that connects Java to your C/C++ files
    static {
        System.loadLibrary("coin_engine");
    }

    // This declares that the actual code for this function is in a C file
    public native void runEngine();
    public native void checkSecurity(String pass);

    public static void main(String[] args) {
        System.out.println("Java Layer: Loading Engine...");
        new main().runEngine();
    }
}
