Return-Path: <linux-usb+bounces-2297-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD97D9F10
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 19:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35DB228244B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 17:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5803B2A6;
	Fri, 27 Oct 2023 17:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="GJT+uy+r"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123F1946F
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 17:55:27 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2065.outbound.protection.outlook.com [40.92.40.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA52F3;
	Fri, 27 Oct 2023 10:55:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/g8FDgDYm6FUKmKlyGcZVE30FxymDNh/ElzmXgxuY7KljdrU9+TFkfYj8hPUNagRnYr6qbrRh4MJUuRUVn5upha3YztOBr9K0KPvq50599GacNB21fEozyuUp+bxf9MsCY86keFi7Ym2R2h/NDYrEj1P8hYRiuwmbGSiUkK9kOVGYhKzJWl5rsP4N2EW6cJFoJT+hXaVD5KcafItRThi6u9bgBsDEVQfJlFbAe7NUyuRKjPV3gP4/UvGggDjtHFZdRtwCoTlI6qPSEdyIZoNdzw+4VEgJJENSgQXieYsfN/0KYaRv4rbaLDq2cLblXHRE1veOK+fu0mGwyCQVlNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LA50P3Qy8enxRg6IClEzL77OpZBDyKwV+e/1jxfgOn0=;
 b=Jf3TNwbNbtrivshY7XmXMDadMLY+4F8fawSIsbC+wXfreHLwsOwLtQiGH97RSZl1KdRZRIhTNB6wlw+ODPWzc+37G179e1GejuA3X0eRFe3BsIM+AAHdFXmYppNaxAVD+Br6zKbj2jNdF5CFOBm45R3MXWR3FsC/h1gB7HYR1piHtcjL4hmh0wvx028V3CsBN/0GS5MSy+6lJTVNQQ4/49zobVjzU0KYy+qHLv7goTXi5eQjn2DAATBXwqJo9jJizBrgSuNq+EETJBwp+vUSX1wxGqdOqTPlIHOyIJQ2R2YbYMj9TXXNkX+ADUgnvIOp7X7nBwivMpPYJ7eoom5JdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LA50P3Qy8enxRg6IClEzL77OpZBDyKwV+e/1jxfgOn0=;
 b=GJT+uy+rpzWEgfutwJ+iicO7VnF/TG7mYJcfZlUHfemWO8k7FQPOSbqz3vFh4dGWNKYhH9+lU6JOLBGuvDmrRU6+QuUyDps0lN4xyyIyUQcpjI0reH98TiEtG4EvARLGDGJDrOV/Wpblrf4BJCFWp2c9ouGBiH8JsNs5gh+IdZll+hTL2enztOJnfF/GGxF84KMFUvFQNQ2u7y/fxX6X8dp0j6pBEHOFwjnxFOVFr97T6nTVIyy+RPw5MdT7DpQ7Vh3mbcPAES35vHyG/KrFdm1RxLfd6plCb9HPw/DdAellVanxLgh1BneMJ/qCik+2tK2DuzJbeiXE9iTi8VWMJA==
Received: from PH0PR06MB7817.namprd06.prod.outlook.com (2603:10b6:510:ed::8)
 by PH0PR06MB8604.namprd06.prod.outlook.com (2603:10b6:510:11b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 17:55:21 +0000
Received: from PH0PR06MB7817.namprd06.prod.outlook.com
 ([fe80::f9e:b4b4:77a7:442a]) by PH0PR06MB7817.namprd06.prod.outlook.com
 ([fe80::f9e:b4b4:77a7:442a%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 17:55:21 +0000
From: Victor Fragoso <victorffs@hotmail.com>
To: "larsm17@gmail.com" <larsm17@gmail.com>, "johan@kernel.org"
	<johan@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: add Fibocom L7xx modules
Thread-Topic: [PATCH] USB: serial: option: add Fibocom L7xx modules
Thread-Index: AQHaB6s8qAI51809GEez52FxUyeChbBcDQMAgAHhJYA=
Date: Fri, 27 Oct 2023 17:55:21 +0000
Message-ID: <94477736e69cc76eaaef8584d7e1aa5078a0611e.camel@hotmail.com>
References: <9315051ae981aaad1d46724641defc6e5f79d12b.camel@hotmail.com>
	 <84a78bb8-fd85-4ee5-9c92-859e8450a587@gmail.com>
In-Reply-To: <84a78bb8-fd85-4ee5-9c92-859e8450a587@gmail.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [XgGS6F5957peICD7EomLn+pQqjgl+5Gw]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR06MB7817:EE_|PH0PR06MB8604:EE_
x-ms-office365-filtering-correlation-id: 8d8bd8d5-47d8-40a1-a30a-08dbd715e366
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 9KT4dXvSMUU1D/g4j1aownr3V3s54q3rqVic2SPdVDpXjceg262gci4W+L7XqOa1U1ZPezK1O1FeaQ+pADoJVk2KjLKu6KjExXskLBDdGH1V3h3x2mw1ltSNA7UvbMHuGy9NlVgoWa/ZoMp89At2b7QtwEYI8iHgAtcGjOuufCU+fq1ZCF8i8+wnqWsrwuBeCoh3ca3cFNoquXZyP8MT+38yh+e+zzjwCYHt3RoB0RmKo5RIUmSNDVJSWYxctG3glRoCow894bv0CjWX3/JHlUzDIsXfGxtnZdyS3XVvhAiAFqTCKHKTlR7C8S7fGSiPzuTryL/1nd3tkzDcfDEhz1GHqqQWsUX13lbu3wk+EP9Z0hqN61b0bosJQjkPNLJ9RNRGSekQs3uQ79rodcWvpluIrXGJeU7REHRZKF0IIjkfnRqO1FmaWtJ72ADUW4OvIQLxtaBAK8Igq9qpHTbAI4bIGGRSvGwwY+HSbZrnlWdDnspCUjMcbWrDssMJwsWDJ96SNYp0TmHDAbqPBBoI6ufe2lceRei7+PpGbR0EFQ1SOctxJozYiDtmtjYDgcUf
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WjRhdXo0NGNoWmpUbWVER2YrU2I4RXJIdFBSdnIwN1JueFpVaDZQNjZZbzlq?=
 =?utf-8?B?VkxYUjlUK1lPWlVubHhSWktPOGI0ODVSSE9UWndzTEdvTDZUTDkyVmxIOHZF?=
 =?utf-8?B?VzFtaDJiMi9LZGRRdUVqcmNJcnNldjBzNFBJaG9tVUZnbDZERVJWMjA5c1Rl?=
 =?utf-8?B?bERneitQRGVXS3pYVWoxbExDUEowWCthSW43MFRHT2c3ZGtwWmIvVmdQMlkw?=
 =?utf-8?B?Rm1lNXZwS2ZIcWVycUZ4UXU3bDNOR2NOVUlPZlhBSVFVQi9leGFlV2N1M3hy?=
 =?utf-8?B?ZDNzTUVFL0phTEpLbnRONFBNMDlIWldaRWRubjJjRldMdUlycm10VFg4cDRm?=
 =?utf-8?B?OFN4d1U5WDNsWi9JdWdRL0xrT1A4VCt5TFQzczZCaDU3bGdqQ1BsZmc1S0pu?=
 =?utf-8?B?cjJTa0hPYmJjaTFJd05YVXA5NmpTdXhGVW5JSTY0UG85cStITFRJNkdGcjND?=
 =?utf-8?B?b3I3THNFZTZJWWtwUkxRRTA1NjRZSGlwVnpEZ2NOamVGRFZPb1RjaStQV3Bm?=
 =?utf-8?B?S1VLeWw0ZnJFTWRZZ0c3MkFPUXpVUHRlRjVJM2ZlYzBxSFV5elRRSWtWKzdG?=
 =?utf-8?B?VWF6M2NsZ1ArbVpCQ291cHVNN1pxbEZaQUtzWXdJMmNkbUovT2tXRVdYbTRG?=
 =?utf-8?B?QkhjMEZ4L3Rnb01jOXhDTXlDeUtyUkFWQ0FoQ1dlMDEybkJqdnRlOTFPUGJN?=
 =?utf-8?B?WGVRSmZYeUQxcW9ySlUvUkczNGoxV3pkK0JHaFpkSytGanRSOEd5V1cwSXlq?=
 =?utf-8?B?L0hMTktNVGVFNHVqNDNLNllQYzlDNmVlZkRZallUSHJiMkt0ZzRQOGtRcGtM?=
 =?utf-8?B?SWozbERGS2JqamJKbEhoaUxONTJOVGg2MTYvV3h5OEZnN0VVblhLM0NWcVNB?=
 =?utf-8?B?Q1JNMFU5dnU2WWl5VndHblhsc0JvUk14NUcwNUdWa3RiV09PcEUzUUFnRzEw?=
 =?utf-8?B?U0NKYVVkZkZrYjBGL0IyeXJFWnA2Wk9naExhR25tQUd3ekk2MG1KZ2U4cmxT?=
 =?utf-8?B?R01SQU9BNTVTcWVaVWhTTm9JdDRsZUlhMVo3L2UzVjNDbDRzQURQaGFHbDIx?=
 =?utf-8?B?S29NZStndXQ1K1dFUEJ6Mm11bnJmYjlUblhjQWFkeTlFL05FZC9FZVNTR0FG?=
 =?utf-8?B?ZHdJbGRxekEvTVZoUkRDSlFpSU1wYmNKQ3NKMmg0OGpXU2JSb2h0YXRkSGlw?=
 =?utf-8?B?bHJPa2FlQWhJSUI2aEx2Vm1WMFQ1VDNQc0RrQ3FUUnBQK095ektrY3F3NE5h?=
 =?utf-8?B?WmxuQkoxNU9zTjQ1Uldaai9RRDcwREhFV09xYmtXYng1NUNOM0xGSmlvMWw5?=
 =?utf-8?B?dmdSZHNZR3BXYVV0Y2RNTFA3U0NWQlBHSlRPY2xUcmRiSzJ2alpsMzBZeVhB?=
 =?utf-8?B?TFRxUTlEekFKelczdkRtT0VpY3k4VWlld0ZvUVdDcWsrenFvZHU3S0x3U1g3?=
 =?utf-8?B?dDgrTzZDY0czaC9qNE1tMElnTy92WVBPOXBsOXYyblFiK2h1KzVvamFtdGNx?=
 =?utf-8?B?cWJWNUpqU1dURWJlWDUyTVJ3VkhPWGwwanNDR0tRMi9PMitLY0pVMFFRZ21p?=
 =?utf-8?B?SS9sUS92UGZzRWxjN3ZXaXJOdXF1Sk5iVlZQK01Zbk5mY3NJRkV1U3dMcDRm?=
 =?utf-8?Q?mvCoErKlPOMaUqbpKbJE1U/cscwZq1yWOj4uXB52Tqls=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3BD78C04288824FBB38884ADF860667@namprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-73ede.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR06MB7817.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d8bd8d5-47d8-40a1-a30a-08dbd715e366
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 17:55:21.2352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB8604

T24gVGh1LCAyMDIzLTEwLTI2IGF0IDIwOjEzICswNzAwLCBMYXJzIE1lbGluIHdyb3RlOg0KPiBP
biAxMC8yNi8yMDIzIDg6MjQsIFZpY3RvciBGcmFnb3NvIHdyb3RlOg0KPiA+IEFkZCBzdXBwb3J0
IGZvciBGaWJvY29tIEw3eHggbW9kdWxlIHNlcmllcyBhbmQgdmFyaWFudHMuDQo+ID4gDQo+ID4g
TDcxNi1FVS02MCAoRUNNKToNCj4gPiBUOiAgQnVzPTAzIExldj0wMSBQcm50PTAxIFBvcnQ9MDEg
Q250PTAxIERldiM9IDE3IFNwZD00ODAgIE14Q2g9IDANCj4gPiBEOiAgVmVyPSAyLjAwIENscz0w
MCg+aWZjICkgU3ViPTAwIFByb3Q9MDAgTXhQUz02NCAjQ2Zncz0gIDENCj4gPiBQOiAgVmVuZG9y
PTE5ZDIgUHJvZElEPTA1NzkgUmV2PSAxLjAwDQo+ID4gUzogIE1hbnVmYWN0dXJlcj1GaWJvY29t
LEluY29ycG9yYXRlZA0KPiA+IFM6ICBQcm9kdWN0PUZpYm9jb20gTW9iaWxlIEJvYXJkYmFuZA0K
PiA+IFM6ICBTZXJpYWxOdW1iZXI9MTIzNDU2Nzg5MEFCQ0RFRg0KPiA+IEM6KiAjSWZzPSA3IENm
ZyM9IDEgQXRyPWUwIE14UHdyPTUwMG1BDQo+ID4gQTogIEZpcnN0SWYjPSAwIElmQ291bnQ9IDIg
Q2xzPTAyKGNvbW0uKSBTdWI9MDYgUHJvdD0wMA0KPiA+IEk6KiBJZiM9IDAgQWx0PSAwICNFUHM9
IDEgQ2xzPTAyKGNvbW0uKSBTdWI9MDYgUHJvdD0wMCBEcml2ZXI9Y2RjX2V0aGVyDQo+ID4gRTog
IEFkPTg3KEkpIEF0cj0wMyhJbnQuKSBNeFBTPSAgMTYgSXZsPTMybXMNCj4gPiBJOiAgSWYjPSAx
IEFsdD0gMCAjRVBzPSAwIENscz0wYShkYXRhICkgU3ViPTAwIFByb3Q9MDAgRHJpdmVyPWNkY19l
dGhlcg0KPiA+IEk6KiBJZiM9IDEgQWx0PSAxICNFUHM9IDIgQ2xzPTBhKGRhdGEgKSBTdWI9MDAg
UHJvdD0wMCBEcml2ZXI9Y2RjX2V0aGVyDQo+ID4gRTogIEFkPTgxKEkpIEF0cj0wMihCdWxrKSBN
eFBTPSA1MTIgSXZsPTBtcw0KPiA+IEU6ICBBZD0wMShPKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEy
IEl2bD0wbXMNCj4gPiBJOiogSWYjPSAyIEFsdD0gMCAjRVBzPSAyIENscz1mZih2ZW5kLikgU3Vi
PWZmIFByb3Q9ZmYgRHJpdmVyPW9wdGlvbg0KPiA+IEU6ICBBZD04MihJKSBBdHI9MDIoQnVsaykg
TXhQUz0gNTEyIEl2bD0wbXMNCj4gPiBFOiAgQWQ9MDIoTykgQXRyPTAyKEJ1bGspIE14UFM9IDUx
MiBJdmw9MG1zDQo+ID4gSToqIElmIz0gMyBBbHQ9IDAgI0VQcz0gMiBDbHM9ZmYodmVuZC4pIFN1
Yj1mZiBQcm90PWZmIERyaXZlcj1vcHRpb24NCj4gPiBFOiAgQWQ9ODMoSSkgQXRyPTAyKEJ1bGsp
IE14UFM9IDUxMiBJdmw9MG1zDQo+ID4gRTogIEFkPTAzKE8pIEF0cj0wMihCdWxrKSBNeFBTPSA1
MTIgSXZsPTBtcw0KPiA+IEk6KiBJZiM9IDQgQWx0PSAwICNFUHM9IDIgQ2xzPWZmKHZlbmQuKSBT
dWI9ZmYgUHJvdD1mZiBEcml2ZXI9b3B0aW9uDQo+ID4gRTogIEFkPTg0KEkpIEF0cj0wMihCdWxr
KSBNeFBTPSA1MTIgSXZsPTBtcw0KPiA+IEU6ICBBZD0wNChPKSBBdHI9MDIoQnVsaykgTXhQUz0g
NTEyIEl2bD0wbXMNCj4gPiBJOiogSWYjPSA1IEFsdD0gMCAjRVBzPSAyIENscz1mZih2ZW5kLikg
U3ViPWZmIFByb3Q9ZmYgRHJpdmVyPW9wdGlvbg0KPiA+IEU6ICBBZD04NShJKSBBdHI9MDIoQnVs
aykgTXhQUz0gNTEyIEl2bD0wbXMNCj4gPiBFOiAgQWQ9MDUoTykgQXRyPTAyKEJ1bGspIE14UFM9
IDUxMiBJdmw9MG1zDQo+ID4gSToqIElmIz0gNiBBbHQ9IDAgI0VQcz0gMiBDbHM9ZmYodmVuZC4p
IFN1Yj00MiBQcm90PTAxIERyaXZlcj11c2Jmcw0KPiA+IEU6ICBBZD04NihJKSBBdHI9MDIoQnVs
aykgTXhQUz0gNTEyIEl2bD0wbXMNCj4gPiBFOiAgQWQ9MDYoTykgQXRyPTAyKEJ1bGspIE14UFM9
IDUxMiBJdmw9MG1zDQo+ID4gDQo+ID4gTDcxNi1FVS02MCAoUk5ESVMpOg0KPiA+IFQ6ICBCdXM9
MDMgTGV2PTAxIFBybnQ9MDEgUG9ydD0wMSBDbnQ9MDEgRGV2Iz0gMjEgU3BkPTQ4MCAgTXhDaD0g
MA0KPiA+IEQ6ICBWZXI9IDIuMDAgQ2xzPTAwKD5pZmMgKSBTdWI9MDAgUHJvdD0wMCBNeFBTPTY0
ICNDZmdzPSAgMQ0KPiA+IFA6ICBWZW5kb3I9MmNiNyBQcm9kSUQ9MDAwMSBSZXY9IDEuMDANCj4g
PiBTOiAgTWFudWZhY3R1cmVyPUZpYm9jb20sSW5jb3Jwb3JhdGVkDQo+ID4gUzogIFByb2R1Y3Q9
Rmlib2NvbSBNb2JpbGUgQm9hcmRiYW5kDQo+ID4gUzogIFNlcmlhbE51bWJlcj0xMjM0NTY3ODkw
QUJDREVGDQo+ID4gQzoqICNJZnM9IDcgQ2ZnIz0gMSBBdHI9ZTAgTXhQd3I9NTAwbUENCj4gPiBB
OiAgRmlyc3RJZiM9IDAgSWZDb3VudD0gMiBDbHM9MDIoY29tbS4pIFN1Yj0wNiBQcm90PTAwDQo+
ID4gSToqIElmIz0gMCBBbHQ9IDAgI0VQcz0gMSBDbHM9MDIoY29tbS4pIFN1Yj0wNiBQcm90PTAw
IERyaXZlcj1jZGNfZXRoZXINCj4gPiBFOiAgQWQ9ODcoSSkgQXRyPTAzKEludC4pIE14UFM9ICAx
NiBJdmw9MzJtcw0KPiA+IEk6ICBJZiM9IDEgQWx0PSAwICNFUHM9IDAgQ2xzPTBhKGRhdGEgKSBT
dWI9MDAgUHJvdD0wMCBEcml2ZXI9Y2RjX2V0aGVyDQo+ID4gSToqIElmIz0gMSBBbHQ9IDEgI0VQ
cz0gMiBDbHM9MGEoZGF0YSApIFN1Yj0wMCBQcm90PTAwIERyaXZlcj1jZGNfZXRoZXINCj4gPiBF
OiAgQWQ9ODEoSSkgQXRyPTAyKEJ1bGspIE14UFM9IDUxMiBJdmw9MG1zDQo+ID4gRTogIEFkPTAx
KE8pIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBtcw0KPiA+IEk6KiBJZiM9IDIgQWx0PSAw
ICNFUHM9IDIgQ2xzPWZmKHZlbmQuKSBTdWI9ZmYgUHJvdD1mZiBEcml2ZXI9b3B0aW9uDQo+ID4g
RTogIEFkPTgyKEkpIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBtcw0KPiA+IEU6ICBBZD0w
MihPKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEyIEl2bD0wbXMNCj4gPiBJOiogSWYjPSAzIEFsdD0g
MCAjRVBzPSAyIENscz1mZih2ZW5kLikgU3ViPWZmIFByb3Q9ZmYgRHJpdmVyPW9wdGlvbg0KPiA+
IEU6ICBBZD04MyhJKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEyIEl2bD0wbXMNCj4gPiBFOiAgQWQ9
MDMoTykgQXRyPTAyKEJ1bGspIE14UFM9IDUxMiBJdmw9MG1zDQo+ID4gSToqIElmIz0gNCBBbHQ9
IDAgI0VQcz0gMiBDbHM9ZmYodmVuZC4pIFN1Yj1mZiBQcm90PWZmIERyaXZlcj1vcHRpb24NCj4g
PiBFOiAgQWQ9ODQoSSkgQXRyPTAyKEJ1bGspIE14UFM9IDUxMiBJdmw9MG1zDQo+ID4gRTogIEFk
PTA0KE8pIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBtcw0KPiA+IEk6KiBJZiM9IDUgQWx0
PSAwICNFUHM9IDIgQ2xzPWZmKHZlbmQuKSBTdWI9ZmYgUHJvdD1mZiBEcml2ZXI9b3B0aW9uDQo+
ID4gRTogIEFkPTg1KEkpIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBtcw0KPiA+IEU6ICBB
ZD0wNShPKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEyIEl2bD0wbXMNCj4gPiBJOiogSWYjPSA2IEFs
dD0gMCAjRVBzPSAyIENscz1mZih2ZW5kLikgU3ViPTQyIFByb3Q9MDEgRHJpdmVyPXVzYmZzDQo+
ID4gRTogIEFkPTg2KEkpIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBtcw0KPiA+IEU6ICBB
ZD0wNihPKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEyIEl2bD0wbXMNCj4gPiANCj4gPiBMNzE2LUVV
LTEwIChFQ00pOg0KPiA+IFQ6ICBCdXM9MDMgTGV2PTAxIFBybnQ9MDEgUG9ydD0wMSBDbnQ9MDEg
RGV2Iz0gMjEgU3BkPTQ4MCAgTXhDaD0gMA0KPiA+IEQ6ICBWZXI9IDIuMDAgQ2xzPTAwKD5pZmMg
KSBTdWI9MDAgUHJvdD0wMCBNeFBTPTY0ICNDZmdzPSAgMQ0KPiA+IFA6ICBWZW5kb3I9MmNiNyBQ
cm9kSUQ9MDAwMSBSZXY9IDEuMDANCj4gPiBTOiAgTWFudWZhY3R1cmVyPUZpYm9jb20sSW5jb3Jw
b3JhdGVkDQo+ID4gUzogIFByb2R1Y3Q9Rmlib2NvbSBNb2JpbGUgQm9hcmRiYW5kDQo+ID4gUzog
IFNlcmlhbE51bWJlcj0xMjM0NTY3ODkwQUJDREVGDQo+ID4gQzoqICNJZnM9IDcgQ2ZnIz0gMSBB
dHI9ZTAgTXhQd3I9NTAwbUENCj4gPiBBOiAgRmlyc3RJZiM9IDAgSWZDb3VudD0gMiBDbHM9MDIo
Y29tbS4pIFN1Yj0wNiBQcm90PTAwDQo+ID4gSToqIElmIz0gMCBBbHQ9IDAgI0VQcz0gMSBDbHM9
MDIoY29tbS4pIFN1Yj0wNiBQcm90PTAwIERyaXZlcj1jZGNfZXRoZXINCj4gPiBFOiAgQWQ9ODco
SSkgQXRyPTAzKEludC4pIE14UFM9ICAxNiBJdmw9MzJtcw0KPiA+IEk6ICBJZiM9IDEgQWx0PSAw
ICNFUHM9IDAgQ2xzPTBhKGRhdGEgKSBTdWI9MDAgUHJvdD0wMCBEcml2ZXI9Y2RjX2V0aGVyDQo+
ID4gSToqIElmIz0gMSBBbHQ9IDEgI0VQcz0gMiBDbHM9MGEoZGF0YSApIFN1Yj0wMCBQcm90PTAw
IERyaXZlcj1jZGNfZXRoZXINCj4gPiBFOiAgQWQ9ODEoSSkgQXRyPTAyKEJ1bGspIE14UFM9IDUx
MiBJdmw9MG1zDQo+ID4gRTogIEFkPTAxKE8pIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZsPTBt
cw0KPiA+IEk6KiBJZiM9IDIgQWx0PSAwICNFUHM9IDIgQ2xzPWZmKHZlbmQuKSBTdWI9ZmYgUHJv
dD1mZiBEcml2ZXI9b3B0aW9uDQo+ID4gRTogIEFkPTgyKEkpIEF0cj0wMihCdWxrKSBNeFBTPSA1
MTIgSXZsPTBtcw0KPiA+IEU6ICBBZD0wMihPKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEyIEl2bD0w
bXMNCj4gPiBJOiogSWYjPSAzIEFsdD0gMCAjRVBzPSAyIENscz1mZih2ZW5kLikgU3ViPWZmIFBy
b3Q9ZmYgRHJpdmVyPW9wdGlvbg0KPiA+IEU6ICBBZD04MyhJKSBBdHI9MDIoQnVsaykgTXhQUz0g
NTEyIEl2bD0wbXMNCj4gPiBFOiAgQWQ9MDMoTykgQXRyPTAyKEJ1bGspIE14UFM9IDUxMiBJdmw9
MG1zDQo+ID4gSToqIElmIz0gNCBBbHQ9IDAgI0VQcz0gMiBDbHM9ZmYodmVuZC4pIFN1Yj1mZiBQ
cm90PWZmIERyaXZlcj1vcHRpb24NCj4gPiBFOiAgQWQ9ODQoSSkgQXRyPTAyKEJ1bGspIE14UFM9
IDUxMiBJdmw9MG1zDQo+ID4gRTogIEFkPTA0KE8pIEF0cj0wMihCdWxrKSBNeFBTPSA1MTIgSXZs
PTBtcw0KPiA+IEk6KiBJZiM9IDUgQWx0PSAwICNFUHM9IDIgQ2xzPWZmKHZlbmQuKSBTdWI9ZmYg
UHJvdD1mZiBEcml2ZXI9b3B0aW9uDQo+ID4gRTogIEFkPTg1KEkpIEF0cj0wMihCdWxrKSBNeFBT
PSA1MTIgSXZsPTBtcw0KPiA+IEU6ICBBZD0wNShPKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEyIEl2
bD0wbXMNCj4gPiBJOiogSWYjPSA2IEFsdD0gMCAjRVBzPSAyIENscz1mZih2ZW5kLikgU3ViPTQy
IFByb3Q9MDEgRHJpdmVyPXVzYmZzDQo+ID4gRTogIEFkPTg2KEkpIEF0cj0wMihCdWxrKSBNeFBT
PSA1MTIgSXZsPTBtcw0KPiA+IEU6ICBBZD0wNihPKSBBdHI9MDIoQnVsaykgTXhQUz0gNTEyIEl2
bD0wbXMNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBWaWN0b3IgRnJhZ29zbyA8dmljdG9yZmZz
QGhvdG1haWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy91c2Ivc2VyaWFsL29wdGlvbi5j
IHwgNSArKysrKw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9zZXJpYWwvb3B0aW9uLmMgYi9kcml2ZXJzL3Vz
Yi9zZXJpYWwvb3B0aW9uLmMNCj4gPiBpbmRleCA0NWRjZmFhZGFmOTguLjRiYTNkYzM1MmQ2NSAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9zZXJpYWwvb3B0aW9uLmMNCj4gPiArKysgYi9k
cml2ZXJzL3VzYi9zZXJpYWwvb3B0aW9uLmMNCj4gPiBAQCAtMjI2Miw2ICsyMjYyLDExIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCBvcHRpb25faWRzW10gPQ0KPiA+IHsNCj4g
PiAgIAl7IFVTQl9ERVZJQ0VfSU5URVJGQUNFX0NMQVNTKDB4MmNiNywgMHgwMWEyLCAweGZmKQ0K
PiA+IH0sCQkJLyogRmlib2NvbSBGTTEwMS1HTCAobGFwdG9wIE1CSU0pICovDQo+ID4gICAJeyBV
U0JfREVWSUNFX0lOVEVSRkFDRV9DTEFTUygweDJjYjcsIDB4MDFhNCwNCj4gPiAweGZmKSwJCQkv
KiBGaWJvY29tIEZNMTAxLUdMIChsYXB0b3AgTUJJTSkgKi8NCj4gPiAgIAkgIC5kcml2ZXJfaW5m
byA9IFJTVkQoNCkgfSwNCj4gPiArCXsgVVNCX0RFVklDRV9BTkRfSU5URVJGQUNFX0lORk8oMHgy
Y2I3LCAweDAwMDEsIDB4ZmYsIDB4ZmYsDQo+ID4gMHhmZikgfSwJLyogRmlib2NvbSBMNzF4ICov
DQo+ID4gKwl7IFVTQl9ERVZJQ0VfQU5EX0lOVEVSRkFDRV9JTkZPKDB4MmNiNywgMHgwMDAxLCAw
eDBhLCAweDAwLA0KPiA+IDB4ZmYpIH0sCS8qIEZpYm9jb20gTDcxeCAqLw0KPiA+ICsJeyBVU0Jf
REVWSUNFX0FORF9JTlRFUkZBQ0VfSU5GTygweDJjYjcsIDB4MDEwMCwgMHhmZiwgMHhmZiwNCj4g
PiAweGZmKSB9LAkvKiBGaWJvY29tIEw3MXggKi8NCj4gPiArCXsgVVNCX0RFVklDRV9BTkRfSU5U
RVJGQUNFX0lORk8oMHgxOWQyLCAweDAyNTYsIDB4ZmYsIDB4ZmYsDQo+ID4gMHhmZikgfSwJLyog
Rmlib2NvbSBMNzF4ICovDQo+ID4gKwl7IFVTQl9ERVZJQ0VfQU5EX0lOVEVSRkFDRV9JTkZPKDB4
MTlkMiwgMHgwNTc5LCAweGZmLCAweGZmLA0KPiA+IDB4ZmYpIH0sCS8qIEZpYm9jb20gTDcxeCAq
Lw0KPiA+ICAgCXsgVVNCX0RFVklDRV9JTlRFUkZBQ0VfQ0xBU1MoMHgyZGYzLCAweDlkMDMsIDB4
ZmYpDQo+ID4gfSwJCQkvKiBMb25nU3VuZyBNNTcxMCAqLw0KPiA+ICAgCXsgVVNCX0RFVklDRV9J
TlRFUkZBQ0VfQ0xBU1MoMHgzMDVhLCAweDE0MDQsIDB4ZmYpDQo+ID4gfSwJCQkvKiBHb3N1bkNu
IEdNNTAwIFJORElTICovDQo+ID4gICAJeyBVU0JfREVWSUNFX0lOVEVSRkFDRV9DTEFTUygweDMw
NWEsIDB4MTQwNSwgMHhmZikNCj4gPiB9LAkJCS8qIEdvc3VuQ24gR001MDAgTUJJTSAqLw0KPiAN
Cj4gDQo+IEhpIFZpY3RvciwgdGhhbmtzIGZvciB0aGUgcGF0Y2gsIHRoZXJlIGlzIHVuZm9ydHVu
YXRlbHkgdGhlIGZvbGxvd2luZyANCj4gZXJyb3JzIGluIGl0Og0KPiBUaGUgZGV2aWNlIGxpc3Qg
aXMgc29ydGVkIGluIGFzY2VuZGluZyBvcmRlciBiYXNlZCBvbiB2aWQ6cGlkLCB5b3UgaGF2ZSAN
Cj4gaW5zZXJ0ZWQgYWxsIG9mIHlvdXIgYWRkZWQgSWQncyBpbiB0aGUgd3JvbmcgcGxhY2UuDQo+
IA0KPiAxOWQyOjA1NzkgaXMgYSBaVEUgZGV2aWNlIElkIGFuZCBzaG91bGQgYmUgcGxhY2VkIGFt
b25nIHRoZSBvdGhlciAxOWQyIA0KPiBkZXZpY2VzLg0KPiANCj4gWW91IGhhdmUgbm90IGluY2x1
ZGVkIHVzYi1kZXZpY2VzIG91dHB1dCBmb3IgMTlkMjowMjU2IGFuZCAyY2I3OjAxMDAsIA0KPiBh
bmQgSSBoYXZlIHN0cm9uZyByZWFzb25zIHRvIGJlbGlldmUgdGhhdCB0aGV5IHNob3VsZCBub3Qg
YmUgaW5jbHVkZWQgaW4gDQo+IHRoZSBvcHRpb24gZHJpdmVyLg0KPiBJZiB5b3UgYXJlIG9mIGFu
b3RoZXIgb3BpbmlvbiB0aGVuIHBsZWFzZSBzaG93IHRoZSB1c2ItZGV2aWNlcyBvdXRwdXQgDQo+
IGZvciB0aGVtLCBvdGhlcndpc2UgcmVtb3ZlIHRoZW0gZnJvbSB0aGUgcGF0Y2guDQo+IA0KPiBZ
b3UgaGF2ZSBhZGRlZCBzdXBwb3J0IGZvciBhbiBpbnRlcmZhY2Ugd2l0aCB0aGUgYXR0cmlidXRl
cyAwYS8wMC9mZiAsIA0KPiB0aGVyZSBpcyBubyBzdWNoIGludGVyZmFjZSBpbiB5b3VyIHByb3Zp
ZGVkIHVzYi1kZXZpY2VzIGxpc3RpbmcsIA0KPiBpbnRlcmZhY2UgQ2xhc3MgMGEgZG9lcyBub3Qg
ZXZlbiBiZWxvbmcgdG8gdGhlIG9wdGlvbiBkcml2ZXIuDQo+IA0KPiBUaGFua3MNCj4gTGFycw0K
DQpIaSBMYXJzLCBzb3JyeSBhYm91dCB0aGUgd3Jvbmcgb3JkZXIsIEkgd2lsbCBjb3JyZWN0IGl0
Lg0KDQpCdXQgYWJvdXQgdGhlIFpURSBkZXZpY2UgSUQsIEkgYmVsaXZlIHRoYXQgd2Ugc2hvdWxk
IGluc2VydCBhbW9uZw0KRmlib2NvbSBkcml2ZXJzIGJlY2F1c2Ugd2UgYXJlIHRhbGtpbmcgYWJv
dXQgYSBGaWJvY29tIG1vZHVsZSB0aGF0IGlzDQp1c2luZyBhbiBaVEUgQ2hpcHNldC4NClNvLCB0
aGlzIGlzIGV4YWN0bHkgdGhlIHNhbWUgc2l0dWF0aW9uIGZyb20gRmlib2NvbSBMNjEwIElEcyAo
MHgxNzgyLA0KMHg0ZDEwIC8gMHgxNzgyLCAweDRkMTEpIHRoYXQgaXMgdXNpbmcgdGhlIFVuaXNv
YyBDaGlwc2V0IGJ1dCB3ZXJlDQppbnNlcnRlZCBhbW9uZyBGaWJvY29tIGRyaXZlcnMuDQoNCkFu
ZCBhYm91dCB0aGUgdXNiLWRldmljZXMgb3V0cHV0LCBsZXQgbWUgZXhwbGFpbiBiZXR0ZXI6DQpJ
IGFtIGEgRmllbGQgQXBwbGljYXRpb24gRW5naW5uZXIgYXQgRmlib2NvbSBCcmF6aWwgYW5kIEkg
YW0gdXNpbmcgdGhlDQpJRHMgZnJvbSBvdXIgaW50ZXJuYWwgYW5kIG9mZmljaWFsIGRvY3VtZW50
YXRpb24uDQpPbiB0aGlzIGRvY3VtZW50cyBpdHMgc3VnZ2VzdGVkIHRvIGFkZCBhbGwgdGhpcyBJ
RHMgYmVjYXVzZSBpdCB3aWxsDQpndWFyYW50ZWUgdGhhdCBjYW4gYmUgdXNlZCBvbiBhbGwgdGhl
IHZhcmlhbnRzIGRldmljZXMgZnJvbSBMNzF4IHNlcmllcw0KKHRoYXQgY2FuIGNoYW5nZSBhY2Nv
cmRpbmcgdG8gZGlmZmVyZW50IHBhcnQgbnVtYmVyLCByZWdpb24gc3VwcG9ydCBvcg0KbmV0d29y
ayBwcm90b2NvbCkuDQpVbmZvcnR1bmF0ZWx5LCBJIGRvbid0IGhhdmUgYWxsIHRoZSBtb2R1bGVz
IHZhcmlhdGlvbnMgYXZhaWxhYmxlIHdpdGgNCm1lIHJpZ2h0IG5vdyB0byB0ZXN0IGFuZCBzaGFy
ZSBhbGwgdGhlIG91dHB1dHMuDQoNCkNhbiB3ZSBjb250aW51ZSB3aXRoIGFsbCB0aGUgSURzIHRo
YXQgSSBoYXZlIGluc2VydGVkPw0KT3IgZG8geW91IHByZWZlciB0byBrZWVwIGp1c3QgdGhlIGRl
dmljZXMgdGhhdCBJIHRlc3RlZCBieSBteXNlbGYgdW50aWwNCm5vdz8NCg0KVmljdG9yIEZyYWdv
c28NCg==

