Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B6510C7E5
	for <lists+linux-usb@lfdr.de>; Thu, 28 Nov 2019 12:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfK1L3I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Nov 2019 06:29:08 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:35818 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726227AbfK1L3H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Nov 2019 06:29:07 -0500
X-Greylist: delayed 447 seconds by postgrey-1.27 at vger.kernel.org; Thu, 28 Nov 2019 06:29:07 EST
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7930942662;
        Thu, 28 Nov 2019 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1574940546; bh=ZvQS7kxa2X2J7pQqPIGR8D9Bjudyky8lWGZD0jZzJi0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Jg/UAEyfvxVozXeGq3ozRlls4xdqksFmb6jhCMM8BcHPbYNnf+pNW9LyUyIebm4Vm
         QQ6IqDclMvzwjlJnduqFzTQ2QLfUCJ6Vd4UWx+sRQgGQ4qZmEG+0T8oI4TAGrF9b3g
         F9ZP2OtyWnV14u8OxJBrjHhKR7hb9ID+C0ggTWxlMHasCuGIb1TjZgfm/M+CZgcnuY
         FFtM4HVw+IBWTXoVgj40725jL7BwBhYHio90t6kWC1L63gOzWIrAjPFONXswCxTTIB
         fNurm8tpqTRzrOEb5mo7VsfATDegdCn1wsT9Rbd0wmpl/nyW9Hbh3ElsHdEuw5aSgn
         b23BFqyxXjfNQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id ACF85A0083;
        Thu, 28 Nov 2019 11:29:05 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 28 Nov 2019 03:29:05 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 28 Nov 2019 03:29:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTn+nP0sUTMTxUoQgIxABZluAUPrL1JGrm2KJThF+RyvRcwN3DO6sV2I3yL4n5KSQxG/U35XVrCoey5TNDlaj5mlx6Mep2BfiC5i4jXBK5NWLptFKwu1oKYaEyqLPLKLD1PPAGbQ71EAxnTVnIjr0NIi0RjuDW68ds7R8TZyIFeaZtwKqkNr1LfVtA88hiPTK9b9ZsOJBoLK9q1QCVEJesfrd0cTsNBQa1nYcC41TNQWiq5JvVv/xsIlO0Z++SVEh6YcMOGvBa0GS6O98aeQ9+7w9mFKY6YqDfBg0B3viMEIzHKDcVTJnthODWxB2X5PiQ1AZh0jy+92a0PVhLx9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvQS7kxa2X2J7pQqPIGR8D9Bjudyky8lWGZD0jZzJi0=;
 b=WLrssrX3By4zDS4dXnOoXUdHb+1Iucb+24VQ5XacMHkJmshRiQFQnlFxo5jf+vRvEdIFTfDJJrV2Y5X+bpOAyGwVGN54DaGgMMzkRLjbledBFAOenL38MCW+ZGHMHvGojTKvLRXGR3v2puALQSYmpD7FczKeqtmFXzDM6nsuELpuhxHLlvtLtLS4AjTDh+mE4EwjZF0Np01BUN90gkEw3sxKgf/TVDuR3kfcuOlnLnaoCsG3GDceUW9RvsOGT7boZJAtNeQlCLOe8SbPQXDTA0BMsCzym/U44Phm4nT8Tf0V39JgeRT0J1pnnxHCQTKo6WXym9ApxSlJXJ83XtxjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvQS7kxa2X2J7pQqPIGR8D9Bjudyky8lWGZD0jZzJi0=;
 b=h6HP4kn0AHsBuouyDKfbv4UfaQMCEgxbT/+XnQmditLcfFUL4z63PuNBP4B0BqwEKATKFo+b25y26NH+aQtdcy/7jiNt9stJFqnW5APdhokYU2AUMmVvkK+wdAhm9x9opoXClYp6LkkUzbKT85l86JZl8wuOkU9WjV9dSU4nK+A=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB3952.namprd12.prod.outlook.com (10.255.236.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Thu, 28 Nov 2019 11:29:03 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::d0e:7272:4a88:ffeb]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::d0e:7272:4a88:ffeb%5]) with mapi id 15.20.2474.023; Thu, 28 Nov 2019
 11:29:03 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Jack Mitchell <ml@embed.me.uk>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>
CC:     Phillip Karls <prkarls@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: RK3288 dwc2 USB OTG + macOS
Thread-Topic: RK3288 dwc2 USB OTG + macOS
Thread-Index: AQHVWQgnMkJE65IZHEGxyc1XtnBgSqcTjyUAgI183AA=
Date:   Thu, 28 Nov 2019 11:29:03 +0000
Message-ID: <3e45e70d-1e59-373d-76b7-b6a8a6320514@synopsys.com>
References: <e6321abc-1d3a-cfa1-638a-6051719462ad@embed.me.uk>
 <bcda1da2-fcdf-2c5b-d07b-5cf397571eb7@embed.me.uk>
