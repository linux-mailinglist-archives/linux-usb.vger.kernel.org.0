Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98A3510E9D4
	for <lists+linux-usb@lfdr.de>; Mon,  2 Dec 2019 12:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727423AbfLBLxl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Dec 2019 06:53:41 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:44064 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726149AbfLBLxk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Dec 2019 06:53:40 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E5E0042292;
        Mon,  2 Dec 2019 11:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1575287620; bh=otHrQC1P19Tv22KxSaf+r5KTOidMjidJdUqf39xfzbs=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fl0FSJcJAbR6JSefKX688WtURAfLmOZuND73lDx3IIluRuq5Ubqy2R+jPdt7ywVBe
         snueh9Lm4QT1ahrUi98jjrQUV+3y4kGQC2vC/nLLH6tjBrPS+fAUKJfriZglJoi4/S
         rvGLs5lxm3GkcXRDBKzcHko6hI62L3zRjsHLkDSuwkzTd/eXja4VKCImkWgU8PWiuD
         XyX24BEq3ysxvYmNjdM9rZgyiY0dybJbLFnlP75uU6yoVEQI4Es2Vh4H24cnAcPhvv
         PeaufcGi/l5YAuXhUm58oZZ3OI/TiUzlPauC69k06n0SIXSqo9/gRniYgoIvnUnMwe
         Ir71THvETWWQw==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 3D26FA0066;
        Mon,  2 Dec 2019 11:53:39 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 2 Dec 2019 03:53:39 -0800
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 2 Dec 2019 03:53:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJCU6TiiL3hbwhfAo/0Zq04d7M+hJaTvD/faDFcZc1eY8iT0hnckisiSPnEvh/vJuDAMOyv2i8gXRxHEanLajt9fj9oXRHRu6/o34wwNB5LzKjVQMuuP6dZmeiIcMdtvRV85H4qFnTVblyHQSmbl7+42UB4Ah24k5kjOa0UjRd4ixAiZse+YIBO5bFLeGomFYkV16KrOXZZ4y3J9EbhfC+U4j13YElH3hYmHB1HEXTUy01jz4pIELOY34qlNTbTkkbPdhRZ+OQV12lT67LVf0ibuvh5rU2+lZLOJlhG5dYjZ+u8yQ8B5Vr20Yx3QhcHVGrjF09q6h2KyhoHAoxlzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otHrQC1P19Tv22KxSaf+r5KTOidMjidJdUqf39xfzbs=;
 b=JnS4a9QN28TWISCmH81aZQeT5okw/xq1b11Rzj6Pu7u38b9Svklcfk0ja8RZmLXg08QG1Pt6QyXXDb1Q0jezdnkxn3oNFOMWBXE+/Su0Mi+MiEsnzwnEgUdyYgRO0C8/QLFCzps+Q/PiFTalhRfjUEsZ99AObCNTSO/M8/Sv6VQYHUBzqA+FiUXpMVW98a6//TpNZu86Dx7+x0OaObfgxlLdI4WWxk52P9vfd61ghXLpubgkb9AXPNkeGsQ/e0G5HWyfbayw+JgOOmLdzGripG8/GDIwz6ibL8ekzR1elBkCc8ulXWDLM0t+EuGmsDa6GNaJi/xisVSdt1f0mMpGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otHrQC1P19Tv22KxSaf+r5KTOidMjidJdUqf39xfzbs=;
 b=piB5LH+Qf2nNltFk+tpd3p3mHlHETQlWLSYvOFFX7aOeTsSEWL6tLt8vBAhIs5LiJ68qG9IhiTLUBaN1Tgvbx5JxWmwPDiB0KmfIXmSygNsKgKCUNBWT4h2zC8tjJVfiUyHlCF+l11yyhJkRa2JaDYPTN80T38HKng0jZ07vhsU=
