Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F0F11A157
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 03:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbfLKC3G (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 21:29:06 -0500
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]:33272 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727286AbfLKC3F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 21:29:05 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D0B3EC0BBA;
        Wed, 11 Dec 2019 02:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576031344; bh=yE08wOINj6G+myyFUVV0hooi2nnRx5HcE5mxHvQ4BHs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Xq/pmknYIfmfnPrB/itqML5bO+BfAZuYLz2cHnMzSp2F0XBWEhpuS+OISjxea7SCq
         DLUK/nlM70dZb1cnQquQNIpUqcrrcTdv29Ivp8bd6PZ5HNz4J3AWKBVApHWegGB57C
         2NVu+oAQz2F9sQkMwF9GCo0/1unWz+mq2rbhFfuzmBDTSBO7eTHnRLap0PSIa+y99q
         wHK37TSxjWmKEabTsOLUjoW+AsEasTeie0ZhYtbwGh3vWcGTKEoq3ZFYMl8ZO5y1XR
         o4WDIYi0R4PgD8V4TeRu1IeANbuSNqdeRpwLOhrEvNmhUGA0OPlMqJm3C+oXmA1QX5
         FraQ+fm78wAUw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 62699A0083;
        Wed, 11 Dec 2019 02:29:04 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Dec 2019 18:28:47 -0800
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 10 Dec 2019 18:28:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ee/QJAQOgXn4urduWcI3rp6XqJWFCcNprkpI7WcflJrZqqvNSfazPSeXfJYu2YEtf/pf4un06ZLVQsky0MveIxJQykY00Nsag07fNvXEi/IJ+CkyYs+S2nUIS45MORkzEZBbarPLYZI54zpcb8tdK6dJHbfj33ZIuuW0KCYvpgspeoognrx7SjBpFtLXf2CnSdO6PXSYTGfNp21EAa6Uv5JTp7k2KJp5bG3rG+jq0AXii2+TVdpYXu7h3IVbLXf/k+8D/wa92WroDMo99+OupIJqa0kn376UCxMsW4diIDaverNKBQpp2udvrCxtJhkAOo24trW/2qLkPxNw+jnjXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yE08wOINj6G+myyFUVV0hooi2nnRx5HcE5mxHvQ4BHs=;
 b=OwatKao6goZKq4ifaKdssxHqjuxTGV6RiWT+Elbv6SvxY30VvKq57sF1PwfAWPxQ+h5WUziMfx91Mve8NsqEtakU9/yzb7JjBr0Sj88PKIiVGxVq/0Lu1LRTa8uKWjoEmqBMkWMamiLzG7yqIaJSK7J/Bv32vGBT1UIMXv+ssDNgxgGnG9uqmtpKx97MSXoxkZqAorU/ab7uNFOU4orLNMcRdtq/8sgVdBiGJ/nPWzJ3Ka4C1uf+U4uCwLFKWQ5QjzZyUUv7x/235o2fpTYOujmlIjhXopiVCdHVEsex5K2bMsrppgKqjLIlvoxc25ZRmaXcuLnXO2ThZQOC+pQbMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yE08wOINj6G+myyFUVV0hooi2nnRx5HcE5mxHvQ4BHs=;
 b=nIrzKajGwARuw2jdqVskBUKplzVdY4diVGdXAx+N8tY3WtAgX0kmeGrcKZkTSX1Bj9YkdCPOCJy3RWbkFsjwwWsHsJUJszr6331cI+qRAzvv17UdWHZ5plqfuxUTu94nsoUrsy0zzkbQ+OsCoQrztyjFUzlr35EFkL1D4OIoDH8=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0102.namprd12.prod.outlook.com (10.172.77.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Wed, 11 Dec 2019 02:28:45 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::5d88:202f:2fff:24b4%8]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 02:28:45 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Do link recovery for SS and SSP
