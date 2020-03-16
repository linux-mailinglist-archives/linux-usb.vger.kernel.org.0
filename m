Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878431860FE
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 01:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgCPAyn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 20:54:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59986 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729303AbgCPAyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 20:54:43 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 93E76403BE;
        Mon, 16 Mar 2020 00:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584320082; bh=NaQCcLvlv0g0fkpRPS38JZqh4R4CTeQ6TTMXiYhRBHU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Dp3twBwia6XfHOLxuF3Nm9uNfZ3hSx6ZAzzz5BFsz0d0TJinEmPavObf+kA2Sb9Wm
         ZzdjSrZp+DyhsfmCn9hjxyxc1CU8vARvpDuSIl8unE7+wsiFqtVRA+GtjEiKYlyJZG
         2tPWTMEEKiDJCCqE9Llf4FsdQztT+q7CCjUkYXPAar9DUv44qOD1SAAXiyxBRkBgFn
         d1UJMWJN5AuRsxfSgXOBGrUAK8uAKfuq+JglHEAuVq/ibfxAdw4y9M9ghG3W2KM4zC
         E4bPQ3eqIyKWyONfmyBm/UIryyIXrC/Pdkt6wP2TQ2UiYYx9K4wpAVPzy/uSEvZWBD
         TSNrehFBKqIJA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 304AFA007A;
        Mon, 16 Mar 2020 00:54:42 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 15 Mar 2020 17:54:42 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 15 Mar 2020 17:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEq66R05bjGdAGv/6CYMZT0r1f/PTOz0Ce1he+7owHvW2FUeiV4y/hEPHRbP1n9P64iwdJaPFpUp+iGP3FYz9IIIYSOWAlWGhM5wJdBWtqqA3/NjXjoHcFALUIWvBMS1iiIN+8JvPpLF3dlpt15vSeqEhq2DoFkJitl5CP19kpN9w6rObkkWVyqv2tTZmnAs0k6ujzWSbGY6LyO7buD5y3PYEYXDUOlk5f9WyWyDYqNcCDT6xYBswBl5CiaQBw7vlXyuZQD2u4czTPGYkxNgjabSuLlaQJlzH3dC+J1r78MQSqkD9pXrQTakcYeLdz7lIOqnYWV/Ppo4NYtNd70T5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaQCcLvlv0g0fkpRPS38JZqh4R4CTeQ6TTMXiYhRBHU=;
 b=NtulysCGr98wYSAQsYYxq+B3YlisSid+eOVfrtPpiU4RgToyu7WjBo3AeN5AGmVqwEV2vtpFB4JDoQiSHUlaWGvhx++g/476DcwyV8orJ+xcQMNQbBQ8gCp7yIXjedC4oqNkJVQG2oZaTqu2Z+fVPuoPsObwo31r8X/gyYD6bHfAAdaFQ0IEPzr+WQYwbJaZuNaCPeHxWYFOOhFuAsYGM8gvUi3kjv0G2JCFJ8fQHUZE4Uh26Pao1aqKc33uY8dwarwOICB84chE5n+B/VoRxm69368bXhD5a3plNbXCUphRuOfmabg5MW7O9XE7n6AZr53i2dSwGXmZDvQS1JmcZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NaQCcLvlv0g0fkpRPS38JZqh4R4CTeQ6TTMXiYhRBHU=;
 b=XMJ8wJ6TpVXoza3rGyqdttGvFws0OHidB+qSEqRms4wOKEgNhXeBQh4/3nt86u6iRYRtDLYPKFqYdDIfH2KdUM4w5625ZZ4rsfVg2TOtcer4lY0I7M6fcAU8xO+TUMsPgJ53h5rr+AERaXM9iGzhRB+PBL6EJhE1LV067OOsIjw=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB2792.namprd12.prod.outlook.com (2603:10b6:a03:65::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.22; Mon, 16 Mar
 2020 00:54:40 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 00:54:40 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 4/6] usb: dwc3: gadget: Give back staled requests
Thread-Topic: [PATCH 4/6] usb: dwc3: gadget: Give back staled requests
Thread-Index: AQHV8zR7AYxS6dRYtkecl95x/t4BZ6hJcHeAgAEEEIA=
Date:   Mon, 16 Mar 2020 00:54:40 +0000
Message-ID: <5329c3d7-4975-a935-ee85-a51512235c95@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
 <a3732fbf370a2cf180c1c5757f46faed8399bbe5.1583443184.git.thinhn@synopsys.com>
 <877dzmeztk.fsf@kernel.org>
