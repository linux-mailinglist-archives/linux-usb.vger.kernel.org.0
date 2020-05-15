Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B571D4748
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgEOHlw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 03:41:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:55464 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726624AbgEOHlv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 03:41:51 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 287A0401C0;
        Fri, 15 May 2020 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1589528510; bh=MNxtzyWkHyO9a4WBlCgWFatLPzlaR6NqCTdpcvtrCJk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AOMddS9AVqPo7Npiuexqb4YZR43HoQkXFygqZnYdP+yr+I7QUtrSuwCv7ErUk9n0L
         oDlxCzUDnKxyR57XQoqIyK1es13tI9ztbf8kHhmyJZkZSydH1DZFQIovqeEOdye/bP
         uSZOdzBS/ZRG+WY/s9+pmp70xt27lQr0/RgHoZVqWPrh2/CENRG35MWxIi/z1mnM1B
         3mJNd8JMSGcJft1IcPtwpjpBfRN5OQ58I20314+alR9gmBxwVrARdOD9hzU7sT+4YV
         2aEHHbkZTMRwwbQv8Pd8S8xYuGj3NcFTBR3AMGGhRgoeN03VzdLXYxgagJum6E8BhV
         7a1kAEtcrbkjA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CFF17A0071;
        Fri, 15 May 2020 07:41:48 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 15 May 2020 00:41:46 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Fri, 15 May 2020 00:41:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV2Ybwgs08nSodjKrP54f9IAtCcoGAVWepHQzF+X6GCF6t5IwbX59aDoP4BcyDa7c4JVoutc92y/ybx01Skm05TqN53HbTV1vMJ4W0/8pBPpR60dhR7RQQ9z+v9jmTKtIlgZdWeLCShK/thlAJAe84yQ5ZxbSqaAf6rPgPxgfEjzx2ikeplN1cIopaW15fx91ZOip80R4oBHOkVMBvibXDtMpZBKNOn2HiQcEgo/CQilg4lLOV/9pyGRoXLqEewpF9+F7sZEIoaIgjTFwNavSEWRL6duRANjRd4qHvSc/kFL6TlKjxgdFvetorCB8Px/0XmX2lN6skbU4JcLc5eHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNxtzyWkHyO9a4WBlCgWFatLPzlaR6NqCTdpcvtrCJk=;
 b=hbI/bRExsrSBhq+c/1dLPNrRL2HtmcbuciufNU8wb+1Xc09nCnu6fyCGUyLI2fbDHRpmOEwF+E8Jrr0DBDuORI9/NOgN4NnCLxp1IGfHPUy2mUwRg3fk00RfKDhtyaFr9NsXcnah4Q6X3NUnDpmJYnKpskiRLxS38PaG5M1mD4v4Xv+GfHPGeUuCgMJX1ULH23ah9qgkneamh42YxjQHVn9hmx8rVDyr/v7o4iTtHk7umibdgDsVtUbGjI+8qxbyfhp/pc3dECtZsm+7FDwLJr+sRXgNFX/KxsQTE+wAxSVZ1Ifzt/cEH/XbGhsvsu+pLldtn5iZdkxiicNRlSsn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNxtzyWkHyO9a4WBlCgWFatLPzlaR6NqCTdpcvtrCJk=;
 b=hwIfv6KW6VyevxUPnXXkDq5KYkFVVhsWuow3XC/oebMScxixmTJlj8cV8oKxZ4KCzu7SuCoWgW7Xe+vxoDWVmwS0qTf/ZXuUGV9r99zxI+IXwMR3CcCYC0yczJhIqE+QNWStYpp3Zyp0AB/tVWCNtTy7R9pjyWpuNVnuQGGrmQQ=
Received: from SN1PR12MB2557.namprd12.prod.outlook.com (2603:10b6:802:22::15)
 by SN1PR12MB2413.namprd12.prod.outlook.com (2603:10b6:802:2b::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.29; Fri, 15 May
 2020 07:41:45 +0000
Received: from SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::78a8:d153:7e1c:57a5]) by SN1PR12MB2557.namprd12.prod.outlook.com
 ([fe80::78a8:d153:7e1c:57a5%7]) with mapi id 15.20.3000.016; Fri, 15 May 2020
 07:41:45 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Marek Vasut <marex@denx.de>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Amelie Delaunay <amelie.delaunay@st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Topic: [PATCH] [RFC] usb: dwc2: Run the core connect in dwc2_hcd_init()
