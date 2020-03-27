Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B99B11954CB
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 11:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgC0KF3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Mar 2020 06:05:29 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:37090 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725946AbgC0KF3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Mar 2020 06:05:29 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0FBB242606;
        Fri, 27 Mar 2020 10:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585303527; bh=LALCwv3iO4URiU5WLQchFu7Thg8ZpG8EIaEkCFzgDr0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=XJt4//oj9605YTTImcPluPkBpGBZWbC1nLs34xlGk7AJ6oMak0cfbopj2ARy+92MP
         DAeFa1KuOUeIRzwKtgPMmkG/VDEVuwwjqNNeI5a3UlsYc3dcuvDBaiWWQypnCPxGDV
         KTN5F7GsLvJb8k3AO6RAAcVNw4p6LzVGdfiGiEZXBUTLwVKkUmNvl3UlP177uJ6PaY
         4QiE3e1h+vGDVSQfvN/DIdIzkJKP6kMHk1jurB8zkxzlfnpoY2m2TfDzkRp79BJreS
         SD7RU9lIbGSXI3KQ2R/p1ip8Y4ZUk8QAYmJMjjf70DXO95aQy1DROS4cnBqa7Ocm0o
         56d/1KQnZbFDg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 86B89A0071;
        Fri, 27 Mar 2020 10:05:26 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 27 Mar 2020 03:05:23 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 27 Mar 2020 03:05:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CodohRPU6yJa+yajw/qQ8Z9K2KFaQe/iNBtr0LmkqWRx5CFsMEqTez04wpZfNHysKlDraJWl/dMb1D2mh6ko2/MMca38t1HJ5ckUoMKX2PRaVKI6snNU5MQpXJxW6egxI6FjB87I2RuKtn143dVP6U87HVuXiqMR+JRIlHunqi9ZCvVByY/qdigIxh77hykxuBiFydWyehm2k8k1rgbfuPFoqQ4S4bRkUB/VMaphcxiVI7it54lqgx6JjUlaq27uDRCwjsg9q9pOFl45SCNACLhk+Y1H9RCVs+SElm3EBMszxzZP7PTCapaVDaldOaCN/VJ6wHt9JEE8brzEsXq2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALCwv3iO4URiU5WLQchFu7Thg8ZpG8EIaEkCFzgDr0=;
 b=dMf0tBQrSOjocbLbGcmkv9+4w6WFGvLlS3Lg3onwcQD/DyR4JzqSbxQDrVoxBmav80s9kJGi/EHrCiGUd1zC/QBwp4jQ5yIXHhNXjcVmcHnPRx8E+RyI9yLabw+YfDEyYc9pcLtPZk3DqbP+ID/Cpm+4/9jNmOq227N4Y+S0KJUh5iFdkKVfFKtviFsdKgVEiqie76GRDV8dDwT6bZem0c85j5FfoS8RbMN9i9oi+3V0FheEAayV0ZtdTNxoBhYHEqerB5wQ0vzgbVGcYiLc8jzQTUGdlZCrHGs/7unPwMspCgpMPKwfMuXCJ2VJr0QsXnMUtiCAxqH+TYYRwUkyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LALCwv3iO4URiU5WLQchFu7Thg8ZpG8EIaEkCFzgDr0=;
 b=uwokVJDdwlS9d6YHpdx6Yq67ljCDrvCM4q1my0HrEfRdar3NP9EVDq4QuSaHJ7i8R8auTsmMSn4H6uBhDxvcMcmYDWXGIs25y+0/upl18T2NRHlL5RnDVRrwaQIb2u4Q2rr+L4ToBKBIhFizaCzMGqCKTOK/G7Jolr7j5QgOWHQ=
