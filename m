Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2471860D7
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 01:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729292AbgCPAnC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Mar 2020 20:43:02 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:59780 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729262AbgCPAnC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Mar 2020 20:43:02 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ABD07403BE;
        Mon, 16 Mar 2020 00:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1584319381; bh=xQe5t4zEK0VUAZCixxTmP2tHotC5cI49lWII/GWu2r0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=T+XG79Re2wd5BPVbIDvcJrBlv333JCUZUi/JwifkVs4dfIkv6hckOKV3tm5H8zr4B
         ePdlZGoKcKLP3NrZpROxNau94fdz0GHA9a7pEps18WZG6fXlOr8dZ5rQiXXId7JBYE
         UEfysv/fK8Hzud64WaI3JfTqIeCYYlyh7z80ts/5ozP65nvXO9+1fEk6ZT5AQsjkGw
         iVIQZsaA4vXnlSnqjYZMa86r2U12FrA5mdHmGXoipiWYWr2wr8QLPH9SN8OGwK1y/X
         5tbLaXNIgkstUZG4m9Rd2maNXAC6krD/7WJEReNnKTgWimL1YYkG6r5hEJMylioEGC
         CNdUY0dFkYN+g==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 863E2A0078;
        Mon, 16 Mar 2020 00:43:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Sun, 15 Mar 2020 17:43:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Sun, 15 Mar 2020 17:43:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwXwdIf7WvZbAaVcvL2u6p7SJQLTuz4Pq9tPJ8w/gynH6yHU3oLP+hOoIocIwKHl1Ad6ZIac/p30Zcw4ivygG25LJMiWGiIGeUp5vzP+e3groPFpqdvgrR1r1pbCPxqG1ESMzseGV4PSi/EfN+ctLscu7OKNRf8ldEeEg1AuPjFHP0gYLEUHt6YUaGhwtWlTgzeuOWM3PdyLcevjRaNH+xTxbBo00Yq6lFA9OX3k1ZfWFWzzFzJ3k5yFPFnAeryo76B53wXEQo2Nje9eP4mHIeoIqqIZPdVir6hY0osiHb3HF4IMprxAj30AKBBnrDwE6BIT3ST7qAntZjtCHLCVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQe5t4zEK0VUAZCixxTmP2tHotC5cI49lWII/GWu2r0=;
 b=C2t03MPHNdYPf7Hmjs8xHwlzy03goMxknw1MpyR87zZzBWYPdaltriTIcGPkV6nXq1wlFOS0YXh2qeVwOnk77R/4yPMbRtGvKyEwLjXAeYhQSTs+B2RBMPEo9VZ/ysD4hIam5zEaCEdJrzn5n4ClpGMBp3PhA5p1G4qtRXiH8f3OwFDbau24auRLth5ERz0Ye57GXUOisDHIN90qgBdd1Qp4mh6gzxHJXzr+GJtQfpaksjMddQ32jgaRPSEMAb2UEK4H9yA9okH8v+UiKMMDhyRPMaaSdlV0EYdO4UmshAGse0k+WJLTMa/GA2wDjcIAGzhIrwI2irs3Et4IXmWtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQe5t4zEK0VUAZCixxTmP2tHotC5cI49lWII/GWu2r0=;
 b=cOJlaugLKolfXZ+CSI+b9GEs81ERgrlnbKInckSwOJWOus+KixwjybsGogllXwIkIqPckNQ9l/l9wnPwvl0c/iScd1aWyljQMFBuQ3E+dLOxkXm/zaubBQsP7rO3xte5zHS6MOhjJRpafLiap1KgdHrvEwPlWIR7Irz0vAwznH8=
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (2603:10b6:a03:68::11)
 by BYAPR12MB3511.namprd12.prod.outlook.com (2603:10b6:a03:132::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19; Mon, 16 Mar
 2020 00:42:59 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08]) by BYAPR12MB2710.namprd12.prod.outlook.com
 ([fe80::e5d1:8cdd:a09d:7a08%7]) with mapi id 15.20.2814.021; Mon, 16 Mar 2020
 00:42:59 +0000
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 6/6] usb: dwc3: gadget: Refactor dwc3_gadget_ep_dequeue
Thread-Topic: [PATCH 6/6] usb: dwc3: gadget: Refactor dwc3_gadget_ep_dequeue
Thread-Index: AQHV8zSCasPDVcHRyEK7+QeZPSDDdqhJcS2AgAEAFwA=
Date:   Mon, 16 Mar 2020 00:42:59 +0000
Message-ID: <017a4b78-cd37-6003-5344-55c3b8ab2672@synopsys.com>
References: <cover.1583443184.git.thinhn@synopsys.com>
 <17318e194eea91aca59a1965967f953a55629d1e.1583443184.git.thinhn@synopsys.com>
 <874kuqezpc.fsf@kernel.org>
