Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9DEA1DAAD5
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 08:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgETGlg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 02:41:36 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:50702 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726780AbgETGlf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 02:41:35 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A490FC00A5;
        Wed, 20 May 2020 06:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1589956894; bh=OFj16HeiPl7bmuX8pe6mOfwTsfxZPd2K01X7Fgf2Gxc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YLKoy1aDbr8y78hJe26gdZe0MNv4J1MjVO4o5YxkgWRz5gWIALkf9nF8bIvo3J741
         4tdWblJufzKJBsNRsavgxHAkwYrZmxYOTGFj9x6uno9XWUiul9tA6AuLNdTYTtF1+j
         +hd4U3NgMOPgDZ+9oCjrkHXZVCgo7/UC6/c+YpLZgbyOvb8KOfxdxhhL9S7mpuDyAP
         NzsU/7C7WTLbhPv7/v9SEpqz6mHNORHwFpAP9mj0HytQn8d+5M+1jlNYXc3zlTeAkv
         KzKB2cHF2IIc0qkCFopu9mgzMq0AuPVEjBSODK6OTNNCCNQkOvlnbvtA1vO2ZBY/J3
         xKCk6yLg9QILg==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 30DF8A0069;
        Wed, 20 May 2020 06:41:32 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 19 May 2020 23:41:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Tue, 19 May 2020 23:41:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMTt1ilNQLJTwvsLO9RdSKX57q4cDzo8V2F99W3XCOcq5eN9wCNVf4ruabIoHmRjWBSJjRk9tWRIZQeqqa/XfEUXNRsmRRbZLjDCiZia0YjZRYdhcsTBSCKXBoVbb32/VuOfluAMFYljfKasD12Q6g3cbHo2qHBY8v1t9C4WNiP5exFb8IyllYfsfxGwEdZT+O+PJylP6xy6MkaWunASp4uh/OKJgs0LCjoLC3pcy3oJJgbCmrI07jzVpsNDAT2e/xpJqTbNoKqVtyg+GsDca9jF0W6h1nCHkXdILfxMf38MxKokYVtoj+4kyTIBuZJTycuPK65FgwbIlC798rLXNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFj16HeiPl7bmuX8pe6mOfwTsfxZPd2K01X7Fgf2Gxc=;
 b=ClbiKpRGN8fuV69ndWtSfTAvPY1UeVWiqs56h5mwG3cLRuggyYN4U+Hw7kD2IXwOiMi+38ZL893Mhv4PkIbpti5QikQ+5FlO8H1XP+kiNDZKxWwu5FHse9HM0LhnnxZmKWunK58CbLTyklT/Ja+M0PrYT/nuxMz1rdDsGt/x3NPjjhut0kznmLwkxOE/XuaMdqp75tN9l0ojpmg8iNI8MDyU2hJl1hrSfVIpc3R/gnW25kExNm8rnqJ1J2tlGAdM2onaFjwMkVa86hElP3tvHwtkX9sGUcNsfilf02jrERpWhCE1V62jDKJZmDC/ehabmRv1WuBHdJdPWION1QGhfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFj16HeiPl7bmuX8pe6mOfwTsfxZPd2K01X7Fgf2Gxc=;
 b=QzrR00pd6tALfkjtO8bB530fGmZ2p1r72lLW9QWlm6OCJD4M8ph6LS8tsLx2b71N6yF5UHUOl4UytyBt74B4664k+aLexKjDUOIjKQGBF+GWNZA+vXfYJq9H28vE3KuI5niZIrmj8i7Mc3FvzuHs58nj0mFJZ5GoLpbHrdBflE0=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB3671.namprd12.prod.outlook.com (2603:10b6:610:23::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 06:41:16 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%4]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 06:41:16 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to consolidate
 SG
Thread-Topic: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Thread-Index: AQHWF8I9mzJAua+iDUCYnE0KWVGzAqiuMWMAgAKCaYA=
Date:   Wed, 20 May 2020 06:41:16 +0000
Message-ID: <6551a485-5478-ccac-ca1f-d3e2ec4c9053@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <969b5c9f31807635785ecc74b2ae2559ddc3bbeb.1587461220.git.joglekar@synopsys.com>
 <a1845154-2d8d-e63c-a3e7-7a3ed244bd57@linux.intel.com>
