Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D01822A990F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 17:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgKFQHD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Nov 2020 11:07:03 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38810 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725868AbgKFQHC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Nov 2020 11:07:02 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 571404033B;
        Fri,  6 Nov 2020 16:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1604678822; bh=GPkJjRhrsjbJYWG5nIkUfQfNMae4GBvAVL/DuJLePfA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=ODA3OaRcPstJLeueu0lSFSPCh/KonA/rjwSjD0qbsDnOVoc7ctmTi9tpaJdLiPd2r
         imnGHd7lvFjjbikGMc1jtIaB/5W7NGybueNp5j+gcXutGKYFPKlMR4VNFnKRB9ONKa
         H6swo+k4E9lr0ktfW4BwGLWbZEF2xnj1RcI4crVYZJq00TQpUJEAZ9QjNFR4UhQQ+1
         IjZp4Bhjb2+PxoQYkjh1sZT2fPxGTbNWWnnlWKyLyu5sYkFKZxIJHmmL72IW0NHb3C
         8IwZQDr16SVieLUDLU1X5y0K1CsopNZtcDK252tZb3vqDPE7YpbQxIjxlBMaZISUKm
         TvqUkEmnctsSg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 26C77A0069;
        Fri,  6 Nov 2020 16:07:01 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A6D7B80233;
        Fri,  6 Nov 2020 16:07:00 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="cMS3ACwt";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl3TT5L9v0PDv7ev/wDegZwW0O/jDawVD6VZnbfcH0a5IjSloNEcPx9SnP4LCWlqsZ/cj9z90AV+un5ocm4lusTFT3rWzx8v3ttiau9gogrtR5rGFV1u5gI/uKQ1V62q3hI8yd8/OHt4yVXXPUOCF1wHVvVW8fVxfKeCJICs9122syDXx82dDqEkewZjL/YfEm+sj2AfZbH+g/0IdBYpbKcmRELgXrcenzDs6fAcy5AOGJSrtEuyqSCkYTDkjgG28WiErHH0P0NzABaMMrkeRebWvdXInr9RfGIXU++WrchobjDo/Q49m5WSGVyaJW+EL/0ABV9pkusyiwL9zHt6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkJjRhrsjbJYWG5nIkUfQfNMae4GBvAVL/DuJLePfA=;
 b=gu7OQMjMCM3woiSkanzSaW5ODK5lTMcX9hLDimohWAVoCF2kjjiNrhtNmTgi1PBmzloUnJsqYLU077l0+/BRlKTQjC2nSIECDuZSY7bo+JvrgYtEuFL7n+RTRl95djzA1VgGHMDzi4joLpIs2LPQTXX6FaXT/gvCQAquiLPx4QMKK9G+eKqsEh4c7Y7VY3P+YGPm8zSMtFBS9BLqOKwzgicUaClzjaL6Sjrn55M70Rr/0KbGtkVLkNP/3Gi5c3kGPZSQmKwiQGqEyMEyKmz3hfwyuWhZ3CljyzaNNO3NCS/do2UHzosv/yq06sKDuwNDnsxIAzD9v6+FuN+KosCyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPkJjRhrsjbJYWG5nIkUfQfNMae4GBvAVL/DuJLePfA=;
 b=cMS3ACwtGFe4YMxqqSxJzU1WFX37AYoOirWhWnI06BVkezTqwmWub+frq6ZO4b2OvUyB0gK7kRz0X2/Dz4Ycj4G+EQ0BBPmrVWfsiPmFH0vWYqXBHXVmJjIo85ipOe3MEen9xAcoXhoSTf0uYrNc8Zhg2dtakpUuJyXLYYTv/Pc=
Received: from MN2PR12MB3549.namprd12.prod.outlook.com (2603:10b6:208:107::17)
 by MN2PR12MB3022.namprd12.prod.outlook.com (2603:10b6:208:ce::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 6 Nov
 2020 16:06:57 +0000
Received: from MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::e1cf:a11d:fbda:9d3]) by MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::e1cf:a11d:fbda:9d3%5]) with mapi id 15.20.3499.032; Fri, 6 Nov 2020
 16:06:57 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWo7zmdDYgLgZVXkaCKqwDDPH0oqmr1n8AgAFTDQCAAAqzAIAOMfkA
Date:   Fri, 6 Nov 2020 16:06:57 +0000
Message-ID: <9e03c829-4ead-b35f-da28-6cd4906ac2cb@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
 <aa3865cf-1cbd-5d3d-8808-f89d6e0c044e@synopsys.com>
 <09737ac8-66a0-564c-2f1c-60a92ec716b5@linux.intel.com>
 <d84e4b5c-0d7a-50e2-25a1-5be1da9ca72a@synopsys.com>
