Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C15F717B3CA
	for <lists+linux-usb@lfdr.de>; Fri,  6 Mar 2020 02:31:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgCFBbk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Mar 2020 20:31:40 -0500
Received: from mail-am6eur05on2068.outbound.protection.outlook.com ([40.107.22.68]:17569
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726271AbgCFBbk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 5 Mar 2020 20:31:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVe6sw701gddmdCmP1SNLbBIb3aGAfNq7z3iXs5R2Z3OOIg3TaIzWnGQTTwkAn3985f0g8Hd+TaS5v4b6kac0cjLB5JHwnwoNAHmk9q+gJWJcdDDpS24B6KnZmfsAYbDORauusVSZumxFA9saTfMyaaaYpMopTa2anyR5awiT+sl/6qEo//2u88jAI92dwH+Peit/vp7YXfOVY3QmzTbJ8h1jkqCb8nHM1l0CqPBTSnfiqivtFJ+Nv7D7w8UEk3G9xjw1Q3hGBku5LhUfTnC0qrLnruZVj/aB4HsP+lrNJ6H9sta47+NOqpe9OX6SPUYytsxVuk3ZCQUUlBZeMpaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35mc460fnip0nAc6lcKQ6zZ94M0ToCy7rD1q2kKQ1AI=;
 b=geCc/wkAOdWWt3EV48Tasj6vtyh5D2Tb1BbNbIYOkqse5Kfr25ujY/UXa9l7Leo0XXySmfbRy+A8SNbWIOFKjOfnN7FSpcBcZi3vUmhjCGo0wE0pcGh7daoWULiSjz23U4ubE106pCeAWVeWVHUVfKqyOSO7EH0sR6k5ggxSfhxCnviYt4h4M5o7+JBHxfZd9slWE9497gyO2LvEWR1MaGVECOwIMjhft1+vlFqKSHMtFUJoOad/SeWpseX0r3PyzA9RFhac6DVUF83GOJ4R5CORP+Wjg69jTk51xo6hCjX0CdIkN2Inb23fDhojQu8nM3jXUMShOUrIFqnyKU+n6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35mc460fnip0nAc6lcKQ6zZ94M0ToCy7rD1q2kKQ1AI=;
 b=c1mrXW9NzQUO0IxAG5TtTfwLac/3+RBxzyvgtWC5/6IeOBp2FmX5k/c6YjDnD8VOiDgCXs+Uo8Fs0zDoK1Nf2EFKxcek27po7924vyvPXnldiPgcdHb0uI8+PQl+y/ZMI0+qCTxolOJJMbYOpqNMYKZG9+rozR2OPo8E0m8BM8E=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4015.eurprd04.prod.outlook.com (52.134.122.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Fri, 6 Mar 2020 01:31:35 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::9547:9dfa:76b8:71b1%7]) with mapi id 15.20.2772.019; Fri, 6 Mar 2020
 01:31:35 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Oliver Neukum <oneukum@suse.com>,
        Jonas Karlsson <jonas.karlsson@actia.se>,
        Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: RE: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgADgE2AAAdLkAAAIaJ9AAAEO3aAAAR/HgAARWqdUA==
Date:   Fri, 6 Mar 2020 01:31:35 +0000
Message-ID: <VI1PR04MB532785057FD52DFE3A21ACA88BE30@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
 <20200303163945.GB652754@kroah.com>
 <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
 <6909d182-6cc5-c07f-ed79-02c741aec60b@linux.intel.com>
 <1583331173.12738.26.camel@suse.com>
 <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
