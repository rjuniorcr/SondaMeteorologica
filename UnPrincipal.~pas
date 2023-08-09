unit UnPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CPort, ExtCtrls, XPMan, CPortCtl;

type
  TFmPrincipal = class(TForm)
    comport: TComPort;
    Memo1: TMemo;
    BtnPainelConfig: TButton;
    btnOpenPort: TButton;
    btnClosePort: TButton;
    Timer1: TTimer;
    labelstatus: TLabel;
    Button3: TButton;
    Button4: TButton;
    Timer2: TTimer;
    Button6: TButton;
    Label1: TLabel;
    Button8: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    editAbrir: TEdit;
    Button1: TButton;
    XPManifest1: TXPManifest;
    dialogAbrir: TOpenDialog;
    cmdSeqUnica: TButton;
    Label5: TLabel;
    Memo2: TMemo;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    ComLed1: TComLed;
    procedure BtnPainelConfigClick(Sender: TObject);
    procedure btnOpenPortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClosePortClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cmdSeqUnicaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmPrincipal: TFmPrincipal;
  contador: integer;
implementation

{$R *.dfm}

{
Modulo de Transmissao de Dados de Designação

Versao 6.0
01/12/2017 - 23:10

}
procedure TFmPrincipal.BtnPainelConfigClick(Sender: TObject);
begin
  comport.ShowSetupDialog;
  btnOpenPort.Enabled := True;

  // Aqui voce especifica sua porta serial, diretamente assim...
  //comport.Port := 'COM3'
  // Ou por um Edit.. assim...
  //comport.Port := edtPorta.Text;
  // Na opção abaixo o BaudRate
  // Tome cuidado com o BaudRate que não é apenas para algo como:
  // 9600
  // Ele tem seu "padrão"
  //comport.BaudRate
  // StopBits
  //comport.StopBits
  // Paridade
  //comport.Parity
  // Data Bits
  //comport.DataBits
end;

procedure TFmPrincipal.btnOpenPortClick(Sender: TObject);
begin
    try
      // Abrindo a conexão serial
      comport.Open;
      if comport.Connected then
      begin
          //MemoLog.Text := MemoLog.Text + 'Conexão serial estabelecida com sucesso ('+comport.Port+')';
          //MemoLog.Lines.Add(''); //Gambi para ir para proxima linha, nao lembro como usar #13
          btnOpenPort.Enabled := False;
          btnClosePort.Enabled := True;

          Button3.Enabled:= true;
          Button4.Enabled:= true;
          cmdSeqUnica.enabled:= true;

          contador:=0; //valor inicial para a variavel global de controle 
      end
      else
          Memo1.Text := Memo1.Text + 'FALHA ao abrir conexão serial com ('+comport.Port+')'
    Except on E : Exception do
    begin
        Memo1.Text := Memo1.Text + 'ERRO ao abrir conexão: Detalhes> '+E.Message;
    end
    end
end;

procedure TFmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      // Caso o usuario feche o programa sem fechar a conexão
     timer1.Enabled:=false;
     timer2.Enabled:=false;
     comport.Close;
end;


procedure TFmPrincipal.btnClosePortClick(Sender: TObject);
begin
      button3.Enabled:=false;
      button6.Enabled:=false;

      button4.Enabled:=false;
      button8.Enabled:=false;

      cmdSeqUnica.enabled:= false;
     //para os timers antes de fechar a porta para evitar erros
     timer1.Enabled:=false;
     timer2.Enabled:=false;

    // Fechando a conexão quando o operador clicar no botao
    comport.Close;

    // Vamos trabalhar em cima desta ação
    if not comport.Connected then
    begin
        //Memo1.Text := Memo1.Text + 'Conexão serial finalizada com sucesso ('+comport.Port+')';
        btnClosePort.Enabled := False;
        btnOpenPort.Enabled := False;


    end
    else
        Memo1.Text := Memo1.Text + 'Falha ao finalizar conexão serial.'
end;

procedure TFmPrincipal.Timer1Timer(Sender: TObject);
var
buffer_dados: string;
linhas_memo: integer;
qtd_buffer:integer;
cont: integer;
posicao_buffer: string;

begin

