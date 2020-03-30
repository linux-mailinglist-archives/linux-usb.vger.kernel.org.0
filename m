Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45F219847B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2020 21:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgC3Tag (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 15:30:36 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:33948 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727276AbgC3Tag (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 15:30:36 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 15F71C0FE0;
        Mon, 30 Mar 2020 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585596635; bh=gTzVBPGhOdXU8fB9l+A9ykD7gz0cRpRssm9YHv7QnJ0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=VDijJxmioULG1ZF+dsGd5nZyrnsV/JntcWMIo8ElIr67yZkvFpNIpINHluugpBr67
         5qJgKc3XMy3U++zn0DlvRTKLSPsiIZyaAupV/4CIjcxIrX1zseLpAzHPkrmtbpRufZ
         sQ8nV96g25pGnxjNnWCwAMzpZ8nIq9kYaMUb72G0xAVPstpKQn2WhXRDFSib2Jc/MB
         XhHi/49xRKOD3gOirGrnmssFIbdkjbAwqTlhXczK7ccWxNLswCBC32rxWwGRNFyW/d
         g8USt7zjH2QC+oFVYMWczM0vmD0fHnmQ9mSvr6+iWwW4RP0TJJyW9sokVZpgMSz0/D
         homAbW7awnwqw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 99CD8A006F;
        Mon, 30 Mar 2020 19:30:34 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 30 Mar 2020 12:30:12 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 30 Mar 2020 12:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdhJZgZzKC2VcU3Dkth42bXbPLpIbMKGNokyFSHcMPEKkzGVoVkiK9/IYAIlCU4FNFb2bZH2Ku7LNiFPr22y0olKz1m9vQb1en0WGcQi7jffGQujwGURgx/9n9vUF7cyfn9K+DMNaNLy9JyFOb4gyjj5Sbd5yB+JbmukzyMKCesYGI8dVtMaurVQEBGGY0kU8aFDw8GbVVuU31nlHrCVDi9tDyy8Z3n2AMt6e7XMWzk//5FNFToYVzTx3jaZ7O/yyjamBIk1Q/pwFXJu4vZmvv3k0NKK1h/1tiBR1lboPND47m/gM8WGN7kFTJ5Z8P4Unw/sUuhPbPFDwvPLatyVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTzVBPGhOdXU8fB9l+A9ykD7gz0cRpRssm9YHv7QnJ0=;
 b=Cb4haPJAO3FoSPIHV8NQwSsvZnhFPWfnB5DTFvczsLZMXr5dkgMamSn5ldKYRKHPg/2o3c2DMvBIrCM2jbADX+G3VT7qbrw4DdkgpmROgZ2FW2Y3kvQba7wxiP+9ymtl7nwdr31q88VppbYxTv801JJdjlrMWzJBCyUbWSooRxkQqtnjuQEsK2CMMfu+K2SNmD/pYjTAPjpjUfOH7O2tMxpA7WNvOjGQaLSAnKrc4ZNtH5NCmnvlwY6HlLEV8YLZVlDfR65P74D2Y4peVQL2ViEsYIbveKTqdm3xtm81TLuWxyGssVdy0RjWRGvpK1N5YSLxHvjlTjXCbMUgACD6Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTzVBPGhOdXU8fB9l+A9ykD7gz0cRpRssm9YHv7QnJ0=;
 b=bBKXdhyT4yvooB+RehZkozg9eJ3qwHu2Eg+GsaKfzoPSGR+1yyW3ZwH1OZJDECXYtRRerT5ReZTx/bO7uGHt36OCI7mBf7VHb69DMqDH+H0hOKNZj8zMPA+qsW64eV7sjRArPte0D2s14PD50LCD1YkL6hjN7hZG4ZDSOMCYMfc=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3365.namprd12.prod.outlook.com (2603:10b6:a03:a9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Mon, 30 Mar
 2020 19:30:10 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Mon, 30 Mar 2020
 19:30:10 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Index: AQHV82muQmX55NMUl0emMsblflREJqhJbrQAgAD/cgCAAGwZAIAA5GqAgBObrwCAAQbKAIAAkdsAgAC5c4A=
Date:   Mon, 30 Mar 2020 19:30:10 +0000
Message-ID: <d451b3cd-94e2-13a5-7169-8a87f89fa769@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
 <87d09ef01l.fsf@kernel.org>
 <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com>
 <87blow239f.fsf@kernel.org>
 <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com>
 <87v9mn37vb.fsf@kernel.org>
 <eca2ea69-89dc-3ccc-b280-c1b080ad263f@synopsys.com>
 <87bloe2qq3.fsf@kernel.org>
In-Reply-To: <87bloe2qq3.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec78ded8-8345-4664-988c-08d7d4e0c32e
x-ms-traffictypediagnostic: BYAPR12MB3365:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3365FE258DC0DAC97ED10095AACB0@BYAPR12MB3365.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0358535363
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(136003)(376002)(366004)(39860400002)(346002)(2616005)(4326008)(107886003)(86362001)(316002)(31696002)(478600001)(71200400001)(6486002)(110136005)(6512007)(81156014)(186003)(5660300002)(8676002)(66946007)(31686004)(8936002)(6506007)(66476007)(26005)(66446008)(36756003)(2906002)(64756008)(81166006)(66556008)(76116006);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LL7IinRAxhCzldIr6aUSOflzdoWfAqbx3Kqv76HSQ/WfBy3Gx8WMxCI5VI++tWIojeu0LcpiUBldjc3geXaR8398wtP5+bDMFu8DA9OfT6KLa+03vrAagcKZGD8zNDG29a1B0nyQXZkoO/HHIxPetly53Xh5sBt8LxrlDOXVDxWhKhpTFS1y5Iq8UTAV3RjpPyXsHzvhn+aKhCP/S+V+57r4DItORqhMa3cEQsVJGi2F0R0IIm+plMrSZF/01v+wr/iW+RrVqb7xLw7g/PDF23GYI6PRizZy3NIeeIo4UVoEhcbdAyfVFiwFr/z37Uc1hQkxZ4r8OtqKvWTyO3+7ly1PX58GwU/c06J/ON/GImKCMZsWXQCpRafWcebHMpbrXGjJkoOONyV9pkNLjna4nozLtwsRpYJNAULly8G37JCZLiFkClj2XR6T1Y9qvxtx
x-ms-exchange-antispam-messagedata: TSHiPoGKLGMZwEFWcDYwEvMhgRClnXxzFJjxMnX+osfLt/6K6JM+F2QgCk1yYpXwmmiDH80xk2nBnsX56ucQlE6IuvvAiip4JUc1ukSEzpfOulgISrzUMoPudqZ4gR636kk5qQy2zD3e2snSF+I/Fw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <C140325845F8EE4B95938396C80F79A8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ec78ded8-8345-4664-988c-08d7d4e0c32e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2020 19:30:10.7308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4tG6Ng3fz2slC5Y8PlrEs2uMcuBwav1zgBrXF6uS/EbJ3bRqh659j8WslkxhurPrVwEGAczXSkB7bNt+Jir+UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3365
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPg0KPj4gVGhlIGNvbmRpdGlvbiBoZXJl
IGlzIGlmICghcmVxdWVzdF9jb21wbGV0ZSgpKSwgdGhlbiBraWNrX3RyYW5zZmVyKCkuDQo+PiBM
ZXQncyB0YWtlIGEgbG9vayBhdCB3aGF0IGtpY2tfdHJhbnNmZXIoKSBkbzoNCj4+DQo+PiBraWNr
X3RyYW5zZmVyKCkgd2lsbCBwcmVwYXJlIG5ldyBUUkJzIGFuZCBpc3N1ZSBTVEFSVF9UUkFOU0ZF
UiBjb21tYW5kDQo+PiBvciBVUERBVEVfVFJBTlNGRVIgY29tbWFuZC4gVGhlIGVuZHBvaW50IGlz
IGFscmVhZHkgc3RhcnRlZCwgYW5kIG5vdGhpbmcNCj4+IGlzIGNhdXNpbmcgaXQgdG8gZW5kIGF0
IHRoaXMgcG9pbnQuIFNvIGl0IHNob3VsZCBqdXN0IGJlIFVQREFURV9UUkFOU0ZFUg0KPj4gY29t
bWFuZC4gVVBEQVRFX1RSQU5TRkVSIGNvbW1hbmQgdGVsbHMgdGhlIGNvbnRyb2xsZXIgdG8gdXBk
YXRlIGl0cyBUUkINCj4+IGNhY2hlIGJlY2F1c2UgdGhlcmUgd2lsbCBiZSBuZXcgVFJCcyBwcmVw
YXJlZCBmb3IgdGhlIHJlcXVlc3QuDQo+Pg0KPj4gSWYgdGhpcyBpcyBub24tU0cvbm9uLWNoYWlu
ZWQgVFJCIHJlcXVlc3QsIHRoZW4gdGhlcmUncyBvbmx5IDEgVFJCIHBlcg0KPj4gcmVxdWVzdCBm
b3IgSU4gZW5kcG9pbnRzLiBJZiB0aGF0IFRSQiBpcyBjb21wbGV0ZWQsIHRoYXQgbWVhbnMgdGhh
dCB0aGUNCj4+IHJlcXVlc3QgaXMgY29tcGxldGVkLiBUaGVyZSdzIG5vIHJlYXNvbiB0byBpc3N1
ZSBraWNrX3RyYW5zZmVyKCkgYWdhaW4uDQo+IG5vdCBlbnRpcmVseSB0cnVlIGZvciBidWxrLiBX
ZSBuZXZlciBzZXQgTFNUIGJpdDsgd2Ugd2lsbCBuZXZlciBjb21wbGV0ZQ0KPiBhIHRyYW5zZmVy
LCB3ZSBjb250aW51YWxseSBhZGQgbW9yZSBUUkJzLiBUaGUgcmVhc29uIGZvciB0aGlzIGlzIHRv
DQo+IGFtb3J0aXplIHRoZSBjb3N0IG9mIGFkZGluZyBuZXcgdHJhbnNmZXJzIHRvIHRoZSBjb250
cm9sbGVyIGNhY2hlIGJlZm9yZQ0KPiBpdCBydW5zIG91dCBvZiBUUkJzIHdpdGhvdXQgSFdPLg0K
DQpSaWdodCwgSSB3YXMgcmVmZXJyaW5nIHRvICJyZXF1ZXN0IiByYXRoZXIgdGhhbiB0cmFuc2Zl
ciAoYXMgaW4gYSANCnRyYW5zZmVyIG1heSBoYXZlIDEgb3IgbW9yZSByZXF1ZXN0cykuDQoNCj4N
Cj4gSG93IGFib3V0IHdlIGNoYW5nZSB0aGUgdGVzdCB0byBzYXkgImlmIEkgaGF2ZSBub24tc3Rh
cnRlZCBUUkJzIGFuZCBJJ20NCj4gYnVsayAobm9uLXN0cmVhbSkgb3IgaW50ZXJydXB0IGVuZHBv
aW50LCBraWNrIG1vcmUgdHJhbnNmZXJzIj8NCj4NCj4+IFdoZW4gdGhlIGZ1bmN0aW9uIGRyaXZl
ciBxdWV1ZXMgYSBuZXcgcmVxdWVzdCwgdGhlbiB0aGVyZSB3aWxsIGJlIG5ldw0KPj4gVFJCcyB0
byBwcmVwYXJlIGFuZCB0aGVuIHRoZSBkcml2ZXIgY2FuIGtpY2tfdHJhbnNmZXIoKSBhZ2Fpbi4N
Cj4gV2UgbWF5IGFscmVhZHkgaGF2ZSBtb3JlIFRSQnMgaW4gdGhlIHBlbmRpbmcgbGlzdCB3aGlj
aCBtYXkgbm90IGhhdmUNCj4gYmVlbiBzdGFydGVkIGJlZm9yZSB3ZSBkaWRuJ3QgaGF2ZSBmcmVl
IFRSQnMgdG8gdXNlLiBXZSBqdXN0IGNvbXBsZXRlZCBhDQo+IFRSQiwgbWlnaHQgYXMgd2VsbCB0
cnkgdG8gdXNlIGl0IGZvciBtb3JlIHJlcXVlc3RzLg0KDQpZZXMgd2UgY2FuIGFuZCB3ZSBzaG91
bGQsIGJ1dCB3ZSBkaWRuJ3QgY2hlY2sgdGhhdC4gQWxzbyBpdCBzaG91bGRuJ3QgYmUgDQppbiB0
aGUgcmVxdWVzdF9jb21wbGV0ZSgpIGNoZWNrIGZ1bmN0aW9uIGFzIHRoZXkgYXJlIHBhcnQgb2Yg
ZGlmZmVyZW50IA0KcmVxdWVzdHMuDQoNCj4NCj4+IFNvLCB0aGlzIGNvbmRpdGlvbiB0byBjaGVj
ayBpZiByZXF1ZXN0X2NvbXBsZXRlKCkgaXMgb25seSB2YWxpZCBmb3IgYQ0KPj4gcmVxdWVzdCB3
aXRoIG11bHRpcGxlIGNoYWluZWQgVFJCcy4gU2luY2Ugd2UgY2FuIG9ubHkgY2hlY2sgZm9yIElO
DQo+PiBkaXJlY3Rpb24sIHRoZSBjaGFpbmVkIFRSQiBzZXR1cCByZWxhdGVkIHRvIE9VVCBkaXJl
Y3Rpb24gdG8gZml0DQo+PiBNYXhQYWNrZXRTaXplIGRvZXMgbm90IGFwcGx5IGhlcmUuIFdoYXQg
bGVmdCBpcyBjaGFpbmVkIFRSQnMgZm9yIFNHLiBJbg0KPiB0aGlzIHBhcnQgaXMgY2xlYXIgbm93
IGFuZCB5b3UncmUgY29ycmVjdC4gVGhhbmtzDQo+DQo+PiB0aGlzIGNhc2UsIHdlIGRvIHdhbnQg
dG8ga2lja190cmFuc2ZlciBhZ2Fpbi4gVGhpcyBtYXkgaGFwcGVuIHdoZW4gd2UNCj4+IHJ1biBv
dXQgb2YgVFJCcyBhbmQgd2UgaGF2ZSB0byB3YWl0IGZvciBhdmFpbGFibGUgVFJCcy4gV2hlbiB0
aGVyZSBhcmUNCj4+IGF2YWlsYWJsZSBUUkJzIGFuZCBzdGlsbCBwZW5kaW5nIFNHcywgdGhlbiB3
ZSB3YW50IHRvIHByZXBhcmUgdGhlIHJlc3QNCj4+IG9mIHRoZSBTRyBlbnRyaWVzIHRvIGZpbmlz
aCB0aGUgcmVxdWVzdC4gU28ga2lja190cmFuc2ZlcigpIG1ha2VzIHNlbnNlDQo+PiBoZXJlLg0K
PiBSaWdodCBidXQgd2UgY2FuIHJ1biBvdXQgb2YgVFJCcyBldmVuIGluIG5vbi1jaGFpbmVkIGNh
c2UuIEkgcmVtZW1iZXINCj4gdGVzdGluZyB0aGlzIHllYXJzIGFnbyBieSBnaXZpbmcgZ19tYXNz
X3N0b3JhZ2UgYSBsaXN0IG9mIDMwMA0KPiByZXF1ZXN0cy4gVGhlIHJlYXNvbiBmb3Iga2lja2lu
ZyB0aGUgdHJhbnNmZXIgaXMgZGlmZmVyZW50LCBidXQgaXQncw0KPiBiZW5lZmljaWFsIGFueWhv
dy4NCj4NCg0KSW4gdGhpcyBjYXNlLCB0aGUgY2hlY2sgc2hvdWxkIGJlIGZvciBpZiB0aGUgcGVu
ZGluZ19saXN0IGlzIG5vdCBlbXB0eSwgDQp0aGVuIGtpY2sgYWdhaW4uDQoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
aW5kZXggNmEwNGM5YWZjYWI2Li5kODMxOGRlNTUwMDAgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5jDQorKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQpAQCAtMjk3
NSwxNCArMjk3NSw3IEBAIHN0YXRpYyBpbnQgDQpkd2MzX2dhZGdldF9lcF9yZWNsYWltX3RyYl9s
aW5lYXIoc3RydWN0IGR3YzNfZXAgKmRlcCwNCg0KIMKgc3RhdGljIGJvb2wgZHdjM19nYWRnZXRf
ZXBfcmVxdWVzdF9jb21wbGV0ZWQoc3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxKQ0KIMKgew0KLcKg
wqDCoMKgwqDCoCAvKg0KLcKgwqDCoMKgwqDCoMKgICogRm9yIE9VVCBkaXJlY3Rpb24sIGhvc3Qg
bWF5IHNlbmQgbGVzcyB0aGFuIHRoZSBzZXR1cA0KLcKgwqDCoMKgwqDCoMKgICogbGVuZ3RoLiBS
ZXR1cm4gdHJ1ZSBmb3IgYWxsIE9VVCByZXF1ZXN0cy4NCi3CoMKgwqDCoMKgwqDCoCAqLw0KLcKg
wqDCoMKgwqDCoCBpZiAoIXJlcS0+ZGlyZWN0aW9uKQ0KLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHRydWU7DQotDQotwqDCoMKgwqDCoMKgIHJldHVybiByZXEtPnJlcXVlc3Qu
YWN0dWFsID09IHJlcS0+cmVxdWVzdC5sZW5ndGg7DQorwqDCoMKgwqDCoMKgIHJldHVybiByZXEt
Pm51bV9wZW5kaW5nX3NncyA9PSAwOw0KIMKgfQ0KDQogwqBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0
X2VwX2NsZWFudXBfY29tcGxldGVkX3JlcXVlc3Qoc3RydWN0IGR3YzNfZXAgKmRlcCwNCkBAIC0z
MDA3LDcgKzMwMDAsNyBAQCBzdGF0aWMgaW50IA0KZHdjM19nYWRnZXRfZXBfY2xlYW51cF9jb21w
bGV0ZWRfcmVxdWVzdChzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KIMKgwqDCoMKgwqDCoMKgIHJlcS0+
cmVxdWVzdC5hY3R1YWwgPSByZXEtPnJlcXVlc3QubGVuZ3RoIC0gcmVxLT5yZW1haW5pbmc7DQoN
CiDCoMKgwqDCoMKgwqDCoCBpZiAoIWR3YzNfZ2FkZ2V0X2VwX3JlcXVlc3RfY29tcGxldGVkKHJl
cSkgfHwNCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXEt
Pm51bV9wZW5kaW5nX3Nncykgew0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgICFsaXN0X2VtcHR5KCZk
ZXAtPnBlbmRpbmdfbGlzdCkpIHsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19k
d2MzX2dhZGdldF9raWNrX3RyYW5zZmVyKGRlcCk7DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gb3V0Ow0KIMKgwqDCoMKgwqDCoMKgIH0NCg0KDQpUaGlzIGlzIHVubGlrZWx5
IHRvIGhhcHBlbiwgYnV0IGl0J3MgbmVjZXNzYXJ5IHRvIGJlIHRoZXJlLg0KDQpMZXQgbWUga25v
dyBpZiB5b3UncmUgb2sgd2l0aCB0aGUgY2hhbmdlLCBJJ2xsIGNyZWF0ZSBhIGZvcm1hbCBwYXRj
aCBmb3IgaXQuDQoNCkJSLA0KVGhpbmgNCg==
