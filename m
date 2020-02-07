Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5537C155CB4
	for <lists+linux-usb@lfdr.de>; Fri,  7 Feb 2020 18:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbgBGRSG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Feb 2020 12:18:06 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:53136 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726956AbgBGRSG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Feb 2020 12:18:06 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5B8C642794;
        Fri,  7 Feb 2020 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1581095885; bh=tBET3rcCTBue4RdREP2lO7dWSGMUx2DDkCv0BF46OEI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KTMIvINPeDn6M6jp7t/oyvh8gAXhGr9ExtPE+USAl7sawk3fSmgab6XRGy9sL6Pcq
         XTQnaIc1OjJv/FxUpJAK539etyejcoZb4es6CIOCE/R6N/9jidlMq30Vkvz9oAd9cz
         nRAlXniRaiBnPRbWWSNcDybhuvIz9u285B/VlYK8DQOQjJvfqqK2n/G4ghB35HhDR4
         n49Yu8vzSaWSnVgT+XUYnff5iIp1g1+M5HN0urUCLaNZbBgQtk/36xlhoCfXlzDZ3B
         LvkNa/j9EmXpLqmJ3S/2wm0mOaIct/q6NIWeF0p8N5Zj2iFYJlcO05JoL+zONtQV3L
         bPJSrGu1T852w==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id DE17FA006B;
        Fri,  7 Feb 2020 17:18:03 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 7 Feb 2020 09:17:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 7 Feb 2020 09:17:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXRlcNtzCMZHg+xWcKutLbnxD3zk1b6HXtsHTkczIjTgkvEkqXEL17YRz6I0+uk4P0vdfVt0VHtsrrnNPPZzI/yQdz6ZwjfLyALtiTm/D2LBucsGFyd1LhhPvWpZXHEmAff+0k/tyOS1MPWzATjGbbI0mf/Es501QuF8/Y03cjPLo4Wy/bRfXukklfhMIlGqoAEeeJ/fWEpvwo4WVznwslvpZtma2rRPdhICATM1OneR+4sRLa9iXUzmbH0yTgtPtSPwkZATTLfdCIrgR49wqprdtdoUe3d2PsgmCVG2FF62llR+uGBvGGa9ueHTERTyxQ2zPWsYfEq6lPYz0Yuhvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBET3rcCTBue4RdREP2lO7dWSGMUx2DDkCv0BF46OEI=;
 b=TtCafStzCE+gT2g03GMQGeu2SAwXxcyfJcXqonhhpmnAxsD+HjFvQa450IO1942uaTqmH1e5IeuARA+spX2tdxJExCtSNZOtJ9P6Mxvan7/Px1mWNo4le5a7miHQdaDXb8+y5gPaKyATxyfWmar7pHT9++eaMgMU1g61SP0MNn/mNE8OLZqfrC7TbBt26ME72/tIy8gYhvQ5B2vvvvjfLZfLxJCyRATK3TqNHAVCOe92YBWx0+kr8JIiSsBoD3REdAi2vFooExXM5HRrvENd3zIB3Z/+ceWzKIFmvGTvMRpviFlezdArFCq1xa2/4sYLlWaovtG1dNOQzfuKhKHetQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBET3rcCTBue4RdREP2lO7dWSGMUx2DDkCv0BF46OEI=;
 b=en5jm919WSQCK55Bt71hnqDWjzk3U3fkCmT2mo1NMqtVPyYCZujBN13rd+or4fKkMU3lVtiE53n8vRtjBky5EOE0I71kLyWh9jXoCUWYuJjKnV72bCEXpcZoTGtLgp7501EcVtISRrtC37u0OHvdWlqqrcUpxa4jbGHn+HwcjPA=
Received: from BN7PR12MB2802.namprd12.prod.outlook.com (20.176.27.97) by
 BN7PR12MB2660.namprd12.prod.outlook.com (20.176.176.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Fri, 7 Feb 2020 17:17:44 +0000
Received: from BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::e420:5711:3657:f3ca]) by BN7PR12MB2802.namprd12.prod.outlook.com
 ([fe80::e420:5711:3657:f3ca%3]) with mapi id 15.20.2707.024; Fri, 7 Feb 2020
 17:17:44 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Topic: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Index: AQHVtzsCoOCUmqsy60eqZZ0dzKJK/qfZO6UAgDcK6IA=
