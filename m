Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E87191FF4FA
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 16:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730831AbgFROl7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 10:41:59 -0400
Received: from mail-eopbgr10120.outbound.protection.outlook.com ([40.107.1.120]:13440
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726478AbgFROl6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Jun 2020 10:41:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6vizPeE/3NEtCY/ejRpijS2L2SVL6QP2OldNsl/J1VSypPyW1m6v87U7kzr8/BKfkx7PUz/wdrB0uYfDsLeORYKG4HwJ/C4BDpWyyPgBbXXcGa6krmHv3xOS/cYcKNTdWjBIZoMwsvRh39R2FAM2A+nSPtZqQvYJ0wgHwhp0G/G9a0qx/VtuL5TwrhUi0+x7sgbyrJ0F3d654aQ/qvAJ465/boUFhvjVAvNGSJ1foiXIu2dK9dxZF0kgpnRkIeytoul0JbUVcavUBfId9FbeErFpjexuBpaGIS8zM/OTlsVCHuT8sfcdjUJvIp+4wvvhtfBvlpR0CXppq+ooAH/oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwx12fV87ThCGqU9ft9paYJmh1+PR+XOiGL+ExS38rg=;
 b=S4JBbdPvDg+0FLRE21KdgNIuFhutGXx7fuTpDwHwi7wbJN5uCE9pFSoUxi2/VYuQ599LHa+L5RUor7wV2dyg0e0W4RFLupmFG5sZAOin05aQyEMZQnTaGu7J9nYqqM7NFtj2Oxu2IhmLgEMJYXW02jqb0vWY3bA5i+c9Kj/df9IZILiVcoJUn8rFlAVpNiAcOCzmwEnpiTjCvxR0ToSKsgfwXc59nuJ9uAi3zToCzT7yLFiMb+j/xJSAyhWjIf/KwjKj8kWU3M98XXxNWYbDwN2hMuBPNqfPmfSQdE04ND6ZT2GgzS03NzHtuxD64ENKvmPZ/NRmjehgXp0R8pFH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwx12fV87ThCGqU9ft9paYJmh1+PR+XOiGL+ExS38rg=;
 b=rjBeSo+9KzX2ugAbZYQLozDvU+mqLd4AMeSOKsHEJynBsBgqubJoL4r588zN0IxlBe3KW5woN6UzYPgPZHZ0Snet33PL+7KZIddA8ZxDhFNJQ5TC65UwvXPt4GI3rtqUIEUgpaJMKlWssVLycDXY17jIUVFi6mZsgZpuz7ZyFJI=
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com (2603:10a6:20b:a8::25)
 by AM6PR05MB5285.eurprd05.prod.outlook.com (2603:10a6:20b:64::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 18 Jun
 2020 14:41:53 +0000
Received: from AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::d8d3:ead7:9f42:4289]) by AM6PR05MB6120.eurprd05.prod.outlook.com
 ([fe80::d8d3:ead7:9f42:4289%6]) with mapi id 15.20.3088.029; Thu, 18 Jun 2020
 14:41:53 +0000
