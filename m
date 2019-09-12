Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB163B0649
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 02:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbfILAtz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 20:49:55 -0400
Received: from mail-eopbgr10045.outbound.protection.outlook.com ([40.107.1.45]:52184
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728635AbfILAtz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Sep 2019 20:49:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/xumGb6JbgvBOEaQpox+kK2SGO9EyW5+B4AEdaUQFaql6w1N/pCmVmw2xvE1Hxd5g+zOlaEu+RQx1f5BOHs8rCocPD1vx2vxGBv0gbn4U/AIgo1vpC34kfAmZlB4jaLHZS9N41ErP6emyLKh+tLcrf8wlM46Jvz0em8S3RvHnGaPWv1JrhL318iGxw7csGmWYzN/g778r0oQUUwzmS4C4xYaUmbC2CbXOKh7QLZFBZ5T00yBUirJ9/zpE9MEWTSro36WvP5xIYO6Z/l41eDIIACivm/dneTqgqg7SwsiOSbvbLNEMi7B3iRq4oRKPbJJPoNwqogQciByxuk0rGrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF1/4esVGfSsGpMWwybPRUnZpKoUQs3EOraSgjAMM2o=;
 b=A41KE+u0wHqc7gNupTOZAklhLbYtOLOfoWntJYmwsCPGHJUBbd+4XDMFJZNOCnwTPvKmpd/I6ajpRUlh61sBqBIk2wcv4DA1LntdAZRfxW28y+PdHRGF8GbXz7Y0V2CzRc/1M58PK/PhXHOyDwP+c2LC81Y3cK2jvObJp4QbsTz4t22flZtMuB39ib7ShGXVJY+EB7qAcupfVgDHyiugX50SUyRDLzuNBDm/RiokRPx9GQYoWOhivGektGC327LGbnFpoq6Qs0ubpUDc8YtWa1QVz2IVbYxuE5GGDpD9fISxYTOBqTpKc0lOy/H/bSAfgpLm70X/GXjKQDJn9DR8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF1/4esVGfSsGpMWwybPRUnZpKoUQs3EOraSgjAMM2o=;
 b=QabUnPOKolKwDywfKZX27Nv8/makoevnIjjZssYlki6Ivrel6SrtKc61B0p7bp18EOUQauV6HP7FrfEe3zdHy+CZvQM/CzZKUyRMMTieNkIUA79ns3HvsM6ftdtS3wdJmTjLoVD/vrBMj2aQMmAlkGNUy/3KkJdxZtYQ7LUOSGk=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB4032.eurprd04.prod.outlook.com (10.171.182.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.14; Thu, 12 Sep 2019 00:49:51 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::744a:c78e:b8:633a%7]) with mapi id 15.20.2263.015; Thu, 12 Sep 2019
 00:49:50 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Allen Blaylock <AllenB@epiloglaser.com>,
        Manu Gautam <mgautam@codeaurora.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: EHSET with hub and PCIe root hub
Thread-Topic: EHSET with hub and PCIe root hub
Thread-Index: AdVoIxLeoShF0bVgSnKKwHrYOWnWwgAKZ+wAAAH42gAAIn25MAAJEVXQ
Date:   Thu, 12 Sep 2019 00:49:50 +0000
Message-ID: <VI1PR04MB5327073659D605C6641E935F8BB00@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <BYAPR20MB25012D076C3D44E07BA32C89CCB60@BYAPR20MB2501.namprd20.prod.outlook.com>
 <20190911025750.GB22414@b29397-desktop>
 <917f584b-11c8-9656-e9a3-df251350c427@codeaurora.org>
 <BYAPR20MB2501098ADC3493845D7D2E9DCCB10@BYAPR20MB2501.namprd20.prod.outlook.com>