In-Reply-To: <bcda1da2-fcdf-2c5b-d07b-5cf397571eb7@embed.me.uk>
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
x-ms-office365-filtering-correlation-id: 98228742-007a-44e8-811c-08d773f62c0b
x-ms-traffictypediagnostic: MN2PR12MB3952:
x-microsoft-antispam-prvs: <MN2PR12MB3952B7637D8E4425D480647DA7470@MN2PR12MB3952.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0235CBE7D0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(136003)(366004)(376002)(396003)(199004)(189003)(86362001)(31696002)(3846002)(6116002)(31686004)(65806001)(66066001)(316002)(99286004)(64756008)(58126008)(65956001)(110136005)(54906003)(66446008)(5660300002)(66556008)(66476007)(2501003)(66946007)(76116006)(91956017)(36756003)(8936002)(81166006)(186003)(81156014)(2616005)(8676002)(478600001)(305945005)(76176011)(25786009)(11346002)(26005)(7736002)(102836004)(446003)(14454004)(6436002)(256004)(6512007)(4326008)(6246003)(71190400001)(71200400001)(53546011)(6506007)(6486002)(5024004)(229853002)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB3952;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TJMF25eHkuAgttxvcsN9efQlpnDmd31NOmvopBk26U9vOqcTfJPH8SqKLcYJDRc9edH4X74PwtTbeGC+EnFYz/2ZdzUjfq20PMHWpX6BGLcK2Mqt283PBrH0wV+jg7vjemgTN7CJf915HvMURwQI/57QjBAsucxlpGWxCTPmZ6Ka68ibdPmL8pExyGwKZhBKa4s0oTKkPPFQemOIuCaIki2CcwV5U4yS8tYYw0Uz65gWtfjLngXFdyCOejnN5hcjj76b+BBjey/iExM+qSWhioq46Om76eR2Iq+FnwMAtLFhr+HaiWG5xnE0kxEFeOsBtJ/oEBnPOYM3RBDa3TKj3pnTtH7UYYhZjAnwSmcesZUbLCfCAOsmFLo0T5P79z2CkUAieALT/tpu3eVUFy0dLeBSeGpIYykNpFRmKD2c0MSfyryDdvCPvd2ozmPBNbFS
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <543CABF7B3F5E440B7E39679B2829325@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 98228742-007a-44e8-811c-08d773f62c0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2019 11:29:03.2980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OOvVNiZHEbz69TcDq35EBxXuOWATdWBMTNZYG8QNKBiLpOUFz9exg7CD7B+9JL8a3JCRqkSCAxiRPUh4i7k3Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3952
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSmFjaywNCg0KDQpPbiA4LzMwLzIwMTkgMjo0OSBQTSwgSmFjayBNaXRjaGVsbCB3cm90ZToN
Cj4gT24gMjIvMDgvMjAxOSAxNzowNiwgSmFjayBNaXRjaGVsbCB3cm90ZToNCj4+IEknbSBoYXZp
bmcgaXNzdWVzIG9uIGEgRmlyZWZseSByazMyODggYm9hcmQgd2hlbiB0cnlpbmcgdG8gdXNlIFVT
Qg0KPj4gZ2FkZ2V0IGV0aGVybmV0IG9uIG1hY09TLiBUaGUgZHJfbW9kZSBpcyBzZXQgdG8gIm90
ZyIgYW5kIGl0IHdvcmtzIGZpbmUNCj4+IHdpdGggbXkgTGludXggZGVza3RvcC4NCj4+DQo+PiBJ
ZiBJIHNldCB0aGUgZHJfbW9kZSB0byAicGVyaXBoZXJhbCIgbWFjT1Mgd2lsbCB3b3JrLCBidXQg
c3RpbGwgdGFrZXMNCj4+IGFyb3VuZCAxMCBzZWNvbmRzIHRvIGVudW1lcmF0ZSB0aGUgZGV2aWNl
IHdoaWNoIG1ha2VzIG1lIHRoaW5rIGl0J3Mgb25seQ0KPj4ganVzdCB3b3JraW5nLiBIb3dldmVy
LCBJIG5lZWQgdGhlIHBvcnQgdG8gYmUgaW4gIm90ZyIgbW9kZSBhcyBpdCB3aWxsDQo+PiBzd2l0
Y2ggYmV0d2VlbiBwZXJpcGhlcmFsL2hvc3QgdXNlIGNhc2VzLg0KPj4NCj4+IEkndmUgYXR0YWNo
ZWQgYSBsb2cgZnJvbSB0aGUgZHdjMiBkcml2ZXIgZnJvbSBtYWlubGluZSBMaW51eCA1LjIgd2hl
bg0KPj4gYmVpbmcgcGx1Z2dlZCBpbnRvIHRoZSBtYWNPUyBkZXZpY2UgZm9yIDMwIHNlY29uZHMs
IHRoZW4gcmVtb3ZlZC4gVGhlDQo+PiBtYWMgaW4gdGhpcyBjYXNlIGlzIGEgMjAxMyBtYWNib29r
IHByby4gQW55IHBvaW50ZXJzIGluIHRoZSByaWdodA0KPj4gZGlyZWN0aW9uIHdvdWxkIGJlIGdy
ZWF0bHkgYXBwcmVjaWF0ZWQuDQo+Pg0KPj4gUmVnYXJkcywNCj4+IEphY2suDQo+Pg0KU29ycnks
IGZvciBsYXRlIHJlc3BvbnNlLg0KDQpDb3VsZCB5b3UgcGxlYXNlIGFwcGx5IHJlY2VudGx5IHN1
Ym1pdHRlZCBwYXRjaCAiW1BBVENIXSB1c2I6IGR3YzI6IEZpeCANClNFVC9DTEVBUl9GRUFUVVJF
IGFuZCBHRVRfU1RBVFVTIGZsb3dzIiBhbmQgdGVzdCBhZ2Fpbi4NCg0KPiANCj4gSSd2ZSBiZWVu
IHBva2luZyBhYm91dCB3aXRoIHRoaXMgc29tZSBtb3JlIGFuZCBJJ3ZlIG1hbmFnZWQgdG8gYmlz
ZWN0DQo+IHRoZSBpc3N1ZSBkb3duIHRvIHRoZSBmb2xsb3dpbmcgY29tbWl0DQo+IA0KPiA3Mjlj
YWM2OTNlZWNmZWJkYjllMTUyZWFkZGRkZDM1OGFlMmRlY2I3IHVzYjogZHdjMjogQ2hhbmdlIElT
T0MgRERNQSBmbG93DQo+IA0KPiBJZiBJIGJ1aWxkIGJlZm9yZSB0aGlzIGNvbW1pdCBldmVyeXRo
aW5nIHdvcmtzIGZpbmUgd2l0aCBhIGdfZXRoZXINCj4gZ2FkZ2V0IGRldmljZSBvbiBtYWMuIFVu
Zm9ydHVuYXRlbHkgaXQncyBhIHJhdGhlciBsYXJnZSBjaGFuZ2Ugd2hpY2ggSQ0KPiBjYW4ndCBq
dXN0IHJldmVydCBpbiBtYXN0ZXIgYXMgaXQncyBnb3QgbXVsdGlwbGUgZGVwZW5kYW50IGNvbW1p
dHMNCj4gbGF0ZXIuIFNvLCBhbnkgYWR2aWNlIG9uIHdoYXQgY291bGQgYmUgY2F1c2luZyB0aGlz
IG9yIGhvdyB0byBoZWxwIGRlYnVnDQo+IGl0IHdvdWxkIGJlIG11Y2ggYXBwcmVjaWF0ZWQsIGFz
IGF0IHRoZSBtb21lbnQgSSd2ZSBqdXN0IGZvcndhcmQgcG9ydGVkDQo+IHRoZSB3b3JraW5nIDQu
MTYgdmVyc2lvbiBvZiB0aGUgZHJpdmVyIG92ZXIgdGhlIDUuMy1yYzYgYnJva2VuIGRyaXZlcg0K
PiB3aGljaCBpc24ndCB2ZXJ5IHN1c3RhaW5hYmxlIGluIHRoZSBsb25nIHJ1bi4NCg0KSSBkb24n
dCB0aGluayB0aGF0IGlzc3VlIHJvb3QgY2F1c2UgY29taW5nIGZyb20gbWVudGlvbmVkIGJ5IHlv
dSBhYm92ZSANCnBhdGNoLiBCYXNlZCBvbiBsb2cgeW91IHByb3ZpZGVkLCBTRVRfRkVBVFVSRSBj
b250cm9sIHRyYW5zZmVyIG5vdCANCmNvbXBsZXRlZCBieSBnYWRnZXQgLSBaTFAgb24gc3RhdHVz
IHN0YWdlIG5vdCBzZW50IHRvIGhvc3QuDQoNCj4gDQo+IFJlZ2FyZHMsDQo+IEphY2suDQo+IA0K
