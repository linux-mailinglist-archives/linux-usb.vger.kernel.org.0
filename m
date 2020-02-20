Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5B4165817
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 07:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgBTG7J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 01:59:09 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:59916 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726248AbgBTG7I (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 01:59:08 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A7F29C106E;
        Thu, 20 Feb 2020 06:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1582181947; bh=oCK24gEidqX/vIaX4VybaTgxY5DH4BJpI469po/dAoA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=d6i/e3Q+qhF3Du4sBfdfiVtae38Ncorh2hLlKseVdzOhKH3uKWIHpwS67u3wN80PL
         nLwuzusduTNevPP2Hbr3FvS0StlDKcEQ/wcbkEo5Vzc2pd/zleRuizQdmBoS61N4B6
         CaixBXO6yNwwNqIyvFUyLsfpY3eQn7bgAi1qBrZKLOi/9NmCC1mnC32Ja0xjnhW18R
         YclzzhX0AVg8nNJ9WQoADL1YAECuEc+GsFJzzoRZOW/iP8Vslx8kx18AD061euOYBM
         WIH+CCe4AH9Qe0ih532+cgYrrlcy8lfH5Udc5MnjzOp0uiTRgXUCLKcT+HyJNhrZsc
         kcZNiMZ0QwZpA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CC2FDA00AC;
        Thu, 20 Feb 2020 06:59:03 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 19 Feb 2020 22:59:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 19 Feb 2020 22:59:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M1dgCvxXfz4jPJcgK+5AiQDtJ8cMdbnSiGG+vu9FnAoJmEtKxbYwO0GFODJ45V4eadMWJY7CctRNG0CmkSdD4nxNanb5QlWXYHg/DAWXTl7DpUJZftsCFng1QV3Fr512qqbr5iFqyGmC5YBSBcTAdHyBPjM/HEhXL/LbCQKhvnDymPDX06aRXVTwRAzAZQVT7eFeVwWNrv2VQrOpgjLLbqcZY/cOK/idrM49CGXAv/UfugcD+pcMrIxZc1c3I8lfodS1qy9dlumM2ACQ5UzENZ2O8xKawEwpWHJ9L9xtQKcn5cO/KKN4znkJ7jQjWbcma/dLl21AUJgBClkdW7FeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCK24gEidqX/vIaX4VybaTgxY5DH4BJpI469po/dAoA=;
 b=Bd4kxkl81VRCokLjjS7AMpNeahwXZ7Fj75bBxWzT1T0J0muOQfneFKKqz058nIMBAgSAD7uJDe5ejckLh46zS0gEvMDcdEmr4Xamv36jCWRH2iMmBwPhjfQeSrtQVL/Ar2bcCQRa8+j2IlTDdJ1L8U/rzBs6zv6j1IaznAzo5HDBculfNPBKTiM8euvQxOLQvbmeoRndb+zUJDphlrJ/SS4yA/JCrZ/vVoI4TT24mhzIQKPnuVkUDGv+c+Aqnd2AFgK1x2ZVU294T8thb2QrGy4veTruqFThwQfbSXHf6eP69akruSAtKlWkgHHk5IEsj+Bo2oLG9gWaj1KeakFIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCK24gEidqX/vIaX4VybaTgxY5DH4BJpI469po/dAoA=;
 b=hM5PXgngUZyOCLP4hhWTE16TiXGYoHPZHYfowE1j+DSfFDQ8p2fza56SEzyT68gzo+yIrLNrkZzniVBOuR7l3NIoopvs92JimI/ZoEgIgbdkhDcCh8P/EhpZB8iKIioKmaTCBeII4bbJlHd0NRVWn4i3vDuU3ROj7LCyUKhsLtk=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3264.namprd12.prod.outlook.com (20.179.83.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Thu, 20 Feb 2020 06:59:01 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2750.016; Thu, 20 Feb 2020
 06:59:00 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
Thread-Topic: USB DWC2 stops responding when insert/remove cable multiple
 times
Thread-Index: AQHV4zxylJsWeUZ0JUKEDMOhhpCodKgfGkgAgAA7cgCAAA+HAIAAbA0AgAKn7gCAAC2+gIABCQCA
Date:   Thu, 20 Feb 2020 06:59:00 +0000
Message-ID: <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com>
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
 <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
 <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com>
 <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
In-Reply-To: <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 620b363f-83e2-492f-1b42-08d7b5d25ce3
x-ms-traffictypediagnostic: MN2PR12MB3264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3264BC3C93F42103E3546435A7130@MN2PR12MB3264.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:773;
x-forefront-prvs: 031996B7EF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(136003)(376002)(396003)(39830400003)(199004)(189003)(2906002)(5660300002)(31686004)(2616005)(966005)(66476007)(64756008)(66446008)(91956017)(66946007)(478600001)(6512007)(76116006)(66556008)(81166006)(36756003)(81156014)(8676002)(71200400001)(6486002)(8936002)(86362001)(110136005)(54906003)(31696002)(316002)(4326008)(6506007)(53546011)(186003)(26005)(473944003);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3264;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IlFA93KDcaKKTeUAqJ+3aIu7AfTHF+h/f0aDMn9jHrExTLyMw5gUsyis3ouay9FMPp76+xAqsSq5FABbXP4y/o1m0116qo/D3yZWlOwmyx7YxabIfjy+gXDf0ciV39oYf3KnQZdyoyunZaeYuHV6ikCwCHO88irjdBGsnT16GqA6pYWMVqRx6vVRAlMfNwlbXDhPoaekeirFiazHyKCQc/P4l2BiWLdWBLNuZzb5G1LwslHu3pW8FmKKEwUHs36jGMRATZnPM2mZ0cD0x+6SSNZgpp2ZLQRVgIZKKHvF3CpSaGx3TVGuChvzVod7Kd1EjQrBC7Q9KkS7OeeYrjnZD0zPMiMm3oobr5orae93Q6wHS+VbRP9pL1eddUckqrRsGLMCT8mYiXcYOHDTTr8B1eLEH84RtW9boOv6u4iTJ6IeOWmdn06msZC4k7o42gxjca9lzfRrEVZ+DW9mt0qM1JWiFfuur1RhnvKdxK5AEdYmUJlnW5yiO/3yVOmXM1ol8uejm72tS71fd4NulKhiitMOBs3U+LRSKSZqGGy4k+jIePVlma99POwrJINFqjg1
x-ms-exchange-antispam-messagedata: 6eyFDOuX1NHLLsr0+Bc6azG04unycV5Fr18zAXg6nb3cgYYsGAhrb+VcgpPuAyKBFG7VyuKECEQqbDdtAv+HARyn/jbNlp1FFl3AeRXNCE6XOvIDxTf72l/rYZXg7bMV3bw5W0DcrlYZTRMaVrKnOA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <A16150286B7E9F479217619807D79E2F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 620b363f-83e2-492f-1b42-08d7b5d25ce3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2020 06:59:00.0350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VE69EcuwMm8W1kJn5mR1w1hxFU3M4BPONNzSjvaOP7ItR2mvkotBmc1xHeUb7nM1pocvm8UYYk7QDg0U5jMEAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3264
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT3RhdmlvLA0KDQoNCk9uIDIvMTkvMjAyMCA3OjEwIFBNLCBPdGF2aW8gU2FsdmFkb3Igd3Jv
dGU6DQo+IEhlbGxvIE1pbmFzLA0KPiANCj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQgOToyNiBB
TSBNaW5hcyBIYXJ1dHl1bnlhbg0KPiA8TWluYXMuSGFydXR5dW55YW5Ac3lub3BzeXMuY29tPiB3
cm90ZToNCj4+IE9uIDIvMTcvMjAyMCAxMTo1MyBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3RlOg0K
Pj4+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDEwOjI2IEFNIE1pbmFzIEhhcnV0eXVueWFuDQo+
Pj4gPE1pbmFzLkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4gd3JvdGU6DQo+Pj4+IEVuYWJsZSBk
ZWJ1ZyBwcmludHMgdG8gZ2V0IGZ1bGwgZHdjMiBkZWJ1ZyBwcmludHMgdG8gc2VlIHdoYXQgaGFw
cGVuDQo+Pj4+IHdpdGggZHdjMi4NCj4+DQo+Pj4gWyAxMDU0LjUyOTc3NF0gZHdjMiAzMDE4MDAw
MC51c2I6IGVwMCBzdGF0ZTowDQo+Pj4gWyAxMDU0LjUyOTc4NV0gZHdjMiAzMDE4MDAwMC51c2I6
IGR3YzJfaHNvdGdfc3RhcnRfcmVxOiBEeEVQQ1RMPTB4ODQwODgyMDANCj4+PiBbIDEwNTQuNTI5
ODAxXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19zdGFydF9yZXE6IERYRVBDVEw9MHg4
MDA4ODIwMA0KPj4+IFsgMTA1NC41Mjk5MjhdIGR3YzIgMzAxODAwMDAudXNiOiBlcDJvdXQ6IHJl
cSAyNmJkOWI5ZjogNTEyQDA2YjdkYmNhLA0KPj4+IG5vaT0wLCB6ZXJvPTAsIHNub2s9MA0KPj4+
IFsgMTA1NC41MzcwOTVdIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hzb3RnX2lycTogMDQwMDg0
MjggMDAwMDA0MDANCj4+PiAoZDg4YzNjYzQpIHJldHJ5IDgNCj4+PiBbIDEwNTQuNTM3MTE5XSBk
d2MyIDMwMTgwMDAwLnVzYjogR0lOVFNUU19Fcmx5U3VzcA0KPj4+IFsgMTA1NC41NDAxNDddIGR3
YzIgMzAxODAwMDAudXNiOiBnaW50c3RzPTA0MDA4ODI4ICBnaW50bXNrPWQ4OGMzY2M0DQo+Pj4g
WyAxMDU0LjU0MDE3Ml0gZHdjMiAzMDE4MDAwMC51c2I6IFVTQiBTVVNQRU5EDQo+Pj4gWyAxMDU0
LjU0MDE5MV0gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaGFuZGxlX3VzYl9zdXNwZW5kX2ludHI6
IERTVFM9MHg1YWQ4MDENCj4+PiBbIDEwNTQuNTQwMjExXSBkd2MyIDMwMTgwMDAwLnVzYjogRFNU
Uy5TdXNwZW5kIFN0YXR1cz0xIEhXQ0ZHNC5Qb3dlcg0KPj4+IE9wdGltaXplPTEgSFdDRkc0Lkhp
YmVybmF0aW9uPTANCj4+PiBbIDEwNTQuNTQwMjQyXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9o
c290Z19pcnE6IDA0MDA4MDI4IDAwMDAwMDAwDQo+Pj4gKGQ4OGMzY2M0KSByZXRyeSA4DQo+Pj4g
WyAxMDU0LjU4NTQwMl0gZHdjMiAzMDE4MDAwMC51c2I6IGVwMWluOiByZXEgMDFlZmYzMWI6IDM1
M0BiZjhkNjJkOCwNCj4+PiBub2k9MCwgemVybz0xLCBzbm9rPTANCj4+PiBbIDEwNTQuNTg1NDIy
XSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19lcF9xdWV1ZTogc3VibWl0IHJlcXVlc3QN
Cj4+PiBvbmx5IGluIGFjdGl2ZSBzdGF0ZQ0KPj4+IFsgMTA1NC42NjE2NjddIGR3YzIgMzAxODAw
MDAudXNiOiBkd2MyX2hzb3RnX2lycTogMDQwMDg0MjggMDAwMDA0MDANCj4+PiAoZDg4YzNjYzQp
IHJldHJ5IDgNCj4+PiBbIDEwNTQuNjYxNjk0XSBkd2MyIDMwMTgwMDAwLnVzYjogR0lOVFNUU19F
cmx5U3VzcA0KPj4+IFsgMTA1NC42NjQ3MTVdIGR3YzIgMzAxODAwMDAudXNiOiBnaW50c3RzPTA0
MDA4ODI4ICBnaW50bXNrPWQ4OGMzY2M0DQo+Pj4gWyAxMDU0LjY2NDc0MV0gZHdjMiAzMDE4MDAw
MC51c2I6IFVTQiBTVVNQRU5EDQo+Pj4gWyAxMDU0LjY2NDc2MF0gZHdjMiAzMDE4MDAwMC51c2I6
IGR3YzJfaGFuZGxlX3VzYl9zdXNwZW5kX2ludHI6IERTVFM9MHg1YWQ4MDENCj4+PiBbIDEwNTQu
NjY0NzgxXSBkd2MyIDMwMTgwMDAwLnVzYjogRFNUUy5TdXNwZW5kIFN0YXR1cz0xIEhXQ0ZHNC5Q
b3dlcg0KPj4+DQo+Pg0KPj4gQWN0dWFsbHksIEkgZG9uJ3Qgc2VlIGFueSBpc3N1ZSB3aXRoIGR3
YzIgZnJvbSB0aGUgbG9nLiBPbmx5IG5vdCBjbGVhcg0KPj4gd2h5IFNVU1BFTkQgaGFwcGVuIGhl
YXIuIElzIGl0IGJlY2F1c2Ugb2YgZGlzY29ubmVjdC9jb25uZWN0IG9yDQo+PiByZWxvYWRpbmcg
Z19zZXJpYWw/DQo+PiBJcyB0aGlzIGxvZyByZWNvcmRlZCB3aGVuIGlzc3VlIHNlZW4/DQo+IA0K
PiBZZXMsIHRoZSBsb2cgd2FzIHJlY29yZGVkIGhvd2V2ZXIgd2UgZGlkIG5vdCByZWxvYWQgdGhl
IGdfc2VyaWFsDQo+IG1vZHVsZS4gU28gd2hlbiB3ZSBnYXRoZXJlZCB0aGUgbG9ncywgaXQgd2Fz
IHN0dWNrLg0KPiANCj4+IEFueXdheSwgYmVmb3JlIFNVU1BFTkQgYW5kIGFmdGVyIGR3YzIgc3Vj
Y2Vzc2Z1bGx5IHBlcmZvcm0gdHJhbnNmZXJzIG9uDQo+PiBhbGwgRVAncyAtIGVwMWluIGJ1bGss
IGVwMm91dCBidWxrIGFuZCBlcDNpbiBpbnRlcnJ1cHQuDQo+PiBDYW4geW91IHByb3ZpZGUgZG1l
c2cgd2l0aCBkd2MyIGRlYnVnIHByaW50cyB3aXRoIGV4Y2VwdGlvbiBjYXNlIGluc2lkZS4NCj4g
DQo+IFRoZSBsb2cgSSBzZW50IHdhcyB0YWtlbiB3aXRoOg0KPiANCj4gMSkgYm9vdCBkZXZpY2UN
Cj4gMikgcmFuICdkbWVzZyAtYycgc28gd2UgY2xlYW5lZCB0aGUgb2xkIG1lc3NhZ2VzDQo+IDMp
IGNhdXNlIHRoZSBsb2NrIHVwIHRvIGhhcHBlbg0KPiA0KSBnYXRoZXIgZG1lc2cgb3V0cHV0DQo+
IA0KPiBXaGF0IHNlcXVlbmNlIGRvIHlvdSB3YW50IHVzIHRvIGRvPw0KDQpZZXMuIENhbiB5b3Ug
cHJvdmlkZSBhbHNvIFVTQiB0cmFjZT8NCg0KVGhhbmtzLA0KTWluYXMNCg0KDQo+IC0tDQo+IE90
YXZpbyBTYWx2YWRvciAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTy5TLiBTeXN0ZW1zDQo+
IGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwLTNBX193d3cu
b3NzeXN0ZW1zLmNvbS5iciZkPUR3SUJhUSZjPURQTDZfWF82SmtYRng3QVhXcUIwdGcmcj02ejlB
bDlGckhSX1pxYmJ0U0FzRDE2cHZPTDJTM1hIeFFuU3pxOGt1c3lJJm09TFJabWpVQ19Sc3FJMUt5
OUEwU2tmQ3FpY3NEa0NvSG5Hblh0dHdVbFhlYyZzPTgxNXItZDNCWGtGRkp0SUIyRVE4T0EyZmNy
Nm9vTkVwYllmdm9BUmJEM3MmZT0gICAgICAgICBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2lu
dC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fY29kZS5vc3N5c3RlbXMuY29tLmJyJmQ9RHdJQmFRJmM9
RFBMNl9YXzZKa1hGeDdBWFdxQjB0ZyZyPTZ6OUFsOUZySFJfWnFiYnRTQXNEMTZwdk9MMlMzWEh4
UW5TenE4a3VzeUkmbT1MUlptalVDX1JzcUkxS3k5QTBTa2ZDcWljc0RrQ29IbkduWHR0d1VsWGVj
JnM9TzFwc3JwX2NjVDFGNkg2NzhyNTBISWQxY1duNmc4VXhLV3N0Wl9rQnpPOCZlPQ0KPiBNb2Jp
bGU6ICs1NSAoNTMpIDkgOTk4MS03ODU0ICAgICAgICAgIE1vYmlsZTogKzEgKDM0NykgOTAzLTk3
NTANCj4gDQo=
