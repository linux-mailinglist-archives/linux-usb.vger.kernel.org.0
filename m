Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3187F198EB2
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 10:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729425AbgCaIj2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 04:39:28 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:33276 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726397AbgCaIj1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 04:39:27 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E4D1C0F39;
        Tue, 31 Mar 2020 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585643966; bh=DPL3hJxRqQiRlXdmuL2sMfvW7j1lc7uRHfTi+pROOWk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=KWlfNfUPYIjE75XEGNx4oTdylxVZtJIRgg8qeBHVhsnCUTO8AMp3DCYrlgWlACiCe
         gPgqLlFMMdOGS5ua1SQldGZriiWKn6nN1/ZOqXZ/MKytsSUjbDrUaJDzCked74qlQu
         yrkHXyNuo2gaKmojxygDjQvjCO/tGm7c5T5LyMZijkqHowdon/VeAdbsomoDiQacQW
         UTdonXwojYF0AG7wIzDtvrlJl8zfeW7ibIgAf4wGjJnBXtnPvgerdw7EG57+wkYyeG
         /eVzOb4N8E15EEVsMbeuAknbDIx2Q42XAkZI77VzFt0UQ8+ZuCAQljNmuEPIjkuspV
         tUYU4B73nsfgg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3A6A8A007F;
        Tue, 31 Mar 2020 08:39:26 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 31 Mar 2020 01:39:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 31 Mar 2020 01:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmIl3j5Xf9ODjL26HiFQWMFcIudyD0EGas4OnY8fjPR1Uxqg7ef1ujs6gZAgBZEjimEW/gTHxhBZ/eMzdzxIfhKamcRqaMs9ylOGz3yQ6erXTo7ubHicghEKmvt0V69H6EMqX/yxsK1HZHULVawANG26tjxxlusl+jQwd9xUIagjYxIuhX30Dt/zQCKJKVCPxwG5vuqLuqt/TjdwiDzTt1r9IRhF/iaKLjCzCvW2R0PQE/qvSaDzLx//2Zm9mgW20TtXKaNRdVJgWcF4wFwb9LDHHP8/XV9EtBtUbUqJOlJ7VGJTpWgSBxjXTv+UWEYpgVvckM3y7sNJGyNcQD1IvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPL3hJxRqQiRlXdmuL2sMfvW7j1lc7uRHfTi+pROOWk=;
 b=gZQLyfLNJRv1vZLxxWVTAwOl3Dh4+9s7M1i4XZww+iKR5m0mfasHNE/sc3WQk+UgPujozy1LdeXuRAMe3aQk3JSWu9uMQHUiQAB0aDsOykqJZqN3Znz9/KkRpPekqEZEcZoFgmyfqNSgL6V9nVp3guo04a515vdHy/lhJ8lNHvJxC0YUa5w+TUhdpX7y67llMqeeDTVAVkoqCDmlU8Fi0ZFURsEdosF8vzePvWoVlzboF7Ocvru8V0aLBSrStt9wGJjxUJMsnGCnk8O/3W8Q69/5rOv91ugGrpNXOo2BBiDHMb6Z2h5atDnsdrE+bYlirwc7InQcygo33ufMm/4SXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPL3hJxRqQiRlXdmuL2sMfvW7j1lc7uRHfTi+pROOWk=;
 b=PaDT7e6ncSaxZlxzmkcF7y7UNZ3sBeulHFb8kcV9AoZry1ygdwzSQ2zZ/CalTpNzi9UB/6+VZKkvPCE9jpMNnxLqBqjDrOpWc6GmQnTMYRq8bi6O2UFVX7+akhF3X9QydIj4vqT08md2mrg9DxAhQllxBa/LkKlw1+Pk0EF5xUw=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2614.namprd12.prod.outlook.com (2603:10b6:a03:6b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 08:39:24 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 08:39:24 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Index: AQHV82muQmX55NMUl0emMsblflREJqhJbrQAgAD/cgCAAGwZAIAA5GqAgBObrwCAAQbKAIAAkdsAgAC5c4CAACLBAIAARocAgABryoCAAAdwgA==
Date:   Tue, 31 Mar 2020 08:39:24 +0000
Message-ID: <8aacdddf-0a86-d0d9-5161-682b8c26639b@synopsys.com>
References: <660a74249e64b3b62ca9b394584387baee67a119.1583466150.git.thinhn@synopsys.com>
 <87d09ef01l.fsf@kernel.org>
 <df600201-0063-bb5f-19be-ecbeaada37f0@synopsys.com>
 <87blow239f.fsf@kernel.org>
 <9a2504a3-6a89-39f2-3a9c-9ee933903d8e@synopsys.com>
 <87v9mn37vb.fsf@kernel.org>
 <eca2ea69-89dc-3ccc-b280-c1b080ad263f@synopsys.com>
 <87bloe2qq3.fsf@kernel.org>
 <d451b3cd-94e2-13a5-7169-8a87f89fa769@synopsys.com>
 <87369p34sz.fsf@kernel.org>
 <804450e5-758c-5ec6-88ae-302c023bf1e3@synopsys.com>
 <87tv250wou.fsf@kernel.org>
In-Reply-To: <87tv250wou.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=thinhn@synopsys.com; 
x-originating-ip: [149.117.75.12]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7fc48f3-91bc-49cd-0b46-08d7d54f046b
x-ms-traffictypediagnostic: BYAPR12MB2614:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB261435C4A23ED108D512C690AAC80@BYAPR12MB2614.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(376002)(346002)(396003)(136003)(39860400002)(366004)(316002)(36756003)(478600001)(86362001)(110136005)(186003)(76116006)(31696002)(66556008)(64756008)(31686004)(66476007)(2616005)(66946007)(26005)(66446008)(2906002)(81156014)(5660300002)(71200400001)(6506007)(8676002)(81166006)(4326008)(6486002)(8936002)(107886003)(6512007);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9xdYl7Pt2Aq7LYsGDufnE0nJFyXHlKQ0xlflF3jmkPLp0g3VYHJwZkNutEIXb1GoWhDEHvFq/YU9iTbhcYH57s1WKmYjjLbX9IHnwRLMg4Hxv46O9lqO0GwJX7DiC/kQxk8apqjRqQIg/uFXIPAyQXjd4JX99lV1t4++BVMpfGUs8N7SZBNOeHk4LGsihxcakV4A6iJtDyhUXGV1Vhp90bn+bOzM8QA33+TxNpigZ2i0RY+hnBAwxuPwHarq9sDUyw8oi7K4vJfg1qghQb1L3jCs47QGDEeBZ7dyoLy843gRRO2ZBMJeZLt2AqjXSkCqT4n+PMGrscThBZWkeMTd89VgxeMuoryWy7EI/t11AWcFxJwd+6dlgav71RFm0fXCOO4w6ZxowGd5nzeH6IHHiBzGfIOtf6L/JCDexa+ds1z0rD3j+2FwlvWjmlHymPEH
x-ms-exchange-antispam-messagedata: NLE+IE4TQ33uyDGoVu7OuqYLTO0EOD9bbzSGWqr/4DrS7as1HaO0suLtcYzLaDozc4iDz1+a00WARIVA94baZOG3aY0T1tS+xJ0jjAsUs7oq7UEMEEOmT2WFfSlm7TQIWC0Q36+uqhHHxRUW1k/j7g==
Content-Type: text/plain; charset="utf-8"
Content-ID: <4592FB722813B04CB5F5918BBCA73858@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fc48f3-91bc-49cd-0b46-08d7d54f046b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 08:39:24.8152
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O4ky7ENvKdArRnz4Xj5W6Ekh+/KrZoz9MjKQsZycIAWyzxMZo+8Eux5QieoS4/Ib0kP86clozhW6wGsYLsNp2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2614
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

RmVsaXBlIEJhbGJpIHdyb3RlOg0KPiBIaSwNCj4NCj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5
ZW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4gVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5A
c3lub3BzeXMuY29tPiB3cml0ZXM6DQo+Pj4+Pj4gVGhlIGNvbmRpdGlvbiBoZXJlIGlzIGlmICgh
cmVxdWVzdF9jb21wbGV0ZSgpKSwgdGhlbiBraWNrX3RyYW5zZmVyKCkuDQo+Pj4+Pj4gTGV0J3Mg
dGFrZSBhIGxvb2sgYXQgd2hhdCBraWNrX3RyYW5zZmVyKCkgZG86DQo+Pj4+Pj4NCj4+Pj4+PiBr
aWNrX3RyYW5zZmVyKCkgd2lsbCBwcmVwYXJlIG5ldyBUUkJzIGFuZCBpc3N1ZSBTVEFSVF9UUkFO
U0ZFUiBjb21tYW5kDQo+Pj4+Pj4gb3IgVVBEQVRFX1RSQU5TRkVSIGNvbW1hbmQuIFRoZSBlbmRw
b2ludCBpcyBhbHJlYWR5IHN0YXJ0ZWQsIGFuZCBub3RoaW5nDQo+Pj4+Pj4gaXMgY2F1c2luZyBp
dCB0byBlbmQgYXQgdGhpcyBwb2ludC4gU28gaXQgc2hvdWxkIGp1c3QgYmUgVVBEQVRFX1RSQU5T
RkVSDQo+Pj4+Pj4gY29tbWFuZC4gVVBEQVRFX1RSQU5TRkVSIGNvbW1hbmQgdGVsbHMgdGhlIGNv
bnRyb2xsZXIgdG8gdXBkYXRlIGl0cyBUUkINCj4+Pj4+PiBjYWNoZSBiZWNhdXNlIHRoZXJlIHdp
bGwgYmUgbmV3IFRSQnMgcHJlcGFyZWQgZm9yIHRoZSByZXF1ZXN0Lg0KPj4+Pj4+DQo+Pj4+Pj4g
SWYgdGhpcyBpcyBub24tU0cvbm9uLWNoYWluZWQgVFJCIHJlcXVlc3QsIHRoZW4gdGhlcmUncyBv
bmx5IDEgVFJCIHBlcg0KPj4+Pj4+IHJlcXVlc3QgZm9yIElOIGVuZHBvaW50cy4gSWYgdGhhdCBU
UkIgaXMgY29tcGxldGVkLCB0aGF0IG1lYW5zIHRoYXQgdGhlDQo+Pj4+Pj4gcmVxdWVzdCBpcyBj
b21wbGV0ZWQuIFRoZXJlJ3Mgbm8gcmVhc29uIHRvIGlzc3VlIGtpY2tfdHJhbnNmZXIoKSBhZ2Fp
bi4NCj4+Pj4+IG5vdCBlbnRpcmVseSB0cnVlIGZvciBidWxrLiBXZSBuZXZlciBzZXQgTFNUIGJp
dDsgd2Ugd2lsbCBuZXZlciBjb21wbGV0ZQ0KPj4+Pj4gYSB0cmFuc2Zlciwgd2UgY29udGludWFs
bHkgYWRkIG1vcmUgVFJCcy4gVGhlIHJlYXNvbiBmb3IgdGhpcyBpcyB0bw0KPj4+Pj4gYW1vcnRp
emUgdGhlIGNvc3Qgb2YgYWRkaW5nIG5ldyB0cmFuc2ZlcnMgdG8gdGhlIGNvbnRyb2xsZXIgY2Fj
aGUgYmVmb3JlDQo+Pj4+PiBpdCBydW5zIG91dCBvZiBUUkJzIHdpdGhvdXQgSFdPLg0KPj4+PiBS
aWdodCwgSSB3YXMgcmVmZXJyaW5nIHRvICJyZXF1ZXN0IiByYXRoZXIgdGhhbiB0cmFuc2ZlciAo
YXMgaW4gYQ0KPj4+PiB0cmFuc2ZlciBtYXkgaGF2ZSAxIG9yIG1vcmUgcmVxdWVzdHMpLg0KPj4+
Pg0KPj4+Pj4gSG93IGFib3V0IHdlIGNoYW5nZSB0aGUgdGVzdCB0byBzYXkgImlmIEkgaGF2ZSBu
b24tc3RhcnRlZCBUUkJzIGFuZCBJJ20NCj4+Pj4+IGJ1bGsgKG5vbi1zdHJlYW0pIG9yIGludGVy
cnVwdCBlbmRwb2ludCwga2ljayBtb3JlIHRyYW5zZmVycyI/DQo+Pj4+Pg0KPj4+Pj4+IFdoZW4g
dGhlIGZ1bmN0aW9uIGRyaXZlciBxdWV1ZXMgYSBuZXcgcmVxdWVzdCwgdGhlbiB0aGVyZSB3aWxs
IGJlIG5ldw0KPj4+Pj4+IFRSQnMgdG8gcHJlcGFyZSBhbmQgdGhlbiB0aGUgZHJpdmVyIGNhbiBr
aWNrX3RyYW5zZmVyKCkgYWdhaW4uDQo+Pj4+PiBXZSBtYXkgYWxyZWFkeSBoYXZlIG1vcmUgVFJC
cyBpbiB0aGUgcGVuZGluZyBsaXN0IHdoaWNoIG1heSBub3QgaGF2ZQ0KPj4+Pj4gYmVlbiBzdGFy
dGVkIGJlZm9yZSB3ZSBkaWRuJ3QgaGF2ZSBmcmVlIFRSQnMgdG8gdXNlLiBXZSBqdXN0IGNvbXBs
ZXRlZCBhDQo+Pj4+PiBUUkIsIG1pZ2h0IGFzIHdlbGwgdHJ5IHRvIHVzZSBpdCBmb3IgbW9yZSBy
ZXF1ZXN0cy4NCj4+Pj4gWWVzIHdlIGNhbiBhbmQgd2Ugc2hvdWxkLCBidXQgd2UgZGlkbid0IGNo
ZWNrIHRoYXQuIEFsc28gaXQgc2hvdWxkbid0IGJlDQo+Pj4+IGluIHRoZSByZXF1ZXN0X2NvbXBs
ZXRlKCkgY2hlY2sgZnVuY3Rpb24gYXMgdGhleSBhcmUgcGFydCBvZiBkaWZmZXJlbnQNCj4+Pj4g
cmVxdWVzdHMuDQo+Pj4+DQo+Pj4+Pj4gU28sIHRoaXMgY29uZGl0aW9uIHRvIGNoZWNrIGlmIHJl
cXVlc3RfY29tcGxldGUoKSBpcyBvbmx5IHZhbGlkIGZvciBhDQo+Pj4+Pj4gcmVxdWVzdCB3aXRo
IG11bHRpcGxlIGNoYWluZWQgVFJCcy4gU2luY2Ugd2UgY2FuIG9ubHkgY2hlY2sgZm9yIElODQo+
Pj4+Pj4gZGlyZWN0aW9uLCB0aGUgY2hhaW5lZCBUUkIgc2V0dXAgcmVsYXRlZCB0byBPVVQgZGly
ZWN0aW9uIHRvIGZpdA0KPj4+Pj4+IE1heFBhY2tldFNpemUgZG9lcyBub3QgYXBwbHkgaGVyZS4g
V2hhdCBsZWZ0IGlzIGNoYWluZWQgVFJCcyBmb3IgU0cuIEluDQo+Pj4+PiB0aGlzIHBhcnQgaXMg
Y2xlYXIgbm93IGFuZCB5b3UncmUgY29ycmVjdC4gVGhhbmtzDQo+Pj4+Pg0KPj4+Pj4+IHRoaXMg
Y2FzZSwgd2UgZG8gd2FudCB0byBraWNrX3RyYW5zZmVyIGFnYWluLiBUaGlzIG1heSBoYXBwZW4g
d2hlbiB3ZQ0KPj4+Pj4+IHJ1biBvdXQgb2YgVFJCcyBhbmQgd2UgaGF2ZSB0byB3YWl0IGZvciBh
dmFpbGFibGUgVFJCcy4gV2hlbiB0aGVyZSBhcmUNCj4+Pj4+PiBhdmFpbGFibGUgVFJCcyBhbmQg
c3RpbGwgcGVuZGluZyBTR3MsIHRoZW4gd2Ugd2FudCB0byBwcmVwYXJlIHRoZSByZXN0DQo+Pj4+
Pj4gb2YgdGhlIFNHIGVudHJpZXMgdG8gZmluaXNoIHRoZSByZXF1ZXN0LiBTbyBraWNrX3RyYW5z
ZmVyKCkgbWFrZXMgc2Vuc2UNCj4+Pj4+PiBoZXJlLg0KPj4+Pj4gUmlnaHQgYnV0IHdlIGNhbiBy
dW4gb3V0IG9mIFRSQnMgZXZlbiBpbiBub24tY2hhaW5lZCBjYXNlLiBJIHJlbWVtYmVyDQo+Pj4+
PiB0ZXN0aW5nIHRoaXMgeWVhcnMgYWdvIGJ5IGdpdmluZyBnX21hc3Nfc3RvcmFnZSBhIGxpc3Qg
b2YgMzAwDQo+Pj4+PiByZXF1ZXN0cy4gVGhlIHJlYXNvbiBmb3Iga2lja2luZyB0aGUgdHJhbnNm
ZXIgaXMgZGlmZmVyZW50LCBidXQgaXQncw0KPj4+Pj4gYmVuZWZpY2lhbCBhbnlob3cuDQo+Pj4+
Pg0KPj4+PiBJbiB0aGlzIGNhc2UsIHRoZSBjaGVjayBzaG91bGQgYmUgZm9yIGlmIHRoZSBwZW5k
aW5nX2xpc3QgaXMgbm90IGVtcHR5LA0KPj4+PiB0aGVuIGtpY2sgYWdhaW4uDQo+Pj4+DQo+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJpdmVycy91c2IvZHdj
My9nYWRnZXQuYw0KPj4+PiBpbmRleCA2YTA0YzlhZmNhYjYuLmQ4MzE4ZGU1NTAwMCAxMDA2NDQN
Cj4+Pj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4+PiArKysgYi9kcml2ZXJz
L3VzYi9kd2MzL2dhZGdldC5jDQo+Pj4+IEBAIC0yOTc1LDE0ICsyOTc1LDcgQEAgc3RhdGljIGlu
dA0KPj4+PiBkd2MzX2dhZGdldF9lcF9yZWNsYWltX3RyYl9saW5lYXIoc3RydWN0IGR3YzNfZXAg
KmRlcCwNCj4+Pj4NCj4+Pj4gICAgwqBzdGF0aWMgYm9vbCBkd2MzX2dhZGdldF9lcF9yZXF1ZXN0
X2NvbXBsZXRlZChzdHJ1Y3QgZHdjM19yZXF1ZXN0ICpyZXEpDQo+Pj4+ICAgIMKgew0KPj4+PiAt
wqDCoMKgwqDCoMKgIC8qDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCAqIEZvciBPVVQgZGlyZWN0aW9u
LCBob3N0IG1heSBzZW5kIGxlc3MgdGhhbiB0aGUgc2V0dXANCj4+Pj4gLcKgwqDCoMKgwqDCoMKg
ICogbGVuZ3RoLiBSZXR1cm4gdHJ1ZSBmb3IgYWxsIE9VVCByZXF1ZXN0cy4NCj4+Pj4gLcKgwqDC
oMKgwqDCoMKgICovDQo+Pj4+IC3CoMKgwqDCoMKgwqAgaWYgKCFyZXEtPmRpcmVjdGlvbikNCj4+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7DQo+Pj4+IC0NCj4+
Pj4gLcKgwqDCoMKgwqDCoCByZXR1cm4gcmVxLT5yZXF1ZXN0LmFjdHVhbCA9PSByZXEtPnJlcXVl
c3QubGVuZ3RoOw0KPj4+PiArwqDCoMKgwqDCoMKgIHJldHVybiByZXEtPm51bV9wZW5kaW5nX3Nn
cyA9PSAwOw0KPj4+PiAgICDCoH0NCj4+Pj4NCj4+Pj4gICAgwqBzdGF0aWMgaW50IGR3YzNfZ2Fk
Z2V0X2VwX2NsZWFudXBfY29tcGxldGVkX3JlcXVlc3Qoc3RydWN0IGR3YzNfZXAgKmRlcCwNCj4+
Pj4gQEAgLTMwMDcsNyArMzAwMCw3IEBAIHN0YXRpYyBpbnQNCj4+Pj4gZHdjM19nYWRnZXRfZXBf
Y2xlYW51cF9jb21wbGV0ZWRfcmVxdWVzdChzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KPj4+PiAgICDC
oMKgwqDCoMKgwqDCoCByZXEtPnJlcXVlc3QuYWN0dWFsID0gcmVxLT5yZXF1ZXN0Lmxlbmd0aCAt
IHJlcS0+cmVtYWluaW5nOw0KPj4+Pg0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoCBpZiAoIWR3YzNf
Z2FkZ2V0X2VwX3JlcXVlc3RfY29tcGxldGVkKHJlcSkgfHwNCj4+Pj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcS0+bnVtX3BlbmRpbmdfc2dzKSB7DQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCAhbGlzdF9lbXB0eSgmZGVwLT5wZW5kaW5nX2xpc3Qp
KSB7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX2R3YzNfZ2FkZ2V0
X2tpY2tfdHJhbnNmZXIoZGVwKTsNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gb3V0Ow0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+DQo+Pj4+DQo+Pj4+
IFRoaXMgaXMgdW5saWtlbHkgdG8gaGFwcGVuLCBidXQgaXQncyBuZWNlc3NhcnkgdG8gYmUgdGhl
cmUuDQo+Pj4+DQo+Pj4+IExldCBtZSBrbm93IGlmIHlvdSdyZSBvayB3aXRoIHRoZSBjaGFuZ2Us
IEknbGwgY3JlYXRlIGEgZm9ybWFsIHBhdGNoIGZvciBpdC4NCj4+PiBMb29rcyBnb29kLCB3ZSBt
YXkganVzdCByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvDQo+Pj4gZHdjM19nYWRnZXRfZXBfc2hvdWxk
X2NvbnRpbnVlKCkgb3Igc29tZXRoaW5nIHNpbWlsYXIgYW5kIG1vdmUgdGhlDQo+Pj4gIWxpc3Rf
ZW1wdHkoKSBjaGVjayBpbiB0aGVyZSB0b28uDQo+Pj4NCj4+IEkgZm9yZ290IHRoaXMgY29uZGl0
aW9uIHNraXBzIHRoZSBkd2MzX2dhZGdldF9naXZlYmFjaygpLiBJIGhhdmUgdG8NCj4+IHNwbGl0
IGl0LiBMZXQgbWUgc2VuZCBvdXQgdGhlIHJldmlzZWQgcGF0Y2hlcyBhbmQgeW91IGNhbiByZXZp
ZXcuDQo+IFN1cmUsIEkgdGhpbmsgcGF0Y2ggMSBjYW4gZ28gaW4gZHVyaW5nIC1yYy4gRG8gd2Ug
bmVlZCBhIENjIHN0YWJsZSBvbg0KPiBpdCwgdGhvdWdoPw0KPg0KPiBQYXRjaCAyIHdpbGwgaGF2
ZSB0byB3YWl0IHVudGlsIHY1LjguDQo+DQoNClN1cmUuIEknbGwgcmVzZW5kIHdpdGggQ2Mgc3Rh
YmxlIHRhZy4NCg0KVGhhbmtzLA0KVGhpbmgNCg==
