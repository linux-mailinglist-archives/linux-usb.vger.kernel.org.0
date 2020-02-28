Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA2217336F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2020 10:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgB1JBd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Feb 2020 04:01:33 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:56330 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726476AbgB1JBd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Feb 2020 04:01:33 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BFF7D43B2F;
        Fri, 28 Feb 2020 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1582880492; bh=WgH3kMAhl64jigrPdYG2prvkhMnDhPX7KwFIB/HubIU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Je0xz7bO80HIgbOXJkIXMTn5SdAC23Zl5nLYBEeP6X0gYb0C+kJMZhLcqdMhGF0wn
         wr2qA00T54My9ddktlmE/imUpIVn5GGALxV2kVph5ldbBHULSXG0H1cSnrEULunShy
         dJyJrnCbMMYO/UV7r86aw80ygYhOrLnY3nrK1B8vxl0q7R2g0JAeLmqjeVnpnGa/sj
         xOQn90vUX8oZYvP5To1LTQ+WnHoc0ICjEaeXjbT20d8BW1bc2YNQ8Tumw/UIdrYMy+
         maMK5AWLtFk9P3YUj7t0zMk201Me32EwK1ME8uff+ht/TPaaZAfNTDrwxlpfh+nznE
         4WMJ/wxdkN4NA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 87E82A0079;
        Fri, 28 Feb 2020 09:01:27 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 28 Feb 2020 01:01:27 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 28 Feb 2020 01:01:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Umu2Eq9A3DOm4239y+PYJ97maF3OCdiwp8ivYyZo8PhGyJnEUjV2aPF6WbAR9wO3V54ibe0WQLw9Wyi24OwrJw3OquPdbHwU3w6BBvkkSE5NGT53Dud/pfnZle2QNzrrGumRC38z0pE+rapPdWM2HY0cQyfJ6mk95OoYoJdTaErSgehj3+xT4+jB01+dHd/pa3ocdpvdmxOIx36GF4SMd3tK1RyWpDHTcElmakIzoiX/p5MhTpk526cw4lZiTEXfW8HzYazh06ItSgakaT5gH7tVYTPMAsO6QH2rzdRIae0oUSCxfu0pxnvsZnTbqrIh6j/n2LT2rI+CDZoxA24T+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgH3kMAhl64jigrPdYG2prvkhMnDhPX7KwFIB/HubIU=;
 b=QkLJcAi1uOt9sqZx0ZWUxoVicd8WLaXFf2QNKM08ZJKjUMNJrkGUBGixdR7dONGyp0nsaSf9QPuEpaYoltDxgoip/u7KbutM4ssty9FVpVJqe/ioms2CrT0v0jBFCFBCMDNoaIEEqV4+1689Y953PsBv3QTahjAr0O4Vc64ngp+zdI+9IVqO7NQNgdGIId60o/n/77X/ufpICg3INPKV/vbSdrygarg2S0jO3mMGmofKIxLgVPf4W6s+91G9FyJ14URT7FXisd08tfxLWhXeJV4gxO8jA+JvAJcfgQbjfH44wcZpD95LHNNORV6Qstjv2KldHL0Lafm9NU2OUupvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgH3kMAhl64jigrPdYG2prvkhMnDhPX7KwFIB/HubIU=;
 b=LpycK9a7tptuuJ+cxY3YRKkBxLVIbAUyojsw6P2Z2BnNfS29NYIdEYzSbywDiG7oW+cdyiBEPt4dCtFa4FopbNEnjF8TZBQQkRE/Mq3xZXzo68thin26tWZEt2Hj/J2wa8DDx6YsLwZ/vsPgZXVhWfNKpxkfmvtUtciUKRQGONo=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (2603:10b6:208:198::11)
 by MN2PR12MB4221.namprd12.prod.outlook.com (2603:10b6:208:1d2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.16; Fri, 28 Feb
 2020 09:01:26 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::111c:5382:5a76:21cb]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::111c:5382:5a76:21cb%4]) with mapi id 15.20.2772.012; Fri, 28 Feb 2020
 09:01:25 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Otavio Salvador <otavio.salvador@ossystems.com.br>,
        Otavio Salvador <otavio@ossystems.com.br>
CC:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
Thread-Topic: USB DWC2 stops responding when insert/remove cable multiple
 times
Thread-Index: AQHV4zxylJsWeUZ0JUKEDMOhhpCodKgfGkgAgAA7cgCAAA+HAIAAbA0AgAKn7gCAAC2+gIABCQCAgABpVgCAASdLgIAAeQoAgAAARQCACqrrAA==
Date:   Fri, 28 Feb 2020 09:01:25 +0000
Message-ID: <665fe49e-ebfa-bcb0-fcd1-ea1e9252b306@synopsys.com>
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com>
 <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com>
 <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com>
 <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
 <beddbc55-fd22-96b7-c980-e4ea207a42f5@synopsys.com>
 <CAP9ODKq2nEHz_rbwwCv-94LSBOq0it2Kc4yhCqrLT-XxoXommg@mail.gmail.com>
 <1d2ee918-57e4-53b2-6953-0107d7720c59@synopsys.com>
 <CAP9ODKoS5KQrhTrUvahHEhQG-WA+bfLnP4tTFxzrQaGh1nTcZw@mail.gmail.com>
 <CAP9ODKoRuB-nyjr1ksGU61PVMjFTMMWKwgpHQ=e7bChAu5Okhg@mail.gmail.com>
