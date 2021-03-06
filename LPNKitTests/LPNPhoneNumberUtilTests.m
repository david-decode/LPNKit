//
//  LPNPhoneNumberUtilTests.m
//  LPNKit
//
//  Created by Darryl Thomas on 11/9/11.
//  Based on original code and protocol buffer:
//    Copyright (C) 2010-2011 The Libphonenumber Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "LPNPhoneNumberUtilTests.h"
#import "LPNPhoneNumber.h"
#import "LPNPhoneNumberUtil.h"
#import "LPNPhoneMetadata.h"
#import "LPNNumberFormat.h"
#import "LPNPhoneNumberDescription.h"

static LPNPhoneNumber *alphanumericNumber = nil;
static LPNPhoneNumber *aeUan = nil;
static LPNPhoneNumber *arMobile = nil;
static LPNPhoneNumber *arNumber = nil;
static LPNPhoneNumber *auNumber = nil;
static LPNPhoneNumber *bsMobile = nil;
static LPNPhoneNumber *bsNumber = nil;
static LPNPhoneNumber *deNumber = nil;
static LPNPhoneNumber *deShortNumber = nil;
static LPNPhoneNumber *gbMobile = nil;
static LPNPhoneNumber *gbNumber = nil;
static LPNPhoneNumber *itMobile = nil;
static LPNPhoneNumber *itNumber = nil;

static LPNPhoneNumber *jpStarNumber = nil;

static LPNPhoneNumber *mxMobile1 = nil;
static LPNPhoneNumber *mxMobile2 = nil;
static LPNPhoneNumber *mxNumber1 = nil;
static LPNPhoneNumber *mxNumber2 = nil;
static LPNPhoneNumber *nzNumber = nil;
static LPNPhoneNumber *sgNumber = nil;

static LPNPhoneNumber *usLongNumber = nil;
static LPNPhoneNumber *usNumber = nil;
static LPNPhoneNumber *usPremium = nil;
static LPNPhoneNumber *usLocalNumber = nil;
static LPNPhoneNumber *usShortByOneNumber = nil;
static LPNPhoneNumber *usTollfree = nil;
static LPNPhoneNumber *usSpoof = nil;
static LPNPhoneNumber *usSpoofWithRawInput = nil;

static LPNPhoneNumber *internationalTollfree = nil;
static LPNPhoneNumber *internationalTollfreeTooLong = nil;
static LPNPhoneNumber *universalPremiumRate = nil;
static LPNPhoneNumber *unknownCountryCodeNoRawInput = nil;

@implementation LPNPhoneNumberUtilTests
{
    LPNPhoneNumberUtil *phoneUtil;
}


+(void)setUp
{
    [super setUp];
    
    alphanumericNumber = [[LPNPhoneNumber alloc] init];
    alphanumericNumber.countryCode = 1;
    alphanumericNumber.nationalNumber = 80074935247;
    
    aeUan = [[LPNPhoneNumber alloc] init];
    aeUan.countryCode = 971;
    aeUan.nationalNumber = 600123456;
    
    arMobile = [[LPNPhoneNumber alloc] init];
    arMobile.countryCode = 54;
    arMobile.nationalNumber = 91187654321;
    
    arNumber = [[LPNPhoneNumber alloc] init];
    arNumber.countryCode = 54;
    arNumber.nationalNumber = 1187654321;
    
    auNumber = [[LPNPhoneNumber alloc] init];
    auNumber.countryCode = 61;
    auNumber.nationalNumber = 236618300;
    
    bsMobile = [[LPNPhoneNumber alloc] init];
    bsMobile.countryCode = 1;
    bsMobile.nationalNumber = 2423570000;
    
    bsNumber = [[LPNPhoneNumber alloc] init];
    bsNumber.countryCode = 1;
    bsNumber.nationalNumber = 2423651234;
    
    deNumber = [[LPNPhoneNumber alloc] init];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 30123456;
    
    deShortNumber = [[LPNPhoneNumber alloc] init];
    deShortNumber.countryCode = 49;
    deShortNumber.nationalNumber = 1234;
    
    gbMobile = [[LPNPhoneNumber alloc] init];
    gbMobile.countryCode = 44;
    gbMobile.nationalNumber = 7912345678;

    gbNumber = [[LPNPhoneNumber alloc] init];
    gbNumber.countryCode = 44;
    gbNumber.nationalNumber = 2070313000;
    
    itMobile = [[LPNPhoneNumber alloc] init];
    itMobile.countryCode = 39;
    itMobile.nationalNumber = 345678901;
    
    itNumber = [[LPNPhoneNumber alloc] init];
    itNumber.countryCode = 39;
    itNumber.nationalNumber = 236618300;
    itNumber.italianLeadingZero = YES;
    
    jpStarNumber = [[LPNPhoneNumber alloc] init];
    jpStarNumber.countryCode = 81;
    jpStarNumber.nationalNumber = 2345;
    
    mxMobile1 = [[LPNPhoneNumber alloc] init];
    mxMobile1.countryCode = 52;
    mxMobile1.nationalNumber = 12345678900;
    
    mxMobile2 = [[LPNPhoneNumber alloc] init];
    mxMobile2.countryCode = 52;
    mxMobile2.nationalNumber = 15512345678;
    
    mxNumber1 = [[LPNPhoneNumber alloc] init];
    mxNumber1.countryCode = 52;
    mxNumber1.nationalNumber = 3312345678;
    
    mxNumber2 = [[LPNPhoneNumber alloc] init];
    mxNumber2.countryCode = 52;
    mxNumber2.nationalNumber = 8211234567;
    
    nzNumber = [[LPNPhoneNumber alloc] init];
    nzNumber.countryCode = 64;
    nzNumber.nationalNumber = 33316005;
    
    sgNumber = [[LPNPhoneNumber alloc] init];
    sgNumber.countryCode = 65;
    sgNumber.nationalNumber = 65218000;
    
    usLongNumber = [[LPNPhoneNumber alloc] init];
    usLongNumber.countryCode = 1;
    usLongNumber.nationalNumber = 65025300001;

    usNumber = [[LPNPhoneNumber alloc] init];
    usNumber.countryCode = 1;
    usNumber.nationalNumber = 6502530000;
    
    usPremium = [[LPNPhoneNumber alloc] init];
    usNumber.countryCode = 1;
    usNumber.nationalNumber = 9002530000;
    
    usLocalNumber = [[LPNPhoneNumber alloc] init];
    usLocalNumber.countryCode = 1;
    usLocalNumber.nationalNumber = 2530000;
    
    usShortByOneNumber = [[LPNPhoneNumber alloc] init];
    usShortByOneNumber.countryCode = 1;
    usShortByOneNumber.nationalNumber = 650253000;
    
    usTollfree = [[LPNPhoneNumber alloc] init];
    usTollfree.countryCode = 1;
    usTollfree.nationalNumber = 8002530000;
    
    usSpoof = [[LPNPhoneNumber alloc] init];
    usSpoof.countryCode = 1;
    usSpoof.nationalNumber = 0;

    usSpoofWithRawInput = [[LPNPhoneNumber alloc] init];
    usSpoofWithRawInput.countryCode = 1;
    usSpoofWithRawInput.nationalNumber = 0;
    usSpoofWithRawInput.rawInput = @"000-000-0000";
    
    internationalTollfree = [[LPNPhoneNumber alloc] init];
    internationalTollfree.countryCode = 800;
    internationalTollfree.nationalNumber = 12345678;
    
    internationalTollfreeTooLong = [[LPNPhoneNumber alloc] init];
    internationalTollfreeTooLong.countryCode = 800;
    internationalTollfreeTooLong.nationalNumber = 123456789;
    
    universalPremiumRate = [[LPNPhoneNumber alloc] init];
    universalPremiumRate.countryCode = 979;
    universalPremiumRate.nationalNumber = 123456789;
    
    unknownCountryCodeNoRawInput = [[LPNPhoneNumber alloc] init];
    unknownCountryCodeNoRawInput.countryCode = 2;
    unknownCountryCodeNoRawInput.nationalNumber = 12345;
}

- (void)setUp
{
    [super setUp];
    
    [LPNPhoneNumberUtil resetSharedPhoneNumberUtil]; 
    phoneUtil = [LPNPhoneNumberUtil sharedPhoneNumberUtil];
}

+(void)tearDown
{
    [super tearDown];
}


-(void)testSupportedRegions
{
    STAssertTrue([phoneUtil.supportedRegions count] > 0, @"The number of supported regions should be greater than 0.");
}

- (void)testMissingMetadataFileThrowsRuntimeException
{
    // In normal usage we should never get a state where we are asking to load metadata that doesn't exist. However, if the bundles are missing, this could happen, and the best we can do is make sure the exception has the file name in it.
    
    @try {
        [phoneUtil loadMetadataFromFile:@"no/such/file" forRegion:@"XX" countryCallingCode:-1];
        STFail(@"Should throw an exception.");
    }
    @catch (NSException *exception) {
        STAssertFalse(NSEqualRanges(NSMakeRange(NSNotFound, 0), [[exception reason] rangeOfString:@"no/such/file_XX"]), @"Should have the correct exception reason.");
    }

    @try {
        [phoneUtil loadMetadataFromFile:@"no/such/file" forRegion:LPNNonGeoEntityRegionCode countryCallingCode:123];
        STFail(@"Should throw an exception.");
    }
    @catch (NSException *exception) {
        STAssertFalse(NSEqualRanges(NSMakeRange(NSNotFound, 0), [[exception reason] rangeOfString:@"no/such/file_123"]), @"Should have the correct exception reason.");
    }
}

-(void)testUSMetadata
{
    LPNPhoneMetadata *metadata = [phoneUtil metadataForRegion:@"US"];
    
    STAssertEqualObjects(@"US", metadata.identifier, @"Must have the correct identifier.");
    
    STAssertEquals(1, metadata.countryCode, @"Must have the correct country code.");
    
    STAssertEqualObjects(@"011", metadata.internationalDialingPrefix, @"Must have the correct international dialing prefix.");
    
    STAssertNotNil(metadata.nationalPrefix, @"Must have national prefix.");
    
    STAssertEquals(2, [metadata.numberFormats count], @"Must have the correct number of number formats.");
    
    
    LPNNumberFormat *testNumberFormat = (metadata.numberFormats)[1];
    
    STAssertEqualObjects(@"(\\d{3})(\\d{3})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    STAssertEqualObjects(@"$1 $2 $3", testNumberFormat.format, @"Must have the correct number format…erm…format.");
    
    STAssertEqualObjects(@"[12-689]\\d{9}|2[0-35-9]\\d{8}", metadata.generalDescription.nationalNumberPattern, @"General description must have the correct national number pattern.");
    
    STAssertEqualObjects(@"\\d{7}(?:\\d{3})?", metadata.generalDescription.possibleNumberPattern, @"General description must have the correct possible number pattern.");
    
    STAssertEquals(metadata.generalDescription, metadata.fixedLineDescription, @"General description must be exactly the same as the fixed line description.");
    
    STAssertEqualObjects(@"\\d{10}", metadata.tollFreeDescription.possibleNumberPattern, @"Tollfree description must have the correct possible number pattern.");
    
    STAssertEqualObjects(@"900\\d{7}", metadata.premiumRateDescription.possibleNumberPattern, @"Premium rate description must have the correct possible number pattern.");
    
    STAssertNil(metadata.sharedCostDescription, @"Should not have a shared cost description.");
}


- (void)testDEMetadata
{
    LPNPhoneMetadata *metadata = [phoneUtil metadataForRegion:@"DE"];
    
    STAssertEqualObjects(@"DE", metadata.identifier, @"Must have the correct identifier.");
    
    STAssertEquals(49, metadata.countryCode, @"Must have the correct country code.");
    
    STAssertEqualObjects(@"00", metadata.internationalDialingPrefix, @"Must have the correct international dialing prefix.");
    
    STAssertEqualObjects(@"0", metadata.nationalPrefix, @"Must have the correct national prefix.");
    
    STAssertEquals(6, [metadata.numberFormats count], @"Must have the correct number of number formats.");
    
    
    LPNNumberFormat *testNumberFormat = (metadata.numberFormats)[5];
    
    STAssertEquals(1, [testNumberFormat.leadingDigitsPatterns count], @"Must have the correct number of leading digits patterns.");
    
    STAssertEqualObjects(@"900", (testNumberFormat.leadingDigitsPatterns)[0], @"Must have the correct leading digits pattern.");
    
    STAssertEqualObjects(@"(\\d{3})(\\d{3,4})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    STAssertEqualObjects(@"$1 $2 $3", testNumberFormat.format, @"Must have the correct number format…erm…format.");
    
    STAssertEqualObjects(@"(?:[24-6]\\d{2}|3[03-9]\\d|[789](?:[1-9]\\d|0[2-9]))\\d{1,8}", metadata.fixedLineDescription.nationalNumberPattern, @"Fixed line description must have the correct national number pattern.");
    
    STAssertEqualObjects(@"\\d{2,14}", metadata.fixedLineDescription.possibleNumberPattern, @"Fixed line description must have the correct possible number pattern.");

    STAssertEqualObjects(@"30123456", metadata.fixedLineDescription.exampleNumber, @"Fixed line description must have the correct example number.");
    
    STAssertEqualObjects(@"\\d{10}", metadata.tollFreeDescription.possibleNumberPattern, @"Tollfree description must have the correct possible number pattern.");
    
    STAssertEqualObjects(@"900([135]\\d{6}|9\\d{7})", metadata.premiumRateDescription.nationalNumberPattern, @"Premium rate description must have the correct national number pattern.");
    
}



- (void)testARMetadata
{
    LPNPhoneMetadata *metadata = [phoneUtil metadataForRegion:@"AR"];
    
    STAssertEqualObjects(@"AR", metadata.identifier, @"Must have the correct identifier.");
    
    STAssertEquals(54, metadata.countryCode, @"Must have the correct country code.");
    
    STAssertEqualObjects(@"00", metadata.internationalDialingPrefix, @"Must have the correct international dialing prefix.");
    
    STAssertEqualObjects(@"0", metadata.nationalPrefix, @"Must have the correct national prefix.");
    
    STAssertEqualObjects(@"0(?:(11|343|3715)15)?", metadata.nationalPrefixForParsing, @"Must have the correct national prefix for parsing.");
    
    STAssertEqualObjects(@"9$1", metadata.nationalPrefixTransformRule, @"Must have the correct national prefix transform rule.");
    
    
    LPNNumberFormat *testNumberFormat = (metadata.numberFormats)[2];
    
    STAssertEqualObjects(@"$2 15 $3-$4", testNumberFormat.format, @"Must have the correct number format…erm…format.");
    
    testNumberFormat = (metadata.numberFormats)[3];
    
    STAssertEqualObjects(@"(9)(\\d{4})(\\d{2})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    testNumberFormat = (metadata.internationalNumberFormats)[3];
    
    STAssertEqualObjects(@"(9)(\\d{4})(\\d{2})(\\d{4})", testNumberFormat.pattern, @"Must have the correct number format pattern.");
    
    STAssertEqualObjects(@"$1 $2 $3 $4", testNumberFormat.format, @"Must have the correct number format…erm…format.");
}

- (void)testInternationalTollFreeMetadata
{
    LPNPhoneMetadata *metadata = [phoneUtil metadataForNonGeographicalRegion:800];
    STAssertEqualObjects(@"001", metadata.identifier, @"Must have the correct identifier.");
    STAssertEquals(800, metadata.countryCode, @"Must have the correct country code.");
    
    LPNNumberFormat *numberFormat = metadata.numberFormats[0];
    STAssertEqualObjects(@"$1 $2", numberFormat.format, @"Must have the correct number format format.");
    STAssertEqualObjects(@"(\\d{4})(\\d{4}", numberFormat.pattern, @"Must have the correct number format pattern.");
    STAssertEqualObjects(@"12345678", metadata.generalDescription.exampleNumber, @"Must have correct general description example number.");
    STAssertEqualObjects(@"12345678", metadata.tollFreeDescription.exampleNumber, @"Must have correct toll-free description example number.");
}

- (void)testPhoneNumberIsGeographical
{
    STAssertFalse([phoneUtil phoneNumberIsGeographical:bsMobile], @"Should correctly return whether a phone number is geographical.");
    STAssertTrue([phoneUtil phoneNumberIsGeographical:auNumber], @"Should correctly return whether a phone number is geographical.");
    STAssertFalse([phoneUtil phoneNumberIsGeographical:internationalTollfree], @"Should correctly return whether a phone number is geographical.");
}


- (void)testIsLeadingZeroPossibleForCountryCallingCode
{
    STAssertTrue([phoneUtil isLeadingZeroPossibleForCountryCallingCode:39], @"Leading zero should be possible for Italy.");
    STAssertFalse([phoneUtil isLeadingZeroPossibleForCountryCallingCode:1], @"Leading zero should not be possible for USA.");
    STAssertTrue([phoneUtil isLeadingZeroPossibleForCountryCallingCode:800], @"Leading zero should be possible for international toll-free.");
    STAssertTrue([phoneUtil isLeadingZeroPossibleForCountryCallingCode:979], @"Leading zero should not be possible for international premium-rate.");
    STAssertFalse([phoneUtil isLeadingZeroPossibleForCountryCallingCode:888], @"Leading zero should not be possible for calling codes not in metadata.");
}


- (void)testLengthOfGeographicalAreaCodeForPhoneNumber
{
    STAssertEquals(3, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:usNumber], @"Length of US number area code (650) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:usTollfree], @"Length of US tollfree area code should be 0.");
    
    STAssertEquals(2, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:gbNumber], @"Length of GB number area code (20) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:gbMobile], @"Length of GB mobile area code (none) should be correct.");
    
    STAssertEquals(2, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:arMobile], @"Length of AR number area code (11) should be correct.");
    
    STAssertEquals(1, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:auNumber], @"Length of AU number area code (2) should be correct.");
    
    STAssertEquals(2, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:itNumber], @"Length of IT number area code should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:sgNumber], @"Length of SG number area code (none) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:usShortByOneNumber], @"Length of invalid US number (short by 1 digit, no area code) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfGeographicalAreaCodeForPhoneNumber:internationalTollfree], @"Length of international toll-free area code (none) should be correct.");
    
}


