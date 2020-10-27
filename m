Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2C5E29A994
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 11:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898091AbgJ0K0g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 06:26:36 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:57006 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2898088AbgJ0K0g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 06:26:36 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 20DFEC0345;
        Tue, 27 Oct 2020 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603794395; bh=GtNYQ23xcy4BSfgzROpXye14zZ/AHLurqkJ4IE+MkpY=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=dKZQxMpmLI/IjH1U+MldT3nonNT+cSlHD2bsRDGG5hhM2YunSNcbhW4fAfk7KmuKM
         JOpRVFHAx2+P3eSnTRskyiGT8ad/YrO2/sqpHJQa8jkdXb2zamhkRPN7486xzAKv/J
         3Xe3Nm4sMqLSYAR/ExfTgqSfv3cVQmuy5mjOp1L8PTpu3QYQm7I5sw1t3GwY+BvLHM
         kc27SJlAsJ+CElYTiVFqwbkDbd10Ev7ynnaJHQ0ktYN/KyvpX+NJ76rk7KgLuTEPYi
         L1y7Hbw3ZyTa10r+2bkrZVwfTl2wYIRJZnAyXLSPJqhAXZYhqXCKBciI3hgYbf4Kco
         yj/VJZ04MetEg==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 700E3A0067;
        Tue, 27 Oct 2020 10:26:34 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 970518027A;
        Tue, 27 Oct 2020 10:26:33 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="INZ4ND7O";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYfa/iom7g26UFi8UqViuc41j6/dQFcxoBKAf7TUYufRXPAY1HvFEfFkimvc8ZRzeYAOWAb/V0y2Z0uGhM+dbSJZoI9jykzEGGbJ9cbngzJwfqIppri7jkAyxkpwDISZ0ep78uEsXfzuJ81EUl11/lWNc63EF1yrteY2YnRxcAvdrUJylxW0Rg3lyxSa513YM/wwNrDUwEQf3VEj7mJFYrA3YB3Wr5XHnDvlyS4VFSjOh6O8n9lvwErUvd0GePApMdclPwWPD31oQOzfFo82RZfYJVI8PA0Pz8cAomG35wd4gaa9MH5xYcfmemoJO7VpVZN6PRSg/h2kR3s2ZwrPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtNYQ23xcy4BSfgzROpXye14zZ/AHLurqkJ4IE+MkpY=;
 b=GXcqsuNrBbfQRFVo9Xo/yG2HU6Prr4J6AQMM4BqWIeWjmkkRYLinC5yONHdNjd0TB1omwvUUCaNBuHYfAXec8z6RQpEX4NVB6w8TJm0H/MoqYoPlc/4KpUfUrJYvUI5Rm++URJVyhAkfMLLx/N27UWPQ0VjP9K+wIVhIVkR3KnGo43ebqiWm/dHS76LurELoCmTYpFlL+zFhHdR42GXhLw8UdXWM+6drDZnd4C8ae32jyPyzCrs0l4xgxSQrnDhkTyZfr3Ep9c9lzLEL8nMT898mtLAdyDNZqcQ8apjMf5op+MZ4TM/W0WgI0gykzdUVRBuLY9596V15KgwbbhNBlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtNYQ23xcy4BSfgzROpXye14zZ/AHLurqkJ4IE+MkpY=;
 b=INZ4ND7OeIhVyQOIeST1TgiSGQkiRF0+lZUAM5rH4x5pJAgSt0FUHn45aEWcGxhKgMEpaKpuzot3ofaWypXTztfhdsclYsAE1y/ZyFQc0bUKseXqWKROHtzht3sAXi6jHzh8RNYu9qzWMkAW5ggxGUeGCGR06gtzn14OaqeiWYQ=