In-Reply-To: <a1845154-2d8d-e63c-a3e7-7a3ed244bd57@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.222.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2c5a5bd-3454-4cd5-38b9-08d7fc88cc27
x-ms-traffictypediagnostic: CH2PR12MB3671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB36710604EB45D6068846D558A4B60@CH2PR12MB3671.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vKL6OMPwoE+kQEedfZ6VbrOFpaEj3/lc7SaFzftiQDExIZpHnClNK7li6Ax+2xDuxUvD86AiTW8OM3zMrCzHoxvye515nZEayVzMu7Eo4NFDHp24gX/e0Mm4B20RkxTwH+58Tj41/78xr6VLmNpyJVY2kRUmfXZZPWFC7W1FKs+IKWb3uXQqhuqXAPIMaH0n0qMHgWdS0fu879nWIkW7Myv4bXdlpJgK7L661JjQ1ISEugo5pNkWJ06AvuGnLLBnqDgyTOjTHq03eJPmJC9IvpKElHtSMUkkg7qGD35lcopB9xp/8F3JT5K/4go38Yy/rvI++kASW2SVURmqGBSp+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(366004)(396003)(136003)(39850400004)(36756003)(316002)(66446008)(64756008)(66556008)(91956017)(66476007)(76116006)(186003)(2906002)(6512007)(6506007)(4326008)(53546011)(66946007)(110136005)(54906003)(31686004)(31696002)(5660300002)(71200400001)(8936002)(26005)(478600001)(6486002)(8676002)(86362001)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: iuWT/HY8GKv4ot+NTIRNwi1GWFbz6yqkJLPCSbwjXICeNu+kXQ/cE9uVQwDZ8kTlFQ9EiAN795G+GKD59Kkw0IaOf+j2knRlQ+IR6Ti/DmxHRd5B8bu23Jexbx1tmwLsm4Jkg+vqor4QmCPyPbAizn9g99DiF38KIDrkC3foGEIgMi7UPg5s7PwzdvrmDXKtvt0+fxR0SHi4FXbfsKyMcfoVM8q9kQ/mgIeC03i5mO89Raym7Hi2Bf8OEZ9vEavx4zWEVtZGFawTjvxfXenIGThqR93Gg5ObNoKfFQCAvMc9WuHzbXqi0N2FT+ciKLSI9MF/foMO4bWmdD6zddvMml22RnUwqE/dPcNsydxoSCsfmHdNnRGMv3y4t8+FKG1dNDl22zEZJJaZCE1+cwygfgyq7ADI/vMM8mbeHurzSzBJWtPuLet10YBWgeeZkXhUeCOFWxY3Xvk51Q+npCJFxqp7/AJHsNu/FArVoTiekmk/ewGrbH+s7xyHv8+F/U9u
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A626E3BB8DB494F9A58E8A0F7CDCD62@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c5a5bd-3454-4cd5-38b9-08d7fc88cc27
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 06:41:16.6630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5m62v5+EthqiCf2PCdQXmN5LfZ/DyyaXXmcXZ1INOvk3aj959hDKFd23efyQOT52gXQiMfiZC7Ny2PtNAqk0Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3671
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiA1LzE4LzIwMjAgOTo1MSBQTSwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4gT24gMjEu
NC4yMDIwIDEyLjQ5LCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+IFRoZSBTeW5vcHN5cyB4SEMg
aGFzIGFuIGludGVybmFsIFRSQiBjYWNoZSBvZiBzaXplIFRSQl9DQUNIRV9TSVpFIGZvcg0KPj4g
ZWFjaCBlbmRwb2ludC4gVGhlIGRlZmF1bHQgdmFsdWUgZm9yIFRSQl9DQUNIRV9TSVpFIGlzIDE2
IGZvciBTUyBhbmQgOA0KPj4gZm9yIEhTLiBUaGUgY29udHJvbGxlciBsb2FkcyBhbmQgdXBkYXRl
cyB0aGUgVFJCIGNhY2hlIGZyb20gdGhlIHRyYW5zZmVyDQo+PiByaW5nIGluIHN5c3RlbSBtZW1v
cnkgd2hlbmV2ZXIgdGhlIGRyaXZlciBpc3N1ZXMgYSBzdGFydCB0cmFuc2ZlciBvcg0KPj4gdXBk
YXRlIHRyYW5zZmVyIGNvbW1hbmQuDQo+Pg0KPj4gRm9yIGNoYWluZWQgVFJCcywgdGhlIFN5bm9w
c3lzIHhIQyByZXF1aXJlcyB0aGF0IHRoZSB0b3RhbCBhbW91bnQgb2YNCj4+IGJ5dGVzIGZvciBh
bGwgVFJCcyBsb2FkZWQgaW4gdGhlIFRSQiBjYWNoZSBiZSBncmVhdGVyIHRoYW4gb3IgZXF1YWwg
dG8gMQ0KPj4gTVBTLiBPciB0aGUgY2hhaW4gZW5kcyB3aXRoaW4gdGhlIFRSQiBjYWNoZSAod2l0
aCBhIGxhc3QgVFJCKS4NCj4+DQo+PiBJZiB0aGlzIHJlcXVpcmVtZW50IGlzIG5vdCBtZXQsIHRo
ZSBjb250cm9sbGVyIHdpbGwgbm90IGJlIGFibGUgdG8gc2VuZA0KPj4gb3IgcmVjZWl2ZSBhIHBh
Y2tldCBhbmQgaXQgd2lsbCBoYW5nIGNhdXNpbmcgYSBkcml2ZXIgdGltZW91dCBhbmQgZXJyb3Iu
DQo+Pg0KPj4gVGhpcyBjYW4gYmUgYSBwcm9ibGVtIGlmIGEgY2xhc3MgZHJpdmVyIHF1ZXVlcyBT
RyByZXF1ZXN0cyB3aXRoIG1hbnkNCj4+IHNtYWxsLWJ1ZmZlciBlbnRyaWVzLiBUaGUgWEhDSSBk
cml2ZXIgd2lsbCBjcmVhdGUgYSBjaGFpbmVkIFRSQiBmb3IgZWFjaA0KPj4gZW50cnkgd2hpY2gg
bWF5IHRyaWdnZXIgdGhpcyBpc3N1ZS4NCj4+DQo+PiBUaGlzIHBhdGNoIGFkZHMgbG9naWMgdG8g
dGhlIFhIQ0kgZHJpdmVyIHRvIGRldGVjdCBhbmQgcHJldmVudCB0aGlzIGZyb20NCj4+IGhhcHBl
bmluZy4NCj4+DQo+PiBGb3IgZXZlcnkgKFRSQl9DQUNIRV9TSVpFIC0gMiksIHdlIGNoZWNrIHRo
ZSB0b3RhbCBidWZmZXIgc2l6ZSBvZg0KPj4gdGhlIFNHIGxpc3QgYW5kIGlmIHRoZSBsYXN0IHdp
bmRvdyBvZiAoVFJCX0NBQ0hFX1NJWkUgLSAyKSBTRyBsaXN0IGxlbmd0aA0KPj4gYW5kIHdlIGRv
bid0IG1ha2UgdXAgYXQgbGVhc3QgMSBNUFMsIHdlIGNyZWF0ZSBhIHRlbXBvcmFyeSBidWZmZXIg
dG8NCj4+IGNvbnNvbGlkYXRlIGZ1bGwgU0cgbGlzdCBpbnRvIHRoZSBidWZmZXIuDQo+Pg0KPj4g
V2UgY2hlY2sgYXQgKFRSQl9DQUNIRV9TSVpFIC0gMikgd2luZG93IGJlY2F1c2UgaXQgaXMgcG9z
c2libGUgdGhhdCB0aGVyZQ0KPj4gd291bGQgYmUgYSBsaW5rIGFuZC9vciBldmVudCBkYXRhIFRS
QiB0aGF0IHRha2UgdXAgdG8gMiBvZiB0aGUgY2FjaGUNCj4+IGVudHJpZXMuDQo+Pg0KPj4gV2Ug
ZGlzY292ZXJlZCB0aGlzIGlzc3VlIHdpdGggZGV2aWNlcyBvbiBvdGhlciBwbGF0Zm9ybXMgYnV0
IGhhdmUgbm90DQo+PiB5ZXQgY29tZSBhY3Jvc3MgYW55IGRldmljZSB0aGF0IHRyaWdnZXJzIHRo
aXMgb24gTGludXguIEJ1dCBpdCBjb3VsZCBiZQ0KPj4gYSByZWFsIHByb2JsZW0gbm93IG9yIGlu
IHRoZSBmdXR1cmUuIEFsbCBpdCB0YWtlcyBpcyBOIG51bWJlciBvZiBzbWFsbA0KPj4gY2hhaW5l
ZCBUUkJzLiBBbmQgb3RoZXIgaW5zdGFuY2VzIG9mIHRoZSBTeW5vcHN5cyBJUCBtYXkgaGF2ZSBz
bWFsbGVyDQo+PiB2YWx1ZXMgZm9yIHRoZSBUUkJfQ0FDSEVfU0laRSB3aGljaCB3b3VsZCBleGFj
ZXJiYXRlIHRoZSBwcm9ibGVtLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRlamFzIEpvZ2xla2Fy
IDxqb2dsZWthckBzeW5vcHN5cy5jb20+DQo+PiAtLS0NCj4+ICBDaGFuZ2VzIGluIHYyOg0KPj4g
IC0gUmVtb3ZlZCByZWR1bmRhbnQgZGVidWcgbWVzc2FnZXMNCj4+ICAtIE1vZGlmaWVkIGxvZ2lj
IHRvIHJlbW92ZSB1bm5lY2Vzc2FyeSBjaGFuZ2VzIGluIGhjZC5jDQo+PiAgLSBSZW5hbWUgdGhl
IHF1aXJrDQo+Pg0KPj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1yaW5nLmMgfCAgIDIgKy0NCj4+
ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuYyAgICAgIHwgMTI1ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kuaCAgICAg
IHwgICA0ICsrDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMzAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5j
IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXJpbmcuYw0KPj4gaW5kZXggYTc4Nzg3YmI1MTMzLi4y
ZmFkOTQ3NDkxMmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5j
DQo+PiArKysgYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcmluZy5jDQo+PiBAQCAtMzI5MSw3ICsz
MjkxLDcgQEAgaW50IHhoY2lfcXVldWVfYnVsa190eChzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksIGdm
cF90IG1lbV9mbGFncywNCj4+ICANCj4+ICAJZnVsbF9sZW4gPSB1cmItPnRyYW5zZmVyX2J1ZmZl
cl9sZW5ndGg7DQo+PiAgCS8qIElmIHdlIGhhdmUgc2NhdHRlci9nYXRoZXIgbGlzdCwgd2UgdXNl
IGl0LiAqLw0KPj4gLQlpZiAodXJiLT5udW1fc2dzKSB7DQo+PiArCWlmICh1cmItPm51bV9zZ3Mg
JiYgISh1cmItPnRyYW5zZmVyX2ZsYWdzICYgVVJCX0RNQV9NQVBfU0lOR0xFKSkgew0KPj4gIAkJ
bnVtX3NncyA9IHVyYi0+bnVtX21hcHBlZF9zZ3M7DQo+PiAgCQlzZyA9IHVyYi0+c2c7DQo+PiAg
CQlhZGRyID0gKHU2NCkgc2dfZG1hX2FkZHJlc3Moc2cpOw0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdXNiL2hvc3QveGhjaS5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmMNCj4+IGluZGV4IGZl
MzgyNzUzNjNlMC4uMTVmMDZiYzZiMWFkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLmMNCj4+ICsrKyBiL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+PiBAQCAtMTI1Niw2
ICsxMjU2LDEwNiBAQCBFWFBPUlRfU1lNQk9MX0dQTCh4aGNpX3Jlc3VtZSk7DQo+PiAgDQo+PiAg
LyotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tKi8NCj4+ICANCj4+ICtzdGF0aWMgaW50IHhoY2lfbWFwX3RlbXBf
YnVmZmVyKHN0cnVjdCB1c2JfaGNkICpoY2QsIHN0cnVjdCB1cmIgKnVyYikNCj4+ICt7DQo+PiAr
CXZvaWQgKnRlbXA7DQo+PiArCWludCByZXQgPSAwOw0KPj4gKwl1bnNpZ25lZCBpbnQgbGVuOw0K
Pj4gKwl1bnNpZ25lZCBpbnQgYnVmX2xlbjsNCj4+ICsJZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24g
ZGlyOw0KPj4gKwlzdHJ1Y3QgeGhjaV9oY2QgKnhoY2k7DQo+PiArDQo+PiArCXhoY2kgPSBoY2Rf
dG9feGhjaShoY2QpOw0KPj4gKwlkaXIgPSB1c2JfdXJiX2Rpcl9pbih1cmIpID8gRE1BX0ZST01f
REVWSUNFIDogRE1BX1RPX0RFVklDRTsNCj4+ICsJYnVmX2xlbiA9IHVyYi0+dHJhbnNmZXJfYnVm
ZmVyX2xlbmd0aDsNCj4+ICsNCj4+ICsJdGVtcCA9IGt6YWxsb2Nfbm9kZShidWZfbGVuLCBHRlBf
QVRPTUlDLA0KPj4gKwkJCSAgICBkZXZfdG9fbm9kZShoY2QtPnNlbGYuc3lzZGV2KSk7DQo+PiAr
DQo+PiArCWlmICh1c2JfdXJiX2Rpcl9vdXQodXJiKSkNCj4+ICsJCWxlbiA9IHNnX3Bjb3B5X3Rv
X2J1ZmZlcih1cmItPnNnLCB1cmItPm51bV9zZ3MsDQo+PiArCQkJCQkgdGVtcCwgYnVmX2xlbiwg
MCk7DQo+PiArDQo+PiArCXVyYi0+dHJhbnNmZXJfYnVmZmVyID0gdGVtcDsNCj4+ICsJdXJiLT50
cmFuc2Zlcl9kbWEgPSBkbWFfbWFwX3NpbmdsZShoY2QtPnNlbGYuc3lzZGV2LA0KPj4gKwkJCQkJ
ICAgdXJiLT50cmFuc2Zlcl9idWZmZXIsDQo+PiArCQkJCQkgICB1cmItPnRyYW5zZmVyX2J1ZmZl
cl9sZW5ndGgsDQo+PiArCQkJCQkgICBkaXIpOw0KPj4gKw0KPj4gKwlpZiAoZG1hX21hcHBpbmdf
ZXJyb3IoaGNkLT5zZWxmLnN5c2RldiwNCj4+ICsJCQkgICAgICB1cmItPnRyYW5zZmVyX2RtYSkp
IHsNCj4+ICsJCXJldCA9IC1FQUdBSU47DQo+PiArCQlrZnJlZSh0ZW1wKTsNCj4+ICsJfSBlbHNl
IHsNCj4+ICsJCXVyYi0+dHJhbnNmZXJfZmxhZ3MgfD0gVVJCX0RNQV9NQVBfU0lOR0xFOw0KPiAN
Cj4gTm90IHN1cmUgaWYgdXNpbmcgVVJCX0RNQV9NQVBfU0lOR0xFIHRvIGZsYWcgdGhhdCB0aGlz
IHVyYiBpcyBib3VjZWJ1ZmZlcmVkIGlzDQo+IGFwcHJvcHJpYXRlLg0KPiANCj4gSWYgR3JlZyBv
ciBBbGFuIGRvbid0IG9iamVjdCB0aGVuIGl0J3MgZmluZSBmb3IgbWUgYXMgd2VsbC4NCj4gDQo+
IA0KPiANCkBHcmVnL0FsYW4gZG8geW91IHN1Z2dlc3QgYW55IGNoYW5nZSBmb3IgdGhlIGZsYWcg
aGVyZT8NCj4+ICsJfQ0KPj4gKw0KPj4gKwlyZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+ICtz
dGF0aWMgYm9vbCB4aGNpX3VyYl90ZW1wX2J1ZmZlcl9yZXF1aXJlZChzdHJ1Y3QgdXNiX2hjZCAq
aGNkLA0KPj4gKwkJCQkJICBzdHJ1Y3QgdXJiICp1cmIpDQo+PiArew0KPj4gKwlib29sIHJldCA9
IGZhbHNlOw0KPj4gKwl1bnNpZ25lZCBpbnQgaTsNCj4+ICsJdW5zaWduZWQgaW50IGxlbiA9IDA7
DQo+PiArCXVuc2lnbmVkIGludCBidWZfbGVuOw0KPj4gKwl1bnNpZ25lZCBpbnQgdHJiX3NpemU7
DQo+PiArCXVuc2lnbmVkIGludCBtYXhfcGt0Ow0KPj4gKwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNn
Ow0KPj4gKwlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnRhaWxfc2c7DQo+PiArDQo+PiArCXNnID0gdXJi
LT5zZzsNCj4+ICsJdGFpbF9zZyA9IHVyYi0+c2c7DQo+PiArCWJ1Zl9sZW4gPSB1cmItPnRyYW5z
ZmVyX2J1ZmZlcl9sZW5ndGg7DQo+PiArCW1heF9wa3QgPSB1c2JfZW5kcG9pbnRfbWF4cCgmdXJi
LT5lcC0+ZGVzYyk7DQo+PiArDQo+PiArCWlmICghdXJiLT5udW1fc2dzKQ0KPj4gKwkJcmV0dXJu
IHJldDsNCj4+ICsNCj4+ICsJaWYgKHVyYi0+ZGV2LT5zcGVlZCA+PSBVU0JfU1BFRURfU1VQRVIp
DQo+PiArCQl0cmJfc2l6ZSA9IFRSQl9DQUNIRV9TSVpFX1NTOw0KPj4gKwllbHNlDQo+PiArCQl0
cmJfc2l6ZSA9IFRSQl9DQUNIRV9TSVpFX0hTOw0KPj4gKw0KPj4gKwlpZiAodXJiLT50cmFuc2Zl
cl9idWZmZXJfbGVuZ3RoICE9IDAgJiYNCj4+ICsJICAgICEodXJiLT50cmFuc2Zlcl9mbGFncyAm
IFVSQl9OT19UUkFOU0ZFUl9ETUFfTUFQKSkgew0KPj4gKwkJZm9yX2VhY2hfc2codXJiLT5zZywg
c2csIHVyYi0+bnVtX3NncywgaSkgew0KPj4gKwkJCWxlbiA9IGxlbiArIHNnLT5sZW5ndGg7DQo+
PiArCQkJaWYgKGkgPiB0cmJfc2l6ZSAtIDIpIHsNCj4+ICsJCQkJbGVuID0gbGVuIC0gdGFpbF9z
Zy0+bGVuZ3RoOw0KPj4gKwkJCQlpZiAobGVuIDwgbWF4X3BrdCkgew0KPj4gKwkJCQkJcmV0ID0g
dHJ1ZTsNCj4+ICsJCQkJCWJyZWFrOw0KPj4gKwkJCQl9DQo+PiArDQo+PiArCQkJCXRhaWxfc2cg
PSBzZ19uZXh0KHRhaWxfc2cpOw0KPj4gKwkJCX0NCj4+ICsJCX0NCj4+ICsJfQ0KPj4gKwlyZXR1
cm4gcmV0Ow0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB4aGNpX3VubWFwX3RlbXBfYnVm
KHN0cnVjdCB1cmIgKnVyYikNCj4+ICt7DQo+PiArCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7DQo+
PiArCXVuc2lnbmVkIGludCBsZW47DQo+PiArCXVuc2lnbmVkIGludCBidWZfbGVuOw0KPj4gKw0K
Pj4gKwlzZyA9IHVyYi0+c2c7DQo+PiArCWJ1Zl9sZW4gPSB1cmItPnRyYW5zZmVyX2J1ZmZlcl9s
ZW5ndGg7DQo+PiArDQo+PiArCWlmICh1c2JfdXJiX2Rpcl9pbih1cmIpKSB7DQo+PiArCQlsZW4g
PSBzZ19wY29weV9mcm9tX2J1ZmZlcih1cmItPnNnLCB1cmItPm51bV9zZ3MsDQo+PiArCQkJCQkg
ICB1cmItPnRyYW5zZmVyX2J1ZmZlciwNCj4+ICsJCQkJCSAgIGJ1Zl9sZW4sDQo+PiArCQkJCQkg
ICAwKTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlrZnJlZSh1cmItPnRyYW5zZmVyX2J1ZmZlcik7DQo+
PiArCXVyYi0+dHJhbnNmZXJfYnVmZmVyID0gTlVMTDsNCj4gDQo+IGNsZWFyIFVSQl9ETUFfTUFQ
X1NJTkdMRSBmcm9tIHVyYi0+dHJhbnNmZXJfZmxhZ3M/DQo+DQpJbiBjdXJyZW50IGltcGxtZW50
YXRpb24gdGhlIGRtYV91bm1hcCBpcyBkb25lIHdpdGggZXhpc3RpbmcgDQpmdW5jdGlvbiB1c2Jf
aGNkX3VubWFwX3VyYl9mb3JfZG1hKCkgYW5kIHRoZW4gYnVmZmVyIGlzIGNvcGllZA0KaW4gdGhl
IHhoY2lfdW5tYXBfdGVtcF9idWYoKSwgc28gVVJCX0RNQV9NQVBfU0lOR0xFIGZsYWcgZ2V0cw0K
Y2xlYXJlZCB3aXRoIHVzYl9oY2RfdW5tYXBfdXJiX2Zvcl9kbWEoKS4NCkkgdGhpbmsgaW4gbmV4
dCBwYXRjaCBzZXQgSSB3aWxsIGFkZCBsb2dpYyBmb3IgZG1hX3VubWFwIA0KaW4geGhjaV91bm1h
cF90ZW1wX2J1ZigpIGZ1bmN0aW9uLiAgDQoNCiANCj4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGdv
b2QgZG8gbWUuDQo+IC1NYXRoaWFzDQo+IA0KDQpUaGFua3MgJiBSZWdhcmRzLA0KIFRlamFzIEpv
Z2xla2FyDQo=
