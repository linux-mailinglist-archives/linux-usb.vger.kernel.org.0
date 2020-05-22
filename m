Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6176A1DDCE5
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 04:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgEVCAa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 22:00:30 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:37794 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727835AbgEVCA3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 22:00:29 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 41FD140967;
        Fri, 22 May 2020 02:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590112828; bh=IqdjlavbRcY3gINqXtssEwjUAh8SSHxqvj52c20s5ag=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=O955zS/fPTaxr+SYtnEVYM7FVipEwaGkJ7QOyRyy/hu8pxAD4tbKnDCbDhz4LB4cm
         0uHI6RFsIo2BTVODOOiQihiArYOoJJnMzJGjziLdgK8jatIuyKUjIDGtQu3O3ECMfc
         U9GKLICw+86cAQZvK6kjWW1yM6LsrMUaM6T/BfazrAlxlhSZQUJ87E32PVbV15gccm
         tIhpAMrGkscigtBaqw/UxA9YFjJ9nz+wHd91fvLdbgBCKBD/I+IEnfRJR71Q3ylsdh
         gvGXleqUV8cjH3dMfKKym/BtNBf64hnn3PqxppVOir/4bHcw0zm3Hs5NFFtNHVFTEt
         tuh2+w/2Rj5hQ==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 8194DA0067;
        Fri, 22 May 2020 02:00:27 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 21 May 2020 18:58:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Thu, 21 May 2020 18:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpxW0zRg8XMvsxS+zmMSS47DZhUaHqdUTf9fQ5pgy1JRfsRAyAw11wPrLTGzNk90n+R/RCYo0Osi296n9FQi2GOznyjQPDocVI7N9TgaqRy1QtGYZ5IKD5s3KDviBaVWgYD6/jD/R8Jt2NE/VldQDo6ofoh57YAZ+VKYiGZNWgNLyZ8H9Q9iMArpmM6uBXJElrqkp1fkHRT+usk8VQhVnGXacdYOwoG/MCnG2DEUvt6t8dAVYBziiGRaiWAb0BdPwWq8GStKl8ei8L1BrKJ03j10bfwB4a1v7muNKxjQt3sXuofPpTH9U/iOhiTp02NLLRtp7/JH/DJTlSs768/+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqdjlavbRcY3gINqXtssEwjUAh8SSHxqvj52c20s5ag=;
 b=dz2I7kiFW832DJ6sMI7Cd/dY36iHSr7BCpKhqPCHOP8m5sqK1D7o95jJ++WYQEo74UGnoKltYSFZQprwDzbiTuL2/fxUpc/nj4SbXc3nrnt+tBD3xgWjYrTB9nWyxtZzMsri6D7yodi23n0FaGpUBE41KPSvovdZ6bMs+YcnvJgHqp9mxqSHtv9U0S2Ckls78+ENxwSd3D1ciQnWNpN/pdnHnVx577RRGyS5Z33LUIKG09nOsXyIS5HEIpxPNIngONHNzOKXavy8rvTcE2wfuHbeKEXMw3wD8OBxo44NB3c2c6Tu4dDwvVSZrNZ31r08mm8IsTM8n/Iqq/4l7oPb1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqdjlavbRcY3gINqXtssEwjUAh8SSHxqvj52c20s5ag=;
 b=NaE9LzKp+nW37qdQEDmS7RPjn2TiEFxYpGEnwmUB7TrXebzAr5Iia1sPbS0+ciwh1Dxz1pkq9j5i2KLpU2ST478p7KUsNBSZVZPNB5EK48cdXMKHmfvp0Mx1ZQkkupMsmzK/+kf/MZDPYQeY+FsQYgiSUg8b3mmXbCRB8PQCBkM=
Received: from CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21)
 by CH2PR12MB3672.namprd12.prod.outlook.com (2603:10b6:610:2d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Fri, 22 May
 2020 01:58:43 +0000
Received: from CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467]) by CH2PR12MB4311.namprd12.prod.outlook.com
 ([fe80::cd38:4727:1239:f467%4]) with mapi id 15.20.3021.024; Fri, 22 May 2020
 01:58:43 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>
