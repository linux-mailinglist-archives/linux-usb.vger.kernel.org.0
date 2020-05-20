Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D541DB3E8
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 14:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgETMnj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 08:43:39 -0400
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com ([40.107.223.87]:8833
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726443AbgETMni (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 08:43:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzwU9lctJg0usuW/2h+clOi0LiukrQI3mH1ve1PvQ7+tBchmNPRGiqNcE2jfHfM0tTSQjXdN16Ly10jwKcrDFOWlMhyBBl7O38IDJMbZaWQZ5jW+b37sA2aTcKDEYhFfCWczjRB27W6V+QwR4nya6/V98Hh2fRrLmN0d9hNdgeoWHVT/C6zSxk+zv9UPxhuOFUXgTn+7m/Zj+uZp2hHdwcVXIQDEl4q9GuxG2g3DFk6ycZR5i5E3uiS5AeVT9WwUjF6ZnCIrJ5McqhdlitLYUFOU28hmixHn9AjxkZulpGAiSOGiEHhOruKBggmJX6I4TLEMU+GBP9PhS/YUH/o7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqGNvu+GRYdbqB9QFIqhjC66la7IrWFv5T46dfdsSqo=;
 b=hmauQGep3GfwIgQeGn7EGUZlExGHWfVJ3Y9oz70g0S39jGe7UxZf6uY+oALJFdsah7qf3WszUGcVFEDXZbPGv3Qt8XyZ7NNSTUVmErmo2wXLLucVgMWdbB3O0aZZbe7GSGGtBq/gXCEZfCpFQPLgzdLopyVpUjCJB9IJvcRPXX6qufltKnVCeq1pUTtuennpoLRJ8deNRUA0FxCqp3MBoIOVWG6j8C0A92lClAfzxV867kynfQeIFSGfo6QRMeQ9K62dtZchWUKkG90cRZmtvFex6VSIdVYfVoFcMaImi/vaC9/BvV7tnNKv8bXU3IJ57hgpylY7C4YcywROm37iVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqGNvu+GRYdbqB9QFIqhjC66la7IrWFv5T46dfdsSqo=;
 b=X4yCW8n27+AFJ6L8vct7cabyxGi1QDOgzKU2pBlUX2aMIL4eGKcx6kBe3vufisfhQpekrXZRg9Z5f8XOBr3S70VWo0Ysl0DYKXw0CeBd3AI2IAGsxd3/Id4FM0slS56P0vWCcPQPQTrxuqhEDWT9T9m3cGKaSuGUIbawQo8zWK0=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3140.namprd10.prod.outlook.com (2603:10b6:408:cc::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 12:43:35 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 12:43:35 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM strange chars appearing at connect
Thread-Topic: ttyACM strange chars appearing at connect
Thread-Index: AQHWLdcbNaT93COqRkquqTua8R38BaivXXMAgAGPaYA=
Date:   Wed, 20 May 2020 12:43:34 +0000
Message-ID: <f317d5942549910c4a92f7d398ada9fc02a26af4.camel@infinera.com>
References: <52b8c126634058e3a455dc0ab8b0c542916db543.camel@infinera.com>
         <20200519125400.GA410029@kroah.com>
In-Reply-To: <20200519125400.GA410029@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b75e766-5fa6-46bf-4b23-08d7fcbb6945
x-ms-traffictypediagnostic: BN8PR10MB3140:
x-microsoft-antispam-prvs: <BN8PR10MB31408C69A56D4E4541FEC641F4B60@BN8PR10MB3140.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y9PtamUHrB2Remyeqv3nZJitg0ijd3L8cIL14DV2gG391O194mTzS24qtOlDkQeRydKG8d0PbqPsoQdxFZkMI4+xXTy0ZSA4KEp19Cp9BdZXYXOU0uHaI+WdkKiNJpWKFsVO+w+I83iOv9vV0dKqCk4xU6MPxNxu2UO56t/K4m8y7DaH7TBTMwYPbTnydnwsPQjhYiIXf5An2NbYi0bMaQyAhDb3q8DgdwE8yNdwucFsbmUebWdxhv2vzpVkJ36usapRcFSrPFrvrLee+tFZ1nMgPlr8/fLQX75xYCy40A0Vssy56o5SCPx5BJRnA8h9ahzWGA4Rt1j3YYp9De+zdg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(71200400001)(2616005)(2906002)(36756003)(66556008)(5660300002)(64756008)(66946007)(66446008)(66476007)(6916009)(4326008)(186003)(6486002)(8936002)(478600001)(316002)(8676002)(76116006)(26005)(86362001)(6512007)(6506007)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: NPoO65ZqLETyNnCS+zX/pBI02y/2hXRBvAbbOMI3suGl400YugZx3moEdFsCapUOfZ+Cqqh8wyHrUkn0P89SbM70h07wXDqpyPscXNU2ywRghapLPCjMniu4xMNBFSWQu0Jh1dQqUeo1s1PYaEIh1TRmNLweHPebJYTIOgoN4WANZDurLdjbu9Qgjx0hkl7ECJNwpawxRG5rkLniQp5CdmpcP4SPGTf784u0z+LBV/3nUfwaIQtjFIeRmAQgq9Ycb0Dgen8ZwJeFKg3qTrPGq3o5BDwdyVgcwX/msSWP4zpk5Vl5W8+X6C0T0ygfsa7ARvnl8XSScKvW1MGr1ERSpL86DRwNuUwcAFeNVSHLIwF3GuDOrPhYJ4XuI1RG5q2I4Xdj/oAuThgMHtAN59vbhBCxfDiCFuke1+QNiiX/kNuTA0YNCj5D/J34+zcHfB+9P0MIm7/U0ENCekK8f6zAQJlb33VDaCGf4FcErmOW+APvgKB4qMskfvjE10MEI+gV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <91A8A94673BD5B4DA78769EDBC79509A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b75e766-5fa6-46bf-4b23-08d7fcbb6945
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 12:43:35.0048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vw45srHiHLjWWb0fYpHLRVKPqxsia/d4SN7UUJet8LFdrFdLwTbZFCuHZprDdOXZEGLS8LquByRI597LKBGyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3140
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCAyMDIwLTA1LTE5IGF0IDE0OjU0ICswMjAwLCBHcmVnIEtIIHdyb3RlOg0KPiBDQVVU
SU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRp
b24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0K
PiBPbiBUdWUsIE1heSAxOSwgMjAyMCBhdCAxMjoxNDo1NVBNICswMDAwLCBKb2FraW0gVGplcm5s
dW5kIHdyb3RlOg0KPiA+IFdoZW5ldmVyIHdlIGNvbm5lY3QgYSBMaW51eCBsYXB0b3AoNC4xOS4x
MTgpIHRvIG91ciB0dHlBQ00gc2VyaWFsIGdhZGdldCB3ZSBjYW4gc2VlIHNvbSBzdHJhbmdlDQo+
ID4gY2hhcnMgYXBwZWFyaW5nIGluIG91ciBnYWRnZXQ6DQo+ID4gMDPvv71gM++/vTAz77+9eO+/
vXgoaW4gaGV4OiAzMDMzIGVmYmYgYmQ2MCAzM2VmIGJmYmQgMzAzMyBlZmJmIGJkNzggZWZiZiBi
ZDc4KQ0KPiA+IFRoZXkgYXBwZWFyIHdpdGNoIGMuYSAxIHNlYyBpbiBiZXR3ZWVuLg0KPiA+IEkg
YXNzdW1lIGl0IGlzIHRoZSBsYXB0b3BzIEFDTSBkcml2ZXIgZW1pdHRpbmcgdGhvc2UsIGJ1dCB3
aHk/IENhbiB0aGVzZSBjaGFycyBiZSB0dXJuZWQgb2ZmPw0KPiANCj4gSXQncyBhIHByb2dyYW0g
b24geW91ciBsYXB0b3AgcHJvYmluZyB0aGUgZGV2aWNlLiAgVXN1YWxseSBtb2RlbW1hbmFnZXIN
Cj4gb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gDQo+IGdyZWcgay1oDQoNClJpZ2h0IHlvdSB3
ZXJlLCBpdCB3YXMgbW9kZW1tYW5hZ2VyIDopDQoNCkZpeGluZyB0aGF0IEkgY2FuIG9jY2FzaW9u
IHNlIGluIG15IERFOg0KW1dlZCBNYXkgMjAgMTQ6MDM6MTYgMjAyMF0gY2RjX2V0aGVyIDEtNi4y
OjEuMCB1c2IwOiB1bnJlZ2lzdGVyICdjZGNfZXRoZXInIHVzYi0wMDAwOjAwOjE0LjAtNi4yLCBD
REMgRXRoZXJuZXQgRGV2aWNlDQpbV2VkIE1heSAyMCAxNDowMzoyNSAyMDIwXSB1c2IgdXNiMS1w
b3J0NjogZGlzYWJsZWQgYnkgaHViIChFTUk/KSwgcmUtZW5hYmxpbmcuLi4NCltXZWQgTWF5IDIw
IDE0OjAzOjI1IDIwMjBdIHVzYiAxLTY6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDg1
DQpbV2VkIE1heSAyMCAxNDowMzoyNSAyMDIwXSBjZGNfYWNtIDEtNi4zOjEuMTogYWNtX2N0cmxf
aXJxIC0gdXNiX3N1Ym1pdF91cmIgZmFpbGVkOiAtMTkNCltXZWQgTWF5IDIwIDE0OjAzOjI1IDIw
MjBdIHVzYiAxLTYtcG9ydDI6IGF0dGVtcHQgcG93ZXIgY3ljbGUNCltXZWQgTWF5IDIwIDE0OjAz
OjI2IDIwMjBdIHVzYiAxLTYuMzogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgODYNCltX
ZWQgTWF5IDIwIDE0OjAzOjI2IDIwMjBdIGNkY19hY20gMS02LjM6MS4xOiBmYWlsZWQgdG8gc2V0
IGR0ci9ydHMNCltXZWQgTWF5IDIwIDE0OjAzOjI2IDIwMjBdIHVzYiAxLTY6IG5ldyBoaWdoLXNw
ZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDk0IHVzaW5nIHhoY2lfaGNkDQpbV2VkIE1heSAyMCAxNDow
MzoyNyAyMDIwXSBodWIgMS02OjEuMDogVVNCIGh1YiBmb3VuZA0KW1dlZCBNYXkgMjAgMTQ6MDM6
MjcgMjAyMF0gaHViIDEtNjoxLjA6IDMgcG9ydHMgZGV0ZWN0ZWQNCltXZWQgTWF5IDIwIDE0OjAz
OjI3IDIwMjBdIHVzYiAxLTYuMjogbmV3IGhpZ2gtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgOTUg
dXNpbmcgeGhjaV9oY2QNCltXZWQgTWF5IDIwIDE0OjAzOjI3IDIwMjBdIGNkY19ldGhlciAxLTYu
MjoxLjAgdXNiMDogcmVnaXN0ZXIgJ2NkY19ldGhlcicgYXQgdXNiLTAwMDA6MDA6MTQuMC02LjIs
IENEQyBFdGhlcm5ldCBEZXZpY2UsIDdlOjFkOjA2OmMwOjNmOjNjDQpbV2VkIE1heSAyMCAxNDow
MzoyNyAyMDIwXSB1c2IgMS02LjM6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDk2
IHVzaW5nIHhoY2lfaGNkDQpbV2VkIE1heSAyMCAxNDowMzoyNyAyMDIwXSBjZGNfYWNtIDEtNi4z
OjEuMTogdHR5QUNNMDogVVNCIEFDTSBkZXZpY2UNCg0KVGhpcyAiZGlzYWJsZWQgYnkgaHViIChF
TUk/KSwgcmUtZW5hYmxpbmciIG1heSBiZSBmcm9tOg0KICBFTSBpbnRlcmZlcmVuY2Ugc29tZXRp
bWVzIGNhdXNlcyBiYWQgc2hpZWxkZWQgVVNCIGRldmljZXMgdG8gDQogIGJlIHNodXRkb3duIGJ5
IHRoZSBodWIsIHRoaXMgaGFjayBlbmFibGVzIHRoZW0gYWdhaW4uDQoNCkJ1dCBhIGFub3RoZXIg
c2lkZSBlZmZlY3QgZnJvbSB0aGlzIGlzIHRoYXQgSSBnZXQgYSBsb3Qgb2YgZ2FyYmFnZSBjaGFy
cyBpbiB0aGUgb3RoZXIgZW5kLCBsaWtlOg0KIGjvv71eQF5A77+9IF5AXkDvv70gXkANCm9yDQog
WO+/ve+/ve+/vSlI77+977+9NMSeXu+/ve+/ve+/vQ0KSSB3b25kZXIgaWYgdGhpcyBjYW4gYmUg
Y2F1c2VkIGJ5IHRoZSBVU0IvQUNNIGRyaXZlciA/DQoNCiBKb2NrZQ0K
