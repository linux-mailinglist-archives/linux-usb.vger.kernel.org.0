Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 172B1112131
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 02:56:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfLDB4M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 20:56:12 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:41504 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726179AbfLDB4M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 20:56:12 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C031B402A1;
        Wed,  4 Dec 2019 01:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1575424570; bh=+SiBAF66bG5smcPlcbV8HSuPlf+CNBVsmmJzIpUjQXE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Bva8MN9wXNy9h5EMTV8aMh3StwhPdyOKJpYsnnu7QYN9v4UHp7Y20TLnyLKHAqkjh
         rUrXhJoBb38/eseIOuiX7j+2qu70lTDHLRxc7JkC6RTNFNcC0agk0552zNIkupopU0
         d1QtZDoYbwQHoO5caxrVi9Ppa8Qws6UyAhbOgYbuC8GAzKq96wu1eoQNabDFLUVr4l
         to2rO9L6Q9Vc7GWMSpprXi/VvtpphtmhwxG8fsYlIYSZKLr/IjXR7OjUSxc/ZP4ZSP
         dKtUsZFndxgxTQkwDzJC4kpn/jooRvwg0AAsBKWnTQqlqEOBgK+/loZvreHbaAxZkm
         X9HVxcfp169Xg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A6753A007D;
        Wed,  4 Dec 2019 01:56:06 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Dec 2019 17:55:51 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 3 Dec 2019 17:55:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlbiRUHxICzDVaRD/j0/tzRQbKkCjVspyQzenuPTm5N1YKHAKMdxpHI7oIm6DTbTJ0O/1zdlgXlZRAM/116nq7f+4rEzZ0EWliDJ2499V7N+uIcjdAcSoPWJIsBRteBEMEgehF31jHu0aJH0ifm/9x0ELyapCXdi7f3CI3lvFWMDr2ltV1USbm1pV/OuY+DS+6hv5enb9kBBQFRWKtzl6KBjejAgcri5FbZ8a1X5w7E+wMeW/hkrmtJteKO3IkFzK4sZpEB2HwUJ9A/sRclkcHcvR/h+NvQVLf5HcXW0E/L/3s92grihOiXsu4SMR5zLWrI/QpM+1IEpEVsaG03Fxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SiBAF66bG5smcPlcbV8HSuPlf+CNBVsmmJzIpUjQXE=;
 b=KH53D3v9S4KxvOc2zdX2pMYg5TE1F0OrH0pI/9iFbxh7WH9aa9fW+W9KZb9/xkQoupweDZm7ArIW1wynL8zkaY4gMUj8Nbmp8bi870VZgx6Zx9Z6RBri5bUmW/4NVVK5UC+zNS1Eg12vl4uljf5Cxkdzppi7IsV+r34lp16m2bqHFo+oEkBM+X1w9IsiwiERigBjEtI8pcIdX++RFwzMrSbuikFvnZas8pM9mAER/6BXSkHJ5EnFvIeMAG7xyyh3zRMB+NOMR96CCNb+N5M029uGeYCEH8MU1k0sqpr/hN+jHTcIbB5VObJBf/LVExry+KUIZxekfIeT29pW7+C2oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SiBAF66bG5smcPlcbV8HSuPlf+CNBVsmmJzIpUjQXE=;
 b=LPaTgcUX7ltP2bI8QzkyvbL4ylwZXbdd0By/I2A/yMpW9aFVJjOqHEEhRtMx3wGDlyBtvG+1Zbogb+evOUnwakYgYOo1vVK5KRREe69xohLvq4SvokfAZB0zHsJoKzP0gzSwXqS2E/qmqbZKtYAOfrYFf2qhUCTvm8iynjUdEPY=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0152.namprd12.prod.outlook.com (10.172.77.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Wed, 4 Dec 2019 01:55:49 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 01:55:49 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 2/2] usb: dwc3: gadget: Properly set maxpacket limit