From:   Philippe Schenker <philippe.schenker@toradex.com>
To:     "hzpeterchen@gmail.com" <hzpeterchen@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Stefan Agner <stefan.agner@toradex.com>
Subject: USB difficulties with an iMX6ULL
Thread-Topic: USB difficulties with an iMX6ULL
Thread-Index: AQHWRX6bY1fYG3LvHU+Nxv9VFjLuKw==
Date:   Thu, 18 Jun 2020 14:41:52 +0000
Message-ID: <87837d44165d71ecfb0ec22ec2dae6460cb0503c.camel@toradex.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=toradex.com;
x-originating-ip: [51.154.7.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5938886d-638e-45d8-7ce4-08d81395be15
x-ms-traffictypediagnostic: AM6PR05MB5285:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB5285F1CF9FAB4FC54FD264E3F49B0@AM6PR05MB5285.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/D8Z2/OImTkJkSi1+tjku8g1UEkTAIt6mQBDZxVtidMh7wpd7kh0gU/7yDWSubrNQUSeBHDdaSo5hkhy0X/Tpo8XWVVvofmB/qGmjqx14Ax++DVFAwq7DRoWXpjukkRddfe+3mZi+UA0cHxpCQ/Sk0Gdv+iWDy6RPnCwnDDP8GUxp4jh+1FLiyFUzAlS8Trj0XpN21P9/f2zYWMHj+DAOQNahYMF3dJMm6UKIwebOAgqTwInrwJZW/Gwd0VCtz/E5WwPLjloIsCIVY0aEGpYUIjMuviBuhghs4inYtthMCVwwQci2HD+uLt14WcXTTK6MkGKEYj/FqwTzO1GbELskksT4rxGfDitd6AenchV0VvQfbIkEOBOv6+si8V1ch1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR05MB6120.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(136003)(39850400004)(366004)(376002)(346002)(36756003)(2616005)(66946007)(71200400001)(44832011)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(8676002)(478600001)(6506007)(186003)(8936002)(6486002)(316002)(5660300002)(107886003)(54906003)(110136005)(83380400001)(2906002)(4326008)(26005)(86362001)(6512007)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 8ncsXC+rRQm0Lz76nHaZub0EUHlyawMywI7MmuzwFoQSE3LMQNQSNzfyBzdS3txB7pVO7WHfunXo2dpMwFpuVEoussfjUx1fSq9TDlfHCTM59Lk6QhhcW7ZkSC8zYIEluqJSdl7ubJrNKvyN4AwyTUiN1SLfkf2EQ/x5IrNo9SibpKX7Q7dPWQTqyoR3B/nhQYilDc42eaovQZ+Sqni/rk2MFL6+aXLRXcwPkD0dxxSHuZoAxAwuPphcAC7lABm/uG4hiXEL8cAY7T1/ATQw5GruboOgADooGaNUChZabCTwHWdd1NOOwrFDWfzUBRQKQlyeQlP0298rKe9wGuBkF67VwA3dQmdu2cXkgvS7J9L16tkzhYlY5T6frUWKz0bZARGdRzSOrvBdVm1yaE4IW74NPe/dH7autiPAppizFAPMTATPiqri3lQhmEjXCpg5knvrgJtSAbg+9futTEKHvjGTK66rkWVou9Nm9rILGEw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C6452017082DB479DC4065DC273C642@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5938886d-638e-45d8-7ce4-08d81395be15
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 14:41:52.9441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XnQRY4JFl+BSLOkgdFUBEYjMFAZULhSG3vL+pYbw4QUadyo3TfiG+zEEmMWymzKW5UIHFa+rdHH3tNhv0iwe1lSSB4sC92bT4zVcFG0StTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5285
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGVsbG8gRXZlcnlvbmUsIEhpIFBldGVyDQoNCkknbSBjdXJyZW50bHkgZmFjaW5nIHR3byBVU0Ig
cHJvYmxlbXMgd2l0aCBvdXIgQ29saWJyaSBpTVg2VUxMIENvTS4gSSdtDQphc2tpbmcgaGVyZSBv
biB0aGUgbWFpbGluZ2xpc3QgaWYgYW55b25lIGVsc2UgaGFzIHNlZW4gc2ltaWxhciBwcm9ibGVt
cw0KYW5kIGlmIGFueW9uZSBoYXZlIGFueSBpZGVhIGhvdyBJIGNvdWxkIHNvbHZlIHRoaXMuDQoN
Ck9uIG91ciBpTVg3IGJhc2VkIENvTSB0aGUgQ29saWJyaSBpTVg3IGV2ZXJ5dGhpbmcgaXMgd29y
a2luZyBmaW5lIGFuZA0KZnJvbSB3aGF0IEkgY2FuIHRlbGwgaXQgaGFzIHRoZSBzYW1lIENoaXBp
ZGVhIElQIGFzIHRoZSBpTVg2VUxMIHdoaWNoDQptYWtlcyBpdCBzdHJhbmdlIHRvIG1lIHRoYXQg
b25lIGlzIHdvcmtpbmcgYnV0IG5vdCB0aGUgb3RoZXIgb25lLg0KDQoNCjFzdCBwcm9ibGVtIC0g
Uk5ESVMNCldlIHRyeSB0byB1c2UgUk5ESVMgb24gb25lIG9mIHRoZSBVU0IgcG9ydHMgdGhlIENv
bGlicmkgaU1YNlVMTCBoYXMuIEZvcg0KdGhpcyBwdXJwb3NlIEknbSB1c2luZyB0aGUgdXNiX2Zf
cm5kaXMua28ga2VybmVsIG1vZHVsZSBhbmQgc2V0dGluZw0KZHJfbW9kZSBvZiAmdXNib3RnMSB0
byAicGVyaXBoZXJhbCINClRoaXMgd29ya3MgZmluZSBvbiBpTVg3IGJ1dCBkb2VzIG5vdCBvbiBp
TVg2VUxMLiBPbiB0aGUgVUxMIGJvYXJkIEkgY2FuDQpzZWUgYSAiY2lfaGRyYy4wIiBpbiAvc3lz
L2NsYXNzL3VkYyBhZnRlciBib290LiBJZiBJIGFkZCBub3cgYW4gVVNCIEdQSU8NCmV4dGNvbiB0
byB1c2JvdGcgdGhpcyBjaGFuZ2VzIHRvICJjaV9oZHJjLjEiIGFuZCBldmVyeXRoaW5nIHdvcmtz
IGZpbmUNCmFmdGVyIGJvb3QsIGJ1dCBub3QgYWZ0ZXIgdW5wbHVnZ2luZyBVU0IgYW5kIHJlcGx1
Z2dpbmcuDQpUbyBzZXR1cCBSTkRJUyBJIHVzZSB0aGUgY29tbWFuZHMgWzFdIEkgcHV0IGF0IHRo
ZSBlbmQgb2YgdGhpcyBlbWFpbCBmb3INCnJlZmVyZW5jZS4NCg0KMm5kIHByb2JsZW0gLSBjb25z
dGFudCByZXNldHRpbmcNCldoZW4gSSBjb21waWxlIGEgcGxhaW4gbWFpbmxpbmUga2VybmVsIHdp
dGggImlteF92Nl92N19kZWZjb25maWciIGFuZA0KYm9vdCB0aGUgaU1YNlVMTCB3aXRoIGl0IEkg
c2VlIHRoYXQgdGhlIFVTQiBpcyBjb25zdGFudGx5IHJlc2V0dGluZyB0aGUNCmh1YiB0aGF0IGlz
IHByZXNlbnQgb24gdGhlIENvbGlicmkgRXZhbHVhdGlvbiBjYXJyaWVyIGJvYXJkLg0KDQpbICAg
NDkuNjU0NjIxXSB1c2IgMS0xOiByZXNldCBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDIg
dXNpbmcNCmNpX2hkcmMNClsgICA1Mi4xODA3ODFdIHVzYiAxLTE6IHJlc2V0IGhpZ2gtc3BlZWQg
VVNCIGRldmljZSBudW1iZXIgMiB1c2luZw0KY2lfaGRyYw0KWyAgIDU0LjY5OTY3OF0gdXNiIDEt
MTogcmVzZXQgaGlnaC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAyIHVzaW5nDQpjaV9oZHJjDQoN
Cg0KVGhpcyBsb29rcyB0byBtZSBsaWtlIHNvbWV0aGluZyBpcyBzdGlsbCBub3QgcXVpdGUgcmln
aHQgZm9yIHRoZSB1c2UtDQpjYXNlIG9mIFVMTC4gSSBkb3VidCB0aGF0IG91ciBoYXJkd2FyZSBp
cyB0aGUgcHJvYmxlbSBhcyB3ZSBuZXZlciBoYXZlDQpzZWVuIHRob3NlIHByb2JsZW1zIGRvd25z
dHJlYW0uDQoNCkBQZXRlcjogU3RlZmFuIEFnbmVyIHN1Z2dlc3RlZCB0byBpbmNsdWRlIHlvdSB0
b28gaW4gdGhpcyBtYWlsIGFzIHlvdQ0KaGF2ZSBpbiBkZXB0aCBrbm93bGVkZ2Ugb2YgZGlmZmVy
ZW5jaWVzIG9mIHRoZSBDaGlwaWRlYSBJUCBvZiBpTVg3IGFuZA0KaU1YNlVMTC4gSSBob3BlIHlv
dSBjYW4gcG9pbnQgbWUgdG8gYSBkaXJlY3Rpb24gd2hlcmUgSSBjYW4gcGljayB1cA0KYWdhaW4g
YW5kIHNvbHZlIHRob3NlIGlzc3VlcyA6LSkuDQoNCkZvciBhbnkgc3VnZ2VzdGlvbnMgb3IgY29u
ZmlybWF0aW9ucyBvZiB0aG9zZSBwcm9ibGVtcyBJIHdvdWxkIGJlIHZlcnkNCmdyYXRlZnVsLg0K
DQpCZXN0IFJlZ2FyZHMsDQpQaGlsaXBwZSBTY2hlbmtlcg0KDQoNCg0KWzFdDQoNCkNPTkZJR0ZT
PSIvc3lzL2tlcm5lbC9jb25maWcvdXNiX2dhZGdldC9ncm5kaXMiDQoNCmVjaG8gIlRlc3RzY3Jp
cHQgZm9yIFJORElTLCBzZXR0aW5nIHVwIFJORElTIHN0dWZmIGluICR7Q09ORklHRlN9Ig0KDQpt
a2RpciAkQ09ORklHRlMNCmVjaG8gNzAxNSA+ICIke0NPTkZJR0ZTfS9pZFZlbmRvciINCmVjaG8g
MTY0MTIgPiAiJHtDT05GSUdGU30vaWRQcm9kdWN0Ig0KDQpta2RpciAiJHtDT05GSUdGU30vc3Ry
aW5ncy8weDQwOSINCmVjaG8gIlRvcmFkZXgiID4gJHtDT05GSUdGU30vc3RyaW5ncy8weDQwOS9t
YW51ZmFjdHVyZXINCmVjaG8gIlRlc3QtTW9kdWxlIiA+ICR7Q09ORklHRlN9L3N0cmluZ3MvMHg0
MDkvcHJvZHVjdA0KZWNobyAiMTIzNDU2NzgiID4gJHtDT05GSUdGU30vc3RyaW5ncy8weDQwOS9z
ZXJpYWxudW1iZXINCg0KbWtkaXIgLXAgIiR7Q09ORklHRlN9L2NvbmZpZ3MvYy4xL3N0cmluZ3Mv
MHg0MDkvIg0KZWNobyAxID4gJHtDT05GSUdGU30vY29uZmlncy9jLjEvTWF4UG93ZXINCmVjaG8g
MTkyID4gJHtDT05GSUdGU30vY29uZmlncy9jLjEvYm1BdHRyaWJ1dGVzDQoNCm1rZGlyIC1wICIk
e0NPTkZJR0ZTfS9mdW5jdGlvbnMvcm5kaXMudXNiMCINCmVjaG8gIjAyIiA+ICIke0NPTkZJR0ZT
fS9mdW5jdGlvbnMvcm5kaXMudXNiMC9jbGFzcyINCmVjaG8gIjAwOjE0OjJkOmZmOmZmOmZmIiA+
ICIke0NPTkZJR0ZTfS9mdW5jdGlvbnMvcm5kaXMudXNiMC9kZXZfYWRkciINCmVjaG8gIjAwOjE0
OjJkOmZmOmZmOmZlIiA+ICIke0NPTkZJR0ZTfS9mdW5jdGlvbnMvcm5kaXMudXNiMC9ob3N0X2Fk
ZHIiDQplY2hvICIwMCIgPiAiJHtDT05GSUdGU30vZnVuY3Rpb25zL3JuZGlzLnVzYjAvcHJvdG9j
b2wiDQplY2hvIDUgPiAiJHtDT05GSUdGU30vZnVuY3Rpb25zL3JuZGlzLnVzYjAvcW11bHQiDQpl
Y2hvICIwNiIgPiAiJHtDT05GSUdGU30vZnVuY3Rpb25zL3JuZGlzLnVzYjAvc3ViY2xhc3MiDQoN
CmxuIC1zICIke0NPTkZJR0ZTfS9mdW5jdGlvbnMvcm5kaXMudXNiMCINCiIke0NPTkZJR0ZTfS9j
b25maWdzL2MuMS9ybmRpcy51c2IwIg0KDQplY2hvICJjaV9oZHJjLjAiID4gIiR7Q09ORklHRlN9
L1VEQyINCg==
