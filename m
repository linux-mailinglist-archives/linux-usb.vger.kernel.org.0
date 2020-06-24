Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3156207E29
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jun 2020 23:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390047AbgFXVKB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jun 2020 17:10:01 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:42384 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389958AbgFXVKA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jun 2020 17:10:00 -0400
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com [10.192.0.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 61C85C0091;
        Wed, 24 Jun 2020 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1593032999; bh=MW8eT4+mjZ+dEMZUd2Yj3jCXGnuCKSHpoVKfF8kobOg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=d4lPXO3+dtA3rhKxkNtQ8Zh7lNQLc4a9VHXqMlrrRPKfLnJ+1zFfNDn2+aepC6xKX
         uYBiEsuy9Q7w7DbONFf5woqjRLVpOS0ZVW3qtjj8X6BwvpE6q0jNAUWYp21RnQcnxs
         Gb5j7X6As3ZjErioRElLdZuqUARQR/NgUB3yiV7qNu+83z6lr91nQaND7higVt21t3
         Lg4Jq1lIyFD2BfbmInmKLEP4lTzRmjzvoB9PQf3vgk10Jxd2VMX6RTX88z3h3vbVzS
         M+gsUFKw2Tgq+xKLg6loF5Uy+0+9H8hWK+JSRVjYDwh0PdNN3o0zuMsQUR2myFyWF2
         w9Jnn3gorfslg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id E3457A0067;
        Wed, 24 Jun 2020 21:09:56 +0000 (UTC)
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (mail-bl2nam02lp2053.outbound.protection.outlook.com [104.47.38.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id C1DF5800CA;
        Wed, 24 Jun 2020 21:09:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vyqa/xri";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cnr2dcw5cTBaGs+SisHPwNS/zXN/dfRTp16mK2pu8+or8mKZ+Pa1i8xdvHXiBslHcGz0FqsciYS8oJbJa7T+ZrfivCoOd7UQAxrBM/bq3nGWmue6z2Atddrg7DZnSAV4veVhNhHrPxzPxBwz+NERBfo7lLnVu1SJtlzKay6kROU/ooGDkoUcVjDlEU0+Fl87VtQIqy+mEXKtiUnUmY1ONf5pnxrsiUWdfTj/GAcrTrPVQOwgm5fmWv5K44Gmnw7xeM0+96o7LyW3zxqPCvnqKOSvL5oYB3LeI+Gai6fLNhiv4n9J2/4Mu9VxxxRjeAnD3iZFna6WL1SYIqpE3P4JSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MW8eT4+mjZ+dEMZUd2Yj3jCXGnuCKSHpoVKfF8kobOg=;
 b=W9/q9y5wldtt/fMFQG8Hiz9iFKQx3wUbrTKB2EAd438wW13sTwat7M78+Uwb0LznpvdWGqE8rtNldK+QFR5B3lFf3ESqmQgnFMHUjH8qBrrLCGwYG7O0jG2kwc8Yp/XDThWsTQgoOvk8jlOuo7CidIJqtwyacVkCkPFGxaSPbWc+P7VvU3t41k5hoY3XcPtCjCYw4APQ7c0/lJIJyUUi3QuHaTPhg4z7VAJhuObInRat/YJDxKonmYtezPUR+7iug5Sb5YtKD+bMFOd8UAAdE6SczHSdAPWkFwQjwajRHbqcsNODF6qj7JoXafShZkRWCvPslnbj9tHJ5debDvZZ9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MW8eT4+mjZ+dEMZUd2Yj3jCXGnuCKSHpoVKfF8kobOg=;
 b=vyqa/xriMxwaDxtFZEkJtuyD70/xyuFHV2HFD6pwun1rR8NcRtudzVQl+23z3+RRQuXH2evo+KQ/LvfsSdm3WEoMV2Gqt82hpi/j+rVjyvuLo5cQnXBJj7SmgJm8yvVGxYA6dvFPl2Ont4T5p2qFOUUs0uavsjQm2fgCqCGPSGA=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BY5PR12MB3970.namprd12.prod.outlook.com (2603:10b6:a03:1ac::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Wed, 24 Jun
 2020 21:09:53 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 21:09:53 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Olbrich <m.olbrich@pengutronix.de>
Subject: Re: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Topic: [PATCH v2 1/2] usb: dwc3: gadget: make starting isoc transfers
 more robust
Thread-Index: AQHWSjaj2amBwerG90am9uwqnJYeDKjoJlmAgAAc1AA=
Date:   Wed, 24 Jun 2020 21:09:53 +0000
Message-ID: <e03d6c0b-fa6a-2758-347c-568b1682fe3d@synopsys.com>
References: <20200624144907.9604-1-m.grzeschik@pengutronix.de>
 <20200624144907.9604-2-m.grzeschik@pengutronix.de>
 <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
In-Reply-To: <fde48c28-3e9b-02f4-d0b0-5a34af3461e1@synopsys.com>
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
x-ms-office365-filtering-correlation-id: 0aa983a4-a29b-4b17-e5df-08d81882f0a4
x-ms-traffictypediagnostic: BY5PR12MB3970:
x-microsoft-antispam-prvs: <BY5PR12MB39702C5E891BCD988ACCE66BAA950@BY5PR12MB3970.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U2pVGcsDIO71GZm813jcHm+zCQi+QSsiMLlVdj+xDIHvCQywl1Wi9X4HE9ZXgjmFhDgl3BctaI84GNk9sJOpFzjkgui3HJxiiK6ylI3VEjJNg9SLg7XnhdwhmEWCKX0jVtGCqlT6/xUI48cQUesOBjftknuIcGSTesIuelrVuU1PJF7qdYFrpKMv6lH77hhJTJh0ZVjkVi3ToU+k1DlLRAdR3H5krTTQyr7Btlr3tN3DPnWGHQSDu2+ohhcPb8mUkivDrwpVW7ixHHCBI7IjRwIq0pQostRb4QEa0nb+vntn8aUmRIb0WU6N2wifFiefuIwJcAxw6RvfYMg16xAMdJhqXGrtS/nMw1m5bC0S2VjOUIgESAhoMqBZbZcBxnFu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39860400002)(376002)(346002)(366004)(136003)(64756008)(66446008)(66556008)(186003)(4326008)(66476007)(2906002)(2616005)(36756003)(110136005)(6506007)(26005)(54906003)(316002)(83380400001)(5660300002)(71200400001)(478600001)(8676002)(66946007)(31686004)(31696002)(8936002)(6512007)(6486002)(86362001)(76116006)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 95Gs9OjV2HqBpQFya3HDwL09RuC7AoucWjVdCly+ktd/Xacz0yCtjJzt/Xhn5az5m6lorZ85mJbKJAIYMB5/HUBvo17SmKNvLut1juQe/wvLpgrPUNzpDkMvYNreWJzOhHXx0g37TWek+R5wQUYZ7YcNMcPpRGs1Qkk/EaEjPOxMM5d+qPaGMfZRo2V8ZVAZmyNeThki2JXKLCVjb61vlg6yz6+Hbp5gtw/PlUnghXfqS2OfXGYaQa/eZoYYIQvjz+ppXfO/0sCdhGSUQZY8CCQbhXeMUQmHVJiAAJ29B5vg7jmqA5JOhVJtrk3A/CcA/r0tZGN7UKd1R5eLN9M4e5fQZ5K1jkQHc3nM+NN0j8W938Bbsq5RvxKX8BAxmsw2zfhUYHb2dCWjIFj4RMFAsjAIh2+NZiwe/FK0lpUICt+fcMsnrARv9OhuN1hyy8wFSu4PcuJ5eCWjRjTJccFRpxb7uyvEv56TGbNy4VsHuJA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA6AB776C513164997001BD3C5DB8CAB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aa983a4-a29b-4b17-e5df-08d81882f0a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 21:09:53.3409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 00IfNQoFT5O9Vm6mGmMSNGN6isYzEkhru7vHDy3qfjgdvzncq6KyywI8+vwLzV0jnsWpSU3WQ3w5kYhM6EztgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3970
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

VGhpbmggTmd1eWVuIHdyb3RlOg0KPiBIaSwNCj4NCj4gTWljaGFlbCBHcnplc2NoaWsgd3JvdGU6
DQo+PiBGcm9tOiBNaWNoYWVsIE9sYnJpY2ggPG0ub2xicmljaEBwZW5ndXRyb25peC5kZT4NCj4+
DQo+PiBDdXJyZW50bHkgX19kd2MzX2dhZGdldF9zdGFydF9pc29jIG11c3QgYmUgY2FsbGVkIHZl
cnkgc2hvcnRseSBhZnRlcg0KPj4gWGZlck5vdFJlYWR5LiBPdGhlcndpc2UgdGhlIGZyYW1lIG51
bWJlciBpcyBvdXRkYXRlZCBhbmQgc3RhcnQgdHJhbnNmZXINCj4+IHdpbGwgZmFpbCwgZXZlbiB3
aXRoIHNldmVyYWwgcmV0cmllcy4NCj4gRGlkIHlvdSB0cnkgd2l0aCB0aGUgcmVjZW50IHVwZGF0
ZSBmb3IgaXNvYz8gKGUuaS4sIGFmdGVyIDUNCj4gU1RBUlRfVFJBTlNGRVIgZmFpbHVyZXMsIHRo
ZSBkcml2ZXIgd2lsbCBpc3N1ZSBFTkRfVFJBTlNGRVIgdG8gcmV0cnkgb24NCj4gdGhlIG5leHQg
WGZlck5vdFJlYWR5IGV2ZW50KQ0KPg0KPiBMZXQgbWUga25vdyBpZiB5b3Ugc3RpbGwgcnVuIGlu
dG8gaXNzdWVzIHdpdGggdGhhdC4NCg0KSnVzdCB3YW50IHRvIGNsYXJpZnksIEkgbGlrZSB0aGlz
IHNvbHV0aW9uLiBJJ20ganVzdCBjdXJpb3VzIGhvdyBpdCANCmJlaGF2ZXMgb24geW91ciB0ZXN0
IHNldHVwIHdpdGggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24uDQoNCj4NCj4+IERTVFMgcHJv
dmlkZXMgdGhlIGxvd2VyIDE0IGJpdCBvZiB0aGUgZnJhbWUgbnVtYmVyLiBVc2UgaXQgaW4gY29t
YmluYXRpb24NCj4+IHdpdGggdGhlIGZyYW1lIG51bWJlciBwcm92aWRlZCBieSBYZmVyTm90UmVh
ZHkgdG8gZ3Vlc3MgdGhlIGN1cnJlbnQgZnJhbWUNCj4+IG51bWJlci4gVGhpcyB3aWxsIHN1Y2Nl
ZWQgdW5sZXNzIG1vcmUgdGhhbiBvbmUgMTQgcm9sbG92ZXIgaGFzIGhhcHBlbmVkDQo+PiBzaW5j
ZSBYZmVyTm90UmVhZHkuDQo+Pg0KPj4gU3RhcnQgdHJhbnNmZXIgbWlnaHQgc3RpbGwgZmFpbCBp
ZiB0aGUgZnJhbWUgbnVtYmVyIGlzIGluY3JlYXNlZA0KPj4gaW1tZWRpYXRlbHkgYWZ0ZXIgRFNU
UyBpcyByZWFkLiBTbyByZXRyaWVzIGFyZSBzdGlsbCBuZWVkZWQuDQo+PiBEb24ndCBkcm9wIHRo
ZSBjdXJyZW50IHJlcXVlc3QgaWYgdGhpcyBoYXBwZW5zLiBUaGlzIHdheSBpdCBpcyBub3QgbG9z
dCBhbmQNCj4+IGNhbiBiZSB1c2VkIGltbWVkaWF0ZWx5IHRvIHRyeSBhZ2FpbiB3aXRoIHRoZSBu
ZXh0IGZyYW1lIG51bWJlci4NCj4+DQo+PiBXaXRoIHRoaXMgY2hhbmdlLCBfX2R3YzNfZ2FkZ2V0
X3N0YXJ0X2lzb2MgaXMgc3RpbGwgbm90IHN1Y2Nlc3NmdWxseSBpbiBhbGwNCj4+IGNhc2VzIGJp
dCBpdCBpbmNyZWFzZXMgdGhlIGFjY2VwdGFibGUgZGVsYXkgYWZ0ZXIgWGZlck5vdFJlYWR5DQo+
PiBzaWduaWZpY2FudGx5Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgT2xicmljaCA8
bS5vbGJyaWNoQHBlbmd1dHJvbml4LmRlPg0KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBUcmV0
dGVyIDxtLnRyZXR0ZXJAcGVuZ3V0cm9uaXguZGU+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IEdyemVzY2hpayA8bS5ncnplc2NoaWtAcGVuZ3V0cm9uaXguZGU+DQo+Pg0KPj4gLS0tDQo+PiB2
MSAtPiB2MjogLSByZW1vdmVkIGxhc3RfZnJhbWVfbnVtYmVyIGZyb20gc3RydWN0DQo+PiAgICAg
ICAgICAgICAtIGluY2x1ZGVkIHJvbGxvdmVyIHZhcmlhYmxlDQo+Pg0KPj4gICAgZHJpdmVycy91
c2IvZHdjMy9nYWRnZXQuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4+IGluZGV4IDQyMWEwZjczMTEwYTQwYi4uMDk2MmRkZDdm
YmY2YWU2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9nYWRnZXQuYw0KPj4gQEAgLTEyNzYsNyArMTI3Niw3IEBAIHN0
YXRpYyB2b2lkIGR3YzNfcHJlcGFyZV90cmJzKHN0cnVjdCBkd2MzX2VwICpkZXApDQo+PiAgICAN
Cj4+ICAgIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2VwX2NsZWFudXBfY2FuY2VsbGVkX3JlcXVl
c3RzKHN0cnVjdCBkd2MzX2VwICpkZXApOw0KPj4gICAgDQo+PiAtc3RhdGljIGludCBfX2R3YzNf
Z2FkZ2V0X2tpY2tfdHJhbnNmZXIoc3RydWN0IGR3YzNfZXAgKmRlcCkNCj4+ICtzdGF0aWMgaW50
IF9fZHdjM19nYWRnZXRfa2lja190cmFuc2ZlcihzdHJ1Y3QgZHdjM19lcCAqZGVwLCBib29sIGtl
ZXBfcmVxKQ0KPiBBbnkgcmVhc29uIHRvIGhhdmUga2VlcF9yZXE/IFdpdGggdGhlIHJlY2VudCBj
aGFuZ2VzLCBpZg0KPiBkd2MzX3NlbmRfZ2FkZ2V0X2VwX2NtZCgpIHJldHVybnMgLUVBR0FJTiwg
dGhlbiB0aGUgY29udHJvbGxlciBkcml2ZXINCj4gd29uJ3QgZ2l2ZSBiYWNrIHRoZSByZXF1ZXN0
Lg0KPg0KDQpCUiwNClRoaW5oDQo=
