Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E73F32135B6
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 10:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgGCIEx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 04:04:53 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:53918 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726289AbgGCIEx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 04:04:53 -0400
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 61ACBC050E;
        Fri,  3 Jul 2020 08:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593763492; bh=RkVgfp9RnRxdVKCVuIFJWwlFvhAsSqyBBnaFZOfzaeY=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=G8eZwslSiKOWHxqem6jE2cyOBBBdoefu28GmG3iSxhtuGZU9tYW7gNS8+8vQbM99G
         jHfKG80Fr2wEKiUTq8qHZoMtyvSf0wUgHZ07s5YBVE10t2G6jIQN3h18JcXDechgu4
         aiDbQsNheoVUw8aInENn4UaYfnmx0ql5MaWWq5uPaVCoKvfgvbVZqMWaoFZ3/25r9j
         JIBPWPV9DRaPuGO0UbdlRcYGQeQQgDFp6hWMHPmf1+Q2qbaYkD6LqwRx5mv2s8PhAN
         Hy/nhpNOHcWmAMN/17jsbbxbDISWk2R+ukpeReRYC+nOunyrKCJpdFzUpS4XmuQWoI
         ApnTbGPfZ2geg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 52705A0077;
        Fri,  3 Jul 2020 08:04:50 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 772DF8119B;
        Fri,  3 Jul 2020 08:04:48 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="NHcVH+9h";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYYLdcdbeEPNlOXoXW2qFOq+tXeSSsTNx9aRV1wlj0I3IbMEV331mY/kZnpSnIePsm9MArwYZlPGcfMhVAtLyOMp3R4Z21vWC7S1yIjej/4PbHuUFyuvDPAWxlyUHDe9cyuMPsLSP5LIYNt8V1718e6TRMXlmYV1mZE+Vly6DLjReI+A35tWEJniy++h6PJXBrD2NXFSTjfJKZu3quFNr6+C4Zsb3n/V/1t8V2whmXB9PhWexXI9vRckcacp+bczZkIgrnYgz5YUf4Ax/NceFVfjZW9T3HWbuuvEi7/gHEJq3R1ZbV5Uc5GcL93R3f1bLpxvejm0accac8tUJNK7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkVgfp9RnRxdVKCVuIFJWwlFvhAsSqyBBnaFZOfzaeY=;
 b=CGb2CqV/b9C7TbfubH2wRs2PCGLIhE2nv1rJnROfWpSdlC2WlP/4CuMbEJ9SmEKgeQc7e+/nuuZ5ht95ClUDnYDqoiIiA5h47XqZ1mdDwkVFC1MVqiBtG6AJfNpugAzi5cODBQzcd0rCTc51HK8CxMcjeKlN98DL+o/qaQe/LNJuq0cFm6JQ2yGSd5zMAH3ST60PKLWuyosORIMdDRHtJVlw8BS1j/OxiQD8F4RON71gWVOXWQ1o3fLRJH1URFBXFFxI4ND0x4PLunU7ZVHu+ehEIvwcqYqED7yQh0NTeUA4oEg7y3Kf88pflIFIekct8bXAlnBRGGDht/OoZ+rGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RkVgfp9RnRxdVKCVuIFJWwlFvhAsSqyBBnaFZOfzaeY=;
 b=NHcVH+9h7n+1oHbu8E90BqabyVUqKqrJ9JuVYSALSWgFuXZ3nibMRcRH4O6t6vJ8/zz+9jVMvNm/LnwKtk/QF7uHThGeTKPris5UZ6rfqtRqrWLq3iG6pSs3CDcvy0hYgtuJA1QVHI8g9Gf5vNW0rGS18MFbBsv5K9c236JBZKg=