Thread-Topic: [PATCH 2/2] usb: dwc3: gadget: Properly set maxpacket limit
Thread-Index: AQHVZ3tOhpb23ZPWBE6EcYTh2A9dp6epvO4A
Date:   Wed, 4 Dec 2019 01:55:48 +0000
Message-ID: <021da5c9-d46a-0eaa-c545-2d98ce407bf7@synopsys.com>
References: <47eb7d52f0e361d64547460b45e48fcc87f13ece.1568080486.git.thinhn@synopsys.com>
 <e5c791b5514a25c1a84f53ac5360d149b26b1cbc.1568080486.git.thinhn@synopsys.com>
In-Reply-To: <e5c791b5514a25c1a84f53ac5360d149b26b1cbc.1568080486.git.thinhn@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fea392f3-5dd6-4f8c-3748-08d7785d15ec
x-ms-traffictypediagnostic: CY4PR1201MB0152:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB01521CD4B651B51923E58DD2AA5D0@CY4PR1201MB0152.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0241D5F98C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(189003)(199004)(4326008)(14444005)(26005)(186003)(102836004)(7736002)(256004)(36756003)(5660300002)(86362001)(110136005)(25786009)(64756008)(107886003)(66476007)(8676002)(66556008)(66946007)(76116006)(66446008)(6506007)(446003)(6486002)(6436002)(3846002)(6116002)(14454004)(11346002)(81156014)(81166006)(99286004)(229853002)(6246003)(305945005)(498600001)(6512007)(2906002)(76176011)(31686004)(2501003)(71200400001)(8936002)(2616005)(71190400001)(31696002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0152;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i6OTOW5dNerijP23cwDft4rnkjBnuNBZJgKeC8bkZFFRtg0ZKbt8lccnzT/R4OVq+1UDDPwvd8HTZyJyPJWAF7VmC5qWFkHbpcPqDnDEMrCREPvG1s4bblLi7MWFfjC2nwGkO/M4j9h3rCSL4T+8J26qIO3ZAFnyFGYCIXv8uxO2DjNY897bnJGYmGfEsPM7PhbDC3EbenHX04YZVy3l5O2PVn5ZKn2XHagFxHzFGZYqrq9zit0sRZ/9VGmFOal2E+oqhJSZzMPkvScWrAMJEO8S/BqXxaBwf5lp4mMn81r4Vwdk9V7UHuQi80xEQV/1cS8pxrCE2ALu5owxQHMhvxw2xg55qFSr5WNKF/PxzWAaDSERS8zF3SlO5KxhmQLjsZGv7Dr+nuugPvLUM/mf/HszxodjZBjIRPojcKvzXEwh8342uHYf9w5EkUWjeB+p
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EFA60C3EB0FAE4AA0A2AA8202362278@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fea392f3-5dd6-4f8c-3748-08d7785d15ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2019 01:55:48.9399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mqSHby4KbPy3hLg5yqgsfPzu+xfpbIBM4/TmIbUp7Bv3H03K4C+/nn/P8gtp2Lmgssnll7Woz5xOs2x08BWmkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0152
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+IEN1cnJlbnRseSB0aGUgY2FsY3Vs
YXRpb24gb2YgbWF4IHBhY2tldCBzaXplIGxpbWl0IGZvciBJTiBlbmRwb2ludHMgaXMNCj4gdG9v
IHJlc3RyaWN0aXZlLiBUaGlzIHByZXZlbnRzIGEgbWF0Y2hpbmcgb2YgYSBjYXBhYmxlIGhhcmR3
YXJlIGVuZHBvaW50DQo+IGR1cmluZyBjb25maWd1cmF0aW9uLiBCZWxvdyBpcyB0aGUgbWluaW11
bSByZWNvbW1lbmRlZCBIVyBjb25maWd1cmF0aW9uDQo+IHRvIHN1cHBvcnQgYSBwYXJ0aWN1bGFy
IGVuZHBvaW50IHNldHVwIGZyb20gdGhlIGRhdGFib29rOg0KPg0KPiBGb3IgT1VUIGVuZHBvaW50
cywgdGhlIGRhdGFib29rIHJlY29tbWVuZGVkIHRoZSBtaW5pbXVtIFJ4RklGTyBzaXplIHRvDQo+
IGJlIGF0IGxlYXN0IDN4IE1heFBhY2tldFNpemUgKyAzeCBzZXR1cCBwYWNrZXRzIHNpemUgKDgg
Ynl0ZXMgZWFjaCkgKw0KPiBjbG9jayBjcm9zc2luZyBtYXJnaW4gKDE2IGJ5dGVzKS4NCj4NCj4g
Rm9yIElOIGVuZHBvaW50cywgdGhlIGRhdGFib29rIHJlY29tbWVuZGVkIHRoZSBtaW5pbXVtIFR4
RklGTyBzaXplIHRvIGJlDQo+IGF0IGxlYXN0IDN4IE1heFBhY2tldFNpemUgZm9yIGVuZHBvaW50
cyB0aGF0IHN1cHBvcnQgYnVyc3QuIElmIHRoZQ0KPiBlbmRwb2ludCBkb2Vzbid0IHN1cHBvcnQg
YnVyc3Qgb3Igd2hlbiB0aGUgZGV2aWNlIGlzIG9wZXJhdGluZyBpbiBVU0INCj4gMi4wIG1vZGUs
IGEgbWluaW11bSBUeEZJRk8gc2l6ZSBvZiAyeCBNYXhQYWNrZXRTaXplIGlzIHJlY29tbWVuZGVk
Lg0KPg0KPiBCYXNlIG9uIHRoZXNlIHJlY29tbWVuZGF0aW9ucywgd2UgY2FuIGNhbGN1bGF0ZSB0
aGUgTWF4UGFja2V0U2l6ZSBsaW1pdA0KPiBvZiBlYWNoIGVuZHBvaW50LiBUaGlzIHBhdGNoIHJl
dmlzZXMgdGhlIElOIGVuZHBvaW50IE1heFBhY2tldFNpemUgbGltaXQNCj4gYW5kIGFsc28gc2V0
cyB0aGUgTWF4UGFja2V0U2l6ZSBsaW1pdCBmb3IgT1VUIGVuZHBvaW50cy4NCj4NCj4gUmVmZXJl
bmNlOiBEYXRhYm9vayAzLjMwYSBzZWN0aW9uIDMuMi4yIGFuZCAzLjIuMw0KPg0KPiBTaWduZWQt
b2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+IC0tLQ0KPiAgIGRy
aXZlcnMvdXNiL2R3YzMvY29yZS5oICAgfCAgNCArKysrDQo+ICAgZHJpdmVycy91c2IvZHdjMy9n
YWRnZXQuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oIGIvZHJpdmVycy91
c2IvZHdjMy9jb3JlLmgNCj4gaW5kZXggNmE2YmFhZGNiNjk3Li4wZjAxOWRiNWUxMjUgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvY29yZS5oDQo+IEBAIC0zMDksNiArMzA5LDEwIEBADQo+ICAgI2RlZmluZSBEV0MzX0dUWEZJ
Rk9TSVpfVFhGREVQKG4pCSgobikgJiAweGZmZmYpDQo+ICAgI2RlZmluZSBEV0MzX0dUWEZJRk9T
SVpfVFhGU1RBRERSKG4pCSgobikgJiAweGZmZmYwMDAwKQ0KPiAgIA0KPiArLyogR2xvYmFsIFJY
IEZpZm8gU2l6ZSBSZWdpc3RlciAqLw0KPiArI2RlZmluZSBEV0MzMV9HUlhGSUZPU0laX1JYRkRF
UChuKQkoKG4pICYgMHg3ZmZmKQkvKiBEV0NfdXNiMzEgb25seSAqLw0KPiArI2RlZmluZSBEV0Mz
X0dSWEZJRk9TSVpfUlhGREVQKG4pCSgobikgJiAweGZmZmYpDQo+ICsNCj4gICAvKiBHbG9iYWwg
RXZlbnQgU2l6ZSBSZWdpc3RlcnMgKi8NCj4gICAjZGVmaW5lIERXQzNfR0VWTlRTSVpfSU5UTUFT
SwkJQklUKDMxKQ0KPiAgICNkZWZpbmUgRFdDM19HRVZOVFNJWl9TSVpFKG4pCQkoKG4pICYgMHhm
ZmZmKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMv
dXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5kZXggMjkyZTVlNjcyODY4Li5jYmRhM2JiNGMxYzAgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYw0KPiBAQCAtMjIwNSw3ICsyMjA1LDYgQEAgc3RhdGljIGludCBkd2Mz
X2dhZGdldF9pbml0X2luX2VuZHBvaW50KHN0cnVjdCBkd2MzX2VwICpkZXApDQo+ICAgew0KPiAg
IAlzdHJ1Y3QgZHdjMyAqZHdjID0gZGVwLT5kd2M7DQo+ICAgCWludCBtZHdpZHRoOw0KPiAtCWlu
dCBrYnl0ZXM7DQo+ICAgCWludCBzaXplOw0KPiAgIA0KPiAgIAltZHdpZHRoID0gRFdDM19NRFdJ
RFRIKGR3Yy0+aHdwYXJhbXMuaHdwYXJhbXMwKTsNCj4gQEAgLTIyMjEsMTcgKzIyMjAsMTcgQEAg
c3RhdGljIGludCBkd2MzX2dhZGdldF9pbml0X2luX2VuZHBvaW50KHN0cnVjdCBkd2MzX2VwICpk
ZXApDQo+ICAgCS8qIEZJRk8gRGVwdGggaXMgaW4gTURXRElUSCBieXRlcy4gTXVsdGlwbHkgKi8N
Cj4gICAJc2l6ZSAqPSBtZHdpZHRoOw0KPiAgIA0KPiAtCWtieXRlcyA9IHNpemUgLyAxMDI0Ow0K
PiAtCWlmIChrYnl0ZXMgPT0gMCkNCj4gLQkJa2J5dGVzID0gMTsNCj4gLQ0KPiAgIAkvKg0KPiAt
CSAqIEZJRk8gc2l6ZXMgYWNjb3VudCBhbiBleHRyYSBNRFdJRFRIICogKGtieXRlcyArIDEpIGJ5
dGVzIGZvcg0KPiAtCSAqIGludGVybmFsIG92ZXJoZWFkLiBXZSBkb24ndCByZWFsbHkga25vdyBo
b3cgdGhlc2UgYXJlIHVzZWQsDQo+IC0JICogYnV0IGRvY3VtZW50YXRpb24gc2F5IGl0IGV4aXN0
cy4NCj4gKwkgKiBUbyBtZWV0IHBlcmZvcm1hbmNlIHJlcXVpcmVtZW50LCBhIG1pbmltdW0gVHhG
SUZPIHNpemUgb2YgM3gNCj4gKwkgKiBNYXhQYWNrZXRTaXplIGlzIHJlY29tbWVuZGVkIGZvciBl
bmRwb2ludHMgdGhhdCBzdXBwb3J0IGJ1cnN0IGFuZCBhDQo+ICsJICogbWluaW11bSBUeEZJRk8g
c2l6ZSBvZiAyeCBNYXhQYWNrZXRTaXplIGZvciBlbmRwb2ludHMgdGhhdCBkb24ndA0KPiArCSAq
IHN1cHBvcnQgYnVyc3QuIFVzZSB0aG9zZSBudW1iZXJzIGFuZCB3ZSBjYW4gY2FsY3VsYXRlIHRo
ZSBtYXggcGFja2V0DQo+ICsJICogbGltaXQgYXMgYmVsb3cuDQo+ICAgCSAqLw0KPiAtCXNpemUg
LT0gbWR3aWR0aCAqIChrYnl0ZXMgKyAxKTsNCj4gLQlzaXplIC89IGtieXRlczsNCj4gKwlpZiAo
ZHdjLT5tYXhpbXVtX3NwZWVkID49IFVTQl9TUEVFRF9TVVBFUikNCj4gKwkJc2l6ZSAvPSAzOw0K
PiArCWVsc2UNCj4gKwkJc2l6ZSAvPSAyOw0KPiAgIA0KPiAgIAl1c2JfZXBfc2V0X21heHBhY2tl
dF9saW1pdCgmZGVwLT5lbmRwb2ludCwgc2l6ZSk7DQo+ICAgDQo+IEBAIC0yMjQ5LDggKzIyNDgs
MzkgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9pbml0X2luX2VuZHBvaW50KHN0cnVjdCBkd2Mz
X2VwICpkZXApDQo+ICAgc3RhdGljIGludCBkd2MzX2dhZGdldF9pbml0X291dF9lbmRwb2ludChz
dHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPiAgIHsNCj4gICAJc3RydWN0IGR3YzMgKmR3YyA9IGRlcC0+
ZHdjOw0KPiArCWludCBtZHdpZHRoOw0KPiArCWludCBzaXplOw0KPiArDQo+ICsJbWR3aWR0aCA9
IERXQzNfTURXSURUSChkd2MtPmh3cGFyYW1zLmh3cGFyYW1zMCk7DQo+ICsNCj4gKwkvKiBNRFdJ
RFRIIGlzIHJlcHJlc2VudGVkIGluIGJpdHMsIGNvbnZlcnQgdG8gYnl0ZXMgKi8NCj4gKwltZHdp
ZHRoIC89IDg7DQo+ICAgDQo+IC0JdXNiX2VwX3NldF9tYXhwYWNrZXRfbGltaXQoJmRlcC0+ZW5k
cG9pbnQsIDEwMjQpOw0KPiArCS8qIEFsbCBPVVQgZW5kcG9pbnRzIHNoYXJlIGEgc2luZ2xlIFJ4
RklGTyBzcGFjZSAqLw0KPiArCXNpemUgPSBkd2MzX3JlYWRsKGR3Yy0+cmVncywgRFdDM19HUlhG
SUZPU0laKDApKTsNCj4gKwlpZiAoZHdjM19pc191c2IzMShkd2MpKQ0KPiArCQlzaXplID0gRFdD
MzFfR1JYRklGT1NJWl9SWEZERVAoc2l6ZSk7DQo+ICsJZWxzZQ0KPiArCQlzaXplID0gRFdDM19H
UlhGSUZPU0laX1JYRkRFUChzaXplKTsNCj4gKw0KPiArCS8qIEZJRk8gZGVwdGggaXMgaW4gTURX
RElUSCBieXRlcyAqLw0KPiArCXNpemUgKj0gbWR3aWR0aDsNCj4gKw0KPiArCS8qDQo+ICsJICog
VG8gbWVldCBwZXJmb3JtYW5jZSByZXF1aXJlbWVudCwgYSBtaW5pbXVtIHJlY29tbWVuZGVkIFJ4
RklGTyBzaXplDQo+ICsJICogaXMgZGVmaW5lZCBhcyBmb2xsb3c6DQo+ICsJICogUnhGSUZPIHNp
emUgPj0gKDMgeCBNYXhQYWNrZXRTaXplKSArDQo+ICsJICogKDMgeCA4IGJ5dGVzIHNldHVwIHBh
Y2tldHMgc2l6ZSkgKyAoMTYgYnl0ZXMgY2xvY2sgY3Jvc3NpbmcgbWFyZ2luKQ0KPiArCSAqDQo+
ICsJICogVGhlbiBjYWxjdWxhdGUgdGhlIG1heCBwYWNrZXQgbGltaXQgYXMgYmVsb3cuDQo+ICsJ
ICovDQo+ICsJc2l6ZSAtPSAoMyAqIDgpICsgMTY7DQo+ICsJaWYgKHNpemUgPCAwKQ0KPiArCQlz
aXplID0gMDsNCj4gKwllbHNlDQo+ICsJCXNpemUgLz0gMzsNCj4gKw0KPiArCXVzYl9lcF9zZXRf
bWF4cGFja2V0X2xpbWl0KCZkZXAtPmVuZHBvaW50LCBzaXplKTsNCj4gICAJZGVwLT5lbmRwb2lu
dC5tYXhfc3RyZWFtcyA9IDE1Ow0KPiAgIAlkZXAtPmVuZHBvaW50Lm9wcyA9ICZkd2MzX2dhZGdl
dF9lcF9vcHM7DQo+ICAgCWxpc3RfYWRkX3RhaWwoJmRlcC0+ZW5kcG9pbnQuZXBfbGlzdCwNCg0K
SSBzZW50IHRoZXNlIGNvdXBsZSBvZiBwYXRjaGVzIHNvbWUgdGltZSBhZ28uIFdoZW4geW91IGhh
dmUgdGltZSwgY2FuIA0KeW91IHRha2UgYSBsb29rIGFuZCBzZWUgaWYgdGhleSBjYW4gZ28gb24g
dGhlIG5leHQgdHJlZS4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
