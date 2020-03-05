Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD8917A01D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Mar 2020 07:45:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgCEGpu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 01:45:50 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43796 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725880AbgCEGpu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Mar 2020 01:45:50 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7782443BBB;
        Thu,  5 Mar 2020 06:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583390749; bh=yFhZuzSIxWqfXDd2gGA1iSTNoIdsdhOLPkwYyxsiVJc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lr6O7pV9T3mNHCxjDsdL9uH2uXUCgh0JL8xODSo7NHdYcL77KIR7zsqkiUXTu/WL0
         QzCTE9+NLH3x/muMJoJfJZ1mGvFXmAkjXeblXl75wg466mJxN8dmCPSIWLzdNYwg/U
         NPtau3CmGKSGy0VqmST/ezxScZjAdjAXJjtwOhA0EWuV+G0b9yc79duU43OJUBPJ0y
         A0SMFFY4uIktj1zvtyX2ZbZpBpwDKMmBdM+8zDlc+MotLboj4me8TzWyFUSu7SuIlZ
         JnVDs660gRPWp3+SlqfaPgfmZKJ8w34iRggP8ft3lw1fzLxMgVNjj11ArqISDP5yZB
         xF27jYyZbUWaA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4E712A0067;
        Thu,  5 Mar 2020 06:45:46 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 4 Mar 2020 22:45:46 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 4 Mar 2020 22:45:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7W2P8y82gEMtsSYKl/dLrBc5AxHq2K8U0+azIoHfQiVrKDhpl3MaMOXUFtwEAgyfDu2yL0zI5X78cGX26Jv14upsK0MPm3CdIK0Qpkjf4DHhx1CFYi0uS1JSfWJqj5u7Lo+ibrd2gE4cD7k7NQbtt7PhItSpYxY9ooTOVksBFHXzEgQVNttZCrGoXilL29M7Omk8X9IzfvlKcUwg1HfeZ2FiEMVbmHDbIty+5AGs66WOeDPliBV+A8o0t5NsnQ3cmHkpbNBcf3PjpOlE2husLclxmZKqCNEon/dSzOEakNubI6hcirEcVtllw+5R7L8vXiB/WHlNNiZAiRgSCnnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFhZuzSIxWqfXDd2gGA1iSTNoIdsdhOLPkwYyxsiVJc=;
 b=HVI/RsbQMRXX+zfVBNb4v9HwHJw7s2c4c2tIqegTI/qfdVQ68Qjb/z/jYpnOzk3aKUS8eTN0DTLmL78ifiSP4E6RyHny55XYOLNsgUTcW83LTBALorvk0ssoUDq2K56YX3zCI53lBARHVetJBDdAyx7z0Rr231S9eAkt011IVxVC7x7LPOsAQ+6mrdIGKDnkgesQkPP8nlDKS6Xy4A2qvrQaPZ6kMb0GvC7vxKPnFuMzIPcQSxgoC9ZfADtzTlK31k9t5wgg9bGxgSqOtuzkEAcA01Jtg+hwBBAnfcsvjJIChq2ctcL46A9t9JZICJNrXq1otQ+k/4A3qTWPrDtZFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yFhZuzSIxWqfXDd2gGA1iSTNoIdsdhOLPkwYyxsiVJc=;
 b=f6/q4ETjeKmBuqrd7fGNUtcdSzqOzhhRNLxc2qICQtW6DMDxV7UnHqx2d8NIY4ZmK5EGz7T1VlD3EUGXqk+J7cDRD1HSnK24p3QDlcUxtICsT2K1RtnCOMaUnKItQGctPVyeekv+lV5aInpoUJ+fcS/6FjVzVVxxNxDHsf3EvUM=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Thu, 5 Mar
 2020 06:45:44 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::111c:5382:5a76:21cb]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::111c:5382:5a76:21cb%4]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 06:45:44 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     Otavio Salvador <otavio@ossystems.com.br>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
Thread-Topic: USB DWC2 stops responding when insert/remove cable multiple
 times
Thread-Index: AQHV4zxylJsWeUZ0JUKEDMOhhpCodKgfGkgAgAA7cgCAAA+HAIAAbA0AgAKn7gCAAC2+gIABCQCAgABpVgCAASdLgIAAeQoAgAAARQCACqrrAIAAj8WAgAi4T4A=
Date:   Thu, 5 Mar 2020 06:45:44 +0000
Message-ID: <bb0d6b96-f8c6-f8b9-3589-46e5ecaf37cc@synopsys.com>
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
 <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
 <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com>
 <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
 <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com>
 <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
 <1d2ee918-57e4-53b2-6953-0107d7720c59@synopsys.com>
 <CAP9ODKoS5KQrhTrUvahHEhQG-WA+bfLnP4tTFxzrQaGh1nTcZw@mail.gmail.com>
 <CAP9ODKoRuB-nyjr1ksGU61PVMjFTMMWKwgpHQ=e7bChAu5Okhg@mail.gmail.com>
 <665fe49e-ebfa-bcb0-fcd1-ea1e9252b306@synopsys.com>
 <CAP9ODKo=YSNa-uNgzwP2X5yDy_qDzYjLogZLg11rRcSXr+wrFw@mail.gmail.com>