Received: from DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12)
 by DM6PR12MB2681.namprd12.prod.outlook.com (2603:10b6:5:41::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 10:05:22 +0000
Received: from DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab]) by DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab%6]) with mapi id 15.20.2835.023; Fri, 27 Mar 2020
 10:05:22 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Fredrik Noring <noring@nocrew.org>,
        "Mathias Nyman" <mathias.nyman@intel.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Raul E Rangel <rrangel@chromium.org>,
        "Laurentiu Tudor" <laurentiu.tudor@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RESENDING RFC PATCH 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Thread-Topic: [RESENDING RFC PATCH 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Thread-Index: AQHWBBoWW8IPJVzH8kGr4akFWQKe96hcNj6A
Date:   Fri, 27 Mar 2020 10:05:21 +0000
Message-ID: <d20ec217-adc2-e587-f285-83fbabc30378@synopsys.com>
References: <cover.1585297723.git.joglekar@synopsys.com>
 <5f7605b9f4cd2d6de4f0ef7d25be9a99d92c5aee.1585297723.git.joglekar@synopsys.com>
 <20200327092759.GA1693819@kroah.com>
In-Reply-To: <20200327092759.GA1693819@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joglekar@synopsys.com; 
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa344c9f-7c7e-48e1-a3e1-08d7d2365ca9
x-ms-traffictypediagnostic: DM6PR12MB2681:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2681AB4C0ACCCFEF9139911FA4CC0@DM6PR12MB2681.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(376002)(366004)(136003)(346002)(26005)(186003)(71200400001)(31696002)(5660300002)(2616005)(8936002)(86362001)(478600001)(2906002)(64756008)(31686004)(66476007)(66446008)(91956017)(66556008)(76116006)(36756003)(4326008)(66946007)(6512007)(8676002)(107886003)(81166006)(81156014)(54906003)(110136005)(6506007)(53546011)(316002)(6486002);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR12MB2681;H:DM6PR12MB4251.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CFUyYx23/5tdIiPimJr81bBdaoDY4EAr9tWl9mKLwZmN70pJ4abwe7WtdUYG40xpBvEkr3uiZZR2qI06sh0b3FMScAwJQa05kKcQUGLzb/l9SFC63kXAB4CCIE+urxY2e5c8KxLmrcXLJIndrnmXHb6pxAPQR0KOCvvykKsVBegnSRzBQbvPRjgMb805CsrLrluXVqFBx3FHM5kUfRJJPd1K7r/zFHUZ5XYjgc1/CMhaFvK23g3R26eOb6XWYwv6x5wjFsIVAFjkEiKEWr0nJl3ShZ/y//V6aao/D777od4SA++rddNF6mbHuc7cokUV+NAsbo4ulZBBsK/6uWQbUUSe9gG7ypb2OdSx2JtEfQsP+gdLB1yKDvtIVk5xT6KqhT2351+Gsn7UYfs05dTuNCDjK6r6bOJmeixAql6jMbo6XH3z2iW0v3uAyprw16pq
x-ms-exchange-antispam-messagedata: 9yeiVyAGqrHcfhsEIbNRdG5QPeUaWvB9Me8P7Wi+T+AGcJ8NozatUEho+JTym8L8gqzuermAtSAxTrcm2f29kUnA8aVnSVCQg1rOQivSiC1zeIk6lcgJNHK2J3u9Tqlf9xRLEFWTg8K/8iwImrBYXg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <906AF37BE12B8E40BBDAC3485DE80A47@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aa344c9f-7c7e-48e1-a3e1-08d7d2365ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 10:05:21.9887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZShHrV7fjpakkyPv2jjJvhK18Y4oW2iGUWv1ACQ1/J0qp4OPju+ygla4gtaA0MHGa9lEKTvwOX82Rjro1/zTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2681
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiAzLzI3LzIwMjAgMjo1NyBQTSwgR3JlZyBLSCB3cm90ZToNCj4gT24gRnJpLCBNYXIg
MjcsIDIwMjAgYXQgMDI6MjM6NDZQTSArMDUzMCwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+PiBU
aGUgU3lub3BzeXMgeEhDIGhhcyBhbiBpbnRlcm5hbCBUUkIgY2FjaGUgb2Ygc2l6ZSBUUkJfQ0FD
SEVfU0laRSBmb3INCj4+IGVhY2ggZW5kcG9pbnQuIFRoZSBkZWZhdWx0IHZhbHVlIGZvciBUUkJf
Q0FDSEVfU0laRSBpcyAxNiBmb3IgU1MgYW5kIDgNCj4+IGZvciBIUy4gVGhlIGNvbnRyb2xsZXIg
bG9hZHMgYW5kIHVwZGF0ZXMgdGhlIFRSQiBjYWNoZSBmcm9tIHRoZSB0cmFuc2Zlcg0KPj4gcmlu
ZyBpbiBzeXN0ZW0gbWVtb3J5IHdoZW5ldmVyIHRoZSBkcml2ZXIgaXNzdWVzIGEgc3RhcnQgdHJh
bnNmZXIgb3INCj4+IHVwZGF0ZSB0cmFuc2ZlciBjb21tYW5kLg0KPj4NCj4+IEZvciBjaGFpbmVk
IFRSQnMsIHRoZSBTeW5vcHN5cyB4SEMgcmVxdWlyZXMgdGhhdCB0aGUgdG90YWwgYW1vdW50IG9m
DQo+PiBieXRlcyBmb3IgYWxsIFRSQnMgbG9hZGVkIGluIHRoZSBUUkIgY2FjaGUgYmUgZ3JlYXRl
ciB0aGFuIG9yIGVxdWFsIHRvIDENCj4+IE1QUy4gT3IgdGhlIGNoYWluIGVuZHMgd2l0aGluIHRo
ZSBUUkIgY2FjaGUgKHdpdGggYSBsYXN0IFRSQikuDQo+Pg0KPj4gSWYgdGhpcyByZXF1aXJlbWVu
dCBpcyBub3QgbWV0LCB0aGUgY29udHJvbGxlciB3aWxsIG5vdCBiZSBhYmxlIHRvIHNlbmQNCj4+
IG9yIHJlY2VpdmUgYSBwYWNrZXQgYW5kIGl0IHdpbGwgaGFuZyBjYXVzaW5nIGEgZHJpdmVyIHRp
bWVvdXQgYW5kIGVycm9yLg0KPiANCj4gU291bmRzIGxpa2UgYnJva2VuIGhhcmR3YXJlLCBvciBp
cyB0aGlzIHJlcXVpcmVtZW50IGluIHRoZSB4aGNpIHNwZWM/DQo+IA0KTm90IGEgeGhjaSBzcGVj
IHJlcXVpcmVtZW50LCBidXQgYmVoYXZpb3Igb2YgU3lub3BzeXMgeEhDLiBXZSBoYXZlIG5vdCBz
ZWVuDQphY3R1YWwgZmFpbHVyZSBvbiBMaW51eCB5ZXQgYnV0IGl0IGlzIHBvc3NpYmxlIGluIGZ1
dHVyZSBpZiBTRyBsaXN0IHdpdGgNCnZlcnkgc21hbGwgYnVmZmVyIHNpemUgaXMgZ2l2ZW4gZm9y
IHRyYW5zZmVyLiANCj4+DQo+PiBUaGlzIGNhbiBiZSBhIHByb2JsZW0gaWYgYSBjbGFzcyBkcml2
ZXIgcXVldWVzIFNHIHJlcXVlc3RzIHdpdGggbWFueQ0KPj4gc21hbGwtYnVmZmVyIGVudHJpZXMu
IFRoZSBYSENJIGRyaXZlciB3aWxsIGNyZWF0ZSBhIGNoYWluZWQgVFJCIGZvciBlYWNoDQo+PiBl
bnRyeSB3aGljaCBtYXkgdHJpZ2dlciB0aGlzIGlzc3VlLg0KPj4NCj4+IFRoaXMgcGF0Y2ggYWRk
cyBsb2dpYyB0byB0aGUgWEhDSSBkcml2ZXIgdG8gZGV0ZWN0IGFuZCBwcmV2ZW50IHRoaXMgZnJv
bQ0KPj4gaGFwcGVuaW5nLg0KPj4NCj4+IEZvciBldmVyeSAoVFJCX0NBQ0hFX1NJWkUgLSAyKSwg
d2UgY2hlY2sgdGhlIHRvdGFsIGJ1ZmZlciBzaXplIG9mDQo+PiB0aGUgU0cgbGlzdCBhbmQgaWYg
dGhlIGxhc3Qgd2luZG93IG9mIChUUkJfQ0FDSEVfU0laRSAtIDIpIFNHIGxpc3QgbGVuZ3RoDQo+
PiBhbmQgd2UgZG9uJ3QgbWFrZSB1cCBhdCBsZWFzdCAxIE1QUywgd2UgY3JlYXRlIGEgdGVtcG9y
YXJ5IGJ1ZmZlciB0bw0KPj4gY29uc29saWRhdGUgZnVsbCBTRyBsaXN0IGludG8gdGhlIGJ1ZmZl
ci4NCj4+DQo+PiBXZSBjaGVjayBhdCAoVFJCX0NBQ0hFX1NJWkUgLSAyKSB3aW5kb3cgYmVjYXVz
ZSBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZXJlDQo+PiB3b3VsZCBiZSBhIGxpbmsgYW5kL29yIGV2
ZW50IGRhdGEgVFJCIHRoYXQgdGFrZSB1cCB0byAyIG9mIHRoZSBjYWNoZQ0KPj4gZW50cmllcy4N
Cj4+DQo+PiBXZSBkaXNjb3ZlcmVkIHRoaXMgaXNzdWUgd2l0aCBkZXZpY2VzIG9uIG90aGVyIHBs
YXRmb3JtcyBidXQgaGF2ZSBub3QNCj4+IHlldCBjb21lIGFjcm9zcyBhbnkgZGV2aWNlIHRoYXQg
dHJpZ2dlcnMgdGhpcyBvbiBMaW51eC4gQnV0IGl0IGNvdWxkIGJlDQo+PiBhIHJlYWwgcHJvYmxl
bSBub3cgb3IgaW4gdGhlIGZ1dHVyZS4gQWxsIGl0IHRha2VzIGlzIE4gbnVtYmVyIG9mIHNtYWxs
DQo+PiBjaGFpbmVkIFRSQnMuIEFuZCBvdGhlciBpbnN0YW5jZXMgb2YgdGhlIFN5bm9wc3lzIElQ
IG1heSBoYXZlIHNtYWxsZXINCj4+IHZhbHVlcyBmb3IgdGhlIFRSQl9DQUNIRV9TSVpFIHdoaWNo
IHdvdWxkIGV4YWNlcmJhdGUgdGhlIHByb2JsZW0uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGVq
YXMgSm9nbGVrYXIgPGpvZ2xla2FyQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4NCj4+IFJlc2Vu
ZGluZyBhcyAndW1sYXV0JyBpbiBlbWFpbCBhcmUgbm90IGFjY2VwdGVkIGJ5IHNvbWUgc2VydmVy
cy4NCj4+DQo+PiAgZHJpdmVycy91c2IvY29yZS9oY2QuYyAgICAgICB8ICAgOCArKysNCj4+ICBk
cml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jIHwgICAyICstDQo+PiAgZHJpdmVycy91c2IvaG9z
dC94aGNpLmMgICAgICB8IDEyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+PiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmggICAgICB8ICAgNCArKw0KPj4gIDQg
ZmlsZXMgY2hhbmdlZCwgMTQxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvY29yZS9oY2QuYyBiL2RyaXZlcnMvdXNiL2NvcmUvaGNk
LmMNCj4+IGluZGV4IGFhNDU4NDBkODI3My4uZmRkMjU3YTJiOGE2IDEwMDY0NA0KPj4gLS0tIGEv
ZHJpdmVycy91c2IvY29yZS9oY2QuYw0KPj4gKysrIGIvZHJpdmVycy91c2IvY29yZS9oY2QuYw0K
Pj4gQEAgLTE0NTksNiArMTQ1OSwxNCBAQCBpbnQgdXNiX2hjZF9tYXBfdXJiX2Zvcl9kbWEoc3Ry
dWN0IHVzYl9oY2QgKmhjZCwgc3RydWN0IHVyYiAqdXJiLA0KPj4gIAkJCQkJcmV0dXJuIC1FSU5W
QUw7DQo+PiAgCQkJCX0NCj4+ICANCj4+ICsJCQkJLyoNCj4+ICsJCQkJICogSWYgU0cgaXMgY29u
c29saWRhdGUgaW50byBzaW5nbGUgYnVmZmVyDQo+PiArCQkJCSAqIHJldHVybiBlYXJseQ0KPiAN
Cj4gSSBkbyBub3QgdW5kZXJzdGFuZCB0aGlzIGNvbW1lbnQuDQoNClRoZSBTRyBsaXN0IGlzIGNv
cGllZCB0byBhIHRlbXBvcmFyeSBidWZmZXIsIGFuZCBidWZmZXIgaXMgRE1BIG1hcHBlZCBzbyB3
ZSBzaG91bGQgDQpub3QgbWFwIHRoZSBTRyBsaXN0IGFnYWluLCBhbmQgcmV0dXJuIHdpdGhvdXQg
YW55IG1hcHBpbmcgaGVyZS4gDQo+IA0KPj4gKwkJCQkgKi8NCj4+ICsJCQkJaWYgKCh1cmItPnRy
YW5zZmVyX2ZsYWdzICYNCj4+ICsJCQkJICAgICBVUkJfRE1BX01BUF9TSU5HTEUpKQ0KPj4gKwkJ
CQkJcmV0dXJuIHJldDsNCj4gDQo+IFdoeT8gIElzbid0IHRoaXMgbm93IGdvaW5nIHRvIGFmZmVj
dCBvdGhlciBob3N0IGNvbnRyb2xsZXJzIChsaWtlIGFsbCBvZg0KPiB0aGVtPykNCj4gDQpXaGVu
IHVyYi0+bnVtX3NncyBpcyBncmVhdGVyIHRoYW4gMCwgb3RoZXIgdGhhbiBteSBxdWlyayBkbWFf
bWFwIGZ1bmN0aW9uIG5vIG9uZQ0Kd2lsbCBzZXQgdGhlIERNQSB0cmFuc2ZlciBmbGFnIGFzIFVS
Ql9ETUFfTUFQX1NJTkdMRS4gU28gaXQgd291bGQgbm90IGJlIGNhbGxlZCBieQ0KYWxsIEhDJ3Mu
IEV2ZW4gd2hlbiB0aGUgU0cgbGlzdCBkb2VzIG5vdCBoYXZlIHZlcnkgc21hbGwgYnVmZmVyIHNp
emVzIHRoaXMgcXVpcmsgd2lsbA0Kbm90IHNldCB0aGUgVVJCX0RNQV9NQVBfU0lOR0xFIHRyYW5z
ZmVyIGZsYWcuDQo+PiArDQo+PiAgCQkJCW4gPSBkbWFfbWFwX3NnKA0KPj4gIAkJCQkJCWhjZC0+
c2VsZi5zeXNkZXYsDQo+PiAgCQkJCQkJdXJiLT5zZywNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktcmluZy5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYw0KPj4g
aW5kZXggYTc4Nzg3YmI1MTMzLi4yZmFkOTQ3NDkxMmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L3VzYi9ob3N0L3hoY2ktcmluZy5jDQo+PiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmlu
Zy5jDQo+PiBAQCAtMzI5MSw3ICszMjkxLDcgQEAgaW50IHhoY2lfcXVldWVfYnVsa190eChzdHJ1
Y3QgeGhjaV9oY2QgKnhoY2ksIGdmcF90IG1lbV9mbGFncywNCj4+ICANCj4+ICAJZnVsbF9sZW4g
PSB1cmItPnRyYW5zZmVyX2J1ZmZlcl9sZW5ndGg7DQo+PiAgCS8qIElmIHdlIGhhdmUgc2NhdHRl
ci9nYXRoZXIgbGlzdCwgd2UgdXNlIGl0LiAqLw0KPj4gLQlpZiAodXJiLT5udW1fc2dzKSB7DQo+
PiArCWlmICh1cmItPm51bV9zZ3MgJiYgISh1cmItPnRyYW5zZmVyX2ZsYWdzICYgVVJCX0RNQV9N
QVBfU0lOR0xFKSkgew0KPj4gIAkJbnVtX3NncyA9IHVyYi0+bnVtX21hcHBlZF9zZ3M7DQo+PiAg
CQlzZyA9IHVyYi0+c2c7DQo+PiAgCQlhZGRyID0gKHU2NCkgc2dfZG1hX2FkZHJlc3Moc2cpOw0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jIGIvZHJpdmVycy91c2IvaG9z
dC94aGNpLmMNCj4+IGluZGV4IGZlMzgyNzUzNjNlMC4uOTRmZGRiZDA2MTc5IDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3Qv
eGhjaS5jDQo+PiBAQCAtMTI1Niw2ICsxMjU2LDEwOSBAQCBFWFBPUlRfU1lNQk9MX0dQTCh4aGNp
X3Jlc3VtZSk7DQo+PiAgDQo+PiAgLyotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKi8NCj4+ICANCj4+ICtzdGF0
aWMgaW50IHhoY2lfbWFwX3RlbXBfYnVmZmVyKHN0cnVjdCB1c2JfaGNkICpoY2QsIHN0cnVjdCB1
cmIgKnVyYikNCj4+ICt7DQo+PiArCXZvaWQgKnRlbXA7DQo+PiArCWludCByZXQgPSAwOw0KPj4g
Kwl1bnNpZ25lZCBpbnQgbGVuOw0KPj4gKwl1bnNpZ25lZCBpbnQgYnVmX2xlbjsNCj4+ICsJZW51
bSBkbWFfZGF0YV9kaXJlY3Rpb24gZGlyOw0KPj4gKwlzdHJ1Y3QgeGhjaV9oY2QgKnhoY2k7DQo+
PiArDQo+PiArCXhoY2kgPSBoY2RfdG9feGhjaShoY2QpOw0KPj4gKwlkaXIgPSB1c2JfdXJiX2Rp
cl9pbih1cmIpID8gRE1BX0ZST01fREVWSUNFIDogRE1BX1RPX0RFVklDRTsNCj4+ICsJYnVmX2xl
biA9IHVyYi0+dHJhbnNmZXJfYnVmZmVyX2xlbmd0aDsNCj4+ICsNCj4+ICsJdGVtcCA9IGt6YWxs
b2Nfbm9kZShidWZfbGVuLCBHRlBfQVRPTUlDLA0KPj4gKwkJCSAgICBkZXZfdG9fbm9kZShoY2Qt
PnNlbGYuc3lzZGV2KSk7DQo+PiArCWlmICghdGVtcCkgew0KPj4gKwkJeGhjaV93YXJuKHhoY2ks
ICJGYWlsZWQgdG8gY3JlYXRlIHRlbXAgYnVmZmVyLCBIQyBtYXkgZmFpbFxuIik7DQo+IA0KPiBE
aWRuJ3Qga3phbGxvYyBqdXN0IHdhcm4gYmVmb3JlIHRoaXM/DQo+IA0KWWVzLCBJdCBzaG91bGQu
DQo+IEFuZCBpc24ndCB0aGlzIHdob2xlIHRoaW5nIGdvaW5nIHRvIGNhdXNlIGEgbG90IG1vcmUg
bWVtb3J5IGFsbG9jYXRpb25zDQo+IHBlciBzdWJtaXNzaW9uIHRoYW4gYmVmb3JlPw0KPiANCklm
IGJ1ZmZlciBzaXplcyBmb3IgU0cgbGlzdCBhcmUgdmVyeSBzbWFsbCAobGVzcyB0aGFuIE1QUyBz
aXplIHBlciBUUkJfQ0FDSEVfU0laRSkNCnllcywgaXQgd2lsbCBoYXZlIG1vcmUgbWVtb3J5IGFs
bG9jYXRpb25zLiANCg0KPj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+PiArCX0NCj4+ICsNCj4+ICsJ
aWYgKHVzYl91cmJfZGlyX291dCh1cmIpKSB7DQo+PiArCQlsZW4gPSBzZ19wY29weV90b19idWZm
ZXIodXJiLT5zZywgdXJiLT5udW1fc2dzLA0KPj4gKwkJCQkJIHRlbXAsIGJ1Zl9sZW4sIDApOw0K
Pj4gKwkJaWYgKGxlbiAhPSBidWZfbGVuKQ0KPj4gKwkJCXhoY2lfd2Fybih4aGNpLCAiV3Jvbmcg
dGVtcCBidWZmZXIgd3JpdGUgbGVuZ3RoXG4iKTsNCj4gDQo+IEhvdyBjb3VsZCB0aGlzIGhhcHBl
bj8gIEFuZCBpZiBpdCBkb2VzLCB3aHkgc3BhbSB0aGUga2VybmVsIGxvZyBhYm91dCBpdA0KPiBh
bmQgeWV0IG5vdCByZXR1cm4gYW4gZXJyb3I/DQo+DQpMb2dpYyBzaW1pbGFyIHRvIGJvdW5jZSBi
dWZmZXIgYWxsb2NhdGlvbiwgYnV0IEkgYWdyZWUgc2hvdWxkIG5vdCBsb2cgdGhpcyBhcw0Kd2Ug
ZG9uJ3Qgd2FudCB0byByZXR1cm4gd2l0aCBlcnJvciBoZXJlLg0KIA0KPj4gKwl9DQo+PiArDQo+
PiArCXVyYi0+dHJhbnNmZXJfYnVmZmVyID0gdGVtcDsNCj4+ICsJdXJiLT50cmFuc2Zlcl9kbWEg
PSBkbWFfbWFwX3NpbmdsZShoY2QtPnNlbGYuc3lzZGV2LA0KPj4gKwkJCQkJICAgdXJiLT50cmFu
c2Zlcl9idWZmZXIsDQo+PiArCQkJCQkgICB1cmItPnRyYW5zZmVyX2J1ZmZlcl9sZW5ndGgsDQo+
PiArCQkJCQkgICBkaXIpOw0KPj4gKwlpZiAoZG1hX21hcHBpbmdfZXJyb3IoaGNkLT5zZWxmLnN5
c2RldiwNCj4+ICsJCQkgICAgICB1cmItPnRyYW5zZmVyX2RtYSkpIHsNCj4+ICsJCXhoY2lfZXJy
KHhoY2ksICJkbWEgbWFwcGluZyBlcnJvclxuIik7DQo+IA0KPiBBZ2FpbiwgZGlkbid0IGRtYV9t
YXBwaW5nX2Vycm9yKCkgc3BpdCBvdXQgYSBtZXNzYWdlPw0KPg0KWWVzLCBzaG91bGQgcmVtb3Zl
IHRoaXMgdG9vLg0KIA0KPj4gKwkJcmV0ID0gLUVBR0FJTjsNCj4+ICsJCWtmcmVlKHRlbXApOw0K
Pj4gKwl9IGVsc2Ugew0KPj4gKwkJdXJiLT50cmFuc2Zlcl9mbGFncyB8PSBVUkJfRE1BX01BUF9T
SU5HTEU7DQo+PiArCX0NCj4+ICsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9DQo+IA0KPiB0aGFu
a3MsDQo+IA0KPiBncmVnIGstaA0KPiANCg0KVGhhbmtzICYgUmVnYXJkcywNClRlamFzIEpvZ2xl
a2FyDQo=
