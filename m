Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D256A1C03AD
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 19:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgD3RRX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 13:17:23 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35670 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725844AbgD3RRX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 13:17:23 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7A8B3406F4;
        Thu, 30 Apr 2020 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1588267042; bh=XsEJra9Mq+LEef81UeVyDpRnGtsEjZN+vOw1iRNtNE4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Pi/S9La8ANIY4eJCNIEhCo1n7d870FoQIlIlLsSpWOLljUt3sAG2Pn4Kpj6Z6sNHR
         GtG3xa3WDA0PBugRnjXB/KAvlgId55Q1CNbJmn4dBD7V6Nh4+ejMlweHWXh0WA2H+u
         oQCUklJUHTgumIzpzE6KgPHD7y9awNblCV/AZH2/WxoR34jpiIuyVqW6YcogtOOOlL
         uHPUFbbhIt36R2WEy2UWOhFVWyfrKWMEhYHfO4K6fhCvZqWeZ6MJeSfHX0/wRGnjeS
         YmTpcgezI17oZe5oVNs3jthoYfbltqzAgs2N1Iq50YCv4tonsnvcTVFpZargquuqgN
         L0TbUojS5m9Gw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 23C1DA0077;
        Thu, 30 Apr 2020 17:17:21 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 30 Apr 2020 10:17:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 30 Apr 2020 10:17:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGnuzIZzMwrhQj+sTOA1BlIUppB8CS/4aQg53GTTHFx988azjJBr85aTgpLa7sCPDTO7+s/R4KfUyp+9Wu007fvn9TwfU0K092NGNLRGags6ixkjwpo0ujpszeaaY0L1HS0I5xlX8jinp4BDZ0eMz6r8AixxFDs+1GkiIpfMQA2kcYorPuDztZllDv0k127ND4MGLYlAb5iXdEskO90ogi/nKSXr6YV4+P4jpUij+eLk4Mzl4IyhYwfiUAWFrZ0/9h+t2xrXbOiW08KKdYR9Sde6goWrkl0Wm4kSExFETMlMkqNFMMm9DO/vaYazuvt5uLE1S44VDhaq55k/YY5UFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsEJra9Mq+LEef81UeVyDpRnGtsEjZN+vOw1iRNtNE4=;
 b=ELw6U5cKkK+aIhwGnwS/fVFe8cEszN4FOFLBAL39uhAFusvXrkjhQ3qrNbg4kPXcN5yBNKZhhY+laIxZF13P8iXqe879LT00CjJmlHLoBrLKdo0ih/9zuKyGk9q2nrLCKV3JIuvXbdFkkykgxZ9kNzJnz1OGJueDQLPBrfJpFpiJwy46TFYlmW75Ad7JCcEFrb62FfCC0L6+vRh3WQYJLbWaHQTLVX4simXR5D33LhWBwwfHNq5gbseQO4/DIcafY7w4IHt8uEGZ5qsUxJDnHDPw9idw0qnfB9tiLd+eCbJFkshOlDmJeXyCcQX7AlygKZ/X8luUDvjFI5EqdakMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsEJra9Mq+LEef81UeVyDpRnGtsEjZN+vOw1iRNtNE4=;
 b=DHRFtybw7Yqj6+PMt2ps5PGMd3zZ1N5GSGXg9grVB/C1hJuRrJXhAs+ikz5dFZ05UXCBQPUwUTiyUppKX98E+bVy6yxknjLYC+mNMQuFTqYgbTuHFZDZoDLSUu0/WuBg6hyybpjHysPonhOBSZBqfVN3MTU0I98qFxBZIohAwyQ=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB2885.namprd12.prod.outlook.com (2603:10b6:a03:13d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13; Thu, 30 Apr
 2020 17:17:20 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3860:a61:5aeb:a248%7]) with mapi id 15.20.2937.028; Thu, 30 Apr 2020
 17:17:19 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Peter Chen <peter.chen@nxp.com>, Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Topic: [PATCH 1/5] usb: gadget: Introduce usb_request->is_last field
