Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9EE2207C23
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 21:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391283AbgFXT0s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 15:26:48 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:52028 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391257AbgFXT0r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 15:26:47 -0400
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5730940107;
        Wed, 24 Jun 2020 19:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593026807; bh=7QoyTVOEMYAyKfNJDIImoSfp+FyoqAwuyXXt75vOfzc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=U/o58gCLzCahQrrZKj0n1WrLcVpgzuKxfbuDOJ1yL2e3DDeC+HISceeZp+3gJrCz9
         MsbzPZmktUlZj4Qy0+5QO6z7MW2GJU7RMcQum/lbVyYFZmuYwaJorvqBqC1Pvm/Q0K
         ocyJW9Cxp3QmlOSru2xZslLA/RLStcp9+TRE7qifHlUtCy37F/e1GWfGAEDaxgkI3f
         ycgncHmvngwuZyQeZ4hl563bb8XRcsoUFrHz4veFlBSrQW+4IiAxlGjZ+ivh8RMNWr
         AyMKomBtkX+JiH9trEE1hT3pKjG9irfx6hhFVr35q9AFzK+qzfYcbI+vGrvCEer7Mh
         CWgsdhZe6t3/g==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 697CBA006E;
        Wed, 24 Jun 2020 19:26:45 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D0041400BA;
        Wed, 24 Jun 2020 19:26:44 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="FcjH82oO";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9mG7TCKoA08aQ0aUFM5PGYC0yNLFdSlAw6ogRkhHBxFmsvNsqXonRI9T9HOJAPmVWXwnn45yEY5LtDFGXV64GUzYdqzWLW/s4r2nDXPKZzqPDv900Nv9TnbHtIxQxHEhM7tLWRfePNk/zUli9CYSNUmqM9IqwgUrgfwVXL55V4JoqQ24M7s6F1isPsdtfqgjUmtxaQDiPiBnf5F6D7BkgvsaG+jebp8iNrnO/8E1RgHzib1qhgQtS97kLK3HyzRfHD57G7Yfx5rKcfcfA/HTELaHRA6blKAuH7PkaEGlGdNsbgbnbriLK8Z8lOYmrr2DpryHWPIGylUdhl+Ffzg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QoyTVOEMYAyKfNJDIImoSfp+FyoqAwuyXXt75vOfzc=;
 b=WibMGnjdvpBb1N8u9gIPRE55qluCNqtnh8M/IvI+ff+bO/aGadVZ06WaRTYC0qkUDIgO2zDB0yh2az4zeDT+N9J6N2D7op1AXMwGLwOqfDoyet0L8eBuexUEx4vuDdQvnNB4bnsrkUHsLAVOaFhbxuYjFOzscCFh+y2INT/qKwNlQskx0HIC3JGCDO4MwHvAsIOwNHXM2FFQjS4T1u5U5ujMp6XAh37q6H3uDDb/JYzoEK9JXRVP2bvXXVBSKaDOr8MCoTiFBRsLIxXU5Fp9BINnI0s1FG2Cq4+1IoL8dAwaiLfomphYdPf4fbnHU5Ea4vLUf0GNAng7Bo28eG8JXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7QoyTVOEMYAyKfNJDIImoSfp+FyoqAwuyXXt75vOfzc=;
 b=FcjH82oONZc7mkf5l87zt/+m/d3BqK7jxUMZTNfZcLxMOrTHMoAbY3ODgmqufCvzf27+ewWVSQqBNHJ5M12iZmhSc5Z38njbu/ZwUjSMagclKSwYYWtrZ9hVnou0iNkNo564EJBvp4Rn7lx07p+Jwt77088ez0GEClsaaPUDYYo=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 19:26:42 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 19:26:42 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWSjaj2amBwerG90am9uwqnJYeDKjoJlmA
