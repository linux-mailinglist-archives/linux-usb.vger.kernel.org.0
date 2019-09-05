Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8E67AAB98
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 20:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388688AbfIES5S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 14:57:18 -0400
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]:42796 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387994AbfIES5R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 14:57:17 -0400
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C90E4C035E;
        Thu,  5 Sep 2019 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1567709837; bh=Wi0oFQHHcb0PSkJHFKE8qIIlmhsXdKqY6cU6nM/h5h4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Puz7EnvIRc7b1nkIpBusmXiAh4z+kn54RH5OXOXBKVW7CRMEWzjdtYVHxvUP1bIxn
         KWaCfRQww5sGId59dzpdnbC0l/13tOcU02EdZP7zAzkwGR34NKs4zYUdbsZsZINQGv
         yaH1HLAQiXJe58dhN0bFTJMGkI2bx/HohoPLMVLehAjJwoKe9Hz++74dmxrWi5ySab
         98Y2qizsEd9B3Qe5Lr84mam+KSLCK1q5Ky/l+wdZuvNjLdaqxX5+ZDQP1bWglnpbYA
         qL4vS1qyg4rsipsTPU+9IMw+xrzECm3NtHpH3tlVbYdBBIffdb4fJzV1QBTdiod/30
         VjTbNNPpbYMEg==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 869DFA0091;
        Thu,  5 Sep 2019 18:57:16 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 5 Sep 2019 11:57:15 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 5 Sep 2019 11:57:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlRjQ4IKzEvf3OAF/k2ogzWxN0sYvYHY5NUDqVjw9Tr3nTHBrxmYalKe90RSC+mJ9GUMNMF54dvL+VafcouwNcGr0aCWF7/jJSohxsGinMznItld4Mu0389YL35cRaPnZ0nsMgsCCY9p9O8q0zgpXGfL3t0niv8Ai6DazKtcDmbGFX4b/wQc5RUjGoL0tknihwxJBsXCjQ4fkQk482yg92NDkA8HolmCx6wCNVyeHsWAlMTyzFMYjNiuXJ0xmgKBg6HDbJ7Pk8DWTu6M0JGDuwuusS2kppR9VyNKatR2PBfSfS+McXHHFNmPWKMptdm3tZ7KIn2FXrSEwjfeuASo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi0oFQHHcb0PSkJHFKE8qIIlmhsXdKqY6cU6nM/h5h4=;
 b=V8n/6UNnqjObKK/JPSqFw7B51Yrr4T2WL3y2tCKk/MWxnAW9jOCfPK6k/4Bz2zszT1JgbkgnrmostBslC4HYnqOAG6C+EciLttyQCzm7QW4Zzktg7jg5ND4GVOIJ5eP8GSGqXx3tNV5wMFNICqbyb43hhRDWv50Hjp6LfY3n+DgjMUlH7Jn8Kng4+dLHCEf4mofTYUK5fTLEi/qSymfFxj86pJ+xwsq2i17hyQhMvBIdB1JcCi0M93qklrlWQcBxgV5eUZEQzBypp7QfcDlZiY4L7/L+Ixtp+Q5aHEQJ+gjYw43HMdC0k5119eaJ3Xo6hJu6GLRD0xyGCvTEn4FLzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi0oFQHHcb0PSkJHFKE8qIIlmhsXdKqY6cU6nM/h5h4=;
 b=jEeiALvP4CaPglJfouNWsWmWDQyOFbKpwOloO5tuoxqr+jZCf5S12GcrjYyYOTclMKh6/tdEals6HuxZRpkPoKZs0p9xgESp7u8mLGddz43wT6e1ofGkQvwNf+bIOmJ1e9fY5tt3pZqf+DyoRMI6EIJRBiUBzvb5OW6Vnkcmwuk=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0072.namprd12.prod.outlook.com (10.172.77.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Thu, 5 Sep 2019 18:57:14 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::9fa:c9b6:7dfa:9192]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::9fa:c9b6:7dfa:9192%9]) with mapi id 15.20.2241.014; Thu, 5 Sep 2019
 18:57:14 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Roman Kapl <rka@sysgo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: dwc3: reset the address and run_stop on init
