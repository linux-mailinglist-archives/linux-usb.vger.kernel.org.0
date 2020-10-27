Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E2529A990
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 11:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898063AbgJ0K0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Oct 2020 06:26:08 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:56984 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2898048AbgJ0K0H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Oct 2020 06:26:07 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 08F97C0344;
        Tue, 27 Oct 2020 10:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603794366; bh=poYBnGB756Hc6o4J2GGFby/7Em0iItC2ZQPES+I6ZrQ=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RMlwTftWL+xkXSkgdH8GQLjvYw0H8qLlONIwEv9hhOSC2wIfd+9lJRIrvmPcF3uu0
         f04cCegtjLK1AHV8fg7phdKJaAcwumeOJoPUYXjkJ/xOG9SelTJ4EB4z+kW4/d8rPJ
         RaHf+Pg/DLAiw0KB0CqzEcWhjkCT7A2S1PSZ5bz8bI5bE1Igte2RrgbpaiCUcz3Exm
         mVy45LmuNsrhYLwLg4yweWyXlLI/JXop5VMWgzu1eQ55X1lOuFHMatfK+mTuwoVv2s
         dKk70dYR8/FTVU2T5oksnpA8+zID5VXYo2OZqpggtsxmLJpYOVjrab4Mx1FDJd/Qa7
         YiSxRceTRASBQ==
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 4749BA008F;
        Tue, 27 Oct 2020 10:26:04 +0000 (UTC)
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2055.outbound.protection.outlook.com [104.47.46.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5E2B78027A;
        Tue, 27 Oct 2020 10:26:04 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=arturp@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="OFDroHEE";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KW5nzBgNuha8pMk/IAYyrXwidXKaxfNsdM/MJyvMLb9liXQQxpE11fdwyGR4qBr9+kNgOYkPguDQIEaJOGTc2t4+7HgVvlHdHCs4RWGrj4Jp46jSq8NpXOslVqOwIv/0psZkMLYJSERB8yamffaq9GmBDl0tUdse9UK+43xGhZMRH7vSDYGQoeBWGJHGn4fxZVcYZoOQjUMbolsiooxYy1zTqof/yOxfF/09/IYq6xl/mwqjY4KHwqNMT2viz3ElVJF0FHseUIUvLPV8xOQFXPEbvbvt6NpdKhi14vC5AVdJDNF33Ng4V/TAIo4KUjKfuo+OZXXDNlD2PRCAmWwwmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poYBnGB756Hc6o4J2GGFby/7Em0iItC2ZQPES+I6ZrQ=;
 b=gaaV3ZsC6i10C3ircbr7f12HMOpobDytXAlEfBNCme8mB0Wzd+Xxvtub/XAIBjcQYORDdOqCm0E8PItkKsbPX8PrXm+dK3lJcVeAQu9SrD1Ie81KXAvtajNRZUeqGT6dm4FFuQMWsh+aAMmRP8Yfo95fxXP8aCus0wFEoJfzgGC4D3EGGs43KK1pi61GkGhy9slDQlK5QWEuoYEvhOdk6eFOBzvtp6vAciNS50Fgm7x7vv0VxERMa9G3Aw0dd47weUrHKZbBLG1eQ1mWrrAEvylgeQAq4V846ihmwPzN+0wmPjKM/0i1o/xXCEA8Fz9XwgirVN57ok/UsOgZyhr48Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poYBnGB756Hc6o4J2GGFby/7Em0iItC2ZQPES+I6ZrQ=;
 b=OFDroHEEp5f7tj/Fw6LLgNs8aQAkTPbwhP1X63ip4UJb3QR7TD7OTtN6ND15IU7w1z36jhvCQ2zACxpBI8/8xLCllxM9Sdpxdm5KS4gRkr9N7cUbQFcTu4Vy2ZSv62XRvmY2C/YARLtokA0QHXAHgvjdCIfENPOy0ePq4T+pmz4=
Received: from MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 by MW3PR12MB4571.namprd12.prod.outlook.com (2603:10b6:303:5c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 27 Oct
 2020 10:26:00 +0000
Received: from MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::f527:17c8:b473:bcdd]) by MW3PR12MB4428.namprd12.prod.outlook.com
 ([fe80::f527:17c8:b473:bcdd%9]) with mapi id 15.20.3499.018; Tue, 27 Oct 2020
 10:26:00 +0000