Received: from MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) by
 MN2PR12MB4080.namprd12.prod.outlook.com (52.135.50.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.19; Mon, 2 Dec 2019 11:53:37 +0000
Received: from MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::d0e:7272:4a88:ffeb]) by MN2PR12MB4093.namprd12.prod.outlook.com
 ([fe80::d0e:7272:4a88:ffeb%5]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 11:53:36 +0000
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     pt <ptchentw@gmail.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Chen <jun.chen@vatics.com>
Subject: Re: [PATCH] usb: dwc2: gadget: stall handshakes returned by control
 pipes in status stage
Thread-Topic: [PATCH] usb: dwc2: gadget: stall handshakes returned by control
 pipes in status stage
Thread-Index: AQHVj9LXB1Nv9YuOvE2ai4bkGHgDzaegtCCAgAFlhQCABNT2gA==
Date:   Mon, 2 Dec 2019 11:53:36 +0000
Message-ID: <326f286b-69ad-c024-cd6b-217385c7fabe@synopsys.com>
References: <1572516292-23969-1-git-send-email-ptchentw@gmail.com>
 <da692cfb-2d23-cc24-8313-f1c836a9aa6b@synopsys.com>
 <CADY+QgtWY2Hsw-D6jMC5bGCj6A1BL4DFu6dZgFwNgxwJrFXn4A@mail.gmail.com>
In-Reply-To: <CADY+QgtWY2Hsw-D6jMC5bGCj6A1BL4DFu6dZgFwNgxwJrFXn4A@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: d6f7f8e0-741c-482f-ec04-08d7771e4402
x-ms-traffictypediagnostic: MN2PR12MB4080:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4080EC877A68F341848FC5DBA7430@MN2PR12MB4080.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(136003)(346002)(366004)(39860400002)(189003)(199004)(64756008)(66476007)(66556008)(66446008)(2906002)(76176011)(71190400001)(11346002)(446003)(6116002)(2616005)(3846002)(71200400001)(53546011)(54906003)(36756003)(102836004)(26005)(58126008)(316002)(14454004)(186003)(6506007)(110136005)(99286004)(8676002)(6436002)(6306002)(6486002)(65956001)(65806001)(91956017)(86362001)(229853002)(66066001)(81166006)(81156014)(6512007)(6246003)(4326008)(31696002)(5660300002)(7736002)(305945005)(966005)(478600001)(25786009)(66946007)(31686004)(8936002)(76116006)(256004)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:MN2PR12MB4080;H:MN2PR12MB4093.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aY6nfseWTo6Guihr0dY0TNToyrAkfCf1A4S79QM09Am8Eph+avVNDm8/qC8PN4RdqW0Npjscf9TXAZgaMkQe8x5T8o7GAFr4M6jV1iR2o1gSue3h4CviYcfYRVlq9ujux9VXC6o1NRMlaW8DOYL6Twp/nz7Ip0QW9Yz7A/p1YjglVRSU1d/TORFxp5Qww1VGMLp42j/7SclMhKEu2EwbRyJYn/D1vE+ro+yI4CBhPsyQYDdGbUpWnK/ZZNp6r8dRB1jpz1bY9imvC+HDeCxNkLy63+K7qiIHGtO6cbHYJSGDZORNwIvDtuOocKvVW/Jcw3jtYC7aXLhl+Ebt01hi57revRUc5xcszeXOaHhEPbTE99LqhxHvtJ5cponYMIGZxQ3PEuCUOmeXghsdUsuYLfR/oHW2GArWFJH1VY5fewJc3JsB/PS3gJ+09d9Xf782XWqE3zezgS72bh6TTxJPaM2/DhBDkrSmuidDbR5llKg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99FAF8FFC732AB49A997AA19DA9A333F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f7f8e0-741c-482f-ec04-08d7771e4402
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 11:53:36.8826
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +U67vLZ6dhsMiI0tHzFdIDPJzPubYLXf7Y7FBhvfkLBNE8E2LQ04STdci4WjW2cgfArobYFlph7IKGAkaQpjqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgSnVuLA0KDQpPbiAxMS8yOS8yMDE5IDI6MDYgUE0sIHB0IHdyb3RlOg0KPiBIaSBNaW5hcywN
Cj4gIMKgIMKgIEluIHRoaXMgc2l0dWF0aW9uLCB0aGVyZSBpcyBubyBkZWJ1ZyBsb2cgaW4gTGlu
dXggc2lkZSAoYmVjYXVzZSANCj4gZ2FkZ2V0IHNldCBzdGFsbCBJTiwgYnV0IGhvc3Qgd2FpdGlu
ZyBmb3IgT1VUKQ0KPiBTbyBJIHdyb3RlIGEgZGVidWcgcHJvY2VkdXJlIHdpdGggVVNCIGFuYWx5
emVyIGxvZyBpbWFnZXMsDQo+IHBsZWFzZSByZWFkIGhlcmUgaHR0cHM6Ly9ybTJicm90aGVycy5j
Yy91dmNfc3RhbGxfMF9sZW4uaHRtbCANCj4gPGh0dHBzOi8vdXJsZGVmZW5zZS5wcm9vZnBvaW50
LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fcm0yYnJvdGhlcnMuY2NfdXZjLTVGc3RhbGwtNUYwLTVG
bGVuLmh0bWwmZD1Ed01GYVEmYz1EUEw2X1hfNkprWEZ4N0FYV3FCMHRnJnI9Nno5QWw5RnJIUl9a
cWJidFNBc0QxNnB2T0wyUzNYSHhRblN6cThrdXN5SSZtPTkybGJaYV9rUmkxNEVwc0pvRDA5bHd6
UTFwbG4yV2ZQcFg1eXNoYkNPd1Emcz1EdjJEbVdQRnFIc1FMY3VZRHEwT1Zoblo4VVVqR2lVdWJt
a3NyamlvTjNJJmU9PsKgdG8gDQo+IGNoZWNrIGxvZy4NCj4gDQo+IFRoYW5rcywNCj4gSnVuDQo+
IA0KSW4gbWVudGlvbmVkIGJ5IHlvdSBjYXNlICJpbiB0aGlzIHNwZWNpYWwgY2FzZSwgd2hlbiB3
ZSBnb3QgZXJyb3IgDQpjb21tYW5kIHdpdGggemVybyBsZW5ndGgiLCBob3N0IGJlaGF2ZSBwcmVt
YXR1cmVseSAtIHNlbmRpbmcgT1VUIFpMUCANCihTdGF0dXMgT1VUIHN0YWdlKSwgaW5zdGVhZCBv
ZiBzZW5kaW5nIElOIHRva2VuIGZvciBTdGF0dXMgSU4gc3RhZ2UuIA0KVGhpcyBiZWhhdmlvciBk
ZXNjcmliZWQgaW4gVVNCIDIwIHNwZWMgaW4gIjUuNS41IENvbnRyb2wgVHJhbnNmZXIgRGF0YSAN
ClNlcXVlbmNlcyIuIEl0J3Mga25vd24gYXMgQ29udHJvbCB0cmFuc2ZlcnMgZXhjZXB0aW9uYWwg
Y2FzZXMsIHdoaWNoIA0KYWN0dWFsbHkgc3VwcG9ydGVkIGJ5IEhTT1RHIGNvcmUsIGJ1dCBpbiBk
d2MyIGV4Y2VwdGlvbmFsIGNhc2VzIG5vdCBoYW5kbGVkLg0KV2UgaGF2ZSBwbGFucyAobm90IHNj
aGVkdWxlZCB5ZXQpIHRvIGFkZCB0byBkd2MyIGhhbmRsaW5nIG9mIGV4Y2VwdGlvbmFsIA0KY2Fz
ZXMgb2YgY29udHJvbCB0cmFuc2ZlcnMgYXMgZGVzY3JpYmVkIGluIEhTT1RHIHByb2dyYW1taW5n
IGd1aWRlLCANCndoaWNoIHdpbGwgcmVzb2x2ZSB5b3VyIGNhc2Ugd2l0aG91dCBhbnkgYWRkaXRp
b25hbCBzdGFsbGluZy4NCllvdXIgcGF0Y2ggdXNlcyBzdGFsbCBtZWNoYW5pc20gdG8gc29sdmUg
b25lIG9mIGV4Y2VwdGlvbmFsIGNhc2VzLiBJIA0KdHJlYXQgaXQgYXMgd29ya2Fyb3VuZCBhbmQg
Y2FuJ3QgQWNrIHRoaXMgcGF0Y2guDQoNClRoYW5rcywNCk1pbmFzDQoNCg0KPiBNaW5hcyBIYXJ1
dHl1bnlhbiA8TWluYXMuSGFydXR5dW55YW5Ac3lub3BzeXMuY29tIA0KPiA8bWFpbHRvOk1pbmFz
LkhhcnV0eXVueWFuQHN5bm9wc3lzLmNvbT4+IOaWvCAyMDE55bm0MTHmnIgyOOaXpSDpgLHlm5sg
5LiL5Y2IODo0NiANCj4g5a+r6YGT77yaDQo+IA0KPiAgICAgSGkgSnVuLA0KPiANCj4gICAgIE9u
IDEwLzMxLzIwMTkgMjowNCBQTSwgSnVuIENoZW4gd3JvdGU6DQo+ICAgICAgPiBGcm9tOiBKdW4g
Q2hlbiA8anVuLmNoZW5AdmF0aWNzLmNvbSA8bWFpbHRvOmp1bi5jaGVuQHZhdGljcy5jb20+Pg0K
PiAgICAgID4NCj4gICAgICA+IEFjY29yZGluZyB0byBVU0IyLjAgc3BlYyA4LjUuMywgIklmIHRo
ZSBjb250cm9sIHNlcXVlbmNlDQo+ICAgICAgPiBoYXMgbm8gRGF0YSBzdGFnZSwgdGhlbiBpdCBj
b25zaXN0cyBvZiBhIFNldHVwIHN0YWdlDQo+ICAgICAgPiBmb2xsb3dlZCBieSBhIFN0YXR1cyBz
dGFnZSBjb25zaXN0aW5nIG9mIGFuIElOIHRyYW5zYWN0aW9uLiINCj4gICAgICA+DQo+ICAgICAg
PiBCdXQgd2hlbiBkb2luZyBjb250cm9sIHJlYWQgaW4gc29tZSBIT1NUIChsaWtlIE1TIFdpbmRv
d3MpLA0KPiAgICAgID4gYWZ0ZXIgYSBTRVRVUCB0cmFuc2FjdGlvbiB3aXRoIG5vIERhdGEgc3Rh
Z2UsIHRoZSBzZXF1ZW5jZQ0KPiAgICAgID4gc3RheSBpbiB0aGUgU3RhdHVzIHN0YWdlIG9mIGFu
IE9VVCB0cmFuc2FjdGlvbiB1bnRpbCB0aW1lb3V0Lg0KPiAgICAgID4NCj4gICAgIENvdWxkIHlv
dSBwbGVhc2UgcHJvdmlkZSBkZWJ1ZyBsb2cgb2YgYWJvdmUgc2NlbmFyaW8/DQo+IA0KPiAgICAg
ID4gVGhpcyBwYXRjaCBTdGFsbCBib3RoIElOIGFuZCBPVVQgb24gZXAwIGluIHN0YXR1cyBzdGFn
ZSwNCj4gICAgICA+IGZpeCB0aGUgdW5oYW5kbGluZyBzdGF0ZSB3aGVuIHdlIGdvdCBhbiBlcnJv
ciBjb21tYW5kDQo+ICAgICAgPiB3aXRoIHplcm8gbGVuZ3RoIGNvbnRyb2wgcmVhZCByZXF1ZXN0
Lg0KPiAgICAgID4NCj4gICAgICA+IEl0J3MgYWxzbyBiYXNlZCBvbiB0aGUgVVNCMi4wIHNwZWMg
OC41LjMuNCwNCj4gICAgICA+ICJUaGUgcHJvdG9jb2wgU1RBTEwgY29uZGl0aW9uIGxhc3RzIHVu
dGlsIHRoZSByZWNlaXB0IG9mDQo+ICAgICAgPiB0aGUgbmV4dCBTRVRVUCB0cmFuc2FjdGlvbiwg
YW5kIHRoZSBmdW5jdGlvbiB3aWxsIHJldHVybg0KPiAgICAgID4gU1RBTEwgaW4gcmVzcG9uc2Ug
dG8gYW55IElOIG9yIE9VVCB0cmFuc2FjdGlvbiBvbiB0aGUgcGlwZQ0KPiAgICAgID4gdW50aWwg
dGhlIFNFVFVQIHRyYW5zYWN0aW9uIGlzIHJlY2VpdmVkLiINCj4gICAgICA+DQo+ICAgICAgPiBT
aWduZWQtb2ZmLWJ5OiBKdW4gQ2hlbiA8anVuLmNoZW5AdmF0aWNzLmNvbQ0KPiAgICAgPG1haWx0
bzpqdW4uY2hlbkB2YXRpY3MuY29tPj4NCj4gICAgICA+IC0tLQ0KPiAgICAgID7CoCDCoGRyaXZl
cnMvdXNiL2R3YzIvZ2FkZ2V0LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0NCj4gICAgICA+wqAgwqAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMTMgZGVs
ZXRpb25zKC0pDQo+ICAgICAgPg0KPiAgICAgID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3
YzIvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+ICAgICAgPiBpbmRleCA2
YmUxMGU0OTYuLjczYjU5NDQgMTAwNjQ0DQo+ICAgICAgPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2My
L2dhZGdldC5jDQo+ICAgICAgPiArKysgYi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+ICAg
ICAgPiBAQCAtMTg1MywyMyArMTg1MywzMCBAQCBzdGF0aWMgdm9pZCBkd2MyX2hzb3RnX3N0YWxs
X2VwMChzdHJ1Y3QNCj4gICAgIGR3YzJfaHNvdGcgKmhzb3RnKQ0KPiAgICAgID7CoCDCoCDCoCDC
oHN0cnVjdCBkd2MyX2hzb3RnX2VwICplcDAgPSBoc290Zy0+ZXBzX291dFswXTsNCj4gICAgICA+
wqAgwqAgwqAgwqB1MzIgcmVnOw0KPiAgICAgID7CoCDCoCDCoCDCoHUzMiBjdHJsOw0KPiAgICAg
ID4gK8KgIMKgIMKgdTMyIGRpcmVjdGlvbjsNCj4gICAgICA+DQo+ICAgICAgPiAtwqAgwqAgwqBk
ZXZfZGJnKGhzb3RnLT5kZXYsICJlcDAgc3RhbGwgKGRpcj0lZClcbiIsIGVwMC0+ZGlyX2luKTsN
Cj4gICAgICA+IC3CoCDCoCDCoHJlZyA9IChlcDAtPmRpcl9pbikgPyBESUVQQ1RMMCA6IERPRVBD
VEwwOw0KPiAgICAgID4gK8KgIMKgIMKgZGlyZWN0aW9uID0gZXAwLT5kaXJfaW47DQo+ICAgICAg
PiArwqAgwqAgwqBkbyB7DQo+ICAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqBkZXZfZGJnKGhz
b3RnLT5kZXYsICJlcDAgc3RhbGwgKGRpcj0lZClcbiIsDQo+ICAgICBlcDAtPmRpcl9pbik7DQo+
ICAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAoZXAwLT5kaXJfaW4pID8gRElFUENU
TDAgOiBET0VQQ1RMMDsNCj4gICAgICA+DQo+ICAgICAgPiAtwqAgwqAgwqAvKg0KPiAgICAgID4g
LcKgIMKgIMKgICogRHhFUENUTF9TdGFsbCB3aWxsIGJlIGNsZWFyZWQgYnkgRVAgb25jZSBpdCBo
YXMNCj4gICAgICA+IC3CoCDCoCDCoCAqIHRha2VuIGVmZmVjdCwgc28gbm8gbmVlZCB0byBjbGVh
ciBsYXRlci4NCj4gICAgICA+IC3CoCDCoCDCoCAqLw0KPiAgICAgID4gK8KgIMKgIMKgIMKgIMKg
IMKgIMKgLyoNCj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCAqIER4RVBDVExfU3RhbGwg
d2lsbCBiZSBjbGVhcmVkIGJ5IEVQIG9uY2UgaXQgaGFzDQo+ICAgICAgPiArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgKiB0YWtlbiBlZmZlY3QsIHNvIG5vIG5lZWQgdG8gY2xlYXIgbGF0ZXIuDQo+ICAg
ICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi8NCj4gICAgICA+DQo+ICAgICAgPiAtwqAgwqAg
wqBjdHJsID0gZHdjMl9yZWFkbChoc290ZywgcmVnKTsNCj4gICAgICA+IC3CoCDCoCDCoGN0cmwg
fD0gRFhFUENUTF9TVEFMTDsNCj4gICAgICA+IC3CoCDCoCDCoGN0cmwgfD0gRFhFUENUTF9DTkFL
Ow0KPiAgICAgID4gLcKgIMKgIMKgZHdjMl93cml0ZWwoaHNvdGcsIGN0cmwsIHJlZyk7DQo+ICAg
ICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqBjdHJsID0gZHdjMl9yZWFkbChoc290ZywgcmVnKTsN
Cj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGN0cmwgfD0gRFhFUENUTF9TVEFMTDsNCj4g
ICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGN0cmwgfD0gRFhFUENUTF9DTkFLOw0KPiAgICAg
ID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgZHdjMl93cml0ZWwoaHNvdGcsIGN0cmwsIHJlZyk7DQo+
ICAgICAgPg0KPiAgICAgID4gLcKgIMKgIMKgZGV2X2RiZyhoc290Zy0+ZGV2LA0KPiAgICAgID4g
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIndyaXR0ZW4gRFhFUENUTD0weCUwOHggdG8gJTA4eCAoRFhF
UENUTD0weCUwOHgpXG4iLA0KPiAgICAgID4gLcKgIMKgIMKgIMKgIMKgIMKgIMKgY3RybCwgcmVn
LCBkd2MyX3JlYWRsKGhzb3RnLCByZWcpKTsNCj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oGRldl9kYmcoaHNvdGctPmRldiwNCj4gICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCJ3cml0dGVuIERYRVBDVEw9MHglMDh4IHRvICUwOHgNCj4gICAgIChEWEVQQ1RMPTB4
JTA4eClcbiIsDQo+ICAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjdHJs
LCByZWcsIGR3YzJfcmVhZGwoaHNvdGcsIHJlZykpOw0KPiAgICAgID4gKw0KPiAgICAgID4gK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKGhzb3RnLT5lcDBfc3RhdGUgPT0gRFdDMl9FUDBfU1RBVFVT
X0lOKQ0KPiAgICAgID4gK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZXAwLT5kaXJf
aW4gPSAoZXAwLT5kaXJfaW4gPT0gMSkgPyAwIDogMTsNCj4gICAgICA+ICvCoCDCoCDCoH0gd2hp
bGUgKGVwMC0+ZGlyX2luICE9IGRpcmVjdGlvbik7DQo+ICAgICAgPg0KPiAgICAgID7CoCDCoCDC
oCDCoCAvKg0KPiAgICAgID7CoCDCoCDCoCDCoCDCoCogY29tcGxldGUgd29uJ3QgYmUgY2FsbGVk
LCBzbyB3ZSBlbnF1ZXVlDQo+ICAgICAgPg0KPiANCj4gICAgIFRoYW5rcywNCj4gICAgIE1pbmFz
DQo+IA0K