Thread-Index: AQHWHOMiP7xQ0M6cVEqSUTmaHa412aiPbxIAgAFsnwCAADGbgIAAD8YAgACejwCAADEAgA==
Date:   Thu, 30 Apr 2020 17:17:19 +0000
Message-ID: <50b3168d-35b4-7a3a-5f54-eec5122e85ed@synopsys.com>
References: <Pine.LNX.4.44L0.2004301019550.27217-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004301019550.27217-100000@netrider.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 244231bf-2e19-40f9-3d01-08d7ed2a56fb
x-ms-traffictypediagnostic: BYAPR12MB2885:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2885E936B9424BDE2A2C43F3AAAA0@BYAPR12MB2885.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0389EDA07F
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(366004)(136003)(39860400002)(376002)(396003)(64756008)(8676002)(66446008)(76116006)(66556008)(66476007)(66946007)(71200400001)(8936002)(26005)(36756003)(2616005)(6506007)(107886003)(2906002)(6512007)(6486002)(5660300002)(316002)(186003)(86362001)(4326008)(478600001)(54906003)(31696002)(110136005)(31686004);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aTTPQSA49biix24yc7GBNfCOFiLWPMnk1EaKnkQyW+Cpl3JrxFgn8GpMIpC0ha6FwJ4ihxhELrPrzNsux/e2XRr7Kv4wDNYR68n5RrOw/o0BDs/S38povNMH3xmG/qQNnfW3+jpSp503Nwp24By7wMl+ji2iuwQbWl445brPqrcLx3j7GA2Dx5v7zFvaFx8DXo4Aa7ufu5ygG3se+L0ZiQd+BGUmrSKMSdfmQO7lBPYxyJL3gePiTDetQ6+E1H5JJ5SMEitoPeE131IXLj0Ck7+bguFSnSvzsmDtuWCuj0m8lLuhFCsXsE/JJcvREojBl4qWYMe0/i1ovaWlcGQbdjMp44houMR36SC4t7y17vGJ3/f6/cs9Igg1ECJLZrb6j4gGZQj+sG6BEg/ocSVILezul9Ap5ccroiWHkS1Z4CN1B7nRe25CIhHJj+vG+NKY
x-ms-exchange-antispam-messagedata: uiyw4+XmMaRzGxuEmNkcsVipBXPwqobgSbZolpicZ86nCBYLiYiTaGyD6gaXRMwCJo4GldpewqDnXXfyXGSmwDUFv/8Tef/iWwQkD/XwJX7IasyXgSrNenmoV/oSUbCdrG0RsLj5IlOcR6RpcgbtFdIl7Ve/4ZjFP/qYlLzeIvcn2k2YVwV7o+SHaET+gK/zH3xk5ngXFVGJl5hkYPfy102wA3Qepjy+BbRHAz8g7GFZyCtAE4VT4nN/nvyI/lgcyfe3Z+Ns742qQzxt09flGT7o2nTXHxOcTEcGhvAMEpiOkysjrIRNa1hjqV3FUAz4tFZFBjRSn445BMlQhGhDmSvJO4Xd98tbiIgzw6KDikuElTHusxBwFFvTanRvjWUQ/TCkk2Dgx8k7UKv25j0vZjpGirpaSi8XWnwKwj4/8ZMz+ycWRGDHWAoAVU85mrU0t/H5Rw5PAl/+58tKxFsF2Z0Sm6bQydOhN9R6C+tOzZf1TfnVyyccqNkFeqCdHfu8k/kBQdhFVb2mtYUJ9ywz1KK1n18VBH49L4GvU0KYd8g9K2MJ5BCvjXVNdjnXwa1KfpTo46fcJg0zSOuEOPz4mllad/6BELzqlWjvNr/Qi7VGkom7EiacQlyHdtrRe0GmtZUUH2esc+Bqt1WBZM7H1RyQrAKBAjTw5tlarj53Pyc6h2tRD6G1k7F0VwmAqOEq+q8v1Wq87kTeuPNAybwloR2jB3G4iM7YL6+VQyTxLWT8TbEnChH0NCDfoG/j5T1owDJyRUfZbBrkYkFZfNuUSasjrwrCefcgGHVTrbLHeDM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF05305977495D4A9374EBDF65C44185@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 244231bf-2e19-40f9-3d01-08d7ed2a56fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2020 17:17:19.9629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EayGbP0UdtMxW32VfP0/5WjkI1tRhGmd00GIzI6UwuiompyMuT+mnE12Zkto+khmbbRqXy6wpsxM6FRX965CZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2885
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgMzAgQXByIDIwMjAsIFRoaW5oIE5n
dXllbiB3cm90ZToNCj4NCj4+IFBldGVyIENoZW4gd3JvdGU6DQo+Pj4gSWYgJ3RyYW5zZmVyIHNp
emUnIGhlcmUgaXMgc29mdHdhcmUgY29uY2VwdCwgd2h5IGNvbnRyb2xsZXIgbmVlZHMgdG8ga25v
dz8gVGhlIGdlbmVyYWwNCj4+PiBjb250cm9sbGVyIGludGVybmFsIGxvZ2ljIGRvZXNuJ3QgY2Fy
ZSBjbGFzcyBwcm90b2NvbCwgaXQgb25seSBjYXJlcyBUUkIgY2hhaW4gc29mdHdhcmUgcHJlcGFy
ZXMuDQo+PiBXaGlsZSBzb21lIGNvbnRyb2xsZXJzIGRvbid0IGhhdmUgdGhlIGNvbmNlcHQgb2Yg
dGhpcywgRFdDX3VzYjN4IGRvZXMuDQo+PiBJdCBoYXMgYSBub3Rpb24gb2Ygc3RhcnRpbmcgYW5k
IGVuZGluZyBhIHRyYW5zZmVyLiBXaGlsZSBhIHRyYW5zZmVyIGlzDQo+PiBzdGFydGVkLCB0aGUg
ZW5kcG9pbnQgdXNlcyBhIHJlc291cmNlLiBJdCByZWxlYXNlcyB0aGF0IHJlc291cmNlIHdoZW4N
Cj4+IHRoZSB0cmFuc2ZlciBjb21wbGV0ZXMuIFNvIGZhciwgZHdjMyBpbXBsZW1lbnRlZCBpbiBz
dWNoIGEgd2F5IHRoYXQgYnVsaw0KPj4gdHJhbnNmZXJzIGFyZSBhbHdheXMgaW4tcHJvZ3Jlc3Mg
YW5kIGRvbid0IGNvbXBsZXRlLiBUaGF0J3MgZmluZSBzbyBmYXIsDQo+PiBidXQgaXQncyBub3Qg
dGhlIGNhc2Ugd2l0aCBzdHJlYW1zLg0KPiBUaGlzIGlzIHBlY3VsaWFyLiAgSSBoYXZlbid0IGhl
YXJkIG9mIGFueSBvdGhlciBjb250cm9sbGVyIGRvaW5nIHRoaXMuDQo+DQo+IFdoYXQgZG9lcyB0
aGUgY29udHJvbGxlciB1c2UgdGhpcyByZXNvdXJjZSBmb3I/ICBXb3VsZCBhbnl0aGluZyBnbw0K
PiB3cm9uZyBpZiB5b3UgdG9sZCB0aGUgY29udHJvbGxlciB0aGF0IGVhY2ggdHJhbnNmZXIgd2Fz
IGEgc2luZ2xlDQo+IHVzYl9yZXF1ZXN0Pw0KDQpJdCdzIG5vIHByb2JsZW0uIEVhY2ggdHJhbnNm
ZXIgY2FuIGJlIGEgc2luZ2xlIHJlcXVlc3QuIEp1c3Qgc2V0IHRoZSANCnJlcXVlc3QtPmlzX2xh
c3QuIChSZWZlciB0byBbcGF0Y2ggMi81XSBmb3IgZl90Y20pLg0KDQpUaGUgaXNzdWUgaGVyZSBp
cyB0aGF0IHRoZSBjb250cm9sbGVyIG5lZWRzIHRvIGtub3cgd2hlbiBhIHN0cmVhbSANCmNvbXBs
ZXRlcyBzbyBpdCBjYW4gc3RhcnQgb24gYSBkaWZmZXJlbnQgc3RyZWFtLiBJbiB0aGUgY29udHJv
bGxlciANCmRyaXZlciwgdGhpcyBpcyBkb25lIGJ5IHNldHRpbmcgYSBjZXJ0YWluIGNvbnRyb2wg
Yml0IGluIHRoZSBUUkIgDQppbmRpY2F0aW5nIHRoZSBsYXN0IFRSQiBvZiBhIHRyYW5zZmVyLiBU
aGlzIGtub3dsZWRnZSBjYW4gb25seSBjb21lIGZyb20gDQp0aGUgZnVuY3Rpb24gZHJpdmVyLCB3
aGljaCBpcyB3aHkgd2UgbmVlZCB0aGlzICJpc19sYXN0IiBmaWVsZC4NCg0KQlIsDQpUaGluaA0K