In-Reply-To: <877dzmeztk.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: d2e3f841-a25d-4f0f-046f-08d7c9449bd9
x-ms-traffictypediagnostic: BYAPR12MB2792:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB279233A31EC218558227F055AAF90@BYAPR12MB2792.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(39850400004)(396003)(346002)(376002)(199004)(31696002)(316002)(86362001)(186003)(6506007)(110136005)(26005)(66946007)(66476007)(6512007)(66446008)(66556008)(6486002)(76116006)(64756008)(107886003)(478600001)(4326008)(4744005)(71200400001)(36756003)(81156014)(8676002)(8936002)(2906002)(5660300002)(31686004)(2616005)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB2792;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y30y5fQSESni43zvd0Nntr/BPHIxo/b0AUm8iMdxCeWROaOpFxOfRVdYsdF61HxYuMG2OrKFk6RcD1wIgSkOfhHF4dof1j5ygCFhv9D1CiTxuIgRW88WyZjVDbhvDE3O28wGdWglmwQ4TOQcwsOZXEgdcfNRed8UzrbA3R6OL1hBHneEmQlqlEiQGZGt7R8gZJufiycMaOvza0oYxZkqAOVT3aO9e+GHdS2KwCYpuFKtpv/POzN72lyp+0Oss7w1pW8QMV1iRuYL9RmrztKq3rw99/JEUYwNbaq7H2uvrttGBYojPUhKMBEHtL8VVZFajzGGwYenoPO39WZbu1CE/5Op5IknCKKvRUtBCr5hNAZzq5HW/pSVviCpy411WLUr8d8AOlbxWOqAo9mqhUGjP3Hp6kZEWn4BE9m6fNiC+NfBAmJCPQsEBGCbA93ZRMaX
x-ms-exchange-antispam-messagedata: ZUDg8z40sDOt71JPWlLSOEJ+xglZo/js8U4+QU5iHWqhWWWDt3qlUYnY26IJbLvNPvHgbhIILLpHuh77fo9NFsocbu7pQNE2tHP6A4n1OqhM1pbN2gcdTWmiFjt05qwq2khT9xVWXMTmJhVgvqH0kw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F06C82F666E66F4E872B779CBD804990@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e3f841-a25d-4f0f-046f-08d7c9449bd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 00:54:40.4135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yBH+A44FkIK+d3k4pddwwtLdOfukWIhWCAbRmKH1FJbUvgo+pxvo+l57mI9cGa+b+yB97XKP54L39nSBRnmP9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2792
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IEhpLA0KPg0KPiBUaGluaCBOZ3V5
ZW4gPFRoaW5oLk5ndXllbkBzeW5vcHN5cy5jb20+IHdyaXRlczoNCj4+IElmIGEgcmVxdWVzdCBp
cyBkZXF1ZXVlZCwgdGhlIHRyYW5zZmVyIGlzIGNhbmNlbGxlZC4gR2l2ZSBiYWNrIGFsbA0KPj4g
dGhlIHN0YXJ0ZWQgcmVxdWVzdHMuDQo+Pg0KPj4gSW4gbW9zdCBzY2VuYXJpb3MsIHRoZSBmdW5j
dGlvbiBkcml2ZXIgZGVxdWV1ZXMgYWxsIHJlcXVlc3RzIG9mIGENCj4+IHRyYW5zZmVyIHdoZW4g
dGhlcmUncyBhIGZhaWx1cmUuIElmIHRoZSBmdW5jdGlvbiBkcml2ZXIgZm9sbG93cyB0aGlzLA0K
Pj4gdGhlbiBpdCdzIGZpbmUuIElmIG5vdCwgdGhlbiB3ZSdkIGJlIHNraXBwaW5nIFRSQnMgYXQg
ZGlmZmVyZW50IHBvaW50cw0KPj4gd2l0aGluIHRoZSBkZXF1ZXVlIGFuZCBlbnF1ZXVlIHBvaW50
ZXJzLCBtYWtpbmcgZGVxdWV1ZS9lbnF1ZXVlIHBvaW50ZXJzDQo+PiB1c2VsZXNzLiBUbyBlbmZv
cmNlIGFuZCBtYWtlIHN1cmUgdGhhdCB3ZSdyZSBwcm9wZXJseSBza2lwcGluZyBUUkJzLA0KPj4g
Y2FuY2VsIGFsbCB0aGUgc3RhcnRlZCByZXF1ZXN0cyBhbmQgZ2l2ZSBiYWNrIGFsbCB0aGUgY2Fu
Y2VsbGVkIHJlcXVlc3RzDQo+PiB0byB0aGUgZnVuY3Rpb24gZHJpdmVycy4NCj4gV2hpY2ggZnVu
Y3Rpb24gZHJpdmVyIGlzICpub3QqIGNhbmNlbGxpbmcgdHJhbnNmZXJzIGNvcnJlY3RseT8gV2Ug
Y2FuDQo+IChhbmQgc2hvdWxkKSBiZSBkZWZlbnNpdmUgb24gZHdjMywgYnV0IGxldCdzIG5vdCBo
aWRlIGJ1Z3Mgb24gZnVuY3Rpb24NCj4gZHJpdmVycyBlaXRoZXIuDQo+DQoNCkkgZGlkbid0IHJl
dmlldyBhbGwgdGhlIGZ1bmN0aW9uIGRyaXZlcnMgZm9yIHRoaXMuIEkganVzdCBzZWUgYSANCnBv
dGVudGlhbCBpc3N1ZSBhbmQgZ28gZm9yIGEgbW9yZSBkZWZlbnNpdmUgYXBwcm9hY2guIFdoYXQn
cyB5b3VyIA0Kc3VnZ2VzdGlvbj8NCg0KVGhhbmtzLA0KVGhpbmgNCg==
