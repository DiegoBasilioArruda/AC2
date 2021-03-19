public enum Mnemonico {
    NOT_A       ("An", "0"),
    NOT_A_OR_B  ("nAoB", "1"),
    NOT_A_B     ("AnB", "2"),
    ZERO_LOGICO ("zeroL", "3"),
    NOT_A_AND_B ("nAeB", "4"),
    NOT_B       ("Bn", "5"),
    XOR_A_B     ("AxB", "6"),
    A_AND_NOT_B ("ABn", "7"),
    A_NOT_OR_B  ("AnoB", "8"),
    NOT_A_XOR_B ("nAxB", "9"),
    B           ("B", "A"),
    AB          ("AB", "B"),
    UM_LOGICO   ("umL", "C"),
    A_OR_B_NOT  ("AoBn", "D"),
    A_OR_B      ("AoB", "E"),
    A           ("A", "F");

    private String mnemonico;
    private String codHex;

    private Mnemonico(String mnemonico, String codHex) {
        this.mnemonico = mnemonico;
        this.codHex = codHex;
    }

    public String getMnemonico() {
        return mnemonico;
    }

    public void setMnemonico(String mnemonico) {
        this.mnemonico = mnemonico;
    }

    public String getCodHex() {
        return codHex;
    }

    public void setCodHex(String codHex) {
        this.codHex = codHex;
    }
}
