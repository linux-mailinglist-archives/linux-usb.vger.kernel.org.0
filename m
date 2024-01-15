Return-Path: <linux-usb+bounces-5068-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492A82D86E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 12:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF42F282690
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jan 2024 11:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426AB2C68E;
	Mon, 15 Jan 2024 11:37:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2074.outbound.protection.outlook.com [40.107.239.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194C92C68A
	for <linux-usb@vger.kernel.org>; Mon, 15 Jan 2024 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=USbIZinfodata.onmicrosoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=USbIZinfodata.onmicrosoft.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vms5BhJv37laXPpAjTvDxpD87LTnFyQN1pwNxgAaJoBdKS3RagE0RgLTlCGrTPawo6NWQ3FRT+uQ+ed1g6ogCaknzD6wEQrOJxvWOfXsl8Fkfi4WIit/H8Y3ltNFW+5AF01/nJXrspai52i+tO9bGtpryierJ8g59o0KlAPrERC6tljFYvaXBiUv3/ssUq5NiasenwUSxLDo4jQGSkE/PuPGxwZMEXfCpAEGXuhpbQy0+sRkCVM6Mo3cV1RBiW3UCF+JOqUVEP2JRVMQZMnC+9bEBZwq2vDOR5RKeiWwwws757DDRwbsMil3UlM7Kb/WOsQDQrkcuBfSPp8Zntk9Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYbiwBwZJTZJHEd0EjKCSCeNzfYoJoZk7uvn4Mpv7BI=;
 b=A93PcyzYkZb+8TjAKxS/g75KzJl7pOvsvZO2FNRrrvxCjcH9Nk8UjukjsvZiIVTksTGQJpC6+FwOVhJGragDnoPX/+h3U9LmFUN5sob3LSyuXVQBpUe3CHMEDflit5TZ4YNN10QU9Xh06FJV1Lb+/wWe/dBngFl7woYkXVAtU/5TccPWeEfwD5LVoE7IhYDE2JoLiwdETF2nA4MBKhofsadmkHhyfBbz9iFguFmHW54RTFzxMFJPXzwSMFPLDB7U65AkNO05Wc4HFKeQx/clMwH+13rhOL59Hy3eEHnkfLrVxvnKHwj6y5KbAFKVETDVTaQ89Qb84N/pITG8l/SprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=usbizinfodata.onmicrosoft.com; dmarc=pass action=none
 header.from=usbizinfodata.onmicrosoft.com; dkim=pass
 header.d=usbizinfodata.onmicrosoft.com; arc=none
Received: from PN3P287MB2559.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:208::9)
 by PN2P287MB0794.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:133::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Mon, 15 Jan
 2024 11:36:59 +0000
Received: from PN3P287MB2559.INDP287.PROD.OUTLOOK.COM
 ([fe80::d2ef:b83c:14b9:f325]) by PN3P287MB2559.INDP287.PROD.OUTLOOK.COM
 ([fe80::d2ef:b83c:14b9:f325%6]) with mapi id 15.20.7181.022; Mon, 15 Jan 2024
 11:36:59 +0000
From: Emma Conner <Emma.Conner@USbIZinfodata.onmicrosoft.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: vger Hardware decisions makers
Thread-Topic: vger Hardware decisions makers
Thread-Index: AQHaR6cm+V3qZXYH5U6iH91ndKhZsw==
Date: Mon, 15 Jan 2024 11:36:59 +0000
Message-ID:
 <e00703b9-52fa-4ecf-8659-9214a7f2c6aa@USbIZinfodata.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none
 header.from=USbIZinfodata.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3P287MB2559:EE_|PN2P287MB0794:EE_