Thread-Topic: [PATCH] usb: dwc3: reset the address and run_stop on init
Thread-Index: AQHVY9B3vveGFpGDJ0qXi6rKKNTaCKcdb9QA
Date:   Thu, 5 Sep 2019 18:57:14 +0000
Message-ID: <14b0d784-e172-7c22-8804-a9e7035d970f@synopsys.com>
References: <20190905095151.26590-1-rka@sysgo.com>
In-Reply-To: <20190905095151.26590-1-rka@sysgo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4406ea1-f61e-431a-cf5e-08d73232ddb3
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB0072;
x-ms-traffictypediagnostic: CY4PR1201MB0072:
x-microsoft-antispam-prvs: <CY4PR1201MB00724A10C7F1BDFCF9D5100BAABB0@CY4PR1201MB0072.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 015114592F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(346002)(396003)(376002)(136003)(366004)(199004)(189003)(5660300002)(6506007)(71190400001)(6246003)(476003)(71200400001)(102836004)(66556008)(2906002)(66476007)(66946007)(478600001)(76116006)(14454004)(76176011)(86362001)(11346002)(446003)(64756008)(31696002)(66446008)(2501003)(486006)(2616005)(316002)(186003)(4326008)(25786009)(36756003)(66066001)(26005)(305945005)(6512007)(6486002)(229853002)(7736002)(8936002)(99286004)(256004)(8676002)(6436002)(81156014)(110136005)(53936002)(54906003)(31686004)(3846002)(81166006)(6116002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0072;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pSsSt0Hz1JhdQUUJG8VaynoXLbRKVlL+K2uIBV5ULn01Z6twq2QTquLgiqnJaY3bT9IcFv+dXmsQd8F9/QX+74CPNb0sqpXSBXkjzsmHghdUutXcwmf3oypGFsk3A4pjJIfEcDCGVKuXdxBlQ3fux7DxqGphQ0wION2aTfYdkR5ge1sP5wnylN5lObKUM7PnsBsrrOCLPcE2iQRrQTjyusQUewKbxzEGlw7PxLIXqn2pea1NxiFs4mq82O58pP+4nTpxP+HmWMQOu1g4h6vaFIWrYmwgaXMuvsOkVD9dGJdEjiBgAgmCf/bJ1eCel8pSQm7EqorH2ObmngKvxtvJ5i0Oo/YuHQtG7v+WtCaG6lXXSEi2E3snUrfR5Zrx22oOPTGkDhL3etedNdJ8KTsTHtXIwYwI9/Hc5xdVscOllwk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9C4C3C7EE7622247B532FAEB3437177E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e4406ea1-f61e-431a-cf5e-08d73232ddb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2019 18:57:14.4787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k8ltBTzzA89yUpWIKge7h2cwBbjVT7QWBjiRX9+OK0iIvVgV5OybdM1HHzGEBlfmDwXW29GXQzo/Bhin9GtGzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0072
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClJvbWFuIEthcGwgd3JvdGU6DQo+IFRoZSBhZGRyZXNzIHNob3VsZCBiZSBzZXQgdG8g
emVybyBkdXJpbmcgcmVzZXQgYWNjb3JkaW5nIHRvIHRoZQ0KPiBkb2N1bWVudGF0aW9uLg0KDQpU
aGF0IGlzIGZvciB1c2IgcmVzZXQgYW5kIG5vdCBjb3JlIHNvZnQgcmVzZXQsIGFuZCBkd2MzIGFs
cmVhZHkgaGFuZGxlcyANCnRoYXQgY2FzZS4NCg0KPiBDbGVhcmluZyBSdW5TdG9wIGVuc3VyZXMg
dGhhdCB0aGUgaG9zdCBkaXNjb25uZWN0cyBmcm9tDQo+IHRoZSBkZXZpY2UgKGl0IHdhcyBub3Qg
Y2xlYXJlZCBieSBDU0ZUUlNULCBhdCBsZWFzdCBvbiBsczEwNDMpLg0KPg0KPiBUaGlzIGFsbG93
cyB0aGUgZHdjMyB0byBwcm9wZXJseSBpbml0aWFsaXplIGV2ZW4gaWYgdGhlIHByZXZpb3VzDQo+
IGRyaXZlciBkaWQgbm90IHNodXRkb3duIHRoZSBkZXZpY2UgKGUuZy4gd2hlbiB1c2luZyB2aXJ0
dWFsaXphdGlvbikuDQoNClRoaXMgc291bmRzIGxpa2UgYSB3b3JrYXJvdW5kIHRvIHNvbWUgaXNz
dWUgdGhhdCB0aGUgZnVuY3Rpb24gZHJpdmVyIGRpZCANCm5vdCBoYW5kbGUuDQoNCj4gU2lnbmVk
LW9mZi1ieTogUm9tYW4gS2FwbCA8cmthQHN5c2dvLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy91
c2IvZHdjMy9jb3JlLmMgfCA1ICsrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2ZXJz
L3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCBjOWJiOTNhMmM4MWUuLmM2MzNmNWUwNjIxZCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMNCj4gQEAgLTI1MCw2ICsyNTAsNyBAQCBzdGF0aWMgaW50IGR3YzNfY29yZV9z
b2Z0X3Jlc2V0KHN0cnVjdCBkd2MzICpkd2MpDQo+ICAgDQo+ICAgCXJlZyA9IGR3YzNfcmVhZGwo
ZHdjLT5yZWdzLCBEV0MzX0RDVEwpOw0KPiAgIAlyZWcgfD0gRFdDM19EQ1RMX0NTRlRSU1Q7DQo+
ICsJcmVnICY9IH5EV0MzX0RDVExfUlVOX1NUT1A7DQo+ICAgCWR3YzNfd3JpdGVsKGR3Yy0+cmVn
cywgRFdDM19EQ1RMLCByZWcpOw0KPiAgIA0KPiAgIAlkbyB7DQo+IEBAIC0yNjYsNiArMjY3LDEw
IEBAIHN0YXRpYyBpbnQgZHdjM19jb3JlX3NvZnRfcmVzZXQoc3RydWN0IGR3YzMgKmR3YykNCj4g
ICAJcmV0dXJuIC1FVElNRURPVVQ7DQo+ICAgDQo+ICAgZG9uZToNCj4gKwlyZWcgPSBkd2MzX3Jl
YWRsKGR3Yy0+cmVncywgRFdDM19EQ0ZHKTsNCj4gKwlyZWcgJj0gfihEV0MzX0RDRkdfREVWQURE
Ul9NQVNLKTsNCj4gKwlkd2MzX3dyaXRlbChkd2MtPnJlZ3MsIERXQzNfRENGRywgcmVnKTsNCj4g
Kw0KPiAgIAkvKg0KPiAgIAkgKiBGb3IgRFdDX3VzYjMxIGNvbnRyb2xsZXIsIG9uY2UgRFdDM19E
Q1RMX0NTRlRSU1QgYml0IGlzIGNsZWFyZWQsDQo+ICAgCSAqIHdlIG11c3Qgd2FpdCBhdCBsZWFz
dCA1MG1zIGJlZm9yZSBhY2Nlc3NpbmcgdGhlIFBIWSBkb21haW4NCg0KQlIsDQpUaGluaA0K
