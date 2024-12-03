table 50300 "Smartphone JCOM"
{
    Caption = 'Smart Phone JCOM';
    DataClassification = CustomerContent;
    LookupPageId = "Smartphone List JCOM";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            //DataClassification
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Version"; Text[20])
        {
            Caption = 'Version';
        }
        field(4; "Storage(G)"; Integer)
        {
            Caption = 'Storage(G)';
        }
        field(5; "Memory(G)"; Integer)
        {
            Caption = 'Memory(G)';
        }
        field(6; "Battery Changeable"; Boolean)
        {
            Caption = 'Battery Changeable';
        }
        field(7; "Release Date"; Date)
        {
            Caption = 'Release Date';
        }
        field(9; "Number of Item used"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count(Item where("Smartphone No." = field("No.")));
        }
        field(10; "Test Uninstall"; Text[20])
        {
            Caption = 'Test Uninstall Field';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