In-Reply-To: <CAP9ODKoRuB-nyjr1ksGU61PVMjFTMMWKwgpHQ=e7bChAu5Okhg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c3ec7a1-02dd-4f36-e1ef-08d7bc2cca90
x-ms-traffictypediagnostic: MN2PR12MB4221:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB42215271867F841CB9D29E7BA7E80@MN2PR12MB4221.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(396003)(39860400002)(346002)(376002)(199004)(189003)(478600001)(6512007)(31696002)(4326008)(186003)(76116006)(2616005)(31686004)(6486002)(91956017)(66446008)(86362001)(66946007)(71200400001)(66556008)(64756008)(66476007)(6506007)(53546011)(8676002)(54906003)(110136005)(36756003)(8936002)(316002)(81156014)(81166006)(2906002)(5660300002)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4221;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7wsddcjBJ+D+6IElq8QlocAeLAJIsa2KtUDFc3UQkN/QNTYL94hZtOs/6l+GCV8Qlg79e6XUpbFgT1x9u1QgTmFM+3JmFWWPU2L851+cTJStJUqH2/9hjBXRpYp37RYWJ9xgHkErzstXq90YJ8hEhw18IzFGXuhZLE9dctq4JYSZ9Wr8LHj64QOe4YXkFIy++55S8WAD+F0egiJvVAL8Q3aF1+pYEvr7kP8fVIJ3Kn3LkwR68J7m3IBoCtvKeN4eVvTkSOm9qjAoE/8cD46+MP2Hq6goxqIoVxRr2yZ9iht/dRE7J5gyKjV2c/9wKgIHzd+IIYP4urzUeLk6OU79fM3yAh5xwHa8O9o4Xt69qgT7lWQNNVoah2Lsyi82y4n3V78gPZmJUBB4Qbcrox8MOkllrB/kjkJI3CQiwuqAbiRVjkIkw4nfpeS07r9rexUj
x-ms-exchange-antispam-messagedata: K9U2DCWzcqzEnpAX/uvwLS3EAC0JkskVRpb/7adF90bn5+pKkgqSNPGob9bBRMvJ3gjkkzuJapfKwe4L9FVa3Z2hjHFmyhP8YGTWmeQneQP4ac3Glj6SBgyhjdXr4X39H25e8N3YqkX5Ot6jSqN69Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC6672F8B8E35B4AB64A7C8A0F3DA21E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c3ec7a1-02dd-4f36-e1ef-08d7bc2cca90
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 09:01:25.7169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zmz30U3adeW77Z5ftUGSfvZKoBkuau9MKHHYsYW0c4x2QPYTQ4K3k17D4MxdqiScKoYkQzzVx8XM0fPD1bQZwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgT3RhdmlvLA0KDQpPbiAyLzIxLzIwMjAgNjowNyBQTSwgT3RhdmlvIFNhbHZhZG9yIHdyb3Rl
Og0KPiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAxMTowNiBBTSBPdGF2aW8gU2FsdmFkb3INCj4g
PG90YXZpb0Bvc3N5c3RlbXMuY29tLmJyPiB3cm90ZToNCj4+IE9uIEZyaSwgRmViIDIxLCAyMDIw
IGF0IDM6NTIgQU0gTWluYXMgSGFydXR5dW55YW4NCj4+IDxNaW5hcy5IYXJ1dHl1bnlhbkBzeW5v
cHN5cy5jb20+IHdyb3RlOg0KPj4+IE9uIDIvMjAvMjAyMCA1OjE2IFBNLCBPdGF2aW8gU2FsdmFk
b3Igd3JvdGU6DQo+Pj4+IEhlbGxvIE1pbmFzLA0KPj4+Pg0KPj4+PiBUaGFua3MgZm9yIGFsbCB5
b3VyIGhlbHAgb24gdGhpcywgLi4uDQo+Pj4+DQo+Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0
IDM6NTkgQU0gTWluYXMgSGFydXR5dW55YW4NCj4+Pj4gPE1pbmFzLkhhcnV0eXVueWFuQHN5bm9w
c3lzLmNvbT4gd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4gT24gMi8xOS8yMDIwIDc6MTAgUE0sIE90YXZp
byBTYWx2YWRvciB3cm90ZToNCj4+Pj4gLi4uDQo+Pj4+Pj4gV2hhdCBzZXF1ZW5jZSBkbyB5b3Ug
d2FudCB1cyB0byBkbz8NCj4+Pj4+DQo+Pj4gUGxlYXNlIHByb3ZpZGUgZHdjMiBkZWJ1ZyBsb2cg
d2hlbiBzdG9wIHdvcmtpbmcgd2l0aCBnX3NlcmlhbCBleGNlcHRpb24NCj4+PiBkdW1wIGluc2lk
ZS4NCj4+PiBBbHNvIHByb3ZpZGUgZHdjMiBsb2cgd2hlbiBpdCdzIHdvcmsgd2l0aG91dCBpc3N1
ZS4NCj4+DQo+PiBBdHRhY2hlZC4NCj4gDQpSZXZpZXdlZCBhbGwgbG9ncy4gTm90IGZvdW5kIGFu
eSBkd2MyIHJlbGF0ZWQgaXNzdWUuIE5vdCBhYmxlIHRvIA0KcmVwcm9kdWNlIG9uIG15IHNldHVw
LiBNeSBsb2cgb24gcm1tb2QgZ19zZXJpYWw6DQoNCls2ODc4NC44MTc3NzNdIGdfc2VyaWFsIGdh
ZGdldDogcmVzZXQgY29uZmlnDQpbNjg3ODQuODE3Nzc1XSBnX3NlcmlhbCBnYWRnZXQ6IGFjbSB0
dHlHUzAgZGVhY3RpdmF0ZWQNCls2ODc4NC44MTc3NzldIGR3YzIgZHdjMi4xLmF1dG86IGR3YzJf
aHNvdGdfZXBfZGlzYWJsZShlcCAwMDAwMDAwMDVlOWFlNDIwKQ0KWzY4Nzg0LjgxNzc4NF0gZHdj
MiBkd2MyLjEuYXV0bzogZHdjMl9oc290Z19lcF9kaXNhYmxlOiBEeEVQQ1RMPTB4MDgwODAyMDAN
Cls2ODc4NC44MTc3OTFdIGR3YzIgZHdjMi4xLmF1dG86IGR3YzJfaHNvdGdfZXBfZGlzYWJsZShl
cCAwMDAwMDAwMGU2NzMwZjJiKQ0KWzY4Nzg0LjgxNzc5Nl0gZHdjMiBkd2MyLjEuYXV0bzogZHdj
Ml9oc290Z19lcF9kaXNhYmxlOiBEeEVQQ1RMPTB4MDg4ODAyMDANCls2ODc4NC44MTc4MDVdIGR3
YzIgZHdjMi4xLmF1dG86IGR3YzJfaHNvdGdfZXBfZGlzYWJsZShlcCAwMDAwMDAwMGNlZjA1ZTli
KQ0KWzY4Nzg0LjgxNzgwOV0gZHdjMiBkd2MyLjEuYXV0bzogZHdjMl9oc290Z19lcF9kaXNhYmxl
OiBEeEVQQ1RMPTB4MDg0YzAwMGENCls2ODc4NC44MTc4MjBdIGdfc2VyaWFsIGdhZGdldDogYWNt
IHR0eUdTMCBkZWFjdGl2YXRlZA0KWzY4Nzg0LjgxNzg5NF0gdXNiIDUtNDogVVNCIGRpc2Nvbm5l
Y3QsIGRldmljZSBudW1iZXIgNg0KWzY4Nzg0LjgxNzk3NV0gZHdjMiBkd2MyLjEuYXV0bzogZHdj
Ml9oc290Z19lcF9kaXNhYmxlKGVwIDAwMDAwMDAwZTY3MzBmMmIpDQpbNjg3ODQuODE3OTgwXSBk
d2MyIGR3YzIuMS5hdXRvOiBkd2MyX2hzb3RnX2VwX2Rpc2FibGU6IER4RVBDVEw9MHgwODhhMDIw
MA0KDQpQYXkgYXR0ZW50aW9uIGdfc2VyaWFsIHR3aWNlIHBlcmZvcm1pbmcgdHR5U0cwIGRlYWN0
aXZhdGlvbi4NCkluIG15IHNldHVwIHNlY29uZCBkZWFjdGl2YXRpb24gcGFzc2VkIE9rLCBidXQg
aW4geW91ciBjYXNlIGV4Y2VwdGlvbiANCmJhY2sgdHJhY2UgcHJpbnQgb3V0IHdpdGggTlVMTCBw
b2ludGVyIGRlLXJlZmVyZW5jZSBvbiBzcGluX2xvY2tfaXJxLiANCkNvdWxkIHlvdSBwbGVhc2Ug
YWRkIGRlYnVnIHByaW50IGJlZm9yZSBzcGluX2xvY2tfaXJxKCkgaW4gZnVuY3Rpb24gDQpnc19j
bG9zZSgpIGluIGZpbGUgdV9zZXJpYWwuYyB0byBjaGVjayB0dHksIHR0eS0+ZHJpdmVyX2RhdGEu
IEFyZSB0aGVzZSANCnZhcnMgTlVMTCBvciBuby4NCkp1c3Qgcm1tb2QgZ19zZXJpYWwgY2FzZSBm
dWxseSBlbm91Z2guDQoNClRoYW5rcywNCk1pbmFzDQoNCj4gRm9yZ290IHRvIGF0dGFjaCB0aGUg
ZmlsZXMuDQo+IA0K
