Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D931860CF
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 01:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgCPAdF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 20:33:05 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42752 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729228AbgCPAdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 20:33:05 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 95377C04DA;
        Mon, 16 Mar 2020 00:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584318784; bh=G0Q46WBS4aR/RBEETqPsE/xP3Lu99XSLIrHYwtAhE3o=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hn+n248fEpGHZRq5ZVMelYnbj1JPWt2jatdxHAJ/zPormO8SBi+KrVl7e8lVfcagj
         GvQkv6B9WHIfKkiOthD06Ys2bA/S6Uk1V8GtuOq98yBJB/SfF+y7woqIH4aehAf+Bx
         Hm37X/XWXNghYHciKKbJi+VfJsl42HTuUaYhCzdwJHQ8OjxiL6byco+QkKOXKtzfHt
         e4qmpmxpvhAZ7/VHPC/7notkKrX0CPUaPz2AmSofLx/iykCCMnEw19wIBm4DGik82g
         J0NCrxQ2c5bGRCSChrCIfYt7JWMRSsDGpDfERSz11TLUSqB/GNeZErG4h4r5WbklEj
         Q4ZCVna5s9VNA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id C15B0A006B;
        Mon, 16 Mar 2020 00:33:02 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 15 Mar 2020 17:33:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 15 Mar 2020 17:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLtg4WwyuBKn5tciDmfdP6JQ/mWLXzlXIvygcwjoNCftom7eQ/0D9a6NxnJlcQdWtjONAkEoD+9ANP61oTveDGesZzDJgbnpbn169ifwlQEjnqFVQRzK29AqjqduVsTj/jUZaX1XY1TZEDwz0BBlBxRx6UboJyekxQqG2vQQJibvrv0Ev6pRTyK6KZYYMM5/odJvv/Cvn38QewC3dxNSWt4LKFxUrGDdxWZ+xeomwLgfvQsGmTvo8t3HyDVgF0/nruHUymbk0G2piTufugHr6JBq2IsVsR45l5QH2AQaEzqGgcCLP5yX3UUelvqCXpZzeh2yswZ7GYIHjq7gxL45kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0Q46WBS4aR/RBEETqPsE/xP3Lu99XSLIrHYwtAhE3o=;
 b=C6bfN9Xop8R49grpZrf0SoW4yDXb24JM83677mYT5hLMychtrvROEP5TbBIYI+JKaL6fnc2lwl2QAByN6leN1pVgiR4doT9WLytJeizxO5oK9g8w4bUm9hMkVpUseQhTy9Lv/x9gyVim+ONS1OPEb1FOM4q1yeekdUUrGZNY+0AjRQo+RCjOq49b6aEphPvylt6ZEmId5/RS/dtJpe1pPeRgkR++WeTQUSHWpqlLFtUn5K+F/zOfdaqZbBAijHuAtn5g6AYVV/PqFNZ5Sm9WIs6bo6KtrlBtJwSPOTAHW/Pee7Og+tZ4Jc4zKSWmw6XorlUCnx0pm4s4E07FVZa/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0Q46WBS4aR/RBEETqPsE/xP3Lu99XSLIrHYwtAhE3o=;
 b=g7wfgcxt0onzLGCCnlN60Ky4T4JXfoiZdE+MsnQ8r5/SOt5LgzMH6DyttH8GruqYaLzQW3sTWZBubMRjbRlUI8jgQm87tzLNkx65QDiEmJ2VXoDZCiaHV6qJLskSMNWoFF2pj8b+Fr6PARbdl7KziP/kfSSs5CKckVaWQy0wxJM=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2728.namprd12.prod.outlook.com (2603:10b6:a03:61::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Mon, 16 Mar
 2020 00:33:01 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 00:33:00 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed
 kick_transfer
Thread-Topic: [PATCH 1/3] usb: dwc3: gadget: Properly handle failed
 kick_transfer
Thread-Index: AQHV+N3BzBLybznwZ0OCZe4JISGATKhGk1EAgABcM4CAAmujgIABCAEA
Date:   Mon, 16 Mar 2020 00:33:00 +0000
Message-ID: <08f67bc3-2941-28a2-f1fb-0a3ebdab8559@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com>
 <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com>
 <874kusgwuz.fsf@kernel.org>
 <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com>
 <87o8syf1h6.fsf@kernel.org>
In-Reply-To: <87o8syf1h6.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b435cc9-ab4d-42e2-0ce0-08d7c9419531
x-ms-traffictypediagnostic: BYAPR12MB2728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2728048430FE244E56F2859DAAF90@BYAPR12MB2728.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(39850400004)(396003)(366004)(346002)(136003)(199004)(478600001)(36756003)(81166006)(81156014)(8676002)(31686004)(26005)(186003)(6486002)(4326008)(8936002)(5660300002)(107886003)(6512007)(2616005)(71200400001)(110136005)(64756008)(86362001)(6506007)(31696002)(66556008)(76116006)(66446008)(66946007)(316002)(66476007)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB2728;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kxEeo2eor93q4Jz32RAWOiwr1hQCJhaLFYC1tgQmsNFFvd7f0qfVrqSI7EbmASWQpmmMvomUgUHLldzv+dH29l/AXx8m9i2f/Z3TUHofBspBhhGOsvB/E5hUGuPnQB4/8L4YFgWjy1QD1fT3TOXoLozYic/n2Ngjz1RzVoYorysH4X3/jWG74LwK+/Dam8Lmr1YSIOqEZ65M6DGMQiGXjjMEL3/h77HYZzqHiWr9ol1mCDxZQtQae2Ij79RBE6YDoplVzJ5ST5ahLpD5/vhh4rjB+gv0NJScPtwups7RCSbsFQlpvOArCVXm1f+DyorsO/fTPT02v88uWPgpP38qLZVOwbPPq1C6Lu94lzPDiNPJyBW+PdQH4D4P6DfBnP/vtxw7p3Nzb43fsQSvB8HXtH3sy3mOE7a2ErLNmvP/StCgPvOiBbCVSkbnxMdZBUN3
x-ms-exchange-antispam-messagedata: 8VcUNfTMlEgd+0sfTF0Vh97tj+AQ4XIcd6uoh3PjFK1Czi8ORz52Ljdc2QWoJQyIP6ZwNlCgNfGLI0lU9VLKA7CBHb3lwNoa5EOcpbyYE78g/3TSh4hKyfb6wIsODhndnJbjqiOOuZOSp+AVIUIQ2Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEBC213A38C6634A911AB10A1F70236A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b435cc9-ab4d-42e2-0ce0-08d7c9419531
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 00:33:00.7122
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bpo5R4CI5IVgMQweN4UXxCsFPYdgSk9I3jpzbCZTxog4iPXn2QZHcP8MDODZX7rfXuiIhm/WE4ziRgkoLEtvqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2728
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+PiBJZiBkd2MzIGZhaWxzIHRvIGlzc3Vl
IFNUQVJUX1RSQU5TRkVSL1VQREFURV9UUkFOU0ZFUiBjb21tYW5kLCB0aGVuIHdlDQo+Pj4+IHNo
b3VsZCBwcm9wZXJseSBlbmQgYW4gYWN0aXZlIHRyYW5zZmVyIGFuZCBnaXZlIGJhY2sgYWxsIHRo
ZSBzdGFydGVkDQo+Pj4+IHJlcXVlc3RzLiBIb3dldmVyIGlmIGl0J3MgZm9yIGFuIGlzb2MgZW5k
cG9pbnQsIHRoZSBmYWlsdXJlIG1heWJlIGR1ZSB0bw0KPj4+PiBidXMtZXhwaXJ5IHN0YXR1cy4g
SW4gdGhpcyBjYXNlLCBkb24ndCBnaXZlIGJhY2sgdGhlIHJlcXVlc3RzIGFuZCB3YWl0DQo+Pj4+
IGZvciB0aGUgbmV4dCByZXRyeS4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDcyMjQ2ZGE0MGYzNyAoInVz
YjogSW50cm9kdWNlIERlc2lnbldhcmUgVVNCMyBEUkQgRHJpdmVyIikNCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPj4+IGNvdWxkIHlvdSBn
aXZlIHNvbWUgZGV0YWlscyByZWdhcmRpbmcgd2hlbiBkb2VzIHRoaXMgaGFwcGVuPw0KPj4+DQo+
PiBTbywgaGVyZSBhcmUgdGhlIHNjZW5hcmlvcyBpbiB3aGljaCBkd2MzX3NlbmRfZ2FkZ2V0X2Vw
X2NtZCgpIG1heSByZXR1cm4NCj4+IGEgbmVnYXRpdmUgZXJybm86DQo+Pg0KPj4gKiAtRUFHQUlO
OiBJc29jIGJ1cy1leHBpcnkgc3RhdHVzDQo+PiAgIMKgwqAgQXMgeW91IGFscmVhZHkga25vdywg
dGhpcyBvY2N1cnMgd2hlbiB3ZSB0cnkgdG8gc2NoZWR1bGUgaXNvYyB0b28NCj4+IGxhdGUuIElm
IHdlJ3JlIGdvaW5nIHRvIHJldHJ5IHRoZSByZXF1ZXN0LCBkb24ndCB1bm1hcCBpdC4NCj4gcmln
aHQNCj4NCj4+ICogLUVJTlZBTDogTm8gcmVzb3VyY2UgZHVlIHRvIGlzc3VpbmcgU1RBUlRfVFJB
TlNGRVIgdG8gYW4gYWxyZWFkeQ0KPj4gc3RhcnRlZCBlbmRwb2ludA0KPj4gICDCoMKgIFRoaXMg
aGFwcGVucyBnZW5lcmFsbHkgYmVjYXVzZSBvZiBTVyBwcm9ncmFtbWluZyBlcnJvcg0KPiBTb3Vu
ZHMgbGlrZSB0aGlzIHNob3VsZCBiZSBmaXhlZCBzZXBhcmF0ZWx5IGFuZCwgcHJvYmFibHksIHdl
IHNob3VsZCBhZGQNCj4gYSBXQVJOKCkgc28gd2UgY2F0Y2ggdGhlc2Ugc2l0dWF0aW9ucy4gSGF2
ZSB5b3UgcmVwcm9kdWNlZCB0aGlzDQo+IHBhcnRpY3VsYXIgY2FzZT8NCg0KVGhlcmUgYXJlIGEg
Y291cGxlIG9mIGV4YW1wbGVzIG9mIG5vIHJlc291cmNlIGlzc3VlIHRoYXQgSSByZWNhbGw6DQox
KSBXaGVuIHdlIHJlbW92ZWQgdGhlIERXQzNfRVBfRU5EX1RSQU5TRkVSX1BFTkRJTkcgZmxhZywg
d2Ugd2Fzbid0IGFibGUgDQp0byBjaGVjayBpZiB0aGUgZW5kcG9pbnQgaGFkIGVuZGVkLiBTbywg
aWYgdGhlIGZ1bmN0aW9uIGRyaXZlciBxdWV1ZXMgYSANCm5ldyByZXF1ZXN0IHdoaWxlIEVORF9U
UkFOU0ZFUiBjb21tYW5kIGlzIGluIHByb2dyZXNzLCBpdCdkIHRyaWdnZXIgDQpTVEFSVF9UUkFO
U0ZFUiB0byBhbiBhbHJlYWR5IHN0YXJ0ZWQgZW5kcG9pbnQNCg0KMikgRm9yIHRoaXMgbmV3IG1l
dGhvZCBvZiByZXRyeWluZyBmb3IgaXNvYywgd2hlbiB3ZSBpc3N1ZSBFTkRfVFJBTlNGRVIgDQpj
b21tYW5kLCBmb3Igc29tZSBjb250cm9sbGVyIHZlcnNpb25zLCB0aGUgY29udHJvbGxlciB3b3Vs
ZCBnZW5lcmF0ZSANClhmZXJOb3RSZWFkeSBldmVudCB3aGlsZSB0aGUgRU5EX1RSQU5TRkVSIGNv
bW1hbmQgaXMgaW4gcHJvZ3Jlc3MgcGx1cyANCmFub3RoZXIgYWZ0ZXIgaXQgY29tcGxldGVkLiBU
aGF0IG1lYW5zIHdlJ2Qgc3RhcnQgb24gdGhlIHNhbWUgZW5kcG9pbnQgDQp0d2ljZSBhbmQgdHJp
Z2dlciBhIG5vLXJlc291cmNlIGVycm9yLiAoV2UnZCBydW4gaW50byB0aGlzIHNjZW5hcmlvIA0K
YmVjYXVzZSBFTkRfVFJBTlNGRVIgY29tcGxldGlvbiBjbGVhcmVkIHRoZSBzdGFydGVkIGZsYWcp
Lg0KDQpXZSBhZGRlZCB0aGUgY2hlY2tzIHRvIHByZXZlbnQgdGhpcyBpc3N1ZSBmcm9tIGhhcHBl
bmluZywgc28gdGhpcyANCnNjZW5hcmlvIHNob3VsZCBub3QgaGFwcGVuIGFnYWluLg0KDQpJZiB3
ZSB3YW50IHRvIGFkZCBhIFdBUk4oKSwgSSB0aGluayB3ZSBzaG91bGQgYWRkIHRoYXQgaW5zaWRl
IG9mIA0KZHdjM19zZW5kX2dhZGdldF9lcF9jbWQoKSBmdW5jdGlvbiwgYXMgYSBzZXBhcmF0ZSBw
YXRjaC4gV2UgY2FuIGFsc28gDQpqdXN0IGxvb2sgYXQgdGhlIHRyYWNlcG9pbnQgZm9yICJubyBy
ZXNvdXJjZSIgc3RhdHVzLg0KDQpCUiwNClRoaW5oDQoNCg0K