Received: from MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 by MWHPR12MB1309.namprd12.prod.outlook.com (2603:10b6:300:10::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28; Tue, 27 Oct
 2020 10:26:31 +0000
Received: from MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::f527:17c8:b473:bcdd]) by MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::f527:17c8:b473:bcdd%9]) with mapi id 15.20.3499.018; Tue, 27 Oct 2020
 10:26:31 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 00/15] usb: dwc2: Fix and improve power saving modes.
Thread-Topic: [PATCH v2 00/15] usb: dwc2: Fix and improve power saving modes.
Thread-Index: AQHWn9WBPGHquDHEwE+/UzSrxjM4gamlFVuAgAYyawCAAA/TAA==
Date:   Tue, 27 Oct 2020 10:26:31 +0000
Message-ID: <0247ace2-841d-1044-37cd-5ec40997bbab@synopsys.com>
References: <20201011135035.7C61DA005E@mailhost.synopsys.com>
 <2edb35af-bf0b-bfab-69c7-9b7f0cac6a69@synopsys.com>
 <875z6wc8z3.fsf@kernel.org>
In-Reply-To: <875z6wc8z3.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [176.32.192.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca24bfa8-fdc6-408b-8b30-08d87a62c5c8
x-ms-traffictypediagnostic: MWHPR12MB1309:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1309BA73A78609A700754768A7160@MWHPR12MB1309.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: akE4usdS8XnbYomQ616YmRCSdfS1TVkVTKFX8VckVnW8hU0K5WQ4zAI59kozS4Rdi89l5a/z2bfjp74zr/ZiONjELxHwr1X/oQRgB0Dhu+/ST5fnO6Rz4MvpB6oLWJ4FPmYvW92bcPUQ2bxCo+SwXp6PVDZWL9C38zWF72ijYAjL8zSx12n3IJrKbNMPNgzfJ2rHu5I8sV8rAigCk/8JAhh/ojm7Kk0knMIMyxexnDFLgFKnAPmCYpIeMUJHtsOZhQG0XjBledspCHvUtUWkPBtXxxvkO8gn/z3XJC0cpJ5kDgV4tYwwur034FmUU2rlSelcnU/V1wUn0Rdgbga10Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4428.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(31696002)(76116006)(66476007)(5660300002)(2616005)(54906003)(6512007)(110136005)(83380400001)(31686004)(86362001)(26005)(53546011)(478600001)(91956017)(66446008)(66556008)(2906002)(64756008)(316002)(36756003)(66946007)(71200400001)(55236004)(6506007)(8936002)(6486002)(8676002)(4326008)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: sF2YDOAI+KCxr1KLN1kV7FIUQ4FEX2qz0W0iFjFyBmZ+K6mxJr38SKqSx24nyrmzpF6fyh8G+Kc9IxWTXwM50BOUXGy3KZ6jnbf+7itQWMHGhlhcTooA3QAlTWcfp3iRAGdX8rBL2/9hnsZ6FkNGs7I4D3d84AiwTpFzMvPHxrbeIclNaTYt1ZuziS4Q1ziJ2iCtzdDk9LnWN/GPCGPpEVsGk9d05yqvGxjbXvKW94z4SNe+OcHJ+Sg4qKx+Rycf2tjj+d+XSN3j+F7Uuz2yZh1gPH7E1z/FdwOXk0t1XeoOCcjPal7Aptt4XaaaCpDMeeiJZ8WuSI61A+PA4P5pgcaS5BxDFjQKL5BwNGjoNxrHSsiUcqNg4xhJ8XardgX1RD3eRkC8KL+5nZHmvV7zoObTvgP/kY+1A4/HkwjJUBLHgVeJfa0HMvuGr2fOomYYjqbg2VLhDrGq8FbGxy0lqYqlYimsPqpJH52j+OuZukTjFY4zX810LIhSlnKhXzJIIEJSLyY3gEOiIg0yarZZCTHDh+UKbB1HTlMpRsfKD+HrOZjUv6WBV0bElzU0hxyXjdoMSZlO3XK/WFuU6RgOcs3rhQZytzNw97m50Z/wKYoUm2dxLXH/KPrTnsIZtUhYC/E18/Ts+olJYI9MsxW7wQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC4306FC54EF9E429C6DC3281DD31B53@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4428.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca24bfa8-fdc6-408b-8b30-08d87a62c5c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 10:26:31.4701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hqqS9Igh8J+bbhUNgH6jrzg8Iy3uVLtTzsK/G0lKezBM4f8lwKkECzCA5oLzcLU2tGnTIrCyIKL9PAwPt1y6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1309
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpPbiAxMC8yNy8yMDIwIDEzOjI5LCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+
IA0KPiBIaSwNCj4gDQo+IE1pbmFzIEhhcnV0eXVueWFuIDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5v
cHN5cy5jb20+IHdyaXRlczoNCj4+IE9uIDEwLzExLzIwMjAgNTo1MCBQTSwgQXJ0dXIgUGV0cm9z
eWFuIHdyb3RlOg0KPj4+IFRoaXMgcGF0Y2ggc2V0IGZpeGVzL2ltcHJvdmVzIHBhcnRpYWwgcG93
ZXIgZG93biwgaGliZXJuYXRpb24gcG93ZXINCj4+PiBzYXZpbmcgbW9kZXMgYW5kIGFkZHMgc3Vw
cG9ydCBmb3IgaG9zdC9kZXZpY2UgY2xvY2sgZ2F0aW5nLg0KPj4+DQo+Pj4gQ2hhbmdlcyBmcm9t
IFYxOg0KPj4+ICAgIC0gQWRkZWQgbmV3IHBhdGNoZXMuDQo+Pj4gICAgIDEuIHVzYjogZHdjMjog
QWRkIHN1cHBvcnQgZm9yIGR3YzIgaG9zdC9kZXZpY2UgY2xvY2sgZ2F0aW5nLg0KPj4+ICAgICAy
LiB1c2I6IGR3YzI6IEFkZCBleGl0IHBvd2VyIHNhdmluZyBtb2RlIGJlZm9yZSByZW1vdmluZyBk
cml2ZXIuDQo+Pj4gICAgIDMuIHVzYjogZHdjMjogRml4IEhQUlQwLlBydFN1c3AgYml0IHNldHRp
bmcgZm9yIEhpS2V5IDk2MCBib2FyZC4NCj4+Pg0KPj4+ICAgIC0gVXBkYXRlZCBwYXRjaGVzDQo+
Pj4gICAgIDEuIHVzYjogZHdjMjogRml4L3VwZGF0ZSBlbnRlci9leGl0IHBhcnRpYWwgcG93ZXIg
ZG93bi4NCj4+PiAJLSBVcGRhdGVkIHRoZSBwYXRjaCBuYW1lIGZyb20gInVzYjogZHdjMjogRml4
DQo+Pj4gCWR3YzJfcmVzdG9yZV9kZXZpY2VfcmVnaXN0ZXJzKCkgZnVuY3Rpb24uIiB0byAidXNi
OiBkd2MyOg0KPj4+IAlGaXgvdXBkYXRlIGVudGVyL2V4aXQgcGFydGlhbCBwb3dlciBkb3duLiIN
Cj4+PiAJLSBVcGRhdGVkIGVudGVyaW5nIGFuZCBleGl0aW5nIHBhcnRpYWwgcG93ZXIgZG93biBm
dW5jdGlvbg0KPj4+IAlmbG93LiBCZWZvcmUgdGhlcmUgd2FzIGEgbG90IG9mIGNvbmZ1c2lvbnMg
d2l0aCBjb3JlDQo+Pj4gCWVudGVyaW5nIHRvIHBhcnRpYWwgcG93ZXIgZG93biBpbiBkZXZpY2Ug
b3IgaG9zdCBtb2RlLg0KPj4+IAktIEFkZGVkICJyZW1fd2FrZXVwIiBmb3IgaG9zdCBleGl0aW5n
IGZyb20gUGFydGlhbCBQb3dlcg0KPj4+IAlEb3duIG1vZGUgZnJvbSBob3N0IHJlbW90ZSB3YWtl
dXAgZmxvdy4gQWNjb3JkaW5nIHRvDQo+Pj4gCXByb2dyYW1taW5nIGd1aWRlIGluIGhvc3QgbW9k
ZSwgcG9ydCBwb3dlciBtdXN0IGJlDQo+Pj4gCXR1cm5lZCBvbiB3aGVuIHdha2V1cCBpcyBkZXRl
Y3RlZC4NCj4+PiAJLSBBZGRlZCAiaW5fcHBkIiBmbGFnIHRvIGluZGljYXRlIHRoZSBjb3JlIHN0
YXRlIGFmdGVyDQo+Pj4gCWVudGVyaW5nIGludG8gUGFydGlhbCBQb3dlciBEb3duIG1vZGUuDQo+
Pj4gICAgIDIuIHVzYjogZHdjMjogRml4IHdha2V1cCBkZXRlY3RlZCBhbmQgc2Vzc2lvbiByZXF1
ZXN0IGludGVycnVwdCBoYW5kbGVycy4NCj4+PiAJLSBBY2NvcmRpbmcgdG8gcHJvZ3JhbW1pbmcg
Z3VpZGUgYWRkZWQgcGFydGlhbCBwb3dlcg0KPj4+IAlkb3duIGV4aXQgZmxvdyBpbiB3YWtldXAg
ZGV0ZWN0ZWQgaW50ZXJydXB0IGhhbmRsZXIuDQo+Pj4gCS0gQWRkZWQgY2xvY2sgZ2F0aW5nIGV4
aXQgZmxvdyBmcm9tIHdha2V1cCBkZXRlY3RlZA0KPj4+IAlhbmQgc2Vzc2lvbiByZXF1ZXN0IGlu
dGVycnVwdCBoYW5kbGVycy4NCj4+PiAgICAgMy4gdXNiOiBkd2MyOiBGaXggc3VzcGVuZCBzdGF0
ZSBpbiBob3N0IG1vZGUgZm9yIHBhcnRpYWwgcG93ZXIgZG93bi4NCj4+PiAJLSBBZGRlZCAiZHdj
Ml9wb3J0X3N1c3BlbmQiIGFuZCAiZHdjMl9wb3J0X3Jlc3VtZSIgZnVuY3Rpb25zIHRvDQo+Pj4g
CSJjb3JlLmgiIGhlYWRlciBmaWxlDQo+Pj4gCS0gVXBkYXRlZCAiVVNCX1BPUlRfRkVBVF9SRVNF
VCIgZmxvdyB3aGVuIGNvcmUgcmVjZWl2ZXMgcG9ydA0KPj4+IAlyZXNldCBpbiBQYXJ0aWFsIFBv
d2VyIERvd24gb3IgSGliZXJuYXRpb24gc3RhdGUuDQo+Pj4gCS0gQWRkZWQgcmV0dXJuICItRU5P
REVWIiBpZiBjb3JlIGlzIGluIHN1c3BlbmQgc3RhdGUNCj4+PiAJaW4gIl9kd2MyX2hjZF91cmJf
ZW5xdWV1ZSIgZnVuY3Rpb24gdG8gYXZvaWQgcG9ydA0KPj4+IAlyZXNldCBpc3N1ZSwgd2hlbiBh
biBleHRlcm5hbCBodWIgaXMgY29ubmVjdGVkLg0KPj4+ICAgICA0LiB1c2I6IGR3YzI6IEFkZCBw
YXJ0LiBwb3dlciBkb3duIGV4aXQgZnJvbSBkd2MyX2Nvbm5faWRfc3RhdHVzX2NoYW5nZSgpLg0K
Pj4+IAktIEluc3RlYWQgb2YgY2xlYXJpbmcgcmVnaXN0ZXJzIGlubGluZSBmb3IgZXhpdGluZyBw
YXJ0aWFsIHBvd2VyIGRvd24NCj4+PiAJbW9kZSwgbm93IGNhbGxpbmcgdGhlICJkd2MyX2V4aXRf
cGFydGlhbF9wb3dlcl9kb3duIiBmdW5jdGlvbiB3aXRob3V0DQo+Pj4gCXJlc3RvcmluZyB0aGUg
YmFja3VwIHJlZ2lzdGVycy4NCj4+PiAgICAgNS4gdXNiOiBkd2MyOiBVcGRhdGUgZHdjMl9oYW5k
bGVfdXNiX3N1c3BlbmRfaW50ciBmdW5jdGlvbi4NCj4+PiAJLSBBZGRlZCBjaGFuZ2VzIHN1Z2dl
c3RlZCBieSBEb3VnbGFzIEFuZGVyc29uIGZyb20gY29tbWl0DQo+Pj4gCSJ1c2I6IGR3YzI6IEdl
dCByaWQgb2YgdXNlbGVzcyBlcnJvciBjaGVja3MgZm9yDQo+Pj4gCWhpYmVybmF0aW9uL3BhcnRp
YWwgcG93ZXIgZG93biINCj4+PiAgICAgNi4gdXNiOiBkd2MyOiBGaXggaGliZXJuYXRpb24gYmV0
d2VlbiBob3N0IGFuZCBkZXZpY2UgbW9kZXMuDQo+Pj4gCS0gQWRkZWQgc2V0dGluZyBvZiAiaHNv
dGctPmJ1c19zdXNwZW5kZWQiIGZsYWcgdG8gMCBiZWNhdXNlIGJlZm9yZSBpZg0KPj4+IAljb3Jl
IGV4aXRlZCBmcm9tICJHUFdSRE5fU1RTX0NIR0lOVCIgaW50ZXJydXB0IGluIGhvc3QgbW9kZSB0
aGUgZmxhZw0KPj4+IAlyZW1haW5lZCB0cnVlIG5vdCBsZXR0aW5nIGVudGVyIHRvIGhpYmVybmF0
aW9uIG5leHQgdGltZS4NCj4+PiAgICAgNy4gdXNiOiBkd2MyOiBDbGVhciBmaWZvX21hcCB3aGVu
IHJlc2V0dGluZyBjb3JlLg0KPj4+IAktIEFkZGVkICJzdGF0aWMgaW5saW5lIHZvaWQgZHdjMl9j
bGVhcl9maWZvX21hcCgpIiBoZWxwZXINCj4+PiAJZnVuY3Rpb24gdG8gY2xlYXIgZmlmb19tYXAg
d2l0aCBwZXJpcGhlcmFsIG9yIGR1YWwgcm9sZSBtb2RlLg0KPj4+IAktIEFkZGVkIGEgZHVtbXkg
dmVyc2lvbiBvZiAiZHdjMl9jbGVhcl9maWZvX21hcCgpIiBoZWxwZXINCj4+PiAJZm9yIGhvc3Qt
b25seSBtb2RlLg0KPj4+ICAgICA4LiB1c2I6IGR3YzI6IEFkZCBwb3dlciBzYXZpbmcgbW9kZSBz
dXBwb3J0IGZyb20gc3lzdGVtIGlzc3VlZCBzdXNwZW5kL3Jlc3VtZS4NCj4+PiAJLSBVcGRhdGVk
IHRoZSBwYXRjaCBuYW1lIGZyb20gInVzYjogZHdjMjogQWRkIGVudGVyL2V4aXQgaGliZXJuYXRp
b24NCj4+PiAJZnJvbSBzeXN0ZW0gc2NoZWR1bGVkIHN1c3BlbmQiIHRvICJ1c2I6IGR3YzI6IEFk
ZCBwb3dlciBzYXZpbmcgbW9kZQ0KPj4+IAlzdXBwb3J0IGZyb20gc3lzdGVtIGlzc3VlZCBzdXNw
ZW5kL3Jlc3VtZS4iDQo+Pj4gCS0gRml4ZWQgaXNzdWUgcmVsYXRlZCB0byAic3BpbmxvY2sgYWxy
ZWFkeSB1bmxvY2tlZCIgcmVwb3J0ZWQgYnkgRG91Zw0KPj4+IAlBbmRlcnNvbi4NCj4+Pg0KPj4+
ICAgIC0gQWJhbmRvbmVkIHBhdGNoZXMuDQo+Pj4gICAgIDEuIHVzYjogZHdjMjogQWRkIHBvcnQg
Y29ubi4gc3RzLiBjaGVja2luZyBpbiBfZHdjMl9oY2RfcmVzdW1lKCkgZnVuY3Rpb24uDQo+Pj4g
CS0gVGhlIGNoYW5nZXMgb2YgdGhpcyBwYXRjaCBhcmUgbW92ZWQgdG8gdGhlICJ1c2I6IGR3YzI6
IEFkZCBwb3dlcg0KPj4+IAlzYXZpbmcgbW9kZSBzdXBwb3J0IGZyb20gc3lzdGVtIGlzc3VlZCBz
dXNwZW5kL3Jlc3VtZSIgcGF0Y2guDQo+Pj4gICAgIDIuIHVzYjogZHdjMjogQWRkIGZsYWcgYW5k
IGRlYnVnIG1lc3NhZ2VzIGZvciBQYXJ0aWFsIFBvd2VyIERvd24gbW9kZS4NCj4+PiAJLSBUaGUg
Y2hhbmdlcyBvZiB0aGlzIHBhdGNoIGFyZSBtb3ZlZCB0byB0aGUgInVzYjogZHdjMjogRml4L3Vw
ZGF0ZQ0KPj4+IAllbnRlci9leGl0IHBhcnRpYWwgcG93ZXIgZG93bi4iIHBhdGNoLg0KPj4+DQo+
Pj4NCj4+PiBBcnR1ciBQZXRyb3N5YW4gKDE1KToNCj4+PiAgICAgdXNiOiBkd2MyOiBGaXgvdXBk
YXRlIGVudGVyL2V4aXQgcGFydGlhbCBwb3dlciBkb3duLg0KPj4+ICAgICB1c2I6IGR3YzI6IEFk
ZCBzdXBwb3J0IGZvciBkd2MyIGhvc3QvZGV2aWNlIGNsb2NrIGdhdGluZy4NCj4+PiAgICAgdXNi
OiBkd2MyOiBGaXggd2FrZXVwIGRldGVjdGVkIGFuZCBzZXNzaW9uIHJlcXVlc3QgaW50ZXJydXB0
IGhhbmRsZXJzLg0KPj4+ICAgICB1c2I6IGR3YzI6IEZpeCBzdXNwZW5kIHN0YXRlIGluIGhvc3Qg
bW9kZSBmb3IgcGFydGlhbCBwb3dlciBkb3duLg0KPj4+ICAgICB1c2I6IGR3YzI6IEFkZCBwYXJ0
LiBwb3dlciBkb3duIGV4aXQgZnJvbQ0KPj4+ICAgICAgIGR3YzJfY29ubl9pZF9zdGF0dXNfY2hh
bmdlKCkuDQo+Pj4gICAgIHVzYjogZHdjMjogUmVzZXQgREVWQUREUiBhZnRlciBleGl0aW5nIGdh
ZGdldCBoaWJlcm5hdGlvbi4NCj4+PiAgICAgdXNiOiBkd2MyOiBBZGQgZGVmYXVsdCBwYXJhbSB0
byBjb250cm9sIHBvd2VyIG9wdGltaXphdGlvbi4NCj4+PiAgICAgdXNiOiBkd2MyOiBVcGRhdGUg
ZHdjMl9oYW5kbGVfdXNiX3N1c3BlbmRfaW50ciBmdW5jdGlvbi4NCj4+PiAgICAgdXNiOiBkd2My
OiBGaXggaGliZXJuYXRpb24gYmV0d2VlbiBob3N0IGFuZCBkZXZpY2UgbW9kZXMuDQo+Pj4gICAg
IHVzYjogZHdjMjogRml4IEhQUlQwLlBydFN1c3AgYml0IHNldHRpbmcgZm9yIEhpS2V5IDk2MCBi
b2FyZC4NCj4+PiAgICAgdXNiOiBkd2MyOiBBbGxvdyBleGl0aW5nIGhpYmVybmF0aW9uIGZyb20g
Z3B3cmRuIHJzdCBkZXRlY3QNCj4+PiAgICAgdXNiOiBkd2MyOiBDbGVhciBmaWZvX21hcCB3aGVu
IHJlc2V0dGluZyBjb3JlLg0KPj4+ICAgICB1c2I6IGR3YzI6IENsZWFyIEdJTlRTVFNfUkVTVE9S
RURPTkUgYml0IGFmdGVyIHJlc3RvcmUgaXMgZ2VuZXJhdGVkLg0KPj4+ICAgICB1c2I6IGR3YzI6
IEFkZCBwb3dlciBzYXZpbmcgbW9kZSBzdXBwb3J0IGZyb20gc3lzdGVtIGlzc3VlZA0KPj4+ICAg
ICAgIHN1c3BlbmQvcmVzdW1lDQo+Pj4gICAgIHVzYjogZHdjMjogQWRkIGV4aXQgcG93ZXIgc2F2
aW5nIG1vZGUgYmVmb3JlIHJlbW92aW5nIGRyaXZlcg0KPiANCj4gd2hlcmUgYXJlIGFsbCB0aGUg
cGF0Y2hlcz8gSSBvbmx5IGdvdCB0aGUgY292ZXIgbGV0dGVyLiBXaGVuIHJlc2VuZGluZywNCj4g
cGxlYXNlIGNvbGxlY3QgTWluYXMnIGFja2VkLWJ5Lg0KPg0KDQpJIGFtIG5vdCBzdXJlIGhvdyB0
byBhbnN3ZXIgdG8gdGhlIHF1ZXN0aW9uLiBUaGUgcGF0Y2ggc2VyaWVzIGluY2x1ZGluZyANCmFs
bCB0aGUgcGF0Y2hlcyBoYXMgYmVlbiBzdWNjZXNzZnVsbHkgc2VudCB0byBMS01MLiBNeSBjb2xs
ZWFndWVzIGhhcyANCnJlY2VpdmVkIHRoZW0uIERpZG4ndCB5b3UgZ2V0IGUtbWFpbD8gYmVjYXVz
ZSBJIGNhbiBzZWUgdGhhdCB5b3VyIGUtbWFpbCANCmFkZHJlc3MgaXMgbGlzdGVkIGluICJUbyIg
bGlzdCBvZiBhbGwgdGhlIHBhdGNoZXMgaW4gdGhlIHNlcmllcy4NCg0KQWxzbyByZWxhdGVkIHRv
IGNvbGxlY3Rpb24gb2YgTWluYXMnIGFja2VkLWJ5LiBEbyBJIG5lZWQgdG8gYWRkIHRoZSANCmFj
a2VkLWJ5IHRhZyB0byBhbGwgdGhlIHBhdGNoZXMgb3Igb25seSBpbiB0aGUgMCBwYXRjaD8gQmVj
YXVzZSB0aGUgDQphY2tlZC1ieSB0YWcgaXMgbm93IGRvbmUgZm9yIG9ubHkgdGhlIDAgcGF0Y2gu
DQoNClJlZ2FyZHMsDQpBcnR1cg0K
