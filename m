Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 322E5164429
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 13:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgBSM04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 07:26:56 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:41076 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbgBSM0z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Feb 2020 07:26:55 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 263B9C2D69;
        Wed, 19 Feb 2020 12:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1582115214; bh=l8BbWKskJuBth+3uu1ddH1H7sI1Iskfoy03xkorJSeU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=MazTNckneIt6kc0US5gfw+6ILNlOar9vXofuspJ5WjH9zKUQcgO4d1QuiBO0JZEON
         GeQkhXh0YVbMaypAeYHOnn1JhFoQKcXgN9FhWXEKGr96CufiUaKTiOmCmwQmp5vMbN
         8gPMo3CLc9aawHQP4Zje7QC3WvieTwKzHK838cLR0qTqB1JzkHvht67rTo3zzUZoo3
         Cf1aL3d4cenT80ZbAdytHbWFfLfjcl4GxSwuM9V3J8h0+ZfgtiKSbiZULj1JIMl/zV
         6ubYZVLHyhgXc8E5hgR+bWAld/rgKfbcNiNVj5ohX0GCboyBeF52YLxeHzZ7h5lUfz
         WsyTC4z4of6sw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4A35CA0079;
        Wed, 19 Feb 2020 12:26:50 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 19 Feb 2020 04:26:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 19 Feb 2020 04:26:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iW37rMS5250an9DH7f3OU7eDVF+SNpOZMCjGeVQzW9G9/d3GNnPgdheFA4jCrrTKp3CaffLgJoop7rrWg/vELEDu7xD88q5nBJeNHTD90iJzydwcwVKxvhpyFgEW41bYDB46l4JQcFwLry2D4txPdGgOQYUxHBe7gFxPsiHwooL6hYBapsu3tiLaFdFF7MoU/IVDhPRUAU5wQ5oLnKgIKWS9AY3UjpHdT6uIXVsfmOZnlgd49/O6wk71Af6YyJ+bqZCApZnzbGF7Bxpn/azv7L/tLiB8oGeYiQwLqSvCqgc+iuKPpcXGQ6vgWtpuCf/V06Xze6RNGAG4XQYtwqAOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8BbWKskJuBth+3uu1ddH1H7sI1Iskfoy03xkorJSeU=;
 b=ByYIXH6PikHXkLABdkEJ0GQ8g5dHO5n/Djucf1OswrERKcYA0YVrhDZ6TNcfbLOX9FR5ROyEFKVAQ34AEjwJGphGhWLFHVtNl0Z9l/l09deVD6Ob1HrcAR+BUeAGKmVUvVRcQTFw0WmIGhYM/g7bUfif7ZPAZdAaRrhWm9fEVjDCXFnXFTeRZJwE1SIESQPRGZ9kEcSYacdvT7FKDUHoJIYbva0pY6Rl8fkro5P2UY8R9sPkeruD/e7cYfWxN7VQxPixwy2dV0FHos+UPQboGG8k9Zo9qcqRtZFRwPsdwaA2m4S5/jXmesZ/MfQmSqXqzTWS/UmXEKI+ZEJ+WPP84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8BbWKskJuBth+3uu1ddH1H7sI1Iskfoy03xkorJSeU=;
 b=jIuSxGtFW52Ax+t6ptM/Fii6Ow6NH3LfeT1h41kSVm0WZ0c6j7h9FKFE4/4U+BRi7s4zL2oheWw4Fo/h/4uUlBiSUyxUQjCljDu5x24Gi/o5hLQ5Z4aQoC/7d/17Xcjq9oHTf/KaBCuP3k+jPmpshrBgYkqrnoBC9ysDx3gpNkw=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.27; Wed, 19 Feb 2020 12:26:49 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::35cf:644a:cfa6:72f8%7]) with mapi id 15.20.2750.016; Wed, 19 Feb 2020
 12:26:49 +0000
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
Thread-Index: AQHV4zxylJsWeUZ0JUKEDMOhhpCodKgfGkgAgAA7cgCAAA+HAIAAbA0AgAKn7gA=
Date:   Wed, 19 Feb 2020 12:26:48 +0000
Message-ID: <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com>
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
 <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
 <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
