unit uLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Dialogs, Forms,
  SqlExpr, DBXpress, DB, DBClient, WinSock;

type
   TTypeLocalizar = (fsSearch, fsFilter);
   TTypePKey = (fsINT, fsSTR, fsDAT, fsINI, fsTRE);
  procedure AbreForm (aClasseForm : TComponentClass; aForm: TForm);
  procedure RefreshCds(aCds: TClientDataSet);
  procedure FilterSearch(aCds: TClientDataSet; aType: TTypeLocalizar; aPKEY: TTypePKey; aBusca: string);
  procedure FilterSearch2(aCds: TClientDataSet; aType: TTypeLocalizar; aPKEY, aPKEY2: TTypePKey; aBusca: string; aBusca2: string);
implementation

procedure AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
  {: método para abrir form}
  Application.CreateForm(aClasseForm, aForm);
  try
    aForm.ShowModal;
  finally
    aForm.Free;
  end;
end;


procedure RefreshCds(aCds : TClientDataSet);
begin
  {: atualiza o ClientDataSet (principalmente para Relatórios)}
  aCds.Close;
  aCds.Open;
end;

procedure FilterSearch(aCds: TClientDataSet; aType: TTypeLocalizar; aPKEY: TTypePKey; aBusca: string);
begin
  {: Filtra ou Busca os dados}
  aCds.Close;
  case aType of
    {: filtrar dados}
    fsFilter:
          case aPKEY of
          fsINT: aCds.Params[0].AsInteger := StrToInt(aBusca);
          fsSTR: aCds.Params[0].AsString  := aBusca;
          fsDAT: aCds.Params[0].AsDateTime := StrToDate(aBusca);
          end;
    {: buscar dados}
    fsSearch:
          case aPKEY of
          fsINI: aCds.Params[0].AsString := UpperCase(aBusca+'%');
          fsTRE: aCds.Params[0].AsString := UpperCase('%'+aBusca+'%');
          end;
  end;
  aCds.Open;
end;

procedure FilterSearch2(aCds: TClientDataSet; aType: TTypeLocalizar; aPKEY, aPKEY2: TTypePKey; aBusca: string; aBusca2: string);
begin
  {: Filtra ou Busca os dados}
  aCds.Close;
  case aType of
    {: filtrar dados}
    fsFilter:
       begin
          case aPKEY of
          fsINT: aCds.Params[0].AsInteger := StrToInt(aBusca);
          fsSTR: aCds.Params[0].AsString  := aBusca;
          fsDAT: aCds.Params[0].AsDateTime := StrToDate(aBusca);
          end;
          case aPKEY2 of
          fsINT: aCds.Params[1].AsInteger := StrToInt(aBusca2);
          fsSTR: aCds.Params[1].AsString  := aBusca2;
          fsDAT: aCds.Params[1].AsDateTime := StrToDate(aBusca2);
          end;
        end;
    {: buscar dados}
    fsSearch:
       begin
          case aPKEY of
          fsINI: aCds.Params[0].AsString := UpperCase(aBusca+'%');
          fsTRE: aCds.Params[0].AsString := UpperCase('%'+aBusca+'%');
          end;
          case aPKEY2 of
          fsINI: aCds.Params[1].AsString := UpperCase(aBusca2+'%');
          fsTRE: aCds.Params[1].AsString := UpperCase('%'+aBusca2+'%');
          end;
       end;
  end;
  aCds.Open;
end;





end.
