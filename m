Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4C7511D91D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2019 23:12:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731306AbfLLWMf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 17:12:35 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:56602 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730811AbfLLWMf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 17:12:35 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E52FC00CC;
        Thu, 12 Dec 2019 22:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576188754; bh=yYUYTXOINK9phNM7u1xCwtS8aMe3dosRZ+75ji6Skfw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=QGa3r4Oyj8I9yi+uAVKoQXo/YM2jpk1Yse+VzSCUgTzuksDAmSqd62hxuMzHxLhkg
         yJC1TqYonxe9JKwmD2Biu8PUVxjvTQcKGujb+M8k6NJyDHvlZd+eZn178ZOKYXWebv
         VFdz+D/1LUHyTCYjQar/uau1T8mVQPWBEuUb+lvOa4mcRaBo2q+WPMIOau3jPeQGD8
         GiABBcK4xD659fR1xTnnki72R0WUiAFSmnlw7Y4UiycogFvFIcXnhiHIITd34OUGIM
         8nz4hAPBSkjv1N05q7sxX4HtQWa7Zv98Qo0qVrRFCbO1L92ftPM6GSO5dkvrnQ1iU9
         +x83mUIF4I3Ng==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id EFC83A00D5;
        Thu, 12 Dec 2019 22:12:33 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 12 Dec 2019 14:12:24 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 12 Dec 2019 14:12:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cWb96kOWQoNN/jrUgjWQPO1QNsueaL96ZBchBr6OTEGVaUBbSqi+E1eOGxzjCLQf2jq7xFS+x1OxgsXvOeFsr3rLH6KlxaEM4KSyNz4SpDG9wnHFfebNaFgjd5tCHe30a20i1sBaHBYjvJkd1ocIAHY8UnufW0664o2OmiXrGfQmBumQpksAn6jKqD1g2KZIC75cf1JcuG4MWD3wOU49scEWX+u/fR41KXVdEnIervg3AmIE3P7dxoc1JWt36v6u8qdzDtziAZN8skPtJPbK18TD7mpvBIJd7TayJbbsgvlOwv+ZK+Omntes9jGDXbtQu/oItH4vCv9z7He9t05khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYUYTXOINK9phNM7u1xCwtS8aMe3dosRZ+75ji6Skfw=;
 b=UVwcSOP+ImYbHlwEDORuKD2kYlvdjHsTLMPPWLjOepDKczAKa+cVEAVsn0apDvZx9y4bzkhmqz2YhxNm3Cy46GHsLCf9zAl3pcGk3+sDxtDzNswqo5k+1BaKnilundLPXtqJ804EEnkcQNFshzVzIBpM6XyWC8TD48U91jY9ViVaTnpS88wy20v9m+PMEYTJX3wN/xhqEa0O1SMsdhJdcTe+pEmBGhpeJr82XG/0yOlgXesxS5jomMGkI+laBhYPcH3PpaqNxGq5dss5GKTDtvOJWnhd8yA49FvyolEY73Q+WBnd9WcnKER2iAV/VC6eSY60vQkZ1beBCb/QIHn0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yYUYTXOINK9phNM7u1xCwtS8aMe3dosRZ+75ji6Skfw=;
 b=U2vO/4AUw/Zy4yWWJ7dtFo8oW9k3aFbcvWkNA27to8dq+5Ks++Q5yBne0O7EUHcae7NRC1wHZ3J+GY056eqO5tZAGra5tbRMNki3cPrTbOSf3PISlbl6a9xNcdLMF4wUg0Ko1bLbiPUg9MgSUeo2FJb0/hfPz4VK+WXHEpjAnf4=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB2518.namprd12.prod.outlook.com (10.172.119.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Thu, 12 Dec 2019 22:12:23 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 22:12:22 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 05/14] usb: dwc3: Update IP checks to support
 DWC_usb32
Thread-Topic: [RFC PATCH 05/14] usb: dwc3: Update IP checks to support
 DWC_usb32
Thread-Index: AQHVsJbehfYTDuewcEGQhYLNY0JB3qe2JKsAgADsmwA=
Date:   Thu, 12 Dec 2019 22:12:22 +0000
Message-ID: <c32d6ba1-2764-5f8e-017f-cefb55dfc8e0@synopsys.com>
References: <cover.1576118671.git.thinhn@synopsys.com>
 <a9781ccc256bdd59550e4847144424f18da67eb0.1576118671.git.thinhn@synopsys.com>
 <87y2vivuib.fsf@kernel.org>
In-Reply-To: <87y2vivuib.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd88bffb-66be-47da-89cf-08d77f505cf4
x-ms-traffictypediagnostic: CY4PR1201MB2518:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB25185027282B6EDA4210E6B0AA550@CY4PR1201MB2518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(110136005)(316002)(107886003)(2906002)(4326008)(6512007)(15650500001)(5660300002)(86362001)(6486002)(6506007)(2616005)(186003)(66946007)(31686004)(31696002)(76116006)(26005)(4744005)(64756008)(66446008)(36756003)(66556008)(81156014)(8676002)(71200400001)(81166006)(478600001)(8936002)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB2518;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W/xICEeQ65b+Q4LUB3wdNyNokIvvzh11VZ/+fRCr2RQz0Xl1Qi6c0S3cWbI8dNFlpVo+1groLJyQFP6yi5YUeT+RgZawlXWWa7PoFANTpXOkNTcrwYimb/ZrQMXW0ajo9KUlXE42Uy2Hlfu4guZvViK2eR+UucBhWGVwktHcBenROZPF7sPaU7EWQClTMibunD1DYP5W02/zYDyItVPmpp94t5JOw4iYLk2FU4LFK5FGKpyDLMzmygLnAi8H8Ko/oCdanOnCKQq0R/8nxa9537e2Mra7IFSOPsjE2uQaK2b6VtD9FGzubK9Yz63rl+TQhKap9GCidcpA5Rs7STJ2T0y44YvXhpDzC4qDmh9gS7u38TXT79Lu/JL72SLTKQ9o9i8XaIqX9CGXSTh1BHTVwQDmDsEM8im+DytNpiZ47Yw0HjEvECMYHAxxQ43Mt9hd
Content-Type: text/plain; charset="utf-8"
Content-ID: <339A245E362C9D49A71C77724234E3EF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fd88bffb-66be-47da-89cf-08d77f505cf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 22:12:22.7436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nzlPys7NwMARG3yDrZ3YHDladG6Gw2H0HrToDS8aJ2gz7t0RoA0ZXKnekGxayA05HXmXEmPNhjtx5kF2ocWfOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2518
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4gQEAgLTEwMDksNyArMTAxMSw3IEBA
IHN0YXRpYyBpbnQgZHdjM19jb3JlX2luaXQoc3RydWN0IGR3YzMgKmR3YykNCj4+ICAgCSAqIHRo
ZSBEV0NfdXNiMyBjb250cm9sbGVyLiBJdCBpcyBOT1QgYXZhaWxhYmxlIGluIHRoZQ0KPiBwZXJo
YXBzIHVwZGF0ZSB0aGUgY29tbWVudCBoZXJlPyAiSXQgaXMgYXZhaWxhYmxlIE9OTFkgaW4gdGhl
IERXQ191c2IzMA0KPiBjb250cm9sbGVyIi4NCg0KQWguLiBJIG1pc3NlZCB0aGF0Lg0KDQpUaGFu
a3MsDQpUaGluaA0KDQo=