Date:   Wed, 24 Jun 2020 19:26:42 +0000
Message-ID: <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-2-m.grzeschik@pengutronix.de>
In-Reply-To: <20200624144907.9604-2-m.grzeschik@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02673d42-8701-4a0b-cf25-08d818748692
x-ms-traffictypediagnostic: BY5PR12MB4290:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB4290EE3614B446197694D527AA950@BY5PR12MB4290.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iZMnaFIPw6OaJE3JOrvT6iF6f7ywnAfpNcKS46T7P9d9xAWp1PnPinox4dqb0zsbkBksEOEEfOoT+/4YF00t7yJYyAxqRq5wegl6UD7haikd/W52jcqyDeRJjEEsZxqbPtoJPvaDquNfghhanXJXlRNbOHbinWAQZCWnL29dkgHB+6x6kCRKNkm4+ccDq1YSfA69u981u/hnOSpHqfeCbYO6ouwOC+3ttw+uockaHc+tX8JxxgIIo8QseEroWQeQJ6Hqh4ReaYkAvXnh1eQswBAHMiSKNm8e/LZ1+ad/jox0t1f5frd2Kf55H2Dg3jgrVaDcj6OTAWRNvUCIMYGkJfBxqLwwtmzG3K+GaT2OQWpXG5xKnpRYJq0H8Mh7HlWvbXElRVjLw8bJMXOOvOqS8M3hx8+Nv5JCfl6gUwPf4Qw9ypUEA/lRLdhT23AfGRVRpcB66lLBHlbtWeLal87jxOiC0mGHWgf+i5vy1qhC3EyYkJeb6uwjg5v8OiQVV7i1bdkJfcTiHBpxF19oYtbiEKdcCSmcBnMYpvDzAuI4vLPhW26rPfZ4JcN5sPrL+78tjX66UgP/8ft4/q1vKbZ4RQMXJa0Jl868jEbX70rOPNat7IztcasgZUSyKC4OyPWX1LUDzvjEFNt3TBa76APnTg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(136003)(366004)(39860400002)(26005)(83380400001)(2616005)(8676002)(54906003)(8936002)(110136005)(316002)(31686004)(31696002)(86362001)(71200400001)(66446008)(64756008)(66556008)(76116006)(6506007)(2906002)(66476007)(478600001)(4326008)(36756003)(6486002)(66946007)(5660300002)(186003)(6512007)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: WVnDitOo/Vdm4Z/iw43Xic52hE72I2WwD0pc+j1vLJ6Qjyl+vFhZQ1QCk3BijnJlCt63X1YAFE0qdIjyZSjyogeiHzQ8GaAsWCFYdAL5SoOkRa0niCdxsOB2/okQrmgqFGHayWEiBhpHlLNLnluyv2BCqUNmpTzhbPIF7d4swhBqqne8ua2YyJn/iOiKFcIySPmje85Sllel8CK36sWTqIak+giWUrI3rXjnDrFw0lzoEYv5MeUtn0VFaNPqkGMZ6vhxjAunlKS9hHAAcItclMK2ByfyJanqex7Q3OlB93flZbpK0bN+IQWgXE9DKfKJCVUYUTZgv9J5DUCjKS9uGCOVyXQqETM44hlbUdG3IGCBSndC28MLEdkl1xMYGIHNA1Bbghm9IGtyOUo5+afN+ZacVH/HWUWEqriC0NvJMYHabYbeZNvo5wvE5RkRcCFOVOBGENH3H0YtKlcPp6MaeO0ZK9CTMhICkYdX/eFBzo8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4B04D76C6B9F7479C2CB83433380090@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02673d42-8701-4a0b-cf25-08d818748692
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 19:26:42.5466
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fXkMZSavHNEuaAsm9AG8ZTvmzTSMTEBj9PkR8XR7hDPbvJH2iLFNAhhOaXxusT3ha6TSEet3i5UlnZScxZQ0KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQoNCk1pY2hhZWwgR3J6ZXNjaGlrIHdyb3RlOg0KPiBGcm9tOiBNaWNoYWVsIE9sYnJpY2gg
PG0ub2xicmljaEBwZW5ndXRyb25peC5kZT4NCj4NCj4gQ3VycmVudGx5IF9fZHdjM19nYWRnZXRf
c3RhcnRfaXNvYyBtdXN0IGJlIGNhbGxlZCB2ZXJ5IHNob3J0bHkgYWZ0ZXINCj4gWGZlck5vdFJl
YWR5LiBPdGhlcndpc2UgdGhlIGZyYW1lIG51bWJlciBpcyBvdXRkYXRlZCBhbmQgc3RhcnQgdHJh
bnNmZXINCj4gd2lsbCBmYWlsLCBldmVuIHdpdGggc2V2ZXJhbCByZXRyaWVzLg0KDQpEaWQgeW91
IHRyeSB3aXRoIHRoZSByZWNlbnQgdXBkYXRlIGZvciBpc29jPyAoZS5pLiwgYWZ0ZXIgNSANClNU
QVJUX1RSQU5TRkVSIGZhaWx1cmVzLCB0aGUgZHJpdmVyIHdpbGwgaXNzdWUgRU5EX1RSQU5TRkVS
IHRvIHJldHJ5IG9uIA0KdGhlIG5leHQgWGZlck5vdFJlYWR5IGV2ZW50KQ0KDQpMZXQgbWUga25v
dyBpZiB5b3Ugc3RpbGwgcnVuIGludG8gaXNzdWVzIHdpdGggdGhhdC4NCg0KPg0KPiBEU1RTIHBy
b3ZpZGVzIHRoZSBsb3dlciAxNCBiaXQgb2YgdGhlIGZyYW1lIG51bWJlci4gVXNlIGl0IGluIGNv
bWJpbmF0aW9uDQo+IHdpdGggdGhlIGZyYW1lIG51bWJlciBwcm92aWRlZCBieSBYZmVyTm90UmVh
ZHkgdG8gZ3Vlc3MgdGhlIGN1cnJlbnQgZnJhbWUNCj4gbnVtYmVyLiBUaGlzIHdpbGwgc3VjY2Vl
ZCB1bmxlc3MgbW9yZSB0aGFuIG9uZSAxNCByb2xsb3ZlciBoYXMgaGFwcGVuZWQNCj4gc2luY2Ug
WGZlck5vdFJlYWR5Lg0KPg0KPiBTdGFydCB0cmFuc2ZlciBtaWdodCBzdGlsbCBmYWlsIGlmIHRo
ZSBmcmFtZSBudW1iZXIgaXMgaW5jcmVhc2VkDQo+IGltbWVkaWF0ZWx5IGFmdGVyIERTVFMgaXMg
cmVhZC4gU28gcmV0cmllcyBhcmUgc3RpbGwgbmVlZGVkLg0KPiBEb24ndCBkcm9wIHRoZSBjdXJy
ZW50IHJlcXVlc3QgaWYgdGhpcyBoYXBwZW5zLiBUaGlzIHdheSBpdCBpcyBub3QgbG9zdCBhbmQN
Cj4gY2FuIGJlIHVzZWQgaW1tZWRpYXRlbHkgdG8gdHJ5IGFnYWluIHdpdGggdGhlIG5leHQgZnJh
bWUgbnVtYmVyLg0KPg0KPiBXaXRoIHRoaXMgY2hhbmdlLCBfX2R3YzNfZ2FkZ2V0X3N0YXJ0X2lz
b2MgaXMgc3RpbGwgbm90IHN1Y2Nlc3NmdWxseSBpbiBhbGwNCj4gY2FzZXMgYml0IGl0IGluY3Jl
YXNlcyB0aGUgYWNjZXB0YWJsZSBkZWxheSBhZnRlciBYZmVyTm90UmVhZHkNCj4gc2lnbmlmaWNh
bnRseS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBPbGJyaWNoIDxtLm9sYnJpY2hAcGVu
Z3V0cm9uaXguZGU+DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJldHRlciA8bS50cmV0dGVy
QHBlbmd1dHJvbml4LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEdyemVzY2hpayA8bS5n
cnplc2NoaWtAcGVuZ3V0cm9uaXguZGU+DQo+DQo+IC0tLQ0KPiB2MSAtPiB2MjogLSByZW1vdmVk
IGxhc3RfZnJhbWVfbnVtYmVyIGZyb20gc3RydWN0DQo+ICAgICAgICAgICAgLSBpbmNsdWRlZCBy
b2xsb3ZlciB2YXJpYWJsZQ0KPg0KPiAgIGRyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgfCAzNyAr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gaW5k
ZXggNDIxYTBmNzMxMTBhNDBiLi4wOTYyZGRkN2ZiZjZhZTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0K
PiBAQCAtMTI3Niw3ICsxMjc2LDcgQEAgc3RhdGljIHZvaWQgZHdjM19wcmVwYXJlX3RyYnMoc3Ry
dWN0IGR3YzNfZXAgKmRlcCkNCj4gICANCj4gICBzdGF0aWMgdm9pZCBkd2MzX2dhZGdldF9lcF9j
bGVhbnVwX2NhbmNlbGxlZF9yZXF1ZXN0cyhzdHJ1Y3QgZHdjM19lcCAqZGVwKTsNCj4gICANCj4g
LXN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9raWNrX3RyYW5zZmVyKHN0cnVjdCBkd2MzX2VwICpk
ZXApDQo+ICtzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfa2lja190cmFuc2ZlcihzdHJ1Y3QgZHdj
M19lcCAqZGVwLCBib29sIGtlZXBfcmVxKQ0KDQpBbnkgcmVhc29uIHRvIGhhdmUga2VlcF9yZXE/
IFdpdGggdGhlIHJlY2VudCBjaGFuZ2VzLCBpZiANCmR3YzNfc2VuZF9nYWRnZXRfZXBfY21kKCkg
cmV0dXJucyAtRUFHQUlOLCB0aGVuIHRoZSBjb250cm9sbGVyIGRyaXZlciANCndvbid0IGdpdmUg
YmFjayB0aGUgcmVxdWVzdC4NCg0KPiAgIHsNCj4gICAJc3RydWN0IGR3YzNfZ2FkZ2V0X2VwX2Nt
ZF9wYXJhbXMgcGFyYW1zOw0KPiAgIAlzdHJ1Y3QgZHdjM19yZXF1ZXN0CQkqcmVxOw0KPiBAQCAt
MTMxNCwxMiArMTMxNCw5IEBAIHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9raWNrX3RyYW5zZmVy
KHN0cnVjdCBkd2MzX2VwICpkZXApDQo+ICAgCX0NCj4gICANCj4gICAJcmV0ID0gZHdjM19zZW5k
X2dhZGdldF9lcF9jbWQoZGVwLCBjbWQsICZwYXJhbXMpOw0KPiAtCWlmIChyZXQgPCAwKSB7DQo+
ICsJaWYgKHJldCA8IDAgJiYgKCFrZWVwX3JlcSB8fCByZXQgIT0gLUVBR0FJTikpIHsNCj4gICAJ
CXN0cnVjdCBkd2MzX3JlcXVlc3QgKnRtcDsNCj4gICANCj4gLQkJaWYgKHJldCA9PSAtRUFHQUlO
KQ0KPiAtCQkJcmV0dXJuIHJldDsNCj4gLQ0KPiAgIAkJZHdjM19zdG9wX2FjdGl2ZV90cmFuc2Zl
cihkZXAsIHRydWUsIHRydWUpOw0KPiAgIA0KPiAgIAkJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KHJlcSwgdG1wLCAmZGVwLT5zdGFydGVkX2xpc3QsIGxpc3QpDQo+IEBAIC0xMzM1LDcgKzEzMzIs
NyBAQCBzdGF0aWMgaW50IF9fZHdjM19nYWRnZXRfa2lja190cmFuc2ZlcihzdHJ1Y3QgZHdjM19l
cCAqZGVwKQ0KPiAgIAlpZiAoZGVwLT5zdHJlYW1fY2FwYWJsZSAmJiByZXEtPnJlcXVlc3QuaXNf
bGFzdCkNCj4gICAJCWRlcC0+ZmxhZ3MgfD0gRFdDM19FUF9XQUlUX1RSQU5TRkVSX0NPTVBMRVRF
Ow0KPiAgIA0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAg
IHN0YXRpYyBpbnQgX19kd2MzX2dhZGdldF9nZXRfZnJhbWUoc3RydWN0IGR3YzMgKmR3YykNCj4g
QEAgLTE0NTgsNyArMTQ1NSw3IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRnZXRfc3RhcnRfaXNvY19x
dWlyayhzdHJ1Y3QgZHdjM19lcCAqZGVwKQ0KPiAgIAlkZXAtPnN0YXJ0X2NtZF9zdGF0dXMgPSAw
Ow0KPiAgIAlkZXAtPmNvbWJvX251bSA9IDA7DQo+ICAgDQo+IC0JcmV0dXJuIF9fZHdjM19nYWRn
ZXRfa2lja190cmFuc2ZlcihkZXApOw0KPiArCXJldHVybiBfX2R3YzNfZ2FkZ2V0X2tpY2tfdHJh
bnNmZXIoZGVwLCBmYWxzZSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgX19kd2MzX2dh
ZGdldF9zdGFydF9pc29jKHN0cnVjdCBkd2MzX2VwICpkZXApDQo+IEBAIC0xNDgxLDkgKzE0Nzgs
MjUgQEAgc3RhdGljIGludCBfX2R3YzNfZ2FkZ2V0X3N0YXJ0X2lzb2Moc3RydWN0IGR3YzNfZXAg
KmRlcCkNCj4gICAJfQ0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgRFdDM19JU09DX01BWF9S
RVRSSUVTOyBpKyspIHsNCj4gLQkJZGVwLT5mcmFtZV9udW1iZXIgPSBEV0MzX0FMSUdOX0ZSQU1F
KGRlcCwgaSArIDEpOw0KPiArCQkvKg0KPiArCQkgKiBmcmFtZV9udW1iZXIgaXMgc2V0IGZyb20g
WGZlck5vdFJlYWR5IGFuZCBtYXkgYmUgYWxyZWFkeQ0KPiArCQkgKiBvdXQgb2YgZGF0ZS4gRFNU
UyBvbmx5IHByb3ZpZGVzIHRoZSBsb3dlciAxNCBiaXQgb2YgdGhlDQo+ICsJCSAqIGN1cnJlbnQg
ZnJhbWUgbnVtYmVyLiBTbyBhZGQgdGhlIHVwcGVyIHR3byBiaXRzIG9mDQo+ICsJCSAqIGZyYW1l
X251bWJlciBhbmQgaGFuZGxlIGEgcG9zc2libGUgcm9sbG92ZXIuDQo+ICsJCSAqIFRoaXMgd2ls
bCBwcm92aWRlIHRoZSBjb3JyZWN0IGZyYW1lX251bWJlciB1bmxlc3MgbW9yZSB0aGFuDQo+ICsJ
CSAqIHJvbGxvdmVyIGhhcyBoYXBwZW5lZCBzaW5jZSBYZmVyTm90UmVhZHkuDQo+ICsJCSAqLw0K
PiArCQl1MzIgZnJhbWUgPSBfX2R3YzNfZ2FkZ2V0X2dldF9mcmFtZShkd2MpOw0KPiArCQlib29s
IHJvbGxvdmVyID0gZnJhbWUgPCAoZGVwLT5mcmFtZV9udW1iZXIgJiAweDNmZmYpOw0KPiArDQo+
ICsJCWRlcC0+ZnJhbWVfbnVtYmVyID0gKGRlcC0+ZnJhbWVfbnVtYmVyICYgfjB4M2ZmZikgfCBm
cmFtZTsNCj4gKwkJaWYgKHJvbGxvdmVyKQ0KPiArCQkJZGVwLT5mcmFtZV9udW1iZXIgKz0gQklU
KDE0KTsNCj4gKw0KPiArCQlkZXAtPmZyYW1lX251bWJlciA9IERXQzNfQUxJR05fRlJBTUUoZGVw
LCAxKTsNCj4gICANCj4gLQkJcmV0ID0gX19kd2MzX2dhZGdldF9raWNrX3RyYW5zZmVyKGRlcCk7
DQo+ICsJCXJldCA9IF9fZHdjM19nYWRnZXRfa2lja190cmFuc2ZlcihkZXAsDQo+ICsJCQkJaSAr
IDEgPCBEV0MzX0lTT0NfTUFYX1JFVFJJRVMpOw0KPiAgIAkJaWYgKHJldCAhPSAtRUFHQUlOKQ0K
PiAgIAkJCWJyZWFrOw0KPiAgIAl9DQo+IEBAIC0xNTY3LDcgKzE1ODAsNyBAQCBzdGF0aWMgaW50
IF9fZHdjM19nYWRnZXRfZXBfcXVldWUoc3RydWN0IGR3YzNfZXAgKmRlcCwgc3RydWN0IGR3YzNf
cmVxdWVzdCAqcmVxKQ0KPiAgIAkJfQ0KPiAgIAl9DQo+ICAgDQo+IC0JcmV0dXJuIF9fZHdjM19n
YWRnZXRfa2lja190cmFuc2ZlcihkZXApOw0KPiArCXJldHVybiBfX2R3YzNfZ2FkZ2V0X2tpY2tf
dHJhbnNmZXIoZGVwLCBmYWxzZSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBpbnQgZHdjM19n
YWRnZXRfZXBfcXVldWUoc3RydWN0IHVzYl9lcCAqZXAsIHN0cnVjdCB1c2JfcmVxdWVzdCAqcmVx
dWVzdCwNCj4gQEAgLTI3MTksNyArMjczMiw3IEBAIHN0YXRpYyBib29sIGR3YzNfZ2FkZ2V0X2Vu
ZHBvaW50X3RyYnNfY29tcGxldGUoc3RydWN0IGR3YzNfZXAgKmRlcCwNCj4gICAJaWYgKHN0YXR1
cyA9PSAtRVhERVYgJiYgbGlzdF9lbXB0eSgmZGVwLT5zdGFydGVkX2xpc3QpKQ0KPiAgIAkJZHdj
M19zdG9wX2FjdGl2ZV90cmFuc2ZlcihkZXAsIHRydWUsIHRydWUpOw0KPiAgIAllbHNlIGlmIChk
d2MzX2dhZGdldF9lcF9zaG91bGRfY29udGludWUoZGVwKSkNCj4gLQkJaWYgKF9fZHdjM19nYWRn
ZXRfa2lja190cmFuc2ZlcihkZXApID09IDApDQo+ICsJCWlmIChfX2R3YzNfZ2FkZ2V0X2tpY2tf
dHJhbnNmZXIoZGVwLCBmYWxzZSkgPT0gMCkNCj4gICAJCQlub19zdGFydGVkX3RyYiA9IGZhbHNl
Ow0KPiAgIA0KPiAgIG91dDoNCj4gQEAgLTI5MDQsNyArMjkxNyw3IEBAIHN0YXRpYyB2b2lkIGR3
YzNfZW5kcG9pbnRfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+ICAgCQkJZHdjM19nYWRn
ZXRfZXBfY2xlYW51cF9jYW5jZWxsZWRfcmVxdWVzdHMoZGVwKTsNCj4gICAJCQlpZiAoKGRlcC0+
ZmxhZ3MgJiBEV0MzX0VQX0RFTEFZX1NUQVJUKSAmJg0KPiAgIAkJCSAgICAhdXNiX2VuZHBvaW50
X3hmZXJfaXNvYyhkZXAtPmVuZHBvaW50LmRlc2MpKQ0KPiAtCQkJCV9fZHdjM19nYWRnZXRfa2lj
a190cmFuc2ZlcihkZXApOw0KPiArCQkJCV9fZHdjM19nYWRnZXRfa2lja190cmFuc2ZlcihkZXAs
IGZhbHNlKTsNCj4gICANCj4gICAJCQlkZXAtPmZsYWdzICY9IH5EV0MzX0VQX0RFTEFZX1NUQVJU
Ow0KPiAgIAkJfQ0KDQpCUiwNClRoaW5oDQo=