CC:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to consolidate
 SG
Thread-Topic: [RFC PATCH v2 4/4] usb: xhci: Use temporary buffer to
 consolidate SG
Thread-Index: AQHWF8I9mzJAua+iDUCYnE0KWVGzAqiuMWMAgAKCaYCAAKoXgIAAAwSAgAAMPYCAAhxigA==
Date:   Fri, 22 May 2020 01:58:43 +0000
Message-ID: <3b0c3f61-2a32-3fe0-f63c-a479f6eb11ab@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
 <969b5c9f31807635785ecc74b2ae2559ddc3bbeb.1587461220.git.joglekar@synopsys.com>
 <a1845154-2d8d-e63c-a3e7-7a3ed244bd57@linux.intel.com>
 <6551a485-5478-ccac-ca1f-d3e2ec4c9053@synopsys.com>
 <20200520165001.GD11084@rowland.harvard.edu>
 <a577925a-98ea-2e6d-da0c-b3e8dbe3dc7e@synopsys.com>
 <20200520174437.GA15590@rowland.harvard.edu>
In-Reply-To: <20200520174437.GA15590@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 730a68fd-58aa-4e7e-03b2-08d7fdf3a85d
x-ms-traffictypediagnostic: CH2PR12MB3672:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB3672760622EEDD435B05CC9CA4B40@CH2PR12MB3672.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 04111BAC64
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: diPVTBBBYghuSFlQoucR8WcN8kfBj8KXuKFBKAX9YB5C9RMBmpDYtE6NeiX5EJ19l8H3uzjMjGMph//58faqLCfaHaj8hVHk+Eur4aorgd9P+SULnVxOAqU1VEkEfOfzjP0oDeESxpLNuzrkFFlIRoc/MtTvxzObF5xfR9QqKg/i1EGFwJ+BwMkGNxWc3j4M+nFsq+o1ZWFTpZvPDb5kOGa109OePOlsWtCVx/zEhA4IFJQzaWc4+W6Sq5BiJ5NYCtZKHZFqYxRnPVxJeIZClxDzxuYH2Ft6HplUA3wcQzox7mZ+b4ddUGzpIiDR8qEVFYyLRRn6x4OmI+/DK4KDig==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4311.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(39860400002)(366004)(136003)(396003)(107886003)(5660300002)(31686004)(66946007)(186003)(4326008)(6512007)(6486002)(26005)(478600001)(2616005)(36756003)(71200400001)(316002)(54906003)(8936002)(110136005)(53546011)(8676002)(66476007)(86362001)(31696002)(66446008)(64756008)(2906002)(91956017)(66556008)(76116006)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: ph2NSwaY9MMgVoCLp1QBaNYicZrudHQn/i4MF4sYG7MEk0T4CNldnSyeGKUfPMSau4uKFAh9jpP36pLSPGPcO1gWi05NQNODAQBBq3wXqdwZpchlfcI1oT6ovVhkltN89AaGXmioYKNUcLrgYsrEfwl/mlXZPZqY7e0mzTJbDFm2ZwKvZX2w645fykbR1HT2ytZnf/O7Ibe4ibJHcsXZESfQPGQl+t2iT+SHrCqKd65sDO9B8IkhtSUV5oaOsSykTX1UrbHMDRoDW7MyEyzCr3Jx4Oiluqlmm+drxPmwT18noV69H/mrtqMyfWam6jFvgyv/s9hTAHyDBAUhqVYfhSWRmn3/EJBie9RV+5K5CGhc3DOEd47k6MeHIfV03dT91RvQLu8oTrYTvgOPfeijYbpVtlNGFzBAqdyGqypAzslYXo+tciA/Vj3/PrRZrm5b9lJR+Y3oqYAq97bTG+eeVHxKmyEQPj70+hffjtCSEoc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD4B86B5F3803F4AA9A45AB386BE4867@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 730a68fd-58aa-4e7e-03b2-08d7fdf3a85d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2020 01:58:43.8637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PgALoYG1XRk+BdUsPJQNV12rvwUQRcNwjvSUHvxeCRID4eR2c+9VsWwK3Xvwb0+92ivwyzWhHoRoITrQGYY59g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3672
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiA1LzIwLzIwMjAgMTE6MTQgUE0sIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFdlZCwg
TWF5IDIwLCAyMDIwIGF0IDA1OjAwOjUwUE0gKzAwMDAsIFRlamFzIEpvZ2xla2FyIHdyb3RlOg0K
Pj4gSGksDQo+PiBPbiA1LzIwLzIwMjAgMTA6MjAgUE0sIEFsYW4gU3Rlcm4gd3JvdGU6DQo+Pj4g
T24gV2VkLCBNYXkgMjAsIDIwMjAgYXQgMDY6NDE6MTZBTSArMDAwMCwgVGVqYXMgSm9nbGVrYXIg
d3JvdGU6DQo+Pj4+Pj4gKwl1cmItPnRyYW5zZmVyX2J1ZmZlciA9IHRlbXA7DQo+Pj4+Pj4gKwl1
cmItPnRyYW5zZmVyX2RtYSA9IGRtYV9tYXBfc2luZ2xlKGhjZC0+c2VsZi5zeXNkZXYsDQo+Pj4+
Pj4gKwkJCQkJICAgdXJiLT50cmFuc2Zlcl9idWZmZXIsDQo+Pj4+Pj4gKwkJCQkJICAgdXJiLT50
cmFuc2Zlcl9idWZmZXJfbGVuZ3RoLA0KPj4+Pj4+ICsJCQkJCSAgIGRpcik7DQo+Pj4+Pj4gKw0K
Pj4+Pj4+ICsJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGhjZC0+c2VsZi5zeXNkZXYsDQo+Pj4+Pj4g
KwkJCSAgICAgIHVyYi0+dHJhbnNmZXJfZG1hKSkgew0KPj4+Pj4+ICsJCXJldCA9IC1FQUdBSU47
DQo+Pj4+Pj4gKwkJa2ZyZWUodGVtcCk7DQo+Pj4+Pj4gKwl9IGVsc2Ugew0KPj4+Pj4+ICsJCXVy
Yi0+dHJhbnNmZXJfZmxhZ3MgfD0gVVJCX0RNQV9NQVBfU0lOR0xFOw0KPj4+Pj4NCj4+Pj4+IE5v
dCBzdXJlIGlmIHVzaW5nIFVSQl9ETUFfTUFQX1NJTkdMRSB0byBmbGFnIHRoYXQgdGhpcyB1cmIg
aXMgYm91Y2VidWZmZXJlZCBpcw0KPj4+Pj4gYXBwcm9wcmlhdGUuDQo+Pj4+Pg0KPj4+Pj4gSWYg
R3JlZyBvciBBbGFuIGRvbid0IG9iamVjdCB0aGVuIGl0J3MgZmluZSBmb3IgbWUgYXMgd2VsbC4N
Cj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4gQEdyZWcvQWxhbiBkbyB5b3Ugc3VnZ2VzdCBhbnkg
Y2hhbmdlIGZvciB0aGUgZmxhZyBoZXJlPw0KPj4+DQo+Pj4gVGhpcyByZXF1aXJlcyBjYXJlLCBi
ZWNhdXNlIHRoZSBjb3JlIHdpbGwgYWxyZWFkeSBoYXZlIHNldCBvdGhlciBmbGFncyANCj4+PiBm
b3IgdGhpcyBVUkIuICBJIGRvbid0IHJlbWVtYmVyIHRoZSBkZXRhaWxzIGFuZCBJIGRvbid0IGhh
dmUgdGltZSB0byANCj4+PiBjaGVjayB0aGVtIG5vdy4gIEJ1dCBpdCB3b3VsZG4ndCBiZSBhdCBh
bGwgc3VycHJpc2luZyBpZiB0aGUgY29yZSANCj4+PiBkb2Vzbid0IGV4cGVjdCBhbiBVUkIgYm90
aCB0byB1c2UgU0cgYW5kIHRvIHVzZSBETUFfTUFQX1NJTkdMRS4NCj4+Pg0KPj4gV2hlbiB0aGlz
IHF1aXJrIGlzIGVuYWJsZWQgYW5kIGl0IGlzIHJlcXVpcmVkIHRvIGNvbnNvbGlkYXRlIFNHIGxp
c3QgdG8gDQo+PiBzaW5nbGUgYnVmZmVyIG5vIG90aGVyIGZsYWdzIGFyZSBzZXQgZm9yIHRoZSBV
UkIuDQo+IA0KPiBJIGRvbid0IGJlbGlldmUgdGhhdC4gIFdoYXQgYWJvdXQgVVJCX0RNQV9NQVBf
U0cgb3IgDQo+IFVSQl9ETUFfTUFQX1BBR0U/ICBUaGUgVVNCIGNvcmUgY2VydGFpbmx5IHdvdWxk
IGhhdmUgc2V0IG9uZSBvZiB0aGVtIA0KPiBhbHJlYWR5LiAgTm90IG9ubHkgd291bGQgeW91IG5l
ZWQgdG8gY2xlYXIgdGhhdCBmbGFnLCB5b3Ugd2FudCBhbHNvIG5lZWQgDQo+IHRvIHVuZG8gdGhl
IG1hcHBpbmcuDQo+DQpVUkJfRE1BX01BUF9TRyBvciBVUkJfRE1BX01BUF9QQUdFIGZsYWdzIGFy
ZSBzZXQgZm9yIGFuIFVSQiBpbiBjb3JlIHdpdGhpbg0KZnVuY3Rpb24gdXNiX2hjZF9tYXBfdXJi
X2Zvcl9kbWEoKSwgd2l0aCBteSBwYXRjaCB0aGUgeGhjaV9tYXBfdXJiX2Zvcl9kbWEoKQ0KZG9l
cyBub3QgY2FsbCB1c2JfaGNkX21hcF91cmJfZm9yX2RtYSgpIHdoZW4gU0cgbGlzdCBjb25zb2xp
ZGF0aW9uIGlzIHJlcXVpcmVkDQpidXQgaXQgY2FsbHMgdGhlIG5ld2x5IGFkZGVkIGZ1bmN0aW9u
IHhoY2lfbWFwX3RlbXBfYnVmZmVyKCkgd2l0aGluIHRoYXQgZnVuY3Rpb24NCm9ubHkgZG1hX21h
cF9zaW5nbGUoKSBpcyBjYWxsZWQgdG8gbWFwIGNvbnNvbGlkYXRlZCBTRyBsaXN0Lg0KIA0KPj4g
T25seSBxdWVzdGlvbiBoZXJlIGlzIA0KPj4gaWYgaXQgaXMgZ29vZCB0byB1c2UgRE1BX01BUF9T
SU5HTEUgZmxhZyBmb3IgdGhlIGNvbnNvbGlkYXRlZCBTRyBsaXN0IA0KPj4gaW50byBhIHNpbmds
ZSB0ZW1wb3JhcnkgYnVmZmVyLg0KPiANCj4gSWYgeW91IGNhbGwgZG1hX21hcF9zaW5nbGUoKSB0
aGVuIFVTQl9ETUFfTUFQX1NJTkdMRSBpcyB0aGUgYXBwcm9wcmlhdGUgDQo+IGZsYWcgdG8gc2Vz
dC4NCj4gDQpZZXMsIHdpdGhpbiB4aGNpX21hcF90ZW1wX2J1ZmZlcigpLCBhZnRlciBjb25zb2xp
ZGF0aW5nIHRoZSBTRyBsaXN0IGluIGEgdGVtcA0KYnVmZmVyIEkgY2FsbCBkbWFfbWFwX3Npbmds
ZSgpIHRvIG1hcCB0aGUgdGVtcCBidWZmZXIuDQoNCj4gQWxhbiBTdGVybg0KPiANCg0KVGhhbmtz
ICYgUmVnYXJkcywNCiBUZWphcyBKb2dsZWthcg0K