In-Reply-To: <4fa64e92-64ce-07f3-ed8e-ea4e07d091bb@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2e68fb95-1ff3-4cb6-0024-08d7c16e1bcb
x-ms-traffictypediagnostic: VI1PR04MB4015:
x-microsoft-antispam-prvs: <VI1PR04MB4015EA2181AA85BC934C92078BE30@VI1PR04MB4015.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0334223192
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(199004)(189003)(26005)(966005)(2906002)(4326008)(52536014)(5660300002)(186003)(45080400002)(6506007)(478600001)(71200400001)(81156014)(66446008)(64756008)(33656002)(55016002)(66556008)(66946007)(66476007)(44832011)(54906003)(8936002)(76116006)(81166006)(9686003)(86362001)(110136005)(316002)(7696005)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4015;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TOMev1sm2fem0Ddx8A9BUoWwnE+z9lDJgtOiEj1CW0oHluUmM0wTlm16Bn/u/4F5MrytW7cRA7GkALt4cAzQqOq+pu3S07cpWNRSxZXvkH0GErwjVr3EZBNfKORcoGxEujjSNyojZ36XLNQ0kHvr5ZFVVJRWbmh5xL/gv0CPiaVLHaDneXsOsN0f3pl5p0Ir/pJTKxFkmvFpmQUevVS2g3Tx/xPIP1jnezMVNSzUmZc6wUNcIuBKbBn3i3qdlQXu1AQdecB3a5EcRZsaL+7X14/7FXrWgDT4Z1OFaZVychoi78Tv4gHdFERhdF7bsSgN4iVJ/HqR4nId6Sfoz9fifXduZcTzlMxtXTt3ZOBheYtHIAbmKTCTXQ1r0RN0/CmbBDD4sEEGlqzOr84xDtxSWihBSolRQJJLy2wETPELOe2CAuDe5irP1FBPdQOC4VM6dBrrIVEqnviDm0Rj9YIM1Ixw8eiDkEBW5Na/Y3Qll7xqCbgSo+MHSzmYKA3BYQI7LTygCYRqL8Qkp8c7iEjYrA==
x-ms-exchange-antispam-messagedata: vs5B4+bnjRNvm2EwFtb22L+ViDJYxWA8ftvPQHUOQ6sAbx6mmx0wmrUbI2pZ83LrRUuETtjuHgB6OP3ESFxwRuMWUsIEaWTyMSMoUUaAa4jzomuGRY5Y/PoxUoDsb21xctnk6HEp9re9SDNz5C8Kcg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e68fb95-1ff3-4cb6-0024-08d7c16e1bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2020 01:31:35.1437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y445AVrkZ4GsPfhc17wQ1oCavgvGm713a/J/wnMx9KrA9Jc90xir2sxCZQ4jclbcVdnC7AeHh9F2Q2R336PmKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4015
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+Pg0KPiA+PiBJIHJlY2VudGx5IGdvdCBhIHJlcG9ydCBhYm91dCBhIGJpdCBzaW1pbGFy
IGlzc3VlIG9uIGEgNC40IHN0YWJsZQ0KPiA+PiBrZXJuZWwsIHNvIHRoaXMgbWlnaHQgbm90IGJl
IHhoY2ktY2RucyBzcGVjaWZpYy4NCj4gPj4NCj4gPj4gVGhhdCBjYXNlIGludm9sdmVkIGF1dG9z
dXNwZW5kIG9mIHRoZSBjZGMtYWNtLCBhbmQgdGhlcmUgd2FzIG9ubHkgYQ0KPiA+PiBzaG9ydCBi
dXJzdCBvZiB0cmFuc2FjdGlvbiBlcnJvcyBhbmQgcmVzdWJtaXR0ZWQgVVJCcyBldmVuIGlmIHRo
ZSBkZXZpY2Ugd2FzDQo+IHN1cHBvc2VkIHRvIGJlIHN1c3BlbmRlZC4NCj4gPj4gSXQgbG9va3Mg
bGlrZSBjZGNfYWNtIGF1dG9zdXNwZW5kZWQgZXZlbiBpZiBpdCBoYWQgVVJCcyBwZW5kaW5nLg0K
PiA+DQo+ID4gVGhhdCBtdXN0IG5vdCBoYXBwZW4uIERvIHlvdSBoYXZlIGRldGFpbHM/DQo+IA0K
PiBTaGFyZWQgd2hhdCBJIGdvdCBpbjoNCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVj
dGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZHJpdmUuZ29vZ2xlLg0KPiBjb20l
MkZvcGVuJTNGaWQlM0QxUGp3bUlLOTdiSWZ1Z1dMNjk3bEpDZTY1eXVEVk9aaHgmYW1wO2RhdGE9
MDIlDQo+IDdDMDElN0NwZXRlci5jaGVuJTQwbnhwLmNvbSU3QzNjNTgxNWNhNWVjMzQ1YmUwMTc1
MDhkN2MwNTdjYzZkJTdDNg0KPiA4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3
QzAlN0M2MzcxODkzNTU2MzAwNjIwODAmYW1wOw0KPiBzZGF0YT1PMTQ2Ymtrc3dDeUZob0JUeTky
dUR0TVklMkJuNDNobzc4JTJGNjlJeGp1WEUyTSUzRCZhbXA7cmVzDQo+IGVydmVkPTANCj4gDQo+
IGNkYy1hY20gaXMgdW5mb3J0dW5hdGVseSBub3QgdHJhY2VkLCBidXQgdXNiIGNvcmUgYW5kIHho
Y2kgaXMuDQo+IGdyZXAgZm9yICJNQVRUVSIgdG8gZmluZCB0aGUgcmVsZXZhbnQgcGxhY2VzLg0K
PiANCj4gPg0KPiA+PiBJJ20gZ3Vlc3NpbmcgdGhhdCBpbiB0aGF0IGNhc2UgdGhlIHRyYW5zZmVy
IHJpbmcgcmVzdGFydGVkIGV2ZW4gaWYNCj4gPj4gbGluayB3YXMgYWxyZWFkeSAic3VzcGVkZWQi
LCBjYXVzaW5nIHRyYW5zYWN0aW9uIGVycm9ycy4gUmluZyBjb3VsZA0KPiA+PiBiZSByZXN0YXJ0
ZWQgaWYgVVJCcyB3ZXJlIHJlc3VibWl0dGVkIGJ5IHRoZSBjbGFzcyBkcml2ZXIgd2hlbiB1c2IN
Cj4gPj4gY29yZSBzdXNwZW5kcyBhbGwgaW50ZXJmYWNlcywgZmx1c2hpbmcgYWxsIHBlbmRpbmcg
VVJCcyB3aGljaCBjYWxscyB0aGUgVVJCDQo+IGNvbXBsZXRpb24gaGFuZGxlci4NCj4gPg0KPiA+
IEhvdyBzaG91bGQgYSBjbGFzcyBkcml2ZXIgZG8gdGhhdD8gSXQgZ2V0cyAtRVBST1RPIGFuZCB0
aGF0J3MgaXQsDQo+ID4NCj4gPiAJUmVnYXJkcw0KPiA+IAkJT2xpdmVyDQo+ID4NCj4gDQo+IFRo
aXMgaXMganVzdCBteSBzcGVjdWxhdGlvbiwgSSBoYXZlbid0IGNoZWNrZWQgZGV0YWlscyB5ZXQu
DQo+IA0KPiBJdCdzIG5vdCBqdXN0IHRoZSBjbGFzcyBkcml2ZXIgdGhhdCBjYXVzZXMgdGhpcywg
YnV0IGEgY29tYmluYXRpb24gb2YgdGhlIGZvbGxvd2luZyBnYXBzDQo+IGluIHhoY2ksIGNkYy1h
Y20sIGFuZCB1c2IgY29yZS4NCj4gDQo+IEEgY2xhc3MgZHJpdmVyIGF1dG9zdXNwZW5kaW5nIHdp
dGggVVJCcyBwZW5kaW5nLCBhbmQgbm90IGtpbGxpbmcgYWxsIFVSQnMNCj4gc3luY2hyb25vdXNs
eSB3aGVuIHVzYiBjb3JlIGNhbGxzIHN1c3BlbmQgZm9yIHRoZSBpbnRlcmZhY2UgZHJpdmVycy4N
Cj4gDQo+IHhoY2kgcmVzdGFydGluZyBhbiBlbmRwb2ludCByaW5nIGR1ZSB0byBhIHJhY2UgYmV0
d2VlbiB4aGNpX3N0b3BfZGV2aWNlKCksIGhhbmRsaW5nDQo+IGEgVHJhbnNhY3Rpb24gZXJyb3Is
IGFuZCBoYXZpbmcgcGVuZGluZyBVUkIgKHVuaGFuZGxlZCB0cmIpIG9uIHRoZSByaW5nLiBbMV0N
Cj4gDQo+IFNsZWVwaW5nIGJldHdlZW4gc2V0dGluZyBwb3J0IHRvIFUzIGxpbmsgc3RhdGUsIGFu
ZCBjbGVhcmluZyB1ZGV2LT5jYW5fc3VibWl0Lg0KPiBhbGxvd2luZyBVUkJzIHRvIGJlIHN1Ym1p
dHRlZCBkdXJpbmcgdGhhdCBnYXAgd2hlbiBsaW5rIGlzIGluIFUzIGFscmVhZHkuDQo+IFVSQnMg
d2lsbCBjb21wbGV0ZSB3aXRoIC1FUFJPVE8sIGFuZCByZXN1Ym1pdHRlZCB1bnRpbCB1ZGV2LT5j
YW5fc3VibWl0IGlzDQo+IGNsZWFyZWQuDQo+IA0KPiB1c2JfcnVudGltZV9zdXNwZW5kKCkNCj4g
ICB1c2Jfc3VzcGVuZF9ib3RoKCkgLy8gc3VzcGVuZCBhIGRldmljZSBhbmQgaXRzIGludGVyZmFj
ZXMNCj4gICAgIGZvciAoZWFjaCB1ZGV2LT5hY3Rjb25maWctPmludGVyZmFjZSkNCj4gICAgICAg
dXNiX3N1c3BlbmRfaW50ZXJmYWNlKHVkZXYsIGludGYsIG1zZyk7DQo+IAlkcml2ZXIgPSB0b191
c2JfZHJpdmVyKGludGYtPmRldi5kcml2ZXIpOw0KPiAJc3RhdHVzID0gZHJpdmVyLT5zdXNwZW5k
KGludGYsIG1zZyk7ICAvLyBVUkJzIHNodW9sZCBiZSBraWxsZWQsIHN5bmMsIG1pc3MNCj4gb25l
Pz8NCj4gICAgIHVzYl9zdXNwZW5kX2RldmljZSgpDQo+ICAgICAgIGdlbmVyaWNfc3VzcGVuZCgp
DQo+ICAgICAgICAgdXNiX3BvcnRfc3VzcGVuZCgpDQo+ICAgICAgICAgICBodWJfc2V0X3BvcnRf
bGlua19zdGF0ZShVU0JfU1NfUE9SVF9MU19VMykNCj4gICAgICAgICAgICAgeGhjaV9zdG9wX2Rl
dmljZSgpDQo+ICAgICAgICAgICAgIHhoY2lfc2V0X2xpbmtfc3RhdGUoVVNCX1NTX1BPUlRfTFNf
VTMpICAvLyBwb3J0IGxpbmsgaXMgaW4gVTMNCj4gICAgICAgICAgICAgbXNsZWVwKCkgICAgICAg
Ly8gZHVyaW5nIHRoaXMgVVJCcyBjYW4gYmUgcmVzdWJtaXR0ZWRlZCBhbmQgY29tcGxldGUgd2l0
aCAtDQo+IEVQUk9UTyBsb29wDQo+ICAgICB1ZGV2LT5jYW5fc3VibWl0ID0gMDsgIC8vIHdlIGNh
biBzdWJtaXQgVVJCcyB1bnRpbCBoZXJlIChleGNlcHQgdGhlIGtpbGxlZCBvbmVzLA0KPiB0aGV5
IGFyZSBmbGFnZ2VkKS4NCj4gICAgIGZvciAoZWFjaCBlbmRwb2ludCkNCj4gICAgICAgdXNiX2hj
ZF9mbHVzaF9lbmRwb2ludCh1ZGV2LCB1ZGV2LT5lcF9vdXRbaV0pOw0KPiAgICAgICB1c2JfaGNk
X2ZsdXNoX2VuZHBvaW50KHVkZXYsIHVkZXYtPmVwX2luW2ldKTsNCj4gDQo+IFsxXQ0KPiB4aGNp
X3N0b3BfZGV2aWNlKCkNCj4gICB4aGNpX3F1ZXVlX3N0b3BfZW5kcG9pbnQoKQ0KPiAtPiBpbnRl
cnJ1cHQgKHRyYW5zZmVyIGV2ZW50LCByaW5nIGhhcyBub3Qgc3RvcHBlZCB5ZXQpDQo+ICAgaGFu
ZGxlX3R4X2V2ZW50KCkgIC8vIGJ1bGsgdHJhbnNmZXIgd2l0aCBUcmFuc2FjdGlvbiBlcnJvcg0K
PiAgICAgcHJvY2Vzc19idWxrX2ludHJfdGQoKQ0KPiAgICAgICBmaW5pc2hfdGQoKQ0KPiAJeGhj
aV9jbGVhbnVwX2hhbHRlZF9lbmRwb2ludCgpDQo+ICAgICAgICAgICB4aGNpX3F1ZXVlX3Jlc2V0
X2VwKCkNCj4gICAgICAgICAgIHhoY2lfcXVldWVfbmV3X2RlcXVldWVfc3RhdGUoKQ0KPiAtPiBp
bnRlcnVwdCwgY29tbWFuZCBjb21wbGV0aW9uIGV2ZW50IGZvciBzdG9wIGVuZHBvaW50LCBpbnRl
cnJ1cHQNCj4gLT4gaGFuZGxlIHJlc2V0X2VwIGNvbW1hbmQsIHhoY2lfaGFuZGxlX2NtZF9zdG9w
X2VwKCkgaW50ZXJydXB0IGhhbmRsZQ0KPiAtPiBuZXcgZGVxIHN0YXRlDQo+ICAgICAgIHhoY2lf
aGFuZGxlX2NtZF9zZXRfZGVxKCkNCj4gCXJpbmdfZG9vcmJlbGxfZm9yX2FjdGl2ZV9yaW5ncyh4
aGNpLCBzbG90X2lkLCBlcF9pbmRleCkgIC0gdGhpcyByZXN0YXJ0cyB0aGUgcmluZy4NCj4gDQoN
CklmIGF1dG9zdXNwZW5kIGlzIHN1c3BpY2lvdXMsIEpvbmFzLCBjb3VsZCB5b3UgcGxlYXNlIHRy
eSB0byBkaXNhYmxlIGF1dG9zdXNwZW5kIGZvciBhbGwNClVTQiBkZXZpY2VzIChpbmNsdWRpbmcg
dGhlIHJvb3RodWIgYW5kIGNvbnRyb2xsZXIpIHRvIHNlZSB3aGF0IGhhcHBlbnM/DQoNClBldGVy
DQo=