Thread-Topic: [PATCH] usb: dwc3: gadget: Do link recovery for SS and SSP
Thread-Index: AQHVpXG18gLfSHAEhkarUDxRuoz5z6ezZzYAgADjUQA=
Date:   Wed, 11 Dec 2019 02:28:45 +0000
Message-ID: <eeb3e0e0-005a-724d-c2e8-eb42bd09dc3d@synopsys.com>
References: <d120fc57ba8836df3f1dc597335499e2233aef53.1574893374.git.thinhn@synopsys.com>
 <87zhg0jq6r.fsf@gmail.com>
In-Reply-To: <87zhg0jq6r.fsf@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e35d4d5-0a6f-4d58-96fa-08d77de1d8f5
x-ms-traffictypediagnostic: CY4PR1201MB0102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0102B0174545C76037C32EDFAA5A0@CY4PR1201MB0102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39860400002)(396003)(346002)(136003)(366004)(376002)(189003)(199004)(316002)(31686004)(2616005)(26005)(36756003)(86362001)(110136005)(186003)(6506007)(2906002)(478600001)(4326008)(107886003)(6512007)(66446008)(64756008)(66476007)(4744005)(81166006)(8676002)(8936002)(6486002)(5660300002)(66946007)(71200400001)(31696002)(81156014)(66556008)(76116006);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0102;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xfAnVIKHkAJJyBC28Fj9lxly4C0wDILLb1i8y3JdM02VOEg5z2hro7C59im5tAD0oeToGblYzBnxDZPaoE/nlB2K+5zfR+MCA8Lcm9GvKqO4UBG6ZFUX6AqWKgiAh49gBw1oTXJDsKit2Ns5Z+FJiEb9Hawn04yEYgjDtW/384eNkd1T692tpujFNV52oNAPJMjpVM7KffOHUtM92bkfmsYsm0kF7KbzZ/SePVJH4oEw4GkrP//BoaJD4Iki2CvnuoB/26H+fnJ0PAZjcRMlOLZgITBG+ViUHUUW7VjOI/1XpedjOGk89IsFHKWHkn9QsB9HIFtNMKSP/ylZbB96FMSzUI4S+qJg/OmTRVa5w6zUgM/Ey1UuW+qSxnlqlnCXVI26r5BZLGTyuB2UBB7T62t3kKnZ1g7Xj9Dmv3aOTE9gS+/+7VOq+f3+2/7DMqtX
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB84444AE5B07E4FAE966BE76A7B312B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e35d4d5-0a6f-4d58-96fa-08d77de1d8f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 02:28:45.5112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CCyDVa53/3PFDSGphGRtZx5ah1fhzzmDvdLviTXbVar5P1naI3XfxvpEoHvDtWQY7U4ES/Gf+aQDYo9Lq4ddQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0102
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBUaGluaCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5
cy5jb20+IHdyaXRlczoNCj4NCj4+IFRoZSBjb250cm9sbGVyIGFsd2F5cyBzdXBwb3J0cyBsaW5r
IHJlY292ZXJ5IGZvciBkZXZpY2UgaW4gU1MgYW5kIFNTUC4NCj4+IFJlbW92ZSB0aGUgc3BlZWQg
bGltaXQgY2hlY2suIEFsc28sIHdoZW4gdGhlIGRldmljZSBpcyBpbiBSRVNVTUUgb3INCj4+IFJF
U0VUIHN0YXRlLCBpdCBtZWFucyB0aGUgY29udHJvbGxlciByZWNlaXZlZCB0aGUgcmVzdW1lL3Jl
c2V0IHJlcXVlc3QuDQo+PiBUaGUgZHJpdmVyIG11c3Qgc2VuZCB0aGUgbGluayByZWNvdmVyeSB0
byBhY2tub3dsZWRnZSB0aGUgcmVxdWVzdC4gVGhleQ0KPj4gYXJlIHZhbGlkIHN0YXRlcyBmb3Ig
dGhlIGRyaXZlciB0byBzZW5kIGxpbmsgcmVjb3ZlcnkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPiBDYXJlIHRvIGFkZCBhIEZpeGVz
IHRhZz8NCj4NCg0KU3VyZS4gSSBqdXN0IHJlc2VudCBpdC4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
