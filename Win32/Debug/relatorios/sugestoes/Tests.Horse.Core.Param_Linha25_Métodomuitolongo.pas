// Sugestão de correção para o smell: Método muito longo
// Arquivo original: c:\fontes\Curso Horse\modules\horse\tests\src\tests\Tests.Horse.Core.Param.pas
// Linha: 25

// Trecho original:
// ------------------
    function RequiredMessage(const AKey: String): string;
    function ConvertErrorMessage(const AKey, AValue, AType: String): string;

  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure ContainsKey;

    [Test]
    procedure NotContainsKey;

    [Test]
    procedure ContainsKeyDiferentCase;

    [Test]
    procedure ContainsValue;

    [Test]
    procedure NotContainsValue;

    [Test]
    procedure ToArray;

    [Test]
    procedure TryGetValueTrue;

    [Test]
    procedure TryGetValueFalse;

    [Test]
    procedure TryGetValueDiferentCase;

    [Test]
    procedure Content;

    [Test]
    procedure Count;

    [Test]
    procedure List;

    [Test]
    procedure Index;

    [Test]
    procedure IndexNotFound;

    [Test]
    procedure IndexDiferentCase;

    [Test]
    procedure AsBoolean;

    [Test]
    [TestCase('TrueValue1', 'True,true,true')]
    [TestCase('TrueValue2', '1,1,true')]
    [TestCase('FalseValue1', 'False,true,false')]
    [TestCase('FalseValue2', '5,1,false')]
    procedure AsBooleanParam(AParamValue, ATrueValue: string; AResult: Boolean);

    [Test]
    procedure AsBooleanNotRequired;

    [Test]
    procedure AsBooleanRequired;

    [Test]
    procedure AsCurrency;

    [Test]
    procedure AsCurrencyDecimalSeparator;

    [Test]
    procedure AsCurrencyNotRequired;

    [Test]
    procedure AsCurrencyRequired;

    [Test]
    procedure AsCurrencyErrorFormat;

    [Test]
    procedure AsDateTime;

    [Test]
    procedure AsDateTimeRequired;

    [Test]
    procedure AsDateTimeNotRequired;

    [Test]
    procedure AsDateTimeOnlyData;

    [Test]
    procedure AsDateTimeChangeFormat;

    [Test]
    procedure AsDateTimeInvalidFormat;

    [Test]
    procedure AsDate;

    [Test]
    procedure AsDateRequired;

    [Test]
    procedure AsDateNotRequired;

    [Test]
    procedure AsDateChangeFormat;

    [Test]
    procedure AsDateInvalidFormat;

    [Test]
    procedure AsExtended;

    [Test]
    procedure AsExtendedDecimalSeparator;

    [Test]
    procedure AsExtendedNotRequired;

    [Test]
    procedure AsExtendedRequired;

    [Test]
    procedure AsExtendedErrorFormat;

    [Test]
    procedure AsFloat;

    [Test]
    procedure AsFloatDecimalSeparator;

    [Test]
    procedure AsFloatNotRequired;

    [Test]
    procedure AsFloatRequired;

    [Test]
    procedure AsFloatErrorFormat;

    [Test]
    procedure AsInteger;

    [Test]
    procedure AsIntegerNotRequired;

    [Test]
    procedure AsIntegerRequired;

    [Test]
    procedure AsIntegerErrorFormat;

    [Test]
    procedure AsInt64;

    [Test]
    procedure AsInt64NotRequired;

    [Test]
    procedure AsInt64Required;

    [Test]
    procedure AsInt64ErrorFormat;

    [Test]
    procedure AsISO8601DateTime;

    [Test]
    procedure AsISO8601DateTimeOnlyData;

    [Test]
    procedure AsISO8601DateTimeNotRequired;

    [Test]
    procedure AsISO8601DateTimeRequired;

    [Test]
    procedure AsISO8601DateTimeErrorFormat;

    [Test]
    procedure AsStream;

    [Test]
    procedure AsStreamNotFoundNotRequired;

    [Test]
    procedure AsStreamNotFoundRequired;

    [Test]
    procedure AsStreamSaveToFile;

    [Test]
    procedure AsStreamNotFoundSaveToFile;

    [Test]
    procedure AsString;

    [Test]
    procedure AsStringRequired;

    [Test]
    procedure AsStringNotRequired;

    [Test]
    procedure AsStringDiferentCase;

    [Test]
    procedure AsTime;

    [Test]
    procedure AsTimeRequired;

    [Test]
    procedure AsTimeNotRequired;

    [Test]
    procedure AsTimeChangeFormat;

    [Test]
    procedure AsTimeInvalidFormat;
  end;


// Sugestão:
// Divida o método em submétodos menores com nomes descritivos.
