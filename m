Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8583B48A037
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 20:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239963AbiAJTdm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 14:33:42 -0500
Received: from mx0d-0054df01.pphosted.com ([67.231.150.19]:27384 "EHLO
        mx0d-0054df01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231986AbiAJTdl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 14:33:41 -0500
Received: from pps.filterd (m0209000.ppops.net [127.0.0.1])
        by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20AI5sE9001635;
        Mon, 10 Jan 2022 14:33:29 -0500
Received: from can01-to1-obe.outbound.protection.outlook.com (mail-to1can01lp2057.outbound.protection.outlook.com [104.47.61.57])
        by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3dgp68r73v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 10 Jan 2022 14:33:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTC9hdoAYA4KkDdYWR6jlgYQ0akMKzvS/3VnANkE8p1knPj4nOx3j2h2efJSx3VQ1yCqtecTTEDu8TnUAw7y214liw6/Wx0Ll8YR+MORc1k98TElXAdbLpKccUK8pOtQ5pbpDGo3KKkWiIEMSkDvxv5ZolM09OCCaOMt/r1fUae9f5LeeNzu4k0acNvxx8MV+hSf0d7r42KDc0Ps4j0iPz0CUiymDXy+UxQm1Mlm9Pwf1PN8/ge/V59PJGEKY1rFqGVwEblrPAS8V4ZDejeZSsLqqieX5/Q5DmwarjxHNVyRzwpEvlv7djEW+PGO/ujNP1Z4YKzbl50qLkPBrYvZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ilj8ICJIR8J1q+wq0KZA+glT7B8SJ+XW4HrQIhWtT8=;
 b=gmbR1sdCtUfuMUml4ZuN2Z2GCsAmz8FEaOeaGbdFW3qIRYQkL9VyhGFLaW1SjfHfA1wyr0zUVNXL26pIs57CmLRv5f0f9ifQBXONaOV+wzcktExepYDFRZL9bGGUjE6L8zj0QiJ9DMYlW7EvZl7XOZE2c1EvuPvxv/LUQXwS94uHtmrNOuV9FwWCrDD2ri6Xr2v70HM8toOTvNqcKCfu1wLjIpOWy09iSJjBHkojbPQTMlHZX6k+osxhuCrH5UFJqiImMhZhswBbHiVtqtFMKc3vhBBRhmayfw2JqyBBSF63iGftIWzd6BdYkpjLSOAmxrJDOZ+HCvyC5OOhfHl4dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=calian.com; dmarc=pass action=none header.from=calian.com;
 dkim=pass header.d=calian.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ilj8ICJIR8J1q+wq0KZA+glT7B8SJ+XW4HrQIhWtT8=;
 b=J4wQjWSwO28cZNzG4l9CA/3Y0KuadSP5uzEDsIG3x2e/aOcgWnc9YA1FB5qXZeMGCbaNAI9GXqNjv+CDPZwV5R1yWZfpwJkQ8JN4NZhtiL97s0ZRxu4T4ICo6OirJi9UeuCgIL9rKsA22xRAP4K/sY3DFdY/uEeu0cQ4FVSAVDs=
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:4d::14)
 by YT3PR01MB8674.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:78::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Mon, 10 Jan
 2022 19:33:27 +0000
Received: from YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec]) by YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::4441:49c3:f6d1:65ec%9]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 19:33:27 +0000
From:   Robert Hancock <robert.hancock@calian.com>
To:     "Thinh.Nguyen@synopsys.com" <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "manish.narani@xilinx.com" <manish.narani@xilinx.com>,
        "mounika.grace.akula@xilinx.com" <mounika.grace.akula@xilinx.com>,
        "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: [PATCH 3/4] usb: dwc3: add reference clock FLADJ configuration
Thread-Topic: [PATCH 3/4] usb: dwc3: add reference clock FLADJ configuration
Thread-Index: AQHYA1t7PIT8/tahr028wwh/mKxJhKxYQ4YAgARnpIA=
Date:   Mon, 10 Jan 2022 19:33:27 +0000
Message-ID: <cfe7deae90b464ba527d4039fdfa7675edf3b769.camel@calian.com>
References: <20220107001334.991614-1-robert.hancock@calian.com>
         <20220107001334.991614-4-robert.hancock@calian.com>
         <2a420d1e-12c9-64c3-2b67-6b08014e4b56@synopsys.com>
