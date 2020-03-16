Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A1D187490
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 22:14:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732645AbgCPVOo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 17:14:44 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:38742 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732597AbgCPVOo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 17:14:44 -0400
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ECBBBC04F5;
        Mon, 16 Mar 2020 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584393279; bh=yTgtFuFNNm/6tMJJIhhjnMM4+hRAOSJgnAMTGk6SVt4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hHizYTT5GpbBoWS7OOWzKzY31sdjKju8R+Dbf3ScdA7g2g3/6lQ6tTqSFSxugHC/E
         Jz8Z5TCLzMygAlK+NhOfRbde+x137xQqlDOp5h5Ph8G+aMfwq02suUIyMkVxYcCrd6
         mdgqTus7QXnURMj8/UnPkvg0jXYThya3DLydTUy/arKyrR6xmFGXV8JavR7y9u/h6t
         xz64/m8vPb1EoOJ2XkkJWVgVs/+6fDuNaOHzjcAViaKmYGWIGLIN0IbgLrIKSKXkBB
         342+sd3nYqfbbB2aqtu650PGcV5cEtKsjHbZN5zAhaicfGrvnMR46bmFPU5TezMi2j
         VcEw8XbpZVdoQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id A900DA008A;
        Mon, 16 Mar 2020 21:14:38 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 16 Mar 2020 14:14:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 16 Mar 2020 14:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ar/fs4fqmnv1uspSbU1jx5lu7kKMA5W3bGGhteYZjnq5WLvxDy5KSejidhqcGTb41oz68ipvFBCz5yByq71NxrNkfcqjILfyk+z+eqTjZj2fI+Dy879xe64xhb84lIg5KReKi2o5KG0nzncPiquzW46FBeprjxjoodtMxj7dEuFWgIJ8MCHaDmAwcax+aUCjfIpQHHQ2ARvFUmWZLpZJVU1KVXKHWU7jlUqJyQMBEkQEs1Rw6YDRvsNsGEeXHgnN/9ScwT3o2aiW6lgq0soeRiCgmXcgLPySX7ho+1xfMDzuZVsIVWGpBH4YlZA4lh+exzs2T/lCEGZ2nH+Y2tWcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTgtFuFNNm/6tMJJIhhjnMM4+hRAOSJgnAMTGk6SVt4=;
 b=ENrIoyd1X1w/m781oK+/qp/AbzeXuUZMnU/nHj89al4WUo03fyYa70I6bx23kaiNtev3Q8iEFcmGj0nQQnIDn+mnOMyu/SrZ7RHyFEKc2Eb3K4Kwv1aQtT/YU6qgWxClZr8vz3x8xAij9EQmHyvuo7GjgxHVh/0po8lpwrhrJ1Dg2yhOwnmMag0ON+wk8ljvEQEDjJCOfY3/G810h2wTKnN9iKT9lRvQDIKndP1YBHMKiKUjNaE9If8PPQ1LhQvbIiItJwi+jTOXaCITW6Dlj37UIInCyTLjsakV0hQuXwwlXhKA2ndim6bfIoDWdfExogWIDRoLQ2SIwgyY7yPmog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTgtFuFNNm/6tMJJIhhjnMM4+hRAOSJgnAMTGk6SVt4=;
 b=U6FbFGWk/cGZBVjnYurKhgE7NTW7DNsfzlYeV/B20abdwN1D7lz4+ZjPTE78CBpyr6Yuy2oMTimOjpXUE1sMioXASUCygAv125u2Ii4f+vIWwTDF6yvNuTH+iz0QfhtKIV0Y458rTgLLUojW6o0F7pEF2IqXASYgJw7Lkpriveg=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Mon, 16 Mar
 2020 19:37:10 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 19:37:10 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/6] usb: dwc3: gadget: Give back staled requests
Thread-Topic: [PATCH 4/6] usb: dwc3: gadget: Give back staled requests
Thread-Index: AQHV8zR7AYxS6dRYtkecl95x/t4BZ6hJcHeAgAEEEICAAGPEgIAA1dyA
Date:   Mon, 16 Mar 2020 19:37:09 +0000
Message-ID: <88c2aca7-ded3-e44c-545a-75108dc3cfc3@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
 <a3732fbf370a2cf180c1c5757f46faed8399bbe5.1583443184.git.thinhn@synopsys.com>
 <877dzmeztk.fsf@kernel.org>
 <5329c3d7-4975-a935-ee85-a51512235c95@synopsys.com>
 <87eets23nk.fsf@kernel.org>