Thread-Index: AQHWEaBFUZHLydAVY0yALpZJ1gABx6h3ITiAgAACTgCAAAlrgIAAGd8AgADukoCAAFTigIABVJ4AgABprwCAAAQ1gIABN86AgABAc4CAAA8qAIABNeYAgATroYCAAz+MAIAACiqAgCGlkQCAAhBPAA==
Date:   Fri, 15 May 2020 07:41:45 +0000
Message-ID: <4bfffaf9-fffd-57bc-6d45-ba43c46cd136@synopsys.com>
References: <20200413143107.181669-1-marex@denx.de>
 <31b679d3-d3e4-0220-ec4b-58eada4d21d4@synopsys.com>
 <b20fb33d-7fdd-5785-8f72-74900eb4d328@denx.de>
 <9906c2da-8a20-eae7-d69e-6947085edf84@synopsys.com>
 <b64f41ac-2d70-55a3-ab6a-77383cd463eb@denx.de>
 <d1b36da4-b506-2f86-f5ad-95bf3aac4485@synopsys.com>
 <c35e95cf-7f72-4a49-a0e1-efc0701d613d@denx.de>
 <867a776d-1e2c-2207-4387-072d2a8423fb@synopsys.com>
 <a6d681c5-d5fa-51d8-a320-6f6e9844c93a@denx.de>
 <4b4478aa-85bd-c05c-b5d0-e11dc35eb623@synopsys.com>
 <6ea2270d-19a4-7e8b-42fb-37a4a9d81e1f@denx.de>
 <8fb53f3a-a02b-3c53-0d9d-22b707bda786@synopsys.com>
 <671f36e3-367e-bcdf-0da7-f7ad82cf6284@denx.de>
 <ebb175be-edc1-892f-4537-a7402fd4460e@synopsys.com>
 <bb4835f6-a6c7-61cf-d4f0-eddbb5d6dea9@denx.de>
 <8de7047f-4d49-349b-983a-31c4ab66562f@synopsys.com>
 <c59c58e6-648c-bcb3-cbd4-9e78f9021bb7@denx.de>
 <d67d69a6-651f-f214-5119-bbbd68b4c2d5@denx.de>
In-Reply-To: <d67d69a6-651f-f214-5119-bbbd68b4c2d5@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: denx.de; dkim=none (message not signed)
 header.d=none;denx.de; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a6f1589-6a92-49ff-252d-08d7f8a36ade