{
if ( CheckBox1.Checked=true) then
  begin
    timer1.interval:=2;
  end
  else
  begin
    timer1.interval:=2000;
  end;
}
 

if (RadioButton1.checked=true) then
  begin
    timer1.interval:=2000;
  end;

if (RadioButton2.checked=true) then
  begin
    timer1.interval:=1000;
  end;

if (RadioButton3.checked=true) then
  begin
    timer1.interval:=500;
  end;

if (RadioButton4.checked=true) then
  begin
    timer1.interval:=100;
  end;

if (RadioButton5.checked=true) then
  begin
    timer1.interval:=25;
  end;

if (RadioButton6.checked=true) then
  begin
    timer1.interval:=2;
  end;
                        


linhas_memo:= Memo1.Lines.Count; //contagem do numero de linhas o memo

//a variavel contador é global
if contador <linhas_memo then
    begin
      buffer_dados:= Memo1.Lines.Strings[contador];

      //comport.WriteStr(buffer_dados); //sem quebra de linha e retorno de carro
      //comport.WriteStr(buffer_dados+char(13)+char(10));
      //char(10) line-feed LF   - hex (0a)
      //char(13) enter-CR (carriage return) - hex (0d)

      //para check do status do buffer_dados
      labelstatus.caption:= buffer_dados;


      //char(10) line-feed LF   - hex (0a)
      if (CheckBox3.Checked=true) then
        begin
        buffer_dados := buffer_dados + char(10);
        end;



      //char(13) enter-CR (carriage return) - hex (0d)
      if (CheckBox2.Checked=true) then
        begin
        buffer_dados := buffer_dados + char(13);
        end;



      //char(0) - NUL
      if (CheckBox4.Checked=true) then
        begin
        buffer_dados := char(0)+buffer_dados;
        end;

      //char(32) Space
      if (CheckBox5.Checked=true) then
        begin
        buffer_dados := char(32)+buffer_dados;
        end;


      if (CheckBox6.Checked=true) then
        begin
        buffer_dados := buffer_dados + char(10) + char(13);
        end;

      if (CheckBox7.Checked=true) then
        begin
        buffer_dados := buffer_dados + char(13) + char(10);
        end;


      qtd_buffer:= Length(buffer_dados); //gravando em qtd_buffer o numero de bytes de buffer_dados

      {
      //se a velocidade for normal, envia por caractere
      //se a velocidade for acelerada, envia a linha toda de uma vez
      if (CheckBox1.Checked=true) then
        begin
          comport.WriteStr(buffer_dados);
        end
      else
        begin
          cont:=1; //variavel auxiliar
          //fazer assim para o envio ser 'por caractere'
          //igual a digicora envia (tipo um máquina-de-escrever)
          while (qtd_buffer>=cont) do
            begin
              posicao_buffer := copy(buffer_dados,cont,1);
              comport.WriteStr(posicao_buffer);
              cont:= cont+1;
            sleep(3);
            //Application.ProcessMessages; //testes para resolver problema uso do sleep()
          end;
        end;
      }
      
      comport.WriteStr(buffer_dados);


      //comport.WriteStr(buffer_dados);
      //comport.WriteStr(buffer_dados+char(13)+char(10));




      contador:= contador + 1;
    //só para evitar travamento devido loops infinitos
    end
    else
      begin
        contador:=0;
        timer1.enabled:=false;
        showmessage('Envio de Dados de Sondagem concluído');

        button3.Enabled:=true;
        button6.Enabled:=false;

        labelstatus.caption:= edit1.text;
      end;


end;








procedure TFmPrincipal.Button3Click(Sender: TObject);
begin

button3.enabled:= false;
edit1.enabled:=false;
button4.enabled:= true;

//cmdSeqUnica.Enabled:=false;
contador:=0; //para garantir um disparo de trajetória do começo
timer2.enabled:=true;

end;

procedure TFmPrincipal.Timer2Timer(Sender: TObject);
{var
ponto_fixo:string;}
var
buffer_dados: string;
linhas_memo: integer;

begin



linhas_memo:= Memo2.Lines.Count; //contagem do numero de linhas o memo

