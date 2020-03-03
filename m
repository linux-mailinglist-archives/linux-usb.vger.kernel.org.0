Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408CD17741C
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 11:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgCCKZ6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 05:25:58 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:33352 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728473AbgCCKZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 05:25:58 -0500
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D839F42830;
        Tue,  3 Mar 2020 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1583231157; bh=O0APsPZ1cb65ImlyZJE23Kqfmd4sJS4ksdEmkDVwkc8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SMrN8/dguKMBu50WYJ1o/GnPgq5ENX2fPgs9XBWEpTYihs6pnCOkMpLty0mkWIAyp
         OWtE9oYLhnbOfhcNy111MfK4Gcl5g4Oc3GoS7A1IGmaJ4UuTl8J6eWvL/v198QDcoP
         0SfbQnXXMyXtFotbffYgxB4MPEJFDPZtepJP2ZDor4A/2STGP5TEriu0zCgigLy6qk
         Ug5Sy7dXF3B4oRenwwF8oFcXU0F0Gl2M7VuwM0CyqRxDRnBh5mBC3WXJ1B2/wrjJh/
         9LnEIKBai4QQ3tSXimMDMDglu9Ze2lnBIkZ9QSGa2WXsh0uKjN3fAICyElM1Z0lBj8
         a36p0Nb4RPeZA==
Received: from US01WEHTC3.internal.synopsys.com (us01wehtc3.internal.synopsys.com [10.15.84.232])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 858F5A01BC;
        Tue,  3 Mar 2020 10:25:56 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Mar 2020 02:24:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 3 Mar 2020 02:24:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L80HvLiLGO8KtGRLgoc/uOjiW60vOENc2p57DhZJJUoOaPdHagZ9mEM6BLW0FzHth3k5q28snzrNknO7hSyMmxzeJtyV85zS5Sip75PaTmYXx/5EmlAzYmLrONc4wZcIXa9yYRg2mfIwEyqrYrTv5cjYab7uPkuotxTy9nbzGz9ZObeY2LBmKuJ77Z97JcQvwhtnxUWFXbEC2ImIMHwsn8YsYwJVxCEBNJZr0e05iYBVJlSDyIH6J/8WfRclX1dmeczVuaV+jSLaQtO2cHMb+7BZUaAvl4tqiy3krn/bZ8430GsN5XmldTaFaBAIDEJ/zvIgR/4LCytAuJcfJ4lLOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0APsPZ1cb65ImlyZJE23Kqfmd4sJS4ksdEmkDVwkc8=;
 b=O0B9MtxUyvYHiiduDrOVoGWU0uN939h0o3g/OWiZsapa6zKj+GT3CBxMqv277fVs8iS7GYFFlfEFf8wvKg8s7fWjlPHh8any8jvoJBSzZqpak7wLjQF6x/RVgxERbgBoWF3QDCndpE0AsoRKbQZouIfFqXzBmIW0AYgWJFhO9WGJFOU0BOy6yrvFc6XYPzTrNkKYjTB/DamPHi4c3zFdcjp417PIrrWgcdxWobtRvziaAWQDLPcRBBSsldcc2nCTjCp9JeHEy0xPVebSoWVvU/OFQduHpBZKueoC4utFY7R/kA7Cjmp0VTt4btjPwDUhfL4iPiKZRoshURa4XDmfng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0APsPZ1cb65ImlyZJE23Kqfmd4sJS4ksdEmkDVwkc8=;
 b=cyRzH7GefyL/uMX7TSLGkNmbtuafprB5sNKCwm8PACAAv8swaTNt1CT6V+Gl2sS15s2/ajxaOrqUoPhJBrlPqAdAne3yjzSzUfZFEzPxpZDnV53NirN7XXeQ/TnTP4FKJvafmCWs7TzpAmAGWHTQOjQSsAGlkMZnOh6t2/N3TF8=
