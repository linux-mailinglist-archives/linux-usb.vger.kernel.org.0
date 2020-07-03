Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB932135E3
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 10:11:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbgGCILz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 04:11:55 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45878 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725648AbgGCILy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 04:11:54 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1D45D40A53;
        Fri,  3 Jul 2020 08:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593763914; bh=z51h0PUrqlHDh78gittpJyOcwSaK7tVAsjzlFxIgOeE=;
        h=From:To:Subject:Date:References:In-Reply-To:From;
        b=BxjGI3LTxX8aywEgMaWOt8ONJUckB+JzlMuyBFbO/7E/mKOgQnHfFbSrwNGtorUGe
         F3kN8lWqzW+AH4NCvSS+R/885CsNrLrt5kHlGkh3gmh54eLnC6AOFX+NvPKh7L5L94
         SSh0ZIe1obq/Rvl1NL46HC/hMqmjdJnNgKBXz7Egta+T2UHKCDAbSluketeHFdVzzx
         ceN2PTLwsRTYQOL8ze3uRWGoZp9T+u59rqfPVrMbM+qOXutRRGV3Ov2DuGUm63neiP
         vH97rAZsnEbpoa5QiWczj63ZlTZDOt4safMLlhdfx4ZlIxqmOrwmgAv3R+1rVSyODB
         y5IwuSNfOsc5g==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 62ACDA0255;
        Fri,  3 Jul 2020 08:11:53 +0000 (UTC)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9546B800DF;
        Fri,  3 Jul 2020 08:11:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="AXX7NSHZ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MitIfcyRALGmKE5N1Nf1pwHqMY2E2cBqYDFu/YdpPo3nXHQckxf5KhLt+8V3NQJeKvd5LtQCqMAflaudKrBEbTdf2iMZBPTbq8Rq+ahid1Xzsr6avV5h09SgXTnpmmTplUm49cDF9Dw7S95HSTTbzqQVEBvEtYMkWmgOCfxAL2eCOlp2Q+DyWJQ7dBJ/WfesdrtQzal4arwoYh+fW09k03T8D1Qo7xrDT9ZU3pYzWpSm0BgfWE4vHxu/xnSrEsDrASPyX9bCoBWM4fde3F3QcEUyQEPIRzmxKyQFRtWkYrvbAnxAqjxjW+nE3S70/MaMFwcU2jRzRNZ19XKqRC2M0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z51h0PUrqlHDh78gittpJyOcwSaK7tVAsjzlFxIgOeE=;
 b=WUjZ3xvD8fNciQEFCkbbm8PuU16dnVeapFh3HQx9/0ZQMu5Nqoioh2kJkvUId06tejLw0Jz2bL7jK6ZsBOrGAMjwq5LfPoMaksE9pxS+dyhktEJCBC37v8/HVDzDgpSPlw66f4rrV0fl8tHEbECLsIXy2ZulWaBEJQAEWxa3NM/31xXYMxSS7dIIwUwxoKxYUWt71sfO+1HmWBcW4DpRh3UFAQpz/oO4XBNO7aGX3ZUloYdT9GkGGRxfuR1WSh54N2/msgRzBsr74MQD0YIlTWe+1dqS7x305oJTW6lfbn9pd0Ie+h1kbUG8Doei5JEJqCTBECw+dRZQvMlhIp+V4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z51h0PUrqlHDh78gittpJyOcwSaK7tVAsjzlFxIgOeE=;
 b=AXX7NSHZTfdAvCF1TRsnbr7yvET8S2k0oJoYpuTO6jaLhDUMqqIDZaktWJCttTMWAU/L3rrwx/TpDa8OlBWkRurhi1STDr9+jIeyzLptg7YIEqljj8zR5faT7tTCpBpWG3hA8osHdlbhNQx7vH8qgtAvPdnLLf9Hry89FlvY++4=
