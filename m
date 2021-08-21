Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC03F3A37
	for <lists+linux-usb@lfdr.de>; Sat, 21 Aug 2021 12:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhHUKfE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Aug 2021 06:35:04 -0400
Received: from mail-eopbgr80042.outbound.protection.outlook.com ([40.107.8.42]:11488
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230101AbhHUKfD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 21 Aug 2021 06:35:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHADNIXDVPEThdYAfCRNz9fH6yH69QUANKX6SoCh4E/w2Lm9rShPXFZYw2cOd/OPzBtSnqCUnQwMFydJue3tlXHYuNKIz9SqtC0qCDMshsUNCDbhQuHEmRIkXBQsTXcgXJcYdfYDC8clPkGwL63ImsvbiyNH74EU4e/pASGLCfPUibQVk2KK8+HIQhN5Pd+s8AFl4NxL7MfkNHLo7jw8rGcqILEuEpmDKyppSz/VDZKZFFlul779bxxRW05sPo1qkMn0BxFu6H8zqX7gkpseHCatw2w3l1DdUFcMPJ22NdJZNWqFRX3QAqU4rAWTxM0varMbtkbDo7UXc8FE6WlTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4+T0CjCXkRqbfpVKf0Lbu3Cl3iqRC9Cp0lTrk7pxt8=;
 b=Y+U6JW17hnr9l1O+fHO6rY8HgxKe4MBmRM4FNQxwjRk+LPE9loKrQbtc7OcUdhVzSgmD2qK+xWTlGYjrKBNR56SbVuR92iV0nyWSpRH28G6DYrsV/1eCp7jcLQab9dSNg+JSZJHzv8QIyw8S/xpKUb0tMZbmh+LOM8kSYzVuGmuGDsxb7qa7U7b+3bVAb1URGb8t8BiIyrMod3ZWPDn/VIadEVc5xP8pCDkigITIBxJmOe0MylJIoj2EWoprjrlUm3vziNQ8xs7dPk3DvYVIC4Yj9nZOBDOjXsexe8QKG80CllBfgVYUUCCbi8Z2DoTopQ2AFCYyTHgTx7IhC9o5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4+T0CjCXkRqbfpVKf0Lbu3Cl3iqRC9Cp0lTrk7pxt8=;
 b=cL3ddCV3NE5ia/lDo9tYx97LXZHRJpWObpzzeyn4tmFuwrHxIrNG6Cbm3frHf3Vd+pr3JXWnnAPDTPIQH8G4T5YPLWRmOyOY7MVEtRyGeMBHboH6LBDSqmqpcA3OMtTzkxdcE4MoKJ6919Io3rG87DgW1N7waeofqCxd2QQsTXY=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB5264.eurprd04.prod.outlook.com (2603:10a6:803:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Sat, 21 Aug
 2021 10:34:22 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::60f5:9b63:9cc9:203a%4]) with mapi id 15.20.4436.022; Sat, 21 Aug 2021
 10:34:22 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: RE: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE
 Test for USB2
Thread-Topic: [PATCH v3 2/3] usb: host: xhci: add EH SINGLE_STEP_SET_FEATURE
 Test for USB2
Thread-Index: AQHXQxCW2zwo/NGYwk29lWCvxWaIvKsOvmuggDabpLCAAL9UgIA4T+Uw
Date:   Sat, 21 Aug 2021 10:34:21 +0000
Message-ID: <VI1PR04MB5935CB5ECEE9C079B922EA8F89C29@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1620370682-10199-1-git-send-email-jun.li@nxp.com>
 <1620370682-10199-2-git-send-email-jun.li@nxp.com>
 <VI1PR04MB5935A2455109376878C8440689349@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <VI1PR04MB59357337AC481C31887C474C89119@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <10cbe106-acd6-a06f-e613-4da93da46b0b@linux.intel.com>
