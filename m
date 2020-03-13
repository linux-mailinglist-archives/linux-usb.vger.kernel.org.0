Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377DA184F80
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 20:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgCMTuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 15:50:24 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:49944 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726477AbgCMTuX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 15:50:23 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B7638C0F9A;
        Fri, 13 Mar 2020 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584129023; bh=LInyYJDp3UfNyySVarO+lMqjxi39vG0dt8rK5AbLBWQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JIOa7vSF/irJFNT6veodYZJnTx0FQW3UKAYvZgqQvt2D+qWC1KOUkOks/1LdonAFD
         WXR84ds875DlQTrlMRNSFE37vrZjF2zkT0V51RPZw5IbV4aMlnZrX+ZovNByDWT/I8
         DvtMVUIdYHktUI4WkBLe3dSspdwbLJfHuhlsRfFxvx5HeGLCnQQKSupKLQcRvqswie
         BUFPeEr1xtUtSsOUSDiFDZkzJjN7sLWBMaQ/7b7KRq4lGJ5we3LRo2FGNPiWV5mBHr
         qfny/nD6ug15xG6EhtEeYBG36fw4SzumUvUJ4QYEHkpG0+3mEpINvQOKr8hA1uZ/4M
         lT+3Y0C6UzR3g==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 38ADBA0079;
        Fri, 13 Mar 2020 19:50:22 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 13 Mar 2020 12:50:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 13 Mar 2020 12:50:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdF8sRAsLFAq/bh4ov0kt358GKRh+0mYJckKCyzRRW3Syfc9zwz+fpw4yHUskeHRua7dBn8ndiVsLjJ48Nme3HMc991fgJBVPoZz8Y3L4zk4kSYQnxb0Nt1oZZQfC74aPqL1i1t7rxHO3L2VUEYXchH2Lsl0+tEUNxpop1mr73PfPBojx7UjbQqBykbYd3wwU54WjQCezmcazllbAl72wBC64qD9ZSj6bAbdG9LDwsC54YIGCAW/Pmarer6ipKwyVj/WRY8LzpvzPFvNzO54AxgThZ+8dQGZ7Gjy8KY++myw1Vp/B9tkFLsUMBUq6o96y4YuPC4+rUl6WX+UjW86cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LInyYJDp3UfNyySVarO+lMqjxi39vG0dt8rK5AbLBWQ=;
 b=NWRb9+isiKD+VD3cuGI4qFa6qGrG5M1ycipuw8RIqL16kYoYpAa/eC5DGiCnfoEhTXKo9fZELVZJ8oPSAlYVXdi4n9w8OM39M2WD6dtqFWL/HV8Bu2uHLvnX6nmAl+AjuS4snb0D9WbHSPRK2rQl86HloDGWUyrBE06lmAPGLtI1mL8wqKFu1b6mB0Bdjv5oJHfrXH4AnshB7bcRdOUo1VMf4iA9cKHYh148jt8oNO7C/BYwYd4zqKnDvDUcwDukJ5dVbZsWxYf+h8pQYjuqIlEsN72E5u5j7DrTHQ8TEHy4K9NbC2VZWZDMsmXQ9BzjLb+CBYejqP4VvLIYxgyJxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LInyYJDp3UfNyySVarO+lMqjxi39vG0dt8rK5AbLBWQ=;
 b=VyNuZuEDV8Dakt3X8g7yksa/QLl6Vda1/DLRWKAmNkpYEiXwnpFP5NY+Rlfny1aqTNjF3ANu/EhYkH9KdA7IN1aKHv+Nm//4d3TB6ZJn5REigQuVkeWyT1yHDVGRHVtozzlZH/3lzMVj7ZfXJRDc4RCoPLkytRmeFMwHnd/gqE4=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2965.namprd12.prod.outlook.com (2603:10b6:a03:ae::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13; Fri, 13 Mar
 2020 19:50:20 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2793.018; Fri, 13 Mar 2020
 19:50:20 +0000
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
Thread-Index: AQHV+N3BzBLybznwZ0OCZe4JISGATKhGk1EAgABcM4A=
Date:   Fri, 13 Mar 2020 19:50:20 +0000
Message-ID: <c17da637-abf1-75b0-e8bf-737958773e8e@synopsys.com>
References: <cover.1584065705.git.thinhn@synopsys.com>
 <015470a7d9b950df757b1abfecd6ef398ef04710.1584065705.git.thinhn@synopsys.com>
 <874kusgwuz.fsf@kernel.org>