Received: from CY4PR12MB1432.namprd12.prod.outlook.com (2603:10b6:903:44::11)
 by CY4PR12MB1767.namprd12.prod.outlook.com (2603:10b6:903:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Fri, 3 Jul
 2020 08:11:51 +0000
Received: from CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd]) by CY4PR12MB1432.namprd12.prod.outlook.com
 ([fe80::3cb9:e2f2:a4ff:14bd%10]) with mapi id 15.20.3153.023; Fri, 3 Jul 2020
 08:11:50 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "ben@simtec.co.uk" <ben@simtec.co.uk>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: patch "usb: dwc2: gadget: Do not read GINTMSK2" added to
 usb-testing
Thread-Topic: patch "usb: dwc2: gadget: Do not read GINTMSK2" added to
 usb-testing
Thread-Index: AQHWUQxyYI6BZILKfUSqw3pWGfdTYqj1eRiAgAAIAwA=
Date:   Fri, 3 Jul 2020 08:11:50 +0000
Message-ID: <952b3264-41f6-3ffd-fe41-e4e3afe5bba2@synopsys.com>
References: <15937616791863@kroah.com>
 <6eb59328-78c3-f925-45bb-fdfcf032814c@synopsys.com>
In-Reply-To: <6eb59328-78c3-f925-45bb-fdfcf032814c@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 706fe207-16a6-47d9-61f0-08d81f28bd64
x-ms-traffictypediagnostic: CY4PR12MB1767:
x-microsoft-antispam-prvs: <CY4PR12MB176742D891776B0BE355F64EA76A0@CY4PR12MB1767.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Koyvub+ZGGmxwAwr10AvDhc+vP5QTQ7OW7mN/wClUpvJ1v1kjOtMrvkrfiSE1Q1SBUfIsYuD4GugtI+BIseWiAFEc+tyFQ46u1ANePUsLhuBPb2nMwx1ep0A0h+7EDnKn1oymZ3nZ9xeSy10799bzz+Nw3SjzoBViP8spvXttg1wE/lQQKlLUsxQynBngiwBf2s+yfVwlpQB1OA5Otv0Pw+/QDcBQFc6s8WYMPnlAMjeoAU+8ZnSyIpj9YM0ge86ABFynKRsK0SvB1WkD5LKd0t1q0wb4GhQf1Fq7xD66q6e8NUtXVEnF7cC1TIsNGUMD30YaQ1dsF3Pu8YxklwqnIgVR6j4uq6pJKaza9p8rMIUIWDdTlxi6h8t8eFLg9PBFiidagdrHPe1j0OoKKSo87MXSZ7TwzbryN8rjIgiqj/TsMHWR9WFBbhJf6+fmwOT2ghPquCeMISM6sqVwosdw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR12MB1432.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(366004)(136003)(376002)(396003)(36756003)(478600001)(8936002)(110136005)(5660300002)(966005)(186003)(83380400001)(86362001)(316002)(2616005)(76116006)(91956017)(66446008)(64756008)(66476007)(66946007)(31696002)(66556008)(2906002)(8676002)(71200400001)(6506007)(53546011)(31686004)(26005)(6512007)(6486002)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: vY0SzzcvoP5Xf4XEeriRJ6W5CEmPq3CvXHf2vuxrBw7NfimmF6OAUzoaIpNCypS3hZm2w28Y4nO3tYwr2diZ4tO/OFZDEh2M0Mep6RgMTVT+CZGITOmGv73A6mFCJBtm7IUQA/pKzZ1JCXWobUCPXBCnQZcS8DvB4jDQh9ovQtr7qfFWgv8FBJQvZwExdK+Iz3YMVoKC9EBWNJQTRufF/prhiKosJJLxX4WFHBWzYdUVS/GbMmbD3jVqilq4iuudkpVLBeScO4yN3eZA0vY0rFhvGMxEhsIGeHxQDNP3WLAy5suo3d4/uRGWf9hC3dz4Hl5cUiKGTmF9kvH/cGRHWukYkoPD5MIfhAE85P8UUQqVc8l46s2FttDDYE7EmN1qFpGfab1OwOTisZghLeyMzksWtreKNxAX+T0B0YE4GgzhOwGbMr3opsXQ10ASsJ3TU8f8xwuyhux0wHMApoGb58gtJkcNPh7EOiSHlBu/XO0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F10456C58348F94593910554EE1E5995@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1432.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706fe207-16a6-47d9-61f0-08d81f28bd64
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 08:11:50.7901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DYpIygSa37eVYMkp5GorUkJEmpzIcfxVmGb3GO0YqNTn8XJzedwgA3RthpfDzCAdbRnZlpXZJD/hLlBYfUDEBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1767
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

