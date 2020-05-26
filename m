Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499DC1E286E
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 19:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388654AbgEZRTm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 13:19:42 -0400
Received: from mail-mw2nam10on2085.outbound.protection.outlook.com ([40.107.94.85]:21185
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388061AbgEZRTl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 13:19:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZkyfOCHlujNTlzCaiEAk5hTV4tBMW+LEjzQ9o2FXpABb2dFmBovS77Xwqorha8C6YphQadlA6ZoV/SY5DlTIOfAmo4b/k9MtIY7YdmjUuaAzqBjciArFCPMIkASrCTW4P9+XosQcSD9YR1RtLPteAROz0vyZ/QwtPISx0c3+pctPoB1FqbszE4jUqmDQYoTSCbyq0kI/CcN72y4kpAl7fVDhcBv5GukjZfYTc0bCLQCl4Aa5d5Ayck995Ljb4YjDJVvvhENKKJYGKSznKCk9E1+d1g4XdLsiVO4XLba+k70UoJaZKOfg3wcBdFwQjZSYTb6GLqMQ4u0DHCbnygrpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoEiZcgygynnzDCXPqPO6ODcBNAXdEc0JKy0AaqUq8Q=;
 b=miKASnnhNdBBouvg/nM9DZtZ9KN0jZ7qwOKkmHrk6zlqzKBFUohBcxshh8uppbo3sg8rdIYAjyEHdM3jwJfOTLNi4jb1wieUwPSdsZAQdLR1msV20Y0gF7ITaxcjPuJRpfAoX8otwkiAJvLva76LL5ylV+jzm3FQGsaW764/x8YAxBgTLe2YoNCrIO7654EnW9b5s81QAMqxS5Nk6D8ihik3euTKhwDmuBT2DD4Mns+OzSPaYIDiogrqrveq5mE/uY14tX4ErdjHRv8KUOU9jkyGVBtCZiVzwf4VsnPFJTrxg0QTzFHh6XUI0gfctOSi5sgcFApSNQPDi8GJNVvswg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BoEiZcgygynnzDCXPqPO6ODcBNAXdEc0JKy0AaqUq8Q=;
 b=IEQz5JianCUkb0SSqq3ffqVJqPKKSACBx+HfPxCL0GiRtJJrR+MFEhTu/EiZZOX8So4lQQJ0gJL+7diU1LGRuOqgTAvnqJW2BfHV5pEN1NRJv2oG/pGRkEsJkaHbkEBuOe+b8omE/YGJpmo0UeVD2Y5nj9QlmBQGQSFvN+jZd5E=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3571.namprd10.prod.outlook.com (2603:10b6:408:ad::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 17:19:38 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 17:19:38 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.com" <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Topic: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
Thread-Index: AQHWMqM6W5iP9Jkv9UCEGIiDuBaJw6i45d+AgAADdICAABpkAIABC5qAgAADbYCAABTvAIAAbWUAgAAJUgA=
Date:   Tue, 26 May 2020 17:19:38 +0000
Message-ID: <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
In-Reply-To: <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 993ccb98-5d3f-4469-7198-08d80198f857
x-ms-traffictypediagnostic: BN8PR10MB3571:
x-microsoft-antispam-prvs: <BN8PR10MB35713631049798A90E554A0CF4B00@BN8PR10MB3571.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 041517DFAB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8LtCouV6gRmfzG/kAq4GEYJ3DSZsGMFxEOGvalCpuuaD0nXzENTM/u+VOf/bYjW4xKYUN9TRsJcXUOGGAuZnnwKu9GI+AOrU8OPDHIa+gr2Mol6o6pZT8j7OBGxtRXmuzT3qn2H6KcthiBzxbowTn9qQd6KqIbFaB5quVfmpo9OnViMV8G0W/ZuIlKJeJN/pKSq9dvzQPxZPodNTm7E4IjhAmjiezcZm2qAgg/tV+RVpLpY6/q8OmuYsNK3SEgVvR5S0Un/m5F8gcEmrqPqEMiVPB6rB1Ztb7FR32v2xE60cRPIe+7ZrPko5Nu1hRCdEH76rnH+tHY+e5NRsywfJXQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(91956017)(76116006)(66556008)(66946007)(2906002)(64756008)(36756003)(71200400001)(110136005)(26005)(6512007)(2616005)(8936002)(5660300002)(6506007)(66446008)(6486002)(186003)(66476007)(478600001)(86362001)(8676002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Z2ldQrNPXtylhs3IPg5E/p1Mq3nh7yMKC4hpqMvOSNFSzH/Y0n3fyWfw+jCx3wt7pWyoFv77j0eXHlzttcqX3ncjD7dTrEjzrLiLe53B4svp376LhukGFTbBNvGjfPcFNDG95fRZiz4WvdyCU3HxazCviBgwuZwI8S3AJeOvmibxzWJofb0qqvN8AyTx/gXjTo7KucVDFvXAC2cvLorNjjJqx1QFLenbHf7K4ljv3rR69UbkKKBPexKvNAHOBQmkY2iIJdD45p/1m9XXW+4YDd5Umz424Yx8u7ge1eD4RdsQacvz05OFbFgBDaC6GTwbrDXEsCAYMWVg6UbKdG5w9EXmVBovEoJoobP588mTgb2P/h7ubfwVJ7iJYC3XG3u+QOes63Y++E3DkFhnjN2biBNWx6Ckii0qG9LXOUUWScmV1lbiW5U7RUvQdaWBWbMU7tqqWCvuL8mhaWksLbheZVFXTSHNzuDmWtHqfAqUmvs=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <76A34C2C8BB2C24E91E61E5327D58861@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993ccb98-5d3f-4469-7198-08d80198f857
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2020 17:19:38.4772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SyJglhw9zf2Uac+P4tniWnTJ7YhYQHXCfvWQyW05W/fp6Y6wh0hAmkZmGSdfIa1rdfM9o0zvddnSyErJ9wcBVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3571
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIwLTA1LTI2IGF0IDE4OjQ2ICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBUdWUsIDIwMjAtMDUtMjYgYXQgMTI6MTQgKzAyMDAsIE9saXZlciBOZXVrdW0gd3Jv
dGU6DQo+ID4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0
aGUgb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNh
ZmUuDQo+ID4gDQo+ID4gDQo+ID4gQW0gRGllbnN0YWcsIGRlbiAyNi4wNS4yMDIwLCAwODo1OSAr
MDAwMCBzY2hyaWViIEpvYWtpbSBUamVybmx1bmQ6DQo+ID4gPiBPbiBUdWUsIDIwMjAtMDUtMjYg
YXQgMTA6NDcgKzAyMDAsIE9saXZlciBOZXVrdW0gd3JvdGU6DQo+ID4gPiA+IEFtIE1vbnRhZywg
ZGVuIDI1LjA1LjIwMjAsIDE2OjQ5ICswMDAwIHNjaHJpZWIgSm9ha2ltIFRqZXJubHVuZDoNCj4g
PiA+ID4gDQo+ID4gPiA+ID4gVG8gYmUgY2xlYXIsIEkgY2FuIHB1bGwgdGhlIGNhYmxlIGFuZCBw
dXQgaXQgYmFjayBhbmQgdGhlcmUgYXJlIG5vIGdhcmJhZ2UgY2hhcnMuDQo+ID4gPiA+ID4gVGhl
cmUgaXMgYWxzbyB0aGlzIGVycm9yOg0KPiA+ID4gPiA+IFtXZWQgTWF5IDIwIDE0OjAzOjI1IDIw
MjBdIGNkY19hY20gMS02LjM6MS4xOiBhY21fY3RybF9pcnEgLSB1c2Jfc3VibWl0X3VyYiBmYWls
ZWQ6IC0xOQ0KPiA+ID4gPiA+IFtXZWQgTWF5IDIwIDE0OjAzOjI1IDIwMjBdIHVzYiAxLTYtcG9y
dDI6IGF0dGVtcHQgcG93ZXIgY3ljbGUNCj4gPiA+ID4gPiBbV2VkIE1heSAyMCAxNDowMzoyNiAy
MDIwXSB1c2IgMS02LjM6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDg2DQo+ID4gPiA+
ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjYgMjAyMF0gY2RjX2FjbSAxLTYuMzoxLjE6IGZhaWxlZCB0
byBzZXQgZHRyL3J0cw0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFNob3VsZCBub3QgdGhpcyBhdXRv
IHJlZW5hYmxlIGVtdWxhdGUgcmVhdHRhY2hpbmcgdGhlIFVTQiBjYWJsZT8NCj4gPiA+ID4gDQo+
ID4gPiA+IEhpLA0KPiA+ID4gPiANCj4gPiA+ID4geWVzIGl0IHNob3VsZC4gWW91IGZpbmQgdGhl
IGdhcmFnZSBjaGFyYWN0ZXJzIGFmdGVyIHRoZSBFTUkgZXZlbnQuIEhvdw0KPiA+ID4gPiBzdXJl
IGFyZSB5b3UgdGhhdCB0aGV5IGFycml2ZSBhZnRlciB0aGUgZXZlbnQgYW5kIG5vdCBkdXJpbmcg
dGhlIGV2ZW50Pw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gRG9uJ3Qga25vd24gaG93IHRvIGRl
dGVybWluZSB0aGF0Pw0KPiA+ID4gSSBjYW4gc2F5IHRoYXQNCj4gPiA+ICAgIGFjbV9jdHJsX2ly
cSAtIHVzYl9zdWJtaXRfdXJiIGZhaWxlZDogLTE5DQo+ID4gDQo+ID4gLTE5IGlzIC1FTk9ERVYN
Cj4gPiANCj4gPiBUaGUgZHJpdmVyIHRoaW5rcyB0cmllcyB0byByZXN1Ym1pdCB0aGUgVVJCIGFz
a2luZyBmb3IgY29udHJvbA0KPiA+IG1lc3NhZ2VzLg0KPiA+IEJhc2ljYWxseSB5b3UgYXJlIHNl
ZWluZyBlcnJvciBoYW5kbGluZyBzdGFydGluZyBhbmQgZmFpbGluZyBkdWUNCj4gPiB0byBhIHN1
YnNlcXVlbnQgZGlzY29ubmVjdC4NCj4gPiANCj4gPiA+IGFuZA0KPiA+ID4gICAgY2RjX2FjbSAx
LTYuMzoxLjE6IGZhaWxlZCB0byBzZXQgZHRyL3J0cw0KPiA+ID4gYXJlIHVuaXF1ZSB0byB0aGlz
IEVNSSBldmVudCB0aG91Z2guIEl0IGRvZXMgbm90IGZlZWwgbGlrZSB0aGlzDQo+ID4gPiByZWVu
YWJsaW5nIGZvbGxvdyB0aGUgc2FtZSBwcm9jZWR1cmUgYXMgYSBjYWJsZSBwdWxsPw0KPiA+ID4g
QXMgSSBjYW4gb25seSBzZWUgdGhlIGFib3ZlIHR3byBlcnJvcnMgSSB0aGluayB3ZSBzaG91bGQg
Z2V0IHJpZCBvZg0KPiA+ID4gdGhlc2UgZmlyc3QuDQo+ID4gDQo+ID4gVGhlIHRpbWluZyBpcyBk
aWZmZXJlbnQgYW5kIGlmIHRoZXJlIGlzIEVNSSB0cmFuc2ZlciBjYW4gZW5kDQo+ID4gaW4gZXJy
b3JzIGFuZCBjYXVzZSBlcnJvciBoYW5kbGluZyB0byBraWNrIGluLiBZb3UgYXJlIHNlZWluZw0K
PiA+IHN5bXB0b21zLiBZb3UgY2FuIHRyeSBlbmFibGluZyBkeW5hbWljIGRlYnVnZ2luZyB0byBn
ZXQNCj4gPiBhIGJldHRlciBsb2cuDQo+ID4gDQo+ID4gICAgICAgICBSZWdhcmRzDQo+ID4gICAg
ICAgICAgICAgICAgIE9saXZlcg0KPiA+IA0KPiANCj4gVHJpZWQgc29tIGR5bmFtaWMgZGVidWcg
Zm9yIG1vZHVsZSBjZGNfYWNtIGdvdCBzb21ldGhpbmcgSSBjYW5ub3QgcGFyc2U6DQo+IFtUdWUg
TWF5IDI2IDE4OjI0OjMwIDIwMjBdIGNkY19hY20gMS02LjM6MS4xOiB0dHlBQ00wOiBVU0IgQUNN
IGRldmljZQ0KPiBbVHVlIE1heSAyNiAxODoyNDozMCAyMDIwXSBjZGNfYWNtIDEtNi4zOjEuMTog
YWNtX2N0cmxfbXNnIC0gcnEgMHgyMCwgdmFsIDB4MCwgbGVuIDB4NywgcmVzdWx0IDcNCj4gW1R1
ZSBNYXkgMjYgMTg6MjQ6NDMgMjAyMF0gdXNiIDEtNi4yOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2
aWNlIG51bWJlciAzNiB1c2luZyB4aGNpX2hjZA0KPiBbVHVlIE1heSAyNiAxODoyNDo0MyAyMDIw
XSBjZGNfZXRoZXIgMS02LjI6MS4wIHVzYjA6IHJlZ2lzdGVyICdjZGNfZXRoZXInIGF0IHVzYi0w
MDAwOjAwOjE0LjAtNi4yLCBDREMgRXRoZXJuZXQgRGV2aWNlLCA5MjpkMTpjOTpiNDo5MTpkNQ0K
PiBbVHVlIE1heSAyNiAxODoyNDo0MyAyMDIwXSBJUHY2OiBBRERSQ09ORihORVRERVZfVVApOiB1
c2IwOiBsaW5rIGlzIG5vdCByZWFkeQ0KPiBbVHVlIE1heSAyNiAxODoyNTo0MCAyMDIwXSBjZGNf
YWNtIDEtNi4zOjEuMTogYWNtX2N0cmxfbXNnIC0gcnEgMHgyMiwgdmFsIDB4MywgbGVuIDB4MCwg
cmVzdWx0IDANCj4gW1R1ZSBNYXkgMjYgMTg6MjU6NDAgMjAyMF0gY2RjX2FjbSAxLTYuMzoxLjE6
IGFjbV90dHlfc2V0X3Rlcm1pb3MgLSBzZXQgbGluZTogMTE1MjAwIDAgMCA4DQo+IFtUdWUgTWF5
IDI2IDE4OjI1OjQwIDIwMjBdIGNkY19hY20gMS02LjM6MS4xOiBhY21fY3RybF9tc2cgLSBycSAw
eDIwLCB2YWwgMHgwLCBsZW4gMHg3LCByZXN1bHQgNw0KPiBbVHVlIE1heSAyNiAxODoyNTo0MiAy
MDIwXSBjZGNfYWNtIDEtNi4zOjEuMTogYWNtX2N0cmxfaXJxIC0gdXJiIHNodXR0aW5nIGRvd24g
d2l0aCBzdGF0dXM6IC0yDQo+IFtUdWUgTWF5IDI2IDE4OjI1OjQyIDIwMjBdIGNkY19hY20gMS02
LjM6MS4yOiBhY21fcmVhZF9idWxrX2NhbGxiYWNrIC0gdXJiIHNodXR0aW5nIGRvd24gd2l0aCBz
dGF0dXM6IC0yDQo+IC4uLi4NCj4gDQo+IEkgZG8gbm90ZSBvbmUgdGhpbmcgaW46DQo+IA0KPiBG
aXJzdCBjb25uZWN0IGFmdGVyIHBvd2VyIG9uIGZvciB0aGUgZ2FkZ2V0IEkgc2VlIHNvbWUgZ2Fy
YmFnZSBjaGFycyB3aGVuIGNvbm5lY3Rpbmcgd2l0aCBjdS4NCj4gSG93ZXZlciwgaWYgSSBqdXN0
IGRvIGEgImNhdCAvZGV2L3R0eUFDTTAiLCBDdHJsLUMgYW5kIHRoZW4gY3UgSSB0aGVyZSBhcmUg
bm8gZ2FyYmFnZSBjaGFycy4NCj4gDQo+IEl0IGZlZWxzIGxpa2UgdGhlIGdhZGdldCBpcyBzcGV3
aW5nIHNvbWUgZ2FyYmFnZSBhdCBwb3dlciBvbiBhbmQgdGhpcyBnZXRzIHNhdmVkIGluIGhvc3Rz
IGNkY19hY20sIG9uY2UNCj4gSSBvcGVuIC9kZXYvdHR5QUNNMCBmb3Igd3JpdGUsIHRoZXNlIGdl
dHMgZWNob2VkIGJhY2sgdG8gdGhlIGdhZGdldC4NCj4gSWYgc28sIGNkY19hY20gZmFpbHMgdG8g
Y2xlYXIgaXRzIGJ1ZmZlcnMgYmVmb3JlIHRoZSBmaXJzdCBvcGVuLCBkb2VzIHRoaXMgbWFrZSBz
ZW5zZSB0byB5b3U/DQo+IA0KDQpHb3Qgc29tZSBldmlkZW5jZSBub3csIEkgY2hhbmdlIHRoZSBk
ZWZhdWx0IGJhdWQgcmF0ZSBmb3JtIDk2MDAgdG8gMTE1MjAwIGluIGNkY19hY20gYW5kIG5vdw0K
SSBjYW4gc2VlKGluc3RlYWQgb2YgZ2FyYmFnZSBjaGFycyk6DQpjdSB1c2JhY20wDQpDb25uZWN0
ZWQuDQpeQA0KDQoNCg0KVS1Cb290IFNQTA0KDQoNClRoaXMgInUtYm9vdCBTUEwiIGlzIHRoZSBm
aXJzdCB0aGluZyB1LWJvb3Qgd3JpdGVzIGFuZCBzb21laG93IHRoaXMgaXMgcmVtZW1iZXJlZCwg
SSBhc3N1bWUsIGJ5IGNkY19hY20gDQphbmQgZ2V0cyBlY2hvZWQgYmFjayB3aGVuIEkgb3BlbiB0
dHlBQ00wDQoNCiBKb2NrZQ0K