In-Reply-To: <d84e4b5c-0d7a-50e2-25a1-5be1da9ca72a@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.220.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 129f1c17-cf2c-43ad-7865-08d8826dfcc0
x-ms-traffictypediagnostic: MN2PR12MB3022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3022277F7F3B7D305FD89865A4ED0@MN2PR12MB3022.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ne4kNhZbKZ/A6YsyVu5C5JNtTezSFrLQ9xcaCN1Z5tF1hUI+zybmWMs9L2WJybylq3HaqndUMfZ1/Ph9R4dhmJ8UTksSSOgZbzkriSLPxw9bj1Y+KODBfQTDZh2wHWGdRFHGcEkA+5FN43wMyRAeyn8xpr0BdPmGHSXAYNZcj9FrGHTTt4z+9DblEohzBEWsCyxLizu615g1jqaDTEtoM6Dnjf8q/dmRLORbPdTK92Nh5+tiOiebJx0EsTTFdPzrcNyp3ac5EhZ+TwxrYLgPtDha7I/sEWYH0cc8ULAJ0tqyJRff7wa9fFjSRNFGqN3d
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3549.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(366004)(376002)(6506007)(83380400001)(66446008)(55236004)(64756008)(6486002)(6916009)(66556008)(71200400001)(31696002)(76116006)(316002)(26005)(91956017)(6512007)(66946007)(86362001)(66476007)(2616005)(4326008)(5660300002)(31686004)(54906003)(186003)(8936002)(8676002)(478600001)(2906002)(36756003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: LhNhAPt9XE12hh7ri78nrKOYckAVUEeQRWCtaw+a77H5CGlkpSS5hXAMOt3ruKXZFgyaucVBtec5HaNA5fNdFS9vXy8ds9y9fiRMOtNBioRPh2EKgLcKfufkHqoEd819i48eICXJs9K6DWfGLKyZx0AwgktlrqeJTDPRLLpXlN44coWhBG7GtaxnHnlTjDNQO1zKBBFS4eGW+lVt6kavyfGH5muKpXOXmDUd3/OacssTnVGKmbTIbaLD9IXUBpr5A5XVUfI3BejScN05m7VmPRL9MkeGYS/nV2z4LoTBYaArOOTea/dCWpvkR/OPGSH9RJxSM0MOjRg+mJkDtzZzpV10ZbSIW3W/5jTELtd4w6XC3J31CIsvIyAkazAqq3XVMVx+MSnJdxJIeaE4GEmKN0qEdcwZ9lBzgr1kTn6hOY/UA7eNrQQmmHrTT1+GvcKxjRpWtwM3jSxCDqr6FZE4U+rTUxy83eDacxGwz8OrygF1rUDsfQf0BD16U8RsN/gf0/cjtL9JQSmbwNJslD/hiLgfhA1DuhCPSFD3/NJFk/e6qvYMt4Db3DRDFpTURaHlgu2sxuqMe2jus7vtL6No44tWr7pOJX5O12VIvebkwV4b0om136u06//dp5FLbKNy72kL6HuV+VgHWW1p8BEnsg==
Content-Type: text/plain; charset="utf-8"
Content-ID: <79AE4E578CB1664E90FD009BAC4EBAAC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129f1c17-cf2c-43ad-7865-08d8826dfcc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2020 16:06:57.5334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pkHFfWKSY+bJxcOhi67VZzz61cFAxfjXxPxuVjb4Xk153oOCy5zJlRj/Yzb1Xmt0R9cCdHWRHAK5xmzBEPBf4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3022
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KT24gMTAvMjgvMjAyMCA4OjUwIFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToN
Cj4gSGksDQo+IE9uIDEwLzI4LzIwMjAgODoxMiBQTSwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4+
IE9uIDI3LjEwLjIwMjAgMjAuMjgsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4+IEhpIE1hdGhp
YXMsDQo+Pj4gT24gMTAvMTYvMjAyMCA2OjM0IFBNLCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+
Pj4gVGhlIFN5bm9wc3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9mIHNpemUgVFJC
X0NBQ0hFX1NJWkUgZm9yDQo+Pj4+IGVhY2ggZW5kcG9pbnQuIFRoZSBkZWZhdWx0IHZhbHVlIGZv
ciBUUkJfQ0FDSEVfU0laRSBpcyAxNiBmb3IgU1MgYW5kIDgNCj4+Pj4gZm9yIEhTLiBUaGUgY29u
dHJvbGxlciBsb2FkcyBhbmQgdXBkYXRlcyB0aGUgVFJCIGNhY2hlIGZyb20gdGhlDQo+Pj4+IHRy
YW5zZmVyIHJpbmcgaW4gc3lzdGVtIG1lbW9yeSB3aGVuZXZlciB0aGUgZHJpdmVyIGlzc3VlcyBh
IHN0YXJ0DQo+Pj4+IHRyYW5zZmVyIG9yIHVwZGF0ZSB0cmFuc2ZlciBjb21tYW5kLg0KPj4+Pg0K
Pj4+PiBGb3IgY2hhaW5lZCBUUkJzLCB0aGUgU3lub3BzeXMgeEhDIHJlcXVpcmVzIHRoYXQgdGhl
IHRvdGFsIGFtb3VudCBvZg0KPj4+PiBieXRlcyBmb3IgYWxsIFRSQnMgbG9hZGVkIGluIHRoZSBU
UkIgY2FjaGUgYmUgZ3JlYXRlciB0aGFuIG9yIGVxdWFsIHRvDQo+Pj4+IDEgTVBTLiBPciB0aGUg
Y2hhaW4gZW5kcyB3aXRoaW4gdGhlIFRSQiBjYWNoZSAod2l0aCBhIGxhc3QgVFJCKS4NCj4+Pj4N
Cj4+Pj4gSWYgdGhpcyByZXF1aXJlbWVudCBpcyBub3QgbWV0LCB0aGUgY29udHJvbGxlciB3aWxs
IG5vdCBiZSBhYmxlIHRvDQo+Pj4+IHNlbmQgb3IgcmVjZWl2ZSBhIHBhY2tldCBhbmQgaXQgd2ls
bCBoYW5nIGNhdXNpbmcgYSBkcml2ZXIgdGltZW91dCBhbmQNCj4+Pj4gZXJyb3IuDQo+Pj4+DQo+
Pj4+IFRoaXMgcGF0Y2ggc2V0IGFkZHMgbG9naWMgdG8gdGhlIFhIQ0kgZHJpdmVyIHRvIGRldGVj
dCBhbmQgcHJldmVudCB0aGlzDQo+Pj4+IGZyb20gaGFwcGVuaW5nIGFsb25nIHdpdGggdGhlIHF1
aXJrIHRvIGVuYWJsZSB0aGlzIGxvZ2ljIGZvciBTeW5vcHN5cw0KPj4+PiBIQVBTIHBsYXRmb3Jt
Lg0KPj4+Pg0KPj4+PiBCYXNlZCBvbiBNYXRoaWFzJ3MgZmVlZGJhY2sgb24gcHJldmlvdXMgaW1w
bGVtZW50YXRpb24gd2hlcmUgY29uc29saWRhdGlvbg0KPj4+PiB3YXMgZG9uZSBpbiBUUkIgY2Fj
aGUsIHdpdGggdGhpcyBwYXRjaCBzZXJpZXMgdGhlIGltcGxlbWVudGF0aW9uIGlzIGRvbmUNCj4+
Pj4gZHVyaW5nIG1hcHBpbmcgb2YgdGhlIFVSQiBieSBjb25zb2xpZGF0aW5nIHRoZSBTRyBsaXN0
IGludG8gYSB0ZW1wb3JhcnkNCj4+Pj4gYnVmZmVyIGlmIHRoZSBTRyBsaXN0IGJ1ZmZlciBzaXpl
cyB3aXRoaW4gVFJCX0NBQ0hFX1NJWkUgaXMgbGVzcyB0aGFuIE1QUy4NCj4+Pj4NCj4+Pj4gQ2hh
bmdlcyBzaW5jZSB2NDoNCj4+Pj4gIC0gVXBkYXRlZCBbUGF0Y2ggMy8zXSBwbGF0Zm9ybSBkYXRh
IHN0cnVjdHVyZSBpbml0aWFsaXphdGlvbg0KPj4+PiAgLSBUcml2aWFsIGNoYW5nZXMgaW4gY29t
bWl0IHdvcmRpbmdzDQo+Pj4+DQo+Pj4+IENoYW5nZXMgc2luY2UgdjM6DQo+Pj4+ICAtIFJlbW92
ZWQgdGhlIGR0LWJpbmRpbmcgcGF0Y2gNCj4+Pj4gIC0gQWRkZWQgbmV3IHBhdGNoIHRvIHBhc3Mg
dGhlIHF1aXJrIGFzIHBsYXRmb3JtIGRhdGENCj4+Pj4gIC0gTW9kaWZpZWQgdGhlIHBhdGNoIHRv
IHNldCB0aGUgcXVpcmsNCj4+Pj4NCj4+Pj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4+Pj4gIC0gTW9k
aWZpZWQgdGhlIHhoY2lfdW5tYXBfdGVtcF9idWZmZXIgZnVuY3Rpb24gdG8gdW5tYXAgZG1hIGFu
ZCBjDQo+Pj4+ICAgIHRoZSBkbWEgZmxhZw0KPj4+PiAgLSBSZW1vdmVkIFJGQyB0YWcNCj4+Pj4N
Cj4+Pj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4+Pj4gIC0gQ29tbWVudHMgZnJvbSBHcmVnIGFyZSBh
ZGRyZXNzZWQgb24gW1BBVENIIDQvNF0gYW5kIFtQQVRDSCAxLzRdDQo+Pj4+ICAtIFJlbmFtZWQg
dGhlIHByb3BlcnR5IGFuZCBxdWlyayBhcyBpbiBvdGhlciBwYXRjaGVzIGJhc2VkIG9uIFtQQVRD
SCAxLzRdDQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+IFRlamFzIEpvZ2xla2FyICgzKToNCj4+Pj4g
ICB1c2I6IHhoY2k6IFNldCBxdWlyayBmb3IgWEhDSV9TR19UUkJfQ0FDSEVfU0laRV9RVUlSSw0K
Pj4+PiAgIHVzYjogeGhjaTogVXNlIHRlbXBvcmFyeSBidWZmZXIgdG8gY29uc29saWRhdGUgU0cN
Cj4+Pj4gICB1c2I6IGR3YzM6IFBhc3MgcXVpcmsgYXMgcGxhdGZvcm0gZGF0YQ0KPj4+Pg0KPj4+
PiAgZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgICAgICB8ICAxMCArKysNCj4+Pj4gIGRyaXZlcnMv
dXNiL2hvc3QveGhjaS1wbGF0LmMgfCAgIDMgKw0KPj4+PiAgZHJpdmVycy91c2IvaG9zdC94aGNp
LXJpbmcuYyB8ICAgMiArLQ0KPj4+PiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmMgICAgICB8IDEz
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4+PiAgZHJpdmVycy91c2Iv
aG9zdC94aGNpLmggICAgICB8ICAgNSArKw0KPj4+PiAgNSBmaWxlcyBjaGFuZ2VkLCAxNTUgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pg0KPj4+IEkgaGF2ZSByZW1vdmVk
IHRoZSBkZXBlbmRlbmN5IG9uIHNldHRpbmcgcXVpcmsgdGhyb3VnaCBkZXZpY2UgdHJlZSBiaW5k
aW5nDQo+Pj4gYW5kIGFkZGVkIHRoZSBxdWlyayB1c2luZyBwbGF0Zm9ybSBkYXRhLiBDYW4geW91
IHBsZWFzZSByZXZpZXcgYW5kIGlmIA0KPj4+IGV2ZXJ5dGhpbmcgbG9va3MgT0ssIGNhbiB5b3Ug
cGxlYXNlIGFkZCB0aGlzIHBhdGNoIHNlcmllcyB0byB5b3VyIHRyZWU/DQo+Pg0KPj4gU3VyZSwg
dGhlcmUgYXJlbid0IGFueSBmdW5jdGlvbmFsIGNoYW5nZXMgdG8geGhjaSBzaW5jZSB2MyBvZiB0
aGlzIHNlcmllcyByaWdodD8NCj4+IEFuZCBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseSBGZWxpcGUg
ZGlkbid0IGhhdmUgYW55IG9iamVjdGlvbnMgdG8gdGhlIGR3YzMgcGFydCBlaXRoZXIuDQo+Pg0K
PiBZb3UgYXJlIHJpZ2h0LCB0aGVyZSBhcmUgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzIHRvIHhoY2kg
c2luY2UgdjMuDQo+IA0KPj4gRmVsaXBlLCBkbyB5b3Ugd2FudCB0byB0YWtlIHRoZSAzLzMgZHdj
MyBwYXRjaCBzZXBhcmF0ZWx5IGFmdGVyIDEvMyBhbmQgMi8zIGFyZSBpbiwgb3Igc2hvdWxkDQo+
PiBJIHRha2UgdGhlbSBhbGwsIG9yIGFzayBpZiBHcmVnIHdvdWxkIGxpa2UgdG8gcGljayB1cCB0
aGlzIHNlcmllcz8NCj4+DQpIb3cgd291bGQgeW91IGxpa2UgTWF0aGlhcyB0byBnbyBhYm91dCBt
ZXJnaW5nIHRoZSBwYXRjaCBzZXJpZXM/DQoNCj4+IC1NYXRoaWFzIA0KPj4NCj4gDQo+IFJlZ2Fy
ZHMsDQo+IFRlamFzIEpvZ2xla2FyDQo+IA0KDQpUaGFua3MgJiBSZWdhcmRzLA0KVGVqYXMgSm9n
bGVrYXINCg==