QWRkZWQgbGludXgtdXNiQHZnZXIua2VybmVsLm9yZyB0byByZWNpcGllbnQgbGlzdC4NCg0KT24g
Ny8zLzIwMjAgMTE6NDMgQU0sIE1pbmFzIEhhcnV0eXVueWFuIHdyb3RlOg0KPiBIaSwNCj4gDQo+
IE9uIDcvMy8yMDIwIDExOjM0IEFNLCBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyB3cm90ZToN
Cj4+DQo+PiBUaGlzIGlzIGEgbm90ZSB0byBsZXQgeW91IGtub3cgdGhhdCBJJ3ZlIGp1c3QgYWRk
ZWQgdGhlIHBhdGNoIHRpdGxlZA0KPj4NCj4+ICAgICAgIHVzYjogZHdjMjogZ2FkZ2V0OiBEbyBu
b3QgcmVhZCBHSU5UTVNLMg0KPj4NCj4+IHRvIG15IHVzYiBnaXQgdHJlZSB3aGljaCBjYW4gYmUg
Zm91bmQgYXQNCj4+ICAgICAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9ncmVna2gvdXNiLmdpdA0KPj4gaW4gdGhlIHVzYi10ZXN0aW5nIGJyYW5jaC4NCj4+
DQo+PiBUaGUgcGF0Y2ggd2lsbCBzaG93IHVwIGluIHRoZSBuZXh0IHJlbGVhc2Ugb2YgdGhlIGxp
bnV4LW5leHQgdHJlZQ0KPj4gKHVzdWFsbHkgc29tZXRpbWUgd2l0aGluIHRoZSBuZXh0IDI0IGhv
dXJzIGR1cmluZyB0aGUgd2Vlay4pDQo+Pg0KPj4gVGhlIHBhdGNoIHdpbGwgYmUgbWVyZ2VkIHRv
IHRoZSB1c2ItbmV4dCBicmFuY2ggc29tZXRpbWUgc29vbiwNCj4+IGFmdGVyIGl0IHBhc3NlcyB0
ZXN0aW5nLCBhbmQgdGhlIG1lcmdlIHdpbmRvdyBpcyBvcGVuLg0KPj4NCj4+IElmIHlvdSBoYXZl
IGFueSBxdWVzdGlvbnMgYWJvdXQgdGhpcyBwcm9jZXNzLCBwbGVhc2UgbGV0IG1lIGtub3cuDQo+
Pg0KPiANCg0KVGhpcyBwYXRjaCBpcyBub3QgY29ycmVjdC4gUGxlYXNlIHJlYWQgYmVsb3cuDQoN
Cj4+DQo+PiAgIEZyb20gNGYxYWU5ZDYwYWRiM2Q0ZjliOGVhOTRmMDJiZmM4ODNmOTU0YmVkNiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4+IEZyb206IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+DQo+PiBEYXRlOiBUaHUsIDIgSnVsIDIwMjAgMTU6NDY6MDQgKzAxMDANCj4+IFN1
YmplY3Q6IHVzYjogZHdjMjogZ2FkZ2V0OiBEbyBub3QgcmVhZCBHSU5UTVNLMg0KPj4gTUlNRS1W
ZXJzaW9uOiAxLjANCj4+IENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOA0K
Pj4gQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdA0KPj4NCj4+IFRoZSB2YWx1ZSBvZiBH
SU5UTVNLMiBoYXNuJ3QgYmVlbiBjaGVja2VkIHNpbmNlIHRoZSBpbmNlcHRpb24gb2YNCj4+IGR3
YzJfZ2FkZ2V0X3drdXBfYWxlcnRfaGFuZGxlcigpIGluIDIwMTguDQo+Pg0KPj4gRml4ZXMgdGhl
IGZvbGxvd2luZyBXPTEgd2FybmluZzoNCj4+DQo+PiAgICBkcml2ZXJzL3VzYi9kd2MyL2dhZGdl
dC5jOiBJbiBmdW5jdGlvbiDigJhkd2MyX2dhZGdldF93a3VwX2FsZXJ0X2hhbmRsZXLigJk6DQo+
PiAgICBkcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jOjI1OTo2OiB3YXJuaW5nOiB2YXJpYWJsZSDi
gJhnaW50bXNrMuKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxl
XQ0KPj4gICAgMjU5IHwgdTMyIGdpbnRtc2syOw0KPj4gICAgfCBefn5+fn5+fg0KPj4NCj4+IENj
OiBNaW5hcyBIYXJ1dHl1bnlhbiA8aG1pbmFzQHN5bm9wc3lzLmNvbT4NCj4+IENjOiBCZW4gRG9v
a3MgPGJlbkBzaW10ZWMuY28udWs+DQo+PiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPg0KPj4gTGluazogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDA3MDIxNDQ2MjUuMjUzMzUzMC0xMC1sZWUuam9u
ZXNAbGluYXJvLm9yZ19fOyEhQTRGMlI5R19wZyFNbFh2bjB0U2tUdnNHWlpvV0Q1enFfMU93cS1V
LURJSE5hSG95VTFPZkc4VHdHR1FCRWZvOWcwbjlyMlR4dlEkDQo+PiBTaWduZWQtb2ZmLWJ5OiBH
cmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPj4gLS0tDQo+
PiAgICBkcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jIHwgMiAtLQ0KPj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIv
Z2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+PiBpbmRleCAxZGVmOTAwMGY5
MzYuLmVhN2M5YzczYjRmZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0
LmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCj4+IEBAIC0yNTYsMTAgKzI1
Niw4IEBAIGludCBkd2MyX2hzb3RnX3R4X2ZpZm9fdG90YWxfZGVwdGgoc3RydWN0IGR3YzJfaHNv
dGcgKmhzb3RnKQ0KPj4gICAgc3RhdGljIHZvaWQgZHdjMl9nYWRnZXRfd2t1cF9hbGVydF9oYW5k
bGVyKHN0cnVjdCBkd2MyX2hzb3RnICpoc290ZykNCj4+ICAgIHsNCj4+ICAgIAl1MzIgZ2ludHN0
czI7DQo+PiAtCXUzMiBnaW50bXNrMjsNCj4+ICAgIA0KPj4gICAgCWdpbnRzdHMyID0gZHdjMl9y
ZWFkbChoc290ZywgR0lOVFNUUzIpOw0KPj4gLQlnaW50bXNrMiA9IGR3YzJfcmVhZGwoaHNvdGcs
IEdJTlRNU0syKTsNCj4+ICAgIA0KPj4gICAgCWlmIChnaW50c3RzMiAmIEdJTlRTVFMyX1dLVVBf
QUxFUlRfSU5UKSB7DQo+PiAgICAJCWRldl9kYmcoaHNvdGctPmRldiwgIiVzOiBXa3VwX0FsZXJ0
X0ludFxuIiwgX19mdW5jX18pOw0KDQoNCkxlZSwgJ2dpbnRzdHMyJyBjYW4ndCBiZSByZW1vdmVk
LiBKdXN0LCBwbGVhc2UgYWRkIGZvbGxvdyBsaW5lIGFmdGVyDQpyZWFkaW5nIGdpbnRtc2syOg0K
DQogIAlnaW50c3RzMiAmPSBnaW50bXNrMjsNCg0KDQpQbGVhc2UgYWRkIGFsc28gIkZpeGVzOiIg
dGFnIGFuZCBzdWJtaXQgdjIuDQoNClRoYW5rcywNCk1pbmFzDQoNCj4+DQo=