x-ms-traffictypediagnostic: SN1PR12MB2413:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB241388EC951E14E84EF27405A7BD0@SN1PR12MB2413.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8uwDLu7ZhT9KEPl1NHcHlWQqX779HLimEJ79AXoBkmoP7mb4BRREprzibruKYwU4+kgwaLzwj0pIzANh24IwRZA9yWiFkJxYSUfSl1kXrXtuO/oc7e3y+25ZlXVtOIsRCgOUVCYLbscLrMKSmdCAFH8KRD0JJqiInBqU7xmhU/G3mYoigZv1OXmndRxgRnFbJy0VvU3Om4UgZN5txFVBI0RoLgq5D/jG1CMcGrKfp80VYTgPr52lZv6OWo3vQV7vMBxbENmDuYF7KdmL+d/1tC08XIOUgzfA43tOjonjSoe159V3N12TXhmgCa3t5zyB8pyasO3PtoVrg4/PGYlKq67imHn7d7uCCQ3Mk0hiIpFqMfxOEVWOisX+Vtx9sxc02cf35aSvmFQX8JPA9c+2ytCOBfaaRTwxdHPMzQd9Xi0f5s734iWugh/bYnYO6JK4JXstoVeFCoOcJHdiRWCEqNdt56zYCveyxjEjTDoryklFsdE0rJUBY0ikKb9cNd5x
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(396003)(39860400002)(376002)(366004)(36756003)(6486002)(5660300002)(2906002)(4326008)(8676002)(478600001)(71200400001)(66556008)(66946007)(76116006)(91956017)(66446008)(64756008)(66476007)(31686004)(54906003)(53546011)(110136005)(316002)(2616005)(31696002)(8936002)(6506007)(26005)(6512007)(186003)(86362001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: qXaaPS/TOTNWMdESm2Ps8Za8iB86beO5/G3e8TY6qGv/MZ/hOq3oQHJkfXi+FQhIvFwjIIbya+FPmdZvhO9q3hw/HDjIffoMkW7wP4RzmV+E1Z0QRhhaGgEjXVGaLNkkNj6/7uSk9htfYnW9ZuJqCUhQhowFCdGFquZ28DxWYvGBcqayjyntULzseH3EBQsyR0iJJpaysCHYgUxlP0w5S8ULYrmWv7FPJ8Df82XxSq+JPZV7TYt+ZB+0ZDMD/hm7TlPc3Fnq8xYHIDreGqxCptBr105Ox+0L0oXIKWI6tyrO2NoSG2xdSIODay0UnkyC7WoywJ41/3Br4MAdD7bQZ0Ou5n4FedFDCgJN/xzXp6pi46XCIfK3nfGLlOVyIpkwO1uSPKtPUSVzhFj2dpmtVp5WYQr4FcgIx8J50KQhnmLlbyg/P5vU4JmZFN8CDnHj9iI9F/2XT7eZOlF2VOj0bAjl2l2IXNSNdSIJHgiFk+c=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29C10A338A68414C9FA98B1D968B3D53@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6f1589-6a92-49ff-252d-08d7f8a36ade
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 07:41:45.1436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kOF5wV2htojOqp3ivJBQdytOzdq7x4LdsCtWIUXxfSvEK9F+zl9rJtydz1GmHdTK1EZwwl41Hsy0J5Zp7+tng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2413
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgTWFyZWssDQoNCk9uIDUvMTQvMjAyMCA0OjEwIEFNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4g
T24gNC8yMi8yMCA0OjIxIFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4+IE9uIDQvMjIvMjAgMzo0
NSBQTSwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+Pj4gSGksDQo+Pg0KPj4gSGksDQo+Pg0K
Pj4+IE9uIDQvMjAvMjAyMCA0OjA5IFBNLCBNYXJlayBWYXN1dCB3cm90ZToNCj4+Pj4gT24gNC8x
Ny8yMCAxMTowMCBBTSwgTWluYXMgSGFydXR5dW55YW4gd3JvdGU6DQo+Pj4+PiBIaSwNCj4+Pj4N
Cj4+Pj4gSGksDQo+Pj4+DQo+Pj4+PiBPbiA0LzE2LzIwMjAgNjozMSBQTSwgTWFyZWsgVmFzdXQg
d3JvdGU6DQo+Pj4+Pj4gT24gNC8xNi8yMCAzOjM3IFBNLCBNaW5hcyBIYXJ1dHl1bnlhbiB3cm90
ZToNCj4+Pj4+DQo+Pj4gTG9va3MgbGlrZSBJIGZvdW5kIGNhdXNlIG9mIGlzc3VlLiBBY2NvcmRp
bmcgdG8geW91ciBsb2dzIEdJTlRNU0sgc2V0DQo+Pj4gaG9zdCBtYXNrcywgYXQgbGVhc3QgVVNC
IFJlc2V0IG5vdCB1bm1hc2tlZCB3aGljaCByZXF1aXJlZCBmb3IgZGV2aWNlIG1vZGUuDQo+Pj4g
V2h5IGl0IGhhcHBlbi4gRHVyaW5nIGR3YzIgZHJpdmVyIHByb2JlIGZpcnN0IGluaXRpYWxpemVk
IGRldmljZSBwYXJ0DQo+Pj4gdGhlbiBob3N0IHBhcnQuIEJlY2F1c2Ugb2YgeW91ciBnX3plcm8g
aXMgYnVpbHRpbiBpbiBLZXJuZWwgaXQNCj4+PiBpbW1lZGlhdGVseSBib3VuZCB0byBkd2MyLCBh
cyByZXN1bHQgY2FsbGVkIG1haW4gZGV2aWNlIGluaXRpYWxpemF0aW9uDQo+Pj4gZHdjMl9oc290
Z19jb3JlX2luaXRfZGlzY29ubmVjdGVkKCkgd2hpY2ggYXQgbGVhc3Qgc2V0IEdJTlRNU0sgZm9y
DQo+Pj4gZGV2aWNlIG1vZGUuIEFmdGVyIGdhZGdldCBzaWRlIGluaXRpYWxpemF0aW9uIGRvbmUs
IGR3YzIgZ28gdG8gaG9zdA0KPj4+IGluaXRpYWxpemF0aW9uIGhjZF9pbml0KCkgYW5kIHJlc2V0
IEdJTlRNU0sgdG8gaG9zdCBtYXNrcy4gSW4gdGhpcyBjYXNlDQo+Pj4gY29ubmVjdGluZyBjYWJs
ZSB0byBob3N0IHdpbGwgaWdub3JlIFVTQlJlc2V0IGFuZCBzdGFja2VkLiBZb3VyIGluaXRpYWwN
Cj4+PiBwYXRjaCBpbmNsdWRpbmcgY2FsbCB0byBmdW5jdGlvbiBkd2MyX2hzb3RnX2NvcmVfaW5p
dF9kaXNjb25uZWN0ZWQoKSwNCj4+PiB3aGljaCBhbGxvdyB0byByZXN0b3JlIGRldmljZSBtb2Rl
IG1hc2tzIGFuZCBvbiBjYWJsZSBjb25uZWN0IHN0YXJ0DQo+Pj4gd29ya2luZyBhcyBkZXZpY2Uu
DQo+Pj4gRmlyc3QgdG8gY2hlY2sgbXkgYXNzdW1wdGlvbiwgcGxlYXNlIGJ1aWxkIGdfemVybyBh
cyBtb2R1bGUgYW5kIG1vZHByb2JlDQo+Pj4gaXQgYWZ0ZXIgZHdjMiBtb2Rwcm9iZSB3aWxsIGJl
IGRvbmUuIElmIHRoZSB0ZXN0cyB3aWxsIHBhc3MgdGhlbiB3aWxsDQo+Pj4gdGhpbmsgaG93IHJl
c29sdmUgaXNzdWUgd2l0aCBidWlsdGluIGZ1bmN0aW9ucy4NCj4+DQo+PiBVc2luZyBnX3plcm8g
YXMgYSBtb2R1bGUgc2VlbXMgdG8gd29yayB0b28sIHNvIHBsZWFzZSBwcm9jZWVkLg0KPiANCj4g
QW55IG5ld3Mgb24gdXNpbmcgZ196ZXJvIGFzIGJ1aWx0LWluID8NCj4gDQpDb3VsZCB5b3UgcGxl
YXNlIHRlc3Qgd2l0aCB0aGlzIHBhdGNoLg0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
Mi9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMNCmluZGV4IDEyYjk4YjQ2NjI4
Ny4uN2ZhZjVmOGMwNTZkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0K
KysrIGIvZHJpdmVycy91c2IvZHdjMi9nYWRnZXQuYw0KQEAgLTQ5MjAsMTIgKzQ5MjAsNiBAQCBp
bnQgZHdjMl9nYWRnZXRfaW5pdChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcpDQogIAkJCQkJICBl
cG51bSwgMCk7DQogIAl9DQoNCi0JcmV0ID0gdXNiX2FkZF9nYWRnZXRfdWRjKGRldiwgJmhzb3Rn
LT5nYWRnZXQpOw0KLQlpZiAocmV0KSB7DQotCQlkd2MyX2hzb3RnX2VwX2ZyZWVfcmVxdWVzdCgm
aHNvdGctPmVwc19vdXRbMF0tPmVwLA0KLQkJCQkJICAgaHNvdGctPmN0cmxfcmVxKTsNCi0JCXJl
dHVybiByZXQ7DQotCX0NCiAgCWR3YzJfaHNvdGdfZHVtcChoc290Zyk7DQoNCiAgCXJldHVybiAw
Ow0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvcGxhdGZvcm0uYyBiL2RyaXZlcnMvdXNi
L2R3YzIvcGxhdGZvcm0uYw0KaW5kZXggOGVhNGEyNDYzN2ZhLi42MDNiODVjZDhlZDMgMTAwNjQ0
DQotLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BsYXRmb3JtLmMNCisrKyBiL2RyaXZlcnMvdXNiL2R3
YzIvcGxhdGZvcm0uYw0KQEAgLTUzNyw2ICs1MzcsMTYgQEAgc3RhdGljIGludCBkd2MyX2RyaXZl
cl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIA0KKmRldikNCiAgCWlmIChoc290Zy0+ZHJf
bW9kZSA9PSBVU0JfRFJfTU9ERV9QRVJJUEhFUkFMKQ0KICAJCWR3YzJfbG93bGV2ZWxfaHdfZGlz
YWJsZShoc290Zyk7DQoNCisJLyogUG9zdHBvbmVkIGFkZGluZyBhIG5ldyBnYWRnZXQgdG8gdGhl
IHVkYyBjbGFzcyBkcml2ZXIgbGlzdCAqLw0KKwlpZiAoaHNvdGctPmdhZGdldF9lbmFibGVkKSB7
DQorCQlyZXR2YWwgPSB1c2JfYWRkX2dhZGdldF91ZGMoaHNvdGctPmRldiwgJmhzb3RnLT5nYWRn
ZXQpOw0KKwkJaWYgKHJldHZhbCkgew0KKwkJCWR3YzJfaHNvdGdfcmVtb3ZlKGhzb3RnKTsNCisJ
CQlnb3RvIGVycm9yX2luaXQ7DQorCQl9DQorDQorCX0NCisNCiAgCXJldHVybiAwOw0KDQogIGVy
cm9yX2luaXQ6DQoNCg0KDQpUaGFua3MsDQpNaW5hcw0K
