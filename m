Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389C624FFA3
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 16:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgHXOM1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 10:12:27 -0400
Received: from mail-mw2nam10on2058.outbound.protection.outlook.com ([40.107.94.58]:57238
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725781AbgHXOMW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Aug 2020 10:12:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tr/rFhnm/V3O7+E2+GIQQfKjWrWIFRYfGZJLp8FblX9rXRIca/yikXNiCjLUXJLwEGir6FqbPSLKUboJfSQUj0DCqBAISPz5snnR2ItprEtG7ZgwcUkGaAHfyq0AhIkAOVruoW+N9+vrp73S/UqBpsZqllMB8QApqmGGzQNFMUAhF0oNxFi/1Mbs8gW4MP3W0HEGr4YqEhHNzOGE3NRa6OrVJS9oYVc1mBs/X13tLOr+W9qHcSyHaQRwFMLC+CJ/lBtNETGo2qpUqHNuxyvMKC4kOe6tjpvfmpALxL4N6LzE7utBBSHbBOMNaFztXGdTtOQxGH+LGqLovhBfTbgGUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve7Zexl5oIH2fMqK8V7bcneL3Ny5GwD+ragrv5d1M4U=;
 b=njJlp4Vo7+UICh0y9la4mF1fJVYEm7gci/VK+rinL/ye8vC+/sr9Lspv7LLX1k/zothOD3Ax2/ynzQpUB3/8fswstGTuSjS2Cb0kSpFr9GcIK1rn9GGutIVOID5uV2w7VRnaAXXvellqkCJFP+r2i7K9EBrsI/eGg+T/qxMj36IXuQhincKYZVy4prtX/rjd+IWS8bGQMCZl99oAt36jAYFHQshN0GMQmgqwz3mENyxnGFSjkEKgE9RmRSrHuqUtDMAlhRY0YLt9ahn4pRJ3c+oZJsUNVHmlibbDJsCMQuGryrj7y9kz9OvR8ipzazYjEKJ4+ULDk49YVi8IggZUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ve7Zexl5oIH2fMqK8V7bcneL3Ny5GwD+ragrv5d1M4U=;
 b=NRoYwGlmR5J7XA5pacz3ApuqPWCUzYyQRysUD9Sb4cvg4fZ29F5+TV3LHPoEWRA+XNcDdm21evd+zLBls/US++wyhgoxEwMqrLrIsR9fDDx8qH+C+q33Z3nK6u5a+obd5RtM3HU4uHqCApD963kco1/yfyc6JW0tQwS7JUgjN4Y=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2310.namprd10.prod.outlook.com
 (2603:10b6:910:4a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 14:12:19 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d%7]) with mapi id 15.20.3283.024; Mon, 24 Aug 2020
 14:12:19 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "yebin10@huawei.com" <yebin10@huawei.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Thread-Topic: [PATCH] usb: gadget: fsl: Fix unsigned expression compared with
 zero in fsl_udc_probe
Thread-Index: AQHWee+zZeLUHMNpPkKw58UdehD37KlG8waAgABWdYCAAAPLAA==
Date:   Mon, 24 Aug 2020 14:12:19 +0000
Message-ID: <2c2317ff8385f75466cbfa1f0109a1f2c3acbc48.camel@infinera.com>
References: <20200824080437.229826-1-yebin10@huawei.com>
         <20200824082122.GA336539@kroah.com>
         <f61f4bc3916f852799edb6af9740afb2118ec84f.camel@infinera.com>
         <87d03gjgbw.fsf@kernel.org>
