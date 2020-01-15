Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4D313C88B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 16:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgAOP5n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 10:57:43 -0500
Received: from rcdn-iport-8.cisco.com ([173.37.86.79]:23638 "EHLO
        rcdn-iport-8.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgAOP5n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jan 2020 10:57:43 -0500
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jan 2020 10:57:42 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1918; q=dns/txt; s=iport;
  t=1579103862; x=1580313462;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=CoWeT9YXSFMI/SJ9NalMA/r3kCTicVVHzV/qqP/ccOA=;
  b=Rq9tGtnFlOO1Ws+YHIRIdXWol91GS5pPkN/WyE/9ZZ/ViYElrvWSFEtO
   ajOntRI5kTRs5Eup1jNgbmC84uRzmp0340Eupg4Jz7H1ZEw8oXhiBBO38
   t+f01CM93tbplKYCmAmH2YEAYbX/ksmSri6SOz2PoDhQajyJR/5jOA2ji
   Y=;
IronPort-PHdr: =?us-ascii?q?9a23=3At6Yj/BEJNE9xDTkhJAAhbJ1GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e4z1Q3SRYuO7fVChqKWqK3mVWEaqbe5+HEZON0pNV?=
 =?us-ascii?q?cejNkO2QkpAcqLE0r+efzpaDYhGslZfFRk5Hq8d0NSHZW2ag=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CSBQDbMx9e/49dJa1kDg4BAQEBAQc?=
 =?us-ascii?q?BAREBBAQBAYF7gVQpJwWBRCAECyqED4NGA4p0gl+YDoJSA1QJAQEBDAEBLQI?=
 =?us-ascii?q?BAYRAAheBaCQ4EwIDDQEBBAEBAQIBBQRthTcMhV4BAQEBAgESEREMAQE3AQQ?=
 =?us-ascii?q?LAgEIGAICJgICAjAVEAIEDieDBIJLAw4gAZsrAoE4iGF1gTKCfwEBBYUXGII?=
 =?us-ascii?q?NCYEOKIwYGoFBP4E4gmw+aYMvC4M2gl6NV4J5nngKgjiWKgYbgkeMR4tgqVw?=
 =?us-ascii?q?CBAIEBQIOAQEFgWkigVhwFYMnUBgNiAEJAxeBBAEOgj2KGDt0gSmJdYJCAQE?=
X-IronPort-AV: E=Sophos;i="5.70,323,1574121600"; 
   d="scan'208";a="701488378"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jan 2020 15:50:35 +0000
Received: from XCH-RCD-005.cisco.com (xch-rcd-005.cisco.com [173.37.102.15])
        by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 00FFoZS9016239
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Wed, 15 Jan 2020 15:50:35 GMT
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by XCH-RCD-005.cisco.com
 (173.37.102.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 09:50:34 -0600
Received: from xhs-aln-001.cisco.com (173.37.135.118) by xhs-rcd-002.cisco.com
 (173.37.227.247) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 09:50:34 -0600
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-001.cisco.com (173.37.135.118) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 15 Jan 2020 09:50:34 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7wwLPD1c9TvuoFVFDDVF0n/rb0hXBYhRcf49x7wK1DvvkRzrLNSxF8+MPHWvLkmSAxOHadUlPhtSA+7TmMhzXOE5aoengiWUcSY7SRdN4/xtFNBx2f+J1owjNEzh5/i1B6KxaVzywaiKMAyS+OGDjqsLELfY8/uAaOFRw/rEwoDbuLvoxfb3Je8GJcbzfPZe3m9BGif4Ty2rStUstcb/wAu4b+5d0vuES82nabohA+s/ydkZ7YwMPazqLOL+G5HTCLhhOnmXlqw6/gqxSjzsJS35erroWEC60xcC0LsqT2xJWg/I394gedi8KyXWOH1GEYF+sG3QPjKhVy9STu8yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoWeT9YXSFMI/SJ9NalMA/r3kCTicVVHzV/qqP/ccOA=;
 b=joKRn8oPEri2B9uULa+WC7x4xCW/5dMtI/3h0S2yeTEMBLk1VvMNR3Z/rNfNT+soft+PL6HZ4JVZ2PdY7eRB/sFP2JDO7GhRLQtFwK4D2V1ZAKMpmxZpvXT9NpuvIOyBAp1N41LFN9eQ6HS569oKJFyhRd+A5h0taEgWgMyflQTlgSN6rndQzIjeUZy/F+gwfopFPOS3/D7aZImwPp+bK+oOxT9hoSCM96MF2VAS1U2AdXvHH/u8hhGB2E2UnYVUiSmar2ugERTy8S2orLgnVr0c0ONbQgGE+7XaYPo2CbZK6ZTF+Uwl8OTIIIQ+oBhRqKtqTyLOTFcdEiOOw/onlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoWeT9YXSFMI/SJ9NalMA/r3kCTicVVHzV/qqP/ccOA=;
 b=h0tusTAT6f+aWsk3JtWbenPLcnjDOVPahMPMFE+95p5eb6WdLn53GgAyjRfRo64wFpUulVssRn31fj8d6cg7X+TxklLRqc9Xzpaz8no/PwVPh59Sgp/YVNS447RygGSWjdKKjVlHtABiJiA+rromN6nXMdB7DNP6ZLpiIDtfnqY=
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com (10.174.104.137) by
 DM5PR1101MB2347.namprd11.prod.outlook.com (10.173.171.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Wed, 15 Jan 2020 15:50:33 +0000
Received: from DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::c14e:ecc5:b653:c7c]) by DM5PR1101MB2140.namprd11.prod.outlook.com
 ([fe80::c14e:ecc5:b653:c7c%10]) with mapi id 15.20.2623.018; Wed, 15 Jan 2020
 15:50:33 +0000
From:   "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Armando Visconti <armando.visconti@st.com>,
        Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH 2/2] HID: core: increase HID report buffer size to 8KiB