In-Reply-To: <CAP9ODKo=YSNa-uNgzwP2X5yDy_qDzYjLogZLg11rRcSXr+wrFw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f20588ff-d9c0-41d8-aba0-08d7c0d0d47f
x-ms-traffictypediagnostic: MN2PR12MB4080:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4080B72756B396C50F9BEF50A7E20@MN2PR12MB4080.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(376002)(366004)(346002)(136003)(396003)(199004)(189003)(81156014)(6506007)(8936002)(8676002)(81166006)(4326008)(110136005)(31686004)(54906003)(53546011)(2906002)(5660300002)(316002)(478600001)(6512007)(45080400002)(2616005)(36756003)(6486002)(66946007)(26005)(186003)(64756008)(66476007)(66556008)(71200400001)(31696002)(86362001)(66446008)(91956017)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4080;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NgPpprpt4I57RGKSr6orK0E6h9uCTxnvbsEV7Mus+KSOYQrfrrbQaHKtDtaiU1q2HfdPRQ/KRZzB9oCBHarGub+wkLLe+iSn6wnBE3eFcm4zJVdxJHEEYy0BUEev5wlBFYJ7ZhZ1OijtBaVimqLZ7LC52wgkOxS4fzLzRyE7juFIwoeDzU792Tz5O4xuqf1WyrFQjn5Gs+YlDAn33jWJNifbYurQtnDmJ6YMKhI9O67yYS0wfDbYyfksr5o+xt9FRF4HUkU1s4dPP42AmlCUwLdeyl9Uw5HXUlt34lSqR3cLSSlQw6NwqqrjxHZ/crikQCP17P1FRIqrPCQIzvJuUJ2BN0qJEpU9fUNTgk1l/vPFQlZ4DJq9YRb15hlKtqUcAyUXJlAfPb2jNLXnL08Ovjw97CfRCi5zX+A0y4jV9Su1KMx650rYYyuPmEyG6QvY
x-ms-exchange-antispam-messagedata: eNSIZkH9SULwy45v7k7ykR8wfYOTVaEoaDqSYdsx+LMzCfOCE16A6Tu02hAF/SY0l6M36RvxApvFpd6bFn8xjyy0n1rCoBQaI24JyMI9p4wAMSJSvUHGnYheaKtD+7N9M8YCqOlM4MT+rYa+FEI5zQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC3DCC2BD5C1944C8A3D3752593F5481@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f20588ff-d9c0-41d8-aba0-08d7c0d0d47f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 06:45:44.4801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8+PsbFOrPwIykAkmqRGJAOITPFhCFM0m3s9JCrAfdFlgYxf6dhz6bMjy9mf63HB5M5cPtNqvznZSbEvc+MfMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT3RhdmlvLA0KDQpPbiAyLzI4LzIwMjAgOTozNSBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3Rl
Og0KPiBIZWxsbyBNaW5hcywNCj4gDQo+IE9uIEZyaSwgRmViIDI4LCAyMDIwIGF0IDY6MDEgQU0g
TWluYXMgSGFydXR5dW55YW4NCj4gPE1pbmFzLkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4gd3Jv
dGU6DQo+PiBPbiAyLzIxLzIwMjAgNjowNyBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3RlOg0KPj4+
IE9uIEZyaSwgRmViIDIxLCAyMDIwIGF0IDExOjA2IEFNIE90YXZpbyBTYWx2YWRvcg0KPj4+IDxv
dGF2aW9Ab3NzeXN0ZW1zLmNvbS5icj4gd3JvdGU6DQo+Pj4+IE9uIEZyaSwgRmViIDIxLCAyMDIw
IGF0IDM6NTIgQU0gTWluYXMgSGFydXR5dW55YW4NCj4+Pj4gPE1pbmFzLkhhcnV0eXVueWFuQHN5
bm9wc3lzLmNvbT4gd3JvdGU6DQo+Pj4+PiBPbiAyLzIwLzIwMjAgNToxNiBQTSwgT3RhdmlvIFNh
bHZhZG9yIHdyb3RlOg0KPj4+Pj4+IEhlbGxvIE1pbmFzLA0KPj4+Pj4+DQo+Pj4+Pj4gVGhhbmtz
IGZvciBhbGwgeW91ciBoZWxwIG9uIHRoaXMsIC4uLg0KPj4+Pj4+DQo+Pj4+Pj4gT24gVGh1LCBG
ZWIgMjAsIDIwMjAgYXQgMzo1OSBBTSBNaW5hcyBIYXJ1dHl1bnlhbg0KPj4+Pj4+IDxNaW5hcy5I
YXJ1dHl1bnlhbkBzeW5vcHN5cy5jb20+IHdyb3RlOg0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiAyLzE5
LzIwMjAgNzoxMCBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3RlOg0KPj4+Pj4+IC4uLg0KPj4+Pj4+
Pj4gV2hhdCBzZXF1ZW5jZSBkbyB5b3Ugd2FudCB1cyB0byBkbz8NCj4+Pj4+Pj4NCj4+Pj4+IFBs
ZWFzZSBwcm92aWRlIGR3YzIgZGVidWcgbG9nIHdoZW4gc3RvcCB3b3JraW5nIHdpdGggZ19zZXJp
YWwgZXhjZXB0aW9uDQo+Pj4+PiBkdW1wIGluc2lkZS4NCj4+Pj4+IEFsc28gcHJvdmlkZSBkd2My
IGxvZyB3aGVuIGl0J3Mgd29yayB3aXRob3V0IGlzc3VlLg0KPj4+Pg0KPj4+PiBBdHRhY2hlZC4N
Cj4+Pg0KPiANCj4gWyAgMjA3LjcxNTg5OF0gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdf
cHVsbHVwOiBpc19vbjogMCBvcF9zdGF0ZTogMw0KPiBbICAyMDcuNzE1OTQyXSBkd2MyIDMwMTgw
MDAwLnVzYjogY29tcGxldGU6IGVwIGI0NWU4ZGFjIGVwMCwgcmVxDQo+IDllNTk0OWIwLCAtMTA4
ID0+IDg2M2ZjMWI5DQo+IFsgIDIwNy43MTU5NjZdIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hz
b3RnX2NvbXBsZXRlX3NldHVwOiBmYWlsZWQgLTEwOA0KPiBbICAyMDcuNzE1OTk2XSBkd2MyIDMw
MTgwMDAwLnVzYjogY29tcGxldGU6IGVwIGVkZmE0NmQzIGVwMm91dCwgcmVxDQo+IGM2NTlhMzAx
LCAtMTA4ID0+IGYwZGU1MDEzDQo+IFsgIDIwNy43MTYwNTBdIGR3YzIgMzAxODAwMDAudXNiOiBj
b21wbGV0ZTogZXAgZWRmYTQ2ZDMgZXAyb3V0LCByZXENCj4gZjQ2YjY4YzQsIC0xMDggPT4gZjBk
ZTUwMTMNCj4gWyAgMjA3LjcxNjA3OF0gZHdjMiAzMDE4MDAwMC51c2I6IGNvbXBsZXRlOiBlcCBl
ZGZhNDZkMyBlcDJvdXQsIHJlcQ0KPiAyNDg5MGE0NiwgLTEwOCA9PiBmMGRlNTAxMw0KPiBbICAy
MDcuNzE2MTAwXSBkd2MyIDMwMTgwMDAwLnVzYjogY29tcGxldGU6IGVwIGVkZmE0NmQzIGVwMm91
dCwgcmVxDQo+IGZjNDgxMGZkLCAtMTA4ID0+IGYwZGU1MDEzDQo+IFsgIDIwNy43MTYxMTldIGR3
YzIgMzAxODAwMDAudXNiOiBjb21wbGV0ZTogZXAgZWRmYTQ2ZDMgZXAyb3V0LCByZXENCj4gZjY0
MWJkYWQsIC0xMDggPT4gZjBkZTUwMTMNCj4gWyAgMjA3LjcxNjEzOV0gZHdjMiAzMDE4MDAwMC51
c2I6IGNvbXBsZXRlOiBlcCBlZGZhNDZkMyBlcDJvdXQsIHJlcQ0KPiA5Mjg3MTU3MywgLTEwOCA9
PiBmMGRlNTAxMw0KPiBbICAyMDcuNzE2MTU4XSBkd2MyIDMwMTgwMDAwLnVzYjogY29tcGxldGU6
IGVwIGVkZmE0NmQzIGVwMm91dCwgcmVxDQo+IGZlNzdiNjAzLCAtMTA4ID0+IGYwZGU1MDEzDQo+
IFsgIDIwNy43MTYxNzddIGR3YzIgMzAxODAwMDAudXNiOiBjb21wbGV0ZTogZXAgZWRmYTQ2ZDMg
ZXAyb3V0LCByZXENCj4gM2U5MDY0ZDUsIC0xMDggPT4gZjBkZTUwMTMNCj4gWyAgMjA3LjcxNjE5
Nl0gZHdjMiAzMDE4MDAwMC51c2I6IGNvbXBsZXRlOiBlcCBlZGZhNDZkMyBlcDJvdXQsIHJlcQ0K
PiA1YWFlMmUxMSwgLTEwOCA9PiBmMGRlNTAxMw0KPiBbICAyMDcuNzE2MjE2XSBkd2MyIDMwMTgw
MDAwLnVzYjogY29tcGxldGU6IGVwIGVkZmE0NmQzIGVwMm91dCwgcmVxDQo+IDdjNTgzNGRiLCAt
MTA4ID0+IGYwZGU1MDEzDQo+IFsgIDIwNy43MTYyMzZdIGR3YzIgMzAxODAwMDAudXNiOiBjb21w
bGV0ZTogZXAgZWRmYTQ2ZDMgZXAyb3V0LCByZXENCj4gOTY4YWYyNDQsIC0xMDggPT4gZjBkZTUw
MTMNCj4gWyAgMjA3LjcxNjI1N10gZHdjMiAzMDE4MDAwMC51c2I6IGNvbXBsZXRlOiBlcCBlZGZh
NDZkMyBlcDJvdXQsIHJlcQ0KPiBmYTY4YzJlYiwgLTEwOCA9PiBmMGRlNTAxMw0KPiBbICAyMDcu
NzE2Mjc2XSBkd2MyIDMwMTgwMDAwLnVzYjogY29tcGxldGU6IGVwIGVkZmE0NmQzIGVwMm91dCwg
cmVxDQo+IDZjZmJjZWU1LCAtMTA4ID0+IGYwZGU1MDEzDQo+IFsgIDIwNy43MTYyOTZdIGR3YzIg
MzAxODAwMDAudXNiOiBjb21wbGV0ZTogZXAgZWRmYTQ2ZDMgZXAyb3V0LCByZXENCj4gZWVhODJh
MmIsIC0xMDggPT4gZjBkZTUwMTMNCj4gWyAgMjA3LjcxNjMxNV0gZHdjMiAzMDE4MDAwMC51c2I6
IGNvbXBsZXRlOiBlcCBlZGZhNDZkMyBlcDJvdXQsIHJlcQ0KPiA1NmNjZDgyZCwgLTEwOCA9PiBm
MGRlNTAxMw0KPiBbICAyMDcuNzE2MzM1XSBkd2MyIDMwMTgwMDAwLnVzYjogY29tcGxldGU6IGVw
IGVkZmE0NmQzIGVwMm91dCwgcmVxDQo+IGEwMGI3MTQ4LCAtMTA4ID0+IGYwZGU1MDEzDQo+IFsg
IDIwNy43MTYzODldIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hzb3RnX2VwX2Rpc2FibGUoZXAg
ZWRmYTQ2ZDMpDQo+IFsgIDIwNy43MTY0MTBdIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hzb3Rn
X2VwX3N0b3BfeGZyOiBzdG9wcGluZw0KPiB0cmFuc2ZlciBvbiBlcDJvdXQNCj4gWyAgMjA3Ljcx
NjQzOF0gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZTogRHhFUENUTD0w
eDA4MDgwMjAwDQo+IFsgIDIwNy43MTY0NTddIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hzb3Rn
X2VwX2Rpc2FibGUoZXAgMDNmNDAwNTQpDQo+IFsgIDIwNy43MTY0NjldIGR3YzIgMzAxODAwMDAu
dXNiOiBkd2MyX2hzb3RnX2VwX2Rpc2FibGU6IER4RVBDVEw9MHgwODhhMDIwMA0KPiBbICAyMDcu
NzE2NTY3XSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19lcF9kaXNhYmxlKGVwIDEwOGY4
OWZhKQ0KPiBbICAyMDcuNzE2NTgxXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19lcF9k
aXNhYmxlOiBEeEVQQ1RMPTB4MDk4YzAwMGENCj4gWyAgMjA3LjcyMjYwMF0gZ3NfY2xvc2U6IGJl
Zm9yZSBzcGluX3VubG9ja19pcnEgMTogdHR5LT5kcml2ZXJfZGF0YSBpcyBiYWY0YTAwZA0KPiBb
ICAyMDcuNzIyNjI1XSBnc19jbG9zZTogdHR5R1MwICgxMWJiYmZlYSxkYzlhMWRiMSkgLi4uDQo+
IFsgIDIwNy43MjI2NDZdIGdzX2Nsb3NlOiB0dHlHUzAgKDExYmJiZmVhLGRjOWExZGIxKSBkb25l
IQ0KPiBbICAyMDguMDQwMTIyXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19lcF9kaXNh
YmxlKGVwIDAzZjQwMDU0KQ0KPiBbICAyMDguMDQwMTUzXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdj
Ml9oc290Z19lcF9kaXNhYmxlOiBEeEVQQ1RMPTB4MDg4YTAyMDANCj4gWyAgMjA4LjA0MDE3N10g
ZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZShlcCBlZGZhNDZkMykNCj4g
WyAgMjA4LjA0MDE5NF0gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZTog
RHhFUENUTD0weDA4MGEwMjAwDQo+IFsgIDIwOC4wNDAyMTRdIGR3YzIgMzAxODAwMDAudXNiOiBk
d2MyX2hzb3RnX2VwX2Rpc2FibGUoZXAgMTA4Zjg5ZmEpDQo+IFsgIDIwOC4wNDAyMjddIGR3YzIg
MzAxODAwMDAudXNiOiBkd2MyX2hzb3RnX2VwX2Rpc2FibGU6IER4RVBDVEw9MHgwOThlMDAwYQ0K
PiBbICAyMDguMDQwMjQzXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19lcF9kaXNhYmxl
KGVwIDEyZDIxMDI4KQ0KPiBbICAyMDguMDQwMjU1XSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9o
c290Z19lcF9kaXNhYmxlOiBEeEVQQ1RMPTB4MDgwMjA0MDANCj4gWyAgMjA4LjA0MDI3MV0gZHdj
MiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZShlcCBmYjZiM2U2MCkNCj4gWyAg
MjA4LjA0MDI4Ml0gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZTogRHhF
UENUTD0weDA4MDIwNDAwDQo+IFsgIDIwOC4wNDAyOThdIGR3YzIgMzAxODAwMDAudXNiOiBkd2My
X2hzb3RnX2VwX2Rpc2FibGUoZXAgYWJlYTNkMDYpDQo+IFsgIDIwOC4wNDAzMTBdIGR3YzIgMzAx
ODAwMDAudXNiOiBkd2MyX2hzb3RnX2VwX2Rpc2FibGU6IER4RVBDVEw9MHgwODAyMDQwMA0KPiBb
ICAyMDguMDQwMzI2XSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19lcF9kaXNhYmxlKGVw
IDgwNzRhYzIxKQ0KPiBbICAyMDguMDQwMzM4XSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290
Z19lcF9kaXNhYmxlOiBEeEVQQ1RMPTB4MDgwMjA0MDANCj4gWyAgMjA4LjA0MDM1NV0gZHdjMiAz
MDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZShlcCA5NDQ5ZTNlZSkNCj4gWyAgMjA4
LjA0MDM2N10gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZTogRHhFUENU
TD0weDA4MDIwNDAwDQo+IFsgIDIwOC4wNDAzODNdIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hz
b3RnX2VwX2Rpc2FibGUoZXAgM2I2Y2Q2OGMpDQo+IFsgIDIwOC4wNDAzOTVdIGR3YzIgMzAxODAw
MDAudXNiOiBkd2MyX2hzb3RnX2VwX2Rpc2FibGU6IER4RVBDVEw9MHgwODAyMDQwMA0KPiBbICAy
MDguMDQwNDEyXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19lcF9kaXNhYmxlKGVwIDM4
YzRkOWRiKQ0KPiBbICAyMDguMDQwNDI2XSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19l
cF9kaXNhYmxlOiBEeEVQQ1RMPTB4MDgwMjA0MDANCj4gWyAgMjA4LjA0MDQ0M10gZHdjMiAzMDE4
MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZShlcCA2N2IzNzQzNCkNCj4gWyAgMjA4LjA0
MDQ1N10gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfZXBfZGlzYWJsZTogRHhFUENUTD0w
eDA4MDIwNDAwDQo+IFsgIDIwOC4wNjE5MTRdIGdzX2Nsb3NlOiBiZWZvcmUgc3Bpbl91bmxvY2tf
aXJxIDE6IHR0eS0+ZHJpdmVyX2RhdGEgaXMgYmFmNGEwMGQNCj4gWyAgMjA4LjA2MTk4MF0gODwt
LS0gY3V0IGhlcmUgLS0tDQo+IFsgIDIwOC4wNjIyODNdIFVuYWJsZSB0byBoYW5kbGUga2VybmVs
IHBhZ2luZyByZXF1ZXN0IGF0IHZpcnR1YWwNCj4gYWRkcmVzcyAwMDc2NjUwMA0KPiBbICAyMDgu
MDYyOTM0XSBwZ2QgPSBiNDFjOWU3Yg0KPiBbICAyMDguMDYzMTg5XSBbMDA3NjY1MDBdICpwZ2Q9
MDAwMDAwMDANCj4gWyAgMjA4LjA2MzUyOF0gSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDUgWyMxXSBT
TVAgQVJNDQo+IFsgIDIwOC4wNjM5NDVdIE1vZHVsZXMgbGlua2VkIGluOiB1c2JfZl9hY20gdV9z
ZXJpYWwgbGliY29tcG9zaXRlDQo+IGNvbmZpZ2ZzIHpyYW0genNtYWxsb2MgZW1sb2coTykgcnRj
X3JrODA4IGNsa19yazgwOCBzcGlfcm9ja2NoaXANCj4gd2R0b2tlbihPKSBbbGFzdCB1bmxvYWRl
ZDogZ19zZXJpYWxdDQo+IFsgIDIwOC4wNjUzMDNdIENQVTogMCBQSUQ6IDEyMDMgQ29tbTogc2gg
VGFpbnRlZDogRyAgICAgICAgICAgTyAgICAgIDUuNC4yMSAjMQ0KPiBbICAyMDguMDY1OTIzXSBI
YXJkd2FyZSBuYW1lOiBSb2NrY2hpcCAoRGV2aWNlIFRyZWUpDQo+IFsgIDIwOC4wNjYzNjRdIFBD
IGlzIGF0IF9fY2FuY2VsX3dvcmtfdGltZXIrMHg2NC8weDIwMA0KPiBbICAyMDguMDY2ODE5XSBM
UiBpcyBhdCB0cnlfdG9fZ3JhYl9wZW5kaW5nKzB4NDQvMHgxYTANCj4gWyAgMjA4LjA2NzI1N10g
cGMgOiBbPGMwMTUzYzcwPl0gICAgbHIgOiBbPGMwMTUyYTM0Pl0gICAgcHNyOiAyMDAxMDA5Mw0K
PiBbICAyMDguMDY3ODE4XSBzcCA6IGM1ZDkxZTk4ICBpcCA6IDAwMDAwMDAwICBmcCA6IGMwOTRl
OGM4DQo+IFsgIDIwOC4wNjgyODldIHIxMDogMDAwMDAwMDAgIHI5IDogYzY0OGZiN2MgIHI4IDog
YzVjODhmMDANCj4gWyAgMjA4LjA2ODc2MF0gcjcgOiAwMDAwMDAwMCAgcjYgOiAwMDAwMDAwMCAg
cjUgOiBjNjQ4ZDIwNCAgcjQgOiBjNWQ5MDAwMA0KPiBbICAyMDguMDY5MzQzXSByMyA6IDAwNzY2
NTAwICByMiA6IDAwNzY2NTY1ICByMSA6IGM2NDhkMjA0ICByMCA6IDAwMDAwMDAwDQo+IFsgIDIw
OC4wNjk5MzNdIEZsYWdzOiBuekN2ICBJUlFzIG9mZiAgRklRcyBvbiAgTW9kZSBTVkNfMzIgIElT
QSBBUk0NCj4gU2VnbWVudCBub25lDQo+IFsgIDIwOC4wNzA1ODFdIENvbnRyb2w6IDEwYzUzODdk
ICBUYWJsZTogNjU5MTAwNmEgIERBQzogMDAwMDAwNTENCj4gWyAgMjA4LjA3MTEwMl0gUHJvY2Vz
cyBzaCAocGlkOiAxMjAzLCBzdGFjayBsaW1pdCA9IDB4N2MxNTc4YTkpDQo+IFsgIDIwOC4wNzE2
MTRdIFN0YWNrOiAoMHhjNWQ5MWU5OCB0byAweGM1ZDkyMDAwKQ0KPiBbICAyMDguMDcyMDEyXSAx
ZTgwOg0KPiAgICAgIDYwMDEwMDEzIGMwNGEyZjUwDQo+IFsgIDIwOC4wNzI3NDVdIDFlYTA6IGM2
NDhmYTAwIDAwMDAwMDAwIDAwMDAwMDAwIGM1YzhjNTgwIGM1Yzg4ZjAwDQo+IGMwYzA1Yzg4IDAw
MDAwMDAwIGM2NDhmYTAwDQo+IFsgIDIwOC4wNzM0NzhdIDFlYzA6IGM2NDhmYTAwIDAwMDAwMDAw
IGM1YzhjNTgwIGMwNDlhZjg0IGMwYzZmM2I0DQo+IGMwNDliMDgwIGM2NDhmYTAwIDAwMDAwMDAw
DQo+IFsgIDIwOC4wNzQyMTFdIDFlZTA6IGM2NDhmYmE4IGMwNDliZTEwIDAwMDAwMDAwIDAwMDAw
MDAwIDAwMDAwMTc4DQo+IGM2NDhmYjA0IGM2NDhmYjA0IGMwOTg4M2MwDQo+IFsgIDIwOC4wNzQ5
NDRdIDFmMDA6IDgwMTAwMDBhIGM1Yzg4ZjAwIDAwMGUwMDAzIGM1OTA3Mzk4IGM3MjBhODUwDQo+
IGM2ZTY4Y2MwIDAwMDAwMDA4IGM1Yzg4ZjA4DQo+IFsgIDIwOC4wNzU2NzddIDFmMjA6IDAwMDAw
MDAwIGMwMmI0NzZjIDAwMDAwMDAwIDAwMDAwMDAwIGM1ZDk1ODAwDQo+IGM1ZDk1YzU0IGMwY2Ix
NWI0IGM1ZDk1YzNjDQo+IFsgIDIwOC4wNzY0MTFdIDFmNDA6IGM2MzRhYTgwIDAwMDAwMDAwIDAw
MDAwMGY4IGMwMTU3Zjc4IGM1ZDk1ODAwDQo+IGM2NDBiNDAwIGM1ZDkwMDAwIGM2NDBiNDQwDQo+
IFsgIDIwOC4wNzcxNDZdIDFmNjA6IGZmZmZlMDAwIGMwMTNiZjY0IDAwMDAwODBmIGMwMTE2NWNj
IGI2ZjA5YWJjDQo+IGMwYzA1Yzg4IDAwMDAwMDAwIDAwMDAwMGY4DQo+IFsgIDIwOC4wNzc4Nzld
IDFmODA6IDAwMDAwMDAwIGMwMTNkNGI4IDAwMDAwMDAwIDAwMDAwMDA0IDAwNTAyMDFjDQo+IDAw
MDAwMGY4IGMwMTAxMjA0IGMwMTNkNTU0DQo+IFsgIDIwOC4wNzg2MTFdIDFmYTA6IDAwMDAwMDAw
IGMwMTAxMDAwIDAwMDAwMDAwIDAwMDAwMDA0IDAwMDAwMDAwDQo+IDAwMDAwMDAwIDAwNTAzMTUw
IDAwMDAwMDAwDQo+IFsgIDIwOC4wNzkzNDRdIDFmYzA6IDAwMDAwMDAwIDAwMDAwMDA0IDAwNTAy
MDFjIDAwMDAwMGY4IDAwMDAwMDAwDQo+IDAwMDAwMDAwIDAwNTAxYTc4IDAwMDAwMDAwDQo+IFsg
IDIwOC4wODAwNzddIDFmZTA6IDAwNTAxYjI4IGJlYzc5OGU0IDAwNDhlMzYwIGI2ZTY5NWU0IDIw
MDEwMDEwDQo+IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwDQo+IFsgIDIwOC4wODA4MzFdIFs8
YzAxNTNjNzA+XSAoX19jYW5jZWxfd29ya190aW1lcikgZnJvbSBbPGMwNDlhZjg0Pl0NCj4gKHJl
bGVhc2VfdHR5KzB4ODgvMHgxMDQpDQo+IFsgIDIwOC4wODE1ODVdIFs8YzA0OWFmODQ+XSAocmVs
ZWFzZV90dHkpIGZyb20gWzxjMDQ5YjA4MD5dDQo+ICh0dHlfcmVsZWFzZV9zdHJ1Y3QrMHgzNC8w
eDQwKQ0KPiBbICAyMDguMDgyMzE1XSBbPGMwNDliMDgwPl0gKHR0eV9yZWxlYXNlX3N0cnVjdCkg
ZnJvbSBbPGMwNDliZTEwPl0NCj4gKHR0eV9yZWxlYXNlKzB4NDNjLzB4NjQwKQ0KPiBbICAyMDgu
MDgzMDU2XSBbPGMwNDliZTEwPl0gKHR0eV9yZWxlYXNlKSBmcm9tIFs8YzAyYjQ3NmM+XSAoX19m
cHV0KzB4ODgvMHgyMTgpDQo+IFsgIDIwOC4wODM3MDJdIFs8YzAyYjQ3NmM+XSAoX19mcHV0KSBm
cm9tIFs8YzAxNTdmNzg+XSAodGFza193b3JrX3J1bisweGE0LzB4YzQpDQo+IFsgIDIwOC4wODQz
NTddIFs8YzAxNTdmNzg+XSAodGFza193b3JrX3J1bikgZnJvbSBbPGMwMTNiZjY0Pl0NCj4gKGRv
X2V4aXQrMHg0MzAvMHhhZWMpDQo+IFsgIDIwOC4wODUwMjldIFs8YzAxM2JmNjQ+XSAoZG9fZXhp
dCkgZnJvbSBbPGMwMTNkNGI4Pl0NCj4gKGRvX2dyb3VwX2V4aXQrMHgzYy8weGM4KQ0KPiBbICAy
MDguMDg1Njg0XSBbPGMwMTNkNGI4Pl0gKGRvX2dyb3VwX2V4aXQpIGZyb20gWzxjMDEzZDU1ND5d
DQo+IChfX3dha2VfdXBfcGFyZW50KzB4MC8weDE4KQ0KPiBbICAyMDguMDg2Mzk3XSBDb2RlOiBl
NTk1MzAwMCBlMzEzMDAwNCAxM2MzMzBmZiAwMWEwNDJhMyAoMTU5MzMwMDApDQo+IFsgIDIwOC4w
ODY5NDhdIC0tLVsgZW5kIHRyYWNlIDlhYTk1NjZlNDJiOTJmMWMgXS0tLQ0KPiBbICAyMDguMDg3
MzY3XSBGaXhpbmcgcmVjdXJzaXZlIGZhdWx0IGJ1dCByZWJvb3QgaXMgbmVlZGVkIQ0KPiANCg0K
U29ycnksIGJ1dCBJIGNhbid0IGZpbmQgYW55IHJlbGF0aW9uIGJldHdlZW4gdGhpcyBybW1vZCBn
X3NlcmlhbCBpc3N1ZSANCmFuZCBkd2MyLiBEb24ndCB0aGluayB0aGF0IGlzIGR3YzIgaXNzdWUu
DQoNClRoYW5rcywNCk1pbmFzDQoNCg0KPiBUaGUgZGlmZiBJIGFwcGxpZWQgd2FzOg0KPiANCj4g
QEAgLTY2Miw2ICs2NjIsOSBAQCBzdGF0aWMgdm9pZCBnc19jbG9zZShzdHJ1Y3QgdHR5X3N0cnVj
dCAqdHR5LA0KPiBzdHJ1Y3QgZmlsZSAqZmlsZSkNCj4gICAgICBzdHJ1Y3QgZ3NfcG9ydCAqcG9y
dCA9IHR0eS0+ZHJpdmVyX2RhdGE7DQo+ICAgICAgc3RydWN0IGdzZXJpYWwgICpnc2VyOw0KPiAN
Cj4gKyAgICBwcl9kZWJ1ZygiZ3NfY2xvc2U6IGJlZm9yZSBzcGluX3VubG9ja19pcnEgMTogdHR5
LT5kcml2ZXJfZGF0YSBpcyAlcFxuIiwNCj4gKyAgICAgICAgICAgICB0dHktPmRyaXZlcl9kYXRh
KTsNCj4gKw0KPiAgICAgIHNwaW5fbG9ja19pcnEoJnBvcnQtPnBvcnRfbG9jayk7DQo+IA0KPiAg
ICAgIGlmIChwb3J0LT5wb3J0LmNvdW50ICE9IDEpIHsNCj4gQEAgLTY4Nyw2ICs2OTAsMTAgQEAg
c3RhdGljIHZvaWQgZ3NfY2xvc2Uoc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwNCj4gc3RydWN0IGZp
bGUgKmZpbGUpDQo+ICAgICAgICAgIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KHBv
cnQtPmRyYWluX3dhaXQsDQo+ICAgICAgICAgICAgICAgICAgICAgIGdzX2Nsb3NlX2ZsdXNoX2Rv
bmUocG9ydCksDQo+ICAgICAgICAgICAgICAgICAgICAgIEdTX0NMT1NFX1RJTUVPVVQgKiBIWik7
DQo+ICsNCj4gKyAgICAgICAgcHJfZGVidWcoImdzX2Nsb3NlOiBiZWZvcmUgc3Bpbl91bmxvY2tf
aXJxIDI6DQo+IHR0eS0+ZHJpdmVyX2RhdGEgaXMgJXBcbiIsDQo+ICsgICAgICAgICAgICAgICAg
IHR0eS0+ZHJpdmVyX2RhdGEpOw0KPiArDQo+ICAgICAgICAgIHNwaW5fbG9ja19pcnEoJnBvcnQt
PnBvcnRfbG9jayk7DQo+IA0KPiAgICAgICAgICBpZiAocG9ydC0+cG9ydC5jb3VudCAhPSAxKQ0K
PiANCj4gDQo=