Received: from DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12)
 by DM6PR12MB2618.namprd12.prod.outlook.com (2603:10b6:5:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.19; Tue, 3 Mar
 2020 10:24:53 +0000
Received: from DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab]) by DM6PR12MB4251.namprd12.prod.outlook.com
 ([fe80::65a9:e78c:7f63:81ab%6]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 10:24:53 +0000
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Topic: [RFC PATCH 1/4] usb: xhci: Synopsys xHC consolidate TRBs
Thread-Index: AQHVtzsCoOCUmqsy60eqZZ0dzKJK/qfZO6UAgDcK6ICAB7aKAIACuDCAgBxoNgA=
Date:   Tue, 3 Mar 2020 10:24:53 +0000
Message-ID: <d485b110-2a81-e5db-6e76-c65c498550f3@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
 <08d08f2fd6da50e382852d014a08e371f2182382.1576848504.git.joglekar@synopsys.com>
 <3b09e3ef-d322-f8c8-f00a-34341509c350@linux.intel.com>
 <7d042091-66b5-c245-73c8-f4491ea037c3@synopsys.com>
 <85616a55-6f83-bd9d-b225-fa0ebe2d5862@linux.intel.com>
 <f304b12f-2e64-a1b2-5638-d4e71c30aeb0@synopsys.com>
In-Reply-To: <f304b12f-2e64-a1b2-5638-d4e71c30aeb0@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=joglekar@synopsys.com; 
x-originating-ip: [198.182.52.26]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a301cd52-e0bc-4953-ee79-08d7bf5d1cdb
x-ms-traffictypediagnostic: DM6PR12MB2618:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB2618FCEA61A618CFAA91DB4AA4E40@DM6PR12MB2618.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39860400002)(376002)(136003)(366004)(396003)(199004)(189003)(71200400001)(2616005)(36756003)(66476007)(66946007)(91956017)(66556008)(31696002)(64756008)(66446008)(6506007)(5660300002)(53546011)(76116006)(107886003)(6512007)(54906003)(6486002)(26005)(8676002)(4326008)(186003)(8936002)(478600001)(81156014)(316002)(81166006)(6916009)(31686004)(86362001)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR12MB2618;H:DM6PR12MB4251.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P9JxdFMtUmktS4y2R2GfhWqj5OWdFylqekUQSqLJrCpjlIBOzU4WMfe3rEU+BTzqrUM8YoR7oD5LPL6TVqO3RvSYwlmzLf68Ixqw5Njvd2BJBZ3CKmxPunwQfpvh7BOk2cO/g/5Rw0jDG4Yn1NstkqiJkz6wvfSIZmNTmUUEAsvTft+RNhXYctGoWJTZGuhMonoD41V2nUJ4bqE84KfXnY6o4ykV0lDZLkWhRvNchWYV0NU/UQ5lc4H//PThlB9QHQb7ayeN8KG/Tx42nFJ3JskJK0a4Jwe35LirYWt2J4I7infAcXoW8J5da/KK5K1N5I72h6f2ULhWb+IDPYcCUT2pUJ9lDucQQ4irmWQ3AMc98nP4LZp1DKgt+75v/N3YoAqyLZQp8bXZ2kD04TlHbTvne6QYFjGdQmw1C/8ik1nr4f83hwRhkPnpo1CnKMPO
x-ms-exchange-antispam-messagedata: LC52hWpUaLUAXS8YDFGAdfAhoUq/C0OPBcvefTyd1VKQ8LSt6TpZk/BVxod3ZIqBxw2uCK+oWJ6HKS+IWMO8d4rW5VExgpL+SCInX5sGlH9zgXtHntJxKhgKD9uDWMrKw6bBWYqskWQWLCVgQbQGrQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3F353E000252D44A46695176C2C2BF6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a301cd52-e0bc-4953-ee79-08d7bf5d1cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 10:24:53.1551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhIJpgow7SVlv9y0TUAwKOOtvu8SjKwohw1KTyshFgi07+DvbqgRkcKE/hsoH2xt/SJyngri2oDhnmuqFB+TiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2618
X-OriginatorOrg: synopsys.com
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiAyLzE0LzIwMjAgMjowNiBQTSwgVGVqYXMgSm9nbGVrYXIgd3JvdGU6DQo+IEhpLA0K
PiBPbiAyLzEyLzIwMjAgODozNCBQTSwgTWF0aGlhcyBOeW1hbiB3cm90ZToNCj4+IE9uIDcuMi4y
MDIwIDE5LjE3LCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4+PiBIaSwNCj4+PiBUaGFua3MgZm9y
IHRoZSByZXZpZXcgY29tbWVudHMuDQo+Pj4gT24gMS8zLzIwMjAgMTA6MTQgUE0sIE1hdGhpYXMg
TnltYW4gd3JvdGU6DQo+Pj4+IE9uIDIwLjEyLjIwMTkgMTUuMzksIFRlamFzIEpvZ2xla2FyIHdy
b3RlOg0KPj4+Pj4gVGhlIFN5bm9wc3lzIHhIQyBoYXMgYW4gaW50ZXJuYWwgVFJCIGNhY2hlIG9m
IHNpemUgVFJCX0NBQ0hFX1NJWkUgZm9yDQo+Pj4+PiBlYWNoIGVuZHBvaW50LiBUaGUgZGVmYXVs
dCB2YWx1ZSBmb3IgVFJCX0NBQ0hFX1NJWkUgaXMgMTYgZm9yIFNTIGFuZCA4DQo+Pj4+PiBmb3Ig
SFMuIFRoZSBjb250cm9sbGVyIGxvYWRzIGFuZCB1cGRhdGVzIHRoZSBUUkIgY2FjaGUgZnJvbSB0
aGUgdHJhbnNmZXINCj4+Pj4+IHJpbmcgaW4gc3lzdGVtIG1lbW9yeSB3aGVuZXZlciB0aGUgZHJp
dmVyIGlzc3VlcyBhIHN0YXJ0IHRyYW5zZmVyIG9yDQo+Pj4+PiB1cGRhdGUgdHJhbnNmZXIgY29t
bWFuZC4NCj4+Pj4+DQo+Pj4+PiBGb3IgY2hhaW5lZCBUUkJzLCB0aGUgU3lub3BzeXMgeEhDIHJl
cXVpcmVzIHRoYXQgdGhlIHRvdGFsIGFtb3VudCBvZg0KPj4+Pj4gYnl0ZXMgZm9yIGFsbCBUUkJz
IGxvYWRlZCBpbiB0aGUgVFJCIGNhY2hlIGJlIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0byAxDQo+
Pj4+PiBNUFMuIE9yIHRoZSBjaGFpbiBlbmRzIHdpdGhpbiB0aGUgVFJCIGNhY2hlICh3aXRoIGEg
bGFzdCBUUkIpLg0KPj4+Pj4NCj4+Pj4+IElmIHRoaXMgcmVxdWlyZW1lbnQgaXMgbm90IG1ldCwg
dGhlIGNvbnRyb2xsZXIgd2lsbCBub3QgYmUgYWJsZSB0byBzZW5kDQo+Pj4+PiBvciByZWNlaXZl
IGEgcGFja2V0IGFuZCBpdCB3aWxsIGhhbmcgY2F1c2luZyBhIGRyaXZlciB0aW1lb3V0IGFuZCBl
cnJvci4NCj4+Pj4+DQo+Pj4+PiBUaGlzIGNhbiBiZSBhIHByb2JsZW0gaWYgYSBjbGFzcyBkcml2
ZXIgcXVldWVzIFNHIHJlcXVlc3RzIHdpdGggbWFueQ0KPj4+Pj4gc21hbGwtYnVmZmVyIGVudHJp
ZXMuIFRoZSBYSENJIGRyaXZlciB3aWxsIGNyZWF0ZSBhIGNoYWluZWQgVFJCIGZvciBlYWNoDQo+
Pj4+PiBlbnRyeSB3aGljaCBtYXkgdHJpZ2dlciB0aGlzIGlzc3VlLg0KPj4+Pj4NCj4+Pj4+IFRo
aXMgcGF0Y2ggYWRkcyBsb2dpYyB0byB0aGUgWEhDSSBkcml2ZXIgdG8gZGV0ZWN0IGFuZCBwcmV2
ZW50IHRoaXMgZnJvbQ0KPj4+Pj4gaGFwcGVuaW5nLg0KPj4+Pj4NCj4+Pj4+IEZvciBldmVyeSAo
VFJCX0NBQ0hFX1NJWkUgLSAyKSBUUkJzLCB3ZSBjaGVjayB0aGUgdG90YWwgYnVmZmVyIHNpemUg
b2YNCj4+Pj4+IHRoZSBUUkJzIGFuZCBpZiB0aGUgY2hhaW4gY29udGludWVzIGFuZCB3ZSBkb24n
dCBtYWtlIHVwIGF0IGxlYXN0IDEgTVBTLA0KPj4+Pj4gd2UgY3JlYXRlIGEgYm91bmNlIGJ1ZmZl
ciB0byBjb25zb2xpZGF0ZSB1cCB0byB0aGUgbmV4dCAoNCAqIE1QUykgVFJCcw0KPj4+Pj4gaW50
byB0aGUgbGFzdCBUUkIuDQo+Pj4+Pg0KPj4+Pj4gV2UgY2hlY2sgYXQgKFRSQl9DQUNIRV9TSVpF
IC0gMikgYmVjYXVzZSBpdCBpcyBwb3NzaWJsZSB0aGF0IHRoZXJlIHdvdWxkDQo+Pj4+PiBiZSBh
IGxpbmsgYW5kL29yIGV2ZW50IGRhdGEgVFJCIHRoYXQgdGFrZSB1cCB0byAyIG9mIHRoZSBjYWNo
ZSBlbnRyaWVzLg0KPj4+Pj4gQW5kIHdlIGNvbnNvbGlkYXRlIHRoZSBuZXh0ICg0ICogTVBTKSB0
byBpbXByb3ZlIHBlcmZvcm1hbmNlLg0KPj4+Pj4NCj4+Pj4+IFdlIGRpc2NvdmVyZWQgdGhpcyBp
c3N1ZSB3aXRoIGRldmljZXMgb24gb3RoZXIgcGxhdGZvcm1zIGJ1dCBoYXZlIG5vdA0KPj4+Pj4g
eWV0IGNvbWUgYWNyb3NzIGFueSBkZXZpY2UgdGhhdCB0cmlnZ2VycyB0aGlzIG9uIExpbnV4LiBC
dXQgaXQgY291bGQgYmUNCj4+Pj4+IGEgcmVhbCBwcm9ibGVtIG5vdyBvciBpbiB0aGUgZnV0dXJl
LiBBbGwgaXQgdGFrZXMgaXMgTiBudW1iZXIgb2Ygc21hbGwNCj4+Pj4+IGNoYWluZWQgVFJCcy4g
QW5kIG90aGVyIGluc3RhbmNlcyBvZiB0aGUgU3lub3BzeXMgSVAgbWF5IGhhdmUgc21hbGxlcg0K
Pj4+Pj4gdmFsdWVzIGZvciB0aGUgVFJCX0NBQ0hFX1NJWkUgd2hpY2ggd291bGQgZXhhY2VyYmF0
ZSB0aGUgcHJvYmxlbS4NCj4+Pj4+DQo+Pj4+PiBXZSB2ZXJpZmllZCB0aGlzIHBhdGNoIHVzaW5n
IG91ciBpbnRlcm5hbCBkcml2ZXIgYW5kIHRlc3RpbmcgZnJhbWV3b3JrLg0KPj4+Pg0KPj4+Pg0K
Pj4+IEkgdW5kZXJzdGFuZCB0aGF0IGluIGEgZmlyc3QgbG9vayBpdCBsb29rcyBhIGNvbXBsZXgg
c29sdXRpb24sIGJ1dCB5b3UgY2FuIHN1Z2dlc3QNCj4+PiB0aGUgbW9kaWZpY2F0aW9ucy9jaGFu
Z2VzIHdoaWNoIHdvdWxkIGJlIHJlcXVpcmVkIHRvIG1ha2UgdGhlIHBhdGNoIG1vcmUgcmVhZGFi
bGUuDQo+Pj4gSSBoYXZlIHRyaWVkIHRvIGtlZXAgdGhlIGltcGxlbWVudGF0aW9uIHNpbWlsYXIg
dG8gYm91bmNlIGJ1ZmZlciBpbXBsZW1lbnRhdGlvbiANCj4+PiBvbmx5IHdpdGggYWRkaXRpb24g
b2YgYm91bmNlIGJ1ZmZlciBsaXN0LiBGb3IgdGhlIHNwaW5sb2NrIGNhc2UsIHlvdSBjYW4gdGFr
ZSBhIA0KPj4+IGNhbGwgaWYgaXQgaXMgcmVxdWlyZWQgb3Igbm90Lg0KPj4NCj4+IEluIHlvdXIg
Y2FzZSB5b3Uga25vdyB0aGUgbmVlZCBmb3IgYSBib3VuY2UgYnVmZmVyIG11Y2ggZWFybGllciB0
aGFuIGluIHRoZQ0KPj4gZXhpc3RpbmcgVEQgZnJhZ21lbnQgY2FzZS4NCj4+DQo+PiBIYXZlIHlv
dSBsb29rZWQgaW50byB0aGUgc3RydWN0IGhjX2RyaXZlciBtYXBfdXJiX2Zvcl9kbWEoKSBhbmQN
Cj4+IHVubWFwX3VyYl9mb3JfZG1hKCkgaG9va3M/IEluIHRob3NlIHlvdSBjb3VsZCBkZXRlY3Qg
dGhlIG5lZWQgZm9yIGEgYm91bmNlDQo+PiBidWZmZXIsIGFsbG9jYXRlIGl0LCBhbmQgYmx1bnRs
eSBjb3B5IGVudGlyZSBzY2F0dGVyZ2F0aGVyIGJ1ZmZlciB0byB0aGUgDQo+PiBib3VuY2UgYnVm
ZmVyLiBJdCBzaG91bGQgYmUgZmFpcmx5IHNtYWxsIGFueXdheS4NCj4+DQo+IEkgd2lsbCBsb29r
IGludG8gaXQsIGFuZCBnZXQgYmFjayB0byB5b3UuIFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24u
DQo+ICANCkkgbG9va2VkIGludG8gaXQgYW5kIEkgaGF2ZSBhIHF1ZXN0aW9uIHJlbGF0ZWQgdG8g
YXBwcm9hY2ggeW91IGhhdmUgc3VnZ2VzdGVkLg0KSSBjYW4gZGV0ZWN0IG5lZWQgZm9yIHRoZSBi
b3VuY2UgYnVmZmVyIGluIG1hcF91cmJfZm9yX2RtYSgpIGZ1bmN0aW9uIGFuZCBjYW4gYWxsb2Nh
dGUgYm91bmNlDQpidWZmZXIgYW5kIGJsdW50bHkgY29weSBpdCwgYnV0IHdoZW4gdGhlIFNHIGxp
c3QgaXMgaGF2aW5nIGRhdGEgb3ZlciBmZXcgTUIncywgSSB0aGluayANCm15IGJvdW5jZSBidWZm
ZXIgYWxsb2NhdGlvbiBtaWdodCBmYWlsLCBvdmVyIGEgcGVyaW9kLiBEbyB5b3UgdGhpbmsgaXQg
aXMgcG9zc2libGU/DQoNClNvIHRvIGF2b2lkIHRoYXQsIEkgdGhvdWdodCBvZiBoYXZpbmcgYSBs
aXN0IG9mIHN1Y2ggYm91bmNlIGJ1ZmZlcnMgaGVsZCB3aXRoIHRoZSBVUkIgYW5kIA0KdGhlbiBJ
IGNhbiBicmVhayB0aGUgU0cgbGlzdCB3aXRoIHNvbWUgZml4ZWQgZGF0YSBsZW5ndGggKGUuZyAx
NktCIG9yIDMyIEtCJ3MpIGJvdW5jZSBidWZmZXJzDQphbmQgY29weSB0aGUgU0cgaW50byB0aGF0
IGJvdW5jZSBidWZmZXIgbGlzdC4NCg0KQW5vdGhlciBvcHRpb24gaXMgdG8gY3JlYXRlIGEgYm91
bmNlIHNnLCBiYXNlZCBvbiBkZXRlY3Rpb24gb2YgYm91bmNlIGJ1ZmZlciByZXF1aXJlbWVudCwg
DQp3aGVyZSB0aGUgc21hbGwgc2l6ZSBTRydzIGFyZSBjb21iaW5lZCB0byBjcmVhdGUgYSBuZXcg
U0cgbGlzdCB3aGljaCBjYW4gc2F0aXNmeSB0aGUgDQpUUkIgY2FjaGUgcmVxdWlyZW1lbnQgZm9y
IHRoZSBTTlBTIGNvbnRyb2xsZXIuDQoNCldoYXQgZG8geW91IHN1Z2dlc3Q/IFdoaWNoIGlzIHRo
ZSBiZXN0IHdheSB0byBnbyBhYm91dCBzb2x2aW5nIHRoZSBwcm9ibGVtPw0KDQo+PiAtTWF0aGlh
cw0KPj4NCj4gDQo+IFJlZ2FyZHMsDQo+IFRlamFzIEpvZ2xla2FyDQo+IA0KDQpUaGFua3MgJiBS
ZWdhcmRzLA0KIFRlamFzIEpvZ2xla2FyDQoNCg==
