Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11302ADE4D
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2019 19:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391496AbfIIRz1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Sep 2019 13:55:27 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:40496 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391495AbfIIRz1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Sep 2019 13:55:27 -0400
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com [10.13.135.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A57C5C1D6A;
        Mon,  9 Sep 2019 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1568051727; bh=uMJs96y64HU0uPRWIEWJdhRLlsK1BZTgqLqaaHyEXac=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=gIWcw53Zs9J/wgs21fL0P7MWdxA0jqLi/Lwnd0yRbp65Yb7IhtN97VOxvmuFF93mS
         4P7vEoxMMYtpgue4RLuKNb4g5AdQSAOkleDiyI21Y44911U7AKUXtfxBMI9uvYYCiQ
         ZhMO3TwnHA4m5NN5UskyL3Ak8KO89vn8r61VypyVeCKD27FYHoCRONuTe/YbAohY/F
         vD3AgiItOggxrqe+tDI+pk5Ra5phirtvAuFdEt19P1pBgnrc9vo//85Jjia/pnG5UN
         PNBqq1GEcAPlkJRIeEVlOd8U2npPm+AEZ+2ojE5KIp+0JwQLjMQrXf4YGGWyC5jkRf
         ab8dSO1KdjCPw==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E6E05A005A;
        Mon,  9 Sep 2019 17:55:25 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 9 Sep 2019 10:54:39 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 9 Sep 2019 10:54:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFDJgwpQq/ZtylP3tuCF1XqqvcKJzaM9x3+omGU/qoLoVgBPINTuEmJaqKh2piKlgS9ES+hnhOGhMK/GDs9eFIThXmXiDQ2j4M0eP4FyFb2K1QoQ9F5JzrbFuEYNuyynNOjSXKqvaUshYvIcWY89NeEJwS46moXzRGwJm9igbjPiK+LhA9vUsXtbbwAAhT8d0RBXksBX4xEh/RSrAnYgvc6npPUeOkHDQ3Ed5sMzNSU4sftoQd/nEaojWjaGSCFHUQ4ooBUZFKSa73WSF+QLMjM0D8FWv2DcmETYpuGWLZ1Ax2eZ/MmKtjaTJTReEWeLAIjh2hXovPJTigZ0xS2sLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMJs96y64HU0uPRWIEWJdhRLlsK1BZTgqLqaaHyEXac=;
 b=PXECHs09nHISmJioXqFYp+E1N20E83H44XuD/FJ0DRBXKNXgBVIpeOmupvINKwcKgkaCHmBJ0agOgjC7oVl7mJ1Ko0Wf6TPcBLRTYKXhEsl5jiJoh9e+0ZMX4xkuwAQq1r09M8R8vchMwQeakP0qaIfM3QNkuD/HO+M7Iimn8Ov0kEt9me0afKU0HU0x4M9Rtwj7D74liLSEjaiXLahS8e7UJnfhsZnSTuY2bZdtH4jci0i4ZRS5p2PyuP/CUaXridI2CsjDfTX/6IX9obptJnhvzEX5+W/cOVRFkKZuncIG0eU0uLfQoQVxtdPobdiHnFO4nnyOPkoaTBmHe8nQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMJs96y64HU0uPRWIEWJdhRLlsK1BZTgqLqaaHyEXac=;
 b=gJ1xR1Fzg1dvrGM9Yu7qQqXaHwpHk8k/aEx3Jil7MbOeEVLG3ttBXKF6A4IGe5eUOt58bVU8sMsexgWD0ebEJnyXXAHN2i4mFsg4BVSG+Rwwh4TB0t+sjdQrmENP6L9dOjFVSjYzWT64qtQZMv36YR5ttOuaCjXj2tAhLLgu+LU=
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com (10.172.78.22) by
 CY4PR1201MB0118.namprd12.prod.outlook.com (10.174.52.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 17:54:37 +0000
Received: from CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::9fa:c9b6:7dfa:9192]) by CY4PR1201MB0037.namprd12.prod.outlook.com
 ([fe80::9fa:c9b6:7dfa:9192%9]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 17:54:37 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Roman Kapl <roman.kapl@sysgo.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Roman Kapl <rka@sysgo.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH] usb: dwc3: reset the address and run_stop on init