In-Reply-To: <874kusgwuz.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: 0708e117-f751-438b-5206-08d7c787c304
x-ms-traffictypediagnostic: BYAPR12MB2965:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2965029A1E12E0DA54F87EC5AAFA0@BYAPR12MB2965.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 034119E4F6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(366004)(346002)(376002)(39860400002)(136003)(199004)(6486002)(8936002)(76116006)(6506007)(5660300002)(31696002)(86362001)(2616005)(26005)(36756003)(186003)(8676002)(31686004)(81156014)(71200400001)(81166006)(478600001)(4326008)(66476007)(2906002)(107886003)(66946007)(110136005)(66446008)(6512007)(316002)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB2965;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0PL+ddPFO1sjNoSvR5jR4gtmGvnvCeKd2UKQ5T+kf+d2dwOh8ug5tP2hcMiue2Rw+VKRqry6PPryhUjzwwm7WWhqkvbYq1FPSpkdwtNvhW0Q69U6D7qxulD+NU3SLIa+R+I81AV02RvaAe9lMsWmxdrwCg4Dafg+enNl/iyWbt0xxnS8P81V5ioO6xOJVXn6M+LHjA+3gug4NWLj1c/WJu0K/CW/KFYRoyha+u3FhbwkXOFTccidICzU4BV98+2ezgqkEc3A519Xi5FcFqroUcUDtNmkIJk/TcbuDFwPI/XFeuq4KvthVD/lLext410Eu7gexe1CHQAq4TLSE/Byditmp44/mEJ7WplLkzLrHohjNmMJJnzg/F9dz8nSTikqBKOVUAcpezTzFVKj/F5QmnUskqa6n4OzT7G0YAi40lmWiwHSSWpmOoOvZq6u7RtE
x-ms-exchange-antispam-messagedata: zFMilmBfAUCR2WUh4A/lYRT2RB0sFZTwfmD2nvlmsjWL1UuSw4p/RBhIbUtSAtdjGFTX+dK9u5aE1Ie8BKZZsqpbHDjVPpf6znsO87maXNZdU0/x5nKAzGnTMdhu5edzCl8f+XwKqBOcvvz8q3V7xQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <944859A900162C46A1F925C29D20468A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0708e117-f751-438b-5206-08d7c787c304
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2020 19:50:20.0748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbXEjIqUKW4gerodxwoQsX69hE30B7EiMeBzAxyS5YMpagDnh7c8R3o4LO5PPjVggXUHQQVF3RMhHy2FT7bhFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2965
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IEhpIFRoaW5oLA0KPg0KPiBUaGlu
aCBOZ3V5ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+IElmIGR3YzMg
ZmFpbHMgdG8gaXNzdWUgU1RBUlRfVFJBTlNGRVIvVVBEQVRFX1RSQU5TRkVSIGNvbW1hbmQsIHRo
ZW4gd2UNCj4+IHNob3VsZCBwcm9wZXJseSBlbmQgYW4gYWN0aXZlIHRyYW5zZmVyIGFuZCBnaXZl
IGJhY2sgYWxsIHRoZSBzdGFydGVkDQo+PiByZXF1ZXN0cy4gSG93ZXZlciBpZiBpdCdzIGZvciBh
biBpc29jIGVuZHBvaW50LCB0aGUgZmFpbHVyZSBtYXliZSBkdWUgdG8NCj4+IGJ1cy1leHBpcnkg
c3RhdHVzLiBJbiB0aGlzIGNhc2UsIGRvbid0IGdpdmUgYmFjayB0aGUgcmVxdWVzdHMgYW5kIHdh
aXQNCj4+IGZvciB0aGUgbmV4dCByZXRyeS4NCj4+DQo+PiBGaXhlczogNzIyNDZkYTQwZjM3ICgi
dXNiOiBJbnRyb2R1Y2UgRGVzaWduV2FyZSBVU0IzIERSRCBEcml2ZXIiKQ0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhpbmggTmd1eWVuIDx0aGluaG5Ac3lub3BzeXMuY29tPg0KPiBjb3VsZCB5b3UgZ2l2
ZSBzb21lIGRldGFpbHMgcmVnYXJkaW5nIHdoZW4gZG9lcyB0aGlzIGhhcHBlbj8NCj4NCg0KU28s
IGhlcmUgYXJlIHRoZSBzY2VuYXJpb3MgaW4gd2hpY2ggZHdjM19zZW5kX2dhZGdldF9lcF9jbWQo
KSBtYXkgcmV0dXJuIA0KYSBuZWdhdGl2ZSBlcnJubzoNCg0KKiAtRUFHQUlOOiBJc29jIGJ1cy1l
eHBpcnkgc3RhdHVzDQogwqDCoCBBcyB5b3UgYWxyZWFkeSBrbm93LCB0aGlzIG9jY3VycyB3aGVu
IHdlIHRyeSB0byBzY2hlZHVsZSBpc29jIHRvbyANCmxhdGUuIElmIHdlJ3JlIGdvaW5nIHRvIHJl
dHJ5IHRoZSByZXF1ZXN0LCBkb24ndCB1bm1hcCBpdC4NCg0KKiAtRUlOVkFMOiBObyByZXNvdXJj
ZSBkdWUgdG8gaXNzdWluZyBTVEFSVF9UUkFOU0ZFUiB0byBhbiBhbHJlYWR5IA0Kc3RhcnRlZCBl
bmRwb2ludA0KIMKgwqAgVGhpcyBoYXBwZW5zIGdlbmVyYWxseSBiZWNhdXNlIG9mIFNXIHByb2dy
YW1taW5nIGVycm9yDQoNCiogLUVUSU1FRE9VVDogUG9sbGluZyBmb3IgQ01EQUNUIHRpbWVkIG91
dA0KIMKgwqAgVGhpcyBzaG91bGQgbm90IGhhcHBlbiB1bmxlc3MgdGhlIGNvbnRyb2xsZXIgaXMg
ZGVhZCBvciBpbiBzb21lIGJhZCANCnN0YXRlDQoNCkJSLA0KVGhpbmgNCg==
