Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432D529E254
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 03:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388231AbgJ2CMm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Oct 2020 22:12:42 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38260 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726808AbgJ1VgX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Oct 2020 17:36:23 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BB148424E2;
        Wed, 28 Oct 2020 15:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603898434; bh=qWYmB7Zdyipf22h5xokTffl7FLgxI4y54WPGLkCFISc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=H7x1zpQBA5hyx5WJpZ29Z7FwWr0I0xxJRGvzO1Ovwm9Zj6g9ZjNoLvL7lCdACUFmb
         NOUbxysId7ur1RBmEGAsi3VF+43zSD/q8TyVkKJzMjFf7MsARIW/4ZcuhCzM4qoSTt
         IUDnLH6JqQee9EL9fntH78bLPR4akc/dbAinBXqozotVHI7UFoCbTK5kGFtqJzWwSO
         j+3lLL3wV07r5I/paq+zqLDkoFHrWlvWdeZa/j9XUNPAVrOJPP7x+yM9QetNrvl+fw
         63yze05cbX6KKNtrGZkjoZoche3A/iVowfPpZId3gbt2CvtRuCtGvjVvQEWiwM9PwO
         gmd1SaWhrQ6RQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 5A180A0096;
        Wed, 28 Oct 2020 15:20:33 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id BE38440044;
        Wed, 28 Oct 2020 15:20:32 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="Qlei18Hs";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bY20i+XwSB2hLzz8vlliCE6Qkz2JTaAQpg0FwNbZfMiDF/EJz/zuPgk+3ee4gvwYNvfQFTIf+O2Z4k6nhkkU+wGpL9UpmvwJbIJs2RXlbaY2fUe7l6G4SNwYFaabGfm0WFlYRuddV96JQGnzIElP093YnZ0BLbexhC0yqKHDozl8lhszAz2ZFbKxug7t3kJXMC1m0QSjy//5oFjUC4r6HpyvEhEl+/Lh8l1ufd5QpnmFSeHqyruTH26C8UpetLhNXG2xurCIo/gUhdCCtV+zHd/9MXKVBXh3Tb5e/ZPgYALG71ErcEh7wVMZXDj4grF6VsYS6uNtfOm1yNBCFVUM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWYmB7Zdyipf22h5xokTffl7FLgxI4y54WPGLkCFISc=;
 b=JkFP7XeSc4mQst4ytUO56UwtOXEQIhPOnnDyV/WY2DjgwoPaDnDerTQfPJo0IoPo5pbs4SyMXBFYzU6tduH8O/QMhj2rO5qrJ9nPRsdKAH+z9lji0fqslHz7zmPXe51ju6K7x7YCqjtg908hNuABP+S01Aah4NOzNFzjh5XCryBv57xIQJOfR7j2+oy7Y06C47JSybQfClVYFdTG8wkYEhU/U6z5gzshiyW/ifdV7XolN2FE19xXinMAyEdcwG/KIRUOSJ7XzAQ5Y1UJHMhk6CGqcsLIP/K8x0o6Up3cnedb5u/000OBvg39uiIjO/6gPZDXlKbqNYGt+cUARVCvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWYmB7Zdyipf22h5xokTffl7FLgxI4y54WPGLkCFISc=;
 b=Qlei18HsePGkjM31McJM8KMrQ9bwdzS7llWvj30fQxh6tUWaPAtJIFfznxbhIVHBhoB8YQUM6KR8cVBJbX9AGFKO89UrXRf+FBFIHtZyTytIFJW+O5Zs6WifgiiRWsACYBG8G8laLgJL1oG2spI6XTh3GsvfI2Lm0uAXnLVScoY=
Received: from MN2PR12MB3549.namprd12.prod.outlook.com (2603:10b6:208:107::17)
 by MN2PR12MB3517.namprd12.prod.outlook.com (2603:10b6:208:ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Wed, 28 Oct
 2020 15:20:27 +0000
Received: from MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::e1cf:a11d:fbda:9d3]) by MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::e1cf:a11d:fbda:9d3%5]) with mapi id 15.20.3499.027; Wed, 28 Oct 2020
 15:20:27 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Topic: [PATCH v5 0/3] Add logic to consolidate TRBs for Synopsys xHC
Thread-Index: AQHWo7zmdDYgLgZVXkaCKqwDDPH0oqmr1n8AgAFTDQCAAAqzAA==
Date:   Wed, 28 Oct 2020 15:20:27 +0000
Message-ID: <d84e4b5c-0d7a-50e2-25a1-5be1da9ca72a@synopsys.com>
References: <cover.1602853270.git.joglekar@synopsys.com>
 <aa3865cf-1cbd-5d3d-8808-f89d6e0c044e@synopsys.com>
 <09737ac8-66a0-564c-2f1c-60a92ec716b5@linux.intel.com>