Thread-Topic: [PATCH] usb: dwc3: reset the address and run_stop on init
Thread-Index: AQHVY9B3vveGFpGDJ0qXi6rKKNTaCKcdb9QAgAWrnYCAAIw3AA==
Date:   Mon, 9 Sep 2019 17:54:37 +0000
Message-ID: <9806c612-506d-eac1-81a7-13bcc8cd8a39@synopsys.com>
References: <20190905095151.26590-1-rka@sysgo.com>
 <14b0d784-e172-7c22-8804-a9e7035d970f@synopsys.com>
 <5a6a8d61-1ccf-9731-0b80-da783636970f@sysgo.com>
In-Reply-To: <5a6a8d61-1ccf-9731-0b80-da783636970f@sysgo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [198.182.56.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80a7def3-ea24-42e3-22ad-08d7354ec808
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR1201MB0118;
x-ms-traffictypediagnostic: CY4PR1201MB0118:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0118DA84988DFD0CFF765BD4AAB70@CY4PR1201MB0118.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39860400002)(346002)(136003)(366004)(376002)(189003)(199004)(476003)(2616005)(11346002)(446003)(6512007)(31696002)(66066001)(8676002)(76116006)(81166006)(81156014)(7736002)(305945005)(8936002)(110136005)(76176011)(53936002)(54906003)(25786009)(6486002)(6246003)(86362001)(31686004)(229853002)(2906002)(66446008)(71200400001)(53546011)(64756008)(5660300002)(6506007)(71190400001)(3846002)(99286004)(256004)(66946007)(102836004)(486006)(14454004)(4326008)(36756003)(2501003)(316002)(6436002)(66476007)(6116002)(186003)(66556008)(26005)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR1201MB0118;H:CY4PR1201MB0037.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jrR2iUqHehVMRPAukcl4IbsSuTgMOWvLq9/PrSvEdcuwSBTgSfB1PT6m3jQ1GudWs/JiDkZ4UJjmo4GxwUM856s0rb/bujvd0ROq8Mp5BTM96A8YUikapxZ4GxfdregjaZEQ83IBtxxtEKDY1g69hf4EykuNPYR2qqCLNmIwt0tn0hRRSFErH+ipe8pQblQW55z7S2gwFQ2EYNo8ykSdqo+GRgPQO1uhHYdmhsxwKC3hY89+2nK7d/B5BejkKTHKaN3FMlpfaQi49LFG7A4WCcPeRmrGTD7NeW5f8FTVOGAfLze8Ysubgi2i6UrnUOQRijZTCUF3SfqCmcW6Z/86qjjUazZxz7OVgygZ7HlIp+skQ75iK2o2ifqRYw+sioPJHlzUyuhAz9Uj7ql/rhRdjBc8Ezsi8xF5e6VwPGov0r0=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB08595B80BF024480F7A66CB52FE0BD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 80a7def3-ea24-42e3-22ad-08d7354ec808
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 17:54:37.4197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECpMZ8hNATmJUHIU4JKLSZLui8t2uhlUCZGK4oVhyryQKkbWknTsA+1Z+B75dDeSyqGyJ2YsGG1iSnilHYRSgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0118
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNClJvbWFuIEthcGwgd3JvdGU6DQo+IEhlbGxvLA0KPg0KPiBPbiA5LzUvMTkgODo1NyBQ
TSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gUm9tYW4gS2FwbCB3cm90ZToN
Cj4+PiBUaGUgYWRkcmVzcyBzaG91bGQgYmUgc2V0IHRvIHplcm8gZHVyaW5nIHJlc2V0IGFjY29y
ZGluZyB0byB0aGUNCj4+PiBkb2N1bWVudGF0aW9uLg0KPj4NCj4+IFRoYXQgaXMgZm9yIHVzYiBy
ZXNldCBhbmQgbm90IGNvcmUgc29mdCByZXNldCwgYW5kIGR3YzMgYWxyZWFkeSBoYW5kbGVzDQo+
PiB0aGF0IGNhc2UuDQo+DQo+IEkgdGhvdWdodCB0aGF0IGNvcmUgc29mdCByZXNldCBpcyBwYXJ0
IG9mIHRoZSBVU0IgcmVzZXQgKGl0IGlzIGRvbmUgDQo+IGR1cmluZyB0aGUgaW5pdCwgcmlnaHQ/
KS4NCg0KQSBzb2Z0IHJlc2V0IGlzIGRvbmUgZHVyaW5nIGRldmljZSBwb3dlci1vbiBpbml0LiBJ
dCdzIG5vdCBwYXJ0IG9mIHRoZSANClVTQiByZXNldC4NCg0KPg0KPj4NCj4+PiBDbGVhcmluZyBS
dW5TdG9wIGVuc3VyZXMgdGhhdCB0aGUgaG9zdCBkaXNjb25uZWN0cyBmcm9tDQo+Pj4gdGhlIGRl
dmljZSAoaXQgd2FzIG5vdCBjbGVhcmVkIGJ5IENTRlRSU1QsIGF0IGxlYXN0IG9uIGxzMTA0Myku
DQo+Pj4NCj4+PiBUaGlzIGFsbG93cyB0aGUgZHdjMyB0byBwcm9wZXJseSBpbml0aWFsaXplIGV2
ZW4gaWYgdGhlIHByZXZpb3VzDQo+Pj4gZHJpdmVyIGRpZCBub3Qgc2h1dGRvd24gdGhlIGRldmlj
ZSAoZS5nLiB3aGVuIHVzaW5nIHZpcnR1YWxpemF0aW9uKS4NCj4+DQo+PiBUaGlzIHNvdW5kcyBs
aWtlIGEgd29ya2Fyb3VuZCB0byBzb21lIGlzc3VlIHRoYXQgdGhlIGZ1bmN0aW9uIGRyaXZlciBk
aWQNCj4+IG5vdCBoYW5kbGUuDQo+DQo+IEkgYW0gdXNpbmcgdGhlIEFDTSBmdW5jdGlvbiBkcml2
ZXIuIEhvd2V2ZXIsIGFzIEkgc2FpZCwgdGhlIGlzc3VlIA0KPiBhcmlzZXMgb25seSB3aGVuIHRo
ZSBkd2MzIGRyaXZlciBpcyBpbiBhIGd1ZXN0IE9TIHRoYXQgaXMgcmVib290ZWQgDQo+IChldmVu
IGlmIHRoZSByZWJvb3QgaXMgaW5pdGlhdGVkIGZyb20gd2l0aGluIHRoZSBndWVzdCBPUywgbm90
IGEgaGFyZCANCj4gcmVzZXQpLg0KDQpDaGVjayB3aHkgaXQgd2Fzbid0IGRlLWluaXRpYWxpemVk
IG9uIHJlYm9vdC4gQWxzbyBwbGVhc2UgZGVzY3JpYmUgd2hhdCANCnByb2JsZW0geW91IHNhdyBp
biB0aGUgcGF0Y2guDQoNCj4NCj4gTWF5YmUgdGhpcyBpcyBvdXQgb2Ygc2NvcGUgZm9yIExpbnV4
LCB0cnlpbmcgdG8gJ2NsZWFuIHVwJyBhZnRlciB0aGUgDQo+IHByZXZpb3VzIGRyaXZlcj8NCj4N
Cj4gVGhhbmsgeW91LCBSb21hbiBLYXBsDQo+DQoNCkJSLA0KVGhpbmgNCg==