In-Reply-To: <87d03gjgbw.fsf@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.90 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 593d0e38-d6f5-41e7-5fd0-08d84837b68b
x-ms-traffictypediagnostic: CY4PR1001MB2310:
x-microsoft-antispam-prvs: <CY4PR1001MB2310401DA5E012FA2ECD342CF4560@CY4PR1001MB2310.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6cbQN6ntAJaZthepAH450Kz04mz0w8jyCSxEwa1CY4bsp6e9475w5KphmD8GGLfO5ubw11u/m3LQPiSD1UcxhiJCLtSBjbpstN47wMDG3acQHLrG/nSiDOfFtd/gJJ3EyN9K/rsqpOvdrRkI0u8AW4YLJRL4e33D5Q+ivxFeSQHLBqpkgApXAKqUCeFKB4tFszpJQVG0gGJjdgxt4OrcWSXRVOY8PDoyaLcF+Vui5WiM+q+X+n+EGeaSUdysWmp2ijsvY41REHhvc7bLHDBfQDrAkVQJ5EssojcYw/OsVpxvfWpOpx5m03PA4GQ0mlBG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2389.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(5660300002)(2906002)(6486002)(478600001)(71200400001)(4326008)(66476007)(8936002)(76116006)(66946007)(91956017)(66446008)(64756008)(66556008)(2616005)(4744005)(83380400001)(6506007)(36756003)(110136005)(8676002)(316002)(26005)(186003)(86362001)(6512007)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EYP9TRwnph8L8M/CjQeKqL2xH0HQDzHEcXrj/AHqpyvZL/qoMdW4YeP4Erx+6A/+VhZ/ntbwUPokga4A7AInVRmiKX38kG+v903xUxI27k0MgdJleHeBtf9HxE6LYgrvS37KM8sAmZ8W/ldWvepD3EukJ6ISgGqMwHe3qyHfeakKYP4keOO2j0n6KL+JtXcgFsUHP8TFR+s/NEwyCqQL8p4hwkJ232y4ohzMnhQezK5ZwVgQNR2nnixSg1LsPrWwBrsvDmoGV/Oh4QstpldIftEL9fIRI9KnZ/mSn1/2ONxOBglrmEqVf2YL1hOuHWKJwnfOKSu9ZtuudIHdz+H9Y4uY/BsVwLs0U0gn1ZpzxlezXcEFRtOaAtCgYSsNq3rrw4hZUVb298Caxhxa4tl45x5KuXlo33J2Y84u1wuR0Ds4QNyTVIq8ajF/yXEAXS5Y+DbpSfLQHsbP2cO5AfitI+sZFUpq5UX1eKvI++p8ZZ8h5X7W4xHgDggLB2/JyMfc1BIN54jRV0f2CVpuogX34HOdTOwgQr7SRVlUAuCB4kxuJYby5UZmYSvMOdmVIMWSWe2AM2RYrdaUYw/ufGgtYKPvECN03GrOiOinjak0cqbdQG8wyjfkgZmrixXLZD8JtoyNVJzBaWEExghXD+Ut5w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EF1F40D8FB9264A955F0CD3B04A6FA7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593d0e38-d6f5-41e7-5fd0-08d84837b68b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 14:12:19.4264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82To4yE+WL9oNiDp3wA60hBNMHrP9fUriYtgCJ1O2YIi1sG8ez0wqQjC+tDKZGIAyjzV8SbS+nQ8zQHwzGJTEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2310
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gTW9uLCAyMDIwLTA4LTI0IGF0IDE2OjU4ICswMzAwLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+
IEpvYWtpbSBUamVybmx1bmQgPEpvYWtpbS5UamVybmx1bmRAaW5maW5lcmEuY29tPiB3cml0ZXM6
DQo+IA0KPiA+IE9uIE1vbiwgMjAyMC0wOC0yNCBhdCAxMDoyMSArMDIwMCwgR3JlZyBLSCB3cm90
ZToNCj4gPiA+IA0KPiA+ID4gT24gTW9uLCBBdWcgMjQsIDIwMjAgYXQgMDQ6MDQ6MzdQTSArMDgw
MCwgWWUgQmluIHdyb3RlOg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZZSBCaW4gPHllYmluMTBA
aHVhd2VpLmNvbT4NCj4gPiA+IA0KPiA+ID4gSSBjYW4ndCB0YWtlIHBhdGNoZXMgd2l0aG91dCBh
bnkgY2hhbmdlbG9nIHRleHQsIHNvcnJ5Lg0KPiA+IA0KPiA+IFN0aWxsIHRha2luZyBwYXRjaGVz
IGZvciBmc2xfdWRjX2NvcmUuYyA/DQo+ID4gSSBmaWd1cmVkIHRoaXMgZHJpdmVyIHdhcyBvYnNv
bGV0ZSBhbmQgc2hvdWxkIGJlIG1vdmVkIHRvIG9uZSBvZiB0aGUgQ2hpcGlkZWEgZHJpdmVycy4N
Cj4gDQo+IE5vYm9keSBzZW50IGFueSBwYXRjaGVzIHRvIHN3aXRjaCBvdmVyIHRoZSB1c2VycyBv
ZiB0aGlzIGRyaXZlciB0bw0KPiBjaGlwaWRlYS4gSSB3b3VsZCBsb3ZlIHRvIGRlbGV0ZSB0aGlz
IGRyaXZlciA6LSkNCg0KTWUgdG9vLCBJIGdvdCBhIGZldyBsb2NhbCBwYXRjaGVzIGhlcmUgYXMg
dGhlIGRyaXZlciBpcyBxdWl0ZSBidWdneS4NCkdvdCB0byBsaXR0bGUgVVNCIGtub3dsZWRnZSB0
byBzd2l0Y2ggaXQgb3ZlciB0aG91Z2ggOigNCg0KIEpvY2tlDQo=