X-SNPS-Relay: synopsys.com
From:   Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v2 01/15] usb: dwc2: Fix/update enter/exit partial power
 down.
Thread-Topic: [PATCH v2 01/15] usb: dwc2: Fix/update enter/exit partial power
 down.
Thread-Index: AQHWn9WQTGvvTIG0qU26/nCvKvs1MqmrNKSAgAAi0IA=
Date:   Tue, 27 Oct 2020 10:26:00 +0000
Message-ID: <c4ea45e2-e7d4-1299-ced6-c93689546f2c@synopsys.com>
References: <20201011135059.76B73A005E@mailhost.synopsys.com>
 <87d014dqpo.fsf@kernel.org>
In-Reply-To: <87d014dqpo.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [176.32.192.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8126877-3c26-4afa-1900-08d87a62b350
x-ms-traffictypediagnostic: MW3PR12MB4571:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR12MB4571B7D2A3A1A220B16C089AA7160@MW3PR12MB4571.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o6dqxLkX3PX3IVE+tIJliGsvNsiznDMMujvB9rNMX8U/6V0+QIfEN6IcZKyUP9WTd2GUk9Cez9P7p7xom3QSiCKoL9rSgoa9ieMsdOaDVDRa57oyrazdHlDijTz2W2htyGBoeLVUlqAhal261oDEwZzpC2aCXXIIAQ+4en5uU3e2rZWwb3hTQ3H4sTm+8uBMNfweh5Yj1yogjORFXG3OFnfYJePWTKEUe+XciRarxZjSr+QSTFIdWBWxINehOOhVDra8+thZvCm+zHVYJs1zun9WoGWemWdl58qSZe9u9U3e6eRoQTGNNFNknvepKLhsuKQqdw3qsorwdqsz8nKIDFKgr3XWTajwT8iYOJFhJYRP1xpRQTR9Q8cLzJT3euLO8RpiudlIEe+CjNc78SQX5g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4428.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(83380400001)(8936002)(31686004)(53546011)(110136005)(55236004)(15650500001)(5660300002)(8676002)(107886003)(6506007)(6512007)(71200400001)(316002)(4326008)(966005)(186003)(66556008)(2906002)(6486002)(66476007)(31696002)(36756003)(64756008)(76116006)(26005)(66946007)(478600001)(66446008)(86362001)(91956017)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Pa9/rVp4hBE6mg+qsoJ053Tyq2zoFZmu8O6iAxz9W1Fx9gVDFo4KQ8Jqp5RcoOVj1lQzMfdiOYm+wv+wvPw2UPtrZ02hHImRx/6CbJWJYJw4b/L++0tBeNQ6dMaKaILC6A0tbTRnSD2l0Re5BO3DJuckdHlYXKCNHhE5HJe7bx2C8bRGFa0zxD7H3OR7MuBPvHhthkumUsmJRH+LWiUk6hEjcrCboyz6xTU30lW7YviNO0k+/Hi5rnZTR2DLApTIno74ZksCzPRFQM4inXM1Kys57kYa8gQqLD7KVdDFJ/Oo7JDZ8aRM5wxE/uVZtRwlLNATZ1JQM1KJR4FAe0SHtp/jrBOINUt859md25N0GYUod2Sh56pQRRCUw4L5wbJSiQhgagDGGc9twCJoL3exy8EDp0cdmhJ2FwC2aWZ4hAf1O0A3t/lgWiY9+4kS/Qw716n4b6c4Dj6twQPI9WsC0FlEa5POaxTGpjuD+Jrdtwp9HjNPLveZI4qmvWoXfL7ElLOY05Z4K9klNayhyKbKS0pfzAoiohBsvg+LHiPYbAbC4qbhD1Bmo1OePIdWtQYOgdOu6jT6uPi+PVWVYiRked99KG1g/4pKP9Th6a1N2xzVClZX7zX8rFP5fC8Pgm/pxdeRT8zCOYAiBv3+d4Mo9Q==
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B9712808D6DE14E90F6A9DF83219D8D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4428.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8126877-3c26-4afa-1900-08d87a62b350
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 10:26:00.5435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3xORgZn7syA4jGdyEWGvBzDmr9/b5iNKhlkRsTlTjQJ+VIYwFsrpnWfF2RInMTQDiyDNXjte7mR/TIcGcU/wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4571
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgRmVsaXBlLA0KDQpPbiAxMC8yNy8yMDIwIDEyOjIxLCBGZWxpcGUgQmFsYmkgd3JvdGU6DQo+
IA0KPiBIaSBBcnRodXIsDQo+IA0KPiBiZWZvcmUgSSByZXZpZXcgeW91ciBzZXJpZXMsIHRoZXJl
IGFyZSBmZXcgdGhpbmdzIEknZCBsaWtlIHRvIHBvaW50IG91dDoNCj4gDQo+IDEuIEEgc2luZ2xl
IHBhdGNoIHNob3VsZCBkbyBvbmUgdGhpbmcgYW5kIG9uZSB0aGluZyBvbmx5DQo+IA0KPiAyLiBF
dmVyeSBzaW5nbGUgcGF0Y2ggc2hvdWxkIGNvbXBpbGUgYW5kIHdvcmsgb24gaXRzIG93bg0KPiAN
Cj4gMy4gV2hlbiBzZW5kaW5nIGEgc2VyaWVzLCByZW1lbWJlciB0byBpbmNsdWRlIGEgY292ZXIg
bGV0dGVyDQo+IA0KPiA0LiBXaGVuIHNlbmRpbmcgYSBzZXJpZXMsIHlvdSBjYW4gcmVseSBvbiBn
aXQgdG8gcHJvZHVjZSBhIHRocmVhZCB3aXRoIGENCj4gICAgIGNvdmVyIGxldHRlcg0KPiANCj4g
CWdpdCBmb3JtYXQtcGF0Y2ggLW8gc2VyaWVzIC0tY292ZXItbGV0dGVyIEhFQUR+MTUuLg0KPiAN
Cj4gNS4gUmVtZW1iZXIgdG8gcnVuIGNoZWNrcGF0Y2ggb24gZXZlcnkgcGF0Y2gNCj4gDQo+IDYu
IFBsZWFzZSwgcmVhZCBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9wcm9j
ZXNzL3N1Ym1pdC1jaGVja2xpc3QuaHRtbA0KVGhlIGFib3ZlIHN0YXRlbWVudHMgYXJlIG9mIGNv
dXJzZSBkb25lIGJlZm9yZSBzdWJtaXR0aW5nIHRvIExLTUwuDQpNb3Jlb3ZlciBlYWNoIHBhdGNo
IGlzIGZpcnN0IG9mIGFsbCB0ZXN0ZWQgdXNpbmcgSmVua2lucywgYW5kIHBhc3NlZCBhIA0KcmV2
aWV3IHByb2Nlc3Mgb24gZ2Vycml0Lg0KRGlkIHlvdSBzZWUgYW55IGJ1aWxkIGVycm9yPyBvciBj
aGVja3BhdGNoIGVycm9yPw0KDQo+IA0KPiBBcnR1ciBQZXRyb3N5YW4gPEFydGh1ci5QZXRyb3N5
YW5Ac3lub3BzeXMuY29tPiB3cml0ZXM6DQo+PiAtIFVwZGF0ZWQgZW50ZXJpbmcgYW5kIGV4aXRp
bmcgcGFydGlhbCBwb3dlciBkb3duIGZ1bmN0aW9uDQo+PiAgICBmbG93LiBCZWZvcmUgdGhlcmUg
d2FzIGEgbG90IG9mIGNvbmZ1c2lvbnMgd2l0aCBjb3JlDQo+PiAgICBlbnRlcmluZyB0byBwYXJ0
aWFsIHBvd2VyIGRvd24gaW4gZGV2aWNlIG9yIGhvc3QgbW9kZS4NCj4+DQo+PiAtIEFkZGVkICJy
ZW1fd2FrZXVwIiBmb3IgaG9zdCBleGl0aW5nIGZyb20gUGFydGlhbCBQb3dlcg0KPj4gICAgRG93
biBtb2RlIGZyb20gaG9zdCByZW1vdGUgd2FrZXVwIGZsb3cuIEFjY29yZGluZyB0bw0KPj4gICAg
cHJvZ3JhbW1pbmcgZ3VpZGUgaW4gaG9zdCBtb2RlLCBwb3J0IHBvd2VyIG11c3QgYmUNCj4+ICAg
IHR1cm5lZCBvbiB3aGVuIHdha2V1cCBpcyBkZXRlY3RlZC4NCj4+DQo+PiAtIEFkZGVkICJpbl9w
cGQiIGZsYWcgdG8gaW5kaWNhdGUgdGhlIGNvcmUgc3RhdGUgYWZ0ZXINCj4+ICAgIGVudGVyaW5n
IGludG8gUGFydGlhbCBQb3dlciBEb3duIG1vZGUuDQo+Pg0KPj4gLSBNb3ZlZCBzZXR0aW5nIG9m
IGx4X3N0YXRlIGludG8gcGFydGlhbCBwb3dlciBkb3duDQo+PiAgICBzcGVjaWZpYyBmdW5jdGlv
bnMuDQo+Pg0KPj4gLSBBZGRlZCBkZXZfZGJnKCkgbWVzc2FnZXMgd2hlbiBlbnRlcmluZyBhbmQg
ZXhpdGluZyBmcm9tDQo+PiAgICBwYXJ0aWFsIHBvd2VyIGRvd24uDQo+Pg0KPj4gLSBEdXJpbmcg
UGFydGlhbCBQb3dlciBEb3duIGV4aXQgcmVseSBvbiBiYWNrdXBlZCB2YWx1ZSBvZg0KPj4gICAg
IkdPVEdDVExfQ1VSTU9ERV9IT1NUIiB0byBkZXRlcm1pbmUgdGhlIG1vZGUgb2YgY29yZQ0KPj4g
ICAgYmVmb3JlIGVudGVyaW5nIHRvIFBQRC4NCj4+DQo+PiAtIFNldCBtaXNzaW5nICJEQ1RMX1BX
Uk9OUFJHRE9ORSIgYml0IHdoZW4gZXhpdGluZyBkZXZpY2UNCj4+ICAgIHBhcnRpYWwgcG93ZXIg
ZG93biBhY2NvcmRpbmcgdG8gcHJvZ3JhbW1pbmcgZ3VpZGUuDQo+Pg0KPj4gLSBBZGRlZCBtaXNz
aW5nIHJlc3RvcmUgb2YgRENGRyByZWdpc3RlciBpbiBkZXZpY2UgbW9kZQ0KPj4gICAgYWNjb3Jk
aW5nIHRvIHByb2dyYW1taW5nIGd1aWRlLg0KPiANCj4gIEZyb20gYSBxdWljayByZWFkLCBpdCBz
ZWVtcyBsaWtlIGVhY2ggb2YgdGhlc2UgdG9waWNzIGRlc2VydmUgYSBwYXRjaCBvZg0KPiBpdHMg
b3duLiBDb3VsZCB5b3UgYnJlYWsgdGhpcyBkb3duIGludG8gc21hbGxlciBwYXRjaGVzPyBBbHNv
LCB5b3UgaGF2ZQ0KPiBjb2xsZWFndWVzIHdobyBoYXZlIGJlZW4gZGVhbGluZyB3aXRoIHRoZSBj
b21tdW5pdHkgZm9yIGEgbG9uZyB0aW1lLA0KPiBwZXJoYXBzIGFzayB0aGVtIHRvIGRvIGFuIGlu
dGVybmFsIHJvdW5kIG9mIHJldmlldyBiZWZvcmUgc3VibWl0dGluZz8NCj4gDQo+IFRoYXQgbWF5
IGhlbHAgeW91IGdldCB5b3VyIHBhdGNoZXMgbWVyZ2VkIGluIGEgdGltZWx5IG1hbm5lci4NCj4g
DQpJIHdpbGwgd29yayBvbiBicmVha2luZyB0aGlzIHBhdGNoIGRvd24gaW50byBzbWFsbGVyIHBh
dGNoZXMgSSBjb3VsZCBkbyANCnRoaXMgYmVmb3JlIG9mIGNvdXJzZSB0aGUgcmVhc29uIEkgZGlk
bid0IGJyZWFrIHRoZW0gZG93biB3YXMgdGhhdCBJIA0KZGlkbid0IHdhbnQgdG8gbWFrZSB0aGUg
cGF0Y2ggc2VyaWVzIHNvIGJpZy4NCkJ1dCBhcyBpdCBpcyBuZWNlc3NhcnkgSSB3aWxsIGRvIGl0
Lg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgYWR2aWNlLiBJIHdpbGwgYWxzbyBpbnZp
dGUgdGhlIGNvbGxlYWd1ZXMgdG8gDQp0ZXN0IG9yIGdpdmUgYSByZXZpZXcuDQoNClJlZ2FyZHMs
DQpBcnR1cg0K