Received: from CY4PR12MB1432.namprd12.prod.outlook.com (2603:10b6:903:44::11)
 by CY4PR12MB1416.namprd12.prod.outlook.com (2603:10b6:903:44::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Fri, 3 Jul
 2020 08:04:45 +0000
Received: from CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd]) by CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd%10]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 08:04:45 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "ben@simtec.co.uk" <ben@simtec.co.uk>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: patch "usb: dwc2: gadget: Remove assigned but never used
 'maxsize'" added to usb-testing
Thread-Topic: patch "usb: dwc2: gadget: Remove assigned but never used
 'maxsize'" added to usb-testing
Thread-Index: AQHWUQx1DzdHtP3ay0e5/fuE4d4vL6j1fHKAgAACrQA=
Date:   Fri, 3 Jul 2020 08:04:45 +0000
Message-ID: <b9a40f7b-cc22-72b5-74ef-a4ab239b8789@synopsys.com>
References: <1593761680160133@kroah.com>
 <825601ce-ba13-2160-8fe6-449c2617658f@synopsys.com>
In-Reply-To: <825601ce-ba13-2160-8fe6-449c2617658f@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 527487b9-c208-4eb2-f256-08d81f27bfd3
x-ms-traffictypediagnostic: CY4PR12MB1416:
x-microsoft-antispam-prvs: <CY4PR12MB141673DF851C961A748203E2A76A0@CY4PR12MB1416.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tPrpejlcSZ5KR45BbKyAChQQpW8ZAECfh54eJpUJf42qig1EFDls+b005O7dxR2Wgkip34xpMdJBywjSR+qbQrPHGQ8sIBfe2TDInI52xjZgw4+iQ37S1ntzz+OMOljPq9jScMxU2581rH/FRn9q9KYI28FMCUYLmjL6mBCJEzJ4Mi1g+BHiP/gDtNYsXj12PfhfdiTJa+pEP5k67vHY1vBAcT/fAffwOlsSUI6z2DMGQ6e21fcWZJCYE9B5SNw3QFJHXE1vgHuCS8f1mi+XJNdf3ZF51ZKR6uOQ+TokFNjkbgcIwVsDXlLdEkEXGdU9RtQ4PuT06Hah4ekifzt9/xHDcpO0LcBHZOUYtV0Io3+0VaIHuOZK118zjY/f5LPjhbNX4/qv6xKnLMykseRK8jvvFSyrN4uYwojUAU0rYg3FzEvGmDGtXh5NZ55wzhFnPsXTYh0cdbau/hn0oFMK2g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1432.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(39860400002)(376002)(366004)(136003)(6486002)(31686004)(2906002)(2616005)(66946007)(66556008)(66446008)(64756008)(66476007)(91956017)(86362001)(5660300002)(31696002)(36756003)(76116006)(71200400001)(6512007)(316002)(966005)(186003)(26005)(53546011)(8936002)(6506007)(8676002)(478600001)(110136005)(83380400001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 8rPv1AkGvO/mUTB5lsPM8PpL9AiBu6MlxMzuobk1AgGzcCQ6xsVoNgz2bhKxgJGJnUwbLfSS9FXe8zJ6rEg7nGkN9c61wskbVv8g+bpRqHKBqnNWpfa2vkZtM0VxyFTbRA0RnXpcbuHmVwrpu0pJMQfVqfjPK7hYDgqq2vbf3B3RnSPNh978oztXcI9NcUWA5X/yogY/yICwJ4xhluGVJcuFpwgYocmdWqOCgHQeTQ9fKG5tTRUoXbCTn66YNK3VTNZv7apZjtHt8NszbS8QxI5LJZTXlhq0obuBg2CTHoJUWJNDqu4sNs8/O0+uqVore/qTxonVvxa5IHj1SDJ06Cu3IAo6TqDgB3wTG4X4hyzXI0hWgWxrq9ddCxn/sdlQT6BsLDNW///AaTSCem892uRpdhtE39GB+y6P+MDO8G0IrO5IqPqBN/5icrB+awC3Mk8Wjedo8S89bGhXmqdMnj7mV/EwuAJeTz8Nk0D8ahA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <852476F1CA2C5640A3D4CB71067E0421@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1432.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527487b9-c208-4eb2-f256-08d81f27bfd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 08:04:45.3959
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dLfTF2GvoHSjtl29SuTEst26+fmDx8D+IqeS5fCNie0eWVmhiikKxqFwACgxpZSbDF51EB3UGEc8awS+GnOh4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1416
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWRkZWQgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZyB0byByZWNpcGllbnQgbGlzdC4NCk1pbmFz
DQoNCg0KT24gNy8zLzIwMjAgMTE6NTUgQU0sIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPiBI
aSwNCj4gDQo+IE9uIDcvMy8yMDIwIDExOjM0IEFNLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
ZyB3cm90ZToNCj4+DQo+PiBUaGlzIGlzIGEgbm90ZSB0byBsZXQgeW91IGtub3cgdGhhdCBJJ3Zl
IGp1c3QgYWRkZWQgdGhlIHBhdGNoIHRpdGxlZA0KPj4NCj4+ICAgICAgIHVzYjogZHdjMjogZ2Fk
Z2V0OiBSZW1vdmUgYXNzaWduZWQgYnV0IG5ldmVyIHVzZWQgJ21heHNpemUnDQo+Pg0KPj4gdG8g
bXkgdXNiIGdpdCB0cmVlIHdoaWNoIGNhbiBiZSBmb3VuZCBhdA0KPj4gICAgICAgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC91c2IuZ2l0DQo+PiBp
biB0aGUgdXNiLXRlc3RpbmcgYnJhbmNoLg0KPj4NCj4+IFRoZSBwYXRjaCB3aWxsIHNob3cgdXAg
aW4gdGhlIG5leHQgcmVsZWFzZSBvZiB0aGUgbGludXgtbmV4dCB0cmVlDQo+PiAodXN1YWxseSBz
b21ldGltZSB3aXRoaW4gdGhlIG5leHQgMjQgaG91cnMgZHVyaW5nIHRoZSB3ZWVrLikNCj4+DQo+
PiBUaGUgcGF0Y2ggd2lsbCBiZSBtZXJnZWQgdG8gdGhlIHVzYi1uZXh0IGJyYW5jaCBzb21ldGlt
ZSBzb29uLA0KPj4gYWZ0ZXIgaXQgcGFzc2VzIHRlc3RpbmcsIGFuZCB0aGUgbWVyZ2Ugd2luZG93
IGlzIG9wZW4uDQo+Pg0KPj4gSWYgeW91IGhhdmUgYW55IHF1ZXN0aW9ucyBhYm91dCB0aGlzIHBy
b2Nlc3MsIHBsZWFzZSBsZXQgbWUga25vdy4NCj4+DQo+Pg0KPiANCj4gR3JlZywgSSdsbCBwcmVm
ZXIgaWYgTGVlIEpvbmVzIGFkZCAiRml4ZXM6IiB0YWcgYW5kIHJlc3VibWl0IHYyLg0KPiANCj4g
VGhhbmtzLA0KPiBNaW5hcw0KPiANCj4gDQo+PiAgIEZyb20gN2M3Y2I2Y2Q5MjgwN2NjMjI2ZmM4
MmFkYTA1M2I4MDM1MzE3YWI1MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206IExl
ZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+DQo+PiBEYXRlOiBUaHUsIDIgSnVsIDIwMjAg
MTU6NDY6MDUgKzAxMDANCj4+IFN1YmplY3Q6IHVzYjogZHdjMjogZ2FkZ2V0OiBSZW1vdmUgYXNz
aWduZWQgYnV0IG5ldmVyIHVzZWQgJ21heHNpemUnDQo+PiBNSU1FLVZlcnNpb246IDEuMA0KPj4g
Q29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04DQo+PiBDb250ZW50LVRyYW5z
ZmVyLUVuY29kaW5nOiA4Yml0DQo+Pg0KPj4gVGhlIHZhbHVlIG9mICdtYXhzaXplJyBoYXMgbm90
IGJlZW4gY2hlY2tlZCBzaW5jZSBjb21taXQgNzI5Y2FjNjkzZWVjZg0KPj4gKCJ1c2I6IGR3YzI6
IENoYW5nZSBJU09DIERETUEgZmxvdyIpIGJhY2sgaW4gMjAxOCwgc28gcmVtb3ZlIHRoZSBzZXQg
YnV0DQo+PiB1bnVzZWQgdmFyaWFibGUsIHdoaWNoIGZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtl
cm5lbCBidWlsZCB3YXJuaW5nOg0KPj4NCj4+ICAgIGRyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmM6
IEluIGZ1bmN0aW9uIOKAmGR3YzJfZ2FkZ2V0X2ZpbGxfaXNvY19kZXNj4oCZOg0KPj4gICAgZHJp
dmVycy91c2IvZHdjMi9nYWRnZXQuYzo4ODU6Njogd2FybmluZzogdmFyaWFibGUg4oCYbWF4c2l6
ZeKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQ0KPj4gICAg
ODg1IHwgdTMyIG1heHNpemUgPSAwOw0KPj4gICAgfCBefn5+fn5+DQo+Pg0KPj4gQ2M6IE1pbmFz
IEhhcnV0eXVueWFuIDxobWluYXNAc3lub3BzeXMuY29tPg0KPj4gQ2M6IEJlbiBEb29rcyA8YmVu
QHNpbXRlYy5jby51az4NCj4+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+DQo+PiBMaW5rOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvci8yMDIwMDcwMjE0NDYyNS4yNTMzNTMwLTExLWxlZS5qb25lc0BsaW5h
cm8ub3JnX187ISFBNEYyUjlHX3BnIUlocFNmN2xkSGQxVHhnZkVxR2VETzVHb0RnRjI2eDc5bGoy
SFlrUnZuVllhRXEyVHh3bGx2ZXdTeDlrZkt0YyQNCj4+IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3Jv
YWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+PiAtLS0NCj4+ICAgIGRy
aXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgfCAzICstLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9kd2MyL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KPj4gaW5kZXgg
ZWE3YzljNzNiNGZmLi5kOThjMWRmOTFkYjggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9k
d2MyL2dhZGdldC5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+PiBAQCAt
ODgwLDExICs4ODAsMTAgQEAgc3RhdGljIGludCBkd2MyX2dhZGdldF9maWxsX2lzb2NfZGVzYyhz
dHJ1Y3QgZHdjMl9oc290Z19lcCAqaHNfZXAsDQo+PiAgICAJc3RydWN0IGR3YzJfZG1hX2Rlc2Mg
KmRlc2M7DQo+PiAgICAJc3RydWN0IGR3YzJfaHNvdGcgKmhzb3RnID0gaHNfZXAtPnBhcmVudDsN
Cj4+ICAgIAl1MzIgaW5kZXg7DQo+PiAtCXUzMiBtYXhzaXplID0gMDsNCj4+ICAgIAl1MzIgbWFz
ayA9IDA7DQo+PiAgICAJdTggcGlkID0gMDsNCj4+ICAgIA0KPj4gLQltYXhzaXplID0gZHdjMl9n
YWRnZXRfZ2V0X2Rlc2NfcGFyYW1zKGhzX2VwLCAmbWFzayk7DQo+PiArCWR3YzJfZ2FkZ2V0X2dl
dF9kZXNjX3BhcmFtcyhoc19lcCwgJm1hc2spOw0KPj4gICAgDQo+PiAgICAJaW5kZXggPSBoc19l
cC0+bmV4dF9kZXNjOw0KPj4gICAgCWRlc2MgPSAmaHNfZXAtPmRlc2NfbGlzdFtpbmRleF07DQo+
Pg0K