In-Reply-To: <10cbe106-acd6-a06f-e613-4da93da46b0b@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60c5a2bb-1d32-4978-d108-08d9648f3d40
x-ms-traffictypediagnostic: VI1PR04MB5264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB52646CE6025AFDBB776E162E89C29@VI1PR04MB5264.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kVG830R8Cd/yWX7ZJbCxnwLH33IWWIft/bsFIJ0MxEGQ02Ak+HzdCj5AmBHafSjBBGBJKYQoVT6LMHRigcRoQwEag4xRmoPXIq/8w3e8b+yW4k6XSeZkVn3awfvjtla2UC+WToJPKPhT6+y9P7haSNzRM8/RLprkq8v9wVCfg5qDMq5vY2W3Q07IqFfFXuVrzQNR7Y4lQmArwIMuCcOy/cteVXyjH6a5HiZ4Tzag8vxnDGuPl0GRG1zQsnsfwwVYrU61h4aomDAUCJ/qaDVn77AaHdNPhMp4yssiVdKWZOlQwKdb9wyLFk73Ry2gtbYto0tGBwzb+EHfYK8wGZFMUh/yGO3pqiXHCjUldqP/USRLxHToY7ZoIQSCZF6q9P3CAHf6un8UcXFVUBIfYCJGYBguegXy2LUzMfkE5iShmuVxeTmsGHdO7qmq9tkiv69fgXBhlyfVkXeuk2SIMceRrTA2GugST7DsH6n85Kier4J1seyl63X/DISumnYqGIPu/OwRFoG+4SR2c9sT5GONu7JarTgy5OE26n81ZJDWU0+kdaHck0CJ10v5lN3aBgnGRfPVo4szInhiFxE2TmsaOiT4ZnxCEbzlLXB7lU8YQokeztNLgnbCEHTveJ+qeUUlLnvalFh4aKIlOQngU1XNPTcHwaoRDo19fC0KfMgwP9/hg1gQmpDcf5HeSzhl105geHoII3JQaTkdfZ38PWKkzA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(66556008)(316002)(54906003)(122000001)(64756008)(66446008)(8676002)(76116006)(44832011)(2906002)(5660300002)(110136005)(66946007)(8936002)(508600001)(4326008)(52536014)(38070700005)(38100700002)(86362001)(6506007)(26005)(186003)(83380400001)(71200400001)(55016002)(9686003)(7696005)(33656002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TS80dUJPVWFUUFRqRGYyYjlzNFlRQ1RPM25FYXl4TVBxc29VVnR2VXNpYitE?=
 =?utf-8?B?Misxc004NDNLOEdqNTBWbzBaT0padVpkL0Rva2M1UmN4Nks2Wk11ZHNPNm52?=
 =?utf-8?B?NXViN3p4R2hYWWNEaFNwb29BZHFha2wxUXBmTzIzTjBES1g4Q1psMCtYSlh5?=
 =?utf-8?B?WnFaOXc2Y2FDQUs3T2xKYkhLdGt1RkIrNnhMMjlMeFZ5UzRGWUdPRmI5cWN3?=
 =?utf-8?B?NU1aTFZFb3pYaW1QNTZXbGE1TkRlUmcvSjUxMjRVcS92aWl6VVhDQWRFZXMw?=
 =?utf-8?B?U21DL3E3NXU4MFNaa3ZiQmZBMlRNVi82SWpUeTBBR0ltWjZjWGlHMFlpcnJv?=
 =?utf-8?B?L21WcStQZmM3RDUraWtEVmtWREcvNEk1ZkVML0w4Z25hSlpRSTVkWmNtK2l5?=
 =?utf-8?B?eHlScTAxdkxHNW5hZVAvcFAzbWhzeVJPS25oTG1ubjN4cFkxM01XSkpiT2Zw?=
 =?utf-8?B?VGpIcjcvTU84MTh2aHFvUVltZ0p1MjJoSW1reGltOXNsa3lKN1JrK1NzNXhI?=
 =?utf-8?B?UUR3SjVtblNia08rVDEzaFhQODJOL3NqNm91RVAzYlNhQUF5bi9iVG1ib2I0?=
 =?utf-8?B?QnhTSGJuV055a1RGQ2ZnTnE2ODBPYkpWK1BJY2MwYVhhVmZrZWlQN3BSQnEx?=
 =?utf-8?B?MDVIKzA4YTlyTXorZHNMK3M5RTc4c2pWSTB4d2hwSjZYZFBQbVdNYWc4cGZ5?=
 =?utf-8?B?TWp6Y2hZZnBXcFpPQ0E4dEFyWWNHcThNQnZidCtsUW0zVkhjKzYzZnJlWUZR?=
 =?utf-8?B?Q3dZRXcyblRNeFJUT2poQlNpdWpKWWM5YlhmN0pVTUx1S3dWeW5oSzhsZ1Fl?=
 =?utf-8?B?bnVQcUh3anUvc2FFM2ltbG9GUVNDdVhkR3dwK1dWYjZ4Qmh1L1BFVVhBSUls?=
 =?utf-8?B?amJZRXhiUWM5R3plcGl4QjFCU05mMm15ZnFSVTM4YlBDTitmdytNN216QmpZ?=
 =?utf-8?B?emRNcmdEbVNWZzVEclBDdDVsbmFPSmYyeUVEcEt3RXZkV2djY1RCYlZBU1Zi?=
 =?utf-8?B?Zkpkcyt3K0R1UDJvRlBNRzdONmlrZ2xhTzk0YXN5M3psTTlJOWt6WnRwbjl2?=
 =?utf-8?B?MVFsN2U0TSswbHhrYldqNGRvS3hQeitBUmZQby8xNngvT1MxbGFpSWgzeS9G?=
 =?utf-8?B?MHB1cXZrVnpGQ2FZYVZ3Nmo0RWVQeGJpN3RXTG1XTGtTQloyVEJWVUEvYVdN?=
 =?utf-8?B?UXM4djgzWHRybUFZSlA0SkUrbHR4citqY3loRlBvUjMzWVhBdHBwWVBsdGx5?=
 =?utf-8?B?L3BxcGtWSThDb3VGbWNPUzlKZHFMcWwvNEdHQ2c3VlYycGJaR25hMEsxaFJu?=
 =?utf-8?B?cXpEdGFaUGNQbjNYM0NFMjZaT0M5T1FPemhmU2Z3QmJVeHE0dkhJQ3dYWENY?=
 =?utf-8?B?eVNnWEc3b1RpUEFzQkdVZm93MHhOSXY0SmtSMVBweUg3bDNjSjBQZlV0YTNK?=
 =?utf-8?B?TDlObi90STBteis2SDZWR0RScFJkR1BPOTdwcFptUFBPanYybVR5MEhTcTNH?=
 =?utf-8?B?M2JwRnR2Z3RnT0xvTGJKU0JDbWtZL2JNaXZGVUQ5c1BPWE11Tzg4R3dNcVkx?=
 =?utf-8?B?UmlzbnRyY1BMQ0F0Sjk1R2R4S0c3WVJsTnN6QXJnUk50cmVvbk5SSHlaTWtl?=
 =?utf-8?B?YzRyenFaNVlrV0FFckhJYzNnVEl3SFlyczNGTURIblJJc2pOR1JMeU05bnAz?=
 =?utf-8?B?TWdlT0h0RFRPZ2F3MzRSVHhGZ3A2ZTlsOGk0aHhVNHFvZm0wSHE3UDVUdDkr?=
 =?utf-8?Q?gvh8vVCDJSORj55cvBLw3fpMaf3fMUPd4mMum7j?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c5a2bb-1d32-4978-d108-08d9648f3d40
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2021 10:34:21.8595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YwHF8GeA49jz/s/fAD/rvrZnAQwfPF5vf0rifzMZZBNsJzLLk7wwWNiTk1SyPm8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5264
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWF0aGlhcywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRo
aWFzIE55bWFuIDxtYXRoaWFzLm55bWFuQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5
LCBKdWx5IDE2LCAyMDIxIDEwOjM1IFBNDQo+IFRvOiBKdW4gTGkgPGp1bi5saUBueHAuY29tPjsg
bWF0aGlhcy5ueW1hbkBpbnRlbC5jb20NCj4gQ2M6IHBldGVyLmNoZW5Aa2VybmVsLm9yZzsgamFj
a3BAY29kZWF1cm9yYS5vcmc7DQo+IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4
LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsg
c3Rlcm5Acm93bGFuZC5oYXJ2YXJkLmVkdQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDIvM10g
dXNiOiBob3N0OiB4aGNpOiBhZGQgRUggU0lOR0xFX1NURVBfU0VUX0ZFQVRVUkUNCj4gVGVzdCBm
b3IgVVNCMg0KPiANCj4gSGkNCj4gDQo+IE9uIDE2LjcuMjAyMSA2LjEyLCBKdW4gTGkgd3JvdGU6
DQo+ID4gSGkgTWF0aGlhcywNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBKdW4gTGkNCj4gPj4gU2VudDogRnJpZGF5LCBKdW5lIDExLCAyMDIxIDU6MTkg
UE0NCj4gPj4gVG86IG1hdGhpYXMubnltYW5AaW50ZWwuY29tDQo+ID4+IENjOiBwZXRlci5jaGVu
QGtlcm5lbC5vcmc7IGphY2twQGNvZGVhdXJvcmEub3JnOw0KPiA+PiBsaW51eC11c2JAdmdlci5r
ZXJuZWwub3JnOyBkbC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPjsNCj4gPj4gZ3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc7IHN0ZXJuQHJvd2xhbmQuaGFydmFyZC5lZHUNCj4gPj4gU3Vi
amVjdDogUkU6IFtQQVRDSCB2MyAyLzNdIHVzYjogaG9zdDogeGhjaTogYWRkIEVIDQo+ID4+IFNJ
TkdMRV9TVEVQX1NFVF9GRUFUVVJFIFRlc3QgZm9yIFVTQjINCj4gPj4NCj4gPj4NCj4gPj4NCj4g
Pj4+IEEgZ2VudGxlIHBpbmcuDQo+ID4NCj4gPiBDb3VsZCB5b3UgcGxlYXNlIHRha2UgYSBsb29r
IHRoaXMgcGF0Y2g/DQo+IA0KPiBUaGlzIHNvbWVob3cgZmVsbCB0aHJvdWdoIHRoZSBjcmFja3Ms
IHNvcnJ5Lg0KPiANCj4gSSdsbCBiZSBhd2F5IGZvciB0d28gd2Vla3Mgc28gdGhpcyB3aWxsIHVu
Zm9ydHVuYXRlbHkgYmUgZGVsYXllZCBldmVuIG1vcmUuDQo+IFNvcnJ5IGFib3V0IHRoaXMuDQoN
ClNlZW1zIHRoaXMgcGF0Y2ggaXMgc3RpbGwgbWlzc2VkLCBwaW5nIGFnYWluLg0KDQpMaSBKdW4N
Cj4gDQo+IC1NYXRoaWFzDQo+IA0KDQo=
