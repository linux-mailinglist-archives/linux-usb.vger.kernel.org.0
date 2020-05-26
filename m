Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F7D1E2767
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 18:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388612AbgEZQqW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 12:46:22 -0400
Received: from mail-bn8nam12on2054.outbound.protection.outlook.com ([40.107.237.54]:51136
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728339AbgEZQqV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 12:46:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0I9lq4v72CVEZ1aFizZHgQEak8HbGhbSHliuW/ViCZhq5kED+ArVCWmKBYHi58x40tCHSLN3Cmnfl8KMrTrJ3tXGgwIxuAkGOP0YE64eh1XcMxKqoTGq9wN5HNbhdUQXzQ1Hz83+PnQEMv2g4n3AWr8YbDDxawIfnpSMY58oXF2c0ve0ki8ao1DX8SaNieJSgJkEj0XtaujTl2EBwDQUzjw9YpMLbuwHSokDzDUCa3Gg7DUMbfLsxDLd/upFKxN0WZ2PcOeJev83f/IP9yu0Sg6qVpWquhq9WbifL7m1lhYeyUTu47n2UDuiW+LTnEnjWs6bvVfxDQkwJaV/GYFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqOMelgc4FCycFZci/YDZdQiJSayxKi/qc5l8nznN4A=;
 b=Qnw4T8EpFRttxjU/jmkh/b4QTAmfodAeUED3RQSRBatY8czt+qJvm9miluLe1E4/6UV3yjf3fi8jJfQGuI1SdIBSCTLz+GruddB2g3rJ3jhfxITS6Y2cP2GlLp9suhqpkuCwIuqYyYyMNqAzy8BUxgxMmtM3DftM2lcvJmPDdmtufyqr0+lDi95oqDPuGh0Yc9ijJTEsykv1DHy4Utouf8rHAzsWm3FW0Rpplu9UlvjRH+mlnBaaPG3WHBB18AY4kJLCH9thgQc4boZ8/OMuWfDH374r5fmLUvr02b5vKdXtvmZyY5/wnGyKDULkeg35RSYgsdNYq9vVh1+ro5Ci7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqOMelgc4FCycFZci/YDZdQiJSayxKi/qc5l8nznN4A=;
 b=RkrMN/X4Qc2o8GIPobJdimokjx0+BwKyt1gUNNneP6oPC61PTD7OllOE+mN7OmTCAd89duHjrv+b4hjMJ/+uB8nHV2Lr0p4a8SBQ+YfS+CLMesQfwKyI4r9hjeX1qo693ZOXEXj00eQViCqXW8pNbbBkYD23dmrS2vJ+KEptdSU=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3716.namprd10.prod.outlook.com (2603:10b6:408:b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 16:46:18 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 16:46:18 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUA
Date:   Tue, 26 May 2020 16:46:17 +0000
Message-ID: <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
In-Reply-To: <1590488084.2838.34.camel@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffc6dbe3-5922-46dd-32f1-08d801944fe6
x-ms-traffictypediagnostic: BN8PR10MB3716:
x-microsoft-antispam-prvs: <BN8PR10MB37163A391AFA77F03A8B04CEF4B00@BN8PR10MB3716.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kA8spAMMm81JVI+LpCfjYEJGE2B9jm2q45UYTo3u7lsN6sd3FK5YibFvIi0sakwfm8ZnyyqejNqEGCXyvbtxqhMisJ6UIm/SHBNe1XFFEf7P1KCaklTx9Xt/Ung/h1B+AtKwqP6TcCbpsaWRTTJ0oSeiuGHX7lefnne3PPYwdRpmoFhviIDNDmb9v3lHfWc3NTjSX1j/DfPLzkyEyjv8X9XtWuHAmS7rdg+xasek1JWhy2zqVU25DGjzLR9GJJ+guZxx2v12qZTOAsN9HMotOg1V0pjcgaG3Fqt3+rEwziUwiTPSI2YMBswOB2PMDFdL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(376002)(366004)(136003)(39860400002)(91956017)(66556008)(66476007)(66946007)(2906002)(36756003)(71200400001)(64756008)(76116006)(6512007)(5660300002)(8936002)(2616005)(186003)(66446008)(110136005)(6486002)(6506007)(26005)(316002)(8676002)(86362001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SbxUwNKKBi7IVMVwGMH53JAtLFAuF9WWnECNtQ9DWsjKJ8owI2JfxObzlY+JPlWvFDiwqaxUT4qB4Z4wkyH6j1QiflolsPaUejLBmnYEQagfA9QMrKa5LXuG7gNrVDQewxsEvOHpdG0UmwQA2XekBpXpdOIW9UBvOn2O666GrlIw04fWn276XOFNfHS/jz/vycUDrYFaHSGFCAsvs/jOC4qVWO8qvGbtQEs0DfKdcbs68xXahUZtzmxjjmvvTIRRM2dP/Oph16bAfOTiZ55bgt7Ut4bDLHBYkh8C53lSblpmeBRG8cazAg9QA2H9jLXH9LweNYZhZ8QKa5uJro2FYS0zQQiv8CajuqjxZ0Xu+ibMfIGESsZyTx9a6RtRjx1tWrFvs/E63XdgxYcE0Gk8EdqQpllfmWNIi8as2XsudNUudG5cAOmHc7bBYMQfVnzRvA6zC2SjF3/3Sy6MHPS6cT+rK17bPU6w8RKbzmg9Oh8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <339076A7FB665747BBC8CCB141990E22@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc6dbe3-5922-46dd-32f1-08d801944fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 16:46:17.9629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QAiWdGlO2q4kAm1BhKVzNFsNtKj7KVEqeot6XPaq+cfGWDi/FruaIRkE2lDFNlm9rpmAOrklxrZ/jbtFR8woxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3716
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIwLTA1LTI2IGF0IDEyOjE0ICswMjAwLCBPbGl2ZXIgTmV1a3VtIHdyb3RlOg0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdh
bml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4g
DQo+IA0KPiBBbSBEaWVuc3RhZywgZGVuIDI2LjA1LjIwMjAsIDA4OjU5ICswMDAwIHNjaHJpZWIg
Sm9ha2ltIFRqZXJubHVuZDoNCj4gPiBPbiBUdWUsIDIwMjAtMDUtMjYgYXQgMTA6NDcgKzAyMDAs
IE9saXZlciBOZXVrdW0gd3JvdGU6DQo+ID4gPiBBbSBNb250YWcsIGRlbiAyNS4wNS4yMDIwLCAx
Njo0OSArMDAwMCBzY2hyaWViIEpvYWtpbSBUamVybmx1bmQ6DQo+ID4gPiANCj4gPiA+ID4gVG8g
YmUgY2xlYXIsIEkgY2FuIHB1bGwgdGhlIGNhYmxlIGFuZCBwdXQgaXQgYmFjayBhbmQgdGhlcmUg
YXJlIG5vIGdhcmJhZ2UgY2hhcnMuDQo+ID4gPiA+IFRoZXJlIGlzIGFsc28gdGhpcyBlcnJvcjoN
Cj4gPiA+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjUgMjAyMF0gY2RjX2FjbSAxLTYuMzoxLjE6IGFj
bV9jdHJsX2lycSAtIHVzYl9zdWJtaXRfdXJiIGZhaWxlZDogLTE5DQo+ID4gPiA+IFtXZWQgTWF5
IDIwIDE0OjAzOjI1IDIwMjBdIHVzYiAxLTYtcG9ydDI6IGF0dGVtcHQgcG93ZXIgY3ljbGUNCj4g
PiA+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjYgMjAyMF0gdXNiIDEtNi4zOiBVU0IgZGlzY29ubmVj
dCwgZGV2aWNlIG51bWJlciA4Ng0KPiA+ID4gPiBbV2VkIE1heSAyMCAxNDowMzoyNiAyMDIwXSBj
ZGNfYWNtIDEtNi4zOjEuMTogZmFpbGVkIHRvIHNldCBkdHIvcnRzDQo+ID4gPiA+IA0KPiA+ID4g
PiBTaG91bGQgbm90IHRoaXMgYXV0byByZWVuYWJsZSBlbXVsYXRlIHJlYXR0YWNoaW5nIHRoZSBV
U0IgY2FibGU/DQo+ID4gPiANCj4gPiA+IEhpLA0KPiA+ID4gDQo+ID4gPiB5ZXMgaXQgc2hvdWxk
LiBZb3UgZmluZCB0aGUgZ2FyYWdlIGNoYXJhY3RlcnMgYWZ0ZXIgdGhlIEVNSSBldmVudC4gSG93
DQo+ID4gPiBzdXJlIGFyZSB5b3UgdGhhdCB0aGV5IGFycml2ZSBhZnRlciB0aGUgZXZlbnQgYW5k
IG5vdCBkdXJpbmcgdGhlIGV2ZW50Pw0KPiA+ID4gDQo+ID4gDQo+ID4gRG9uJ3Qga25vd24gaG93
IHRvIGRldGVybWluZSB0aGF0Pw0KPiA+IEkgY2FuIHNheSB0aGF0DQo+ID4gICAgYWNtX2N0cmxf
aXJxIC0gdXNiX3N1Ym1pdF91cmIgZmFpbGVkOiAtMTkNCj4gDQo+IC0xOSBpcyAtRU5PREVWDQo+
IA0KPiBUaGUgZHJpdmVyIHRoaW5rcyB0cmllcyB0byByZXN1Ym1pdCB0aGUgVVJCIGFza2luZyBm
b3IgY29udHJvbA0KPiBtZXNzYWdlcy4NCj4gQmFzaWNhbGx5IHlvdSBhcmUgc2VlaW5nIGVycm9y
IGhhbmRsaW5nIHN0YXJ0aW5nIGFuZCBmYWlsaW5nIGR1ZQ0KPiB0byBhIHN1YnNlcXVlbnQgZGlz
Y29ubmVjdC4NCj4gDQo+ID4gYW5kDQo+ID4gICAgY2RjX2FjbSAxLTYuMzoxLjE6IGZhaWxlZCB0
byBzZXQgZHRyL3J0cw0KPiA+IGFyZSB1bmlxdWUgdG8gdGhpcyBFTUkgZXZlbnQgdGhvdWdoLiBJ
dCBkb2VzIG5vdCBmZWVsIGxpa2UgdGhpcw0KPiA+IHJlZW5hYmxpbmcgZm9sbG93IHRoZSBzYW1l
IHByb2NlZHVyZSBhcyBhIGNhYmxlIHB1bGw/DQo+ID4gQXMgSSBjYW4gb25seSBzZWUgdGhlIGFi
b3ZlIHR3byBlcnJvcnMgSSB0aGluayB3ZSBzaG91bGQgZ2V0IHJpZCBvZg0KPiA+IHRoZXNlIGZp
cnN0Lg0KPiANCj4gVGhlIHRpbWluZyBpcyBkaWZmZXJlbnQgYW5kIGlmIHRoZXJlIGlzIEVNSSB0
cmFuc2ZlciBjYW4gZW5kDQo+IGluIGVycm9ycyBhbmQgY2F1c2UgZXJyb3IgaGFuZGxpbmcgdG8g
a2ljayBpbi4gWW91IGFyZSBzZWVpbmcNCj4gc3ltcHRvbXMuIFlvdSBjYW4gdHJ5IGVuYWJsaW5n
IGR5bmFtaWMgZGVidWdnaW5nIHRvIGdldA0KPiBhIGJldHRlciBsb2cuDQo+IA0KPiAgICAgICAg
IFJlZ2FyZHMNCj4gICAgICAgICAgICAgICAgIE9saXZlcg0KPiANCg0KVHJpZWQgc29tIGR5bmFt
aWMgZGVidWcgZm9yIG1vZHVsZSBjZGNfYWNtIGdvdCBzb21ldGhpbmcgSSBjYW5ub3QgcGFyc2U6
DQpbVHVlIE1heSAyNiAxODoyNDozMCAyMDIwXSBjZGNfYWNtIDEtNi4zOjEuMTogdHR5QUNNMDog
VVNCIEFDTSBkZXZpY2UNCltUdWUgTWF5IDI2IDE4OjI0OjMwIDIwMjBdIGNkY19hY20gMS02LjM6
MS4xOiBhY21fY3RybF9tc2cgLSBycSAweDIwLCB2YWwgMHgwLCBsZW4gMHg3LCByZXN1bHQgNw0K
W1R1ZSBNYXkgMjYgMTg6MjQ6NDMgMjAyMF0gdXNiIDEtNi4yOiBuZXcgaGlnaC1zcGVlZCBVU0Ig
ZGV2aWNlIG51bWJlciAzNiB1c2luZyB4aGNpX2hjZA0KW1R1ZSBNYXkgMjYgMTg6MjQ6NDMgMjAy
MF0gY2RjX2V0aGVyIDEtNi4yOjEuMCB1c2IwOiByZWdpc3RlciAnY2RjX2V0aGVyJyBhdCB1c2It
MDAwMDowMDoxNC4wLTYuMiwgQ0RDIEV0aGVybmV0IERldmljZSwgOTI6ZDE6Yzk6YjQ6OTE6ZDUN
CltUdWUgTWF5IDI2IDE4OjI0OjQzIDIwMjBdIElQdjY6IEFERFJDT05GKE5FVERFVl9VUCk6IHVz
YjA6IGxpbmsgaXMgbm90IHJlYWR5DQpbVHVlIE1heSAyNiAxODoyNTo0MCAyMDIwXSBjZGNfYWNt
IDEtNi4zOjEuMTogYWNtX2N0cmxfbXNnIC0gcnEgMHgyMiwgdmFsIDB4MywgbGVuIDB4MCwgcmVz
dWx0IDANCltUdWUgTWF5IDI2IDE4OjI1OjQwIDIwMjBdIGNkY19hY20gMS02LjM6MS4xOiBhY21f
dHR5X3NldF90ZXJtaW9zIC0gc2V0IGxpbmU6IDExNTIwMCAwIDAgOA0KW1R1ZSBNYXkgMjYgMTg6
MjU6NDAgMjAyMF0gY2RjX2FjbSAxLTYuMzoxLjE6IGFjbV9jdHJsX21zZyAtIHJxIDB4MjAsIHZh
bCAweDAsIGxlbiAweDcsIHJlc3VsdCA3DQpbVHVlIE1heSAyNiAxODoyNTo0MiAyMDIwXSBjZGNf
YWNtIDEtNi4zOjEuMTogYWNtX2N0cmxfaXJxIC0gdXJiIHNodXR0aW5nIGRvd24gd2l0aCBzdGF0
dXM6IC0yDQpbVHVlIE1heSAyNiAxODoyNTo0MiAyMDIwXSBjZGNfYWNtIDEtNi4zOjEuMjogYWNt
X3JlYWRfYnVsa19jYWxsYmFjayAtIHVyYiBzaHV0dGluZyBkb3duIHdpdGggc3RhdHVzOiAtMg0K
Li4uLg0KDQpJIGRvIG5vdGUgb25lIHRoaW5nIGluOg0KDQpGaXJzdCBjb25uZWN0IGFmdGVyIHBv
d2VyIG9uIGZvciB0aGUgZ2FkZ2V0IEkgc2VlIHNvbWUgZ2FyYmFnZSBjaGFycyB3aGVuIGNvbm5l
Y3Rpbmcgd2l0aCBjdS4NCkhvd2V2ZXIsIGlmIEkganVzdCBkbyBhICJjYXQgL2Rldi90dHlBQ00w
IiwgQ3RybC1DIGFuZCB0aGVuIGN1IEkgdGhlcmUgYXJlIG5vIGdhcmJhZ2UgY2hhcnMuDQoNCkl0
IGZlZWxzIGxpa2UgdGhlIGdhZGdldCBpcyBzcGV3aW5nIHNvbWUgZ2FyYmFnZSBhdCBwb3dlciBv
biBhbmQgdGhpcyBnZXRzIHNhdmVkIGluIGhvc3RzIGNkY19hY20sIG9uY2UNCkkgb3BlbiAvZGV2
L3R0eUFDTTAgZm9yIHdyaXRlLCB0aGVzZSBnZXRzIGVjaG9lZCBiYWNrIHRvIHRoZSBnYWRnZXQu
DQpJZiBzbywgY2RjX2FjbSBmYWlscyB0byBjbGVhciBpdHMgYnVmZmVycyBiZWZvcmUgdGhlIGZp
cnN0IG9wZW4sIGRvZXMgdGhpcyBtYWtlIHNlbnNlIHRvIHlvdT8NCg0KIEpvY2tlDQo=