- (void)testLengthOfNationalDestinationCodeForPhoneNumber
{
    STAssertEquals(3, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:usNumber], @"Length of national destination code for us number (650) should be correct.");
    
    STAssertEquals(3, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:usTollfree], @"Length of national destination code for NA tollfree (800) should be correct.");
    
    STAssertEquals(2, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:gbNumber], @"Length of national destination code for gb number (20) should be correct.");
    
    STAssertEquals(4, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:gbMobile], @"Length of national destination code for gb mobile (7912) should be correct.");
    
    STAssertEquals(2, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:arNumber], @"Length of national destination code for ar number (11) should be correct.");
    
    STAssertEquals(3, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:arMobile], @"Length of national destination code for ar mobile (911) should be correct.");
    
    STAssertEquals(1, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:auNumber], @"Length of national destination code for au number (2) should be correct.");
    
    STAssertEquals(4, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:sgNumber], @"Length of national destination code for sg number (6521) should be correct.");
    
    STAssertEquals(0, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:usShortByOneNumber], @"Length of national destination code for invalid us number (short by 1 digit, no NDC) should be correct.");
    
    LPNPhoneNumber * invalidCountryPhoneNumber = [[LPNPhoneNumber alloc] init];
    invalidCountryPhoneNumber.countryCode = 123;
    invalidCountryPhoneNumber.nationalNumber = 6502530000;
    STAssertEquals(0, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:invalidCountryPhoneNumber], @"Number with invalid country code should not have an NDC.");
    
    STAssertEquals(4, [phoneUtil lengthOfNationalDestinationCodeForPhoneNumber:internationalTollfree], @"Length of national destination code for international toll-free number (1234) should be correct.");
}


- (void)testNationalSignificantNumberForPhoneNumber
{
    STAssertEqualObjects(@"6502530000", [phoneUtil nationalSignificantNumberForPhoneNumber:usNumber], @"Should return the correct NSN for a US number.");
    
    STAssertEqualObjects(@"345678901", [phoneUtil nationalSignificantNumberForPhoneNumber:itMobile], @"Should return the correct NSN for an IT mobile.");
    
    STAssertEqualObjects(@"0236618300", [phoneUtil nationalSignificantNumberForPhoneNumber:itNumber], @"Should return the correct NSN for an IT fixed line number.");
    
    STAssertEqualObjects(@"12345678", [phoneUtil nationalSignificantNumberForPhoneNumber:internationalTollfree], @"Should return the correct NSN for an international toll-free number.");
}


- (void)testExampleNumbers
{
    STAssertEqualObjects(deNumber, [phoneUtil examplePhoneNumberForRegion:@"DE"], @"Should return the correct phone number for the region.");
    
    STAssertEqualObjects(deNumber, [phoneUtil examplePhoneNumberOfType:LPNFixedLinePhoneNumberType forRegion:@"DE"], @"Should return the correct phone number for the region and type.");
    
    STAssertNil([phoneUtil examplePhoneNumberOfType:LPNMobilePhoneNumberType forRegion:@"DE"], @"Should not return a phone number when no example for the phone number and type is available.");
    
    STAssertNotNil([phoneUtil examplePhoneNumberOfType:LPNFixedLinePhoneNumberType forRegion:@"US"], @"Should return an example number when placed under general description when request type is fixed line.");

    STAssertNotNil([phoneUtil examplePhoneNumberOfType:LPNMobilePhoneNumberType forRegion:@"US"], @"Should return an example number when placed under general description when request type is mobile.");
    
    STAssertNil([phoneUtil examplePhoneNumberOfType:LPNMobilePhoneNumberType forRegion:@"CS"], @"Should not return an example number when the region code is invalid.");
    
    // Region code 001 is reserved for supporting non-geographical country calling code. We do not support getting an example number for it with this method.
    STAssertNil([phoneUtil examplePhoneNumberForRegion:LPNNonGeoEntityRegionCode], @"Should not return an example number for non-geographical entity regions.");
}

- (void)testExampleNumbersForNonGeographicalEntities
{
    STAssertEqualObjects(internationalTollfree, [phoneUtil examplePhoneNumberForNonGeographicalEntity:800], @"Should return the correct phone number.");
    STAssertEqualObjects(universalPremiumRate, [phoneUtil examplePhoneNumberForNonGeographicalEntity:979], @"Should return the correct phone number.");
}


- (void)testStringByCovertingAlphaCharactersInNumberString
{
    NSString *input = @"1800-ABC-DEF";
    NSString *expectedOutput = @"1800-222-333";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil stringByConvertingAlphaCharactersInNumberString:input], @"Should convert alpha characters correctly.");
}


- (void)testNormalizedStringRemovesPunctuation
{
    NSString *input = @"034-56&+#2\u00AD34";
    NSString *expectedOutput = @"03456234";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should remove punctuation correctly.");
}


- (void)testNormalizedStringReplacesAlphaCharacters
{
    NSString *input = @"034-I-am-HUNGRY";
    NSString *expectedOutput = @"034426486479";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should replace alpha characters correctly.");
}


- (void)testNormalizedStringReplacesOtherDigits
{
    NSString *input = @"\uFF125\u0665";
    NSString *expectedOutput = @"255";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should replace non-latin digits correctly.");
    
    
    input = @"\u06F52\u06F0";
    expectedOutput = @"520";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedString:input], @"Should replace Eastern-Arabic digits correctly.");
}


- (void)testNormalizedStringWithDigitsOnlyStripsAlphaCharacters
{
    NSString *input = @"034-56&+a#234";
    NSString *expectedOutput = @"03456234";
    
    STAssertEqualObjects(expectedOutput, [phoneUtil normalizedStringWithDigitsOnly:input], @"Should remove alpha characters correctly.");
}