In-Reply-To: <2a420d1e-12c9-64c3-2b67-6b08014e4b56@synopsys.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66ee411-6a95-44a8-21cb-08d9d470137b
x-ms-traffictypediagnostic: YT3PR01MB8674:EE_
x-microsoft-antispam-prvs: <YT3PR01MB8674677CA4F2EF28D5C67AC7EC509@YT3PR01MB8674.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: doFvbiWc6Edd49g8lWaazWUWojydWoadV/GpsfMysfkuWW3Zr1Xz60hBz60Ovpo17CxysWFrnfDPB09WXUkJiSeUUZGAo4MiJ967P1Qns6qWxQ+/E1MIt3FBN+ivbrBWeKqSuINwgBpT7ReI+JFMDz5UXoAu4q1AetadnoTWFJ2kosv9D/1+Y0aPQgxmF4bWGGrFoNm/IU5Nvzmgj/+DsaiJWS9Wr1qEP1PQ+C0jGCspEBogGfB6Kqp0Le43liOLjtu7d0s/XFvMPPFGaD1Hw2FuWkFAR/5fYlC+x/YPgeorwlh138F7VsJA6PGYs86MSZON/bk9s5132IA5sUqTRGUgltlE0CAo7nQ41Rt+NPkJKTav9Jx0ieu6uZy8CBCL2APq/DGgLK402PshJat/otA3ngLDN1nUjNzm5IT349Sthzyw6fsnA9ns5oT3RN0y/+HVcRpGL4TtaJJjvJH9cUTDk9vHxiHqgalFnCO6j/cxfNszn9mgWiorI/JRMDKLW+H+e/kOh+e8BH2Iukd5DcLZ0hNI+BihsY9LtlJSOpjB5hPzIktFwZ02FbQZNPBHkhF55VXmY9IlLbXfRj38dcvUOgCNOCyTlPWpirEg7HrDTIFdR+HGM8DF0SrQTeuIP5NweLi9dnwIaHniPA0oJQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(38100700002)(316002)(8676002)(44832011)(4326008)(86362001)(6512007)(26005)(38070700005)(6506007)(36756003)(8936002)(122000001)(2616005)(66476007)(83380400001)(66446008)(54906003)(66946007)(5660300002)(64756008)(66556008)(110136005)(2906002)(6486002)(508600001)(186003)(91956017)(76116006)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 6m2r2kLjoDW8N3skPXK2UHRtMhzOOkk5ec2UhKVAX70DnpSL6Le6iZ86W7QggWl2ffSIgrDcbRGI4aYneA50Wcy5DblOW1JWt4vnEwcnbJeq5wN6jMcd8VDpkAxlgy27tbmHF1xL1O/m9f20IO0yhf0YpYsLU10kD71xWUwRAo1bAi12p6Krdvz8TCwvd0gL4YrdH9pdykiLvUYpdt1TN+2JT4pveuKngrR8dvw98/bbhn4vTu93j2xaQRyetzEHoXTv9Hfjaa2VIRwgqtrRkXhVpU0KDbz8U6mrvN6rG4uTZXEBh681i8CEOvyW+O3j6EOcEn6RWYGoWK6ItUZPPrNQdKqn2C2xFeeetLR5J5k+hhS3DnKTDpk+WmDO23Xqg3P+aHMYBJKLWXJ1ESdcoyhA+VsytjPIwC4Jap/Sb+kL9qFsLCDs3LuysFC6/SI1qbrHrzY6+EaqotewpGQVJEEtffor1fm4hwAkTMgjwz6rqkvXM61K4rFADydtLWFd
Content-Type: text/plain; charset="utf-8"
Content-ID: <F95FFC3744373945BAC3353F9B006F20@CANPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT2PR01MB6270.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b66ee411-6a95-44a8-21cb-08d9d470137b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 19:33:27.6804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jp+koaKHUGocFMxoiDQ13KpwO7oc3xtf2RhIRAJznanqeYTVCb9OkiyxBh5rhzbJGiKoqtp+/rv+5mVpcrZQTjwtGfAZ3OeRM6iTIzLEyhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT3PR01MB8674
X-Proofpoint-GUID: UkMSYGVIP2JICHf5qgHQiWm0qv4D6PnQ
X-Proofpoint-ORIG-GUID: UkMSYGVIP2JICHf5qgHQiWm0qv4D6PnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_08,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 clxscore=1011 mlxscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201100133
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gU2F0LCAyMDIyLTAxLTA4IGF0IDAwOjE3ICswMDAwLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+
IFJvYmVydCBIYW5jb2NrIHdyb3RlOg0KPiA+IFByZXZpb3VzbHkgYSBkZXZpY2UgdHJlZSBwcm9w
ZXJ0eSB3YXMgYWRkZWQgdG8gYWxsb3cgb3ZlcnJpZGluZyB0aGUNCj4gPiByZWZlcmVuY2UgY2xv
Y2sgcGVyaW9kIHBhcmFtZXRlciBpZiB0aGUgZGVmYXVsdCB2YWx1ZSB1c2VkIHdhcyBpbmNvcnJl
Y3QuDQo+ID4gSG93ZXZlciwgdGhlcmUgaXMgYW5vdGhlciByZWdpc3RlciBmaWVsZCwgR0ZMQURK
X1JFRkNMS19GTEFESiwgd2hpY2gNCj4gPiByZWZsZWN0cyB0aGUgZnJhY3Rpb25hbCBuYW5vc2Vj
b25kIHBvcnRpb24gb2YgdGhlIHJlZmVyZW5jZSBjbG9jaw0KPiA+IHBlcmlvZC4gQWRkIGEgc25w
cyxyZWYtY2xvY2stZmxhZGogcHJvcGVydHkgdG8gYWxsb3cgY29uZmlndXJpbmcgdGhpcw0KPiA+
IGFzIHdlbGwuDQo+ID4gDQo+ID4gT24gdGhlIFhpbGlueCBaeW5xTVAgcGxhdGZvcm0sIHRoZSBy
ZWZlcmVuY2UgY2xvY2sgYXBwZWFycyB0byBhbHdheXMNCj4gPiBiZSAyMCBNSHosIGdpdmluZyBh
IGNsb2NrIHBlcmlvZCBvZiA1MCBucy4gSG93ZXZlciwgdGhlIGRlZmF1bHQgdmFsdWUNCj4gPiBv
ZiBHRkxBREpfUkVGQ0xLX0ZMQURKIHdhcyAxMDA4IHJhdGhlciB0aGFuIDAgYXMgaXQgc2hvdWxk
IGhhdmUgYmVlbiwNCj4gPiB3aGljaCBwcmV2ZW50ZWQgbWFueSBVU0IgZGV2aWNlcyBmcm9tIGZ1
bmN0aW9uaW5nIHByb3Blcmx5LiBUaGUNCj4gPiBwc3VfaW5pdCBjb2RlIHJ1biBieSB0aGUgWGls
aW54IGZpcnN0LXN0YWdlIGJvb3QgbG9hZGVyIHNldHMgdGhpcw0KPiA+IHZhbHVlIHRvIDAsIGhv
d2V2ZXIgd2hlbiB0aGUgY29udHJvbGxlciBpcyByZXNldCBieSB0aGUgZHdjMy14aWxpbngNCj4g
PiBsYXllciwgdGhlIGluY29ycmVjdCBkZWZhdWx0IHZhbHVlIGlzIHJlc3RvcmVkLiBUaGlzIGNv
bmZpZ3VyYXRpb24NCj4gPiBwcm9wZXJ0eSBhbGxvd3MgZW5zdXJpbmcgdGhhdCB0aGUgY29ycmVj
dCB2YWx1ZSBpcyBhbHdheXMgdXNlZC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQg
SGFuY29jayA8cm9iZXJ0LmhhbmNvY2tAY2FsaWFuLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiA+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCB8ICAzICsrKw0KPiA+ICAyIGZpbGVzIGNoYW5n
ZWQsIDM1IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+IGluZGV4IGY0YzA5OTUx
YjUxNy4uNjI4OWZiY2JhZDQ1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29y
ZS5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPiBAQCAtMzU5LDYgKzM1
OSwzNCBAQCBzdGF0aWMgdm9pZCBkd2MzX3JlZl9jbGtfcGVyaW9kKHN0cnVjdCBkd2MzICpkd2Mp
DQo+ID4gIH0NCj4gPiAgDQo+ID4gIA0KPiA+ICsvKg0KPiANCj4gVXNlIGtlcm5lbCBkb2Mgc3R5
bGUgIi8qKiINCg0KV2lsbCB1cGRhdGUgaW4gdjIuDQoNCj4gDQo+ID4gKyAqIGR3YzNfcmVmX2Ns
a19mbGFkaiAtIFJlZmVyZW5jZSBjbG9jayBwZXJpb2QgKGZyYWN0aW9uYWwgcG9ydGlvbikNCj4g
PiBjb25maWd1cmF0aW9uDQo+ID4gKyAqIEdGTEFESl9SRUZDTEtfRkxBREogY29udGFpbnMgdGhl
IGZyYWN0aW9uYWwgcG9ydGlvbiBvZiB0aGUgcmVmZXJlbmNlDQo+ID4gY2xvY2sNCj4gPiArICog
cGVyaW9kIHNldCBpbiBHVUNUTF9SRUZDTEtQRVIuDQo+IA0KPiBJdCdzIG5vdCBhIGRpcmVjdCAi
ZnJhY3Rpb25hbCBwb3J0aW9uIiB0aGUgd2F5IGl0J3MgZGVzY3JpYmVkIGhlcmUuIEl0DQo+IG1h
eSBjYXVzZSBzb21lIGNvbmZ1c2lvbi4gTGV0J3MgdXNlIHRoZSB3b3JkIGFkanVzdG1lbnQgdG8g
YWNjb3VudCBmb3INCj4gdGhlIGZyYWN0aW9uYWwgcG9ydGlvbiB0aGF0J3MgY2FsY3VsYXRlZCBh
cyBiZWxvdy4NCj4gDQo+ID4gKyAqIENhbGN1bGF0ZWQgYXM6ICgoMTI1MDAwL3JlZl9jbGtfcGVy
aW9kX2ludGVnZXIpLQ0KPiA+ICgxMjUwMDAvcmVmX2Nsa19wZXJpb2QpKSAqIHJlZl9jbGtfcGVy
aW9kDQo+IA0KPiBOb3RlIHRoYXQgcmVmX2Nsa19wZXJpb2RfaW50ZWdlciBpcyB0aGUgdmFsdWUg
aW4gR1VDVEwuUkVGQ0xLUEVSLCBhbmQNCj4gdGhlICJyZWZfY2xrX3BlcmlvZCIgaXMgdGhlIHBl
cmlvZCB3aXRoIGZyYWN0aW9uYWwgdmFsdWUuDQoNClJld29yZGluZyB0aGlzIGZvciB2Mi4NCg0K
PiANCj4gPiArICogVGhpcyB2YWx1ZSBjYW4gYmUgc3BlY2lmaWVkIGluIHRoZSBkZXZpY2UgdHJl
ZSBpZiB0aGUgZGVmYXVsdCB2YWx1ZSBpcw0KPiA+IGluY29ycmVjdC4NCj4gPiArICogTm90ZSB0
aGF0IDAgaXMgYSB2YWxpZCB2YWx1ZS4NCj4gPiArICoNCj4gPiArICogQGR3YzM6IFBvaW50ZXIg
dG8gb3VyIGNvbnRyb2xsZXIgY29udGV4dCBzdHJ1Y3R1cmUNCj4gPiArICovDQo+ID4gK3N0YXRp
YyB2b2lkIGR3YzNfcmVmX2Nsa19mbGFkaihzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiA+ICt7DQo+ID4g
Kwl1MzIgcmVnLCByZWdfbmV3Ow0KPiANCj4gSSBiZWxpZXZlIEZlbGlwZSBwcmVmZXJzIHRvIGRl
Y2xhcmUgdGhlbSBpbiBzZXBhcmF0ZSBsaW5lcy4gTGV0J3Mga2VlcA0KPiBpdCBjb25zaXN0ZW50
IGFzIGhvdyB3ZSBkbyBpdCBpbiBmb3IgdGhpcyBkcml2ZXIuDQoNCldpbGwgZG8uDQoNCj4gDQo+
ID4gKw0KPiA+ICsJaWYgKERXQzNfVkVSX0lTX1BSSU9SKERXQzMsIDI1MEEpKQ0KPiA+ICsJCXJl
dHVybjsNCj4gPiArDQo+ID4gKwlpZiAoIWR3Yy0+cmVmX2Nsa19mbGFkal9zZXQpDQo+ID4gKwkJ
cmV0dXJuOw0KPiA+ICsNCj4gPiArCXJlZyA9IGR3YzNfcmVhZGwoZHdjLT5yZWdzLCBEV0MzX0dG
TEFESik7DQo+ID4gKwlyZWdfbmV3ID0gcmVnICYgfkRXQzNfR0ZMQURKX1JFRkNMS19GTEFESl9N
QVNLOw0KPiA+ICsJcmVnX25ldyB8PSBGSUVMRF9QUkVQKERXQzNfR0ZMQURKX1JFRkNMS19GTEFE
Sl9NQVNLLCBkd2MtDQo+ID4gPnJlZl9jbGtfZmxhZGopOw0KPiA+ICsJaWYgKHJlZ19uZXcgIT0g
cmVnKQ0KPiA+ICsJCWR3YzNfd3JpdGVsKGR3Yy0+cmVncywgRFdDM19HRkxBREosIHJlZ19uZXcp
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICsNCj4gPiAgLyoqDQo+ID4gICAqIGR3YzNfZnJlZV9vbmVf
ZXZlbnRfYnVmZmVyIC0gRnJlZXMgb25lIGV2ZW50IGJ1ZmZlcg0KPiA+ICAgKiBAZHdjOiBQb2lu
dGVyIHRvIG91ciBjb250cm9sbGVyIGNvbnRleHQgc3RydWN0dXJlDQo+ID4gQEAgLTEwMzMsNiAr
MTA2MSw3IEBAIHN0YXRpYyBpbnQgZHdjM19jb3JlX2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4g
PiAgDQo+ID4gIAkvKiBBZGp1c3QgUmVmZXJlbmNlIENsb2NrIFBlcmlvZCAqLw0KPiA+ICAJZHdj
M19yZWZfY2xrX3BlcmlvZChkd2MpOw0KPiA+ICsJZHdjM19yZWZfY2xrX2ZsYWRqKGR3Yyk7DQo+
ID4gIA0KPiA+ICAJZHdjM19zZXRfaW5jcl9idXJzdF90eXBlKGR3Yyk7DQo+ID4gIA0KPiA+IEBA
IC0xNDE4LDYgKzE0NDcsOSBAQCBzdGF0aWMgdm9pZCBkd2MzX2dldF9wcm9wZXJ0aWVzKHN0cnVj
dCBkd2MzICpkd2MpDQo+ID4gIAkJCQkgJmR3Yy0+ZmxhZGopOw0KPiA+ICAJZGV2aWNlX3Byb3Bl
cnR5X3JlYWRfdTMyKGRldiwgInNucHMscmVmLWNsb2NrLXBlcmlvZC1ucyIsDQo+ID4gIAkJCQkg
JmR3Yy0+cmVmX2Nsa19wZXIpOw0KPiA+ICsJaWYgKCFkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIo
ZGV2LCAic25wcyxyZWYtY2xvY2stZmxhZGoiLA0KPiA+ICsJCQkJICAgICAgJmR3Yy0+cmVmX2Ns
a19mbGFkaikpDQo+ID4gKwkJZHdjLT5yZWZfY2xrX2ZsYWRqX3NldCA9IHRydWU7DQo+IA0KPiBQ
bGVhc2UgZG9jdW1lbnQgaXQgaW4gdGhlIGR3YzMgRFQgZmlsZSB3aGVuZXZlciB3ZSBpbnRyb2R1
Y2UgYSBuZXcgcHJvcGVydHkuDQoNCldob29wcywgZm9yZ290IHRoYXQuIFdpbGwgYWRkIGFzIGEg
c2VwYXJhdGUgcGF0Y2ggaW4gdjIuDQoNCj4gDQo+IEFsc28sIGRvIHdlIG5lZWQgdG8gYWRkIGEg
bmV3IGR3Yy0+cmVmX2Nsa19mbGFkal9zZXQ/IENhbiB3ZSBqdXN0IGRlZmluZQ0KPiBzb21lIGRl
ZmF1bHQgdmFsdWUgZm9yIGR3Yy0+cmVmX2Nsa19mbGFkaiBhcyB1bnNwZWNpZmllZCBhbmQgaGF2
ZSB0aGUNCj4gZHJpdmVyIGNoZWNrIGFnYWluc3QgdGhhdCAoZS5nLiAjZGVmaW5lIERXQzNfUkVG
Q0xLX0ZMQURKX1VOU1BFQ0lGSUVEDQo+IDB4ZmZmZmZmZmYpLg0KDQpJIGZpZ3VyZWQgdGhpcyB3
YXMgdGhlIG1vc3QgZXhwbGljaXQvY2xlYW5lc3Qgd2F5IHRvIGRvIGl0IHRoYXQgd291bGQgd29y
ayB3aXRoDQp0aGUgZGVmYXVsdCB6ZXJvIGluaXRpYWxpemF0aW9uIG9mIHRoZSBzdHJ1Y3R1cmUu
IE1vc3Qgb2YgdGhlc2Ugb3RoZXIgc2V0dGluZ3MNCnNlZW0gdG8gdXNlIDAgYXMgdGhlICJkb24n
dCBjaGFuZ2UgYW55dGhpbmciIHZhbHVlIGJ1dCBpbiB0aGlzIGNhc2Ugd2UgZG8NCnNvbWV0aW1l
cyBuZWVkIHRvIG92ZXJyaWRlIHRoZSB2YWx1ZSB3aXRoIDAuDQoNCj4gDQo+IFRoYW5rcywNCj4g
VGhpbmgNCj4gDQo+ID4gIA0KPiA+ICAJZHdjLT5kaXNfbWV0YXN0YWJpbGl0eV9xdWlyayA9IGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZGV2LA0KPiA+ICAJCQkJInNucHMsZGlzX21ldGFzdGFi
aWxpdHlfcXVpcmsiKTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgg
Yi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiA+IGluZGV4IGUxY2MzZjczOThmYi4uNjUwZDRj
MmU3YTY3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5oDQo+ID4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPiBAQCAtMzg4LDYgKzM4OCw3IEBADQo+ID4g
IC8qIEdsb2JhbCBGcmFtZSBMZW5ndGggQWRqdXN0bWVudCBSZWdpc3RlciAqLw0KPiA+ICAjZGVm
aW5lIERXQzNfR0ZMQURKXzMwTUhaX1NEQk5EX1NFTAkJQklUKDcpDQo+ID4gICNkZWZpbmUgRFdD
M19HRkxBREpfMzBNSFpfTUFTSwkJCTB4M2YNCj4gPiArI2RlZmluZSBEV0MzX0dGTEFESl9SRUZD
TEtfRkxBREpfTUFTSwkJMHgzZmZmMDANCj4gPiAgDQo+ID4gIC8qIEdsb2JhbCBVc2VyIENvbnRy
b2wgUmVnaXN0ZXIqLw0KPiA+ICAjZGVmaW5lIERXQzNfR1VDVExfUkVGQ0xLUEVSX01BU0sJCTB4
ZmZjMDAwMDANCj4gPiBAQCAtMTE2Niw2ICsxMTY3LDggQEAgc3RydWN0IGR3YzMgew0KPiA+ICAN
Cj4gPiAgCXUzMgkJCWZsYWRqOw0KPiA+ICAJdTMyCQkJcmVmX2Nsa19wZXI7DQo+ID4gKwlib29s
CQkJcmVmX2Nsa19mbGFkal9zZXQ7DQo+ID4gKwl1MzIJCQlyZWZfY2xrX2ZsYWRqOw0KPiA+ICAJ
dTMyCQkJaXJxX2dhZGdldDsNCj4gPiAgCXUzMgkJCW90Z19pcnE7DQo+ID4gIAl1MzIJCQljdXJy
ZW50X290Z19yb2xlOw0K
