Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3480025B090
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 18:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbgIBQBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 12:01:02 -0400
Received: from mail-db8eur05on2077.outbound.protection.outlook.com ([40.107.20.77]:60001
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726678AbgIBQA5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Sep 2020 12:00:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjczjVeCo7ATKLp13TCbbDVJExjRGneCvkhbU7wu+uqgflFv51CmwCzbtiG/sFdLx4SkLi16CZZrdtIG4Ur29y+umM/78HmGTPR+/nidIotp634hKFXNxCZTTW1Q/AgIzJcS0TDk5i+SXkBnWvp5G44rGpFm9QpCUtk4NRIP7yw+P3CU+S0kBLCux57H6TmzpoRMHTE9CxwfhN+NpWp3aZck0HUq1hGbQYvgBRG5LA1v/DrQfygJdHCB4G4kqw7liPMrAyCxom+WY3QX6z17j9CdI8X880aqC8YypSG5uO9GtNrhujH9rGE/rC5YgPvSqFTQJ1Zcnw6nNuswyGvE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djCkHG+cQKBsY/xO5b0FhLN4suXq4P+YmKizSm/PjfM=;
 b=beGb2Qk0XbcB3PMiJJh2FInMBHsT/QQvqykDkImL25996wvBfLZHh9hAxPlvt4dPQSwThVwL89N5CslFXt3E2Df7YwYqXbSWKuPmCYzGU1/ppPaQzcmunwEjacIvjUHmsUf/hBDodocaXpWrxuXU+XXBuAymra6MRog/fx3UrExhhwg5eDaozhOxgr/ey1HLNr1fW3D0U80w3uVuyK7Q1GqEiLJ6e2yNN8mwdxOKo8OljlrborqVYRTlw1F/gvL859nZe65WjeqZRqnOUDxXEeuq42fvNUtM5B1r4tMK9tEDIA7EpOPL3cL/7Gv5VToEtnfNN4wkUooxjimXpzekIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djCkHG+cQKBsY/xO5b0FhLN4suXq4P+YmKizSm/PjfM=;
 b=OyFxlPSqfTiTj87asmgqdq6e7o48EhfLV4UVHIROhHVF+kLk9fK6/K0XM0G11c8HvFi785sw97VsNRGxmgfaLA0UZyCfQXTxMKbZaxy9oLHykD5LAeU6Q7tIwSfW7sDIQsQ2X6ZqoUUSGmu7v0IAyEr4CHm5pZzmD1L6Z4a1Td0=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB7487.eurprd04.prod.outlook.com (2603:10a6:800:1a2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Wed, 2 Sep
 2020 16:00:53 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3348.015; Wed, 2 Sep 2020
 16:00:53 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Topic: [PATCH v2] usb: xhci: add debugfs support for ep with stream
Thread-Index: AQHWW240LsQE47DpHka0ISI6aMQrkKk1+RLggAZonYCAAOs9cIAVLJ6AgALqhdCAADHCAIAANZjw
Date:   Wed, 2 Sep 2020 16:00:53 +0000
Message-ID: <VE1PR04MB65285CCF5DDF72D2F990B7DB892F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1594901321-6992-1-git-send-email-jun.li@nxp.com>
 <DB8PR04MB6523AC8B5B7C1DEDA1254F0A89430@DB8PR04MB6523.eurprd04.prod.outlook.com>
 <c6c4f598-ff8a-8b51-d87c-c5d20f4421a4@linux.intel.com>
 <VE1PR04MB65289D522279DD1267A1FFF5895C0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <5257ec39-9f59-58fe-661f-a1cd69955f1e@linux.intel.com>
 <VE1PR04MB6528936627B6478BE76813D6892F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <aa359d28-c53f-37b0-6e4f-19a312fb6293@linux.intel.com>
In-Reply-To: <aa359d28-c53f-37b0-6e4f-19a312fb6293@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5851d1ff-a323-4e7d-2e5f-08d84f595f1e
x-ms-traffictypediagnostic: VE1PR04MB7487:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB7487BED4CAD6062285BD66EA892F0@VE1PR04MB7487.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ydo/hkYnihdlgk0i2/0Akg6FA25bEvS3dB8xJ8vD+rXnLBFxFtOw1kFTLYhkjoVWy13SW+J+H8M1PWq4kDfjnFmv3vUx784MaJQM7Jg0mqLRwhhii+WrHAPmBzLJ/clYDlAgyiJ+0/oJn5F+5E7qpEa+rPBb17CLDWdrRyvl044LJ4eWp3o1g/f70vJqqaiMbwCSA1ZPUjblAT0qVBbeB8urd064hCk8l6kB2xEg/4Mfts6ITYZRm4KWxpKtBqv7RcB57kbi4OceEoB8glmrJaNT1VcGYarOt/fZl9dMKnJdFjIf9Sack3c3nAkRfXv6ekRgwtOsbXDDtF9/OthJhHxNKLjA00ZgoalBz/H8ZMbt+TzXmBkE+//iYApIhuKaKt63Tlbgo8RTCrFyJqSWNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(76116006)(33656002)(66946007)(66476007)(64756008)(26005)(5660300002)(66556008)(52536014)(186003)(83380400001)(71200400001)(83080400001)(86362001)(966005)(6506007)(8676002)(478600001)(66446008)(53546011)(110136005)(8936002)(45080400002)(9686003)(2906002)(54906003)(316002)(44832011)(55016002)(4326008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ggJ+Uyj19CYRgdabxDxX2Pgt0/hjOUkb1HZ1b0pAnPLHIpLUuvN6CbTNbiPXQLvyxN7f9MOMFAjZtcYgF7FNc9HuFOVmAGdKGWk+/MZYSDlMXiLLTN2522xcp1624VNbzmG0OLhEx72J65kD7sc3Oi1wxLDy8yQoryoWN/iHxOQ/tYFOINuAhFdv1aNnX7XHDnslhqu/odawptbhFZG0zLGa2m3saRKT1AaL0/4/V+uQ4mwWEabah9aUgv8zji+AjXJk5l14mfC0s8FsAOCZtGrZpicYH3j1S+TzkzYmmpG1W/bH+98pIGE3UzujfX6rn7BNs/AExx8Q1eHtzeF848onhOUh8aP0lGzquq7/DqaB2N7STjSbduhce0sN9SY9DEAdAK3nyessCT+rCkYnp6ToXdj6acd+EOgKfoizyKmU8JmMVPepdi9V9gvzGXiM7fAP/KUHQt3ssrs8EpB5/Kdp17PKijqU4+MoQPCfQzeKgJuPPE61bt3jenDpriK4gUlwik4sT5mQYsn2sw+1YWZYQFMeYnJVnY5yQan0KTqs/oq+ncEngdmFRibuyzPO8X/UufBrp9iQ5yo6us64+vvPQSEk1Fdc9UPT3Emyq8YrzkY2JXXlu8qaTj/nusLPUdjBF0ZFZ1YHWfaS2QOJ1g==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5851d1ff-a323-4e7d-2e5f-08d84f595f1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2020 16:00:53.7883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPMVHrWqLf4LqcgTAHLdd+CEMqrQM9SRexGEC2Bq/G8Vkl4/WUH0U6DZ3uocMHkw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7487
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlhcyBOeW1hbiA8
bWF0aGlhcy5ueW1hbkBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVt
YmVyIDIsIDIwMjAgODo0MSBQTQ0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47IG1hdGhp
YXMubnltYW5AaW50ZWwuY29tDQo+IENjOiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgbGlu
dXgtdXNiQHZnZXIua2VybmVsLm9yZzsgZGwtbGludXgtaW14DQo+IDxsaW51eC1pbXhAbnhwLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gdXNiOiB4aGNpOiBhZGQgZGVidWdmcyBzdXBw
b3J0IGZvciBlcCB3aXRoIHN0cmVhbQ0KPiANCj4gSGkNCj4gDQo+ID4+Pj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWRlYnVnZnMuYw0KPiA+Pj4+Pj4gYi9kcml2ZXJzL3Vz
Yi9ob3N0L3hoY2ktZGVidWdmcy5jIGluZGV4IDY1ZDhkZTQuLjcwODU4NWMgMTAwNjQ0DQo+ID4+
Pj4+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdmcy5jDQo+ID4+Pj4+PiArKysg
Yi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktZGVidWdmcy5jDQo+ID4+Pj4+PiBAQCAtNDUwLDkgKzQ1
MCwxNCBAQCB2b2lkIHhoY2lfZGVidWdmc19jcmVhdGVfZW5kcG9pbnQoc3RydWN0IHhoY2lfaGNk
DQo+ICp4aGNpLA0KPiA+Pj4+Pj4gIAlpZiAoIWVwcml2KQ0KPiA+Pj4+Pj4gIAkJcmV0dXJuOw0K
PiA+Pj4+Pj4NCj4gPj4+Pj4+ICsJaWYgKGRldi0+ZXBzW2VwX2luZGV4XS5yaW5nKQ0KPiA+Pj4+
Pj4gKwkJZXByaXYtPnNob3dfcmluZyA9IGRldi0+ZXBzW2VwX2luZGV4XS5yaW5nOw0KPiA+Pj4+
Pj4gKwllbHNlDQo+ID4+Pj4+PiArCQllcHJpdi0+c2hvd19yaW5nID0gZGV2LT5lcHNbZXBfaW5k
ZXhdLm5ld19yaW5nOw0KPiA+Pj4+Pj4gKw0KPiA+Pg0KPiA+PiBSYW4gc29tZSB0ZXN0cyBhbmQg
dGhlIEkgc3VzcGVjdCB0aGUgYWJvdmUgY29kZSBjYXVzZXMgaXNzdWVzLg0KPiA+Pg0KPiA+PiBJ
ZiBhbiBlbmRwb2ludCBpcyBkcm9wcGVkIGFuZCBhZGRlZCBiYWNrIHRoZSBhYm92ZSBjb2RlIHdp
bGwgc3RvcmUNCj4gPj4gdGhlIG9sZCByaW5nIGluIGVwcml2LT5zaG93X3JpbmcgYXMgd2UgaGF2
ZSBib3RoIGEgLnJpbmcgYW5kIC5uZXdfcmluZyBwcmVzZW50DQo+IGF0IHRoYXQgbW9tZW50Lg0K
PiA+PiBTb29uIGFmdGVyIHRoaXMgdGhlIG9sZCByaW5nIHBvaW50ZWQgdG8gYnkgLnJpbmcgd2ls
bCBiZSBmcmVlZCwgYW5kDQo+ID4+IC5yaW5nID0gLm5ld19yaW5nIHdpbGwgYmUgc2V0Lg0KPiA+
DQo+ID4gWWVzLCBpbiB0aGlzIGNhc2UsIGVwc1tlcF9pbmRleF0ucmluZyBzdGlsbCBrZWVwcyB0
aGUgb2xkIHJpbmcNCj4gPiBhZGRyZXNzLCBidXQgZXBzW2VwX2luZGV4XS5uZXdfcmluZyBpcyBw
b2ludGluZyB0byB0aGUgbmV3L2NvcnJlY3QNCj4gPiByaW5nLCBteSBwYXRjaCB3aWxsIHN0b3Jl
IHRoZSBvbGQgcmluZyBhZGRyZXNzLg0KPiA+DQo+ID4+DQo+ID4+IE9sZCBjb2RlIHNob3dlZCB3
aGF0ZXZlciByaW5nIGJ1ZmZlciBlcHNbaV0ucmluZyBwb2ludGVyIHBvaW50ZWQgLHRvDQo+ID4+
IHdoZW4gdGhlIHN5c2ZzIGZpbGUgd2FzIHJlYWQsIChhcyB3ZSBzYXZlZCB0aGUgYWRkcmVzcywN
Cj4gPj4gJmVwc1tpXS5yaW5nKS4gSSBzZWUgbm93IHRoYXQgaXQgaW4gdGhlb3J5IGl0IGhhZCBh
IHNtYWxsIGdhcCBiZWZvcmUNCj4gPj4gLnJpbmcgPSAubmV3X3Jpbmcgd2FzIHNldCB3aGVyZSB1
c2VyIGNvdWxkIHJlYWQgdGhlIHJpbmcgYnVmZmVyIGFuZCAucmluZyB3b3VsZA0KPiBzdGlsbCBi
ZSBhIE5VTEwgcG9pbnRlci4NCj4gPj4gVGhhdCBuZWVkcyB0byBiZSBmaXhlZCBhcyB3ZWxsLg0K
PiA+DQo+ID4gWWVzLCBhbHNvIGluIGFib3ZlIGRyb3AtdGhlbi1hZGQtYmFjayBjYXNlIHRoZSBv
bGQgY29kZSBlcHNbaV0ucmluZw0KPiA+IHN0aWxsIHBvaW50cyB0byB0aGUgb2xkIHJpbmcuDQo+
IA0KPiB5ZXMsIGJ1dCBvbmx5IHVudGlsIGZvciBhIHNob3J0IHdoaWxlIHVudGlsIC5yaW5nID0g
Lm5ld19yaW5nIGlzIHNldC4NCj4gDQo+ID4NCj4gPiBTbyBjb25zaWRlcmluZyB3ZSBhcmUgY3Jl
YXRpbmcgZGVidWdmcyBmaWxlIGZvciBlcCBiZWZvcmUgLnJpbmcgPQ0KPiA+IC5uZXdfcmluZzsg
Lm5ld19yaW5nID0gTlVMTDsNCj4gPg0KPiA+IEEgc29sdXRpb24gb2YgZmlyc3RseSBjaGVjayAu
bmV3X3Jpbmcgc2VlbXMgY2FuIHJlc29sdmUgdGhlIHByb2JsZW1zIGhlcmU6DQo+ID4NCj4gPiBp
ZiAoZGV2LT5lcHNbZXBfaW5kZXhdLm5ld19yaW5nKQ0KPiA+IAkvKiBGb3IgZmlyc3QgYWRkIG9m
IEVQOyBvciBkcm9wLXRoZW4tYWRkLWJhY2sgRVAgKi8NCj4gPiAJZXByaXYtPnNob3dfcmluZyA9
IGRldi0+ZXBzW2VwX2luZGV4XS5uZXdfcmluZzsgZWxzZQ0KPiA+IAkvKiBGb3IgRVAwICovDQo+
ID4gCWVwcml2LT5zaG93X3JpbmcgPSBkZXYtPmVwc1tlcF9pbmRleF0ucmluZzsNCj4gPg0KPiAN
Cj4gSSB0aGluayB0aGlzIGRlYnVnZnMgY29kZSBpcyBqdXN0IGNhbGxlZCB0b28gZWFybHkuIEl0
IHNob3VsZG4ndCBuZWVkIHRvIGNoZWNrIG5ld19yaW5nDQo+IHBvaW50ZXIgYXQgYWxsLg0KPiAN
Cj4gSSB3cm90ZSBhIGZpeCB0aGF0IGNoYW5nZXMgdGhlIG9yZGVyIGFuZCBtYWtlcyBzdXJlIGVu
ZHBvaW50IGlzIGVuYWJsZWQgYW5kIHJpbmcNCj4gcG9pbnRlciBpcyBzZXQgY29ycmVjdGx5IGJl
Zm9yZSB3ZSBjYWxsIHhoY2lfZGVidWdmc19jcmVhdGVfZW5kcG9pbnQoKQ0KPiANCj4gaHR0cHM6
Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGZ2l0Lmtlcm5lbC5vDQo+IHJnJTJGcHViJTJGc2NtJTJGbGludXglMkZrZXJuZWwlMkZnaXQl
MkZtbnltYW4lMkZ4aGNpLmdpdCUyRmNvbW1pdCUyRiUzRmglM0Rmbw0KPiByLXVzYi1saW51cyUy
NmlkJTNEY2Y5OWFlZjU2MjRhNTkyZmQ0ZjMzNzRjNzA2MGJmYTFhNjVmMTVkZiZhbXA7ZGF0YT0w
MiU3QzAxJTcNCj4gQ2p1bi5saSU0MG54cC5jb20lN0M3M2U0NjYzYTZmNjY0MWZiYjhiMzA4ZDg0
ZjNkMDIxYSU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5DQo+IGM1YzMwMTYzNSU3QzAlN0MwJTdD
NjM3MzQ2NDcwODAzOTIyODk1JmFtcDtzZGF0YT1pNERmQ1c4RVZVU0FXbnpiOFFsNGpQakFPRDV3
cA0KPiB0ZmJhTXJPOHZLdnREYyUzRCZhbXA7cmVzZXJ2ZWQ9MA0KDQpUaGlzIGlzIGEgZ29vZCBw
bGFjZSBmb3Igbm9uLXplcm8gRXBzLCBidXQgZG9lcyBub3QgY292ZXIgZXAwLg0KDQpMaSBKdW4g
DQo+IA0KPiBJIHRoaW5rIHRoaXMgc3RyZWFtcyBzdXBwb3J0IHNob3VsZCBiZSBhZGRlZCBvbiB0
b3Agb2YgdGhhdA0KPiA+Pg0KPiA+PiBJIHN0aWxsIGxpa2UgdGhlIG9sZCB3YXkgb2YgdXNpbmcg
ZG91YmxlIHBvaW50ZXIgbW9yZS4NCj4gPj4geGhjaSBkcml2ZXIgd2lsbCBhbHNvIGRpZyBvdXQg
dGhlIGN1cnJlbnQgcmluZyBmcm9tIGVwc1tpXS5yaW5nLCBzbyBJDQo+ID4+IHRoaW5rIHdlIHNo
b3VsZCBhcyB3ZWxsLg0KPiA+PiAoaW4gc3RyZWFtIGNhc2UgaXQgd291bGQgYmUNCj4gPj4gJmVw
LT5zdHJlYW1faW5mby0+c3RyZWFtX3JpbmdzW3N0cmVhbV9pZF0pDQo+ID4NCj4gPiBzdHJlYW0g
Y2FzZSBzaG91bGQgbm8gcHJvYmxlbSBhcyBpdCBpcw0KPiA+IGVwcml2LT5zaG93X3JpbmcgPSBl
cC0+c3RyZWFtX2luZm8tPnN0cmVhbV9yaW5nc1tzdHJlYW1faWRdOw0KPiANCj4gU291bmRzIGdv
b2QNCj4gDQo+IC1NYXRoaWFzDQo=