In-Reply-To: <87eets23nk.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: 87745419-332a-4f30-bc90-08d7c9e16b3d
x-ms-traffictypediagnostic: BYAPR12MB3176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3176E1DA9E796F502131BBEDAAF90@BYAPR12MB3176.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(136003)(376002)(396003)(39860400002)(199004)(2906002)(31686004)(2616005)(6486002)(316002)(110136005)(6512007)(71200400001)(26005)(36756003)(186003)(66446008)(64756008)(81156014)(66476007)(81166006)(8676002)(8936002)(76116006)(66946007)(86362001)(4326008)(6506007)(478600001)(66556008)(107886003)(31696002)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB3176;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: svAHS3dmy7cMnFAUTa8oIBFOAClIHcS6H/bqEwN8AqZiMN2s4vsodnJKV5H6zeql5pPPrBGQZiL+sG96MtXheSj0u923k0gF2uxk1FGzI3FU8jtDdto8DyVGSr+qV0ghBc0nxZrh3MqSAbVEce2zOd2Eam8NzhbriSzxCIKzwqbJ6ezRhwAkr50hGxfUzaFjrsaA3NCsAOaYsD0Ozsb7X1pbXq/2Pe9W4gsRaQTwjbdDGD9tZ1E/CbhkOqy5BnwNYLq2wBAH8GghYukI0eQw2Xn5mU7atV95zIQBdIIzbGbQ4y2snAWUiGDHqGNqQuuK6J/JLZ/xWUnIbiGHrt+cwEMgFiS0EXwdr+fBrHODNzpYscewVXXtKGHHvLZABjzDBf1xUHphk+ulf4iWP/mlpfI4ag3NZV+Q7slC0MEyyuTj3O6umcV5VJ8VZ84L5rKF
x-ms-exchange-antispam-messagedata: gswiX7Y5aZFijRI6daegk7PWPc5RHofEraSX5qy8SvgGERmVUUg3aZagsIEjaxx0kgxyI34FZ/s60aOgOZ2fwEQhRQNzPQCCWfranz6W5fGKGUYDyW9/XfFitoFEZEy/rFF2RS1uuQmC0afldDJU1w==
Content-Type: text/plain; charset="utf-8"
Content-ID: <9516EA179AB5534FB1D32A85FABE14EC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87745419-332a-4f30-bc90-08d7c9e16b3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 19:37:09.8328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbmQ0JV3yLaF5W7qPFt2J3VSk4r7p7PBt7qPC94omRgqJyzcT7qDmOROxKWqAsg3e00x6rCoNFfbLtlbSco3gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3176
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCkZlbGlwZSBCYWxiaSB3cm90ZToNCj4gSGksDQo+DQo+IFRoaW5oIE5ndXllbiA8VGhp
bmguTmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPj4+PiBJZiBhIHJlcXVlc3QgaXMgZGVxdWV1
ZWQsIHRoZSB0cmFuc2ZlciBpcyBjYW5jZWxsZWQuIEdpdmUgYmFjayBhbGwNCj4+Pj4gdGhlIHN0
YXJ0ZWQgcmVxdWVzdHMuDQo+Pj4+DQo+Pj4+IEluIG1vc3Qgc2NlbmFyaW9zLCB0aGUgZnVuY3Rp
b24gZHJpdmVyIGRlcXVldWVzIGFsbCByZXF1ZXN0cyBvZiBhDQo+Pj4+IHRyYW5zZmVyIHdoZW4g
dGhlcmUncyBhIGZhaWx1cmUuIElmIHRoZSBmdW5jdGlvbiBkcml2ZXIgZm9sbG93cyB0aGlzLA0K
Pj4+PiB0aGVuIGl0J3MgZmluZS4gSWYgbm90LCB0aGVuIHdlJ2QgYmUgc2tpcHBpbmcgVFJCcyBh
dCBkaWZmZXJlbnQgcG9pbnRzDQo+Pj4+IHdpdGhpbiB0aGUgZGVxdWV1ZSBhbmQgZW5xdWV1ZSBw
b2ludGVycywgbWFraW5nIGRlcXVldWUvZW5xdWV1ZSBwb2ludGVycw0KPj4+PiB1c2VsZXNzLiBU
byBlbmZvcmNlIGFuZCBtYWtlIHN1cmUgdGhhdCB3ZSdyZSBwcm9wZXJseSBza2lwcGluZyBUUkJz
LA0KPj4+PiBjYW5jZWwgYWxsIHRoZSBzdGFydGVkIHJlcXVlc3RzIGFuZCBnaXZlIGJhY2sgYWxs
IHRoZSBjYW5jZWxsZWQgcmVxdWVzdHMNCj4+Pj4gdG8gdGhlIGZ1bmN0aW9uIGRyaXZlcnMuDQo+
Pj4gV2hpY2ggZnVuY3Rpb24gZHJpdmVyIGlzICpub3QqIGNhbmNlbGxpbmcgdHJhbnNmZXJzIGNv
cnJlY3RseT8gV2UgY2FuDQo+Pj4gKGFuZCBzaG91bGQpIGJlIGRlZmVuc2l2ZSBvbiBkd2MzLCBi
dXQgbGV0J3Mgbm90IGhpZGUgYnVncyBvbiBmdW5jdGlvbg0KPj4+IGRyaXZlcnMgZWl0aGVyLg0K
Pj4+DQo+PiBJIGRpZG4ndCByZXZpZXcgYWxsIHRoZSBmdW5jdGlvbiBkcml2ZXJzIGZvciB0aGlz
LiBJIGp1c3Qgc2VlIGENCj4+IHBvdGVudGlhbCBpc3N1ZSBhbmQgZ28gZm9yIGEgbW9yZSBkZWZl
bnNpdmUgYXBwcm9hY2guIFdoYXQncyB5b3VyDQo+PiBzdWdnZXN0aW9uPw0KPiBGYWlyIGVub3Vn
aCwgdGhhdCdzIGdvb2QgZm9yIG15IHVuZGVyc3RhZGluZyBvZiB3aHkgdGhlIHBhdGNoIHdhcw0K
PiBjcmVhdGVkLiBJcyB0aGVyZSBhIHdheSB0byBhZGQgYSBXQVJOKCkgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdCBzbyB3ZQ0KPiBjYXRjaCBlcnJvbmVvdXMgZ2FkZ2V0IGRyaXZlcnMgZWFzaWx5PyBB
bHNvLCBjb3VsZCB5b3UgY2hlY2sgaWYgd2UgbmVlZA0KPiBhIGRvY3VtZW50YXRpb24gdXBkYXRl
IGZvciB0aGUgZ2FkZ2V0IEFQSSB3aXRoIHJlZ2FyZHMgdG8gdGhpcyBmaW5kaW5nPw0KPg0KPiBj
aGVlcnMNCj4NCg0KSXQncyBhIGJpdCBkaWZmaWN1bHQgdG8gYWRkIGEgV0FSTigpIGFzIHRoZSBm
dW5jdGlvbiBkcml2ZXJzIGNhbiBkZXF1ZXVlIA0KdGhlIHJlcXVlc3RzIGluIGFueSBvcmRlciBh
bmQgYW55IHRpbWUgdGhleSBsaWtlLiBXZSBtYXkgYmUgYWJsZSB0byBwdXQgDQpzb21lIGNvbnRy
YWludHMgdmlhIGRvY3VtZW50YXRpb24gc28gd2UgY291bGQgZG8gYSBXQVJOKCksIGJ1dCB0aGF0
IGlzIA0KYWxzbyBub3QgZWFzeS4NCg0KRm9yIGV4YW1wbGUsIGluIGR3YzMsIHRoZSBjdXJyZW50
IHdheSB3ZSBpbXBsZW1lbnQgYnVsayB0cmFuc2ZlciBpcyB0aGF0IA0KdGhlcmUncyBubyBjb25j
ZXB0IG9mIHdoZXJlIG9uZSB0cmFuc2ZlciBzdGFydHMgYW5kIGVuZHMgKGF0IGxlYXN0IGZvciAN
Cm5vbi1zdHJlYW0gdHJhbnNmZXJzKS4gU28sIHRoZSBmdW5jdGlvbiBkcml2ZXIgbWF5IHF1ZXVl
IG11bHRpcGxlIA0KdHJhbnNmZXJzIGJ1dCBkd2MzIG9ubHkgc2VlcyBhIHNpbmdsZSB0cmFuc2Zl
ci4gRGVxdWV1aW5nIG9uZSB0cmFuc2ZlciANCmluIHRoZSBmdW5jdGlvbiBkcml2ZXIgbWVhbnMg
ZGVxdWV1aW5nIGFsbCBmb3IgZHdjMy4NCg0KVXBkYXRpbmcgdGhlIGRvY3VtZW50YXRpb24gZm9y
IHRoaXMgcmVxdWlyZXMgYSBiaXQgb2YgdGhvdWdodHMsIGFuZCBpdCANCmFsc28gbWVhbnMgd2Ug
bmVlZCB0byByZXZpZXcgYWxsIHRoZSBkaWZmZXJlbnQgY29udHJvbGxlciBkcml2ZXJzLiBXZSAN
Cm1heSBuZWVkIHRvIGRvY3VtZW50IHRoaXMsIGJ1dCBpbiB0aGUgbWVhbiB0aW1lLCB3aGF0IGRv
IHlvdSB0aGluayBvZiANCnRoaXMgYXBwcm9hY2ggZm9yIG5vdz8NCg0KQlIsDQpUaGluaA0K
