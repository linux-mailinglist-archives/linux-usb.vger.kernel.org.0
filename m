Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578DD1DB501
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgETN3y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:29:54 -0400
Received: from mail-bn7nam10on2061.outbound.protection.outlook.com ([40.107.92.61]:21345
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726436AbgETN3x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 20 May 2020 09:29:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcyvumNvMewNbdIWCmvIsrxUpTDHX0pGkez2/O0yBjaFbJnlNcOMrx6HuFSBp+UBU8jEADE9yzcVbU0otz332z+/A0jc9hu+ldkU6ss3OKCFKhbI9nfnIMMwytFhsOPK1bS7LuawB1bpITeuXjuWBGp2X9Y/0mbrpsusvlDln6mdYJzcw9w9itsP9hh+cLE2Gw6TllEVKZAeuiB77RgP61234atBrT3IgHKb96+I9A862MU73G4H8R/R6sZbbsEa6SduoqiCswpVzT2Q6RDdx6roRDI2V1gW/uipqqXO4oR8I86MPsr6Wi+jwIZSZktoOtyLoHhauePHWcRNmoXjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTNVo7u4Mdxgx4/a8OGJQUmXpY+OwWOoYZT8PoSmbcA=;
 b=mcflgBlZOWPR+ea4p26Yq3JBs6Bgf7OnptyFtx4lTiGq22X6v2eqJh9/FJBItRVC5Kuov4rEyT4OweKsyWjigaUEisrXlW+6PIG3sqG9DLakPdqG6/apT16+d1oC+oYqKDFMXv4kvu7ybzrfO4cpzuXr/1+RoRQP8Pnuv0YF0UtHhUVerG0sfl3XPWavof+shDyvQnhRLlAtZU0DSsxFONvYKViYjZVQjsAGUJwKVxE3tOPOyisrrVic+nQFfy8+pTLVkKK87V1Zl2hFY1FFZPdPCkY8OpZgGWXQBSwCKYyAFB0ucnuTv/0bJcc9dqHBfccQKhWvb7t424IWhJ+lJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lTNVo7u4Mdxgx4/a8OGJQUmXpY+OwWOoYZT8PoSmbcA=;
 b=STXy8DAXCOZdHsx7sx1GBCPHXXevIHb7YiIpxyl9alQgdOPb666gPklJ8edPZgDmIFXKBoHB/+Ev8P7clPGlftouwo47eJsZBSDzO8ZzfUIh0fIn7z+7cxk55Hnz3w/jap7w+xakPqMCfv+E5p3Gk1X/YMXXa0X2TYAUJ1EG4Es=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3554.namprd10.prod.outlook.com (2603:10b6:408:b3::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 13:29:50 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 13:29:50 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "dcbw@redhat.com" <dcbw@redhat.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: ttyACM strange chars appearing at connect
Thread-Topic: ttyACM strange chars appearing at connect
Thread-Index: AQHWLdcbNaT93COqRkquqTua8R38BaivXXMAgAGPaYCAAAb/gIAABe+A
Date:   Wed, 20 May 2020 13:29:50 +0000
Message-ID: <ef733c17c636a35e83473142d3f4827634b9778a.camel@infinera.com>
References: <52b8c126634058e3a455dc0ab8b0c542916db543.camel@infinera.com>
         <20200519125400.GA410029@kroah.com>
         <f317d5942549910c4a92f7d398ada9fc02a26af4.camel@infinera.com>
         <6e83f76cc2e559ec82c1c8fe8a22b7d91338a851.camel@redhat.com>
In-Reply-To: <6e83f76cc2e559ec82c1c8fe8a22b7d91338a851.camel@redhat.com>
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
x-ms-office365-filtering-correlation-id: a9771477-4a6a-40bc-3f4c-08d7fcc1df9f
x-ms-traffictypediagnostic: BN8PR10MB3554:
x-microsoft-antispam-prvs: <BN8PR10MB3554C02B0109E34917C22F5AF4B60@BN8PR10MB3554.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wOJsLzDaBxJxs31RY35d52Mt7NVcVJ2pqCF6EyCqBtiApXkQQsi02k+FDMT19LzdfTNrplGMbdQlVQhQBCdUw36AyvWuFjuyv4R30JnweOy1bGuUHi/4I5iFC9UqxFcnyYQC5uBdJ4BO7MRQLR+r4IqjlrENWlg+bkuq3qDTsH+Xm106xuHR+udkmyLOifNr6pMVb0xX7+j7bEdGYAXl5mCXjj2qqwhIDvrUTe76oc2ksp/kxy6GEdbdL9wjf8hShZEe6/fx4+62jcSF/2v9qT7fjvqC/eO2GwOv8Uakjo8KE86QMcKIaDByLaNaQsHQb8BN0I2IU97rQuvm8hSqPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(2616005)(76116006)(4326008)(6512007)(66476007)(66446008)(66946007)(66556008)(64756008)(316002)(86362001)(2906002)(26005)(91956017)(6506007)(5660300002)(110136005)(186003)(71200400001)(8676002)(6486002)(8936002)(36756003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: gFHATTpxTgIh94oxr/n90VWCkfarSFxllUXVgjBQ6U1kg5P3ChkXORKasnpebPcyfVlv91J6vje6TEWYXZ6lz2Yu4AMSMF6IxMFlF/rLPzSdJqX/QlcIcJyZ/yGPzhBq74OZAFRyp7N7g9LNk39UFfbdPDBOfmMIbTzFwO5Llf4pPCAuK3ByMwmqnlQheFQsABOhcmxmN15Y40ScSciCpqCH3UxpO1Ex2f1B9OQ5EgAL5ckNueuSiMP/n4t47vxLvf92ulnCkmi/6AX2uGzWsBDLkj7fms81SpZECMKQB91kmRwvWuLAr16/VCFFbjfxxw7K54N80GKlTwdJgv+elgLZJtFxEHNzYwYOfnezcvn4fDbk/FkYS458p81TALvyOD9coGf3fGfcGx5aw8aWmuF27s6ySjN+G6hIWTrDfYMT/uthcEMJ1Ah/ltTg2MGj3eP4B1R2HweN/+0u96gVgVffw3n39QhX5sW4lP9oIOCdbm8B3DVLRFZwqNXNYWbd
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <27F72651F2933D469760231432770762@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9771477-4a6a-40bc-3f4c-08d7fcc1df9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 13:29:50.5368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IvGBnN7PKYPvniCSvUyuBIbtZGvRVMey5ZpIw0BnqY+U1hbc9ay9FQrWO3iFJNi+sF5UC+KvBe1kWaVjbehlPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3554
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gV2VkLCAyMDIwLTA1LTIwIGF0IDA4OjA4IC0wNTAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6DQo+
IE9uIFdlZCwgMjAyMC0wNS0yMCBhdCAxMjo0MyArMDAwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90
ZToNCj4gPiBPbiBUdWUsIDIwMjAtMDUtMTkgYXQgMTQ6NTQgKzAyMDAsIEdyZWcgS0ggd3JvdGU6
DQo+ID4gPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRo
ZSBvcmdhbml6YXRpb24uIERvDQo+ID4gPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyDQo+ID4gPiBhbmQga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlLg0KPiA+ID4gDQo+ID4gPiANCj4gPiA+IE9uIFR1ZSwgTWF5IDE5LCAy
MDIwIGF0IDEyOjE0OjU1UE0gKzAwMDAsIEpvYWtpbSBUamVybmx1bmQgd3JvdGU6DQo+ID4gPiA+
IFdoZW5ldmVyIHdlIGNvbm5lY3QgYSBMaW51eCBsYXB0b3AoNC4xOS4xMTgpIHRvIG91ciB0dHlB
Q00gc2VyaWFsDQo+ID4gPiA+IGdhZGdldCB3ZSBjYW4gc2VlIHNvbSBzdHJhbmdlDQo+ID4gPiA+
IGNoYXJzIGFwcGVhcmluZyBpbiBvdXIgZ2FkZ2V0Og0KPiA+ID4gPiAwM++/vWAz77+9MDPvv714
77+9eChpbiBoZXg6IDMwMzMgZWZiZiBiZDYwIDMzZWYgYmZiZCAzMDMzIGVmYmYgYmQ3OCBlZmJm
DQo+ID4gPiA+IGJkNzgpDQo+ID4gPiA+IFRoZXkgYXBwZWFyIHdpdGNoIGMuYSAxIHNlYyBpbiBi
ZXR3ZWVuLg0KPiA+ID4gPiBJIGFzc3VtZSBpdCBpcyB0aGUgbGFwdG9wcyBBQ00gZHJpdmVyIGVt
aXR0aW5nIHRob3NlLCBidXQgd2h5Pw0KPiA+ID4gPiBDYW4gdGhlc2UgY2hhcnMgYmUgdHVybmVk
IG9mZj8NCj4gPiA+IA0KPiA+ID4gSXQncyBhIHByb2dyYW0gb24geW91ciBsYXB0b3AgcHJvYmlu
ZyB0aGUgZGV2aWNlLiAgVXN1YWxseQ0KPiA+ID4gbW9kZW1tYW5hZ2VyDQo+ID4gPiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0Lg0KPiA+ID4gDQo+ID4gPiBncmVnIGstaA0KPiA+IA0KPiA+IFJpZ2h0
IHlvdSB3ZXJlLCBpdCB3YXMgbW9kZW1tYW5hZ2VyIDopDQo+IA0KPiBJZiB0aGUgZGV2aWNlIGhh
cyBhIHVuaXF1ZSBJRCB0aGF0IGlzbid0IGEgbW9kZW0sIGl0IGNhbiBiZSBhZGRlZCB0bw0KPiBN
b2RlbU1hbmFnZXIncyBibGFja2xpc3QuDQoNClllcywgSSBkaWQgdGhhdDoNCmNhdCAvZXRjL3Vk
ZXYvcnVsZXMuZC83MC1tbS11c2ItTEMtYmxhY2tsaXN0LnJ1bGVzIA0KQUNUSU9OIT0iYWRkfGNo
YW5nZXxtb3ZlfGJpbmQiLCBHT1RPPSJtbV91c2JfZGV2aWNlX2JsYWNrbGlzdF9lbmQiDQpTVUJT
WVNURU0hPSJ1c2IiLCBHT1RPPSJtbV91c2JfZGV2aWNlX2JsYWNrbGlzdF9lbmQiDQoNCiMgWFRN
IExDIHNlcmlhbCBwb3J0DQpBVFRSU3tpZFZlbmRvcn09PSIwNDI0IiwgQVRUUlN7aWRQcm9kdWN0
fT09IjI3NGUiLCBFTlZ7SURfTU1fVFRZX0JMQUNLTElTVH09IjEiDQoNCkxBQkVMPSJtbV91c2Jf
ZGV2aWNlX2JsYWNrbGlzdF9lbmQiDQoNCj4gDQo+IEFsc28gbm90ZSB0aGF0IHJlY2VudCB2ZXJz
aW9ucyBvZiBNb2RlbU1hbmFnZXIgZmxpcHBlZCB0aGUgbG9naWMgYW5kDQo+IHdpbGwgb25seSBw
cm9iZSAqa25vd24qIG1vZGVtcywgcmVxdWlyZSBleHBsaWNpdCByZXF1ZXN0cyB0byBwcm9iZQ0K
PiBwb3NzaWJsZSBtb2RlbXMsIGFuZCBvZiBjb3Vyc2Ugd29uJ3QgcHJvYmUgYW55dGhpbmcgb24g
dGhlIGJsYWNrbGlzdC4NCg0KSSBnb3QgMS4xMi42LCBub3QgbmV3IGVub3VnaCBJIGd1ZXNzPw0K
DQo+IA0KPiBEYW4NCj4gDQo+ID4gRml4aW5nIHRoYXQgSSBjYW4gb2NjYXNpb24gc2UgaW4gbXkg
REU6DQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MTYgMjAyMF0gY2RjX2V0aGVyIDEtNi4yOjEuMCB1
c2IwOiB1bnJlZ2lzdGVyDQo+ID4gJ2NkY19ldGhlcicgdXNiLTAwMDA6MDA6MTQuMC02LjIsIENE
QyBFdGhlcm5ldCBEZXZpY2UNCj4gPiBbV2VkIE1heSAyMCAxNDowMzoyNSAyMDIwXSB1c2IgdXNi
MS1wb3J0NjogZGlzYWJsZWQgYnkgaHViIChFTUk/KSwNCj4gPiByZS1lbmFibGluZy4uLg0KPiA+
IFtXZWQgTWF5IDIwIDE0OjAzOjI1IDIwMjBdIHVzYiAxLTY6IFVTQiBkaXNjb25uZWN0LCBkZXZp
Y2UgbnVtYmVyIDg1DQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjUgMjAyMF0gY2RjX2FjbSAxLTYu
MzoxLjE6IGFjbV9jdHJsX2lycSAtDQo+ID4gdXNiX3N1Ym1pdF91cmIgZmFpbGVkOiAtMTkNCj4g
PiBbV2VkIE1heSAyMCAxNDowMzoyNSAyMDIwXSB1c2IgMS02LXBvcnQyOiBhdHRlbXB0IHBvd2Vy
IGN5Y2xlDQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjYgMjAyMF0gdXNiIDEtNi4zOiBVU0IgZGlz
Y29ubmVjdCwgZGV2aWNlIG51bWJlcg0KPiA+IDg2DQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjYg
MjAyMF0gY2RjX2FjbSAxLTYuMzoxLjE6IGZhaWxlZCB0byBzZXQgZHRyL3J0cw0KPiA+IFtXZWQg
TWF5IDIwIDE0OjAzOjI2IDIwMjBdIHVzYiAxLTY6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2Ug
bnVtYmVyDQo+ID4gOTQgdXNpbmcgeGhjaV9oY2QNCj4gPiBbV2VkIE1heSAyMCAxNDowMzoyNyAy
MDIwXSBodWIgMS02OjEuMDogVVNCIGh1YiBmb3VuZA0KPiA+IFtXZWQgTWF5IDIwIDE0OjAzOjI3
IDIwMjBdIGh1YiAxLTY6MS4wOiAzIHBvcnRzIGRldGVjdGVkDQo+ID4gW1dlZCBNYXkgMjAgMTQ6
MDM6MjcgMjAyMF0gdXNiIDEtNi4yOiBuZXcgaGlnaC1zcGVlZCBVU0IgZGV2aWNlDQo+ID4gbnVt
YmVyIDk1IHVzaW5nIHhoY2lfaGNkDQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjcgMjAyMF0gY2Rj
X2V0aGVyIDEtNi4yOjEuMCB1c2IwOiByZWdpc3Rlcg0KPiA+ICdjZGNfZXRoZXInIGF0IHVzYi0w
MDAwOjAwOjE0LjAtNi4yLCBDREMgRXRoZXJuZXQgRGV2aWNlLA0KPiA+IDdlOjFkOjA2OmMwOjNm
OjNjDQo+ID4gW1dlZCBNYXkgMjAgMTQ6MDM6MjcgMjAyMF0gdXNiIDEtNi4zOiBuZXcgaGlnaC1z
cGVlZCBVU0IgZGV2aWNlDQo+ID4gbnVtYmVyIDk2IHVzaW5nIHhoY2lfaGNkDQo+ID4gW1dlZCBN
YXkgMjAgMTQ6MDM6MjcgMjAyMF0gY2RjX2FjbSAxLTYuMzoxLjE6IHR0eUFDTTA6IFVTQiBBQ00g
ZGV2aWNlDQo+ID4gDQo+ID4gVGhpcyAiZGlzYWJsZWQgYnkgaHViIChFTUk/KSwgcmUtZW5hYmxp
bmciIG1heSBiZSBmcm9tOg0KPiA+ICAgRU0gaW50ZXJmZXJlbmNlIHNvbWV0aW1lcyBjYXVzZXMg
YmFkIHNoaWVsZGVkIFVTQiBkZXZpY2VzIHRvIA0KPiA+ICAgYmUgc2h1dGRvd24gYnkgdGhlIGh1
YiwgdGhpcyBoYWNrIGVuYWJsZXMgdGhlbSBhZ2Fpbi4NCj4gPiANCj4gPiBCdXQgYSBhbm90aGVy
IHNpZGUgZWZmZWN0IGZyb20gdGhpcyBpcyB0aGF0IEkgZ2V0IGEgbG90IG9mIGdhcmJhZ2UNCj4g
PiBjaGFycyBpbiB0aGUgb3RoZXIgZW5kLCBsaWtlOg0KPiA+ICBo77+9XkBeQO+/vSBeQF5A77+9
IF5ADQo+ID4gb3INCj4gPiAgWO+/ve+/ve+/vSlI77+977+9NMSeXu+/ve+/ve+/vQ0KPiA+IEkg
d29uZGVyIGlmIHRoaXMgY2FuIGJlIGNhdXNlZCBieSB0aGUgVVNCL0FDTSBkcml2ZXIgPw0KPiA+
IA0KPiA+ICBKb2NrZQ0KDQo=
