Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA71353201
	for <lists+linux-usb@lfdr.de>; Sat,  3 Apr 2021 04:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234821AbhDCCCn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Apr 2021 22:02:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54992 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231216AbhDCCCm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Apr 2021 22:02:42 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C10FEC010E;
        Sat,  3 Apr 2021 02:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617415360; bh=ITd96TuCLHTO4HrU2i2YNyYQN8sW6UnxQsZk4fbY8YA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=NNOOsPe2dguVeNBAfDDwTbErVFWzUPBEMW16UqfqFU58asXJglQrPbQoJzlBjU9og
         9VYO1XZuZpGRCO0BhRcV5oQhCoePa+Wz45sHJBpPpbpnaPzfVu+h+KFtiUdZrXQPAy
         VzYEOjxlVQk+HHVxefI8/Cjqa9zhPvixXWU+UgbuqFZzmHLCFeEIZisJGZZmFtNYUR
         emx4/0EJc/RhhRWt8zi33U0EgvAm6jrfsGkFpvK9Zc5K6Pn1zACApuH4iTPxzXin0Q
         2OsdZ3hTm1kBYJ3FNxqDjL+z8nOTOeliNRLU5Fo+GxP5pX9gc/QkMgqElFzGBtCGq0
         bsEgZ+dU4/slw==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0EE1CA0096;
        Sat,  3 Apr 2021 02:02:39 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 01709800C2;
        Sat,  3 Apr 2021 02:02:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="VUCgZ5h1";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpD/Yjudqyx7NgxaFyoX1V6vTRhoYEHEhdZOsDtLrzjxLaKlGGWAgLyXaF+4v3LH4ORjkZHs5yEZ7V8bbFixyEQmqCeJdbDSVcktyN0s1yY2FosZ4GCcubTCwq2mvzkorBQG4Bs3D3Dv0IXr6VcKNJc4rW16pXSI2afbHPmU7kFx25gp3W8/2z8iQhHHRFWugfX3xZMuZFL7CvYul2GMl8H4p1PDsKMgzJTeNkw7LaLj4wxhdtm43fBUnT7sSmMNMgckx2BMH6Le9eMkggG3/fqmkS94DkryIO1DipaVxc03x9ZlHn5edhadFBbuHPxcyNcGWZT3rqGXKBLytAVlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITd96TuCLHTO4HrU2i2YNyYQN8sW6UnxQsZk4fbY8YA=;
 b=Xmw7I3FMEa8/tW78M/9NDkeObq1uopeXr/frMA5LSRKNeIfcLneW8KliBm5cAwAoAZhHxA5AgUwzcrIq3puEFCYdMR9g+13+uaQ7i3hf66h52ZqG7q4eDOPWJXFGXPwf4iJhgqg+C6KT4sfy90cmPgaI0yrVYQbZaZyIC3LzwNnr5ij5DVcyZnw64Yqzr3BBVpBgMGH/5FcPantEUyTIYBClcTknv9VlnFfU5Not1bKsMzEsoo2iZXCeO9BK5rAmhBn18kMoN6GHirZpTr6o+FRbAQKO1IEwGzfn9ZsXBqTzWsV8nJF6k60BQQ+hmSSSLHgezYEViAZr6UlOy4ONQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITd96TuCLHTO4HrU2i2YNyYQN8sW6UnxQsZk4fbY8YA=;
 b=VUCgZ5h18otlTtqRLoaEGATN9E2u9zvC6DvrFEcEvsxh2iYJ4sUL+kOcSIXtZrzQyHk3vIElvnjKk5njC1vJE55ny16dX1GNU/OfrQkLRvwv/S+IbwN7VlZlWT9PSkWb0UHUYvQk58vBYgm3RhoBgnl7ZWYty/wyGDCXXuU/0tc=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Sat, 3 Apr
 2021 02:02:35 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::7c97:6a33:14c4:dd8c%6]) with mapi id 15.20.3999.029; Sat, 3 Apr 2021
 02:02:35 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Ferry Toth <fntoth@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>
