Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D029218747C
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732655AbgCPVIC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:08:02 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37008 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732624AbgCPVIC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:08:02 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7297CC04DE;
        Mon, 16 Mar 2020 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584392880; bh=Gz+hJUTrko2JrZ29fGovKw1+RHuYEo/1S9pyUFuxAlw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=POJSNWnnCD33uZ8Ir8GjsvFoW2/KHRf3ESTLS3UW5L2OQ6BPNgPA7w8RNn5idRBEG
         chCbfZK1PxpM1/9b6IJ55kW1EgSclrbzDRl45RzksIhzt3U+Js1q3blcA4TZc5Mrc/
         AoBa293ZADDoBPeae2Y4x8UuK00DmEo9wlXSknqjCH6iOYqfofkAA53JfHQeaSKC8f
         bnxc4UDQUAtmvbUk9d4rei2tNt99raD6fU3K20c3caxf7gkZAKDBRnO367TuxP7PYo
         TxE4x1zlNl4wSkFQhcgtQirCaK9FXbZkFx/V4oe5BQRCuEUJEQM1dCQJiCtChvr8hB
         6TEWf/UYmWK9Q==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2F2D9A006C;
        Mon, 16 Mar 2020 21:08:00 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Mar 2020 14:07:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Mar 2020 14:07:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb/7JkSEsW6MrWepwwAIgYqXjs61xCHOG5xNph+jjpPAAqAy3xPy4jj3AMymxkyEp2jFuPouigdy0dI5zQ+IvtbTOoaw12Pt4NvALVTyNh/UIas5uA89GzP1Wys3/2+bPy/p7uQyqiXVer0SamDbzlrv4oCK0NPOJpYwbtZOahXG002MMDZ6Pv4xIZu7Dwdfr2y5GNN4j4yLOIHgwYGRwfTRSjAaW3KUhTRkoPqfUNoTRAtsGDcRLj2HIkR9Zn2FksU/W9PhORh21oEoOn/7sUMpnKMnzRRBL0bfYD67ftCH/pRl4TIrOQkjnVAbxLWMNhUpHsR8l1aLqWL6yr0CoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz+hJUTrko2JrZ29fGovKw1+RHuYEo/1S9pyUFuxAlw=;
 b=HQN5JM318Hue51FPMwNG+vWVgK4rhA3xSecHXX9+NTSZ/k2w/smV+EHNZQ4445GqiWcdoZpMbLm8H3PegNdaTtTCBIwC4nPfQkS1Xd4Z/fk0YbQa4Bj4AAaOi7NDCYHGe5t06WOddFOqm94c/Xa44bTttm33LF6L/YyaKz74qDrY2zAI1lLyb2HXxrD8p2ct9wpWf9Cqyq1uVrllcNnrrEOkE20YtXrwYLkMA+X5J/yayXf+uBUHWxOCUog2IcSOVvPWtUnJFMhwGZcePfAe67UfxfWZt6Ze0+hDmzJcNfL8gHAnwYecGpN7sy+urJN2Sfrks81bEKHV0zH2me4MLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz+hJUTrko2JrZ29fGovKw1+RHuYEo/1S9pyUFuxAlw=;
 b=Yjn2tU6pxAMHNLTAScbteV9hQBzTtiewaV4DKuvWzO77wFc9zbcPhxlfa1TdJOHQJQxXGBIeLm2FecZudVbg+77hOuooBNFIR71hA8SYiqe98fXx+TVTCy0miGJ1zhzlJx+wpf8p5ELfaU5O0Xvn2hUrIZfIpM9bQxNkNJCGixw=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3608.namprd12.prod.outlook.com (2603:10b6:a03:de::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Mon, 16 Mar
 2020 20:37:50 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 20:37:50 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Index: AQHV82muQmX55NMUl0emMsblflREJqhJbrQAgAD/cgCAAGwZAIAA5GqA
Date:   Mon, 16 Mar 2020 20:37:50 +0000
Message-ID: <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
 <87d09ef01l.fsf@kernel.org>
 <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com>
 <87blow239f.fsf@kernel.org>
In-Reply-To: <87blow239f.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90013b13-3147-4d29-15fc-08d7c9e9e55b
x-ms-traffictypediagnostic: BYAPR12MB3608:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB36081B4FEF2421A4C8A400F6AAF90@BYAPR12MB3608.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(39860400002)(376002)(136003)(346002)(199004)(4326008)(6486002)(36756003)(2906002)(107886003)(76116006)(71200400001)(478600001)(6512007)(186003)(2616005)(5660300002)(86362001)(26005)(81156014)(8936002)(81166006)(66946007)(8676002)(66446008)(64756008)(66556008)(66476007)(110136005)(31686004)(6506007)(31696002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB3608;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kH5CmXlLBiL5wA0qhKaeVAkIUpHnafb90w5XsI6tFosz3iLCRf//kGlrP8h8qlzF6geEhORnS0TR4VwA2Bwcn08LG+aTxlLQz2WxQ4qnmS+FyJ/zYOgP9wvlKV+w/dh3WIYgue67Kd7kvOtbEN7Uag2TJFzZDhXlBHDrBir9yocGr8BQfxSbxUeizTAiTa3UV+U9MT5cakjOk1zCZ1o0tgl2G5lde9RrrTvKuOZ6cZym1Xb9JsTI0Dw942z5It2UBhJ4HMA9USkht1oBb2jYnmFA1vkLDHeRfSenNu9ZSNtmnX3VhOrf4tHazN9obRT8oE3n1UKM+zCPtn7R9JHFBbt3wp0HLxH5IgyoS0JIfpxKEnGZuXTb2T+9HXZMP8BWPXsZgI60ezZ6LMGb8BQj//FCLzY+yC64e6YFA+325uNO5MI7rlzkjEDGVjor+bM5
x-ms-exchange-antispam-messagedata: 3KP0DHMTZ6Pb0nHXceSUrFUFy87TjksRcQ6YsNlwvexcHah8l8rwEiJDK19UL9vFHiLJSA6RmJNsLGC3jjt4O2gvnPSqksaVX3SkFjek2Hohv1k2nQ+kRFkCRjNwV5ENRelm4rdAX3uqlUyG1+g1EQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB8E9DE8A89F4B49B9F1011D02DDB6D3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 90013b13-3147-4d29-15fc-08d7c9e9e55b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 20:37:50.6400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhXLotU2hZYwOLpIPQPBhM6oU8+7oLXOH6E8ju8cVPbNrWhhXtmRuc//VIxBbbwSEvJxQ6nrIY80i7Vl66211Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3608
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+PiBXZSBvbmx5IGNhcmUgdG8gcmVzdW1l
IHRyYW5zZmVyIGZvciBTRyBiZWNhdXNlIHRoZSByZXF1ZXN0IG1heWJlDQo+Pj4+IHBhcnRpYWxs
eSBjb21wbGV0ZWQuIGR3YzNfZ2FkZ2V0X2VwX3JlcXVlc3RfY29tcGxldGVkKCkgZG9lc24ndCBj
aGVjaw0KPj4+PiB0aGF0IG9mIGEgcmVxdWVzdCwgYXQgbGVhc3Qgbm90IGZ1bGx5Lg0KPj4+Pg0K
Pj4+PiAxKSBJdCBkb2Vzbid0IGFjY291bnQgZm9yIE9VVCBkaXJlY3Rpb24uDQo+Pj4+IDIpIEl0
IGRvZXNuJ3QgYWNjb3VudCBmb3IgaXNvYy4gRm9yIGlzb2MsIGEgcmVxdWVzdCBtYXliZSBjb21w
bGV0ZWQgd2l0aA0KPj4+PiBwYXJ0aWFsIGRhdGEuDQo+Pj4gSSB3b3VsZCByYXRoZXIgZml4IHRo
ZSBmdW5jdGlvbiBmb3IgdGhlc2UgY2FzZXMgaW5zdGVhZCBvZiByZW1vdmluZyBpdA0KPj4+IGNv
bXBsZXRlbHkuIFdoaWxlIGF0IHRoYXQsIGFsc28gbW92ZSB0aGUgcmVxLT5udW1fcGVuZGluZ19z
Z3MgY2hlY2sNCj4+PiBpbnNpZGUgZHdjM19nYWRnZXRfZXBfcmVxdWVzdF9jb21wbGV0ZWQoKQ0K
Pj4+DQo+PiBJZiB3ZSB3YW50IHRvIGtlZXAgdGhpcyBmdW5jdGlvbiwgdGhlIG9ubHkgdGhpbmcg
dGhpcyBmdW5jdGlvbiBkb2VzIGlzDQo+PiB0byBjaGVjayByZXEtPm51bV9wZW5kaW5nX3Nncy4g
V2UnZCBvbmx5IHJlc3VtZSB0aGUgcmVxdWVzdCBiZWNhdXNlDQo+PiB0aGVyZSBhcmUgcGVuZGlu
ZyBUUkJzIGZyb20gU0cgbm90IGNvbXBsZXRlZCB5ZXQuIElmIGFsbCB0aGUgVFJCcyBvZiBhDQo+
PiByZXF1ZXN0IGFyZSBjb21wbGV0ZWQsIHJlZ2FyZGxlc3MgaWYgYWxsIHRoZSBkYXRhIGFyZSBy
ZWNlaXZlZC9zZW50LCB3ZQ0KPj4gZG9uJ3QgcXVldWUgdGhlbSBhZ2Fpbi4gRG8geW91IHN0aWxs
IHdhbnQgdG8gaGF2ZSB0aGlzIGZ1bmN0aW9uPw0KPiBUaGUgZnVuY3Rpb24gZ2l2ZXMgYSBuYW1l
IHRvIGEgdmVyeSBzcGVjaWZpYyAiY29uY2VwdCIsIHRoYXQgb2YgYQ0KPiBjb21wbGV0ZWQgcmVx
dWVzdC4gWW91IGNhbiBzZWUgdGhhdCBldmVuIHRvZGF5LCB0aGUgZnVuY3Rpb24gaXMgc3VwZXIN
Cj4gc2ltcGxlOiBPVVQgZGlyZWN0aW9uIGlzIGFsd2F5cyBjb21wbGV0ZWQsIElOIGRpcmVjdGlv
biBpcyBjb21wbGV0ZWQNCj4gd2hlbiBhY3R1YWwgPT0gbGVuZ3RoLCB3ZSdyZSBqdXN0IG1pc3Np
bmcgdGhlIHBlbmRpbmdfc2dzIGNoZWNrLiBTbw0KPiBzb21ldGhpbmcgbGlrZSB0aGUgaHVua3Mg
YmVsb3cuDQoNCkZhaXIgcG9pbnQuDQoNCj4NCj4gT25lIHRoaW5nIEkgZG9uJ3QgZ2V0IGZyb20g
eW91ciBwYXRjaCBpcyB3aHkgeW91J3JlIGNvbXBsZXRlbHkgcmVtb3ZpbmcNCj4gdGhlIGZ1bmN0
aW9uIGFuZCB3aHkgaXNuJ3QgcmVxLT5kaXJlY3Rpb24gYW5kIGFjdHVhbCA9PSBsZW5ndGggbm90
DQo+IG5lZWRlZCBhbnltb3JlLiBDb3VsZCB5b3UgZXhwbGFpbj8NCg0KSXQncyBiZWNhdXNlIHRo
ZXJlJ3Mgbm8gdXNlIGZvciB0aGF0IGZ1bmN0aW9uIG91dHNpZGUgb2YgY2hlY2tpbmcgZm9yIA0K
bnVtYmVyIG9mIHBlbmRpbmcgU0dzIGFuZCByZXN1bWUuDQoNCj4NCj4gaHVua3M6DQo+DQo+IEBA
IC0yNDgyLDcgKzI0ODIsOCBAQCBzdGF0aWMgaW50IGR3YzNfZ2FkZ2V0X2VwX3JlY2xhaW1fdHJi
X2xpbmVhcihzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KPiAgIAkJCWV2ZW50LCBzdGF0dXMsIGZhbHNl
KTsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgYm9vbCBkd2MzX2dhZGdldF9lcF9yZXF1ZXN0X2Nv
bXBsZXRlZChzdHJ1Y3QgZHdjM19yZXF1ZXN0ICpyZXEpDQo+ICtzdGF0aWMgYm9vbCBkd2MzX2dh
ZGdldF9lcF9yZXF1ZXN0X2NvbXBsZXRlZChzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KPiArCQlzdHJ1
Y3QgZHdjM19yZXF1ZXN0ICpyZXEpDQo+ICAgew0KPiAgIAkvKg0KPiAgIAkgKiBGb3IgT1VUIGRp
cmVjdGlvbiwgaG9zdCBtYXkgc2VuZCBsZXNzIHRoYW4gdGhlIHNldHVwDQo+IEBAIC0yNDkxLDYg
KzI0OTIsMTYgQEAgc3RhdGljIGJvb2wgZHdjM19nYWRnZXRfZXBfcmVxdWVzdF9jb21wbGV0ZWQo
c3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxKQ0KPiAgIAlpZiAoIXJlcS0+ZGlyZWN0aW9uKQ0KPiAg
IAkJcmV0dXJuIHRydWU7DQo+ICAgDQo+ICsJLyoNCj4gKwkgKiBJZiB0aGVyZSBhcmUgcGVuZGlu
ZyBzY2F0dGVybGlzdCBlbnRyaWVzLCB3ZSBzaG91bGQNCj4gKwkgKiBjb250aW51ZSBwcm9jZXNz
aW5nIHRoZW0uDQo+ICsJICovDQo+ICsJaWYgKHJlcS0+bnVtX3BlbmRpbmdfc2dzKQ0KPiArCQly
ZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwlpZiAodXNiX2VuZHBvaW50X3hmZXJfaXNvYyhkZXAtPmVu
ZHBvaW50LmRlc2MpKQ0KPiArCQlkb19zb21ldGhpbmcoKTsNCg0KZG9fc29tZXRoaW5nKCkgd2ls
bCBhbHdheXMgcmV0dXJuIHRydWUgaGVyZS4NCg0KPiArDQo+ICAgCXJldHVybiByZXEtPnJlcXVl
c3QuYWN0dWFsID09IHJlcS0+cmVxdWVzdC5sZW5ndGg7DQoNClRoaXMgc2hvdWxkIGFsd2F5cyBi
ZSB0cnVlIGlmIHRoZSByZXF1ZXN0IGNvbXBsZXRlcy4gQnkgc3BlYywgYnVsayBhbmQgDQppbnRl
cnJ1cHQgZW5kcG9pbnRzIGRhdGEgZGVsaXZlcnkgYXJlIGd1YXJhbnRlZWQsIGFuZCB0aGUgcmV0
cnkvZXJyb3IgDQpkZXRlY3Rpb24gaXMgZG9uZSBhdCB0aGUgbG93ZXIgbGV2ZWwuwqAgSWYgYnkg
Y2hhbmNlIHRoYXQgdGhlIGhvc3QgZmFpbHMgDQp0byByZXF1ZXN0IGZvciBkYXRhIG11bHRpcGxl
IHRpbWVzIGF0IHRoZSBwYWNrZXQgbGV2ZWwsIGl0IHdpbGwgaXNzdWUgYSANCkNsZWFyRmVhdHVy
ZShoYWx0X2VwKSByZXF1ZXN0IHRvIHRoZSBlbmRwb2ludC4gVGhpcyB3aWxsIHRyaWdnZXIgZHdj
MyB0byANCnN0b3AgdGhlIGVuZHBvaW50IGFuZCBjYW5jZWwgdGhlIHRyYW5zZmVyLCBhbmQgd2Ug
c3RpbGwgd29uJ3QgcmVzdW1lIA0KdGhpcyB0cmFuc2Zlci4NCg0KPiAgIH0NCj4gICANCj4gQEAg
LTI1MTUsOCArMjUyNiw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZXBfY2xlYW51cF9jb21w
bGV0ZWRfcmVxdWVzdChzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KPiAgIA0KPiAgIAlyZXEtPnJlcXVl
c3QuYWN0dWFsID0gcmVxLT5yZXF1ZXN0Lmxlbmd0aCAtIHJlcS0+cmVtYWluaW5nOw0KPiAgIA0K
PiAtCWlmICghZHdjM19nYWRnZXRfZXBfcmVxdWVzdF9jb21wbGV0ZWQocmVxKSB8fA0KPiAtCQkJ
cmVxLT5udW1fcGVuZGluZ19zZ3MpIHsNCj4gKwlpZiAoIWR3YzNfZ2FkZ2V0X2VwX3JlcXVlc3Rf
Y29tcGxldGVkKGRlcCwgcmVxKSkNCj4gICAJCV9fZHdjM19nYWRnZXRfa2lja190cmFuc2Zlcihk
ZXApOw0KPiAgIAkJZ290byBvdXQ7DQo+ICAgCX0NCj4NCg0KQlIsDQpUaGluaA0K
