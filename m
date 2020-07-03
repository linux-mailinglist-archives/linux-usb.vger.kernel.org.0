Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B46921365C
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 10:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGCI1F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 04:27:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:54664 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725648AbgGCI1F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 04:27:05 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B572FC050E;
        Fri,  3 Jul 2020 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593764824; bh=oHU8SCa2xFT6A7tc5/ZBQvNzTAN27Xdgj0Tu9XPp2bI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XRQogA9bPCQmjFAxqnQ1wHOQmmHkggljpBYvQTkeRFWug9f4k6XruqKrVV1cr5PRF
         02swRL1FunWORiwnl328xHFWn2c1pa4BRENw3inTy+nSZ0fkj2WxdsW1ZYNtMTKS4y
         NxodXZT5rxkTga9Qcf7GbwhhV2o8/tpNYvSR5+A7YuLZ5ltksMQBJ8OnrIj4QOIt2x
         D4K1gQN/a/P25eKxfPI2NomTEHjRgh09kP+U0yiHlo88xg4Krwj30IPZGP7mZgPkfR
         WV3choiManvd9yFZfDi/83nRguPAe6dw7vrShyomK3bRiT0wJU9BGsNCEHwVnu5S+n
         v/wgUWX4/CIgw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5DDDCA0255;
        Fri,  3 Jul 2020 08:27:04 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 32FB640256;
        Fri,  3 Jul 2020 08:27:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="GbNqLvUv";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfE3wfxFRl4DR0mr+mckTFcnpua3/VXSfY7UukmSTTpgjyl020uJA+y0XXBafi9g5BoL2ckFQ38G297YZvWEBJBxuJo15DMuTznBlebYxqMdmy+NaV3aftRMex4bBIazpA08IxspZMV5TOAhi40BF1fVGfwYblUsehGra0TlN8GEcj7wDN25m+0FHLT2l5ivda6Tj+TW6WZ4LpKgskYfJTi65Brk8GipnpmFdSVAZK2kUkKOYJDXL2vpOeYeJ/lXNP89scK0Dg94IUv2B4KyCG/8spSINuT6XzW2qCVDRgw2RX/zOXa3TRYWKn90ofaBwDcgCRzhh+8XOlbSg5Ui3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHU8SCa2xFT6A7tc5/ZBQvNzTAN27Xdgj0Tu9XPp2bI=;
 b=co91g2YyufomzJJbUFx6B7EVKW1DfsXadaNYKjNnjUQnebfjWsQsGiCXLV3XTnvqtx0R+NgZp843AiqZOC3z7n4uqyoOo6JnaWHBjPTttMLcaRITrcBHOlgtGc0WYSddp+lqtJLjYmeOvzGyUuaXm8SU2NRpjdvRDZsLyfizk1kReeiXaZtnsI3a9kqI+KNsNcSzuEii6kKXWFCUOem3dqZApEaGjkJpZRYS4G65MTR6l8sPNt1R2k7WEBuO90jNyVKPJbSsEM8+kDlkNEELUwTIP9f9Wwuo/jr84PYX6etONGd6gvX17MvDuzYimGB9F1Eio3hajuurAn0fluMRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHU8SCa2xFT6A7tc5/ZBQvNzTAN27Xdgj0Tu9XPp2bI=;
 b=GbNqLvUv5PZi/+7Az27VY3yfVaS5pCuOtqpNV54p3VJsCPayl3iL6ibpF+jFSttKOgz9HpPvKqN008tSyz9fSkf8oANeC2sio+5V+J+LYNWXbZhlQOlEE7QuxzBdcze1DnibAXTRK01u+e4kqznfm6FhqZeseHEicp8HXMHpWqc=
Received: from CY4PR12MB1432.namprd12.prod.outlook.com (2603:10b6:903:44::11)
 by CY4PR12MB1240.namprd12.prod.outlook.com (2603:10b6:903:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22; Fri, 3 Jul
 2020 08:27:02 +0000
Received: from CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd]) by CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd%10]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 08:27:02 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "ben@simtec.co.uk" <ben@simtec.co.uk>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: patch "usb: dwc2: gadget: Do not read GINTMSK2" added to
 usb-testing
