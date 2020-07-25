Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A6722D497
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 06:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgGYEK7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jul 2020 00:10:59 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57774 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725766AbgGYEK7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jul 2020 00:10:59 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8DDE3401AC;
        Sat, 25 Jul 2020 04:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595650258; bh=QXcjayZeHJRgwkioGd5mBj7lQChlrD61KZB90oArx7E=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SaPgazFa+ephUs5Oq6dltCnm4XE3i8+yBiI5gBpXtdarLq8kaEPLOeHy9IPM1S4hx
         YgsgPEdLWBaIgd8teuvlGdc3VzwbOZBq9c3OQD+OzKCloiYpTemGDkfj0luLSA7J7+
         nEzMqPO1VL/CgFs+sh5epMV41KTZX/dkOcFULg1avz1G4YqRxk4S/YKnm0ELK+iY2e
         M/uGUN7ksKe+ZaZccMMqddzeq0nxSqUff39Aqy0Am2kCV0RbTsIXy+nqftgfopZUoV
         pwIFMXUNTZ5JgeTWWmL42wpnD3PNJtAUsw/kmQYhX2pEbd4C7kbO7EzY87I3Q+Xaqv
         kH7cvZy8JUyTA==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0F64CA0096;
        Sat, 25 Jul 2020 04:10:57 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2057.outbound.protection.outlook.com [104.47.38.57])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 553FF801BF;
        Sat, 25 Jul 2020 04:10:56 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="O50HWx72";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQt+Oq65MNBLnzLNGr3SIqA/LclWl2md2j3tRubnEEPuHsqd0Xoyv9LFEs98SrHE8u5RctR1FxTbuHaAJ5VmSYY6u0fbt2oU/U6zxnFnDs2wRIj9YonihGXUx2UAj1rZKjzpu2D3h8/ro95dbD4hLqsp4ZmjFP+ETf4ZEhT2pShbOXHFxPC2ySrR+cL+4MqbGOMwGnlpSnIdW/aYGrGtPV2+2OApAkppPp6Pz5xqgB8qslOp5UTzO+sWaeeDM6JmXMJIdDXc21UROz7SxDePCnvf2z3GRsE34avsCofzwITC/Krj1OA0xkRFJMpxqKj4tkV++Qiia2QFH/SOsk27bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXcjayZeHJRgwkioGd5mBj7lQChlrD61KZB90oArx7E=;
 b=S7x8IzVaerzpYikDVH0sDS6psUqAWOlx6d+lXAD3Oyew93XJ2aL5VoDoMUhqkSdqndr1tUw8zbUrOzpOmLJoCnooEIOfbbjcS1oUO+YvHlVjGccP/gnXa2Itv3Ykzjnlp+auoKKtUFM569F8Iq2aM9EAvBEtvkZ5m8+zBBNhRJvkxbWO6pZh0zj4ZuE9r0jDTotre2H1MHt+WZRZps1+NK9gisGLiU2lnfTdDCYabn95JWAANIyp6jZvdHs6PxNRGrg0rGssBNfgY7UEmV3wsIWcCQSDvejhMhhcPZ2ytyyiLnWJWdboYJ6MIvM9CmPlXXA40SU8FW0JBs2EKHaC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXcjayZeHJRgwkioGd5mBj7lQChlrD61KZB90oArx7E=;
 b=O50HWx72FSnmn4zQsYu2LbphzDt2yJ2jtVBNvoorivPBNkm2HbCmfE6JkDV0njueh7cNund0c+P+8rVVyJu4JwuAggaJTXIuTUZufSi9Lxln7u8yYHl7B4sx9iwe5spi1AJC6rV3e5YDaR4nCef6Rj7mdhEZbeXyoUHaU4suy8g=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3509.namprd12.prod.outlook.com (2603:10b6:a03:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Sat, 25 Jul
 2020 04:10:53 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3216.025; Sat, 25 Jul 2020
 04:10:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Thread-Topic: [PATCH v3 07/12] usb: common: Add function to get num_lanes and
 transfer rate
Thread-Index: AQHWYhOjeRkVZXshpUGFMJg4gOAOx6kXrH+AgAAChQA=
Date:   Sat, 25 Jul 2020 04:10:53 +0000
Message-ID: <982def66-4187-65a0-dc88-db8a9b9dac9a@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <d86ccd4f97469cfe67cbce549b37d4df7cd8cb27.1595631457.git.thinhn@synopsys.com>
 <1595649711.23885.82.camel@mhfsdcap03>
In-Reply-To: <1595649711.23885.82.camel@mhfsdcap03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b11ff7b-3188-4d8f-9d29-08d83050b8fc
x-ms-traffictypediagnostic: BYAPR12MB3509:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB350983BD2D2C2639F137CC7FAA740@BYAPR12MB3509.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1sMmG/uyKx7O8TDUt5z71F/8coU0lcmPPy7zos2Hfa1XWTN+4naeYJKZPWbtGq7Zitih9b7iHhPigYmpyv0Fn2hj5Nr3gi6p+vMr67l1SC8hSP60aeLe1+3khnZYrFfDYpCtiONVfrMxxMIyD1hcyMPfFTD8yX/UnVirOkfr7IuRnQC49sCl1YGWIHbiHftvPXzIkKWmV+5gMx3P9i9XKG12Mlm0MBXY/hsH7mJCP8vOZ9RmxXOOt9T30kWYHH7SwTPeQ1hWk57U9LpP903sf5p1wi2l8tarZZZG0ySo+u2ap54I7B+Wlr7cN2ZPXbp4IEN0f2UPu3Z9LFw8ZmyXNGxzErl9AJQ+LfQ6kzEBGETAezRK9nMOLFm4s6AKsQvq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(2906002)(478600001)(316002)(8676002)(4326008)(66946007)(66446008)(64756008)(66556008)(66476007)(6486002)(76116006)(6506007)(86362001)(31696002)(110136005)(54906003)(6512007)(31686004)(71200400001)(186003)(83380400001)(36756003)(107886003)(8936002)(2616005)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 9f4rpPDGuOkMJ3/56j8sKuhZ6we4xDvV8GXrEoD8bBw6zBWDfKABvWQTSeZC/MDPI0uv2zijavWWPaDji9XPYlK4qhcYkb4DagdJkH6if65jw1tgkHvd/h1dFxfTGMF7wgQPiSmxJ/nE7q95FAbb1h64ycgMym+c0Sv7gECVPmQKF0t6TGHqtllqpVfZv358cic2RfOVmo51VFkRoCtvob/1bs/jPy/QXpaVR7UuYlMCcu4HlGMRXSYXyQErbqxYIVfFpnCNryzSn2baGZ7+v5wNqBA60510joBNZpitwsW+GEnBtjlRql4MPvDWGH6N4pKfyuSs6O7+39rPXzri5kppJsD2QrbHSRSa0DvH6WpMRklTqJ1BSwO7jEHmnB+rIMJ5mjwiDp+8wEFbkok+FSdJOCb9dvoIQSSHbXx5Bw6ZvulUpcHPqSWPtFEYSxYeJfWpdssDtEdHYFKc5UyAB8d9+HrlBr9qHu+nRCXyakM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9883EDE4EE26DB4A8EB4A0E4F038391B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b11ff7b-3188-4d8f-9d29-08d83050b8fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2020 04:10:53.1385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /DD9MjYHuahgZbhr1v629ORPaM6zxVVpBfvwlO39P9rMEvna1/du8igh3KZFZU8kbCAfxWbUmTb+98ZTDoICfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3509
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Q2h1bmZlbmcgWXVuIHdyb3RlOg0KPiBPbiBGcmksIDIwMjAtMDctMjQgYXQgMTY6MzkgLTA3MDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IEFkZCBhIG5ldyBjb21tb24gZnVuY3Rpb24gdG8gcGFy
c2UgbWF4aW11bV9zcGVlZCBwcm9wZXJ0eSBzdHJpbmcgZm9yDQo+PiB0aGUgc3BlY2lmaWVkIG51
bWJlciBvZiBsYW5lcyBhbmQgdHJhbnNmZXIgcmF0ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBU
aGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+IENoYW5nZXMgaW4g
djM6DQo+PiAtIEFkZCBuZXcgZnVuY3Rpb24gdG8gcGFyc2UgIm1heGltdW0tc3BlZWQiIGZvciBs
YW5lcyBhbmQgdHJhbnNmZXIgcmF0ZQ0KPj4gLSBSZW1vdmUgc2VwYXJhdGUgZnVuY3Rpb25zIGdl
dHRpbmcgbnVtX2xhbmVzIGFuZCB0cmFuc2ZlciByYXRlIHByb3BlcnRpZXMNCj4+IENoYW5nZXMg
aW4gdjI6DQo+PiAtIE5ldyBjb21taXQNCj4+DQo+PiAgIGRyaXZlcnMvdXNiL2NvbW1vbi9jb21t
b24uYyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQ0K
Pj4gICBpbmNsdWRlL2xpbnV4L3VzYi9jaDkuaCAgICAgfCAyNSArKysrKysrKysrKysrKysrKysr
KysrKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMgYi9k
cml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMNCj4+IGluZGV4IDE0MzMyNjBkOTliNC4uNTNiNDk1
MGM0OWU0IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvY29tbW9uL2NvbW1vbi5jDQo+PiAr
KysgYi9kcml2ZXJzL3VzYi9jb21tb24vY29tbW9uLmMNCj4+IEBAIC03NywxOCArNzcsNTkgQEAg
Y29uc3QgY2hhciAqdXNiX3NwZWVkX3N0cmluZyhlbnVtIHVzYl9kZXZpY2Vfc3BlZWQgc3BlZWQp
DQo+PiAgIH0NCj4+ICAgRVhQT1JUX1NZTUJPTF9HUEwodXNiX3NwZWVkX3N0cmluZyk7DQo+PiAg
IA0KPj4gLWVudW0gdXNiX2RldmljZV9zcGVlZCB1c2JfZ2V0X21heGltdW1fc3BlZWQoc3RydWN0
IGRldmljZSAqZGV2KQ0KPj4gK3ZvaWQgdXNiX2dldF9tYXhpbXVtX3NwZWVkX2FuZF9udW1fbGFu
ZXMoc3RydWN0IGRldmljZSAqZGV2LA0KPj4gKwkJCQkJIGVudW0gdXNiX2RldmljZV9zcGVlZCAq
c3BlZWQsDQo+PiArCQkJCQkgZW51bSB1c2JfcGh5X2dlbiAqZ2VuLA0KPj4gKwkJCQkJIHU4ICpu
dW1fbGFuZXMpDQo+PiAgIHsNCj4+ICAgCWNvbnN0IGNoYXIgKm1heGltdW1fc3BlZWQ7DQo+PiAr
CWVudW0gdXNiX2RldmljZV9zcGVlZCBtYXRjaGVkX3NwZWVkID0gVVNCX1NQRUVEX1VOS05PV047
DQo+PiArCWVudW0gdXNiX3BoeV9nZW4gbWF0Y2hlZF9nZW4gPSBVU0JfUEhZX0dFTl9VTktOT1dO
Ow0KPj4gKwl1OCBtYXRjaGVkX251bV9sYW5lcyA9IDA7DQo+PiAgIAlpbnQgcmV0Ow0KPj4gICAN
Cj4+ICAgCXJldCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhkZXYsICJtYXhpbXVtLXNw
ZWVkIiwgJm1heGltdW1fc3BlZWQpOw0KPj4gICAJaWYgKHJldCA8IDApDQo+PiAtCQlyZXR1cm4g
VVNCX1NQRUVEX1VOS05PV047DQo+PiArCQlnb3RvIGRvbmU7DQo+PiAgIA0KPj4gICAJcmV0ID0g
bWF0Y2hfc3RyaW5nKHNwZWVkX25hbWVzLCBBUlJBWV9TSVpFKHNwZWVkX25hbWVzKSwgbWF4aW11
bV9zcGVlZCk7DQo+PiArCWlmIChyZXQgPj0gMCkgew0KPj4gKwkJbWF0Y2hlZF9zcGVlZCA9IHJl
dDsNCj4+ICsJCWdvdG8gZG9uZTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlpZiAoc3RybmNtcCgic3Vw
ZXItc3BlZWQtcGx1cy1nZW4yeDIiLCBtYXhpbXVtX3NwZWVkLCAyMykgPT0gMCkgew0KPj4gKwkJ
bWF0Y2hlZF9zcGVlZCA9IFVTQl9TUEVFRF9TVVBFUl9QTFVTOw0KPj4gKwkJbWF0Y2hlZF9nZW4g
PSBVU0JfUEhZX0dFTl8yOw0KPj4gKwkJbWF0Y2hlZF9udW1fbGFuZXMgPSAyOw0KPj4gKwl9IGVs
c2UgaWYgKHN0cm5jbXAoInN1cGVyLXNwZWVkLXBsdXMtZ2VuMngxIiwgbWF4aW11bV9zcGVlZCwg
MjMpID09IDApIHsNCj4+ICsJCW1hdGNoZWRfc3BlZWQgPSBVU0JfU1BFRURfU1VQRVJfUExVUzsN
Cj4+ICsJCW1hdGNoZWRfZ2VuID0gVVNCX1BIWV9HRU5fMjsNCj4+ICsJCW1hdGNoZWRfbnVtX2xh
bmVzID0gMTsNCj4+ICsJfSBlbHNlIGlmIChzdHJuY21wKCJzdXBlci1zcGVlZC1wbHVzLWdlbjF4
MiIsIG1heGltdW1fc3BlZWQsIDIzKSA9PSAwKSB7DQo+PiArCQltYXRjaGVkX3NwZWVkID0gVVNC
X1NQRUVEX1NVUEVSX1BMVVM7DQo+PiArCQltYXRjaGVkX2dlbiA9IFVTQl9QSFlfR0VOXzE7DQo+
PiArCQltYXRjaGVkX251bV9sYW5lcyA9IDI7DQo+PiArCX0NCj4+ICsNCj4+ICtkb25lOg0KPj4g
KwlpZiAoc3BlZWQpDQo+PiArCQkqc3BlZWQgPSBtYXRjaGVkX3NwZWVkOw0KPj4gKw0KPj4gKwlp
ZiAobnVtX2xhbmVzKQ0KPj4gKwkJKm51bV9sYW5lcyA9IG1hdGNoZWRfbnVtX2xhbmVzOw0KPj4g
Kw0KPj4gKwlpZiAoZ2VuKQ0KPj4gKwkJKmdlbiA9IG1hdGNoZWRfZ2VuOw0KPj4gK30NCj4+ICtF
WFBPUlRfU1lNQk9MX0dQTCh1c2JfZ2V0X21heGltdW1fc3BlZWRfYW5kX251bV9sYW5lcyk7DQo+
PiArDQo+PiArZW51bSB1c2JfZGV2aWNlX3NwZWVkIHVzYl9nZXRfbWF4aW11bV9zcGVlZChzdHJ1
Y3QgZGV2aWNlICpkZXYpDQo+PiArew0KPj4gKwllbnVtIHVzYl9kZXZpY2Vfc3BlZWQgc3BlZWQ7
DQo+PiAgIA0KPj4gLQlyZXR1cm4gKHJldCA8IDApID8gVVNCX1NQRUVEX1VOS05PV04gOiByZXQ7
DQo+PiArCXVzYl9nZXRfbWF4aW11bV9zcGVlZF9hbmRfbnVtX2xhbmVzKGRldiwgJnNwZWVkLCBO
VUxMLCBOVUxMKTsNCj4+ICsJcmV0dXJuIHNwZWVkOw0KPj4gICB9DQo+PiAgIEVYUE9SVF9TWU1C
T0xfR1BMKHVzYl9nZXRfbWF4aW11bV9zcGVlZCk7DQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvdXNiL2NoOS5oIGIvaW5jbHVkZS9saW51eC91c2IvY2g5LmgNCj4+IGluZGV4
IDAxMTkxNjQ5YTBhZC4uNDZjZmQ3MmU3MDgyIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9saW51
eC91c2IvY2g5LmgNCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvdXNiL2NoOS5oDQo+PiBAQCAtNTcs
NiArNTcsMTMgQEAgZW51bSB1c2JfbGlua19wcm90b2NvbCB7DQo+PiAgIAlVU0JfTFBfU1NQID0g
MSwNCj4+ICAgfTsNCj4+ICAgDQo+PiArLyogVVNCIHBoeSBzaWduYWxpbmcgcmF0ZSBnZW4gKi8N
Cj4+ICtlbnVtIHVzYl9waHlfZ2VuIHsNCj4+ICsJVVNCX1BIWV9HRU5fVU5LTk9XTiwNCj4+ICsJ
VVNCX1BIWV9HRU5fMSwNCj4+ICsJVVNCX1BIWV9HRU5fMiwNCj4+ICt9Ow0KPiBUaGUgR0VOXzEs
IEdFTl8yIHdpbGwgZGVzY3JpYmUgdGhlIGNhcGFiaWxpdHkgb2Ygbm90IG9ubHkgUEhZIGJ1dCBh
bHNvDQo+IE1BQywgYWRkIF9QSFlfIHNlZW1zIGEgbGl0dGxlIGFtYmlndW91cywgSSB0aGluaw0K
PiB1c2JfZ2V0X21heGltdW1fc3BlZWRfYW5kX251bV9sYW5lcygpIGlzIG1haW5seSB1c2VkIHRv
IGdldCB0aGUNCj4gY2FwYWJpbGl0eSBvZiBNQUMuIEFub3RoZXIsIG5vdCBzdWl0YWJsZSB0byBh
ZGQgcHJvcGVydHkgYWJvdXQgUEhZDQo+IGNhcGFibGl0eSBpbiBNQUMgbm9kZXMuDQo+DQoNCiBG
cm9tIFVTQiAzLjIgc3BlYzoNCiJHZW4gMSBpcyBhbiBhZGplY3RpdmUgdXNlZCB0byByZWZlciB0
byB0aGUgUGh5c2ljYWwgbGF5ZXIgYXNzb2NpYXRlZCANCndpdGggYSA1LjAgR2JwcyBzaWduYWxp
bmcgcmF0ZS4gVGhlIG9yaWdpbmFsIFVTQiBTdXBlclNwZWVkIFBoeSBhbmQgYSANCkdlbiAxIFBo
eSByZWZlciB0byB0aGUgc2FtZSBQaHkuIg0KIkdlbiAyIGlzIGFuIGFkamVjdGl2ZSB1c2VkIHRv
IHJlZmVyIHRvIHRoZSBQaHlzaWNhbCBsYXllciBhc3NvY2lhdGVkIA0Kd2l0aCBhIDEwIEdicHMg
c2lnbmFsaW5nIHJhdGUuIg0KDQpJZiB5b3UgaGF2ZSBhIGJldHRlciBuYW1lLCBJJ20gb3BlbiBm
b3Igc3VnZ2VzdGlvbnMuDQoNCkJSLA0KVGhpbmgNCg==
