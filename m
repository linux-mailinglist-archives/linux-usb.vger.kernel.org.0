Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A986911E30F
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 12:56:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfLML4F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 06:56:05 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:58448 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726717AbfLML4F (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Dec 2019 06:56:05 -0500
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1657CC0273;
        Fri, 13 Dec 2019 11:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576238164; bh=z3kDkkrRQREopPqRk0LRHErJ+w5MzXDxNidL/nJ9g8w=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RFUYy0kH/QTPDjwbx23MeX0nOXB5Z9zAn4nPIWSV0KGkvBDZpmCLPCK+Fb/tQOWx4
         U2VBdhOfcVMcOpmy+m+KVWMRxzLIk1UtnXzMJqYdzhqTqpBLYE/Wfu4B+Ft31mLIHH
         4He3UQ8j5coEQabGiklnAn9S+9heNQe1smoaa1OjKAH0Zba7NDI2taNBnfhCq7S046
         FdxWTzjXfeSP6knVKXpLVrxw1++BTcu0yRoGMyu4XX6HOkkVWITEWeTcpNDluPReF/
         OocSBFov4PxlHjdNBUE6EMwI4EKGcTHQo018rCp6Tjqct/gnltSEphm+UBF09NNB/s
         7y7jNbdqj/t2Q==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E81AAA0079;
        Fri, 13 Dec 2019 11:55:56 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 13 Dec 2019 03:55:40 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 13 Dec 2019 03:55:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNSHQPblydau+NNmdm/vLlfJJFeL9p7ZFCC9wg7GJdZxTp8Zr+2y11v7lp4J37fyZ5VQMC51o73wN5QjIjD4IAFw4iier5puhYzaO1gZhk/fXus4/OgpBCIFrT+bXNGI/bwSrtU+E7mSpqnl+8tdDJhA+ANHv1H2AOKVGVPiQgf8nKPkuEa+gqB57afiebBYsKIcNn4Ekd69nvRK8HVRHbQ1mzFnRtnBUgFPR+o5R8NFS8mjHmfxba2oCoKNUUfzzoZPGTDcEKC0ya7RHG0pg2eG21PsW5SPMRxfVWA+hxWIgRklPRyymJ0KZQEK/gixlmC0kn4BEHOME1zlTmdi7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3kDkkrRQREopPqRk0LRHErJ+w5MzXDxNidL/nJ9g8w=;
 b=CxZILkgWIB8QR8EwkcILcvirdPdIX0HJnCQjfJ+oHCp7gwZTmwdCpFiHXDGTGQOape56IJz6wRhbl2/VcyQoF2zeg5vY6ujz46LkLKUYOfhcTm662FbhCN9fS3Zv016/QpWIYfIwkq2BGh/HDbdifsOzudlzI+Wx9e6BwAcKTAz0VAJDYfyB7MTB+X3kZstgE+BTC+lvSIHDBuML8ZnFAvK/30NhGcTGb2G/Kh6D+kjh1/w56/ync12b4BD7ObMHG1jK3O30pQy05gE3/6TjA6mMDv4CS16DHJN6D6WlGvObQXaEoDcgwv6zdFB2bW/TKqx/tfEQm+J23nhQOqH6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z3kDkkrRQREopPqRk0LRHErJ+w5MzXDxNidL/nJ9g8w=;
 b=bRlv8ZXyvhUu9iT/UDzW+Qoqst8NB2yXheWcqSC32NAXhVPzBKUkrYxsYyS+EDe+HjeFj5DBsYbY6NSRawFDA+Gm5K8pc6rYR5uLyqSm7c0B/VFVLooxb86l2y7nKOYUXIj/QoNzzH1ly6G2mmA9w0+HsMOX+a4H3o4NeFC/OJM=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB2928.namprd12.prod.outlook.com (20.179.83.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Fri, 13 Dec 2019 11:55:38 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::d0e:7272:4a88:ffeb]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::d0e:7272:4a88:ffeb%5]) with mapi id 15.20.2538.017; Fri, 13 Dec 2019
 11:55:38 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Jack Mitchell <ml@embed.me.uk>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>