Subject: Re: USB network gadget / DWC3 issue
Thread-Topic: USB network gadget / DWC3 issue
Thread-Index: AQHXJWGMSb8EBf7kO0mkR3W2S+2f0qqctZMAgABFgICAABlrAIAEiRiAgAAR4oCAAChFgIAAOFIA
Date:   Sat, 3 Apr 2021 02:02:35 +0000
Message-ID: <6b3a28eb-7809-d319-d58d-520c1c7fa5d2@synopsys.com>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
 <87pmzgk44r.fsf@kernel.org> <b4763ebe-c0ff-2d24-5385-1a1587603280@gmail.com>
 <1f8ed83c-b2e5-327c-30da-56865e2b956b@gmail.com>
 <fd8d9a8a-8f57-6559-2053-4607b9da13ab@gmail.com>
 <797f97b8-6558-35c4-2dc5-9deacdf0ba4d@synopsys.com>
 <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
In-Reply-To: <ff57b956-a777-3dd6-80ca-4e9afd33ab96@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [98.248.94.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 650a1e13-2bbf-4157-46d6-08d8f6448ce9
x-ms-traffictypediagnostic: BY5PR12MB4226:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB42260CCC62835077DE08FEAAAA799@BY5PR12MB4226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c6HgEM64q6Y1cGB5RodmViRVN5pK1picXAvNku1XlEQluwGJdCQHM0/7Ro8VBoaxhH/F1A/kSyryzfGNa8nst0ntaUJr3J+CPnUfAbYj65n6c4pdjUzb44W4w7RI+ibuWKr1LWqqOoeKiocad6Hnamyy1HXcLtxwwOErPR3EHT/6hdgWN5CtYzAxOlI8Vwf41r3kGiDk4QXMpEwENK54fu1JLAgbChKMeGYAQ6syMRCqb/62lss2EJp+yi3fSYQa2E8AUoo/pEOWLT57LFhtDZQe252BVsvEgFtMene6uUr7Pz2qZtwju0cETAmPvvYGxvrpg1FZMXU6sX2I+3RlYcOd9MLiiCVFx3bQiQFEIdVACWK1/rapU7RFc/AoOa1TbCX+oiLpZ1eUEVmzwL6KrtIuNrkF3WLD+CBFR/YR4qbi9seyflBqikHRWhpZBe7pTwi+e4b5LXcvDVHjMFqokwz8iRmVii4mB4sqnxk/AlMLSwlB9eyhD6YzFYXsElXIQ+lquPq8E5nJwjLnd7FR/IKsAPGq4P8eRKZY5XorWmFc4BYy61ptPw/cdPiDVAzq21+EN2DO4DLmealH0IfkQgE1Bwrgauevfgomjitj84PyMZqQQVBbQ7XhyWRdL9uMQPIGvD8ym0S9hhktVp3iL+H+pNXGvyZtw11U9Wa03Xafg0ecRIcdR5WthTpVHvR/E09rICqTdOfiHlziYWNggrLawhMBlDHR6MT8P0HO1qKimWx2qP+dn3KtTHh4V1Rm68P8stRTJ2t56y73QuXu7qillV8GLbb2R3ziORxqKJ3oH5wDAavPIk4PJOHVJJfF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(366004)(136003)(376002)(396003)(6486002)(71200400001)(54906003)(86362001)(31686004)(83380400001)(2906002)(8676002)(31696002)(2616005)(110136005)(966005)(66476007)(38100700001)(478600001)(26005)(186003)(36756003)(5660300002)(4326008)(66946007)(76116006)(6512007)(66556008)(8936002)(6506007)(66446008)(64756008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?UzBWUDZwK2MwcHk1UFFrdkNqNnhIaTZoakNxNzZrV3h0bDloRlFSRVlHLzBa?=
 =?utf-8?B?VnUxT1ZmVFhmZjZaUmlhVVc3SEtqUlVDU2F5MFNDRDFPaUFrQUFwUDRiMVMw?=
 =?utf-8?B?OUs4T3h4b0JUWTYrMml5YnFrOUo1Y2FSWlBnSlhRSDI0Y0h3cm0ySWpINm8z?=
 =?utf-8?B?RmlOc3hFaUZQdGlEUHFzTERkaExIOWhpQWNoS0llcm9XTkVNUis5Sm9uV3Bq?=
 =?utf-8?B?cTVrRWhET1d2RmZQTmVBN0xzSTdPZk44UXlDb1ZEYnVZVUF2YXFJaklPUGNm?=
 =?utf-8?B?QlZER0hFRDFiVDB0UWszT3lLNVB6T3RIdjd0cWdaUm5qZklQWExBQ2RlUHcv?=
 =?utf-8?B?NE1RVnRoUkxEUG1QUi85TnNSeFJEcG9rb2kzSG9IRGo2R2NNOHB5QVpYQnRP?=
 =?utf-8?B?Ly9ZNGFoeHZtczJOUXNWTmpScWlYcmU0STFDWDlYY2Y4MUt1NnVvTE5hcUt1?=
 =?utf-8?B?RkFiSFVJTVFqZzZFa1hnQ2VUSmZDSlU3WEJ5dzR6UGxMNXhLWWN1ckZNVTIx?=
 =?utf-8?B?VXB0RHVLZ01keC9Mcmp2MjhLLzBRSkp0aURtWkpoei9QWktrYkRNc0h4ZytJ?=
 =?utf-8?B?VXQ0dndlQ21rN0EyQUlxU1Fhc1VVa0dxdXc2c0Z6OWR4Q3Q3ZFc1S2ppRHRK?=
 =?utf-8?B?b2k1UEJlR3F4dVpZeC9iYmplVEMvUW9JRTlBREFEQzlvUEs3ZXNYWjIzQlB3?=
 =?utf-8?B?cDltaUpKZ3hLOUh4UXVRcTA0SHF5SDE0K1dvUHRGbXFpdVgxYXhFbjVLYU9q?=
 =?utf-8?B?a2tJeW0wdVdNbjZhdW8yNXE4M2xBYVRqTE5lU0lOMlMzZXFzdjZHQy9tOTJm?=
 =?utf-8?B?YmtnbEVKdmlXZjZqY3psTkxtckZVRVdWNVE3RXpvOGVKNlJ6TEM4MHdNZ00r?=
 =?utf-8?B?KzBVUEpxTWl6NFRZMnBRNGN0YWhYdzlqVkxmeng0OVhjd3FLamVuZEJPM3Zx?=
 =?utf-8?B?U2o2UTZJamxHSVRxWTFnQVhkV2k1Ry92VUxPQkFBb1VlWTF1VVg1dXhNbFVJ?=
 =?utf-8?B?eGgyaXZwOUNaeUw2dm1TQSs4cEUvSmloQ1lwNTFwcmt2SjNqTE5jMm5jNzNV?=
 =?utf-8?B?cDVqbjlLVFdYei8zTjA2TUZZVFlnQ21SdDF0U284SmkyNTZnU1Q5MVhBWkdh?=
 =?utf-8?B?TFRmUHBTMlEvNUVLYXpTVjI5Nkx6Nmp0TUZobmRRWno3K0RyOUdwNStpczVr?=
 =?utf-8?B?N1FSNEhRT2FLS0FpVGxDWGpMVW04bFEwOU9XaHN1SDAvaEZEb3NiM3ZuL2lP?=
 =?utf-8?B?eTJKSCsvV0pPeU1VdlhxWVpJamEwYmVDdzhrU0tBaWtielRXSll4N1daV2RZ?=
 =?utf-8?B?a3E0RDdUcXV0ODB0NFROamUwT2RtNjVPMFRweERkcnNDNjhpS1U2bUlDYk01?=
 =?utf-8?B?Q1FjTnpSaEJVd1RKUVZGVW1NbkFCVENWS1I5K3BLMHppeVgzSTJKUGM4bVdy?=
 =?utf-8?B?cGxCLzdmZ2V1WEJLSXdOTGMvbll5SjkyWmtOL3YxUnYxSE92VVduanlFRkpn?=
 =?utf-8?B?OXhvQTZYeGpxNndQY1pCOEVsOTc4d0QvWEdQM0tiL21SMERnN010R0tOdkF1?=
 =?utf-8?B?cXdhdFJVM09KZlkyY3NqdGU3ZFB2YjVhc0NRL1VPKzl1NDlUdC9uMzRLSGhl?=
 =?utf-8?B?ZG9MY3lZaGdkVXdSbTdSUjAzcFZCY1c3YXdIRjMvQlc5b1gzZWZLYkRmR0xD?=
 =?utf-8?B?MC9iZEFtd2IzS2gzS29NalNUbGd0cmtYWWNDZ0orMlJqYStReVVwNVBtaEdH?=
 =?utf-8?Q?vBMW5QEGCmTeoJyD5Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D69AEB460C9FD34AAA5E955F92D9E6B2@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650a1e13-2bbf-4157-46d6-08d8f6448ce9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2021 02:02:35.4103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4vvPk+CQRegiOMCA84YYZV0C5Q6acJCjIHEXCApq2SX9NvgWPOI2lEPX4AE5aZcHeujZv3sfVNzaG3JuWYxnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVycnkgVG90aCB3cm90ZToNCj4gSGksDQo+IA0KPiBPcCAwMi0wNC0yMDIxIG9tIDIyOjE2IHNj
aHJlZWYgVGhpbmggTmd1eWVuOg0KPj4gRmVycnkgVG90aCB3cm90ZToNCj4+PiBIaQ0KPj4+DQo+
Pj4gT3AgMzAtMDMtMjAyMSBvbSAyMzo1NyBzY2hyZWVmIEZlcnJ5IFRvdGg6DQo+Pj4+IEhpDQo+
Pj4+DQo+Pj4+IE9wIDMwLTAzLTIwMjEgb20gMjI6MjYgc2NocmVlZiBGZXJyeSBUb3RoOg0KPj4+
Pj4gSGksDQo+Pj4+Pg0KPj4+Pj4gT3AgMzAtMDMtMjAyMSBvbSAxODoxNyBzY2hyZWVmIEZlbGlw
ZSBCYWxiaToNCj4+Pj4+PiBIaSwNCj4+Pj4+Pg0KPj4+Pj4+IEFuZHkgU2hldmNoZW5rbyA8YW5k
eS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4gd3JpdGVzOg0KPj4+Pj4+PiBIaSENCj4+Pj4+Pj4NCj4+
Pj4+Pj4gSSBoYXZlIGEgcGxhdGZvcm0gd2l0aCBEV0MzIGluIER1YWwgUm9sZSBtb2RlLiBDdXJy
ZW50bHkgSSdtDQo+Pj4+Pj4+IGV4cGVyaW1lbnRpbmcgb24gdjUuMTItcmM1IHdpdGggYSBmZXcg
cGF0Y2hlcyAobW9zdGx5IGNvbmZpZ3VyYXRpb24pDQo+Pj4+Pj4+IGFwcGxpZWQgWzFdLiBJJ20g
dXNpbmcgRGViaWFuIFVuc3RhYmxlIG9uIHRoZSBob3N0IG1hY2hpbmUgYW5kDQo+Pj4+Pj4+IEJ1
aWxkUm9vdCB3aXRoIHRoZSBhYm92ZSBtZW50aW9uZWQga2VybmVsIG9uIHRoZSB0YXJnZXQuDQo+
Pj4+Pj4+DQo+Pj4+Pj4+ICoqU28sIHNjZW5hcmlvIDA6DQo+Pj4+Pj4+IDEuIFJ1biBpcGVyZjMg
LXMgb24gdGFyZ2V0DQo+Pj4+Pj4+IDIuIFJ1biBpcGVyZjMgLWMgLi4uIC10IDAgb24gdGhlIGhv
c3QNCj4+Pj4+Pj4gMy7CoCAwLjAwLTEwLjM2wqAgc2VjwqDCoCAyMzcgTUJ5dGVzwqDCoCAxOTIg
TWJpdHMvc2VjDQo+Pj4+Pj4+IHJlY2VpdmVyDQo+Pj4+Pj4+DQo+Pj4+Pj4+ICoqU2NlbmFyaW8g
MToNCj4+Pj4+Pj4gMS4gTm93LCBkZXRhY2ggVVNCIGNhYmxlLCB3YWl0IGZvciBzZXZlcmFsIHNl
Y29uZHMsIGF0dGFjaCBpdCBiYWNrLA0KPj4+Pj4+PiByZXBlYXQgYWJvdmU6DQo+Pj4+Pj4+IDAu
MDAtOS45NMKgwqAgc2VjwqDCoCAyMDkgTUJ5dGVzwqDCoCAxNzYgTWJpdHMvc2VjIHJlY2VpdmVy
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE5vdGUgdGhlIGJhbmR3aWR0aCBkcm9wICgxNzcgdnMuIDE5Miku
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IChSZXBlYXRpbmcgc2NlbmFyaW8gMSB3aWxsIGdpdmUgbm93IHRo
ZSBzYW1lIHJlc3VsdCkNCj4+Pj4+Pj4NCj4+Pj4+Pj4gKipTY2VuYXJpbyAyLg0KPj4+Pj4+PiAx
LiBEZXRhY2ggVVNCIGNhYmxlLCBhdHRhY2ggYSBkZXZpY2UsIGZvciBleGFtcGxlIFVTQiBzdGlj
aywNCj4+Pj4+Pj4gMi4gU2VlIGl0IGJlaW5nIGVudW1lcmF0ZWQgYW5kIGRldGFjaCBpdC4NCj4+
Pj4+Pj4gMy4gQXR0YWNoIGNhYmxlIGZyb20gaG9zdA0KPj4+Pj4+PiA0IC7CoMKgIDAuMDAtMTku
MzbCoCBzZWPCoMKgIDMxNSBNQnl0ZXPCoMKgIDEzNiBNYml0cy9zZWMNCj4+Pj4+Pj4gcmVjZWl2
ZXINCj4+Pj4+Pj4NCj4+Pj4+Pj4gTm90ZSBldmVuIG1vcmUgYmFuZHdpZHRoIGRyb3AhDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IChSZXBlYXRpbmcgc2NlbmFyaW8gMSBrZWVwcyB0aGUgc2FtZSBsb3dlciBi
YW5kd2lkdGgpDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE5PVEUsIHNvbWV0aW1lcyBvbiB0aGlzIHNjZW5h
cmlvIGFmdGVyIHNldmVyYWwgc2Vjb25kcyB0aGUgdGFyZ2V0DQo+Pj4+Pj4+IHNpbXBseSByZWJv
b3RzICh3L28gYW55IGxvZ3MgW2Zyb20ga2VybmVsXSBwcmludGVkKSENCj4+Pj4+Pj4NCj4+Pj4+
Pj4gU28sIGFueSBwb2ludGVycyBvbiBob3cgdG8gZGVidWcgYW5kIHdoYXQgY2FuIGJlIGEgc21v
a2luZyBndW4gaGVyZT8NCj4+Pj4+Pj4NCj4+Pj4+Pj4gRmVycnkgcmVwb3J0ZWQgdGhpcyBpbiBb
Ml0uIFRoZXJlIGFyZSBkaWZmZXJlbnQga2VybmVsIHZlcnNpb25zIGFuZA0KPj4+Pj4+PiB0b29s
cyB0byBlc3RhYmxpc2ggdGhlIGNvbm5lY3Rpb24gKGxpa2UgY29ubm1hbiB2cy4gbm9uZSBpbiBt
eQ0KPj4+Pj4+PiBjYXNlKS4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gWzFdOg0KPj4+Pj4+PiBodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL2FuZHktc2hldi9saW51eC9f
XzshIUE0RjJSOUdfcGchS3BRbnVkSElLNlhnSzZIYlBhcXRiVmdpcERta05CV2V3by1ldUFJdUJs
R2R0U2lhUWlKOGpMbjlPb01FcHBHNnFxLWQkDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFsyXToNCj4+Pj4+
Pj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9hbmR5LXNo
ZXYvbGludXgvaXNzdWVzLzMxX187ISFBNEYyUjlHX3BnIUtwUW51ZEhJSzZYZ0s2SGJQYXF0YlZn
aXBEbWtOQldld28tZXVBSXVCbEdkdFNpYVFpSjhqTG45T29NRXB0TUNycC1GJA0KPj4+Pj4+Pg0K
Pj4+Pj4+DQo+Pj4+Pj4gZHdjMyB0cmFjZXBvaW50cyBzaG91bGQgZ2l2ZSBzb21lIGluaXRpYWwg
aGludHMuIExvb2sgYXQgcGFja2V0cw0KPj4+Pj4+IHNpemVzDQo+Pj4+Pj4gYW5kIHBlcmlvZCBv
ZiB0cmFuc21pc3Npb24uIEZyb20gZHdjMyBzaWRlLCBJIGNhbid0IHRoaW5rIG9mDQo+Pj4+Pj4g
YW55dGhpbmcgd2UNCj4+Pj4+PiB3b3VsZCBkbyB0byB0aHJvdHRsZSB0aGUgdHJhbnNtaXNzaW9u
LCBidXQgdHJhY2Vwb2ludHMgc2hvdWxkIHRlbGwgYQ0KPj4+Pj4+IGNsZWFyZXIgc3RvcnkuDQo+
Pj4+Pj4NCj4+Pj4+IE15IHRlc3RpbmcgKGJ1dCB5ZXMsIHdpdGggZGlmZmVyZW5jZSBrZXJuZWwg
YW5kIG5ldHdvcmsgbWFuYWdlZCBieQ0KPj4+Pj4gY29ubm1hbikgc2hvd3M6DQo+Pj4+Pg0KPj4+
Pj4gMSkgb24gY29sZCBib290IGVlbSBuZXR3b3JrIGdhZGdldCB3b3JrcyBmaW5lDQo+Pj4+Pg0K
Pj4+Pj4gMikgYWZ0ZXIgdW5wbHVnIG9yIHdhcm0gcmVib290ICh3aGljaCBpcyBhbHNvIGFuIHVu
cGx1ZykgaXQncyBicm9rZW4sDQo+Pj4+PiBzcGVlZCBpcyBsb3N0ICh8MTIuMCBNYml0cy9zZWMg
ZnJvbSAyMDBNYi9zIG5vcm1hbGx5KXwsIHBhY2tldHMgbG9zdCwNCj4+Pj4+IG5vIGNvbmZpZ3Vy
YXRpb24gcmVjZWl2ZWQgZnJvbSBkaGNwLCBvY2Nhc2lvbmFsIHJlYm9vdCwgb25seSB3YXkgdG8N
Cj4+Pj4+IGZpeCBpcyBjb2xkIGJvb3QNCj4+Pj4+DQo+Pj4+PiAzKSBpZiBiZWZvcmUgdW5wbHVn
IGBjb25ubWFuY3RsIGRpc2FibGUgZ2FkZ2V0YCwgb24gcmVwbHVnZ2luZyBhbmQNCj4+Pj4+IGVu
YWJsaW5nIGl0IHdvcmtzIGZpbmUNCj4+Pj4+DQo+Pj4+PiBNeSB0aGVvcnkgaXMgdGhhdCBzb21l
IEhXIHJlZ2lzdGVyIGlzIGRpc3R1cmJlZCBvbiBhIHN1cnByaXNlIHVucGx1ZywNCj4+Pj4+IGJ1
dCBub3QgcmVzZXQgb24gcGx1ZyBvciB3YXJtIGJvb3QuIEJ1dCBvbiBjb2xkIGJvb3QgaXMgY2xl
YXJlZC4NCj4+Pj4+IE1heWJlIHRoYXQgY2FuIGhlbHAgdG8gbmFycm93IGRvd24gdHJhY2Vwb2lu
dHM/DQo+Pj4+Pg0KPj4+PiBJIGNhcHR1cmVkIGEgcGx1ZyBhZnRlciB3YXJtIGFuZCBhZnRlciBj
b2xkIGJvb3QuIFRoaXMgaW5jbHVkZXMNCj4+Pj4gbmV0d29yayBzZXR1cCAoZGhjcCkuIFlvdSBj
YW4gZmluZCBpdCBpbiBbMl0gb3IgZGlyZWN0bHkgbGluayBoZXJlOg0KPj4+PiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL2FuZHktc2hldi9saW51eC9maWxl
cy82MjMyNDEwL2Jvb3QuemlwX187ISFBNEYyUjlHX3BnIUtwUW51ZEhJSzZYZ0s2SGJQYXF0YlZn
aXBEbWtOQldld28tZXVBSXVCbEdkdFNpYVFpSjhqTG45T29NRXBqaGhyd2EtJA0KPj4+Pg0KPj4+
DQo+Pj4NCj4+PiBXaGlsZSB0aGUgYWJvdmUgdHJhY2VzIGluIGJvb3QuemlwIGFsbG93IGNvbXBh
cmUgd2hpY2ggcmVncyBub3QNCj4+PiBjb3JyZWN0bHkgaW5pdGlhbGl6ZWQgb24gd2FybSBib290
LCBJIGhhdmUgbm93IGNhcHR1cmVkIHRyYWNlcyBvZg0KPj4+IHVucGx1Zy9wbHVnLg0KPj4+DQo+
Pj4gSGVyZSBrZXJuZWwgaXMgNS4xMC4yNyAoTFRTKSwgY29sZCBib290ZWQgd2l0aCBVU0IgY2Fi
bGUgcGx1Z2dlZCBhbmQgdGhlDQo+Pj4gZWVtIGdhZGdldCBuZXR3b3JrIHNldHVwIChkaGNwKS4g
VGhlbiB0cmFjZSB1bnBsdWcuIFRoZW4gdHJhY2UgcGx1Zy4NCj4+Pg0KPj4+IEFmdGVyIHBsdWcg
dGhlIGVlbSBjb25uZWN0aW9uIGlzIGFnYWluIGJyb2tlbi4NCj4+Pg0KPj4+IFRoaXMgbWlnaHQg
YWxsb3cgZmlndXJpbmcgb3V0IHdoYXQgZ29lcyB3cm9uZyBvbiB1bnBsdWcuIFRyYWNlcyBoZXJl
Og0KPj4+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vYW5k
eS1zaGV2L2xpbnV4L2ZpbGVzLzYyNTA5MjQvcGx1Zy11bnBsdWcuemlwX187ISFBNEYyUjlHX3Bn
IUtwUW51ZEhJSzZYZ0s2SGJQYXF0YlZnaXBEbWtOQldld28tZXVBSXVCbEdkdFNpYVFpSjhqTG45
T29NRXBnaWk4Mk5TJA0KPj4+DQo+Pj4gKioNCj4+Pg0KPj4NCj4+IEhpLA0KPj4NCj4+IFdlcmUg
eW91IGFibGUgdG8gbmFycm93IGRvd24gdGhlIGlzc3VlIHRvIG9ubHkgRFdDMyBkZXZpY2U/IChp
LmUuIHlvdQ0KPj4gdGVzdGVkIHdpdGggZGlmZmVyZW50IGhvc3RzIGFuZCBkaWZmZXJlbnQgZGV2
aWNlIGNvbnRyb2xsZXJzIHRvIGNvbmZpcm0NCj4+IHRoaXMpDQo+IA0KPiBJIGhhdmVuJ3QgdHJp
ZWQgd2l0aCBvdGhlciBkZXZpY2VzLiBJIGhhdmUgYmVlbiBmb3JjZWQgdG8gcmVwbGFjZSBteQ0K
PiBob3N0IG1vYm8gYW5kIG5vdGhpbmcgY2hhbmdlZC4gQnV0IEkgZGlkbid0IHBheSBhdHRlbnRp
b24gdG8gdGhlDQo+IHBhcnRpY3VsYXIgaG9zdCBjb250cm9sbGVyLg0KPiANCg0KSXQnZCBiZSBi
ZXR0ZXIgaWYgd2UgY2FuIG5hcnJvdyBkb3duIHRoZSBjdWxwcml0IGFzIHRoaXMgc2VlbXMgdG8g
bWUNCmxpa2UgYSBzeW5jaHJvbml6YXRpb24gaXNzdWUgYXQgdGhlIHVwcGVyIGxheWVyIGJldHdl
ZW4gdGhlIGhvc3QgYW5kIGRldmljZS4NCg0KPj4gRGlkIHlvdSBzZWUgdGhpcyBpc3N1ZSBwcmV2
aW91c2x5PyBJZiBub3QsIGlzIGl0IHBvc3NpYmxlIHRvIGRvIGdpdA0KPj4gYmlzZWN0aW9uPw0K
PiANCj4gVGhpcyBpcyB3aXRoIEludGVsIEVkaXNvbiB3aGVyZSBtYWluIGxpbmUgdXNiIGdhZGdl
dCBzdXBwb3J0IGFwcGVhcmVkDQo+IGFyb3VuZCA0LjE5IGlpcmMuIEkgYmVsaWV2ZWQgdGhlIHBy
b2JsZW0gYXBwZWFyZWQgYmV0d2VlbiA1LjQgYW5kIDUuNw0KPiBhbmQgdHJpZWQgdG8gYmlzZWN0
IGJ1dCBmYWlsZWQuDQo+IA0KPiBJIHJlYWxpemUgb25seSBub3cgdGhhdCBJIGZhaWxlZCBiZWNh
dXNlOg0KPiAxKSA1LjQgYWxyZWFkeSBoYXMgdGhpcyBpc3N1ZSBhcyBJIHJlY2VudGx5IHJldGVz
dGVkDQoNCkknbSBjb25mdXNlZCwgd2h5IGRvIHlvdSBiZWxpZXZlIHRoZSBwcm9ibGVtIGlzIGJl
dHdlZW4gNS40IGFuZCA1LjcgaWYNCjUuNCBhbHJlYWR5IGhhcyB0aGlzIGlzc3VlPyBTbyB3aGVu
IGRpZCB5b3Ugc3RhcnQgc2VlaW5nIHRoaXMgcHJvYmxlbT8NCg0KQWxzbywgdGhlc2Uga2VybmVs
IHZlcnNpb25zIGFyZSByZWFsbHkgb2xkLCB0aGVyZSdzIGJlZW4gYSBsb3Qgb2YNCnVwZGF0ZXMv
Zml4ZXMgdG8gZHdjMyBzaW5jZSB0aGVuLiBDYW4gd2UgcnVuIHRlc3RzIG9uIHRoZSBsYXRlc3Qg
a2VybmVsPw0KDQo+IDIpIEkgZGlkbid0IHVzZSBhIHJlcHJvZHVjaWJsZSBjcml0ZXJpb24uIEFm
dGVyIHdhcm0gcmVib290IHRoZSBlZW0NCj4gZ2FkZ2V0IGZhaWxzLCBidXQgeW91IGNhbiBmbGlw
IHRoZSBob3N0L2dhZGdldCBzd2l0Y2ggYmFjayBhbmQgZm9ydGggYW5kDQo+IGhhdmUgdGhlIGls
bHVzaW9uIHRoYXQgdGhlIGNvbm5lY3Rpb24gcmVzdG9yZWQuDQo+IA0KPiBUaGUgc2NlbmFyaW8g
ZGVzY3JpYmVkIGhlcmUgaXMgcmVwcm9kdWNpYmxlOiBsZWF2aW5nIHRoZSBzd2l0Y2ggaW4NCj4g
Z2FkZ2V0IG1vZGUgZWVtIHdvcmtzIGFmdGVyIGNvbGQgYm9vdCBvbmx5LiBBbmQgaXQgbGlrZWx5
IGJyZWFrcyBvbiB1bnBsdWcuDQo+IA0KPiBBIDJuZCBoaW50IGlzIHRoYXQgZGlzYWJsaW5nIGdh
ZGdldCAoSSB1c2VkIGBjb25ubWFuY3RsIGRpc2FibGUgZ2FkZ2V0YA0KPiBidXQgSSBiZWxpZXZl
IHRoYXQgaGFzIHRoZSBzYW1lIGVmZmVjdCBhcyBgaXcgbGluayBzZXQgZGV2IHVzYjAgZG93bmAp
DQo+IGJlZm9yZSB1bnBsdWcgcHJldmVudHMgbWVzc2luZyB1cCB0aGUgZHJpdmVyLCBzbyB5b3Ug
Y2FuIHJlcGx1ZyBhbmQNCj4gZW5hYmxlIGFnYWluLg0KDQpUaGVzZSBkYXRhIHBvaW50cyBhcmUg
Z29vZC4gSG93ZXZlciwgd2UnZCBuZWVkIHRvIGtub3cgd2hlcmUgdG8gbG9vaw0KZmlyc3QuIFRo
ZSBpc3N1ZSBpc24ndCBvYnZpb3VzIGZyb20gdGhlIERXQzMgY29udHJvbGxlciBvciB0aGUgRFdD
MyBkcml2ZXIuDQoNCkNhbiB5b3UgY2hlY2sgYSBmZXcgdGhpbmdzOg0KMSkgQW55IGVycm9yL3Rp
bWVvdXQgbWVzc2FnZXMgZnJvbSB0aGUgaG9zdCdzIGRtZXNnPyBPciBkZXZpY2Ugc2lkZT8NCjIp
IFdoYXQga2VybmVsIHZlcnNpb24gaXMgeW91ciBob3N0IHVzaW5nPyBDYW4geW91IHVzZSB0aGUg
bGF0ZXN0IGZvcg0KYm90aCBob3N0IGFuZCBkZXZpY2U/DQozKSBTbmFwc2hvdCBvZiBkd2MzIHRy
YWNlcG9pbnRzIG9mIGFjdGl2ZSB0cmFuc2ZlcnMgYmV0d2VlbiB0aGUgbm9ybWFsDQp2cyB0aHJv
dHRsZWQgb2YgdGhlIGxhdGVzdCBrZXJuZWwNCg0KQlIsDQpUaGluaA0K