Thread-Topic: [PATCH 2/2] HID: core: increase HID report buffer size to 8KiB
Thread-Index: AQHVy6AbD6/DjSC620KSVRW1WX/Tlqfr17uAgAAID4A=
Date:   Wed, 15 Jan 2020 15:50:33 +0000
Message-ID: <c72e9cdd-5a1d-ed07-f8c2-de26e4181a39@cisco.com>
References: <Pine.LNX.4.44L0.2001151017190.1788-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2001151017190.1788-100000@iolanthe.rowland.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jkorsnes@cisco.com; 
x-originating-ip: [2001:420:44c1:2576:5a2f:415d:31e3:2554]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: feb25e43-179a-444f-8879-08d799d2a827
x-ms-traffictypediagnostic: DM5PR1101MB2347:
x-microsoft-antispam-prvs: <DM5PR1101MB2347D9BACABA9E199DA82034D7370@DM5PR1101MB2347.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(199004)(189003)(91956017)(76116006)(66556008)(66946007)(54906003)(2616005)(81156014)(64756008)(66446008)(36756003)(81166006)(2906002)(8936002)(31686004)(66476007)(6506007)(5660300002)(316002)(8676002)(53546011)(6916009)(478600001)(6512007)(86362001)(6486002)(186003)(4326008)(31696002)(71200400001);DIR:OUT;SFP:1101;SCL:1;SRVR:DM5PR1101MB2347;H:DM5PR1101MB2140.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6R+XPgm36I+v+Ho3sTx+cU4eY4yvNNYwTnYbTsNl5WLDgKnGOf5Rv5yaD8N5Mx7KOiVK4SxrPmzY6bKWa3lgOeezuB3TJB1iKbBZ6WNvITuxp5fT6u1lXqLmG6MRZ2CeY03qq5fpVDrsYhQJ2dggr2zmz5E3GZ3NEy0QS6iitgadNm/bMzOx3KmQ5ur0CXsyamNsCOde5JOKjoDgYuUiiOt7YUJ9n9frK5rL/4pAWTbr0oGXH0wlfGnThWtrhCJvQxR589Z2fnoODoEg8pY6uyNhaRwc5Arx/6eGEb3Aiu5O5m/cKwkXNA/jTOT+2fySk463bUJhVHo0F9V8cZNZg8LK6ycoqBPnAHNX1DKmlVX69/p9VAnR/wpNq/bDEfr5R/3pin1rrFnPHLBXqurYBFGzqePV58SXCFsnC+pv9oEfQmufb4RcNqu6ErFuCDQr
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3572548F11F5E54A9EDD347B844E9C16@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: feb25e43-179a-444f-8879-08d799d2a827
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 15:50:33.7840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IRPTc/j+fbaYoNt29vpSHvL2Ces7xxnyPG3cfwCg6RBXyhTuPg40hX76OY03xcZFW2mCFgZFt1n1eA65ud7iBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2347
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.15, xch-rcd-005.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gMS8xNS8yMCA0OjIxIFBNLCBBbGFuIFN0ZXJuIHdyb3RlOg0KPiBPbiBXZWQsIDE1IEphbiAy
MDIwLCBKb2hhbiBLb3JzbmVzIHdyb3RlOg0KPiANCj4+IFdlIGhhdmUgYSB0b3VjaCBkZXZpY2Ug
dGhhdCByZXBvcnRzIGl0cyBvcGVucyBhbmQgc2hvcnRzIHRlc3QgcmVzdWx0cw0KPj4gaW4gSElE
IGJ1ZmZlcnMgb2Ygc2l6ZSA4MTg0IGJ5dGVzLiBXaXRoIHRoaXMgcGF0Y2ggd2UncmUgYWJsZSB0
bw0KPj4gc3VjY2Vzc2Z1bGx5IG9idGFpbiB0aGVzZSByZXBvcnRzLg0KPj4NCj4+IEFsYW4gU3Rl
cm46IFlvdXIgY29tbWl0IDhlYzMyMWU5NmUwNSAoIkhJRDogRml4IHNsYWItb3V0LW9mLWJvdW5k
cw0KPj4gcmVhZCBpbiBoaWRfZmllbGRfZXh0cmFjdCIpIHN0YXRlczoNCj4+DQo+PiAiVGhpcyBw
YXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBieSByZWplY3RpbmcgYW55IHJlcG9ydCB3aG9zZSB0b3Rh
bA0KPj4gbGVuZ3RoIGV4Y2VlZHMgdGhlIEhJRF9NQVhfQlVGRkVSX1NJWkUgbGltaXQgKG1pbnVz
IG9uZSBieXRlIHRvIGFsbG93DQo+PiBmb3IgYSBwb3NzaWJsZSByZXBvcnQgaW5kZXgpLiBJbiB0
aGVvcnkgYSBkZXZpY2UgY291bGQgaGF2ZSBhIHJlcG9ydA0KPj4gbG9uZ2VyIHRoYW4gdGhhdCwg
YnV0IGlmIHRoZXJlIHdhcyBzdWNoIGEgdGhpbmcgd2Ugd291bGRuJ3QgaGFuZGxlIGl0DQo+PiBj
b3JyZWN0bHkgYW55d2F5LiINCj4+DQo+PiBJcyB0aGlzIHNvbWV0aGluZyB3ZSBoYXZlIHRvIHdv
cnJ5IGFib3V0IHdoZW4gaW5jcmVhc2luZyB0aGUgYnVmZmVyDQo+PiBzaXplPyBPciBhcmUgeW91
IHJlZmVycmluZyB0byB0aGUgZmFjdCB0aGF0IHdlIHByZXZpb3VzbHkgdHJ1bmNhdGVkDQo+PiB0
aGUgcmVwb3J0cyBpZiB0aGV5IGV4Y2VlZGVkIG1heCBidWZmZXIgc2l6ZT8NCj4gDQo+IFRoZSBs
YXR0ZXIuICBBbmQgYWZ0ZXIgdGhpcyBwYXRjaCB3ZSB3aWxsIHN0aWxsIHRydW5jYXRlIHJlcG9y
dHMgdGhhdA0KPiBleGNlZWQgdGhlIG1heCBidWZmZXIgc2l6ZSwgbm8gInByZXZpb3VzbHkiIGFi
b3V0IGl0Lg0KPiANCj4gKEluY2lkZW50YWxseSwgdGhlc2UgbGFzdCB0aHJlZSBwYXJhZ3JhcGhz
IGRvbid0IGJlbG9uZyBpbiB0aGUgcGF0Y2gNCj4gZGVzY3JpcHRpb247IG5vYm9keSB3aWxsIGNh
cmUgYWJvdXQgdGhlbSBvbmNlIHRoZSBwYXRjaCBoYXMgYmVlbg0KPiBtZXJnZWQuICBZb3Ugc2hv
dWxkIGhhdmUgcHV0IHRoZW0gYmVsb3cgdGhlICItLS0iIHNlcGFyYXRvciBsaW5lLikNCj4gDQoN
ClJpZ2h0LiBJZiB0aGlzIHBhdGNoIGlzIG9mIGludGVyZXN0IEkgY2FuIHN1Ym1pdCBhIHNlY29u
ZCB2ZXJzaW9uDQp3aXRoIGEgY2xlYW5lZC11cCBwYXRjaCBkZXNjcmlwdGlvbi4NCg0KUmVnYXJk
cywNCkpvaGFuDQoNCj4gQWxhbiBTdGVybg0KPiANCg0K