CC:     Phillip Karls <prkarls@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: RK3288 dwc2 USB OTG + macOS
Thread-Topic: RK3288 dwc2 USB OTG + macOS
Thread-Index: AQHVWQgnMkJE65IZHEGxyc1XtnBgSqcTjyUAgI183ACAF5GRgIAACNSA
Date:   Fri, 13 Dec 2019 11:55:38 +0000
Message-ID: <9ba410fb-80c7-8500-f1b3-f4f777868644@synopsys.com>
References: <e6321abc-1d3a-cfa1-638a-6051719462ad@embed.me.uk>
 <bcda1da2-fcdf-2c5b-d07b-5cf397571eb7@embed.me.uk>
 <3e45e70d-1e59-373d-76b7-b6a8a6320514@synopsys.com>
 <8a2341be-7b34-54d1-83aa-d8961d2c1618@embed.me.uk>
In-Reply-To: <8a2341be-7b34-54d1-83aa-d8961d2c1618@embed.me.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hminas@synopsys.com; 
x-originating-ip: [46.162.196.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8df2836-e729-4cf3-c02f-08d77fc35eee
x-ms-traffictypediagnostic: MN2PR12MB2928:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2928931DD2823A6E984981A6A7540@MN2PR12MB2928.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(366004)(376002)(396003)(136003)(199004)(189003)(110136005)(81156014)(8676002)(8936002)(26005)(81166006)(6512007)(66946007)(76116006)(66446008)(2906002)(2616005)(66476007)(478600001)(64756008)(91956017)(186003)(66556008)(36756003)(31686004)(4326008)(71200400001)(6486002)(53546011)(316002)(6506007)(966005)(86362001)(31696002)(54906003)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB2928;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o7uu6OOLu3qOs2Y4bURzrPWFzr1RaPjGPaioLfwoUpSmHi17SxpcnX7L4JPO1BNefNYciH/3MYnEb6UoR9NCJTUUheRnhl04KYpOcKDKms1kW/BbFAEWy0rW8fzIDdQLNA5phpgZKzXB9r67bOYrYFVot4DGL8NO6kncFBYt+jNHMiW6cjOJFt31cz4LmnKUBajaTC6HgT5qB2wE6/VRVI3K6FPhbvUBnF36fYqyhicj2L721cn+/3C96baSC30AwgtEcQ44wX9IPBWi3ohLWjaQ3aIFWmqUDqwRfwTrkaLj9r8SlCei9z+oWnujRFC/rSSredYXawExj6Y2N0VDI9apFWguhEYtX1mA4xw5ALKlw6D1Sfc3oIB/X0ZWA3XMyFcZBN5No0zrZcxLssWWQaDWo7nMfkJSufKGGyWbT34MaJyK06uCX6hby8mNzYmmcPyi12tZz4htpOznFxaw379tWfB8Z8q1EGfNPXeMPXo=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED71CF75D27B3B41AE792B3FDCC17308@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b8df2836-e729-4cf3-c02f-08d77fc35eee
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 11:55:38.3194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rgdcjl1LYZ41KEI1SPc1FMjfwKXKsHGZdZCZU8cAX+p0dSVJgnmPTocpE0es0qHCUVSuZP6MRzmYR/0p+kxsTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2928
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSmFjaywNCg0KT24gMTIvMTMvMjAxOSAzOjI0IFBNLCBKYWNrIE1pdGNoZWxsIHdyb3RlOg0K
PiBIaSBNaW5hcywNCj4gDQo+IE9uIDI4LzExLzIwMTkgMTE6MjksIE1pbmFzIEhhcnV0eXVueWFu
IHdyb3RlOg0KPj4gSGkgSmFjaywNCj4+DQo+Pg0KPj4gT24gOC8zMC8yMDE5IDI6NDkgUE0sIEph
Y2sgTWl0Y2hlbGwgd3JvdGU6DQo+Pj4gT24gMjIvMDgvMjAxOSAxNzowNiwgSmFjayBNaXRjaGVs
bCB3cm90ZToNCj4+Pj4gSSdtIGhhdmluZyBpc3N1ZXMgb24gYSBGaXJlZmx5IHJrMzI4OCBib2Fy
ZCB3aGVuIHRyeWluZyB0byB1c2UgVVNCDQo+Pj4+IGdhZGdldCBldGhlcm5ldCBvbiBtYWNPUy4g
VGhlIGRyX21vZGUgaXMgc2V0IHRvICJvdGciIGFuZCBpdCB3b3JrcyBmaW5lDQo+Pj4+IHdpdGgg
bXkgTGludXggZGVza3RvcC4NCj4+Pj4NCj4+Pj4gSWYgSSBzZXQgdGhlIGRyX21vZGUgdG8gInBl
cmlwaGVyYWwiIG1hY09TIHdpbGwgd29yaywgYnV0IHN0aWxsIHRha2VzDQo+Pj4+IGFyb3VuZCAx
MCBzZWNvbmRzIHRvIGVudW1lcmF0ZSB0aGUgZGV2aWNlIHdoaWNoIG1ha2VzIG1lIHRoaW5rIGl0
J3Mgb25seQ0KPj4+PiBqdXN0IHdvcmtpbmcuIEhvd2V2ZXIsIEkgbmVlZCB0aGUgcG9ydCB0byBi
ZSBpbiAib3RnIiBtb2RlIGFzIGl0IHdpbGwNCj4+Pj4gc3dpdGNoIGJldHdlZW4gcGVyaXBoZXJh
bC9ob3N0IHVzZSBjYXNlcy4NCj4+Pj4NCj4+Pj4gSSd2ZSBhdHRhY2hlZCBhIGxvZyBmcm9tIHRo
ZSBkd2MyIGRyaXZlciBmcm9tIG1haW5saW5lIExpbnV4IDUuMiB3aGVuDQo+Pj4+IGJlaW5nIHBs
dWdnZWQgaW50byB0aGUgbWFjT1MgZGV2aWNlIGZvciAzMCBzZWNvbmRzLCB0aGVuIHJlbW92ZWQu
IFRoZQ0KPj4+PiBtYWMgaW4gdGhpcyBjYXNlIGlzIGEgMjAxMyBtYWNib29rIHByby4gQW55IHBv
aW50ZXJzIGluIHRoZSByaWdodA0KPj4+PiBkaXJlY3Rpb24gd291bGQgYmUgZ3JlYXRseSBhcHBy
ZWNpYXRlZC4NCj4+Pj4NCj4+Pj4gUmVnYXJkcywNCj4+Pj4gSmFjay4NCj4+Pj4NCj4+IFNvcnJ5
LCBmb3IgbGF0ZSByZXNwb25zZS4NCj4+DQo+PiBDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHJlY2Vu
dGx5IHN1Ym1pdHRlZCBwYXRjaCAiW1BBVENIXSB1c2I6IGR3YzI6IEZpeA0KPj4gU0VUL0NMRUFS
X0ZFQVRVUkUgYW5kIEdFVF9TVEFUVVMgZmxvd3MiIGFuZCB0ZXN0IGFnYWluLg0KPj4NCj4gDQo+
IFRlc3RlZCBhbmQgY29uZmlybWVkIHdvcmtpbmcsIG1hbnkgdGhhbmtzLg0KPiANCj4gVGVzdGVk
LUJ5OiBKYWNrIE1pdGNoZWxsIDxtbEBlbWJlZC5tZS51az4NCj4gDQoNClRoYW5rcyBmb3IgdGVz
dGluZy4NCg0KVGhhbmtzLA0KTWluYXMNCg0KDQo+Pj4NCj4+PiBJJ3ZlIGJlZW4gcG9raW5nIGFi
b3V0IHdpdGggdGhpcyBzb21lIG1vcmUgYW5kIEkndmUgbWFuYWdlZCB0byBiaXNlY3QNCj4+PiB0
aGUgaXNzdWUgZG93biB0byB0aGUgZm9sbG93aW5nIGNvbW1pdA0KPj4+DQo+Pj4gNzI5Y2FjNjkz
ZWVjZmViZGI5ZTE1MmVhZGRkZGQzNThhZTJkZWNiNyB1c2I6IGR3YzI6IENoYW5nZSBJU09DIERE
TUEgZmxvdw0KPj4+DQo+Pj4gSWYgSSBidWlsZCBiZWZvcmUgdGhpcyBjb21taXQgZXZlcnl0aGlu
ZyB3b3JrcyBmaW5lIHdpdGggYSBnX2V0aGVyDQo+Pj4gZ2FkZ2V0IGRldmljZSBvbiBtYWMuIFVu
Zm9ydHVuYXRlbHkgaXQncyBhIHJhdGhlciBsYXJnZSBjaGFuZ2Ugd2hpY2ggSQ0KPj4+IGNhbid0
IGp1c3QgcmV2ZXJ0IGluIG1hc3RlciBhcyBpdCdzIGdvdCBtdWx0aXBsZSBkZXBlbmRhbnQgY29t
bWl0cw0KPj4+IGxhdGVyLiBTbywgYW55IGFkdmljZSBvbiB3aGF0IGNvdWxkIGJlIGNhdXNpbmcg
dGhpcyBvciBob3cgdG8gaGVscCBkZWJ1Zw0KPj4+IGl0IHdvdWxkIGJlIG11Y2ggYXBwcmVjaWF0
ZWQsIGFzIGF0IHRoZSBtb21lbnQgSSd2ZSBqdXN0IGZvcndhcmQgcG9ydGVkDQo+Pj4gdGhlIHdv
cmtpbmcgNC4xNiB2ZXJzaW9uIG9mIHRoZSBkcml2ZXIgb3ZlciB0aGUgNS4zLXJjNiBicm9rZW4g
ZHJpdmVyDQo+Pj4gd2hpY2ggaXNuJ3QgdmVyeSBzdXN0YWluYWJsZSBpbiB0aGUgbG9uZyBydW4u
DQo+Pg0KPj4gSSBkb24ndCB0aGluayB0aGF0IGlzc3VlIHJvb3QgY2F1c2UgY29taW5nIGZyb20g
bWVudGlvbmVkIGJ5IHlvdSBhYm92ZQ0KPj4gcGF0Y2guIEJhc2VkIG9uIGxvZyB5b3UgcHJvdmlk
ZWQsIFNFVF9GRUFUVVJFIGNvbnRyb2wgdHJhbnNmZXIgbm90DQo+PiBjb21wbGV0ZWQgYnkgZ2Fk
Z2V0IC0gWkxQIG9uIHN0YXR1cyBzdGFnZSBub3Qgc2VudCB0byBob3N0Lg0KPj4NCj4+Pg0KPj4+
IFJlZ2FyZHMsDQo+Pj4gSmFjay4NCj4+Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4+IExpbnV4LXJvY2tjaGlwIG1haWxpbmcgbGlzdA0KPj4g
TGludXgtcm9ja2NoaXBAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPj4gaHR0cHM6Ly91cmxkZWZlbnNl
LnByb29mcG9pbnQuY29tL3YyL3VybD91PWh0dHAtM0FfX2xpc3RzLmluZnJhZGVhZC5vcmdfbWFp
bG1hbl9saXN0aW5mb19saW51eC0yRHJvY2tjaGlwJmQ9RHdJQ2FRJmM9RFBMNl9YXzZKa1hGeDdB
WFdxQjB0ZyZyPTZ6OUFsOUZySFJfWnFiYnRTQXNEMTZwdk9MMlMzWEh4UW5TenE4a3VzeUkmbT1Y
bHJfLW5MTl9wMU1ONEZ6ckUwdEpvMUREQm04VFlVc04zZlFRTG5BTDdjJnM9VGdhUlVHaGxSZk5z
OU1qRTNWUkhFMzQzVzRFYjhjVFlDV1ZYUjNLU3ZoUSZlPQ0KPj4NCg==