x-ms-office365-filtering-correlation-id: 83e6f935-32b8-44ac-b527-08dc15be4969
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 lCitr5i5tHWb5/ugNAud3buKAZOk3HQOnB93hiQp8bgb9/r9ZifZGJdYHb0UhGYTMmj2laobZOZeng8zlL7fc/5ipLo2Wb9LYbopshqo6wJsQefzXX3155+5aBHtCFuZaIFQYTKe/K+MK3x4TU408+4i94eahloCtqRnFj5shE52OghlmcknoT1ouXxAn7sbBuE7JqN3Opunir2ik9tMzi9vXsrN2o8fKGXeKpW+9Di3T8pYGDb9ayQji2Z2x+T+248kDLz83FmkjKMgVw+UbPE3jTE0RhgnkjOsZT7dqsL1Ix7wTr0NwfxMF8KE6QI/j8pyKsjupu7eIy2F9w8nyOOiT/+YIcbQVJuBmBtbAtsblsiAS/0EUXpbkxRdCAfvGqTcQ7SGUpq2jBOE2n9rfDbZl/twZLBMmTdOyflFbOkY/HtQoKsOrVacHA2Xpe8bryCgs12fjjJ+s76GAbtWtuHvKM6K+sX1RC04ZzxNn0x8CByGT+LHZN93XcNolyfCGmkHDqpsd8DjxdSI3QdNSXsJpwMqc4vVIMlhZ4Ic8yxEH/tRm6LtFHoDe96csksBsCOa1FS3Jf6cOWEMkG+LYKG5fRS7uPZgn3DL66ruwpNMzOdeuqg6l6ppxNTtagnbS51HtIpuL1SSpCP6j9XHhw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB2559.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(34096005)(39840400004)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66899024)(31686004)(71200400001)(478600001)(53546011)(6506007)(6512007)(26005)(2616005)(86362001)(38070700009)(31696002)(38100700002)(122000001)(41300700001)(2906002)(83380400001)(3480700007)(91956017)(5660300002)(76116006)(64756008)(8676002)(66446008)(8936002)(6486002)(66476007)(66946007)(6916009)(66556008)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cXJhcklpTStMVytLWFYzd2M5Ylc2eWRvOFU4dnF6eUJLSWc0MDR6dkZDOVVo?=
 =?utf-8?B?ZUZYZTEvQU1saTZsVm5SbGc3MGNoZ3BacjFhQW5XT1Noc0xoaXpMOFllSTVL?=
 =?utf-8?B?TzNEU1d5dEhOS3YzQWpqV1NFaWMwbFE5QlFXQVRiRkowREk1Y1hKUit1YjFD?=
 =?utf-8?B?WXJqNmttWG5PeUkyWjg1MlpzbjhoUzZNbHlzS0FHaDdESXJUOGdVMnRyT3Z0?=
 =?utf-8?B?ZVFIY3NOa1F3VHJBOXNwVDNLN0lYRFIwYlVlRDNYMzM4UkV2aVBlMmNOY2ow?=
 =?utf-8?B?NmZqN05PRW1xemRzdUYyR2E1MmVReGsrZ3NKajhhY1pHNXdSZ08wTklDUzVs?=
 =?utf-8?B?SlRNODhMMTBaWUZyMDErdjg1N3JWOUp4dVNIRlViVm1OZ1c3cit0SGpZS0E5?=
 =?utf-8?B?NTZFcUdDcjE2T25WWFJnc0o5WHFUcVQ3MzVKRDdtblJDN012ZWc0bjlURmRh?=
 =?utf-8?B?MzhObVRxS0FDRWV3V0Y3OE53QUNDV0lhUkhJZTJGYWFOZlZoK3NtU0h1djZv?=
 =?utf-8?B?cnNnVTFvWjZGL3FVdXAzMGp6UHhaMWI5eGlLaEpOSEo2eTVNTHZPc0lZTzdi?=
 =?utf-8?B?RXB4QTVJdWhLOHd4dWEva3NKNzQzSUdPc29ocTEyS3YwdGlPa0R1RFhqV0lw?=
 =?utf-8?B?WjV0bVBzSysxenlsYnk0c25yK0ZmT2ZYMTJMQWpLd1d2d3JvSUFXSmY3dTlK?=
 =?utf-8?B?dmtQZ0RyaG5MQjJVa2FUUTVIS0U0a1ppdy9JL253VGl1M0dqUlNaZFJjaGtp?=
 =?utf-8?B?djZTNVJzN0dId2RwZHRUMlVwQUhyTVFaTENYcm5XakxIbUNCd2pOUytxZVJO?=
 =?utf-8?B?SWxLN1hRdSs3TlM4em5Ha01qZnI0QWFHcFJtQysyR3ZmWkJ0MVM0Sys2em90?=
 =?utf-8?B?UEZYdWI2OXpjTEE4cEFuQjFpMWZJL3BqMWJ5WnFEQ2RhYnRldi9Rc09nazh4?=
 =?utf-8?B?dlZ1UEVpa01oUWJLbWMzSDJVT01mMllrRWcwSUUwZExCaWd2d3g5b2VPbVBt?=
 =?utf-8?B?OTVHWVNPMmw2SWE5anZJVmFXb2UvWDBWK0FNT1V2N2hCWDZsYVBOa0VLSDh1?=
 =?utf-8?B?U0VBazhaNGdzbEpZVkhWYmVMREpGNWVhYUZ5bmZkcU0wMFZqWG12MzVFMm1Z?=
 =?utf-8?B?VXRGT1VVVkJxeVVXMzA4OU43WGZBRFh4ci9tdGY4MkpOT0JINkMxNCtsUHVl?=
 =?utf-8?B?emhGYzRuL2RuZXZ1V1ZmUis0eWZ0ZHdLK2RKY0xZUWM5OGJaMC9IVmlYRjNk?=
 =?utf-8?B?b0RaeFh3ZlBieVlSQkdNZzFna1VpVVVycC9EdmlqdUs5TnJ6N1NiSHV5UDdv?=
 =?utf-8?B?V0RRMnBKOVNhdWowOTIvbTB2Q3lPMlNiZmtuSHQzdFhKdlNnQVhydm03VzY5?=
 =?utf-8?B?VTNzMmY0T0puN1gra0hTOTJMK2x5THpvMlhJL3hMR2F4UHFmS1J0YVoxOXZp?=
 =?utf-8?B?bWxtSTBCSWcyb0gwRzJhVTF5QVhadUdBSElTdHRqYlVadlphK3Z0OGJreUxx?=
 =?utf-8?B?N3c0Z21TSVRMQUk5Vi8yNjBQMTIxV2ZQV3NMYTlZekt0MEk2TWZJOVYrQzBj?=
 =?utf-8?B?S0VURCswaVhycUhtTzJHRU9lbUJiYjRVWTZaRUU2bXY0TnYrM1J1Q1Rxc3Iy?=
 =?utf-8?B?RjlRclhQR21IR011WkNtVGoycENlci8wT1RlU3lHSVo2NGRkNDdwMDViRGRj?=
 =?utf-8?B?NXRTU0ptK2VDSUlVdjBFakhGNURQc1RFTjN5WWVFYStodVQ1U0t3ZXJyWWhO?=
 =?utf-8?B?VndtN2hDZjZSNWk0czFldTJ1TkV4RTJQeExESjNjZHFSNjF3cDIvYXorMk96?=
 =?utf-8?B?bzNhTnpCcE5VNC92ZzFNUDBIRkh3V0pjQ1VsUFVMMUg5MzUranA4K1c1SmZP?=
 =?utf-8?B?OGFVZ0Q3VXF5RllReUFNaDhnVXdUWFdlOWo2RFZiK2xoRS9oRENSd3JrV3Aw?=
 =?utf-8?B?cWhRY0NWc3huT0VlSFJlM0gwWW92Ly82MVVYVU5WVXVhYWJvN20zVGFFRzBJ?=
 =?utf-8?B?WVFJVitiejFsdjFyNFNSLy9GSEJUaElydjVXejMySW9WNmltbmtMRzlUODgw?=
 =?utf-8?B?bEYwMDJXME5kL3Fld28wSnFVY1Y1RXovajRTd3ZISDluMWFXWHBYTDIrem5I?=
 =?utf-8?B?NDVkMHc4U2hFc1cvZ3N3YnhlTUxMNEM3Y1YvbGtXTW8rMkpQMDd2alJrMXdr?=
 =?utf-8?Q?6A107fL9y7bET99GQaIkQJw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <549BFFD18FCF6A4B9E47DFBD73D42028@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: USbIZinfodata.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB2559.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e6f935-32b8-44ac-b527-08dc15be4969
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 11:36:59.8951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c8985d2c-274e-4d2e-b47a-e4113825a86d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: saQwxpdxlF9zkWShb31n4W8reMa2bRgwrMlXyI3LIim1N7ZKq4m885aN+jUCXjNU+zSWDr6EDJVaI3J1msy+s/HOQlOKJs6s0YDeW6IJXoevdGpkUDZrS7zwYYzxTQVD2j3Vp2VQ8ggc+Tzkc3Bm9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0794