In-Reply-To: <BYAPR20MB2501098ADC3493845D7D2E9DCCB10@BYAPR20MB2501.namprd20.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 18f1c5ae-c839-45fd-1eb4-08d7371b1e47
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4032;
x-ms-traffictypediagnostic: VI1PR04MB4032:
x-microsoft-antispam-prvs: <VI1PR04MB4032672CFAB274411CE51DE08BB00@VI1PR04MB4032.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(199004)(189003)(305945005)(9686003)(476003)(76116006)(26005)(6246003)(4326008)(25786009)(110136005)(316002)(66066001)(53936002)(74316002)(7736002)(486006)(11346002)(6506007)(55016002)(102836004)(76176011)(44832011)(229853002)(186003)(478600001)(99286004)(33656002)(256004)(7696005)(71200400001)(66946007)(6436002)(2906002)(66476007)(64756008)(66446008)(66556008)(5660300002)(3846002)(6116002)(86362001)(8936002)(52536014)(14454004)(81156014)(8676002)(81166006)(71190400001)(14444005)(446003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4032;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d9MllBYLV+3ZH1nUWO9srVf9B1eiWUJmK+HZU8XIvp5V6t+pCky6Vtv3AwxVBIox9qX2/Bo7tcUaMGAFZs+4OCWGuFIlTu0aaGVm52JPI/zdBT7aVpIql675bx5hicH0dHlHvWT+tnE2yh0e1A5EG9mGvQ3q+Dtglm+pb685QScrVXDTfQPyGtXpm+SSo6Sc8uXdsTjk2rArFuUFDc9hnvv3y9XWsGlmlBdxT8W34JvvPSNxr4zGTrUhJpi9UcwaXC45RF4D/D5iZNXcTSQGTZ+jlseJkY3Hvxp4pBAEK87mlI7FhxJR+sOmEZNZmh2vzCbOoDnTvo9dJAuL25UichkiyCsdUdCdTptFv1e4kyX26MH5k5iqFwaCsm4R8+E20pgoYyfzp0bWztlHWAQEZkbj5nhfWimKpmPvcDhks1Q=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f1c5ae-c839-45fd-1eb4-08d7371b1e47
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 00:49:50.5967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8D/Ry/SnE4MbM3/QZiLwZI38EXveSCLV4M7lfm0ZJhlLpqdWBzuqUTS0KybT5dbcgPW6Ecdk29HgtSD481fEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4032
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+Pj4NCj4gPj4+IEZ1cnRoZXIgZG93biBpbiB0aGUgbWFpbGluZyBsaXN0IGNoYWluIFBl
dGVyIENoZW4gc3RhdGVzDQo+ID4+Pj4gQmVzaWRlcywgZG8gbm90IGNvbm5lY3QgSFVCIGJldHdl
ZW4geW91ciBob3N0IGJvYXJkIGFuZCBlbXVsYXRpb24NCj4gPj4+PiBib2FyZCAoZm9yIHNlbmRp
bmcgVklEL1BJRCkuDQo+ID4+PiBidXQgdGhlcmUgaXMgbm8gYWRkaXRpb25hbCBpbmZvcm1hdGlv
biByZWdhcmRpbmcgdGhpcyBzdGF0ZW1lbnQuDQo+ID4+IEVIU0VUIGlzIHVzZWQgdG8gdGVzdCBl
bWJlZGRlZCBob3N0IGVsZWN0cmljYWwgc2lnbmFsIHJlcXVpcmVkIGJ5IFVTQg0KPiA+PiBJRiBD
b21wbGlhbmNlIFRlc3QsIG5vdCB0ZXN0IHRoZSBzaWduYWwgZm9yIFVTQiBIVUIsIHNpbmNlIHRo
ZSBFSFNFVA0KPiA+PiBtb2R1bGUgY291bGQgb25seSBsZXQgZW1iZWRkZWQgaG9zdCBjb250cm9s
bGVyIGVudGVyIHRlc3QgbW9kZSBieQ0KPiA+PiB3cml0aW5nIFRFU1QgTU9ERSByZWdpc3RlcnMg
Zm9sbG93cyBFSENJIG9yIHhIQ0kgc3BlYy4gTWF5YmUgdGhlIFVTQg0KPiA+PiBIVUIgY291bGQg
bGV0IGl0cyBwb3J0IGVudGVyIHRlc3QgbW9kZSwgYnV0IGl0IG5lZWRzIHRvIHVzZSBvdGhlcg0K
PiA+PiB3YXlzLCBtYXliZSB2ZW5kb3Igc3BlY2lmaWMgY29tbWFuZHMuDQo+ID4NCj4gPklNTyBl
aHNldCBzaG91bGQgd29yayB3aXRoIGV4dGVybmFsIEhVQiBhcyB3ZWxsIHNpbmNlIGFsbCBpdCB0
YWtlcyB0byBwdXQgYSBIVUIncw0KPiBwb3J0IGluIGNvbXBsaWFuY2UgbW9kZSBpcyBzZW5kaW5n
IGEgU2V0RmVhdHVyZSByZXF1ZXN0IHdoaWNoIEkgYmVsaWV2ZSBkcml2ZXINCj4gYWxyZWFkeSBk
b2VzLiBJZiBIVUIgaXMgc2VuZGluZyBzdGFsbCB0aGVuIHlvdSBjYW4gdHJ5IHB1dHRpbmcgYSBk
aWZmZXJlbnQgcG9ydCBpbg0KPiBjb21wbGlhbmNlIHdoaWNoIGlzIG5vdCBjb25uZWN0ZWQuDQo+
IA0KPiBIb3cgZG8gSSBzcGVjaWZ5IHdoaWNoIHBvcnQgSSBwdXQgaW4gY29tcGxpYW5jZT8gVGhl
IHdheSBJIGhhdmUgYmVlbiBkb2luZyBpdCB3YXMNCj4gdXNpbmcgYSBQSURWSUQgZnJvbSB0ZXN0
dXNiLmNvbSB3aGljaCwgYXMgSSB1bmRlcnN0YW5kIGl0LCB0dXJucyBpbnRvIHRoZSBjb3JyZWN0
DQo+IGRldmljZSBieSBzZXR0aW5nIGl0cyBWSUQgYW5kIFBJRCBzbyBieSBuYXR1cmUgb2YgaG93
IGl0IHdvcmtzIEkgbXVzdCBoYXZlIGENCj4gImRldmljZSIgY29ubmVjdGVkLg0KPiANCg0KV2hp
Y2ggcG9ydCB5b3VyIHRlc3QgZGV2aWNlIGlzIGNvbm5lY3RlZCwgdGhlbiB3aGljaCBwb3J0IHdp
bGwgZW50ZXIgdGVzdCBtb2RlLCBpdCBpcw0KY29udHJvbGxlZCBieSBFSFNFVC4gVGhlIHRlc3Qg
ZGV2aWNlJ3MgVklEL1BJRCBtdXN0IGJlIHRoZSBzYW1lIHdpdGggZWhzZXRfaWRfdGFibGUNCmlu
IGVoc2V0LmMuDQoNCkZvciBleHRlcm5hbCBIVUIsIEkgaGF2ZSBuZXZlciBkb25lIHNpbmNlIEkg
b25seSB0ZXN0IFVTQiBjb250cm9sbGVyIG9uIFNvQy4NCkFzIE1hbnUgc2FpZCwgaWYgaXQgc3Vw
cG9ydHMgdGhlIGNvbW1hbmRzIGluIEVIU0VUIGluIGl0cyBmaXJtd2FyZSwgaXQgc2hvdWxkIHN1
cHBvcnQNCnB1dCBpdHMgZG93bnN0cmVhbSBwb3J0IGluIHRlc3QgbW9kZS4NCg0KUGV0ZXINCg==
