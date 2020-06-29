Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0950720E407
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jun 2020 00:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732552AbgF2VUO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Jun 2020 17:20:14 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:60734 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388780AbgF2VUJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Jun 2020 17:20:09 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5E6DD4010A;
        Mon, 29 Jun 2020 21:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593465608; bh=x6YyNTL8u5DO3gCZEGBswBro89vYNwU/xGTcBlpNMHw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=i+rBAiGkdlrDWr4UNTn7Uy7eBnhJ16y9vjX4Bj8k/5DOHmFOPw7Uxt6Fu/5IFHaug
         syn0QYjjo1ixF3fH0KhhMAUsvjofShWV82HSsjHD0lBE8v2R9CBnW+LKavIQHA5aEZ
         EbK91xsBFTeLPH7F0hEpCPspOI7jjQ7RrcexDTDuW+qFdtgsn0t/rwX16IX1Pec69L
         m7gxTbwTZKcZNA74i/T4vdY9wsjWA3rSzhDuSrFPhee2VBgk5wmBxKw6wF07J7L496
         icfUjzXdf6h59mJ7noOIMh1bFOPyEqjH36PlQ/2CX//LEz4+zHN3UNVGcofBDFBySh
         Yzw7bKN1EeYbQ==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 11178A0081;
        Mon, 29 Jun 2020 21:20:05 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E30BC80056;
        Mon, 29 Jun 2020 21:20:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="jtWaBZgJ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S/l0IPbZTuO8z+Cn/zbYhhqCt3HcXaBVXHaGRQ6MPelSrjiLrOtDuwHqyUwLPPSj+V1FTQtfoRLON/YRg3iaudGdi6TnYkJD4XRClakzg5kAIyv2XqgQS5qhrvmRLpYr9gF8hFR0B04yDC0SC8OyrXiwbB6lqByK3C8umpw9yI3i7vQSco6RPSyrazplFinxZc28vLJU9KpYGL0DQKYGHEr0zkRIl/gEC4zSdL2DYbqv0ncgsniRZBZ7Oq2ecqQunHPnqDv+Erorc0mk7y4gMEJe6blRkjq5RHjADFHrKRkqwghOwcsy0TKjUoFZHng1Y54k60KGPmbBndcSa6FiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6YyNTL8u5DO3gCZEGBswBro89vYNwU/xGTcBlpNMHw=;
 b=VXALWotBvHPgdc12L3OKOwZusISj1qb4PBcDmDME/hsD3xJj1MQVkQp1nUBLkrVN8UgkxPiXWo4LcozgbPQgpmwWfb1dvxO+wWj27pa+Iebq8nOa9fWpxwDPyfvXphvZVb4vo+v+2KYfJ2+uAleUE2agyyb0p3UuUfnlyk2WhI86wXUoRM1f5PHroqXGDpx8HtL4M3AzNdU6l21j+qBh0qcs+tBBSrOgyjxudY2VRSoiA4VY3DRhTWvC2O8ZjcjeMuv/MB6t0rzTVNlW+ISvftREnxdUWUh0JwQD8VZPyzohQ9Gl9JjgmJOrI2jY5TpdBx1XDC6GM9SgaPBkbHKRSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6YyNTL8u5DO3gCZEGBswBro89vYNwU/xGTcBlpNMHw=;
 b=jtWaBZgJJ0IAvIK1gjHVIyi9oMdrGLFeS07JzFWzLDqiyMESN3v0JWFWG7VLLFDNprbEXTZkiWQsXt1AVW/XgQ8q2i0iAFiyIRUSzwmAx/4fYfN90n++jx+3h8XD9YiT8c3wItZRh/jIJGhmEjs5Et27yYnhcyipMwZ+K57VPjg=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3190.namprd12.prod.outlook.com (2603:10b6:a03:132::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Mon, 29 Jun
 2020 21:20:02 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3131.027; Mon, 29 Jun 2020
 21:20:02 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v3 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWThhOzLrXo8ZwKEeViYgzIGbLnqjwGekA
Date:   Mon, 29 Jun 2020 21:20:02 +0000
Message-ID: <20d3ff88-b4df-91e7-aaa6-ec05917c32ab@synopsys.com>
References: <20200629132206.3914-1-m.grzeschik@pengutronix.de>
 <20200629132206.3914-2-m.grzeschik@pengutronix.de>
In-Reply-To: <20200629132206.3914-2-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a8268da-6764-46cb-922d-08d81c722fee
x-ms-traffictypediagnostic: BYAPR12MB3190:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB31909A9B2838BCC20390BB14AA6E0@BYAPR12MB3190.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hNDRmfS1PONkrIoQ3ud+MmuKCx7by/3HOlUPJtYxK2H/52vE7QUBUcIPkWvX+hd+EGnIIhAdbrbaF6mYOJf8B64OSDFIgmNJ1OJ1CZzOlILb2Xza8VFigl/+BmhYhsmUAiWWxB2F6aduRPn61Iew8MPHhMEry5YXnDumMcfGL6pxOgxxBT7cgVxWMdo0ASjovbEPG4vA4ZjVbwVZiyJUOWUnGZgbZAFv4rLbHLRZEdIEhYcz7BMnfDxNs+KDMaJ43iBcLlp/5Kwdk+LvZm/NJ5mHS9cR7W2u5SwUYHcnonhtU7xJ3/lj737pIQWwFeS4GgDVCi5Mq2A5pZQjwAP0zhwCvM77NY2SBbtjuR/QsJlnLWQhlapM9bTu7oKO9mUN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(39860400002)(366004)(396003)(186003)(5660300002)(8676002)(2906002)(66476007)(26005)(54906003)(110136005)(8936002)(31686004)(76116006)(91956017)(316002)(86362001)(31696002)(66446008)(64756008)(66556008)(66946007)(6506007)(478600001)(2616005)(6512007)(6486002)(36756003)(4326008)(83380400001)(71200400001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: c2dDWGuw9iTzDnjduidVUzqkzOrTuGy2XnBQO/Xawdvr+dqzL8Bo5lhGGO00hLdhohn5Q3qrHaaEqUp+OPxlEz4L5R5bbI99VWGrWRU9OuA656QAaSb/YTQS+BU4JPdSBIHcau2j/TzOD5SmMNJipvI30jIqvVJ0u1WWKH5USgyNXSGcpEdAAY+1goRJQJbIOxe0N+kGxinjT5c7LKVfWTwS+4BK+KNYR93FpaYdrfs4gXfy8/0FcJyjwVIPSW5Q8Sp8e3XPTJcKM9Ejto3r63RtYnt6CnqmukarbAaCfRT4YbHFTQrhx64fVCs8UeprpK79KRnguw1j3n0UiW55oNdxcwY4aqD0tPraYJ656a97BzUnRgJrBVBZ9d1Qv6tPmO8PRvrUKpj3L513NpXSBAojPMdCiz7oWkiZMDCIm2fHkzsQTImveZ/g4o+KuxoftjC9Ni5lpNoF/FHO28Bxn16RnWTpkXhvkEkRuRuCRTA=
Content-Type: text/plain; charset="utf-8"
Content-ID: <487A43E8BC6F524DBA82FF012FA63FBB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8268da-6764-46cb-922d-08d81c722fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 21:20:02.7699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Br6v7NR6E17oIsrqrztOlihhgmJ7+TKOjKLtRpPD28M3daYSM6RghWLkKCjY7soUU4owhZA7Eb52gH8wgSFoQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3190
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBGcm9tOiBNaWNoYWVsIE9sYnJpY2gg
PG0ub2xicmljaEBwZW5ndXRyb25peC5kZT4NCj4NCj4gQ3VycmVudGx5IF9fZHdjM19nYWRnZXRf
c3RhcnRfaXNvYyBtdXN0IGJlIGNhbGxlZCB2ZXJ5IHNob3J0bHkgYWZ0ZXINCj4gWGZlck5vdFJl
YWR5LiBPdGhlcndpc2UgdGhlIGZyYW1lIG51bWJlciBpcyBvdXRkYXRlZCBhbmQgc3RhcnQgdHJh
bnNmZXINCj4gd2lsbCBmYWlsLCBldmVuIHdpdGggc2V2ZXJhbCByZXRyaWVzLg0KPg0KPiBEU1RT
IHByb3ZpZGVzIHRoZSBsb3dlciAxNCBiaXQgb2YgdGhlIGZyYW1lIG51bWJlci4gVXNlIGl0IGlu
IGNvbWJpbmF0aW9uDQo+IHdpdGggdGhlIGZyYW1lIG51bWJlciBwcm92aWRlZCBieSBYZmVyTm90
UmVhZHkgdG8gZ3Vlc3MgdGhlIGN1cnJlbnQgZnJhbWUNCj4gbnVtYmVyLiBUaGlzIHdpbGwgc3Vj
Y2VlZCB1bmxlc3MgbW9yZSB0aGFuIG9uZSAxNCByb2xsb3ZlciBoYXMgaGFwcGVuZWQNCj4gc2lu
Y2UgWGZlck5vdFJlYWR5Lg0KPg0KPiBTdGFydCB0cmFuc2ZlciBtaWdodCBzdGlsbCBmYWlsIGlm
IHRoZSBmcmFtZSBudW1iZXIgaXMgaW5jcmVhc2VkDQo+IGltbWVkaWF0ZWx5IGFmdGVyIERTVFMg
aXMgcmVhZC4gU28gcmV0cmllcyBhcmUgc3RpbGwgbmVlZGVkLg0KPiBEb24ndCBkcm9wIHRoZSBj
dXJyZW50IHJlcXVlc3QgaWYgdGhpcyBoYXBwZW5zLiBUaGlzIHdheSBpdCBpcyBub3QgbG9zdCBh
bmQNCj4gY2FuIGJlIHVzZWQgaW1tZWRpYXRlbHkgdG8gdHJ5IGFnYWluIHdpdGggdGhlIG5leHQg
ZnJhbWUgbnVtYmVyLg0KPg0KPiBXaXRoIHRoaXMgY2hhbmdlLCBfX2R3YzNfZ2FkZ2V0X3N0YXJ0
X2lzb2MgaXMgc3RpbGwgbm90IHN1Y2Nlc3NmdWxseSBpbiBhbGwNCj4gY2FzZXMgYml0IGl0IGlu
Y3JlYXNlcyB0aGUgYWNjZXB0YWJsZSBkZWxheSBhZnRlciBYZmVyTm90UmVhZHkNCj4gc2lnbmlm
aWNhbnRseS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBPbGJyaWNoIDxtLm9sYnJpY2hA
cGVuZ3V0cm9uaXguZGU+DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJldHRlciA8bS50cmV0
dGVyQHBlbmd1dHJvbml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8
bS5ncnplc2NoaWtAcGVuZ3V0cm9uaXguZGU+DQo+DQo+IC0tLQ0KPiB2MSAtPiB2MjogLSByZW1v
dmVkIGxhc3RfZnJhbWVfbnVtYmVyIGZyb20gc3RydWN0DQo+ICAgICAgICAgICAgLSBpbmNsdWRl
ZCByb2xsb3ZlciB2YXJpYWJsZQ0KPiB2MiAtPiB2MzogLSBtb3ZlZCB0aGUgY2FsY3VsYXRpb24g
YmVmb3JlIHRoZSByZXRyeSBsb29wDQo+ICAgICAgICAgICAgLSBza2lwcGluZyB0aGUgY2FsY3Vs
YXRpb24gaWYgYkludGVydmFsID4gMTQNCj4NCj4gICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5j
IHwgMTkgKysrKysrKysrKysrKysrKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIGIvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiBpbmRleCA4ZGU2ZjEwZDMzNWUxYzAuLjdhZDg1YTdk
MDZmNzBiZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPiArKysg
Yi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+IEBAIC0xNDYzLDYgKzE0NjMsNyBAQCBzdGF0
aWMgaW50IGR3YzNfZ2FkZ2V0X3N0YXJ0X2lzb2NfcXVpcmsoc3RydWN0IGR3YzNfZXAgKmRlcCkN
Cj4gICANCj4gICBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfc3RhcnRfaXNvYyhzdHJ1Y3QgZHdj
M19lcCAqZGVwKQ0KPiAgIHsNCj4gKwljb25zdCBzdHJ1Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0
b3IgKmRlc2MgPSBkZXAtPmVuZHBvaW50LmRlc2M7DQo+ICAgCXN0cnVjdCBkd2MzICpkd2MgPSBk
ZXAtPmR3YzsNCj4gICAJaW50IHJldDsNCj4gICAJaW50IGk7DQo+IEBAIC0xNDgwLDYgKzE0ODEs
MjQgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X3N0YXJ0X2lzb2Moc3RydWN0IGR3YzNfZXAg
KmRlcCkNCj4gICAJCQlyZXR1cm4gZHdjM19nYWRnZXRfc3RhcnRfaXNvY19xdWlyayhkZXApOw0K
PiAgIAl9DQo+ICAgDQo+ICsJaWYgKGRlc2MtPmJJbnRlcnZhbCA8PSAxNCkgew0KPiArCQl1MzIg
ZnJhbWUgPSBfX2R3YzNfZ2FkZ2V0X2dldF9mcmFtZShkd2MpOw0KPiArCQlib29sIHJvbGxvdmVy
ID0gZnJhbWUgPCAoZGVwLT5mcmFtZV9udW1iZXIgJiAweDNmZmYpOw0KPiArDQo+ICsJCS8qDQo+
ICsJCSAqIGZyYW1lX251bWJlciBpcyBzZXQgZnJvbSBYZmVyTm90UmVhZHkgYW5kIG1heSBiZSBh
bHJlYWR5DQo+ICsJCSAqIG91dCBvZiBkYXRlLiBEU1RTIG9ubHkgcHJvdmlkZXMgdGhlIGxvd2Vy
IDE0IGJpdCBvZiB0aGUNCj4gKwkJICogY3VycmVudCBmcmFtZSBudW1iZXIuIFNvIGFkZCB0aGUg
dXBwZXIgdHdvIGJpdHMgb2YNCj4gKwkJICogZnJhbWVfbnVtYmVyIGFuZCBoYW5kbGUgYSBwb3Nz
aWJsZSByb2xsb3Zlci4NCj4gKwkJICogVGhpcyB3aWxsIHByb3ZpZGUgdGhlIGNvcnJlY3QgZnJh
bWVfbnVtYmVyIHVubGVzcyBtb3JlIHRoYW4NCj4gKwkJICogcm9sbG92ZXIgaGFzIGhhcHBlbmVk
IHNpbmNlIFhmZXJOb3RSZWFkeS4NCj4gKwkJICovDQo+ICsNCj4gKwkJZGVwLT5mcmFtZV9udW1i
ZXIgPSAoZGVwLT5mcmFtZV9udW1iZXIgJiB+MHgzZmZmKSB8IGZyYW1lOw0KPiArCQlpZiAocm9s
bG92ZXIpDQo+ICsJCQlkZXAtPmZyYW1lX251bWJlciArPSBCSVQoMTQpOw0KPiArCX0NCj4gKw0K
PiAgIAlmb3IgKGkgPSAwOyBpIDwgRFdDM19JU09DX01BWF9SRVRSSUVTOyBpKyspIHsNCj4gICAJ
CWRlcC0+ZnJhbWVfbnVtYmVyID0gRFdDM19BTElHTl9GUkFNRShkZXAsIGkgKyAxKTsNCj4gICAN
Cg0KSSB0aGluayBpdCdzIGNsZWFuZXIgdG8gY3JlYXRlIGEgbWFzayBmb3IgMHgzZmZmLCBidXQg
SSBjYW4gc2VlIGhvdyBpdCANCmNhbiBhcmd1YWJseSBjbGVhcmVyIGZvciBub3QgdXNpbmcgYSBt
YWNybyBhbHNvLiBJdCdzIGZpbmUgdG8gbWUgZWl0aGVyIHdheS4NCg0KRm9yIGJvdGggcGF0Y2hl
cyBpbiB0aGlzIHNlcmllczoNClJldmlld2VkLWJ5OiBUaGluaCBOZ3V5ZW4gPHRoaW5obkBzeW5v
cHN5cy5jb20+DQoNClRoYW5rcywNClRoaW5oDQoNCg==