Thread-Topic: patch "usb: dwc2: gadget: Do not read GINTMSK2" added to
 usb-testing
Thread-Index: AQHWUQxyYI6BZILKfUSqw3pWGfdTYqj1eRiAgAAKMICAAAIRgA==
Date:   Fri, 3 Jul 2020 08:27:02 +0000
Message-ID: <83a9539a-8eb3-b63f-b60f-3952bcff928a@synopsys.com>
References: <15937616791863@kroah.com>
 <6eb59328-78c3-f925-45bb-fdfcf032814c@synopsys.com>
 <20200703081937.GA2396807@kroah.com>
In-Reply-To: <20200703081937.GA2396807@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [37.252.92.106]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4421a3fb-4faf-44ec-62b9-08d81f2adcc2
x-ms-traffictypediagnostic: CY4PR12MB1240:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB12400789CDF6229B575D9565A76A0@CY4PR12MB1240.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UIwbUH4sRODI7UqmaT5ubLoV08TsRCmJKYwx4DXn4BRMvDdiDCC4sqU475BmN2BpXUVD/npn3PfJIwBGV+xbICEmnS+naR1vW426oDBl8zhMAMUaUnlXGbMk5BEM4gDk7s+E+8oDELVa6gJ0lsot+JNzeClM7NG0/kDRkP6fsOx1Yf4WiqwI/AspAb166weIDFC1nnRGOcBOCT8qOspO0q95s08jnCs69Nr4OfK6Pp/6vYjFM8XkMvVWeu7HPVPSh0zobT6qCDgoyMPvm30nIuWvUNsyDMySaGFPlrZDzSbdLIxXUwm7O7qa9kWdSXon5REbGQw4TauGtI9CKRQfbLCuUWRiJAbOZFJKqFDJTrAqSdRfV9wvzM2GZbMZEnqgkyUKQxG6ovUY4qYP1jkI/eDWh7+BhBVylT6UbEf/x/oSkCMyly0khdo5rCBAD3D7kacLdRfQTTeoAbbSMG4gnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1432.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(8676002)(2616005)(26005)(53546011)(86362001)(6486002)(31696002)(186003)(83380400001)(2906002)(36756003)(71200400001)(31686004)(8936002)(66556008)(64756008)(66476007)(5660300002)(6512007)(4326008)(110136005)(498600001)(76116006)(6506007)(66446008)(54906003)(66946007)(966005)(91956017)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: YFgvpe1O60WItxfjgr5tqLsEsW1yCWRyfxBzWksxuIGM4fjGe9jYU7AYUlk8XUTLPKvtxCpRb9ZpR9OjkJ5XRkCpATWB1ziXG5aFdzjPUtdhgYfkmnT4onTngavwd/UTj9Kag8eYihI5wHB0e3Fu9GGtDSYgnsxSjcQvWnS1vH84I4op2tThnatuzIP300Noy02orB//KiI4WmqlcuYizvuc4WdijB9iWCqtxOgKtHqJQ5LXYfv+KjyFzrWIfogFs5mfyTwmpdtaMgorcMhpur3YwB2cQQofDoNstXY3w5U/ePpRoUUUowy/jhSK6vlB0ZH5PfKCo5RHQYHiYuf3f68uJTf/AZWG3DaUeNV0V46Vokm2z6rf6L2PEBknpTxZGsSnUOLiDenWSSrgapBzlKvO9dIYqeIWnDWlW/WB9OOYcpgwOPecChdGjmn1f5cRr8wYObX7xrzdA/XQ9/8NOoAwj30wy0iLSpFpDPZb1pg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <40D3C82BF0DAF841AA3B575A699DB06C@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1432.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4421a3fb-4faf-44ec-62b9-08d81f2adcc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 08:27:02.4739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rC5fEjGktPSG14fTxuxY5wzhEun6XUS3bLyRbKmG12W8H014LkmqSQU57fOaKOzDntb7x9DpAQetTQI8pDN9Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1240
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk9uIDcvMy8yMDIwIDEyOjE5IFBNLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3
cm90ZToNCj4gT24gRnJpLCBKdWwgMDMsIDIwMjAgYXQgMDc6NDM6MTBBTSArMDAwMCwgTWluYXMg
SGFydXR5dW55YW4gd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBPbiA3LzMvMjAyMCAxMTozNCBBTSwg
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcgd3JvdGU6DQo+Pj4NCj4+PiBUaGlzIGlzIGEgbm90
ZSB0byBsZXQgeW91IGtub3cgdGhhdCBJJ3ZlIGp1c3QgYWRkZWQgdGhlIHBhdGNoIHRpdGxlZA0K
Pj4+DQo+Pj4gICAgICAgdXNiOiBkd2MyOiBnYWRnZXQ6IERvIG5vdCByZWFkIEdJTlRNU0syDQo+
Pj4NCj4+PiB0byBteSB1c2IgZ2l0IHRyZWUgd2hpY2ggY2FuIGJlIGZvdW5kIGF0DQo+Pj4gICAg
ICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC91
c2IuZ2l0DQo+Pj4gaW4gdGhlIHVzYi10ZXN0aW5nIGJyYW5jaC4NCj4+Pg0KPj4+IFRoZSBwYXRj
aCB3aWxsIHNob3cgdXAgaW4gdGhlIG5leHQgcmVsZWFzZSBvZiB0aGUgbGludXgtbmV4dCB0cmVl
DQo+Pj4gKHVzdWFsbHkgc29tZXRpbWUgd2l0aGluIHRoZSBuZXh0IDI0IGhvdXJzIGR1cmluZyB0
aGUgd2Vlay4pDQo+Pj4NCj4+PiBUaGUgcGF0Y2ggd2lsbCBiZSBtZXJnZWQgdG8gdGhlIHVzYi1u
ZXh0IGJyYW5jaCBzb21ldGltZSBzb29uLA0KPj4+IGFmdGVyIGl0IHBhc3NlcyB0ZXN0aW5nLCBh
bmQgdGhlIG1lcmdlIHdpbmRvdyBpcyBvcGVuLg0KPj4+DQo+Pj4gSWYgeW91IGhhdmUgYW55IHF1
ZXN0aW9ucyBhYm91dCB0aGlzIHByb2Nlc3MsIHBsZWFzZSBsZXQgbWUga25vdy4NCj4+Pg0KPj4N
Cj4+IFRoaXMgcGF0Y2ggaXMgbm90IGNvcnJlY3QuIFBsZWFzZSByZWFkIGJlbG93Lg0KPj4+DQo+
Pj4gICBGcm9tIDRmMWFlOWQ2MGFkYjNkNGY5YjhlYTk0ZjAyYmZjODgzZjk1NGJlZDYgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxDQo+Pj4gRnJvbTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4NCj4+PiBEYXRlOiBUaHUsIDIgSnVsIDIwMjAgMTU6NDY6MDQgKzAxMDANCj4+PiBTdWJq
ZWN0OiB1c2I6IGR3YzI6IGdhZGdldDogRG8gbm90IHJlYWQgR0lOVE1TSzINCj4+PiBNSU1FLVZl
cnNpb246IDEuMA0KPj4+IENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOA0K
Pj4+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQNCj4+Pg0KPj4+IFRoZSB2YWx1ZSBv
ZiBHSU5UTVNLMiBoYXNuJ3QgYmVlbiBjaGVja2VkIHNpbmNlIHRoZSBpbmNlcHRpb24gb2YNCj4+
PiBkd2MyX2dhZGdldF93a3VwX2FsZXJ0X2hhbmRsZXIoKSBpbiAyMDE4Lg0KPj4+DQo+Pj4gRml4
ZXMgdGhlIGZvbGxvd2luZyBXPTEgd2FybmluZzoNCj4+Pg0KPj4+ICAgIGRyaXZlcnMvdXNiL2R3
YzIvZ2FkZ2V0LmM6IEluIGZ1bmN0aW9uIOKAmGR3YzJfZ2FkZ2V0X3drdXBfYWxlcnRfaGFuZGxl
cuKAmToNCj4+PiAgICBkcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jOjI1OTo2OiB3YXJuaW5nOiB2
YXJpYWJsZSDigJhnaW50bXNrMuKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQ0KPj4+ICAgIDI1OSB8IHUzMiBnaW50bXNrMjsNCj4+PiAgICB8IF5+fn5+fn5+
DQo+Pj4NCj4+PiBDYzogTWluYXMgSGFydXR5dW55YW4gPGhtaW5hc0BzeW5vcHN5cy5jb20+DQo+
Pj4gQ2M6IEJlbiBEb29rcyA8YmVuQHNpbXRlYy5jby51az4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPg0KPj4+IExpbms6IGh0dHBzOi8vdXJsZGVm
ZW5zZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAwNzAyMTQ0NjI1LjI1
MzM1MzAtMTAtbGVlLmpvbmVzQGxpbmFyby5vcmdfXzshIUE0RjJSOUdfcGchTWxYdm4wdFNrVHZz
R1pab1dENXpxXzFPd3EtVS1ESUhOYUhveVUxT2ZHOFR3R0dRQkVmbzlnMG45cjJUeHZRJA0KPj4+
IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYyB8IDIgLS0N
Cj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQu
Yw0KPj4+IGluZGV4IDFkZWY5MDAwZjkzNi4uZWE3YzljNzNiNGZmIDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCj4+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL2dh
ZGdldC5jDQo+Pj4gQEAgLTI1NiwxMCArMjU2LDggQEAgaW50IGR3YzJfaHNvdGdfdHhfZmlmb190
b3RhbF9kZXB0aChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQo+Pj4gICAgc3RhdGljIHZvaWQg
ZHdjMl9nYWRnZXRfd2t1cF9hbGVydF9oYW5kbGVyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykN
Cj4+PiAgICB7DQo+Pj4gICAgCXUzMiBnaW50c3RzMjsNCj4+PiAtCXUzMiBnaW50bXNrMjsNCj4+
PiAgICANCj4+PiAgICAJZ2ludHN0czIgPSBkd2MyX3JlYWRsKGhzb3RnLCBHSU5UU1RTMik7DQo+
Pj4gLQlnaW50bXNrMiA9IGR3YzJfcmVhZGwoaHNvdGcsIEdJTlRNU0syKTsNCj4+PiAgICANCj4+
PiAgICAJaWYgKGdpbnRzdHMyICYgR0lOVFNUUzJfV0tVUF9BTEVSVF9JTlQpIHsNCj4+PiAgICAJ
CWRldl9kYmcoaHNvdGctPmRldiwgIiVzOiBXa3VwX0FsZXJ0X0ludFxuIiwgX19mdW5jX18pOw0K
Pj4NCj4+IExlZSwgJ2dpbnRzdHMyJyBjYW4ndCBiZSByZW1vdmVkLiBKdXN0LCBwbGVhc2UgYWRk
IGZvbGxvdyBsaW5lIGFmdGVyDQo+PiByZWFkaW5nIGdpbnRtc2syOg0KPj4NCj4+IAlnaW50c3Rz
MiAmPSBnaW50bXNrMjsNCj4gDQo+IFNvIHRoYXQncyBhIHJlYWwgYnVnZml4IG5lZWRlZD8NCj4g
DQoNClllcywgaGVyZSByZWFsIGJ1Z2ZpeCBuZWVkLCBvdGhlcndpc2Ugc3B1cmlvdXMgaW50ZXJy
dXB0ICd3a3VwX2FsZXJ0JyANCmNhbiBiZSBoYW5kbGVkLg0KDQpUaGFua3MsDQpNaW5hcw0KDQo+
IE9rLCBJJ2xsIGRyb3AgdGhpcyBwYXRjaCBmcm9tIHRoZSB0cmVlIG5vdywgdGhhbmtzLg0KPiAN
Cj4gZ3JlZyBrLWgNCj4gDQo=