//a variavel contador é global
if contador <linhas_memo then
    begin
      buffer_dados:= Memo2.Lines.Strings[contador];

       //comport.WriteStr(buffer_dados); //sem quebra de linha e retorno de carro
      //comport.WriteStr(buffer_dados+char(13)+char(10));
      //char(10) quebra linha - 0d
      //char(13) retorno de carro - 0a

      if contador=0 then //para inserir o NULL somente na primeira linha da impressao do cabeçalho
        begin
          comport.WriteStr(char(0)+buffer_dados+char(13)+char(10));
        end
      else
        begin
          comport.WriteStr(buffer_dados+char(13)+char(10));
        end;


      //para check do status do buffer_dados
      labelstatus.caption:= buffer_dados;

      contador:= contador + 1;
    //só para evitar travamento devido loops infinitos
    end
    else
      begin
        contador:=0;
        timer2.enabled:=false;
       // showmessage('Cabeçalho Enviado');
        button3.Enabled:=true;
        button6.Enabled:=false;

        labelstatus.caption:= edit1.text;
      end;

{  ponto_fixo:= edit1.Text;

  comport.WriteStr(ponto_fixo);
  labelstatus.caption:= ponto_fixo;}
end;

procedure TFmPrincipal.Button4Click(Sender: TObject);
begin

button8.Enabled:=false;
button4.Enabled:=false;

button6.Enabled:=true;
button3.enabled:=false;
timer2.Enabled:=false; //para a timer do ponto fixo
cmdSeqUnica.enabled:= false;

//contador:= 0; //posicao do inicio da trajetória no memo
timer1.Enabled:=true;  //liga o timer da trajetória

end;

procedure TFmPrincipal.Button6Click(Sender: TObject);
begin

button4.Enabled:=true;
button4.caption:= 'Continuar Envio de Dados';
button8.Enabled:=true;
//button3.Enabled:=true;
timer1.Enabled:= false;
cmdSeqUnica.enabled:=true;
  //acho melhor para parar a trajetório deixar memorizado o ultimo ponto enviado
//contador:=0;
end;

procedure TFmPrincipal.Button8Click(Sender: TObject);
begin
contador:=0;

//button4.Enabled:=false;
button4.caption:='Enviar dados de Sondagem';
button3.Enabled:=true;
button6.Enabled:=false;
button8.Enabled:=false;
labelstatus.caption:= edit1.text;

end;

procedure TFmPrincipal.FormCreate(Sender: TObject);
begin
labelstatus.caption:= edit1.text;
end;

procedure TFmPrincipal.Button1Click(Sender: TObject);
var
arquivo: textFile;
linhasArq: String;

begin

Memo1.Clear;
//Memo2.clear;

//forma mais simples e rápida de carregar o .trn no memo
if (dialogAbrir.Execute) then
  begin
    if (dialogAbrir.FileName <> '') then //só roda se o usuario abrir algum arquivo na caixa de dialogo
      begin
        editAbrir.text:= dialogAbrir.FileName;

        try
        Memo1.Lines.LoadFromFile(dialogAbrir.FileName);
        except
        Memo1.Lines.Add('Erro na abertura do arquivo !!!');
        end;

      end;
  end;



{ //forma mais complicada de abrir

if (dialogAbrir.Execute) then
  begin
    if (dialogAbrir.FileName <> '') then //só roda se o usuario abrir algum arquivo na caixa de dialogo
      begin
        editAbrir.text:= dialogAbrir.FileName;
        AssignFile(arquivo,dialogAbrir.FileName); //assimila em 'arquivo' o caminho apontado por dialogAbrir.FileName
        reset(arquivo); //prepara o arquivo para leitura

        While not (eof(arquivo)) do //roda o while até o 'eof' que é o fim do arquivo
          begin
            readln(arquivo,linhasArq); //lê a linha do arquivo
            Memo1.lines.add(linhasArq);

            if (Memo1.Lines.Count =1) then //para colocar o primeiro ponto da trajetoria com a primeira linha do arquivo
              begin
                edit1.text:= linhasArq;
              end;

          end;
          closefile(arquivo);
      end;
  end;
}


end;

procedure TFmPrincipal.cmdSeqUnicaClick(Sender: TObject);
begin

  if (Edit1.text <> '') then
    begin
    //comport.WriteStr(edit1.text); //sem quebra de linha e retorno de carro
    comport.WriteStr(edit1.text+char(13)+char(10));
    end;


end;

end.