In-Reply-To: <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 4f89f236-7ce7-4a0a-44ff-08d7b536fe1c
x-ms-traffictypediagnostic: MN2PR12MB3054:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3054EB329C7DB8E3FE9911B8A7100@MN2PR12MB3054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(346002)(39860400002)(396003)(199004)(189003)(26005)(31696002)(5660300002)(81156014)(8936002)(86362001)(8676002)(31686004)(53546011)(6506007)(81166006)(478600001)(316002)(2906002)(71200400001)(110136005)(91956017)(6486002)(4326008)(66946007)(66476007)(66556008)(66446008)(64756008)(36756003)(186003)(6512007)(2616005)(76116006)(54906003)(473944003);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3054;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: achnMXyr2Xd9EZu1WTRAqhR946DiJehGH5+t9AX3AGDVWTtK+695wUfHtxueaYhS5Kz7oMAsAuVb4hDBnZq4uULgr23wiy7buL/TtQ8nxxLq0kTXrzDkq5WAmbAONKn4KtopaNts7crgWaZ+xTxMalM3EVl0L6LDWeppf+EmioLJWGs0BsKOhpnQw4SOPNYhhRMPmveQRwZShEyr1Kxx20E8rvVQsXgL6cSoWZsykjVyTHLIhHSOcHl7bTW6YhCNzrhoiG5qPXxHsH9bW5RWB51epoOe02lZdF1/dqX5F/NcDhkvQgoudJrNOes9vjDMCNzyBMIjqE+Q4864axX3Mtw9pOWaiB9YhqGy465FB4J5gZ5fT2yK1LxxxctevYJt0E5Tl/A/mP3Rpt1tSdzRpf917xoQsUq4MYvcI4Gijz6d0LHk8JvKhPrd0vXLe8SaydrAOB5fvhg9X+WSRFQwtcwiwkxKexpT6pM5jyxL42s485XkQOxM7ZgK6RbLPQoe
x-ms-exchange-antispam-messagedata: tEAWmBB1p0hW/c4Obw3Si6TzAqFx5vDdNEn5FFZF6phJJGo1aY98Cc6OU/6z6ThiUeNsmq3baD/Dja/7ypg4MaH7WNyW7wE4f8ssqAeXTBiila5TZY62Y6lU2dYD/3yG6j50wJBgLyVadsvjJrn65g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB4A495D0FAB8F4B8E8A14B2D3F04515@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f89f236-7ce7-4a0a-44ff-08d7b536fe1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 12:26:48.8936
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y06/r9cojMzxyuGnMVjji2vH7A8j/E+Se5InLXtWfwe7MSnbSu/L1Ctjse5C6tcHfC/rCBKPoucXBsGwQrqElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3054
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT3RhdmlvLA0KDQpPbiAyLzE3LzIwMjAgMTE6NTMgUE0sIE90YXZpbyBTYWx2YWRvciB3cm90
ZToNCj4gSGVsbG8gTWluYXMsDQo+IA0KPiBPbiBNb24sIEZlYiAxNywgMjAyMCBhdCAxMDoyNiBB
TSBNaW5hcyBIYXJ1dHl1bnlhbg0KPiA8TWluYXMuSGFydXR5dW55YW5Ac3lub3BzeXMuY29tPiB3
cm90ZToNCj4+IEVuYWJsZSBkZWJ1ZyBwcmludHMgdG8gZ2V0IGZ1bGwgZHdjMiBkZWJ1ZyBwcmlu
dHMgdG8gc2VlIHdoYXQgaGFwcGVuDQo+PiB3aXRoIGR3YzIuDQo+IA0KDQo+IFsgMTA1NC41Mjk3
NzRdIGR3YzIgMzAxODAwMDAudXNiOiBlcDAgc3RhdGU6MA0KPiBbIDEwNTQuNTI5Nzg1XSBkd2My
IDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19zdGFydF9yZXE6IER4RVBDVEw9MHg4NDA4ODIwMA0K
PiBbIDEwNTQuNTI5ODAxXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oc290Z19zdGFydF9yZXE6
IERYRVBDVEw9MHg4MDA4ODIwMA0KPiBbIDEwNTQuNTI5OTI4XSBkd2MyIDMwMTgwMDAwLnVzYjog
ZXAyb3V0OiByZXEgMjZiZDliOWY6IDUxMkAwNmI3ZGJjYSwNCj4gbm9pPTAsIHplcm89MCwgc25v
az0wDQo+IFsgMTA1NC41MzcwOTVdIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hzb3RnX2lycTog
MDQwMDg0MjggMDAwMDA0MDANCj4gKGQ4OGMzY2M0KSByZXRyeSA4DQo+IFsgMTA1NC41MzcxMTld
IGR3YzIgMzAxODAwMDAudXNiOiBHSU5UU1RTX0VybHlTdXNwDQo+IFsgMTA1NC41NDAxNDddIGR3
YzIgMzAxODAwMDAudXNiOiBnaW50c3RzPTA0MDA4ODI4ICBnaW50bXNrPWQ4OGMzY2M0DQo+IFsg
MTA1NC41NDAxNzJdIGR3YzIgMzAxODAwMDAudXNiOiBVU0IgU1VTUEVORA0KPiBbIDEwNTQuNTQw
MTkxXSBkd2MyIDMwMTgwMDAwLnVzYjogZHdjMl9oYW5kbGVfdXNiX3N1c3BlbmRfaW50cjogRFNU
Uz0weDVhZDgwMQ0KPiBbIDEwNTQuNTQwMjExXSBkd2MyIDMwMTgwMDAwLnVzYjogRFNUUy5TdXNw
ZW5kIFN0YXR1cz0xIEhXQ0ZHNC5Qb3dlcg0KPiBPcHRpbWl6ZT0xIEhXQ0ZHNC5IaWJlcm5hdGlv
bj0wDQo+IFsgMTA1NC41NDAyNDJdIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hzb3RnX2lycTog
MDQwMDgwMjggMDAwMDAwMDANCj4gKGQ4OGMzY2M0KSByZXRyeSA4DQo+IFsgMTA1NC41ODU0MDJd
IGR3YzIgMzAxODAwMDAudXNiOiBlcDFpbjogcmVxIDAxZWZmMzFiOiAzNTNAYmY4ZDYyZDgsDQo+
IG5vaT0wLCB6ZXJvPTEsIHNub2s9MA0KPiBbIDEwNTQuNTg1NDIyXSBkd2MyIDMwMTgwMDAwLnVz
YjogZHdjMl9oc290Z19lcF9xdWV1ZTogc3VibWl0IHJlcXVlc3QNCj4gb25seSBpbiBhY3RpdmUg
c3RhdGUNCj4gWyAxMDU0LjY2MTY2N10gZHdjMiAzMDE4MDAwMC51c2I6IGR3YzJfaHNvdGdfaXJx
OiAwNDAwODQyOCAwMDAwMDQwMA0KPiAoZDg4YzNjYzQpIHJldHJ5IDgNCj4gWyAxMDU0LjY2MTY5
NF0gZHdjMiAzMDE4MDAwMC51c2I6IEdJTlRTVFNfRXJseVN1c3ANCj4gWyAxMDU0LjY2NDcxNV0g
ZHdjMiAzMDE4MDAwMC51c2I6IGdpbnRzdHM9MDQwMDg4MjggIGdpbnRtc2s9ZDg4YzNjYzQNCj4g
WyAxMDU0LjY2NDc0MV0gZHdjMiAzMDE4MDAwMC51c2I6IFVTQiBTVVNQRU5EDQo+IFsgMTA1NC42
NjQ3NjBdIGR3YzIgMzAxODAwMDAudXNiOiBkd2MyX2hhbmRsZV91c2Jfc3VzcGVuZF9pbnRyOiBE
U1RTPTB4NWFkODAxDQo+IFsgMTA1NC42NjQ3ODFdIGR3YzIgMzAxODAwMDAudXNiOiBEU1RTLlN1
c3BlbmQgU3RhdHVzPTEgSFdDRkc0LlBvd2VyDQo+IA0KDQpBY3R1YWxseSwgSSBkb24ndCBzZWUg
YW55IGlzc3VlIHdpdGggZHdjMiBmcm9tIHRoZSBsb2cuIE9ubHkgbm90IGNsZWFyIA0Kd2h5IFNV
U1BFTkQgaGFwcGVuIGhlYXIuIElzIGl0IGJlY2F1c2Ugb2YgZGlzY29ubmVjdC9jb25uZWN0IG9y
IA0KcmVsb2FkaW5nIGdfc2VyaWFsPw0KSXMgdGhpcyBsb2cgcmVjb3JkZWQgd2hlbiBpc3N1ZSBz
ZWVuPw0KQW55d2F5LCBiZWZvcmUgU1VTUEVORCBhbmQgYWZ0ZXIgZHdjMiBzdWNjZXNzZnVsbHkg
cGVyZm9ybSB0cmFuc2ZlcnMgb24gDQphbGwgRVAncyAtIGVwMWluIGJ1bGssIGVwMm91dCBidWxr
IGFuZCBlcDNpbiBpbnRlcnJ1cHQuDQpDYW4geW91IHByb3ZpZGUgZG1lc2cgd2l0aCBkd2MyIGRl
YnVnIHByaW50cyB3aXRoIGV4Y2VwdGlvbiBjYXNlIGluc2lkZS4NCg0KPiBJcyB0aGlzIGluZm9y
bWF0aW9uIHlvdSBuZWVkPyBJZiBuZWVkIHdlIGNhbiBnYXRoZXIgbW9yZSBpbmZvLg0KPiANCg0K
DQpUaGFua3MsDQpNaW5hcw0K
