//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TBGFirebaseConnection.View.Connection"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button1Click(TObject *Sender)
{
	TBGFirebaseConnection1
	  ->Connect()
		->BaseURL("https://meuapp-e4931.firebaseio.com/")
		->Auth("Anonymous")
		->uId("76c7f3c2-f35a-4ea3-ac33-7dc3860465e1")
	  ->End()
	  ->Put()
		->Resource("2")
		->Json("{'Nome' : 'CodeRage Brasil', 'Idade' : 14 }")
	  ->End()
	  ->Exec();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
	TBGFirebaseConnection1
		->Connect()
			->BaseURL("https://meuapp-e4931.firebaseio.com/")
			->Auth("Anonymous")
			->uId("76c7f3c2-f35a-4ea3-ac33-7dc3860465e1")
		->End()
		->Get()
			->DataSet(FDMemTable1)
			->Resource("2")
		->End()
		->Exec();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button3Click(TObject *Sender)
{
	TBGFirebaseConnection1
	  ->Connect()
		->BaseURL("https://meuapp-e4931.firebaseio.com/")
		->Auth("Anonymous")
		->uId("76c7f3c2-f35a-4ea3-ac33-7dc3860465e1")
	  ->End()
	  ->Patch()
		->Resource("1")
		->Json("{ 'CPF' : 'XXXXXXXXXXX' }")
	  ->End()
	  ->Exec();
}
//---------------------------------------------------------------------------