In-Reply-To: <874kuqezpc.fsf@kernel.org>
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
x-ms-office365-filtering-correlation-id: ed8d358a-02c9-4739-d98f-08d7c942f9fb
x-ms-traffictypediagnostic: BYAPR12MB3511:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3511D2E298BFD979E138969AAAF90@BYAPR12MB3511.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(346002)(136003)(366004)(376002)(39850400004)(199004)(316002)(86362001)(64756008)(66556008)(66476007)(66946007)(66446008)(76116006)(31686004)(110136005)(8676002)(81166006)(81156014)(36756003)(2906002)(8936002)(4744005)(6506007)(71200400001)(6486002)(6512007)(4326008)(107886003)(186003)(26005)(2616005)(31696002)(5660300002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR12MB3511;H:BYAPR12MB2710.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DWV6hPv/qNszga3Ze5WXh+HbY7mnW9XAvoazrrMSwrU9ZAxq4hvEmAbX8iD9pwoCafnEH6C0Zfk3QM6zIozfvrkInFO7TSShOKwV84TQxVyfNP7oQG4c/qZ3ZJt3vMPS97m0Xz8hrjqZdnFR8/gSW/F7p5wZ+k96pJqDlt7/qk7rlKul0wtIe9YAkfa366Vk+TzGwthLRpZi4HgypkStenJR4SHhBbAH+iM06co3XoNgh3GTpSAhNR5mx8RJN4DWMvZ9cCd6yuEJhJnmax4RnJIcuSbZC1AAnpReE/39l3zp8LnXCGTQFSm3bYOpriV24JD6qblK0OGx82ybax6dcv28yLv2266rn1JKxxed1nW0CrsN1LEdiTBPay+0XmKGMa2GjxSvz0H8BEpwqyGpsxbsqqlEqgWoB5dGnJne4YaHhZ9BQzs8/uhCiZZLgBfr
x-ms-exchange-antispam-messagedata: NokPsAad45Rg/UrsC2eE+dabvAvs/aFSh0JHB/pjRVbfk78rCHbfeZ369Pstxcsrt14qpEsakl+42Ne5R7QNq5Qm0n2zpLjPUNQjHb2w4XABuLaAnLrL8ZzUcr0Vrd4eUdIWdcG6Va6b0/wsyvAftg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <149BB4D899847E42BBA1946171947E32@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed8d358a-02c9-4739-d98f-08d7c942f9fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 00:42:59.3911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/a9BiAHVYas61coXfXfdwfJbftIN258nWhE3qd3zFEgSyliAd/Xbi42CvyNg/Yti6zDr5lApMcUIRPpkQ1Sbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3511
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpGZWxpcGUgQmFsYmkgd3JvdGU6DQo+IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4gd3JpdGVzOg0KPg0KPj4gVGhlIGZsb3cgZnJvbSBmdW5jdGlv
biBkd2MzX2dhZGdldF9lcF9kZXF1ZXVlKCkgaXMgbm90IGVhc3kgdG8gZm9sbG93Lg0KPj4gUmVm
YWN0b3IgaXQgZm9yIGVhc2llciByZWFkLiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbiB0aGlzIGNv
bW1pdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5vcHN5
cy5jb20+DQo+IGRvZXNuJ3QgYXBwbHk6DQo+DQo+IGNoZWNraW5nIGZpbGUgZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYw0KPiBIdW5rICMxIEZBSUxFRCBhdCAxNTU1Lg0KPiBIdW5rICMyIEZBSUxF
RCBhdCAxNTgxLg0KPiAyIG91dCBvZiAyIGh1bmtzIEZBSUxFRA0KPg0KDQpZb3UnZCBuZWVkIHRv
IHBpY2sgdXAgc29tZSBkZXBlbmRlbmN5IHBhdGNoZXMgb2YgdGhlIHNhbWUgc2VyaWVzIHRvIA0K
YXZvaWQgY29uZmxpY3QuDQoidXNiOiBkd2MzOiBnYWRnZXQ6IEdpdmUgYmFjayBzdGFsZWQgcmVx
dWVzdHMiDQoidXNiOiBkd2MzOiBnYWRnZXQ6IFJlbW92ZSB1bm5lY2Vzc2FyeSBjaGVja3MiDQoN
ClNlZWluZyB0aGF0IHlvdSBoYXZlIHNvbWUgY29tbWVudHMgZm9yIG9uZSBvZiB0aGVtLCBpdCdz
IHByb2JhYmx5IG5vdCANCnBpY2tlZCB1cC4gSSdsbCByZXNlbmQgdGhlIHBhdGNoZXMgYWZ0ZXIg
cmV2aWV3Lg0KDQpUaGFua3MsDQpUaGluaA0K