SGksDQoNCkkgZW1haWxlZCB5b3UgYWJvdXQgb3VyIElUIGFuZCBjb21wdXRlciBkZWNpc2lvbnMg
bWFrZXJzIGNvbnRhY3RzIA0KZGF0YWJhc2UuIFdlIGNhbiBncmFudCB5b3UgYWNjZXNzIHRvIG91
ciB1cGRhdGVkIElUIGFuZCBjb21wdXRlciANCmRlY2lzaW9ucyBtYWtlcnMgd2l0aCBJVCwgSVMs
IEhlbHAgRGVzaywgQWRtaW4gbWFuYWdlcnMsIE93bmVycyBvZiBzbWFsbCANCmJ1c2luZXNzIGV0
Yy4NCg0KSSB3YW50ZWQgdG8gY2lyY2xlIGJhY2sgYW5kIHNlZSBpZiB5b3UgYXJlIGludGVyZXN0
ZWQgdG8gc2VuZCBtZSB5b3VyIA0KdGFyZ2V0IGpvYiB0aXRsZXMgYW5kIGluZHVzdHJpZXMgc28g
d2UgY2FuIHNlbmQgeW91IG1vcmUgaW5mb3JtYXRpb24uDQoNClJlZ2FyZHMsDQpFbW1hDQoNCkVt
bWEgQ29ubmVyIHwgTWFya2V0aW5nIENvbnN1bHRhbnQNCg0KT24gMDMtMTAtMjAyMyAxMTo0Mywg
RW1tYSBDb25uZXIgd3JvdGU6DQoNCkhpLA0KDQpXb3VsZCB5b3UgYmUgaW50ZXJlc3RlZCBpbiBy
ZWFjaGluZyBvdXQgdG8gSVQgYW5kIGNvbXB1dGVyIGRlY2lzaW9ucyANCm1ha2VycyB0byBwcm9t
b3RlL3NlbGwgeW91ciBwcm9kdWN0cyBhbmQgc2VydmljZXM/DQoNCiDCoMKgIEMsIFZQLCBEaXJl
Y3RvciBvciBNYW5hZ2VyIGxldmVsIFRlY2hub2xvZ3kgb2ZmaWNlcg0KIMKgwqAgQywgVlAsIERp
cmVjdG9yIG9yIE1hbmFnZXIgbGV2ZWwgSVQgT3BlcmF0aW9ucw0KIMKgwqAgQywgVlAsIERpcmVj
dG9yIG9yIE1hbmFnZXIgbGV2ZWwgSW5mb3JtYXRpb24gc2VjdXJpdHkgb2ZmaWNlcg0KIMKgwqAg
Q29tcHV0ZXIgTWFuYWdlcnMNCiDCoMKgIEhlbHAgZGVzayBNYW5hZ2VyDQogwqDCoCBJbmZvcm1h
dGlvbiBTeXN0ZW1zIE1hbmFnZXINCiDCoMKgIEFkbWluIE1hbmFnZXINCiDCoMKgIElUIFNwZWNp
YWxpc3QNCiDCoMKgIE93bmVycywgQ0VPLCBQcmVzaWRlbnRzIGV0Yw0KDQpXZSB3b3VsZCBiZSBo
YXBweSB0byBjdXN0b21pemUgeW91ciBsaXN0IGFjY29yZGluZ2x5IGZvciBhbnkgb3RoZXIgDQpy
ZXF1aXJlbWVudHMgdGhhdCB5b3UgaGF2ZS4gUGxlYXNlIGxldCBtZSBrbm93IGluZHVzdHJpZXMg
YW5kIGpvYiB0aXRsZXMgDQp5b3UgdGFyZ2V0IHNvIEkgY2FuIGdldCBiYWNrIHRvIHlvdSB3aXRo
IGFkZGl0aW9uYWwgaW5mb3JtYXRpb24uDQoNCkFwcHJlY2lhdGUgeW91ciByZXNwb25zZS4NCg0K
DQpSZWdhcmRzLA0KRW1tYSBDb25uZXIgfCBNYXJrZXRpbmcgQ29uc3VsdGFudA0KDQpSZXBseSBv
bmx5IG9wdC1vdXQgaW4gdGhlIHN1YmplY3QgbGluZSB0byByZW1vdmUgZnJvbSB0aGUgbWFpbGlu
ZyBsaXN0Lg0K