Date:   Fri, 7 Feb 2020 17:17:44 +0000
Message-ID: <7d042091-66b5-c245-73c8-f4491ea037c3@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
 <3b09e3ef-d322-f8c8-f00a-34341509c350@linux.intel.com>
In-Reply-To: <3b09e3ef-d322-f8c8-f00a-34341509c350@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joglekar@synopsys.com; 
x-originating-ip: [183.82.21.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 845384ce-4a5f-40e5-b7fc-08d7abf1a560
x-ms-traffictypediagnostic: BN7PR12MB2660:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR12MB2660DCECB46AD3E9D122CE08A41C0@BN7PR12MB2660.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0306EE2ED4
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(366004)(39860400002)(376002)(199004)(189003)(107886003)(36756003)(6512007)(86362001)(5660300002)(2906002)(31686004)(6486002)(31696002)(4326008)(2616005)(110136005)(26005)(66476007)(66556008)(8936002)(76116006)(53546011)(6506007)(91956017)(71200400001)(81156014)(66946007)(81166006)(8676002)(66446008)(186003)(316002)(478600001)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:BN7PR12MB2660;H:BN7PR12MB2802.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8zcQ6DJatnNQF6LVW0jt4PC8ljBP2bKRA8aAIAVz0Vb0wBg/gFgGn8z/Su4tLtFW6GEyYYQ5+NEuCxWDsDvjKcO+2GvxAq6eNEVD0VT/RW753nR4c2vNH2K/G7WdONhx0R31KmsJ09clUkpmIr+Dj2+K7kQpUiKa+qnDZdUDgOQYNq4C3Skxs/1wHQ/ZELlybgAteTM711har0ps25kK1OIrHn2E6AOICz/EVBxe3tVDyWff9Mooff8cUD5wLrDgKSKsb8cujlld715lRa1zAUju4ewUluMgOFtCAwkDL0n8rBpQHno9cckF+R5sDTJ9I7fkIdYflsMY4KjY9feraHdKh7y9kMOIRtXAmQ+8uvkqGupCTwSh6csY9uaQtDoNxAiG2i1fizUFJvepcTgY+CVvDUslHW9fNwG22yRTHVygiW3sJ5Of6SEN4hYvYOY2
x-ms-exchange-antispam-messagedata: gEYDkx0E6qJCmFoaunxcmG319/MKiAUdCHIbyqYBE3SdzvYV6no0PNpS3Rk2hvEJ2Byuj9ZFjUFJofmeRxVbVrN+wYEsi14sJaIte1YecpwEF4AeKDk2LNQG960C/nzWL+zJslbVhGi8aSaxpfkSwg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FEA50F1A45F1C4F8617305A32CE556F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 845384ce-4a5f-40e5-b7fc-08d7abf1a560
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2020 17:17:44.4722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0crho2Iva3jUnYPMegNJcvZ3cQmSRjquIS8s3jrYCkILxaws15UpQcATdB5L6/ckvKzJRkRsnQdgnUIi9aOCMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2660
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudHMuDQpPbiAxLzMvMjAyMCAxMDoxNCBQ
TSwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gT24gMjAuMTIuMjAxOSAxNS4zOSwgVGVqYXMgSm9n
bGVrYXIgd3JvdGU6DQo+PiBUaGUgU3lub3BzeXMgeEhDIGhhcyBhbiBpbnRlcm5hbCBUUkIgY2Fj
aGUgb2Ygc2l6ZSBUUkJfQ0FDSEVfU0laRSBmb3INCj4+IGVhY2ggZW5kcG9pbnQuIFRoZSBkZWZh
dWx0IHZhbHVlIGZvciBUUkJfQ0FDSEVfU0laRSBpcyAxNiBmb3IgU1MgYW5kIDgNCj4+IGZvciBI
Uy4gVGhlIGNvbnRyb2xsZXIgbG9hZHMgYW5kIHVwZGF0ZXMgdGhlIFRSQiBjYWNoZSBmcm9tIHRo
ZSB0cmFuc2Zlcg0KPj4gcmluZyBpbiBzeXN0ZW0gbWVtb3J5IHdoZW5ldmVyIHRoZSBkcml2ZXIg
aXNzdWVzIGEgc3RhcnQgdHJhbnNmZXIgb3INCj4+IHVwZGF0ZSB0cmFuc2ZlciBjb21tYW5kLg0K
Pj4NCj4+IEZvciBjaGFpbmVkIFRSQnMsIHRoZSBTeW5vcHN5cyB4SEMgcmVxdWlyZXMgdGhhdCB0
aGUgdG90YWwgYW1vdW50IG9mDQo+PiBieXRlcyBmb3IgYWxsIFRSQnMgbG9hZGVkIGluIHRoZSBU
UkIgY2FjaGUgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvIDENCj4+IE1QUy4gT3IgdGhlIGNo
YWluIGVuZHMgd2l0aGluIHRoZSBUUkIgY2FjaGUgKHdpdGggYSBsYXN0IFRSQikuDQo+Pg0KPj4g
SWYgdGhpcyByZXF1aXJlbWVudCBpcyBub3QgbWV0LCB0aGUgY29udHJvbGxlciB3aWxsIG5vdCBi
ZSBhYmxlIHRvIHNlbmQNCj4+IG9yIHJlY2VpdmUgYSBwYWNrZXQgYW5kIGl0IHdpbGwgaGFuZyBj
YXVzaW5nIGEgZHJpdmVyIHRpbWVvdXQgYW5kIGVycm9yLg0KPj4NCj4+IFRoaXMgY2FuIGJlIGEg
cHJvYmxlbSBpZiBhIGNsYXNzIGRyaXZlciBxdWV1ZXMgU0cgcmVxdWVzdHMgd2l0aCBtYW55DQo+
PiBzbWFsbC1idWZmZXIgZW50cmllcy4gVGhlIFhIQ0kgZHJpdmVyIHdpbGwgY3JlYXRlIGEgY2hh
aW5lZCBUUkIgZm9yIGVhY2gNCj4+IGVudHJ5IHdoaWNoIG1heSB0cmlnZ2VyIHRoaXMgaXNzdWUu
DQo+Pg0KPj4gVGhpcyBwYXRjaCBhZGRzIGxvZ2ljIHRvIHRoZSBYSENJIGRyaXZlciB0byBkZXRl
Y3QgYW5kIHByZXZlbnQgdGhpcyBmcm9tDQo+PiBoYXBwZW5pbmcuDQo+Pg0KPj4gRm9yIGV2ZXJ5
IChUUkJfQ0FDSEVfU0laRSAtIDIpIFRSQnMsIHdlIGNoZWNrIHRoZSB0b3RhbCBidWZmZXIgc2l6
ZSBvZg0KPj4gdGhlIFRSQnMgYW5kIGlmIHRoZSBjaGFpbiBjb250aW51ZXMgYW5kIHdlIGRvbid0
IG1ha2UgdXAgYXQgbGVhc3QgMSBNUFMsDQo+PiB3ZSBjcmVhdGUgYSBib3VuY2UgYnVmZmVyIHRv
IGNvbnNvbGlkYXRlIHVwIHRvIHRoZSBuZXh0ICg0ICogTVBTKSBUUkJzDQo+PiBpbnRvIHRoZSBs
YXN0IFRSQi4NCj4+DQo+PiBXZSBjaGVjayBhdCAoVFJCX0NBQ0hFX1NJWkUgLSAyKSBiZWNhdXNl
IGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlcmUgd291bGQNCj4+IGJlIGEgbGluayBhbmQvb3IgZXZl
bnQgZGF0YSBUUkIgdGhhdCB0YWtlIHVwIHRvIDIgb2YgdGhlIGNhY2hlIGVudHJpZXMuDQo+PiBB
bmQgd2UgY29uc29saWRhdGUgdGhlIG5leHQgKDQgKiBNUFMpIHRvIGltcHJvdmUgcGVyZm9ybWFu
Y2UuDQo+Pg0KPj4gV2UgZGlzY292ZXJlZCB0aGlzIGlzc3VlIHdpdGggZGV2aWNlcyBvbiBvdGhl
ciBwbGF0Zm9ybXMgYnV0IGhhdmUgbm90DQo+PiB5ZXQgY29tZSBhY3Jvc3MgYW55IGRldmljZSB0
aGF0IHRyaWdnZXJzIHRoaXMgb24gTGludXguIEJ1dCBpdCBjb3VsZCBiZQ0KPj4gYSByZWFsIHBy
b2JsZW0gbm93IG9yIGluIHRoZSBmdXR1cmUuIEFsbCBpdCB0YWtlcyBpcyBOIG51bWJlciBvZiBz
bWFsbA0KPj4gY2hhaW5lZCBUUkJzLiBBbmQgb3RoZXIgaW5zdGFuY2VzIG9mIHRoZSBTeW5vcHN5
cyBJUCBtYXkgaGF2ZSBzbWFsbGVyDQo+PiB2YWx1ZXMgZm9yIHRoZSBUUkJfQ0FDSEVfU0laRSB3
aGljaCB3b3VsZCBleGFjZXJiYXRlIHRoZSBwcm9ibGVtLg0KPj4NCj4+IFdlIHZlcmlmaWVkIHRo
aXMgcGF0Y2ggdXNpbmcgb3VyIGludGVybmFsIGRyaXZlciBhbmQgdGVzdGluZyBmcmFtZXdvcmsu
DQo+IA0KPiBJZiBJIHVuZGVyc3RhbmQgdGhlIHByb2JsZW0gY29ycmVjdGx5IHlvdSBuZWVkIHRv
IG1ha2Ugc3VyZSB0aGUgZGF0YSBwb2ludGVkDQo+IHRvIGJ5IDE2IChTUykgb3IgOCAoSFMpIGNo
YWluZWQgVFJCcyBtdXN0IGJlIGVxdWFsIHRvLCBvciBtb3JlIHRoYW4gbWF4IHBhY2tldCBzaXpl
Lg0KPiANCj4gU28gaW4gdGhlb3J5IHRoaXMgc2hvdWxkIG9ubHkgYmUgYSBwcm9ibGVtIGZvciBz
Y2F0dGVyIGdhdGhlciBidWZmZXJzLCByaWdodD8NCj4gDQpZZXMsIHRoaXMgcHJvYmxlbSBjb3Vs
ZCBiZSBzZWVuIG9ubHkgd2l0aCBzY2F0dGVyIGdhdGhlciBidWZmZXJzLg0KDQo+IFRoaXMgc2hv
dWxkIGFscmVhZHkgYmUgaGFuZGxlZCBieSB1c2IgY29yZSB1bmxlc3Mgbm9fc2dfY29uc3RyYWlu
dCBmbGFnIGlzIHNldCwNCj4gdXNiIGNvcmUgaXQgbWFrZXMgc3VyZSBlYWNoIHNnIGxpc3QgZW50
cnkgbGVuZ3RoIGlzIG1heCBwYWNrZXQgc2l6ZSBkaXZpc2libGUsIGFsc28NCj4gbWVhbmluZyBp
dCBuZWVkcyB0byBiZSBhdCBsZWFzdCBtYXggcGFja2V0IHNpemUuIChvciAwLCBidXQgbm90IGFu
IGlzc3VlIGhlcmUpDQo+IA0KPiBzZWUgaW5jbHVkZS9saW51eC91c2IuaDogc3RydWN0IHVyYg0K
PiDCoA0KPiAqIEBzZzogc2NhdHRlciBnYXRoZXIgYnVmZmVyIGxpc3QsIHRoZSBidWZmZXIgc2l6
ZSBvZiBlYWNoIGVsZW1lbnQgaW4NCj4gKsKgwqDCoMKgwqAgdGhlIGxpc3QgKGV4Y2VwdCB0aGUg
bGFzdCkgbXVzdCBiZSBkaXZpc2libGUgYnkgdGhlIGVuZHBvaW50J3MNCj4gKsKgwqDCoMKgwqAg
bWF4IHBhY2tldCBzaXplIGlmIG5vX3NnX2NvbnN0cmFpbnQgaXNuJ3Qgc2V0IGluICdzdHJ1Y3Qg
dXNiX2J1cyciDQo+IA0KPiB3aGljaCBpcyBjaGVja2VkIGluIGRyaXZlcnMvdXNiL2NvcmUvdXJi
LmM6IHVzYl9zdWJtaXRfdXJiKCkNCj4gDQo+IGZvcl9lYWNoX3NnKHVyYi0+c2csIHNnLCB1cmIt
Pm51bV9zZ3MgLSAxLCBpKQ0KPiDCoMKgwqDCoGlmIChzZy0+bGVuZ3RoICUgbWF4KQ0KPiDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCj4gDQo+IFNvIGl0IHNlZW1zIGFsbCB5b3UgbmVl
ZCB0byBkbyBpdCBtYWtlIHN1cmUgdGhhdCB0aGUgbm9fc2dfY29uc3RyYWludCBpc24ndCBzZXQN
Cj4gZm9yIHRoaXMgaG9zdCBjb250cm9sbGVyIHZlbmRvci4NCj4NCk15IHVuZGVyc3RhbmRpbmcg
aXMgaWYgd2UgZG9uJ3Qgc2V0IHRoZSBub19zZ19jb25zdHJhaW50IGFuZCBzZyBsaXN0IGVudHJ5
IGlzIGxlc3MNCnRoYW4gbWF4IHBhY2tldCB0aGVuIHRyYW5zZmVyIHdvdWxkIG5vdCBoYXBwZW4g
d2l0aCB0aGUgaG9zdCBjb250cm9sbGVyLiBCdXQgdGhlIA0KaG9zdCBjb250cm9sbGVyIHN1cHBv
cnRzIGFsbCBsZW5ndGhzIG9mIFNHIGVudHJpZXMgZXZlbiBsZXNzIHRoYW4gTVBTLCBvbmx5IHRo
aW5nIA0KaXMgdGhlIFRSQl9DQUNIRSBpbiB0aGUgY29udHJvbGxlciBzaG91bGQgaGF2ZSBhdCBs
ZWFzdCBNUFMgc2l6ZSBvZiBkYXRhIHNwcmVhZCANCmFjcm9zcyBpdC4gU28gbm90IHNldHRpbmcg
dXAgbm9fc2dfY29uc3RyYWludCBpcyBub3QgYSB1c2VmdWwgc29sdXRpb24uIA0KIA0KPiBUaGlz
IHBhdGNoIGlzIHRvbyBpbnRydXNpdmUsIGl0cyBhIHZlcnkgZmluZSBncmFpbmVkIGFuZCBjb21w
bGV4IHNvbHV0aW9uIHRvIGENCj4gdmVuZG9yIHNwZWNpZmljIGlzc3VlIHRoYXQgaGFzIG5vdCBj
YXVzZWQgYW55IHJlYWwgbGlmZSBpc3N1ZXMgaW4gTGludXguDQo+IEl0IGFkZHMgYSBuZXcgc3Bp
bmxvY2sgYW5kIGxpc3Qgb2YgYm91bmNlIGJ1ZmZlciB0byBldmVyeSB0cmFuc2ZlciBkZXNjcmlw
dG9yLg0KPiANCkkgdW5kZXJzdGFuZCB0aGF0IGluIGEgZmlyc3QgbG9vayBpdCBsb29rcyBhIGNv
bXBsZXggc29sdXRpb24sIGJ1dCB5b3UgY2FuIHN1Z2dlc3QNCnRoZSBtb2RpZmljYXRpb25zL2No
YW5nZXMgd2hpY2ggd291bGQgYmUgcmVxdWlyZWQgdG8gbWFrZSB0aGUgcGF0Y2ggbW9yZSByZWFk
YWJsZS4NCkkgaGF2ZSB0cmllZCB0byBrZWVwIHRoZSBpbXBsZW1lbnRhdGlvbiBzaW1pbGFyIHRv
IGJvdW5jZSBidWZmZXIgaW1wbGVtZW50YXRpb24gDQpvbmx5IHdpdGggYWRkaXRpb24gb2YgYm91
bmNlIGJ1ZmZlciBsaXN0LiBGb3IgdGhlIHNwaW5sb2NrIGNhc2UsIHlvdSBjYW4gdGFrZSBhIA0K
Y2FsbCBpZiBpdCBpcyByZXF1aXJlZCBvciBub3QuDQoNCj4gLU1hdGhpYXMNCj4gDQoNClRoYW5r
cyAmIFJlZ2FyZHMsDQpUZWphcyBKb2dsZWthcg0K
