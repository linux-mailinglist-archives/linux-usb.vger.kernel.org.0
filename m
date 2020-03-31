Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C93E81989A5
	for <lists+linux-usb@lfdr.de>; Tue, 31 Mar 2020 03:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgCaBsf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Mar 2020 21:48:35 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:47122 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729035AbgCaBsf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Mar 2020 21:48:35 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 82DC2C0FDE;
        Tue, 31 Mar 2020 01:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1585619313; bh=I7COFZTGQHvA9Kq+3pDwvPmMXmnzMst+Si18A/cnpkU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=G24YAMLwXPXTEYWwnJsT9oA4IACuxlfn2djDBp2pLYRypag8WMokXnHOPKdTe8YRA
         wyPzreQG4VBiwximCYQEZAi4/jNwrcLDglYwvNCz+Bq656FAf9Oiq8taK1KR+dRqx6
         z5421L3MX8eN5DqwFz1tRhcvJw1FrN0A89MnMOZlzsOeOBJsBqb04tV5aoxpwYGPfi
         EKyYwpBv737MpueEcC011NXPgJGE/6NeUD9hqS1/FD4f11y5G8mXvGVe/TVLmDUEBc
         amw9G7PnQ9yL8ca504+hpZUmCpSzACbIQpoOyCcsFthMyxfeWjxlyuD1g/XJFk1nfu
         Tm+zk/NoiTUrg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 35A88A007F;
        Tue, 31 Mar 2020 01:48:33 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 30 Mar 2020 18:47:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 30 Mar 2020 18:47:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzgdwbjLdTTSiqkHSXwmvQJVUmJckYD363sATIxFsWxaPt1S8s1C/Yr3GMY+N01+65AWTFwHBvCIBqNde18qyWb+fIxEYcazYXYRj/vRAqPEipYJV/2Arjl4Dlm1+iaz2o+n2v2xC3KQHlnZkwWUENN3oCS9rQc+AsdXdPYYhxCLIm7NON/OwB7VTT/UnN7Tv0bjY40mjjHN7vPdlExSrunIeXQ67Y690Y+P0now9XwJMOU0nRN11qc6TPE6M7QMlW5lri1ov7N/CQsSD97dFk4ofGn3MDou0jebiXPLAuANzkmTc47VZIOeYOgP5QPPDrmFizI9X1GHdEjw5iCzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7COFZTGQHvA9Kq+3pDwvPmMXmnzMst+Si18A/cnpkU=;
 b=h+DarRiYWFN4q982BHIqRFjxoDY5vhPqVInEa9oiCh4pfAWsutpr/lECdE+cvAggE9l6lxjJMA5JdbNlgZ39vJqX2XKv4pDJxY6/00jSfq6giQJ40n6qbd8J0aKH98AgsyySrYVuoHtZfOdUr1WbJRsYuhLxIq5+gjSaLpL6wW4CWpiGH3Knft2eUkRotCRp+FREyy5JZPiSrBs+p1iSV1Uy+IXMm8LvEpNLY+q6Faf6uTTUOnsh6ccB+WLckK2s9JJ4Q0T4ta7FNQ7BPZ3zK0B0b2CTGsZS+yhYUaez8ottuHkmrz5OkSBzO5jXnQmzdb3OtWhs+4f+54jS+IY3VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7COFZTGQHvA9Kq+3pDwvPmMXmnzMst+Si18A/cnpkU=;
 b=w/E3Nd+zxt2nZ3Q77H0/cCoGwsgtPDgcR2xNiu4apiNcPZVyeRLtmZM1Z3xqvtcrLVXM2yeEfnYCi3OoxO6nyy7isxTGqsZrWRpkr1P7F3vm6N244L6C+DE10N1On2R/9eNGsQyYuXbk8vRBWQAPkxQibiS0BRqIaZjFpc1ljIE=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2743.namprd12.prod.outlook.com (2603:10b6:a03:61::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Tue, 31 Mar
 2020 01:47:00 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2856.019; Tue, 31 Mar 2020
 01:47:00 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Topic: [PATCH] usb: dwc3: gadget: Remove incomplete check
Thread-Index: AQHV82muQmX55NMUl0emMsblflREJqhJbrQAgAD/cgCAAGwZAIAA5GqAgBObrwCAAQbKAIAAkdsAgAC5c4CAACLBAIAARocA
Date:   Tue, 31 Mar 2020 01:47:00 +0000
Message-ID: <804450e5-758c-5ec6-88ae-302c023bf1e3@synopsys.com>
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
In-Reply-To: <87369p34sz.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: 9c483bda-5e9e-4ae9-616c-08d7d51567b7
x-ms-traffictypediagnostic: BYAPR12MB2743:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB27437E91B3D5FC159F6C19D7AAC80@BYAPR12MB2743.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2710.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(346002)(376002)(366004)(396003)(136003)(39860400002)(316002)(110136005)(5660300002)(478600001)(86362001)(64756008)(76116006)(2616005)(186003)(66476007)(66946007)(31686004)(66556008)(31696002)(26005)(66446008)(71200400001)(2906002)(36756003)(8676002)(8936002)(107886003)(6512007)(81166006)(6506007)(6486002)(4326008)(81156014);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fvzcrFxUUwyIpvzxzSw+z+gWt3hsgCzpzfUrEPDyKlnfVa/Z5TwgtcIo7GxSMk5iyVH46NXUSb25wDLHsRI4IwG/vcURMZlFrmi7MjdiNj2rxLC/Ogtkk+l2N8rbkYMb7BuSF5v/W2gLFAmQx2+T24ddKeADkee8aGm/HzLJCNmFvLBJ1erFPEebTra9FWYb/yEYn+dPdkXz8uZ0rP6kgZfBkEDWKBO7MT82qwZ5+JmVWfCr004WfRbNxEXk9Bnau7mdcDJBLrn6zDnotf9wn5vPXkRwErG+HcC5tuMZzkjCdSEbDzh6wDEReiurNzYqd1hyAKhx3uX4zXLjUK6/UGzkdewLnnEQuyrXuY66zDE+W00Eq/vLodr0/Y+RAU6RkYgS9WpfQGFBB1bh95yWlA1ZXFfAeUam3cBzTPU0uUzR1vP/xoaYchnDv3fXYA+H
x-ms-exchange-antispam-messagedata: bbTj8TvWdBW58t2PvNuMJeyVHuLT9XNVD3/0CCDUVbWhfsVkyRjIe6N7rGso/mP9EMKaUznU2VQXM+lUc9SeRNDz1AsVexgpFJhSJomObCMbU3EKlqivEzMOkI4VWgYS45zLalGXSy1sGYEKb8/BWA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <05EA704D3B5B9448A7AC57887ABD8587@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c483bda-5e9e-4ae9-616c-08d7d51567b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 01:47:00.5716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MYLyAbevAZoc3WuwjNxHSt80VfI1K3X8dnw8GvMa01qVKUcn+hVy/4bvB2xiULNzFyfdaT+Lh0QGucr8hqxTRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2743
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+PiBUaGUgY29uZGl0aW9uIGhlcmUg
aXMgaWYgKCFyZXF1ZXN0X2NvbXBsZXRlKCkpLCB0aGVuIGtpY2tfdHJhbnNmZXIoKS4NCj4+Pj4g
TGV0J3MgdGFrZSBhIGxvb2sgYXQgd2hhdCBraWNrX3RyYW5zZmVyKCkgZG86DQo+Pj4+DQo+Pj4+
IGtpY2tfdHJhbnNmZXIoKSB3aWxsIHByZXBhcmUgbmV3IFRSQnMgYW5kIGlzc3VlIFNUQVJUX1RS
QU5TRkVSIGNvbW1hbmQNCj4+Pj4gb3IgVVBEQVRFX1RSQU5TRkVSIGNvbW1hbmQuIFRoZSBlbmRw
b2ludCBpcyBhbHJlYWR5IHN0YXJ0ZWQsIGFuZCBub3RoaW5nDQo+Pj4+IGlzIGNhdXNpbmcgaXQg
dG8gZW5kIGF0IHRoaXMgcG9pbnQuIFNvIGl0IHNob3VsZCBqdXN0IGJlIFVQREFURV9UUkFOU0ZF
Ug0KPj4+PiBjb21tYW5kLiBVUERBVEVfVFJBTlNGRVIgY29tbWFuZCB0ZWxscyB0aGUgY29udHJv
bGxlciB0byB1cGRhdGUgaXRzIFRSQg0KPj4+PiBjYWNoZSBiZWNhdXNlIHRoZXJlIHdpbGwgYmUg
bmV3IFRSQnMgcHJlcGFyZWQgZm9yIHRoZSByZXF1ZXN0Lg0KPj4+Pg0KPj4+PiBJZiB0aGlzIGlz
IG5vbi1TRy9ub24tY2hhaW5lZCBUUkIgcmVxdWVzdCwgdGhlbiB0aGVyZSdzIG9ubHkgMSBUUkIg
cGVyDQo+Pj4+IHJlcXVlc3QgZm9yIElOIGVuZHBvaW50cy4gSWYgdGhhdCBUUkIgaXMgY29tcGxl
dGVkLCB0aGF0IG1lYW5zIHRoYXQgdGhlDQo+Pj4+IHJlcXVlc3QgaXMgY29tcGxldGVkLiBUaGVy
ZSdzIG5vIHJlYXNvbiB0byBpc3N1ZSBraWNrX3RyYW5zZmVyKCkgYWdhaW4uDQo+Pj4gbm90IGVu
dGlyZWx5IHRydWUgZm9yIGJ1bGsuIFdlIG5ldmVyIHNldCBMU1QgYml0OyB3ZSB3aWxsIG5ldmVy
IGNvbXBsZXRlDQo+Pj4gYSB0cmFuc2Zlciwgd2UgY29udGludWFsbHkgYWRkIG1vcmUgVFJCcy4g
VGhlIHJlYXNvbiBmb3IgdGhpcyBpcyB0bw0KPj4+IGFtb3J0aXplIHRoZSBjb3N0IG9mIGFkZGlu
ZyBuZXcgdHJhbnNmZXJzIHRvIHRoZSBjb250cm9sbGVyIGNhY2hlIGJlZm9yZQ0KPj4+IGl0IHJ1
bnMgb3V0IG9mIFRSQnMgd2l0aG91dCBIV08uDQo+PiBSaWdodCwgSSB3YXMgcmVmZXJyaW5nIHRv
ICJyZXF1ZXN0IiByYXRoZXIgdGhhbiB0cmFuc2ZlciAoYXMgaW4gYQ0KPj4gdHJhbnNmZXIgbWF5
IGhhdmUgMSBvciBtb3JlIHJlcXVlc3RzKS4NCj4+DQo+Pj4gSG93IGFib3V0IHdlIGNoYW5nZSB0
aGUgdGVzdCB0byBzYXkgImlmIEkgaGF2ZSBub24tc3RhcnRlZCBUUkJzIGFuZCBJJ20NCj4+PiBi
dWxrIChub24tc3RyZWFtKSBvciBpbnRlcnJ1cHQgZW5kcG9pbnQsIGtpY2sgbW9yZSB0cmFuc2Zl
cnMiPw0KPj4+DQo+Pj4+IFdoZW4gdGhlIGZ1bmN0aW9uIGRyaXZlciBxdWV1ZXMgYSBuZXcgcmVx
dWVzdCwgdGhlbiB0aGVyZSB3aWxsIGJlIG5ldw0KPj4+PiBUUkJzIHRvIHByZXBhcmUgYW5kIHRo
ZW4gdGhlIGRyaXZlciBjYW4ga2lja190cmFuc2ZlcigpIGFnYWluLg0KPj4+IFdlIG1heSBhbHJl
YWR5IGhhdmUgbW9yZSBUUkJzIGluIHRoZSBwZW5kaW5nIGxpc3Qgd2hpY2ggbWF5IG5vdCBoYXZl
DQo+Pj4gYmVlbiBzdGFydGVkIGJlZm9yZSB3ZSBkaWRuJ3QgaGF2ZSBmcmVlIFRSQnMgdG8gdXNl
LiBXZSBqdXN0IGNvbXBsZXRlZCBhDQo+Pj4gVFJCLCBtaWdodCBhcyB3ZWxsIHRyeSB0byB1c2Ug
aXQgZm9yIG1vcmUgcmVxdWVzdHMuDQo+PiBZZXMgd2UgY2FuIGFuZCB3ZSBzaG91bGQsIGJ1dCB3
ZSBkaWRuJ3QgY2hlY2sgdGhhdC4gQWxzbyBpdCBzaG91bGRuJ3QgYmUNCj4+IGluIHRoZSByZXF1
ZXN0X2NvbXBsZXRlKCkgY2hlY2sgZnVuY3Rpb24gYXMgdGhleSBhcmUgcGFydCBvZiBkaWZmZXJl
bnQNCj4+IHJlcXVlc3RzLg0KPj4NCj4+Pj4gU28sIHRoaXMgY29uZGl0aW9uIHRvIGNoZWNrIGlm
IHJlcXVlc3RfY29tcGxldGUoKSBpcyBvbmx5IHZhbGlkIGZvciBhDQo+Pj4+IHJlcXVlc3Qgd2l0
aCBtdWx0aXBsZSBjaGFpbmVkIFRSQnMuIFNpbmNlIHdlIGNhbiBvbmx5IGNoZWNrIGZvciBJTg0K
Pj4+PiBkaXJlY3Rpb24sIHRoZSBjaGFpbmVkIFRSQiBzZXR1cCByZWxhdGVkIHRvIE9VVCBkaXJl
Y3Rpb24gdG8gZml0DQo+Pj4+IE1heFBhY2tldFNpemUgZG9lcyBub3QgYXBwbHkgaGVyZS4gV2hh
dCBsZWZ0IGlzIGNoYWluZWQgVFJCcyBmb3IgU0cuIEluDQo+Pj4gdGhpcyBwYXJ0IGlzIGNsZWFy
IG5vdyBhbmQgeW91J3JlIGNvcnJlY3QuIFRoYW5rcw0KPj4+DQo+Pj4+IHRoaXMgY2FzZSwgd2Ug
ZG8gd2FudCB0byBraWNrX3RyYW5zZmVyIGFnYWluLiBUaGlzIG1heSBoYXBwZW4gd2hlbiB3ZQ0K
Pj4+PiBydW4gb3V0IG9mIFRSQnMgYW5kIHdlIGhhdmUgdG8gd2FpdCBmb3IgYXZhaWxhYmxlIFRS
QnMuIFdoZW4gdGhlcmUgYXJlDQo+Pj4+IGF2YWlsYWJsZSBUUkJzIGFuZCBzdGlsbCBwZW5kaW5n
IFNHcywgdGhlbiB3ZSB3YW50IHRvIHByZXBhcmUgdGhlIHJlc3QNCj4+Pj4gb2YgdGhlIFNHIGVu
dHJpZXMgdG8gZmluaXNoIHRoZSByZXF1ZXN0LiBTbyBraWNrX3RyYW5zZmVyKCkgbWFrZXMgc2Vu
c2UNCj4+Pj4gaGVyZS4NCj4+PiBSaWdodCBidXQgd2UgY2FuIHJ1biBvdXQgb2YgVFJCcyBldmVu
IGluIG5vbi1jaGFpbmVkIGNhc2UuIEkgcmVtZW1iZXINCj4+PiB0ZXN0aW5nIHRoaXMgeWVhcnMg
YWdvIGJ5IGdpdmluZyBnX21hc3Nfc3RvcmFnZSBhIGxpc3Qgb2YgMzAwDQo+Pj4gcmVxdWVzdHMu
IFRoZSByZWFzb24gZm9yIGtpY2tpbmcgdGhlIHRyYW5zZmVyIGlzIGRpZmZlcmVudCwgYnV0IGl0
J3MNCj4+PiBiZW5lZmljaWFsIGFueWhvdy4NCj4+Pg0KPj4gSW4gdGhpcyBjYXNlLCB0aGUgY2hl
Y2sgc2hvdWxkIGJlIGZvciBpZiB0aGUgcGVuZGluZ19saXN0IGlzIG5vdCBlbXB0eSwNCj4+IHRo
ZW4ga2ljayBhZ2Fpbi4NCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRn
ZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+IGluZGV4IDZhMDRjOWFmY2FiNi4u
ZDgzMThkZTU1MDAwIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
Pj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gQEAgLTI5NzUsMTQgKzI5NzUs
NyBAQCBzdGF0aWMgaW50DQo+PiBkd2MzX2dhZGdldF9lcF9yZWNsYWltX3RyYl9saW5lYXIoc3Ry
dWN0IGR3YzNfZXAgKmRlcCwNCj4+DQo+PiAgIMKgc3RhdGljIGJvb2wgZHdjM19nYWRnZXRfZXBf
cmVxdWVzdF9jb21wbGV0ZWQoc3RydWN0IGR3YzNfcmVxdWVzdCAqcmVxKQ0KPj4gICDCoHsNCj4+
IC3CoMKgwqDCoMKgwqAgLyoNCj4+IC3CoMKgwqDCoMKgwqDCoCAqIEZvciBPVVQgZGlyZWN0aW9u
LCBob3N0IG1heSBzZW5kIGxlc3MgdGhhbiB0aGUgc2V0dXANCj4+IC3CoMKgwqDCoMKgwqDCoCAq
IGxlbmd0aC4gUmV0dXJuIHRydWUgZm9yIGFsbCBPVVQgcmVxdWVzdHMuDQo+PiAtwqDCoMKgwqDC
oMKgwqAgKi8NCj4+IC3CoMKgwqDCoMKgwqAgaWYgKCFyZXEtPmRpcmVjdGlvbikNCj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOw0KPj4gLQ0KPj4gLcKgwqDCoMKg
wqDCoCByZXR1cm4gcmVxLT5yZXF1ZXN0LmFjdHVhbCA9PSByZXEtPnJlcXVlc3QubGVuZ3RoOw0K
Pj4gK8KgwqDCoMKgwqDCoCByZXR1cm4gcmVxLT5udW1fcGVuZGluZ19zZ3MgPT0gMDsNCj4+ICAg
wqB9DQo+Pg0KPj4gICDCoHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfZXBfY2xlYW51cF9jb21wbGV0
ZWRfcmVxdWVzdChzdHJ1Y3QgZHdjM19lcCAqZGVwLA0KPj4gQEAgLTMwMDcsNyArMzAwMCw3IEBA
IHN0YXRpYyBpbnQNCj4+IGR3YzNfZ2FkZ2V0X2VwX2NsZWFudXBfY29tcGxldGVkX3JlcXVlc3Qo
c3RydWN0IGR3YzNfZXAgKmRlcCwNCj4+ICAgwqDCoMKgwqDCoMKgwqAgcmVxLT5yZXF1ZXN0LmFj
dHVhbCA9IHJlcS0+cmVxdWVzdC5sZW5ndGggLSByZXEtPnJlbWFpbmluZzsNCj4+DQo+PiAgIMKg
wqDCoMKgwqDCoMKgIGlmICghZHdjM19nYWRnZXRfZXBfcmVxdWVzdF9jb21wbGV0ZWQocmVxKSB8
fA0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlcS0+
bnVtX3BlbmRpbmdfc2dzKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWxpc3RfZW1wdHko
JmRlcC0+cGVuZGluZ19saXN0KSkgew0KPj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgX19kd2MzX2dhZGdldF9raWNrX3RyYW5zZmVyKGRlcCk7DQo+PiAgIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+ICAgwqDCoMKgwqDCoMKgwqAgfQ0KPj4NCj4+
DQo+PiBUaGlzIGlzIHVubGlrZWx5IHRvIGhhcHBlbiwgYnV0IGl0J3MgbmVjZXNzYXJ5IHRvIGJl
IHRoZXJlLg0KPj4NCj4+IExldCBtZSBrbm93IGlmIHlvdSdyZSBvayB3aXRoIHRoZSBjaGFuZ2Us
IEknbGwgY3JlYXRlIGEgZm9ybWFsIHBhdGNoIGZvciBpdC4NCj4gTG9va3MgZ29vZCwgd2UgbWF5
IGp1c3QgcmVuYW1lIHRoZSBmdW5jdGlvbiB0bw0KPiBkd2MzX2dhZGdldF9lcF9zaG91bGRfY29u
dGludWUoKSBvciBzb21ldGhpbmcgc2ltaWxhciBhbmQgbW92ZSB0aGUNCj4gIWxpc3RfZW1wdHko
KSBjaGVjayBpbiB0aGVyZSB0b28uDQo+DQoNCkkgZm9yZ290IHRoaXMgY29uZGl0aW9uIHNraXBz
IHRoZSBkd2MzX2dhZGdldF9naXZlYmFjaygpLiBJIGhhdmUgdG8gDQpzcGxpdCBpdC4gTGV0IG1l
IHNlbmQgb3V0IHRoZSByZXZpc2VkIHBhdGNoZXMgYW5kIHlvdSBjYW4gcmV2aWV3Lg0KDQpUaGFu
a3MsDQpUaGluaA0K