In-Reply-To: <09737ac8-66a0-564c-2f1c-60a92ec716b5@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [49.207.197.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 474241d4-2aaf-4d02-31d8-08d87b54fff3
x-ms-traffictypediagnostic: MN2PR12MB3517:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB35173E572CCB781A91A3EC11A4170@MN2PR12MB3517.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ixgV4RKQquf7rXq4YH1Oce93BUsRtYgmyjBJ998nxxIk9SFOUK6QrTfDY5fyutzwNmitNkbqk1aVSJF9C3D3QCW67nI4saOloOk3lNjsCCN3t4trICqH3EiM0930fsq6apAF3ytkr1YQfYjkypjLKizpkHLXMU18VTUAv7JHjeL0p2sZ+5gKXcaztXjETDm9VIoxljZ22Fuo2cc7ohmv4OnQkPDcvyDzPSyod8BGCQqusoPPTLZscYGXSes/rihc0G2rEQK0nKelcFk4r5O8anacJt8+hYB60qzGMI/nEPglDth8oVerMojOxAJaXzL9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3549.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(83380400001)(478600001)(54906003)(31696002)(4326008)(6486002)(71200400001)(2906002)(86362001)(6512007)(5660300002)(316002)(26005)(8936002)(64756008)(36756003)(66446008)(6506007)(66946007)(110136005)(2616005)(66556008)(66476007)(31686004)(55236004)(53546011)(91956017)(186003)(76116006)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: hqUFgokGuBQsX+L1T76m9JMpYaIp2YXkp5r3gfF4uRH95mS1XLYK6KwEMqjepDCUnz3nvYnK/TdGme+vumfxIUgbWKmMoomuejHT9wFrdIfkxH5tI+ko+rsZC6PgYM/A1m9Nkl6nt+4NBA2F6p3R0LRha0WUCxU3Rc0319HR18tXuKmo3CvwBhmwI7Tu6alFWK5SXE4DTZ1IjL9A7YJ75m1q5opvCz2liR8wpcLsjYt8SkOgO1r6Z1wKjBC37166hpMl+IxHhKk2KlJMaBEagC/phLa2oiNiSndi07Vx/YiieGGUteuiNghK7zMa93ZFC13qGFWAciAZWmDXc0BrmUPq2aB0wmKKFdxQqS6HDRySOe7ifdPbJncp9KXDP9HR5mThiie6mZAEi7OrvJVEqM5dYyyDBZQcoMJ+QmGZhQy+YK903Iaeu/jZOIn97eLZtVBp5Q2CL9CUli/Ozii/77m2skFCht9pIImYf/g7alUAC1lBhAVA4ac2SPq05lT+ZcJ1HnMvANDQB60okQTs9Fi+rW8A+p79dKbTNMXUTgmyeG9n/fFEu8DOxG7wk2gLwFrbzoKazXBWq45cPOLnOqp6HgOgpF+VRr1TFZYs0yelk7WFBJCRoXuNXi1w69fJXmsOxNVH4LqYE8qZ5479TA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA0B510DA7ED69449D23CBC409473667@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474241d4-2aaf-4d02-31d8-08d87b54fff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 15:20:27.3753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3tprt2tj+KmtEdGoMFswqiDYGJEyJA5L2cbmxk5D4d8l59bXqREehVnahReL+BZ1aRmnyB0elLN+BqcylnZ9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3517
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiAxMC8yOC8yMDIwIDg6MTIgUE0sIE1hdGhpYXMgTnltYW4gd3JvdGU6DQo+IE9uIDI3
LjEwLjIwMjAgMjAuMjgsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0KPj4gSGkgTWF0aGlhcywNCj4+
IE9uIDEwLzE2LzIwMjAgNjozNCBQTSwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+Pj4gVGhlIFN5
bm9wc3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9mIHNpemUgVFJCX0NBQ0hFX1NJ
WkUgZm9yDQo+Pj4gZWFjaCBlbmRwb2ludC4gVGhlIGRlZmF1bHQgdmFsdWUgZm9yIFRSQl9DQUNI
RV9TSVpFIGlzIDE2IGZvciBTUyBhbmQgOA0KPj4+IGZvciBIUy4gVGhlIGNvbnRyb2xsZXIgbG9h
ZHMgYW5kIHVwZGF0ZXMgdGhlIFRSQiBjYWNoZSBmcm9tIHRoZQ0KPj4+IHRyYW5zZmVyIHJpbmcg
aW4gc3lzdGVtIG1lbW9yeSB3aGVuZXZlciB0aGUgZHJpdmVyIGlzc3VlcyBhIHN0YXJ0DQo+Pj4g
dHJhbnNmZXIgb3IgdXBkYXRlIHRyYW5zZmVyIGNvbW1hbmQuDQo+Pj4NCj4+PiBGb3IgY2hhaW5l
ZCBUUkJzLCB0aGUgU3lub3BzeXMgeEhDIHJlcXVpcmVzIHRoYXQgdGhlIHRvdGFsIGFtb3VudCBv
Zg0KPj4+IGJ5dGVzIGZvciBhbGwgVFJCcyBsb2FkZWQgaW4gdGhlIFRSQiBjYWNoZSBiZSBncmVh
dGVyIHRoYW4gb3IgZXF1YWwgdG8NCj4+PiAxIE1QUy4gT3IgdGhlIGNoYWluIGVuZHMgd2l0aGlu
IHRoZSBUUkIgY2FjaGUgKHdpdGggYSBsYXN0IFRSQikuDQo+Pj4NCj4+PiBJZiB0aGlzIHJlcXVp
cmVtZW50IGlzIG5vdCBtZXQsIHRoZSBjb250cm9sbGVyIHdpbGwgbm90IGJlIGFibGUgdG8NCj4+
PiBzZW5kIG9yIHJlY2VpdmUgYSBwYWNrZXQgYW5kIGl0IHdpbGwgaGFuZyBjYXVzaW5nIGEgZHJp
dmVyIHRpbWVvdXQgYW5kDQo+Pj4gZXJyb3IuDQo+Pj4NCj4+PiBUaGlzIHBhdGNoIHNldCBhZGRz
IGxvZ2ljIHRvIHRoZSBYSENJIGRyaXZlciB0byBkZXRlY3QgYW5kIHByZXZlbnQgdGhpcw0KPj4+
IGZyb20gaGFwcGVuaW5nIGFsb25nIHdpdGggdGhlIHF1aXJrIHRvIGVuYWJsZSB0aGlzIGxvZ2lj
IGZvciBTeW5vcHN5cw0KPj4+IEhBUFMgcGxhdGZvcm0uDQo+Pj4NCj4+PiBCYXNlZCBvbiBNYXRo
aWFzJ3MgZmVlZGJhY2sgb24gcHJldmlvdXMgaW1wbGVtZW50YXRpb24gd2hlcmUgY29uc29saWRh
dGlvbg0KPj4+IHdhcyBkb25lIGluIFRSQiBjYWNoZSwgd2l0aCB0aGlzIHBhdGNoIHNlcmllcyB0
aGUgaW1wbGVtZW50YXRpb24gaXMgZG9uZQ0KPj4+IGR1cmluZyBtYXBwaW5nIG9mIHRoZSBVUkIg
YnkgY29uc29saWRhdGluZyB0aGUgU0cgbGlzdCBpbnRvIGEgdGVtcG9yYXJ5DQo+Pj4gYnVmZmVy
IGlmIHRoZSBTRyBsaXN0IGJ1ZmZlciBzaXplcyB3aXRoaW4gVFJCX0NBQ0hFX1NJWkUgaXMgbGVz
cyB0aGFuIE1QUy4NCj4+Pg0KPj4+IENoYW5nZXMgc2luY2UgdjQ6DQo+Pj4gIC0gVXBkYXRlZCBb
UGF0Y2ggMy8zXSBwbGF0Zm9ybSBkYXRhIHN0cnVjdHVyZSBpbml0aWFsaXphdGlvbg0KPj4+ICAt
IFRyaXZpYWwgY2hhbmdlcyBpbiBjb21taXQgd29yZGluZ3MNCj4+Pg0KPj4+IENoYW5nZXMgc2lu
Y2UgdjM6DQo+Pj4gIC0gUmVtb3ZlZCB0aGUgZHQtYmluZGluZyBwYXRjaA0KPj4+ICAtIEFkZGVk
IG5ldyBwYXRjaCB0byBwYXNzIHRoZSBxdWlyayBhcyBwbGF0Zm9ybSBkYXRhDQo+Pj4gIC0gTW9k
aWZpZWQgdGhlIHBhdGNoIHRvIHNldCB0aGUgcXVpcmsNCj4+Pg0KPj4+IENoYW5nZXMgc2luY2Ug
djI6DQo+Pj4gIC0gTW9kaWZpZWQgdGhlIHhoY2lfdW5tYXBfdGVtcF9idWZmZXIgZnVuY3Rpb24g
dG8gdW5tYXAgZG1hIGFuZCBjDQo+Pj4gICAgdGhlIGRtYSBmbGFnDQo+Pj4gIC0gUmVtb3ZlZCBS
RkMgdGFnDQo+Pj4NCj4+PiBDaGFuZ2VzIHNpbmNlIHYxOg0KPj4+ICAtIENvbW1lbnRzIGZyb20g
R3JlZyBhcmUgYWRkcmVzc2VkIG9uIFtQQVRDSCA0LzRdIGFuZCBbUEFUQ0ggMS80XQ0KPj4+ICAt
IFJlbmFtZWQgdGhlIHByb3BlcnR5IGFuZCBxdWlyayBhcyBpbiBvdGhlciBwYXRjaGVzIGJhc2Vk
IG9uIFtQQVRDSCAxLzRdDQo+Pj4NCj4+Pg0KPj4+DQo+Pj4gVGVqYXMgSm9nbGVrYXIgKDMpOg0K
Pj4+ICAgdXNiOiB4aGNpOiBTZXQgcXVpcmsgZm9yIFhIQ0lfU0dfVFJCX0NBQ0hFX1NJWkVfUVVJ
UksNCj4+PiAgIHVzYjogeGhjaTogVXNlIHRlbXBvcmFyeSBidWZmZXIgdG8gY29uc29saWRhdGUg
U0cNCj4+PiAgIHVzYjogZHdjMzogUGFzcyBxdWlyayBhcyBwbGF0Zm9ybSBkYXRhDQo+Pj4NCj4+
PiAgZHJpdmVycy91c2IvZHdjMy9ob3N0LmMgICAgICB8ICAxMCArKysNCj4+PiAgZHJpdmVycy91
c2IvaG9zdC94aGNpLXBsYXQuYyB8ICAgMyArDQo+Pj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1y
aW5nLmMgfCAgIDIgKy0NCj4+PiAgZHJpdmVycy91c2IvaG9zdC94aGNpLmMgICAgICB8IDEzNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4+ICBkcml2ZXJzL3VzYi9ob3N0
L3hoY2kuaCAgICAgIHwgICA1ICsrDQo+Pj4gIDUgZmlsZXMgY2hhbmdlZCwgMTU1IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4NCj4+DQo+PiBJIGhhdmUgcmVtb3ZlZCB0aGUgZGVw
ZW5kZW5jeSBvbiBzZXR0aW5nIHF1aXJrIHRocm91Z2ggZGV2aWNlIHRyZWUgYmluZGluZw0KPj4g
YW5kIGFkZGVkIHRoZSBxdWlyayB1c2luZyBwbGF0Zm9ybSBkYXRhLiBDYW4geW91IHBsZWFzZSBy
ZXZpZXcgYW5kIGlmIA0KPj4gZXZlcnl0aGluZyBsb29rcyBPSywgY2FuIHlvdSBwbGVhc2UgYWRk
IHRoaXMgcGF0Y2ggc2VyaWVzIHRvIHlvdXIgdHJlZT8NCj4gDQo+IFN1cmUsIHRoZXJlIGFyZW4n
dCBhbnkgZnVuY3Rpb25hbCBjaGFuZ2VzIHRvIHhoY2kgc2luY2UgdjMgb2YgdGhpcyBzZXJpZXMg
cmlnaHQ/DQo+IEFuZCBpZiBJIHJlbWVtYmVyIGNvcnJlY3RseSBGZWxpcGUgZGlkbid0IGhhdmUg
YW55IG9iamVjdGlvbnMgdG8gdGhlIGR3YzMgcGFydCBlaXRoZXIuDQo+IA0KWW91IGFyZSByaWdo
dCwgdGhlcmUgYXJlIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyB0byB4aGNpIHNpbmNlIHYzLg0KDQo+
IEZlbGlwZSwgZG8geW91IHdhbnQgdG8gdGFrZSB0aGUgMy8zIGR3YzMgcGF0Y2ggc2VwYXJhdGVs
eSBhZnRlciAxLzMgYW5kIDIvMyBhcmUgaW4sIG9yIHNob3VsZA0KPiBJIHRha2UgdGhlbSBhbGws
IG9yIGFzayBpZiBHcmVnIHdvdWxkIGxpa2UgdG8gcGljayB1cCB0aGlzIHNlcmllcz8NCj4gDQo+
IC1NYXRoaWFzIA0KPiANCg0KUmVnYXJkcywNClRlamFzIEpvZ2xla2FyDQo=