- (void)testFormatUSNumber
{
    STAssertEqualObjects(@"650 253 0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    STAssertEqualObjects(@"800 253 0000", [phoneUtil stringWithPhoneNumber:usTollfree format:LPNNationalPhoneNumberFormat], @"Should correctly national format tollfree phone numbers.");
    
    STAssertEqualObjects(@"+1 800 253 0000", [phoneUtil stringWithPhoneNumber:usTollfree format:LPNInternationalPhoneNumberFormat], @"Should correctly international format tollfree phone numbers.");
    
    STAssertEqualObjects(@"900 253 0000", [phoneUtil stringWithPhoneNumber:usPremium format:LPNNationalPhoneNumberFormat], @"Should correctly national format premium phone numbers.");
    
    STAssertEqualObjects(@"+1 900 253 0000", [phoneUtil stringWithPhoneNumber:usPremium format:LPNInternationalPhoneNumberFormat], @"Should correctly international format premium phone numbers.");
    
    STAssertEqualObjects(@"tel:+1-900-253-0000", [phoneUtil stringWithPhoneNumber:usPremium format:LPNRFC3966PhoneNumberFormat], @"Should correctly RFC3966 format premium phone numbers.");
    
    STAssertEqualObjects(@"000-000-0000", [phoneUtil stringWithPhoneNumber:usSpoofWithRawInput format:LPNNationalPhoneNumberFormat], @"Numbers with all zeros should format using raw input no matter which format is specified.");
    
    STAssertEqualObjects(@"0", [phoneUtil stringWithPhoneNumber:usSpoof format:LPNNationalPhoneNumberFormat], @"Numbers with all zeros should format using raw input no matter which format is specified.");
}


- (void)testFormatBSNumber
{
    STAssertEqualObjects(@"242 365 1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+1 242 365 1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
}


- (void)testFormatGBNumber
{
    STAssertEqualObjects(@"(020) 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+44 20 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");

    STAssertEqualObjects(@"(07912) 345 678", [phoneUtil stringWithPhoneNumber:gbMobile format:LPNNationalPhoneNumberFormat], @"Should correctly national format mobile numbers.");
    STAssertEqualObjects(@"+44 7912 345 678", [phoneUtil stringWithPhoneNumber:gbMobile format:LPNInternationalPhoneNumberFormat], @"Should correctly international format mobile numbers.");
}


- (void)testFormatDENumber
{
    LPNPhoneNumber *deNumber = [[LPNPhoneNumber alloc] init];
    
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 301234;
    STAssertEqualObjects(@"030/1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 30/1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    STAssertEqualObjects(@"tel:+49-30-1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNRFC3966PhoneNumberFormat], @"Should correctly RFC3966 format phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 291123;
    STAssertEqualObjects(@"0291 123", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 291 123", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 29112345678;
    STAssertEqualObjects(@"0291 12345678", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 291 12345678", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 912312345;
    STAssertEqualObjects(@"09123 12345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 9123 12345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
        
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 80212345;
    STAssertEqualObjects(@"08021 2345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    
    STAssertEqualObjects(@"+49 8021 2345", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    
    
    STAssertEqualObjects(@"1234", [phoneUtil stringWithPhoneNumber:deShortNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format short phone numbers.");
    
    STAssertEqualObjects(@"+49 1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format short phone numbers.");
    
    
    [deNumber clear];
    deNumber.countryCode = 49;
    deNumber.nationalNumber = 41341234;
    STAssertEqualObjects(@"04134 1234", [phoneUtil stringWithPhoneNumber:deNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
}


- (void)testFormatITNumber
{
    STAssertEqualObjects(@"02 3661 8300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+39 02 3661 8300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+390236618300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");


    STAssertEqualObjects(@"345 678 901", [phoneUtil stringWithPhoneNumber:itMobile format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+39 345 678 901", [phoneUtil stringWithPhoneNumber:itMobile format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+39345678901", [phoneUtil stringWithPhoneNumber:itMobile format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}


- (void)testFormatAUNumber
{
    STAssertEqualObjects(@"02 3661 8300", [phoneUtil stringWithPhoneNumber:auNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+61 2 3661 8300", [phoneUtil stringWithPhoneNumber:auNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+61236618300", [phoneUtil stringWithPhoneNumber:auNumber format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    LPNPhoneNumber *au800Number = [[LPNPhoneNumber alloc] init];
    au800Number.countryCode = 61;
    au800Number.nationalNumber = 1800123456;
    STAssertEqualObjects(@"1800 123 456", [phoneUtil stringWithPhoneNumber:au800Number format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+61 1800 123 456", [phoneUtil stringWithPhoneNumber:au800Number format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+611800123456", [phoneUtil stringWithPhoneNumber:au800Number format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}


- (void)testFormatARNumber
{
    STAssertEqualObjects(@"011 8765-4321", [phoneUtil stringWithPhoneNumber:arNumber format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+54 11 8765-4321", [phoneUtil stringWithPhoneNumber:arNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+541187654321", [phoneUtil stringWithPhoneNumber:arNumber format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    
    STAssertEqualObjects(@"011 15 8765-4321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+54 9 11 8765 4321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+5491187654321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}



- (void)testFormatMXNumber
{
    STAssertEqualObjects(@"045 234 567 8900", [phoneUtil stringWithPhoneNumber:mxMobile1 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 1 234 567 8900", [phoneUtil stringWithPhoneNumber:mxMobile1 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+5212345678900", [phoneUtil stringWithPhoneNumber:mxMobile1 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    
    STAssertEqualObjects(@"045 55 1234 5678", [phoneUtil stringWithPhoneNumber:mxMobile2 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 1 55 1234 5678", [phoneUtil stringWithPhoneNumber:mxMobile2 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+5215512345678", [phoneUtil stringWithPhoneNumber:mxMobile2 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");


    STAssertEqualObjects(@"01 33 1234 5678", [phoneUtil stringWithPhoneNumber:mxNumber1 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 33 1234 5678", [phoneUtil stringWithPhoneNumber:mxNumber1 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+523312345678", [phoneUtil stringWithPhoneNumber:mxNumber1 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
    
    
    STAssertEqualObjects(@"01 821 123 4567", [phoneUtil stringWithPhoneNumber:mxNumber2 format:LPNNationalPhoneNumberFormat], @"Should correctly national format phone numbers.");
    STAssertEqualObjects(@"+52 821 123 4567", [phoneUtil stringWithPhoneNumber:mxNumber2 format:LPNInternationalPhoneNumberFormat], @"Should correctly international format phone numbers.");
    STAssertEqualObjects(@"+528211234567", [phoneUtil stringWithPhoneNumber:mxNumber2 format:LPNE164PhoneNumberFormat], @"Should correctly E164 format phone numbers.");
}


- (void)testFormatOutOfCountryCallingNumber
{
    STAssertEqualObjects(@"00 1 900 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usPremium region:@"DE"], @"Should properly format out of country calling number strings for premium numbers.");

    STAssertEqualObjects(@"1 650 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usNumber region:@"BS"], @"Should properly format out of country calling number strings.");

    STAssertEqualObjects(@"00 1 650 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usNumber region:@"PL"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 44 7912 345 678", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:gbMobile region:@"US"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"00 49 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:deShortNumber region:@"GB"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:deShortNumber region:@"DE"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 39 02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"US"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"IT"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"+39 02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"SG"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"6521 8000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:sgNumber region:@"SG"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 54 9 11 8765 4321", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arMobile region:@"US"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 800 1234 5678", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:internationalTollfree region:@"US"], @"Should properly format out of country calling number strings.");
    
    LPNPhoneNumber *arNumberWithExtension = [arNumber copy];
    arNumberWithExtension.extension = @"1234";
    
    STAssertEqualObjects(@"011 54 9 11 8765 4321 ext. 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arNumberWithExtension region:@"US"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"0011 54 9 11 8765 4321 ext. 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arNumberWithExtension region:@"AU"], @"Should properly format out of country calling number strings.");
    
    STAssertEqualObjects(@"011 15 8765-4321 ext. 1234", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:arNumberWithExtension region:@"AR"], @"Should properly format out of country calling number strings.");
    
}

- (void)testFormatOutOfCountryWithInvalidRegion
{
    // AQ/Antartica isn't a valid region code for phone number formatting, so this falls back to intl formatting.
    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usNumber region:@"AQ"], @"Should properly format out of country calling number strings.");

    // For region code 001, the out of country format always turns into the international format.
    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usNumber region:LPNNonGeoEntityRegionCode], @"Should properly format out of country calling number strings.");
}

- (void)testFormatOutOfCountryWithPreferredIntlPrefix
{
    STAssertEqualObjects(@"0011 39 02 3661 8300", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:itNumber region:@"AU"], @"Should use the preferred international prefix.");
}


- (void)testFormatOutOfCountryKeepingAlphaCharacters
{
    LPNPhoneNumber *alphaNumericNumber = [[LPNPhoneNumber alloc] init];
    alphaNumericNumber.countryCode = 1;
    alphaNumericNumber.nationalNumber = 8007493524;
    alphaNumericNumber.rawInput = @"1800 six-flag";
    
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");

    alphaNumericNumber.rawInput = @"1-800-SIX-flag";
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    alphaNumericNumber.rawInput = @"Call us from UK: 00 1 800 SIX-flag";
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    alphaNumericNumber.rawInput = @"800 SIX-flag";
    STAssertEqualObjects(@"0011 1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    STAssertEqualObjects(@"1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"US" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    STAssertEqualObjects(@"1 800 SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"BS" keepAlphaCharacters:YES], @"Should format properly with alpha characters.");
    
    alphaNumericNumber.rawInput = nil;
    STAssertEqualObjects(@"00 1 800 749 3524", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"DE" keepAlphaCharacters:YES], @"Should format properly without raw input.");
    
    alphaNumericNumber.countryCode = 61;
    alphaNumericNumber.nationalNumber = 827493524;
    alphaNumericNumber.rawInput = @"+61 82749-FLAG";
    STAssertEqualObjects(@"082749-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should have the national prefix fixed.");
    
    alphaNumericNumber.rawInput = @"082749-FLAG";
    STAssertEqualObjects(@"082749-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should have the national prefix fixed.");
    
    
    alphaNumericNumber.nationalNumber = 18007493524;
    alphaNumericNumber.rawInput = @"1-800-SIX-flag";
    STAssertEqualObjects(@"1-800-SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should not have the national prefix fixed.");
    
    alphaNumericNumber.nationalNumber = 1800749352;
    STAssertEqualObjects(@"1800 749 352", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AU" keepAlphaCharacters:YES], @"Should not permanently change metadata.");


    STAssertEqualObjects(@"+61 1-800-SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"SG" keepAlphaCharacters:YES], @"Should work in regions with mutiple international prefixes.");
    
    STAssertEqualObjects(@"+61 1-800-SIX-FLAG", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AQ" keepAlphaCharacters:YES], @"Should work with a non-supported region.");
    
    alphaNumericNumber.countryCode = 0;
    alphaNumericNumber.nationalNumber = 18007493524;
    alphaNumericNumber.rawInput = @"1-800-SIX-flag";
    STAssertEqualObjects(@"1-800-SIX-flag", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"DE" keepAlphaCharacters:YES], @"Should use only raw input when country code is invalid.");
    
    alphaNumericNumber.countryCode = 1;
    alphaNumericNumber.nationalNumber = 80749;
    alphaNumericNumber.rawInput = @"180-SIX";
    STAssertEqualObjects(@"00 1 180-SIX", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"DE" keepAlphaCharacters:YES], @"");
    
    alphaNumericNumber.countryCode = 1;
    alphaNumericNumber.nationalNumber = 80749;
    alphaNumericNumber.rawInput = @"180-SIX";
    STAssertEqualObjects(@"+1 180-SIX", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:alphaNumericNumber region:@"AQ" keepAlphaCharacters:YES], @"Should not stip country code when the number is invalid and dialing from a non-supported region.");
}


- (void)testFormatWithCarrierCode
{
    // Only supported for AR in test data and only for mobile numbers starting with certain values.
    LPNPhoneNumber *arMobile = [[LPNPhoneNumber alloc] init];
    arMobile.countryCode = 54;
    arMobile.nationalNumber = 92234654321;
    STAssertEqualObjects(@"02234 65-4321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNNationalPhoneNumberFormat], @"Should format properly with national format.");

    STAssertEqualObjects(@"02234 14 65-4321", [phoneUtil nationalNumberFormatForPhoneNumber:arMobile withCarrierCode:@"14"], @"Should format properly with carrier code.");
    STAssertEqualObjects(@"02234 65-4321", [phoneUtil nationalNumberFormatForPhoneNumber:arMobile withCarrierCode:nil], @"Should format properly with nil carrier code.");
    STAssertEqualObjects(@"02234 65-4321", [phoneUtil nationalNumberFormatForPhoneNumber:arMobile withCarrierCode:@""], @"Should format properly with empty carrier code.");
    
    STAssertEqualObjects(@"+5492234654321", [phoneUtil stringWithPhoneNumber:arMobile format:LPNE164PhoneNumberFormat], @"Should not include carrier code when the international rule is used.");
    
    STAssertEqualObjects(@"650 253 0000", [phoneUtil nationalNumberFormatForPhoneNumber:usNumber withCarrierCode:@"15"], @"Should not include carrier code when unsupported.");
    
    STAssertEqualObjects(@"12345", [phoneUtil nationalNumberFormatForPhoneNumber:unknownCountryCodeNoRawInput withCarrierCode:@"89"], @"Should only return the NSN for a number with an invalid country code.");
}

- (void)testFormatWithPreferredCarrierCode
{
    // Only supported for AR in test data.
    LPNPhoneNumber *arNumber = [[LPNPhoneNumber alloc] init];
    arNumber.countryCode = 54;
    arNumber.nationalNumber = 91234125678;
    
    STAssertEqualObjects(@"01234 15 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@"15"], @"Should format properly with no preferred carrier code stored in the number itself.");
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:nil], @"Should format properly with no preferred carrier code stored in the number itself.");
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@""], @"Should format properly with no preferred carrier code stored in the number itself.");
    
    arNumber.preferredDomesticCarrierCode = @"19";
    
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil stringWithPhoneNumber:arNumber format:LPNNationalPhoneNumberFormat], @"Should format properly with preferred carrier code present.");
    STAssertEqualObjects(@"01234 19 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@"15"], @"Should format properly with preferred carrier code present.");
    STAssertEqualObjects(@"01234 19 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:nil], @"Should format properly with preferred carrier code present.");
    STAssertEqualObjects(@"01234 19 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@""], @"Should format properly with preferred carrier code present.");
    
    arNumber.preferredDomesticCarrierCode = @"";
    
    STAssertEqualObjects(@"01234 12-5678", [phoneUtil nationalNumberFormatForPhoneNumber:arNumber withPreferredCarrierCode:@"15"], @"Should format properly with preferred carrier code set to an empty string.");
    
    LPNPhoneNumber *usNumberWithPreferredCC = [[LPNPhoneNumber alloc] init];
    usNumberWithPreferredCC.nationalNumber = 4241231234;
    usNumberWithPreferredCC.preferredDomesticCarrierCode = @"99";
    STAssertEqualObjects(@"424 123 1234", [phoneUtil stringWithPhoneNumber:usNumberWithPreferredCC format:LPNNationalPhoneNumberFormat], @"Should not include preferred carrier code when unsupported.");
    STAssertEqualObjects(@"424 123 1234", [phoneUtil nationalNumberFormatForPhoneNumber:usNumberWithPreferredCC withPreferredCarrierCode:@"15"], @"Should not include preferred carrier code when unsupported.");
}

- (void)testFormatNumberForMobileDialing
{
    // US toll free numbers are marked as no international dialing in the test data for testing purposes.
    
    STAssertEqualObjects(@"800 253 0000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"US" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"CN" includeFormattingSymbols:YES], @"Should return an empty string for international mobile dialing when disallowed.");
    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumber region:@"US" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");
    
    LPNPhoneNumber *usNumberWithExtension = [usNumber copy];
    usNumberWithExtension.extension = @"1234";

    STAssertEqualObjects(@"+1 650 253 0000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumberWithExtension region:@"US" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");

    STAssertEqualObjects(@"8002530000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"US" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usTollfree region:@"CN" includeFormattingSymbols:NO], @"Should return an empty string for international mobile dialing when disallowed.");
    STAssertEqualObjects(@"+16502530000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumber region:@"US" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"+16502530000", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usNumberWithExtension region:@"US" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    
    // An invalid US number, which is one digit too long.
    STAssertEqualObjects(@"+165025300001", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usLongNumber region:@"US" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"+1 65025300001", [phoneUtil mobileDialingNumberFormatForPhoneNumber:usLongNumber region:@"US" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");
    
    // Star numbers. In real life, they appear in Israel, but we have them in JP in our test metadata.
    STAssertEqualObjects(@"*2345", [phoneUtil mobileDialingNumberFormatForPhoneNumber:jpStarNumber region:@"JP" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"*2345", [phoneUtil mobileDialingNumberFormatForPhoneNumber:jpStarNumber region:@"JP" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");
    
    STAssertEqualObjects(@"+80012345678", [phoneUtil mobileDialingNumberFormatForPhoneNumber:internationalTollfree region:@"JP" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"+800 1234 5678", [phoneUtil mobileDialingNumberFormatForPhoneNumber:internationalTollfree region:@"JP" includeFormattingSymbols:YES], @"Should format properly for mobile dialing.");
    
    // UAE numbers beginning with 600 (classified as UAN) need to dialled without +971 locally.
    STAssertEqualObjects(@"+971600123456", [phoneUtil mobileDialingNumberFormatForPhoneNumber:aeUan region:@"JP" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
    STAssertEqualObjects(@"600123456", [phoneUtil mobileDialingNumberFormatForPhoneNumber:aeUan region:@"AE" includeFormattingSymbols:NO], @"Should format properly for mobile dialing.");
}

- (void)testFormatByPattern
{
    LPNNumberFormat * numberFormat = [[LPNNumberFormat alloc] init];
    numberFormat.pattern = @"(\\d{3})(\\d{3})(\\d{4})";
    numberFormat.format = @"($1) $2-$3";
    
    STAssertEqualObjects(@"(650) 253-0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should format properly using a custom number format.");
    STAssertEqualObjects(@"+1 (650) 253-0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should format properly using a custom number format.");
    STAssertEqualObjects(@"tel:+1-650-253-0000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNRFC3966PhoneNumberFormat pattern:numberFormat], @"Should format properly using a custom number format.");
    
    // $NP is set to '1' for the US. Here we check that for other NANPA countries the US rules are followed.
    numberFormat.nationalPrefixFormattingRule = @"$NP ($FG)";
    numberFormat.format = @"$1 $2-$3";
    
    STAssertEqualObjects(@"1 (242) 365-1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    STAssertEqualObjects(@"+1 242 365-1234", [phoneUtil stringWithPhoneNumber:bsNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.pattern = @"(\\d{2})(\\d{5})(\\d{3})";
    numberFormat.format = @"$1-$2 $3";
    
    STAssertEqualObjects(@"02-36618 300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    STAssertEqualObjects(@"+39 02-36618 300", [phoneUtil stringWithPhoneNumber:itNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.nationalPrefixFormattingRule = @"$NP$FG";
    numberFormat.pattern = @"(\\d{2})(\\d{4})(\\d{4})";
    numberFormat.format = @"$1 $2 $3";
    
    STAssertEqualObjects(@"020 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.nationalPrefixFormattingRule = @"($NP$FG)";
    
    STAssertEqualObjects(@"(020) 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    
    numberFormat.nationalPrefixFormattingRule = @"";
    
    STAssertEqualObjects(@"20 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNNationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
    STAssertEqualObjects(@"+44 20 7031 3000", [phoneUtil stringWithPhoneNumber:gbNumber format:LPNInternationalPhoneNumberFormat pattern:numberFormat], @"Should properly format using a custom number format.");
}

- (void)testFormatE164Number
{
    STAssertEqualObjects(@"+16502530000", [phoneUtil stringWithPhoneNumber:usNumber format:LPNE164PhoneNumberFormat], @"Should properly format using E164 format.");
    STAssertEqualObjects(@"+4930123456", [phoneUtil stringWithPhoneNumber:deNumber format:LPNE164PhoneNumberFormat], @"Should properly format using E164 format.");
    STAssertEqualObjects(@"+80012345678", [phoneUtil stringWithPhoneNumber:internationalTollfree format:LPNE164PhoneNumberFormat], @"Should properly format using E164 format.");
}

- (void)testFormatNumberWithExtension
{
    LPNPhoneNumber *nzNumberWithExtension = [nzNumber copy];
    nzNumberWithExtension.extension = @"1234";
    
    STAssertEqualObjects(@"03-331 6005 ext. 1234", [phoneUtil stringWithPhoneNumber:nzNumberWithExtension format:LPNNationalPhoneNumberFormat], @"Should properly format using default extension prefix.");
    
    STAssertEqualObjects(@"tel:+64-3-331-6005;ext=1234", [phoneUtil stringWithPhoneNumber:nzNumberWithExtension format:LPNRFC3966PhoneNumberFormat], @"Should properly format using RFC 3966 syntax");
    
    LPNPhoneNumber *usNumberWithExtension = [usNumber copy];
    usNumberWithExtension.extension = @"4567";
    
    STAssertEqualObjects(@"650 253 0000 extn. 4567", [phoneUtil stringWithPhoneNumber:usNumberWithExtension format:LPNNationalPhoneNumberFormat], @"Should properly format using extension prefix overridden in the territory information for the US.");
}

- (void)testFormatUsingOriginalNumberFormat
{
    LPNPhoneNumber *number1 = [phoneUtil phoneNumberByParsingString:@"+442087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"+44 20 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number1 region:@"GB"], @"Should properly format using original number format.");

    LPNPhoneNumber *number2 = [phoneUtil phoneNumberByParsingString:@"02087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"(020) 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number2 region:@"GB"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number3 = [phoneUtil phoneNumberByParsingString:@"011442087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"011 44 20 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number3 region:@"GB"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number4 = [phoneUtil phoneNumberByParsingString:@"442087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"44 20 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number4 region:@"GB"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number5 = [phoneUtil phoneNumberByParsingString:@"+442087654321" defaultRegion:@"GB" keepingRawInput:NO error:NULL];
    STAssertEqualObjects(@"(020) 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number5 region:@"GB"], @"Should properly format using original number format.");
    
    
    // Invalid numbers that we have a formatting pattern for should be formatted properly.
    // Note area codes starting with 7 are intentionally excluded in the test data.
    LPNPhoneNumber *number6 = [phoneUtil phoneNumberByParsingString:@"7345678901" defaultRegion:@"US" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"734 567 8901", [phoneUtil stringInOriginalFormatWithPhoneNumber:number6 region:@"US"], @"Should properly format using original number format.");
    
    // US is not a leading zero country, and the presence of the leading zero leads us to format the number using raw input.
    LPNPhoneNumber *number7 = [phoneUtil phoneNumberByParsingString:@"0734567 8901" defaultRegion:@"US" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"0734567 8901", [phoneUtil stringInOriginalFormatWithPhoneNumber:number7 region:@"US"], @"Should properly format using original number format.");
    
    // This number is valid, but we don't have a formatting patternn for it. Fall back to the raw input.
    LPNPhoneNumber *number8 = [phoneUtil phoneNumberByParsingString:@"02-4567-8900" defaultRegion:@"KR" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"02-4567-8900", [phoneUtil stringInOriginalFormatWithPhoneNumber:number8 region:@"KR"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number9 = [phoneUtil phoneNumberByParsingString:@"01180012345678" defaultRegion:@"US" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"011 800 1234 5678", [phoneUtil stringInOriginalFormatWithPhoneNumber:number9 region:@"US"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *number10 = [phoneUtil phoneNumberByParsingString:@"+80012345678" defaultRegion:@"KR" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"+800 1234 5678", [phoneUtil stringInOriginalFormatWithPhoneNumber:number10 region:@"KR"], @"Should properly format using original number format.");
    
    // US local numbers are formatted correctly, as we hace formatting patterns for them.
    LPNPhoneNumber *localNumberUS = [phoneUtil phoneNumberByParsingString:@"2530000" defaultRegion:@"US" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"253 0000", [phoneUtil stringInOriginalFormatWithPhoneNumber:localNumberUS region:@"US"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithNationalPrefixUS = [phoneUtil phoneNumberByParsingString:@"18003456789" defaultRegion:@"US" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"1 800 345 6789", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithNationalPrefixUS region:@"US"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithoutNationalPrefixGB = [phoneUtil phoneNumberByParsingString:@"2087654321" defaultRegion:@"GB" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"20 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithoutNationalPrefixGB region:@"GB"], @"Should properly format using original number format.");
    
    // Make sure no metadata is modified as a result of the previous call.
    STAssertEqualObjects(@"(020) 8765 4321", [phoneUtil stringInOriginalFormatWithPhoneNumber:number5 region:@"GB"], @"Metadata should not be modified.");
    
    LPNPhoneNumber *numberWithNationalPrefixMX = [phoneUtil phoneNumberByParsingString:@"013312345678" defaultRegion:@"MX" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"01 33 1234 5678", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithNationalPrefixMX region:@"MX"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithoutNationalPrefixMX = [phoneUtil phoneNumberByParsingString:@"3312345678" defaultRegion:@"MX" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"33 1234 5678", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithoutNationalPrefixMX region:@"MX"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *italianFixedLineNumber = [phoneUtil phoneNumberByParsingString:@"0212345678" defaultRegion:@"IT" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"02 1234 5678", [phoneUtil stringInOriginalFormatWithPhoneNumber:italianFixedLineNumber region:@"IT"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithNationalPrefixJP = [phoneUtil phoneNumberByParsingString:@"00777012" defaultRegion:@"JP" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"0077-7012", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithNationalPrefixJP region:@"JP"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithoutNationalPrefixJP = [phoneUtil phoneNumberByParsingString:@"0777012" defaultRegion:@"JP" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"0777012", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithoutNationalPrefixJP region:@"JP"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithCarrierCodeBR = [phoneUtil phoneNumberByParsingString:@"012 3121286979" defaultRegion:@"BR" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"012 3121286979", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithCarrierCodeBR region:@"BR"], @"Should properly format using original number format. ");
    
    // The default national prefix used in this case is 045. When a number with national prefix 044 is entered, we return the raw input as we don't want to change the number entered.
    LPNPhoneNumber *numberWithNationalPrefixMX1 = [phoneUtil phoneNumberByParsingString:@"044(33)1234-5678" defaultRegion:@"MX" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"044(33)1234-5678", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithNationalPrefixMX1 region:@"MX"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithNationalPrefixMX2 = [phoneUtil phoneNumberByParsingString:@"045(33)1234-5678" defaultRegion:@"MX" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"045 33 1234 5678", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithNationalPrefixMX2 region:@"MX"], @"Should properly format using original number format.");
    
    // The default international prefix used in thie case is 0011. When a number with international prefix 0012 is entered, we return the raw input, as we don't want to change the number entered.
    LPNPhoneNumber *outOfCountryNumberFromAU1 = [phoneUtil phoneNumberByParsingString:@"0012 16502530000" defaultRegion:@"AU" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"0012 16502530000", [phoneUtil stringInOriginalFormatWithPhoneNumber:outOfCountryNumberFromAU1 region:@"AU"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *outOfCountryNumberFromAU2 = [phoneUtil phoneNumberByParsingString:@"0011 16502530000" defaultRegion:@"AU" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"0011 1 650 253 0000", [phoneUtil stringInOriginalFormatWithPhoneNumber:outOfCountryNumberFromAU2 region:@"AU"], @"Should properly format using original number format.");
    
    // Test the start sign is not removed from or added to the original input by this method.
    LPNPhoneNumber *starNumber = [phoneUtil phoneNumberByParsingString:@"*1234" defaultRegion:@"JP" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"*1234", [phoneUtil stringInOriginalFormatWithPhoneNumber:starNumber region:@"JP"], @"Should properly format using original number format.");
    
    LPNPhoneNumber *numberWithoutStar = [phoneUtil phoneNumberByParsingString:@"1234" defaultRegion:@"JP" keepingRawInput:YES error:NULL];
    STAssertEqualObjects(@"1234", [phoneUtil stringInOriginalFormatWithPhoneNumber:numberWithoutStar region:@"JP"], @"Should properly format using original number format.");
    
    // Test an invalid national number without raw input is just formatted as the national number.
    STAssertEqualObjects(@"650253000", [phoneUtil stringInOriginalFormatWithPhoneNumber:usShortByOneNumber region:@"US"], @"Should properly format using original number format.");
}

- (void)testIsPremiumRate
{
    STAssertEquals(LPNPremiumRatePhoneNumberType, [phoneUtil typeForPhoneNumber:usPremium], @"Should return the correct type for premium rate numbers.");
    
    LPNPhoneNumber *premiumRateNumber = [[LPNPhoneNumber alloc] init];
    premiumRateNumber.countryCode = 39;
    premiumRateNumber.nationalNumber = 892123;
    
    STAssertEquals(LPNPremiumRatePhoneNumberType, [phoneUtil typeForPhoneNumber:premiumRateNumber], @"Should return the correct type for premium rate numbers.");
    
    [premiumRateNumber clear];
    premiumRateNumber.countryCode = 44;
    premiumRateNumber.nationalNumber = 9187654321;
    
    STAssertEquals(LPNPremiumRatePhoneNumberType, [phoneUtil typeForPhoneNumber:premiumRateNumber], @"Should return the correct type for premium rate numbers.");
    
    [premiumRateNumber clear];
    premiumRateNumber.countryCode = 49;
    premiumRateNumber.nationalNumber = 9001654321;
    
    STAssertEquals(LPNPremiumRatePhoneNumberType, [phoneUtil typeForPhoneNumber:premiumRateNumber], @"Should return the correct type for premium rate numbers.");
    
    [premiumRateNumber clear];
    premiumRateNumber.countryCode = 49;
    premiumRateNumber.nationalNumber = 90091234567;

    STAssertEquals(LPNPremiumRatePhoneNumberType, [phoneUtil typeForPhoneNumber:premiumRateNumber], @"Should return the correct type for premium rate numbers.");
    
    STAssertEquals(LPNPremiumRatePhoneNumberType, [phoneUtil typeForPhoneNumber:universalPremiumRate], @"Should return the correct type for premium rate numbers.");
}

- (void)testIsTollFree
{
    LPNPhoneNumber *tollFreeNumber = [[LPNPhoneNumber alloc] init];
    tollFreeNumber.countryCode = 1;
    tollFreeNumber.nationalNumber = 8881234567;
    
    STAssertEquals(LPNTollFreePhoneNumberType, [phoneUtil typeForPhoneNumber:tollFreeNumber], @"Should return the correct type for toll-free numbers.");
    
    [tollFreeNumber clear];
    tollFreeNumber.countryCode = 39;
    tollFreeNumber.nationalNumber = 803123;
    
    STAssertEquals(LPNTollFreePhoneNumberType, [phoneUtil typeForPhoneNumber:tollFreeNumber], @"Should return the correct type for toll-free numbers.");
    
    [tollFreeNumber clear];
    tollFreeNumber.countryCode = 44;
    tollFreeNumber.nationalNumber = 8012345678;
    
    STAssertEquals(LPNTollFreePhoneNumberType, [phoneUtil typeForPhoneNumber:tollFreeNumber], @"Should return the correct type for toll-free numbers.");
    
    [tollFreeNumber clear];
    tollFreeNumber.countryCode = 49;
    tollFreeNumber.nationalNumber = 8001234567;
    
    STAssertEquals(LPNTollFreePhoneNumberType, [phoneUtil typeForPhoneNumber:tollFreeNumber], @"Should return the correct type for toll-free numbers.");
    
    STAssertEquals(LPNTollFreePhoneNumberType, [phoneUtil typeForPhoneNumber:internationalTollfree], @"Should return the correct type for toll-free numbers.");
}

- (void)testIsMobile
{
    STAssertEquals(LPNMobilePhoneNumberType, [phoneUtil typeForPhoneNumber:bsMobile], @"Should return the correct type for mobile numbers.");
    STAssertEquals(LPNMobilePhoneNumberType, [phoneUtil typeForPhoneNumber:gbMobile], @"Should return the correct type for mobile numbers.");
    STAssertEquals(LPNMobilePhoneNumberType, [phoneUtil typeForPhoneNumber:itMobile], @"Should return the correct type for mobile numbers.");
    STAssertEquals(LPNMobilePhoneNumberType, [phoneUtil typeForPhoneNumber:arMobile], @"Should return the correct type for mobile numbers.");

    LPNPhoneNumber *mobileNumber = [[LPNPhoneNumber alloc] init];
    mobileNumber.countryCode = 49;
    mobileNumber.nationalNumber = 15123456789;
    
    STAssertEquals(LPNMobilePhoneNumberType, [phoneUtil typeForPhoneNumber:mobileNumber], @"Should return the correct type for mobile numbers.");
}

- (void)testIsFixedLine
{
    STAssertEquals(LPNFixedLinePhoneNumberType, [phoneUtil typeForPhoneNumber:bsNumber], @"Should return the correct type for fixed line numbers.");
    STAssertEquals(LPNFixedLinePhoneNumberType, [phoneUtil typeForPhoneNumber:itNumber], @"Should return the correct type for fixed line numbers.");
    STAssertEquals(LPNFixedLinePhoneNumberType, [phoneUtil typeForPhoneNumber:gbNumber], @"Should return the correct type for fixed line numbers.");
    STAssertEquals(LPNFixedLinePhoneNumberType, [phoneUtil typeForPhoneNumber:deNumber], @"Should return the correct type for fixed line numbers.");
}

- (void)testIsFixedLineOrMobile
{
    STAssertEquals(LPNFixedLineOrMobilePhoneNumberType, [phoneUtil typeForPhoneNumber:usNumber], @"Should return the correct type for fixed line or mobile numbers.");
    
    LPNPhoneNumber *fixedLineOrMobileNumber = [[LPNPhoneNumber alloc] init];
    fixedLineOrMobileNumber.countryCode = 54;
    fixedLineOrMobileNumber.nationalNumber = 1987654321;
    
    STAssertEquals(LPNFixedLineOrMobilePhoneNumberType, [phoneUtil typeForPhoneNumber:fixedLineOrMobileNumber], @"Should return the correct type for fixed line or mobile numbers.");
}

- (void)testIsSharedCost
{
    LPNPhoneNumber *gbSharedCostNumber = [[LPNPhoneNumber alloc] init];
    gbSharedCostNumber.countryCode = 44;
    gbSharedCostNumber.nationalNumber = 8431231234;
    
    STAssertEquals(LPNSharedCostPhoneNumberType, [phoneUtil typeForPhoneNumber:gbSharedCostNumber], @"Should return the correct type for shared cost numbers.");
}

- (void)testIsVOIP
{
    LPNPhoneNumber *gbVOIPNumber = [[LPNPhoneNumber alloc] init];
    gbVOIPNumber.countryCode = 44;
    gbVOIPNumber.nationalNumber = 5631231234;
    
    STAssertEquals(LPNVOIPPhoneNumberType, [phoneUtil typeForPhoneNumber:gbVOIPNumber], @"Should return the correct type for VOIP numbers.");
}

- (void)testIsPersonalNumber
{
    LPNPhoneNumber *gbPersonalNumber = [[LPNPhoneNumber alloc] init];
    gbPersonalNumber.countryCode = 44;
    gbPersonalNumber.nationalNumber = 7031231234;
    
    STAssertEquals(LPNPersonalPhoneNumberType, [phoneUtil typeForPhoneNumber:gbPersonalNumber], @"Should return the correct type for personal numbers.");
}

- (void)testIsUnknown
{
    STAssertEquals(LPNUnknownPhoneNumberType, [phoneUtil typeForPhoneNumber:usLocalNumber], @"Should return unknown type for invalid numbers.");
}

- (void)testIsValidNumber
{
    STAssertTrue([phoneUtil isValidNumber:usNumber], @"Should properly validate phone numbers.");
    STAssertTrue([phoneUtil isValidNumber:itNumber], @"Should properly validate phone numbers.");
    STAssertTrue([phoneUtil isValidNumber:gbMobile], @"Should properly validate phone numbers.");
    STAssertTrue([phoneUtil isValidNumber:internationalTollfree], @"Should properly validate phone numbers.");
    STAssertTrue([phoneUtil isValidNumber:universalPremiumRate], @"Should properly validate phone numbers.");

    LPNPhoneNumber *nzValidNumber = [[LPNPhoneNumber alloc] init];
    nzValidNumber.countryCode = 64;
    nzValidNumber.nationalNumber = 21387835;
    STAssertTrue([phoneUtil isValidNumber:nzValidNumber], @"Should properly validate phone numbers.");
}

- (void)testIsValidForRegion
{
    // This number is valid for the Bahamas but is not a valid US number.
    STAssertTrue([phoneUtil isValidNumber:bsNumber], @"Should properly validate phone numbers.");
    STAssertTrue([phoneUtil isValidNumber:bsNumber forRegion:@"BS"], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:bsNumber forRegion:@"US"], @"Should properly validate phone numbers for specific regions.");

    LPNPhoneNumber *bsInvalidNumber = [[LPNPhoneNumber alloc] init];
    bsInvalidNumber.countryCode = 1;
    bsInvalidNumber.nationalNumber = 2421232345;
    
    STAssertFalse([phoneUtil isValidNumber:bsInvalidNumber], @"Should properly validate phone numbers.");

    // La Mayotte and Reunion us 'leading digits' to differentiate them.
    LPNPhoneNumber *reNumber = [[LPNPhoneNumber alloc] init];
    reNumber.countryCode = 262;
    reNumber.nationalNumber = 262123456;

    STAssertTrue([phoneUtil isValidNumber:reNumber], @"Should properly validate phone numbers.");
    STAssertTrue([phoneUtil isValidNumber:reNumber forRegion:@"RE"], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:reNumber forRegion:@"YT"], @"Should properly validate phone numbers for specific regions.");
    
    reNumber.nationalNumber = 269601234;

    STAssertTrue([phoneUtil isValidNumber:reNumber forRegion:@"YT"], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:reNumber forRegion:@"RE"], @"Should properly validate phone numbers for specific regions.");

    reNumber.nationalNumber = 269123456;
    
    STAssertFalse([phoneUtil isValidNumber:reNumber forRegion:@"YT"], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:reNumber forRegion:@"RE"], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:reNumber], @"Should properly validate phone numbers.");
    
    // The number should still be recognized as from La Mayotte, since it is valid for the region.
    STAssertEqualObjects(@"YT", [phoneUtil regionCodeForPhoneNumber:reNumber], @"Should return the correct region code for a valid number.");
    
    // This number is valid in both YT and RE
    reNumber.nationalNumber = 800123456;
    
    STAssertTrue([phoneUtil isValidNumber:reNumber forRegion:@"YT"], @"Should properly validate phone numbers for specific regions.");
    STAssertTrue([phoneUtil isValidNumber:reNumber forRegion:@"RE"], @"Should properly validate phone numbers for specific regions.");
    
    STAssertTrue([phoneUtil isValidNumber:internationalTollfree forRegion:LPNNonGeoEntityRegionCode], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:internationalTollfree forRegion:@"US"], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:internationalTollfree forRegion:@"ZZ"], @"Should properly validate phone numbers for specific regions.");
    
    LPNPhoneNumber *invalidNumber = [[LPNPhoneNumber alloc] init];
    // Invalid country codes
    invalidNumber.countryCode = 3923;
    invalidNumber.nationalNumber = 2366;
    STAssertFalse([phoneUtil isValidNumber:invalidNumber forRegion:@"ZZ"], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:invalidNumber forRegion:LPNNonGeoEntityRegionCode], @"Should properly validate phone numbers for specific regions.");
    
    invalidNumber.countryCode = 0;
    STAssertFalse([phoneUtil isValidNumber:invalidNumber forRegion:LPNNonGeoEntityRegionCode], @"Should properly validate phone numbers for specific regions.");
    STAssertFalse([phoneUtil isValidNumber:invalidNumber forRegion:@"ZZ"], @"Should properly validate phone numbers for specific regions.");
}

- (void)testIsNotValidNumber
{
    STAssertFalse([phoneUtil isValidNumber:usLocalNumber], @"Should properly validate phone numbers.");
    
    LPNPhoneNumber *invalidNumber = [[LPNPhoneNumber alloc] init];
    invalidNumber.countryCode = 39;
    invalidNumber.nationalNumber = 23661830000;
    invalidNumber.italianLeadingZero = YES;
    
    STAssertFalse([phoneUtil isValidNumber:invalidNumber], @"Should properly validate phone numbers.");
    
    [invalidNumber clear];
    invalidNumber.countryCode = 44;
    invalidNumber.nationalNumber = 791234567;

    STAssertFalse([phoneUtil isValidNumber:invalidNumber], @"Should properly validate phone numbers.");
    
    [invalidNumber clear];
    invalidNumber.countryCode = 49;
    invalidNumber.nationalNumber = 1234;
    
    STAssertFalse([phoneUtil isValidNumber:invalidNumber], @"Should properly validate phone numbers.");
    
    [invalidNumber clear];
    invalidNumber.countryCode = 64;
    invalidNumber.nationalNumber = 3316005;
    
    STAssertFalse([phoneUtil isValidNumber:invalidNumber], @"Should properly validate phone numbers.");
    
    [invalidNumber clear];
    // Invalid country calling codes.
    invalidNumber.countryCode = 3923;
    invalidNumber.nationalNumber = 2366;
    STAssertFalse([phoneUtil isValidNumber:invalidNumber], @"Should properly validate phone numbers.");
    
    invalidNumber.countryCode = 0;
    STAssertFalse([phoneUtil isValidNumber:invalidNumber], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isValidNumber:internationalTollfreeTooLong], @"Should properly validate phone numbers.");
}

- (void)testRegionCodeForCountryCode
{
    STAssertEqualObjects(@"US", [phoneUtil regionCodeForCountryCode:1], @"Should return the correct region code.");
    STAssertEqualObjects(@"GB", [phoneUtil regionCodeForCountryCode:44], @"Should return the correct region code.");
    STAssertEqualObjects(@"DE", [phoneUtil regionCodeForCountryCode:49], @"Should return the correct region code.");
    STAssertEqualObjects(LPNNonGeoEntityRegionCode, [phoneUtil regionCodeForCountryCode:800], @"Should return the correct region code.");
    STAssertEqualObjects(LPNNonGeoEntityRegionCode, [phoneUtil regionCodeForCountryCode:979], @"Should return the correct region code.");
}

- (void)testRegionCodeForPhoneNumber
{
    STAssertEqualObjects(@"BS", [phoneUtil regionCodeForPhoneNumber:bsNumber], @"Should return the correct region code.");
    STAssertEqualObjects(@"US", [phoneUtil regionCodeForPhoneNumber:usNumber], @"Should return the correct region code.");
    STAssertEqualObjects(@"GB", [phoneUtil regionCodeForPhoneNumber:gbNumber], @"Should return the correct region code.");
    STAssertEqualObjects(LPNNonGeoEntityRegionCode, [phoneUtil regionCodeForPhoneNumber:internationalTollfree], @"Should return the correct region code.");
    STAssertEqualObjects(LPNNonGeoEntityRegionCode, [phoneUtil regionCodeForPhoneNumber:universalPremiumRate], @"Should return the correct region code.");
}

- (void)testRegionCodesForCountryCode
{
    NSArray *regionCodesForNANPA = [phoneUtil regionCodesForCountryCode:1];
    STAssertTrue([regionCodesForNANPA containsObject:@"US"], @"Should return the correct region codes.");
    STAssertTrue([regionCodesForNANPA containsObject:@"BS"], @"Should return the correct region codes.");
    STAssertTrue([[phoneUtil regionCodesForCountryCode:44] containsObject:@"GB"], @"Should return the correct region codes.");
    STAssertTrue([[phoneUtil regionCodesForCountryCode:49] containsObject:@"DE"], @"Should return the correct region codes.");
    STAssertTrue([[phoneUtil regionCodesForCountryCode:800] containsObject:LPNNonGeoEntityRegionCode], @"Should return the correct region codes.");

    // Test with invalid country calling code.
    STAssertEquals(0, [[phoneUtil regionCodesForCountryCode:-1] count], @"Should return the correct number of region codes.");
}

- (void)testCountryCodeForRegion
{
    STAssertEquals(1, [phoneUtil countryCodeForRegion:@"US"], @"Should return the correct country code.");
    STAssertEquals(64, [phoneUtil countryCodeForRegion:@"NZ"], @"Should return the correct country code.");
    STAssertEquals(0, [phoneUtil countryCodeForRegion:nil], @"Should return the correct country code.");
    STAssertEquals(0, [phoneUtil countryCodeForRegion:@"ZZ"], @"Should return the correct country code.");
    STAssertEquals(0, [phoneUtil countryCodeForRegion:LPNNonGeoEntityRegionCode], @"Should return the correct country code.");
    
    // CS is deprecated
    STAssertEquals(0, [phoneUtil countryCodeForRegion:@"CS"], @"Should return the correct country code.");
}

- (void)testNationalDiallingPrefixForRegion
{
    STAssertEqualObjects(@"1", [phoneUtil nddPrefixForRegion:@"US" stripNonDigits:NO], @"Should return the correct national dialling prefix.");
    
    // Test non-main country to see it gets the national dialling prefix for the main country with that calling code.
    STAssertEqualObjects(@"1", [phoneUtil nddPrefixForRegion:@"BS" stripNonDigits:NO], @"Should return the correct national dialling prefix.");
    STAssertEqualObjects(@"0", [phoneUtil nddPrefixForRegion:@"NZ" stripNonDigits:NO], @"Should return the correct national dialling prefix.");
    
    // Test case with non difit in the national prefix.
    STAssertEqualObjects(@"0~0", [phoneUtil nddPrefixForRegion:@"AO" stripNonDigits:NO], @"Should return the correct national dialling prefix.");
    STAssertEqualObjects(@"00", [phoneUtil nddPrefixForRegion:@"AO" stripNonDigits:YES], @"Should return the correct national dialling prefix.");
    
    // Test cases with invalid regions.
    STAssertNil([phoneUtil nddPrefixForRegion:nil stripNonDigits:NO], @"Should return the correct national dialling prefix.");
    STAssertNil([phoneUtil nddPrefixForRegion:@"ZZ" stripNonDigits:NO], @"Should return the correct national dialling prefix.");
    STAssertNil([phoneUtil nddPrefixForRegion:LPNNonGeoEntityRegionCode stripNonDigits:NO], @"Should return the correct national dialling prefix.");
    
    // CS is deprecated so the library doesn't support it.
    STAssertNil([phoneUtil nddPrefixForRegion:@"CS" stripNonDigits:NO], @"Should return the correct national dialling prefix.");
}

- (void)testIsNANPACountry
{
    STAssertTrue([phoneUtil isNANPACountry:@"US"], @"Should properly determine whether a region is a NANPA country.");
    STAssertTrue([phoneUtil isNANPACountry:@"BS"], @"Should properly determine whether a region is a NANPA country.");
    STAssertFalse([phoneUtil isNANPACountry:@"DE"], @"Should properly determine whether a region is a NANPA country.");
    STAssertFalse([phoneUtil isNANPACountry:@"ZZ"], @"Should properly determine whether a region is a NANPA country.");
    STAssertFalse([phoneUtil isNANPACountry:LPNNonGeoEntityRegionCode], @"Should properly determine whether a region is a NANPA country.");
    STAssertFalse([phoneUtil isNANPACountry:nil], @"Should properly determine whether a region is a NANPA country.");
}

- (void)testIsPossibleNumber
{
    STAssertTrue([phoneUtil isPossiblePhoneNumber:usNumber], @"Should properly determine whether a phone number is possible.");
    STAssertTrue([phoneUtil isPossiblePhoneNumber:usLocalNumber], @"Should properly determine whether a phone number is possible.");
    STAssertTrue([phoneUtil isPossiblePhoneNumber:gbNumber], @"Should properly determine whether a phone number is possible.");
    STAssertTrue([phoneUtil isPossiblePhoneNumber:internationalTollfree], @"Should properly determine whether a phone number is possible.");

    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"+1 650 253 0000" dialedFromRegion:@"US"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"+1 650 GOO OGLE" dialedFromRegion:@"US"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"(650) 253-0000" dialedFromRegion:@"US"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"253-0000" dialedFromRegion:@"US"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"+1 650 253 0000" dialedFromRegion:@"GB"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"+44 20 7031 3000" dialedFromRegion:@"GB"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"(020) 7031 3000" dialedFromRegion:@"GB"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"7031 3000" dialedFromRegion:@"GB"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"3331 6005" dialedFromRegion:@"NZ"], @"Should properly determine whether a phone number string is possible when dialed from a given region.");
    STAssertTrue([phoneUtil isPossiblePhoneNumberString:@"+800 1234 5678" dialedFromRegion:LPNNonGeoEntityRegionCode], @"Should properly determine wither a phone number string is possible when dialed from a given region.");
}

- (void)testValidatePhoneNumber
{
    // National numbers for country calling code +1 that are within 7 to 10 digits are possible.
    STAssertEquals(LPNPhoneNumberIsPossibleValidationResult, [phoneUtil validatePhoneNumber:usNumber], @"Should properly validate phone numbers.");
    STAssertEquals(LPNPhoneNumberIsPossibleValidationResult, [phoneUtil validatePhoneNumber:usLocalNumber], @"Should properly validate phone numbers.");
    STAssertEquals(LPNPhoneNumberIsTooLongValidationResult, [phoneUtil validatePhoneNumber:usLongNumber], @"Should properly validate phone numbers.");
    
    LPNPhoneNumber *phoneNumber = [[LPNPhoneNumber alloc] init];
    phoneNumber.countryCode = 0;
    phoneNumber.nationalNumber = 2530000;
    
    STAssertEquals(LPNInvalidCountryCodeValidationResult, [phoneUtil validatePhoneNumber:phoneNumber], @"Should properly validate phone numbers.");

    [phoneNumber clear];
    phoneNumber.countryCode = 1;
    phoneNumber.nationalNumber = 253000;
    
    STAssertEquals(LPNPhoneNumberIsTooShortValidationResult, [phoneUtil validatePhoneNumber:phoneNumber], @"Should properly validate phone numbers.");
    
    [phoneNumber clear];
    phoneNumber.countryCode = 65;
    phoneNumber.nationalNumber = 1234567890;
    
    STAssertEquals(LPNPhoneNumberIsPossibleValidationResult, [phoneUtil validatePhoneNumber:phoneNumber], @"Should properly validate phone numbers.");
    
    STAssertEquals(LPNPhoneNumberIsTooLongValidationResult, [phoneUtil validatePhoneNumber:internationalTollfreeTooLong], @"Should properly validate phone numbers.");
    
    // Numbers for which we have no metadata
    LPNPhoneNumber *adNumber = [[LPNPhoneNumber alloc] init];
    adNumber.countryCode = 376;
    adNumber.nationalNumber = 12345;
    
    STAssertEquals(LPNPhoneNumberIsPossibleValidationResult, [phoneUtil validatePhoneNumber:adNumber], @"Should properly validate phone numbers.");
    
    adNumber.nationalNumber = 1;

    STAssertEquals(LPNPhoneNumberIsTooShortValidationResult, [phoneUtil validatePhoneNumber:adNumber], @"Should properly validate phone numbers.");

    adNumber.nationalNumber = 12345678901234567;

    STAssertEquals(LPNPhoneNumberIsTooLongValidationResult, [phoneUtil validatePhoneNumber:adNumber], @"Should properly validate phone numbers.");
}

- (void)testIsNotPossibleNumber
{
    STAssertFalse([phoneUtil isPossiblePhoneNumber:usLongNumber], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isPossiblePhoneNumber:internationalTollfreeTooLong], @"Should properly validate phone numbers.");
    
    LPNPhoneNumber *phoneNumber = [[LPNPhoneNumber alloc] init];
    phoneNumber.countryCode = 1;
    phoneNumber.nationalNumber = 253000;
    
    STAssertFalse([phoneUtil isPossiblePhoneNumber:phoneNumber], @"Should properly validate phone numbers.");
    
    [phoneNumber clear];
    phoneNumber.countryCode = 44;
    phoneNumber.nationalNumber = 300;
    
    STAssertFalse([phoneUtil isPossiblePhoneNumber:phoneNumber], @"Should properly validate phone numbers.");
    
    STAssertFalse([phoneUtil isPossiblePhoneNumberString:@"+1 650 253 00000" dialedFromRegion:@"US"], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isPossiblePhoneNumberString:@"(650) 253-00000" dialedFromRegion:@"US"], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isPossiblePhoneNumberString:@"I want a Pizza" dialedFromRegion:@"US"], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isPossiblePhoneNumberString:@"253-000" dialedFromRegion:@"US"], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isPossiblePhoneNumberString:@"1 3000" dialedFromRegion:@"GB"], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isPossiblePhoneNumberString:@"+44 300" dialedFromRegion:@"GB"], @"Should properly validate phone numbers.");
    STAssertFalse([phoneUtil isPossiblePhoneNumberString:@"+800 1234 5678 9" dialedFromRegion:LPNNonGeoEntityRegionCode], @"Should properly validate phone numbers.");
}

- (void)testTruncateTooLongNumber
{
    LPNPhoneNumber *tooLongNumber = [[LPNPhoneNumber alloc] init];
    LPNPhoneNumber *validNumber = [[LPNPhoneNumber alloc] init];

    // GB number 080 1234 5678, but entered with 4 extra digits at the end.
    [tooLongNumber clear];
    tooLongNumber.countryCode = 44;
    tooLongNumber.nationalNumber = 80123456780123;
    
    [validNumber clear];
    validNumber.countryCode = 44;
    validNumber.nationalNumber = 8012345678;

    STAssertTrue([phoneUtil truncateTooLongPhoneNumber:tooLongNumber], @"Should properly truncate a phone number that is too long.");
    STAssertEqualObjects(validNumber, tooLongNumber, @"Should properly truncate a phone number that is too long.");

    // IT number 022 3456 7890, but entered with 3 extra digits at the end.
    [tooLongNumber clear];
    tooLongNumber.countryCode = 39;
    tooLongNumber.nationalNumber = 2234567890123;
    tooLongNumber.italianLeadingZero = YES;
    
    [validNumber clear];
    validNumber.countryCode = 39;
    validNumber.nationalNumber = 2234567890;
    validNumber.italianLeadingZero = YES;
    
    STAssertTrue([phoneUtil truncateTooLongPhoneNumber:tooLongNumber], @"Should properly truncate a phone number that is too long.");
    STAssertEqualObjects(validNumber, tooLongNumber, @"Should properly truncate a phone number that is too long.");
    
    // US number 650-253-0000, but entered with one additional digit at the end.
    tooLongNumber = [usLongNumber copy];
    validNumber = [usNumber copy];
    
    STAssertTrue([phoneUtil truncateTooLongPhoneNumber:tooLongNumber], @"Should properly truncate a phone number that is too long.");
    STAssertEqualObjects(validNumber, tooLongNumber, @"Should properly truncate a phone number that is too long.");
    
    // Too long international toll-free number
    tooLongNumber = [internationalTollfreeTooLong copy];
    validNumber = [internationalTollfree copy];
    
    STAssertTrue([phoneUtil truncateTooLongPhoneNumber:tooLongNumber], @"Should properly truncate a phone number that is too long.");
    STAssertEqualObjects(validNumber, tooLongNumber, @"Should properly truncate a phone number that is too long.");
        
    // Tests what happens when a valid number is passed in.
    LPNPhoneNumber *validNumberCopy = [validNumber copy];
    
    STAssertTrue([phoneUtil truncateTooLongPhoneNumber:validNumber], @"Should properly truncate a phone number that is too long.");
    // The number should not be modified.
    STAssertEqualObjects(validNumberCopy, validNumber, @"Should properly truncate a phone number that is too long.");
    
    // Tests what happens when a number with an invalid prefix is passed in.
    LPNPhoneNumber *numberWithInvalidPrefix = [[LPNPhoneNumber alloc] init];
    // Test data says US numbers cannot have prefix 240.
    numberWithInvalidPrefix.countryCode = 1;
    numberWithInvalidPrefix.nationalNumber = 2401234567;
    
    LPNPhoneNumber *invalidNumberCopy = [numberWithInvalidPrefix copy];
    
    STAssertFalse([phoneUtil truncateTooLongPhoneNumber:numberWithInvalidPrefix], @"Should properly truncate a phone number that is too long.");
    // The number should not be modified.
    STAssertEqualObjects(invalidNumberCopy, numberWithInvalidPrefix, @"Should properly truncate a phone number that is too long.");
 
    // Tests what happens when a too short number is passed in.
    LPNPhoneNumber *tooShortNumber = [[LPNPhoneNumber alloc] init];
    tooShortNumber.countryCode = 1;
    tooShortNumber.nationalNumber = 1234;
    
    LPNPhoneNumber *tooShortNumberCopy = [tooShortNumber copy];
        
    STAssertFalse([phoneUtil truncateTooLongPhoneNumber:tooShortNumber], @"Should properly truncate a phone number that is too long.");
    // The number should not be modified.
    STAssertEqualObjects(tooShortNumberCopy, tooShortNumber, @"Should properly truncate a phone number that is too long.");
}

- (void)testIsViablePhoneNumberString
{
    STAssertFalse([phoneUtil isViablePhoneNumberString:@"1"], @"Should properly determine the viability of a phone number string.");
    
    // Only one or two digits before strage, non-possible punctuation.
    STAssertFalse([phoneUtil isViablePhoneNumberString:@"1+1+1"], @"Should properly determine the viability of a phone number string.");
    STAssertFalse([phoneUtil isViablePhoneNumberString:@"80+0"], @"Should properly determine the viability of a phone number string.");

    // Two digits is viable.
    STAssertTrue([phoneUtil isViablePhoneNumberString:@"00"], @"Should properly determine the viability of a phone number string.");
    STAssertTrue([phoneUtil isViablePhoneNumberString:@"111"], @"Should properly determine the viability of a phone number string.");
    
    // Alpha numbers.
    STAssertTrue([phoneUtil isViablePhoneNumberString:@"0800-4-pizza"], @"Should properly determine the viability of a phone number string.");
    STAssertTrue([phoneUtil isViablePhoneNumberString:@"0800-4-PIZZA"], @"Should properly determine the viability of a phone number string.");
    
    // We need at least three digits before any alpha characters.
    STAssertFalse([phoneUtil isViablePhoneNumberString:@"08-PIZZA"], @"Should properly determine the viability of a phone number string.");
    STAssertFalse([phoneUtil isViablePhoneNumberString:@"8-PIZZA"], @"Should properly determine the viability of a phone number string.");
    STAssertFalse([phoneUtil isViablePhoneNumberString:@"12. March"], @"Should properly determine the viability of a phone number string.");
}

- (void)testIsViablePhoneNumberNonAscii
{
    // Only one or two digits before possible punctuation followed by more digits.
    STAssertTrue([phoneUtil isViablePhoneNumberString:@"1\u300034"], @"Should properly determine the viability of a phone number string with non-ascii digits.");
    STAssertFalse([phoneUtil isViablePhoneNumberString:@"1\u30003+4"], @"Should properly determine the viability of a phone number string with non-ascii digits.");
    
    // Unicode variants of possible starting character and other allowed punctuation/digits.
    STAssertTrue([phoneUtil isViablePhoneNumberString:@"\uFF081\uFF09\u30003456789"], @"Should properly determine the viability of a phone number string with non-ascii digits.");

    // Testing a leading + is okay.
    STAssertTrue([phoneUtil isViablePhoneNumberString:@"+1\uFF09\u300003456789"], @"Should properly determine the viability of a phone number string with non-ascii digits.");
}

- (void)testExtractPossiblePhoneNumberString
{
    // Removes preceding funky punctuation and letters but leaves the rest untouched.
    STAssertEqualObjects(@"0800-345-600", [phoneUtil extractPossiblePhoneNumberString:@"Tel:0800-345-600"], @"Should properly extract possible phone number strings.");
    STAssertEqualObjects(@"0800 FOR PIZZA", [phoneUtil extractPossiblePhoneNumberString:@"Tel:0800 FOR PIZZA"], @"Should properly extract possible phone number strings.");
    
    // Should not remove plus sign
    STAssertEqualObjects(@"+800-345-600", [phoneUtil extractPossiblePhoneNumberString:@"Tel:+800-345-600"], @"Should properly extract possible phone number strings.");

    // Should recognize wide digits as possible start values.
    STAssertEqualObjects(@"\uFF10\uFF12\uFF13", [phoneUtil extractPossiblePhoneNumberString:@"\uFF10\uFF12\uFF13"], @"Should properly extract possible phone number strings.");
    
    // Dashes are not possible start values and should be removed.
    STAssertEqualObjects(@"\uFF11\uFF12\uFF13", [phoneUtil extractPossiblePhoneNumberString:@"Num-\uFF11\uFF12\uFF13"], @"Should properly extract possible phone number strings.");
    
    // If no possible number present, return empty string.
    STAssertEqualObjects(@"", [phoneUtil extractPossiblePhoneNumberString:@"Num-...."], @"Should properly extract possible phone numbers.");
    
    // Leading brackets are stripped - these are not used when parsing.
    STAssertEqualObjects(@"650) 253-0000", [phoneUtil extractPossiblePhoneNumberString:@"(650) 253-0000"], @"Should properly extract possible phone numbers.");
    
    // Trailing non-alpha-numeric characters should be removed.
    STAssertEqualObjects(@"650) 253-0000", [phoneUtil extractPossiblePhoneNumberString:@"(650) 253-0000..- .."], @"Should properly extract possible phone numbers.");
    STAssertEqualObjects(@"650) 253-0000", [phoneUtil extractPossiblePhoneNumberString:@"(650) 253-0000."], @"Should properly extract possible phone numbers.");
    
    // This case has a trailing RTL char.
    STAssertEqualObjects(@"650) 253-0000", [phoneUtil extractPossiblePhoneNumberString:@"(650) 253-0000\u200F"], @"Should properly extract possible phone numbers.");
}

- (void)testMaybeStripNationalPrefix
{
    LPNPhoneNumberDescription *description = [[LPNPhoneNumberDescription alloc] init];
    description.nationalNumberPattern = @"\\d{4,8}";
    
    LPNPhoneMetadata *metadata = [[LPNPhoneMetadata alloc] init];
    metadata.nationalPrefixForParsing = @"34";
    metadata.generalDescription = description;
    
    NSMutableString *phoneNumberStringToStrip = [@"34356778" mutableCopy];
    NSString *strippedPhoneNumberString = @"356778";
    
    STAssertTrue([phoneUtil maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:phoneNumberStringToStrip withMetadata:metadata strippedContents:NULL], @"Should properly strip national prefix.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should have had national prefix stripped.");

    // Retry stripping - now the number should not start with the national prefix, so no more stripping should occur.
    STAssertFalse([phoneUtil maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:phoneNumberStringToStrip withMetadata:metadata strippedContents:NULL], @"Should properly strip national prefix.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should have had no change - no national prefix present.");
    
    // Some countries have no national prefix. Repeat test with none specified.
    metadata.nationalPrefixForParsing = nil;
    STAssertFalse([phoneUtil maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:phoneNumberStringToStrip withMetadata:metadata strippedContents:NULL], @"Should properly strip national prefix.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should not strip anything with nil national prefix.");
    
    metadata.nationalPrefixForParsing = @"";
    STAssertFalse([phoneUtil maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:phoneNumberStringToStrip withMetadata:metadata strippedContents:NULL], @"Should properly strip national prefix.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should not strip anything with empty national prefix.");
    
    // If the resultant number doesn't match the national rule, it shouldn't be stripped.
    metadata.nationalPrefixForParsing = @"3";
    phoneNumberStringToStrip = [@"3123" mutableCopy];
    strippedPhoneNumberString = @"3123";
    STAssertFalse([phoneUtil maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:phoneNumberStringToStrip withMetadata:metadata strippedContents:NULL], @"Should properly strip national prefix.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should have had no change - after stripping, it wouldn't have matched the national rule.");
    
    // Test extracting carrier selection code.
    metadata.nationalPrefixForParsing = @"0(81)?";
    phoneNumberStringToStrip = [@"08122123456" mutableCopy];
    strippedPhoneNumberString = @"22123456";
    NSString *carrierCode = nil;
    STAssertTrue([phoneUtil maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:phoneNumberStringToStrip withMetadata:metadata strippedContents:&carrierCode], @"Should properly strip national prefix.");
    STAssertEqualObjects(@"81", carrierCode, @"Should properly return the carrier selection code.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should have had national prefix and carrier code stripped.");
    
    // If there was a transform rule, check it was applied.
    metadata.nationalPrefixTransformRule = @"5$15";
    // Note that a capturing group is present here.
    metadata.nationalPrefixForParsing = @"0(\\d{2})";
    phoneNumberStringToStrip = [@"031123" mutableCopy];
    strippedPhoneNumberString = @"5315123";
    STAssertTrue([phoneUtil maybeStripNationalPrefixAndCarrierCodeFromPhoneNumberString:phoneNumberStringToStrip withMetadata:metadata strippedContents:NULL], @"Should properly strip national prefix.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should transform the 031 to a 5315.");
}

- (void)testMaybeStripInternationalPrefix
{
    NSString *internationalPrefix = @"00[39]";
    NSMutableString *phoneNumberStringToStrip = [@"0034567700-3898003" mutableCopy];
    NSString *strippedPhoneNumberString = @"45677003898003";
    
    STAssertEquals(LPNCountryCodeFromNumberWithIDDSource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should strip international prefix.");

    // Now the number no longer starts with an IDD prefix, so it should now return as from default country.
    STAssertEquals(LPNCountryCodeFromDefaultCountrySource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");
    
    phoneNumberStringToStrip = [@"00945677003898003" mutableCopy];
    STAssertEquals(LPNCountryCodeFromNumberWithIDDSource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should strip international prefix.");

    // Test it works when the international prefix is broken up by spaces.
    phoneNumberStringToStrip = [@"00 9 45677003898003" mutableCopy];
    STAssertEquals(LPNCountryCodeFromNumberWithIDDSource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should strip international prefix.");
    
    // Now the number no longer starts with an IDD prefix, so it should now return as from default country.
    STAssertEquals(LPNCountryCodeFromDefaultCountrySource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");
    
    // Test the + symbol is also recognized and stripped.
    phoneNumberStringToStrip = [@"+45677003898003" mutableCopy];
    strippedPhoneNumberString = @"45677003898003";
    STAssertEquals(LPNCountryCodeFromNumberWithPlusSignSource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should strip plus symbol.");
    
    // If the number afterwards is a zero, we should not strip this - no country calling code begins with 0.
    phoneNumberStringToStrip = [@"0090112-3123" mutableCopy];
    strippedPhoneNumberString = @"00901123123";
    STAssertEquals(LPNCountryCodeFromDefaultCountrySource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");
    STAssertTrue([strippedPhoneNumberString isEqualToString:phoneNumberStringToStrip], @"Should not strip when a 0 follows the match.");
    
    // Here the 0 is separated by a space from the IDD.
    phoneNumberStringToStrip = [@"009 0-112-3123" mutableCopy];
    STAssertEquals(LPNCountryCodeFromDefaultCountrySource, [phoneUtil maybeStripInternationalPrefixAndNormalizePhoneNumberString:phoneNumberStringToStrip withPossibleIDDPrefix:internationalPrefix], @"Should return the correct country code source.");    
}

- (void)testMaybeExtractCountryCode
{
    NSError *error = nil;
    LPNPhoneNumber *phoneNumber = [[LPNPhoneNumber alloc] init];
    LPNPhoneMetadata *metadata = [phoneUtil metadataForRegion:@"US"];
    // Note that for the US, the IDD is 011.
    
    NSString *phoneNumberString = @"011112-3456789";
    NSString *strippedPhoneNumberString = @"123456789";
    uint32_t countryCallingCode = 1;
    NSMutableString *numberStringToFill = [[NSMutableString alloc] init];
    
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should extract country calling code correctly.");
    STAssertEquals(LPNCountryCodeFromNumberWithIDDSource, phoneNumber.countryCodeSource, @"Should determine the correct country code source.");
    
    // Should strip and normalize national significant number.
    STAssertTrue([strippedPhoneNumberString isEqualToString:numberStringToFill], @"Should strip off the country calling code correctly.");
    STAssertNil(error, @"Should not have produced an error.");

    [phoneNumber clear];
    phoneNumberString = @"+6423456789";
    countryCallingCode = 64;
    numberStringToFill = [[NSMutableString alloc] init];
    error = nil;
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should extract country calling code correctly.");
    STAssertEquals(LPNCountryCodeFromNumberWithPlusSignSource, phoneNumber.countryCodeSource, @"Should determine the correct country code source.");
    STAssertNil(error, @"Should not have produced an error.");
    
    [phoneNumber clear];
    phoneNumberString = @"+80012345678";
    countryCallingCode = 800;
    numberStringToFill = [[NSMutableString alloc] init];
    error = nil;
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should extract country calling code correctly.");
    STAssertEquals(LPNCountryCodeFromNumberWithPlusSignSource, phoneNumber.countryCodeSource, @"Should determine the correct country code source.");
    STAssertNil(error, @"Should not have produced an error.");
    
    [phoneNumber clear];
    phoneNumberString = @"2345-6789";
    countryCallingCode = 0;
    numberStringToFill = [[NSMutableString alloc] init];
    error = nil;
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should not have extracted a country calling code - no international prefix present.");
    STAssertEquals(LPNCountryCodeFromDefaultCountrySource, phoneNumber.countryCodeSource, @"Should determine the correct country code source.");
    STAssertNil(error, @"Should not have produced an error.");
    
    [phoneNumber clear];
    phoneNumberString = @"0119991123456789";
    countryCallingCode = 0;
    numberStringToFill = [[NSMutableString alloc] init];
    error = nil;
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should not have extracted a country calling code - no valid country code present.");
    STAssertNotNil(error, @"Should have produced an error.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should produce the correct error code.");

    [phoneNumber clear];
    phoneNumberString = @"(1 610) 619 4466";
    countryCallingCode = 1;
    numberStringToFill = [[NSMutableString alloc] init];
    error = nil;
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should have extracted a country calling code of the region passed in.");
    STAssertNil(error, @"Should not have produced an error.");
    STAssertFalse(phoneNumber.hasCountryCodeSource, @"Should not contain a country code source.");

    [phoneNumber clear];
    phoneNumberString = @"(1 610) 619 446";
    countryCallingCode = 0;
    numberStringToFill = [[NSMutableString alloc] init];
    error = nil;
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should not have extracted a country calling code - invalid number after extraction of uncertain country calling code.");
    STAssertNil(error, @"Should not have produced an error.");
    STAssertFalse(phoneNumber.hasCountryCodeSource, @"Should not contain a country code source.");

    [phoneNumber clear];
    phoneNumberString = @"(1 610) 619";
    countryCallingCode = 0;
    numberStringToFill = [[NSMutableString alloc] init];
    error = nil;
    STAssertEquals(countryCallingCode, [phoneUtil maybeExtractCountryCodeFromPhoneNumberString:phoneNumberString withDefaultRegionMetadata:metadata nationalNumberString:numberStringToFill keepRawInput:YES phoneNumber:phoneNumber error:&error], @"Should not have extracted a country calling code - too short number both before and after extraction of uncertain country calling code.");
    STAssertEquals(LPNCountryCodeFromDefaultCountrySource, phoneNumber.countryCodeSource, @"Should determine the correct country code source.");
    STAssertNil(error, @"Should not have produced an error.");
}

- (void)testParseNationalNumber
{
    // National prefix attached.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"033316005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"33316005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // National prefix attached and some formatting present.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"03-331 6005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"03 331 6005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");

    // Test parsing RFC3966 format with a phone context.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:03-331-6005;phone-context=+64" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:331-6005;phone-context=+64-3" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:331-6005;phone-context=+64-3" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // Test parsing RFC3966 format with optional user-defined parameters. The parameters will appear after the context if present.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:03-331-6005;phone-context=+64;a=%A1" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // Test parsing RFC3966 format with an ISDN subaddress.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:03-331-6005;isub=12345;phone-context=+64" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:+64-3-331-6005;isub=12345" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // Testing international prefixes
    // Should strip country calling code.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"0064 3 331 6005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // Try again, but this time we have an international number with region code US. It should recognize the country calling code and parse accordingly.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"01164 3 331 6005" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"+64 3 331 6005" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");

    // We should ignore the leading plus here, since it is not followed by a valid country code but instead is followed by the IDD for the US.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"+01164 3 331 6005" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"+0064 3 331 6005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"+ 00 64 3 331 6005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // US local numbers with context
    STAssertEqualObjects(usLocalNumber, [phoneUtil phoneNumberByParsingString:@"tel:253-0000;phone-context=www.google.com" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(usLocalNumber, [phoneUtil phoneNumberByParsingString:@"tel:253-0000;isub=12345;phone-context=www.google.com" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // This is invalid because no "+" sign is present as part of the phone-context. The phone context is simply ignored in this case just as if it contains a domain.
    STAssertEqualObjects(usLocalNumber, [phoneUtil phoneNumberByParsingString:@"tel:2530000;isub=12345;phone-context=1-650" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    STAssertEqualObjects(usLocalNumber, [phoneUtil phoneNumberByParsingString:@"tel:2530000;isub=12345;phone-context=1234.com" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    LPNPhoneNumber *testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 64;
    testNumber.nationalNumber = 64123456;

    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"64(0)64123456" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // Check that using a "/" is fine in a phone number.
    STAssertEqualObjects(deNumber, [phoneUtil phoneNumberByParsingString:@"301/23456" defaultRegion:@"DE" keepingRawInput:NO error:NULL], @"Should properly parse national number containing a slash.");
    
    // Check it doesn't use the '1' as a country calling code when parsing if the phone number was already possible.
    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 1;
    testNumber.nationalNumber = 1234567890;
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"123-456-7890" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    // Test start numbers. although this is not strictly valid, we would like to make sure we can parse the output we produce when formatting the number.
    STAssertEqualObjects(jpStarNumber, [phoneUtil phoneNumberByParsingString:@"+81 *2345" defaultRegion:@"JP" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
    
    LPNPhoneNumber *shortNumber = [[LPNPhoneNumber alloc] init];
    shortNumber.countryCodeSource = 64;
    shortNumber.nationalNumber = 12;
    STAssertEqualObjects(shortNumber, [phoneUtil phoneNumberByParsingString:@"12" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number.");
}

- (void)testParseNumberWithAlphaCharacters
{
    // Test case with alpha characters.
    LPNPhoneNumber *tollfreeNumber = [[LPNPhoneNumber alloc] init];
    tollfreeNumber.countryCode = 64;
    tollfreeNumber.nationalNumber = 800332005;
    STAssertEqualObjects(tollfreeNumber, [phoneUtil phoneNumberByParsingString:@"0800 DDA 005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number with alpha characters.");
    
    LPNPhoneNumber *premiumNumber = [[LPNPhoneNumber alloc] init];
    premiumNumber.countryCode = 64;
    premiumNumber.nationalNumber = 9003326005;
    STAssertEqualObjects(premiumNumber, [phoneUtil phoneNumberByParsingString:@"0900 DDA 6005" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number with alpha characters.");
    
    // Not enough alpha characters for them to be considered intentional, so they are stripped.
    STAssertEqualObjects(premiumNumber, [phoneUtil phoneNumberByParsingString:@"0900 332 6005a" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number with alpha characters.");
    STAssertEqualObjects(premiumNumber, [phoneUtil phoneNumberByParsingString:@"0900 332 600a5" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number with alpha characters.");
    STAssertEqualObjects(premiumNumber, [phoneUtil phoneNumberByParsingString:@"0900 332 600A5" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number with alpha characters.");
    STAssertEqualObjects(premiumNumber, [phoneUtil phoneNumberByParsingString:@"0900 a332 600A5" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse national number with alpha characters.");
}

- (void)testParseMaliciousInput
{
    // Lots of leading + signs before the possible number.
    NSMutableString *maliciousNumber = [[NSMutableString alloc] initWithCapacity:6100];
    for (int i = 0; i < 6000; i++) {
        [maliciousNumber appendString:@"+"];
    }
    [maliciousNumber appendString:@"12222-33-244 extensioB 343+"];
    NSError *error = nil;
    
    [phoneUtil phoneNumberByParsingString:maliciousNumber defaultRegion:@"US" keepingRawInput:NO error:&error];
    STAssertNotNil(error, @"Should produce an error.");
    STAssertEqualObjects(LPNParsingErrorDomain, [error domain], @"Error should have the correct domain.");
    STAssertEquals(LPNTooLongParsingError, [error code], @"Error should have the correct code.");
    
    error = nil;
    maliciousNumber = [[NSMutableString alloc] initWithCapacity:6100];
    for (int i = 0; i < 350; i++) {
        [maliciousNumber appendString:@"200"];
    }
    [maliciousNumber appendString:@" extensiOB 345"];

    [phoneUtil phoneNumberByParsingString:maliciousNumber defaultRegion:@"US" keepingRawInput:NO error:&error];
    STAssertNotNil(error, @"Should produce an error.");
    STAssertEqualObjects(LPNParsingErrorDomain, [error domain], @"Error should have the correct domain.");
    STAssertEquals(LPNTooLongParsingError, [error code], @"Error should have the correct code.");
}

- (void)testParseWithInternationalPrefixes
{
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"+1 (650) 253-0000" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");
    STAssertEqualObjects(internationalTollfree, [phoneUtil phoneNumberByParsingString:@"011 800 1234 5678" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"1-650-253-0000" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");

    // Calling the US number from Singapore by using different service providers
    // 1st test: calling using SingTel IDD serice (IDD is 001)
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"0011-650-253-0000" defaultRegion:@"SG" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");
    // 2nd test: calling using StarHub IDD service (IDD is 008)
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"0081-650-253-0000" defaultRegion:@"SG" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");
    // 3rd test: calling using SingTel V019 service (IDD is 019)
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"0191-650-253-0000" defaultRegion:@"SG" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");
    
    // Calling the US number from Poland
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"0~01-650-253-0000" defaultRegion:@"PL" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");
    // Using "++" at the start
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"++1 (650) 253-0000" defaultRegion:@"PL" keepingRawInput:NO error:NULL], @"Should properly parse with international prefix.");
}

- (void)testParseNonAscii
{
    // Using a full-width plus sign.
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"\uFF0B1 (650) 253-0000" defaultRegion:@"SG" keepingRawInput:NO error:NULL], @"Should properly parse with non-ascii characters.");
    
    // Using a soft hyphen U+00AD
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:@"1 (650) 253\u00AD-0000" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse with non-ascii characters.");
    
    // The whole number, including punctuation, is here represented in full-width form.
    NSString *fullWidthPhoneNumberString = @"\uFF0B\uFF11\u3000\uFF08\uFF16\uFF15\uFF10\uFF09\u3000\uFF12\uFF15\uFF13\uFF0D\uFF10\uFF10\uFF10\uFF10";
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:fullWidthPhoneNumberString defaultRegion:@"SG" keepingRawInput:NO error:NULL], @"Should properly parse with non-ascii characters.");
    
    // Using U+30FC dash instead.
    fullWidthPhoneNumberString = @"\uFF0B\uFF11\u3000\uFF08\uFF16\uFF15\uFF10\uFF09\u3000\uFF12\uFF15\uFF13\u30FC\uFF10\uFF10\uFF10\uFF10";
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:fullWidthPhoneNumberString defaultRegion:@"SG" keepingRawInput:NO error:NULL], @"Should properly parse with non-ascii characters.");

    // Using a very strange decimal digit range (Mongolian digits).
    fullWidthPhoneNumberString = @"\u1811 \u1816\u1815\u1810 \u1812\u1815\u1813 \u1810\u1810\u1810\u1810";
    STAssertEqualObjects(usNumber, [phoneUtil phoneNumberByParsingString:fullWidthPhoneNumberString defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse with non-ascii characters.");
    
}

- (void)testParseWithLeadingZero
{
    STAssertEqualObjects(itNumber, [phoneUtil phoneNumberByParsingString:@"+39 02-36618 300" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse with leading zero.");
    STAssertEqualObjects(itNumber, [phoneUtil phoneNumberByParsingString:@"02-36618 300" defaultRegion:@"IT" keepingRawInput:NO error:NULL], @"Should properly parse with leading zero.");
    
    STAssertEqualObjects(itMobile, [phoneUtil phoneNumberByParsingString:@"345 678 901" defaultRegion:@"IT" keepingRawInput:NO error:NULL], @"Should properly parse with leading zero.");
}

- (void)testParseNationalNumberArgentina
{
#define DontCryForMeArgentina(obj1,obj2,comment) do { STAssertEqualObjects(obj1,obj2,comment); } while(0)

    // Test parsing mobile numbers of Argentina
    LPNPhoneNumber *testPhoneNumber = [[LPNPhoneNumber alloc] init];
    testPhoneNumber.countryCode = 54;
    testPhoneNumber.nationalNumber = 93435551212;
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"+54 9 343 555 1212" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"0343 15 555 1212" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");

    [testPhoneNumber clear];
    testPhoneNumber.countryCode = 54;
    testPhoneNumber.nationalNumber = 93715654320;
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"+54 9 3715 65 4320" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"03715 15 65 4320" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    
    DontCryForMeArgentina(arMobile, [phoneUtil phoneNumberByParsingString:@"911 876 54321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    
    // Test parsing fixed-line numbers of Argentina
    DontCryForMeArgentina(arNumber, [phoneUtil phoneNumberByParsingString:@"+54 11 8765 4321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    DontCryForMeArgentina(arMobile, [phoneUtil phoneNumberByParsingString:@"011 8765 4321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    
    [testPhoneNumber clear];
    testPhoneNumber.countryCode = 54;
    testPhoneNumber.nationalNumber = 3715654321;
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"+54 11 8765 4321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"03715 65 4321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    
    [testPhoneNumber clear];
    testPhoneNumber.countryCode = 54;
    testPhoneNumber.nationalNumber = 2312340000;
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"+54 23 1234 0000" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");
    DontCryForMeArgentina(testPhoneNumber, [phoneUtil phoneNumberByParsingString:@"023 1234 0000" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Argentina");

#undef DontCryForMeArgentina
}

- (void)testParseWithXInNumber
{
    // Test that having an 'x' in the phone number at the start is ok and that it just gets removed.
    STAssertEqualObjects(arNumber, [phoneUtil phoneNumberByParsingString:@"01187654321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers with 'x' in the start.");
    STAssertEqualObjects(arNumber, [phoneUtil phoneNumberByParsingString:@"(0) 1187654321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers with 'x' in the start.");
    STAssertEqualObjects(arNumber, [phoneUtil phoneNumberByParsingString:@"0 1187654321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers with 'x' in the start.");
    STAssertEqualObjects(arNumber, [phoneUtil phoneNumberByParsingString:@"(0xx) 1187654321" defaultRegion:@"AR" keepingRawInput:NO error:NULL], @"Should properly parse national numbers with 'x' in the start.");
    
    LPNPhoneNumber *arFromUS = [[LPNPhoneNumber alloc] init];
    arFromUS.countryCode = 54;
    arFromUS.nationalNumber = 81429712;
    
    // This test is intentionally constructed such that the number of digits after xx is larger than 7, so that the number won't be mistakenly treated as an extension, as we allow extensions up to 7 digits.
    // This assumption is okay for now as all the countries where a carrier selection code is written in the form of xx have a national significant number of length larger than 7.
    STAssertEqualObjects(arFromUS, [phoneUtil phoneNumberByParsingString:@"011xx5481429712" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse national numbers with 'x' in the start.");
}

- (void)testParseNumbersMexico
{
    LPNPhoneNumber *testNumber = [[LPNPhoneNumber alloc] init];
    // Test parsing fixed-line numbers of Mexico.
    testNumber.countryCode = 52;
    testNumber.nationalNumber = 4499780001;
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+52 (449)978-0001" defaultRegion:@"MX" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Mexico.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"01 (449)978-0001" defaultRegion:@"MX" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Mexico.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(449)978-0001" defaultRegion:@"MX" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Mexico.");
    
    // Test parsing mobile numbers of Mexico.
    [testNumber clear];
    testNumber.countryCode = 52;
    testNumber.nationalNumber = 13312345678;
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+52 1 33 1234-5678" defaultRegion:@"MX" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Mexico.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"044 (33) 1234-5678" defaultRegion:@"MX" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Mexico.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"045 33 1234-5678" defaultRegion:@"MX" keepingRawInput:NO error:NULL], @"Should properly parse national numbers for Mexico.");
}

- (void)testFailedParseOnInvalidNumbers
{
    NSError *error = nil;
    NSString *testString = @"This is not a phone number";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"NZ" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertTrue([[error domain] isEqualToString:LPNParsingErrorDomain], @"Error should have the correct domain.");
    STAssertEquals(LPNNotANumberParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"1 Still not a number";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"NZ" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNTooLongParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"1 MICROSOFT";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"NZ" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNTooLongParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"12 MICROSOFT";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"NZ" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNTooLongParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"01495 72553301873 810104";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"GB" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNTooLongParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"+---";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"DE" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNNotANumberParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"+***";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"DE" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNNotANumberParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"+*******91";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"DE" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNNotANumberParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"+49 0";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"DE" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNTooShortNSNParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"+210 3456 56789";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"NZ" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"+ 00 210 3 331 6005";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"NZ" keepingRawInput:NO error:&error], @"Should fail when parsing invalid numbers.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"123 456 7890";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"ZZ" keepingRawInput:NO error:&error], @"Should fail when parsing a number for an unknown region code.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"123 456 7890";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"CS" keepingRawInput:NO error:&error], @"Should fail when parsing a number for a deprecated region code.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"123 456 7890";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:nil keepingRawInput:NO error:&error], @"Should fail when parsing a number for a nil region code.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"0044------";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"GB" keepingRawInput:NO error:&error], @"Should fail when parsing a number containing only the region code.");
    STAssertEquals(LPNTooShortAfterIDDParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"0044";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"GB" keepingRawInput:NO error:&error], @"Should fail when parsing a number containing only the region code.");
    STAssertEquals(LPNTooShortAfterIDDParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"011";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"US" keepingRawInput:NO error:&error], @"Should fail when parsing a number containing only an IDD.");
    STAssertEquals(LPNTooShortAfterIDDParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"0119";
    
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"US" keepingRawInput:NO error:&error], @"Should fail when parsing a number containing only an IDD + 9.");
    STAssertEquals(LPNTooShortAfterIDDParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = @"";
    // Invalid region
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"ZZ" keepingRawInput:NO error:&error], @"Should fail when parsing an empty string.");
    STAssertEquals(LPNNotANumberParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = nil;
    // Invalid region
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"ZZ" keepingRawInput:NO error:&error], @"Should fail when parsing a nil string.");
    STAssertEquals(LPNNotANumberParsingError, [error code], @"Should return an error with the correct code.");
    
    error = nil;
    testString = nil;
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"US" keepingRawInput:NO error:&error], @"Should fail when parsing a nil string.");
    STAssertEquals(LPNNotANumberParsingError, [error code], @"Should return an error with the correct code.");    

    error = nil;
    testString = @"tel:555-1234;phone-context=www.google.com";
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"ZZ" keepingRawInput:NO error:&error], @"Should fail when parsing a nil string.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should return an error with the correct code.");

    // This is invalid because no "+" sign is present as part of phone-context. This should not succeed in being parsed.
    error = nil;
    testString = @"tel:555-1234;phone-context=1-331";
    STAssertNil([phoneUtil phoneNumberByParsingString:testString defaultRegion:@"ZZ" keepingRawInput:NO error:&error], @"Should fail when parsing a nil string.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should return an error with the correct code.");
}

- (void)testParseNumbersWithPlusWithNoRegion
{
    // ZZ is allowed only if the number starts with a '+' - then the country calling code can be calculated.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"+64 3 331 6005" defaultRegion:@"ZZ" keepingRawInput:NO error:NULL], @"Should parse numbers using region code ZZ if the number starts with a '+'.");
    
    // Test with full-width plus.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"\uFF0B64 3 331 6005" defaultRegion:@"ZZ" keepingRawInput:NO error:NULL], @"Should parse numbers using region code ZZ if the number starts with a '+'.");
    
    // Test with normal plus but leading characters that need to be stripped.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"Tel: +64 3 331 6005" defaultRegion:@"ZZ" keepingRawInput:NO error:NULL], @"Should parse numbers using region code ZZ if the number starts with a '+'.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"+64 3 331 6005" defaultRegion:nil keepingRawInput:NO error:NULL], @"Should parse numbers using region code ZZ if the number starts with a '+'.");
    STAssertEqualObjects(internationalTollfree, [phoneUtil phoneNumberByParsingString:@"+800 1234 5678" defaultRegion:nil keepingRawInput:NO error:NULL], @"Should parse toll-free numbers properly.");
    STAssertEqualObjects(universalPremiumRate, [phoneUtil phoneNumberByParsingString:@"+979 123 456 789" defaultRegion:nil keepingRawInput:NO error:NULL], @"Should parse premium rate numbers properly.");
    
    // Test parsing RFC3966 format with a phone context.
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:03-331-6005;phone-context=+64" defaultRegion:@"ZZ" keepingRawInput:NO error:NULL], @"Should parse RFC3966 format correctly.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"  tel:03-331-6005;phone-context=+64" defaultRegion:@"ZZ" keepingRawInput:NO error:NULL], @"Should parse RFC3966 format correctly.");
    STAssertEqualObjects(nzNumber, [phoneUtil phoneNumberByParsingString:@"tel:03-331-6005;isub=12345;;phone-context=+64" defaultRegion:@"ZZ" keepingRawInput:NO error:NULL], @"Should parse RFC3966 format correctly.");
    
    // It is important that we set the carrier code to an empty string, since we kept raw input and no carrier code was found.
    LPNPhoneNumber *nzNumberWithRawInput = [nzNumber copy];
    nzNumberWithRawInput.rawInput = @"+64 3 331 6005";
    nzNumberWithRawInput.countryCodeSource = LPNCountryCodeFromNumberWithPlusSignSource;
    nzNumberWithRawInput.preferredDomesticCarrierCode = @"";
    
    STAssertEqualObjects(nzNumberWithRawInput, [phoneUtil phoneNumberByParsingString:@"+64 3 331 6005" defaultRegion:@"ZZ" keepingRawInput:YES error:NULL], @"Should parse numbers using region code ZZ if the number starts with a '+'.");
    
    // Null is also allowed for the region code in these cases.
    STAssertEqualObjects(nzNumberWithRawInput, [phoneUtil phoneNumberByParsingString:@"+64 3 331 6005" defaultRegion:nil keepingRawInput:YES error:NULL], @"Should parse numbers using a nil region code if the number starts with a '+'.");
}

- (void)testParseExtensions
{
    LPNPhoneNumber *testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 64;
    testNumber.nationalNumber = 33316005;
    testNumber.extension = @"3456";
    
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"03 331 6005 ext 3456" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"03-3316005x3456" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"03-3316005 int.3456" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"03 3316005 #3456" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    
    // Test the following do not extract extensions:
    STAssertEqualObjects(alphanumericNumber, [phoneUtil phoneNumberByParsingString:@"1800 six-flags" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(alphanumericNumber, [phoneUtil phoneNumberByParsingString:@"1800 SIX FLAGS" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(alphanumericNumber, [phoneUtil phoneNumberByParsingString:@"0~0 1800 7493 5247" defaultRegion:@"PL" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(alphanumericNumber, [phoneUtil phoneNumberByParsingString:@"(1800) 7493.5247" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    
    // Check that the last instance of an extension token is matched.
    testNumber = [alphanumericNumber copy];
    testNumber.extension = @"1234";
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"0~0 1800 7493 5247 ~1234" defaultRegion:@"PL" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");

    // Verifying bug-fix where the last digit of a number was previously omitted if it was a 0 when extracting the extension. Also verifying a few different cases of extensions.
    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 44;
    testNumber.nationalNumber = 2034567890;
    testNumber.extension = @"456";
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890x456" defaultRegion:@"NZ" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890x456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890 x456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890 X456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890 X 456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890 X  456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890 x 456  " defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890  X 456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+44 2034567890;ext=456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"tel:2034567890;ext=456;phone-context=+44" defaultRegion:@"ZZ" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    
    // Full-width extensioni, "extn" only.
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+442034567890\uFF45\uFF58\uFF54\uFF4E456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    
    // "xtn" only.
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+442034567890\uFF58\uFF54\uFF4E456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse phone numbers with extensions.");
    
    // "xt" only.
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+442034567890\uFF58\uFF54456" defaultRegion:@"GB" keepingRawInput:NO error:NULL], @"Should properly parse phone numbers with extensions.");

    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 1;
    testNumber.nationalNumber = 8009012255;
    testNumber.extension = @"7246433";
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(800) 901-3355 x 7246433" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(800) 901-3355 , ext 7246433" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(800) 901-3355 ,extension 7246433" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(800) 901-3355 ,extensi\u00F3n 7246433" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    // Repeat with the small letter o with an acute accent created by combining characters.
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(800) 901-3355 ,extensio\u0301n 7246433" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(800) 901-3355 , 7246433" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(800) 901-3355 ext: 7246433" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    
    // Test that if a number has two extensions specified, we ignore the second.
    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 1;
    testNumber.nationalNumber = 2121231234;
    testNumber.extension = @"508";
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(212)123-1234 x508/x1234" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should discard subsequent extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(212)123-1234 x508/ x1234" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should discard subsequent extensions.");
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"(212)123-1234 x508\\x1234" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should discard subsequent extensions.");
    
    // Test parsing numbers in the form (645) 123-1234-910# works, where the last 3 digits before the # are an extension.
    
    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 1;
    testNumber.nationalNumber = 6451231234;
    testNumber.extension = @"910";
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+1 (645) 123 1234-910#" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
    // Retry with the same number in a slightly different format.
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+1 (645) 123 1234 ext. 910#" defaultRegion:@"US" keepingRawInput:NO error:NULL], @"Should properly parse numbers with extensions.");
}

- (void)testParseKeepingRawInput
{
    LPNPhoneNumber *testNumber = [alphanumericNumber copy];
    testNumber.rawInput = @"800 six-flags";
    testNumber.countryCodeSource = LPNCountryCodeFromDefaultCountrySource;
    testNumber.preferredDomesticCarrierCode = @"";
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"800 six-flags" defaultRegion:@"US" keepingRawInput:YES error:NULL], @"Should properly parse numbers when keeping raw input.");
    
    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 1;
    testNumber.nationalNumber = 8007493524;
    testNumber.rawInput = @"1800 six-flag";
    testNumber.countryCodeSource = LPNCountryCodeFromNumberWithoutPlusSignSource;
    testNumber.preferredDomesticCarrierCode = @"";
    
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"1800 six-flag" defaultRegion:@"US" keepingRawInput:YES error:NULL], @"Should properly parse numbers when keeping raw input.");
    
    testNumber.rawInput = @"+1800 six-flag";
    testNumber.countryCodeSource = LPNCountryCodeFromNumberWithPlusSignSource;

    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"+1800 six-flag" defaultRegion:@"NZ" keepingRawInput:YES error:NULL], @"Should properly parse numbers when keeping raw input.");
    
    testNumber.rawInput = @"001800 six-flag";
    testNumber.countryCodeSource = LPNCountryCodeFromNumberWithIDDSource;
    
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"001800 six-flag" defaultRegion:@"NZ" keepingRawInput:YES error:NULL], @"Should properly parse numbers when keeping raw input.");
    
    // Invalid region code supplied.
    NSError *error = nil;
    STAssertNil([phoneUtil phoneNumberByParsingString:@"123 456 7890" defaultRegion:@"CS" keepingRawInput:YES error:&error], @"Should not return a phone number when an invalid region code is supplied.");
    STAssertNotNil(error, @"Should set error when an invalid region code is supplied.");
    STAssertTrue([[error domain] isEqualToString:LPNParsingErrorDomain], @"Should have the correct error domain.");
    STAssertEquals(LPNInvalidCountryCodeParsingError, [error code], @"Should have the correct error code.");
    
    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 82;
    testNumber.nationalNumber = 22123456;
    testNumber.rawInput = @"08122123456";
    testNumber.countryCodeSource = LPNCountryCodeFromDefaultCountrySource;
    testNumber.preferredDomesticCarrierCode = @"81";
    
    STAssertEqualObjects(testNumber, [phoneUtil phoneNumberByParsingString:@"08122123456" defaultRegion:@"KR" keepingRawInput:YES error:NULL], @"Should properly parse numbers when keeping raw input.");
}

- (void)testCountryWithNoNumberDescription
{
    // Andorra is a country where we don't have phone number description info in the metadata.
    
    LPNPhoneNumber *testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCodeSource = 376;
    testNumber.nationalNumber = 12345;
    
    STAssertEqualObjects(@"+376 12345", [phoneUtil stringWithPhoneNumber:testNumber format:LPNInternationalPhoneNumberFormat], @"Should correctly format when no number description is available.");
    STAssertEqualObjects(@"+37612345", [phoneUtil stringWithPhoneNumber:testNumber format:LPNE164PhoneNumberFormat], @"Should correctly format when no number description is available.");
    STAssertEqualObjects(@"12345", [phoneUtil stringWithPhoneNumber:testNumber format:LPNNationalPhoneNumberFormat], @"Should correctly format when no number description is available.");
    
    STAssertEquals(LPNUnknownPhoneNumberType, [phoneUtil typeForPhoneNumber:testNumber], @"Should return unknown phone number type when no number description is available.");
    STAssertTrue([phoneUtil isValidNumber:testNumber], @"Should correctly validate phone number when no number description is available.");
    
    // Test dialing a US number from within Andorra.
    STAssertEqualObjects(@"00 1 650 253 0000", [phoneUtil outOfCountryCallingNumberStringWithPhoneNumber:usNumber region:@"AD"], @"Should properly format out-of-country numbers when dialing from a region for which no number description is available.");
}

- (void)testUnknownCountryCallingCodeForValidation
{
    STAssertFalse([phoneUtil isValidNumber:unknownCountryCodeNoRawInput], @"Should properly validate phone numbers.");
    
    // It's not very well defined as to what the E164 representation for a number with an invalid country calling code is, but just prefixing the country code and national number is about the best we can do.
    STAssertEqualObjects(@"+212345", [phoneUtil stringWithPhoneNumber:unknownCountryCodeNoRawInput format:LPNE164PhoneNumberFormat], @"Should properly format E164 with an invalid country code.");
}

- (void)testMatchPhoneNumberMatches
{
    // Test simple matches where formatting is different, or leading zeroes, or country calling code has been specified.
    
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331 6005" againstString:@"+64 03 331 6005"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+800 1234 5678" againstString:@"+80012345678"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+64 03 331-6005" againstString:@"+64 03331 6005"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+643 331-6005" againstString:@"+64033316005"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+643 331-6005" againstString:@"+6433316005"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"+6433316005"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"tel:+64-3-331-6005;isub=123"], @"Should correctly match phone number strings.");
    
    // Test alpha numbers.
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+1800 siX-Flags" againstString:@"+1 800 7493 5247"], @"Should correctly match phone number strings.");
    
    // Test numbers with extensions.
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005 extn 1234" againstString:@"+6433316005#1234"], @"Should correctly match phone number strings.");
    
    // Test phone number objects.
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumber:nzNumber againstString:@"+6403 331 6005"], @"Should correctly match phone numbers against phone number strings.");
    
    LPNPhoneNumber *testNumber = [nzNumber copy];
    testNumber.extension = @"3456";
    
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumber:testNumber againstString:@"+643 331 6005 ext 3456"], @"Should correctly match phone numbers against phone number strings.");
    
    // Check empty extensions are ignored.
    testNumber.extension = @"";
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumber:testNumber againstString:@"+6403 331 6005"], @"Should correctly match phone numbers against phone number strings.");
    
    // Check matching two phone number objects.
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumber:testNumber againstPhoneNumber:nzNumber], @"Should correctly match phone numbers against another phone number.");
    
    // Check raw input, country code source and preferred domestic carrier code are ignored.
    testNumber = [[LPNPhoneNumber alloc] init];
    LPNPhoneNumber *testNumber2 = [[LPNPhoneNumber alloc] init];
    
    testNumber.countryCode = 55;
    testNumber.nationalNumber = 3121286979;
    testNumber.countryCodeSource = LPNCountryCodeFromNumberWithPlusSignSource;
    testNumber.preferredDomesticCarrierCode = @"12";
    testNumber.rawInput = @"012 3121286979";
    
    testNumber2.countryCodeSource = 55;
    testNumber2.nationalNumber = 3121286979;
    testNumber2.countryCodeSource = LPNCountryCodeFromDefaultCountrySource;
    testNumber2.preferredDomesticCarrierCode = @"14";
    testNumber2.rawInput = @"143121286979";
    
    STAssertEquals(LPNExactMatchType, [phoneUtil matchPhoneNumber:testNumber againstPhoneNumber:testNumber2], @"Should ignore raw input, country code source and preferred domestic carrier code.");
}

- (void)testMatchPhoneNumberNonMatches
{
    // Non-matches.
    STAssertEquals(LPNNoMatchType, [phoneUtil matchPhoneNumberString:@"03 331 6005" againstString:@"03 331 6006"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNNoMatchType, [phoneUtil matchPhoneNumberString:@"+800 1234 5678" againstString:@"+1 800 1234 5678"], @"Should correctly match phone number strings.");
    
    // Different country calling code, partial number match.
    STAssertEquals(LPNNoMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"+16433316005"], @"Should correctly match phone number strings.");
    
    // Different country calling code, same number.
    STAssertEquals(LPNNoMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"+6133316005"], @"Should correctly match phone number strings.");
    
    // Extension different, all else the same.
    STAssertEquals(LPNNoMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005 extn 1234" againstString:@"0116433316005#1235"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNNoMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005 extn 1234" againstString:@"tel:+64-3-331-6005;ext=1235"], @"Should correctly match phone number strings.");
    
    // NSN matches, but extension is different - not the same number.
    STAssertEquals(LPNNoMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005 ext.1235" againstString:@"3 331 6005#1234"], @"Should correctly match phone number strings.");
    
    // Invalid numbers that can't be parsed.
    STAssertEquals(LPNNotANumberMatchType, [phoneUtil matchPhoneNumberString:@"4" againstString:@"3 331 6043"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNNotANumberMatchType, [phoneUtil matchPhoneNumberString:@"+43" againstString:@"+64 3 331 6005"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNNotANumberMatchType, [phoneUtil matchPhoneNumberString:@"+43" againstString:@"64 3 331 6005"], @"Should correctly match phone number strings.");
    STAssertEquals(LPNNotANumberMatchType, [phoneUtil matchPhoneNumberString:@"Dog" againstString:@"64 3 331 6005"], @"Should correctly match phone number strings.");
}

- (void)testMatchPhoneNumberNSNMatches
{
    // NSN Matches.
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"03 331 6005"], @"Should properly match NSN matches.");
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"tel:03-331-6005;isub=1234;phone-context=abc.nz"], @"Should properly match NSN matches.");
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumber:nzNumber againstString:@"03 331 6005"], @"Should properly match NSN matches.");
    
    // Here the second number possibly starts with the country calling code for New Zealand, although we are unsure.
    LPNPhoneNumber *testNumber = [nzNumber copy];
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumber:testNumber againstString:@"(64-3) 331 6005"], @"Should properly match NSN matches.");
    // Check the phone number was not edited during the method call.
    STAssertEqualObjects(nzNumber, testNumber, @"Number should not be modified when testing for a match.");
    
    // Here, the 1 might be a national prefix, if we compare it to the US number, so the resultant match is an NSN match.
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumber:usNumber againstString:@"1-650-253-0000"], @"Should properly match NSN matches.");
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumber:usNumber againstString:@"6502530000"], @"Should properly match NSN matches.");
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumberString:@"+1 650-253 0000" againstString:@"1 650 253 0000"], @"Should properly match NSN matches.");
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumberString:@"1 650-253 0000" againstString:@"1 650 253 0000"], @"Should properly match NSN matches.");
    STAssertEquals(LPNNSNMatchType, [phoneUtil matchPhoneNumberString:@"1 650-253 0000" againstString:@"+1 650 253 0000"], @"Should properly match NSN matches.");
    
    // For this case, the match will be a short NSN match, because we cannot assume that the 1 might be a national prefix, so don't remove it when parsing.
    testNumber = [[LPNPhoneNumber alloc] init];
    testNumber.countryCode = 41;
    testNumber.nationalNumber = 6502530000;
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumber:testNumber againstString:@"1-650-253-0000"], @"Should properly match NSN matches.");
}

- (void)testMatchPhoneNumberShortNSNMatches
{
    // Short NSN matches with the country not specified for either one or both numbers.
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"331 6005"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"tel:331-6005;phone-context=abc.nz"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"tel:331-6005;isub=1234;phone-context=abc.nz"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"tel:331-6005;isub=1234;phone-context=abc.nz;a=%A1"], @"Should properly match short NSN matches.");
    
    // We did not know that the "0" was a national prefix since neither number has a country code, so this is considered a short nsn match.
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"3 331-6005" againstString:@"03 331 6005"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"3 331-6005" againstString:@"331 6005"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"3 331-6005" againstString:@"tel:331-6005;phone-context=abc.nz"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"3 331-6005" againstString:@"+64 331 6005"], @"Should properly match short NSN matches.");
    
    // Short NSN match with the country specified.
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"03 331-6005" againstString:@"331 6005"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"1 234 345 6789" againstString:@"345 6789"], @"Should properly match short NSN matches.");
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"+1 (234) 345 6789" againstString:@"345 6789"], @"Should properly match short NSN matches.");
    
    // NSN matches, country calling code omitted for one number, extension missing for one.
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumberString:@"+64 3 331-6005" againstString:@"3 331 6005#1234"], @"Should properly match short NSN matches.");
    
    // One has Italian leading zero, one does not.
    LPNPhoneNumber *testNumber1 = [[LPNPhoneNumber alloc] init];
    testNumber1.countryCode = 39;
    testNumber1.nationalNumber = 1234;
    testNumber1.italianLeadingZero = YES;
    
    LPNPhoneNumber *testNumber2 = [[LPNPhoneNumber alloc] init];
    testNumber2.countryCode = 39;
    testNumber2.nationalNumber = 1234;
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumber:testNumber1 againstPhoneNumber:testNumber2], @"Should properly match short NSN matches.");
    
    // One has an extension, the other has an extension of "".
    testNumber1.extension = @"1234";
    [testNumber1 clearItalianLeadingZero];
    testNumber2.extension = @"";
    STAssertEquals(LPNShortNSNMatchType, [phoneUtil matchPhoneNumber:testNumber1 againstPhoneNumber:testNumber2], @"Should properly match short NSN matches.");
}

- (void)testCanBeInternationallyDialled
{
    // We have no-international-dialling rules for the US in our test metadata that say that toll-free numbers cannot be dialled internationally.
    STAssertFalse([phoneUtil phoneNumberCanBeInternationallyDialled:usTollfree], @"Should properly determine whether a phone number can be internationally dialled.");

    // Normal US numbers can be internationally dialled.
    STAssertTrue([phoneUtil phoneNumberCanBeInternationallyDialled:usNumber], @"Should properly determine whether a phone number can be internationally dialled.");

    // Invalid number.
    STAssertTrue([phoneUtil phoneNumberCanBeInternationallyDialled:usLocalNumber], @"Should properly determine whether a phone number can be internationally dialled.");

    // We have no data for NZ - should return true.
    STAssertTrue([phoneUtil phoneNumberCanBeInternationallyDialled:nzNumber], @"Should properly determine whether a phone number can be internationally dialled.");
    
    STAssertTrue([phoneUtil phoneNumberCanBeInternationallyDialled:internationalTollfree], @"Should properly determine whether a phone number can be internationally dialled.");
}

- (void)testIsAlphaNumber
{
    STAssertTrue([phoneUtil isAlphaPhoneNumberString:@"1800 six-flags"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertTrue([phoneUtil isAlphaPhoneNumberString:@"1800 six-flags ext. 1234"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertTrue([phoneUtil isAlphaPhoneNumberString:@"+800 six-flags"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertTrue([phoneUtil isAlphaPhoneNumberString:@"180 six-flags"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertFalse([phoneUtil isAlphaPhoneNumberString:@"1800 123-1234"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertFalse([phoneUtil isAlphaPhoneNumberString:@"1 six-flags"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertFalse([phoneUtil isAlphaPhoneNumberString:@"18 six-flags"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertFalse([phoneUtil isAlphaPhoneNumberString:@"1800 123-1234 extension: 1234"], @"Should properly determine whether a phone number string contains alpha digits.");
    STAssertFalse([phoneUtil isAlphaPhoneNumberString:@"+800 1234-1234"], @"Should properly determine whether a phone number string contains alpha digits.");
}

@end
