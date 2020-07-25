Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB8B322D453
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jul 2020 05:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgGYDdn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 23:33:43 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:57128 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726613AbgGYDdm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 23:33:42 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 24FD8401AB;
        Sat, 25 Jul 2020 03:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595648022; bh=C2N/2MfFlmap8WCkUHLg4mSR5K3hpAL/OwSMiz8Xznk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JCpbHhEcIs0U8X2UZRyP2zZcurrxI2uSCyC0DD2UyKydWdcSV8ak/qzZvCdxCssId
         rqC/Kelow7jpFo//QtM3KmSeNtjs1gKe+WQLWM5mQ4TcB4VEAD9TkrgaymopHhXBcc
         t+mVNTbmroChFYN220p5bbxeo5+k3UExmNWmgk8fjBpQlUQXDPPKrzLpnTzEjoLeqF
         ie+u59hEkLNVxC1SPq34I9zkdoUEKNbG6hbga1Lba65hsqQnRP83LeqfLmGcQ3DCzk
         OFUTwd8yOSx5Fue4bp62JPZ1y12+ngaXybJgfSh9BkQ9c+F0UkB1FF9oTutAoWMiS1
         zgACW6ZfK7gGA==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 6D20CA006F;
        Sat, 25 Jul 2020 03:33:41 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D045E40162;
        Sat, 25 Jul 2020 03:33:40 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="mEmIzkqU";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arlec59O5tljSGVgNwbL5/vMvTr1KBb06a3wScqHKndBWrnbJyJWo3rR8QAROoJGtznewJmraLUkN0d1XeXWhEUa8TWJeMMJPeRW6tvsw3ciboTn3qLjy3OQCDelGEV8R2o4lyz1BbzkO+5k7qv2dnB/T8HbuV5WoLdJLdaIsxsBsSyy0YDO8TXUSSQAIY+7UDAxMTzmvspBVkuuBHVC9oZn64hjpi4vgPMmqyszQLC/5jcG+XH8+p95lnj0NvSZcezAKYhKq96CG4gHSnJ6CZUcU9CyRD67icJevIIYll8efz3qhYvCbpFf0Ub/4Bq3fOYGvcNShY28unfINRMmUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2N/2MfFlmap8WCkUHLg4mSR5K3hpAL/OwSMiz8Xznk=;
 b=OPEsQFq7dfzVtlWjOhyAvW8sdSWMDQ9UZvvQ/UxyJLcZL+CJ8tqiuWSI9I+dNSJAlRWqG3JTb44riCQRlpbrRsrw/C7n4NwXKhjgXK5WyOeL6jHd3fv7FFQQuHq/tn9he14DZJDBLlXWt3L4yjlK42uq6IkNouFh+2prZC+jB3N0RBDF7v59CaUSrYd3umFGTQzx98dUVOkIdKmKQQKZ6DAs/YDZ+NIg/IKWd0pFaQrGkFMlK36mFLxrxMceYtuT6PJuPpzz0aqb7E7JRxymi3RO14lueGd6ue40t6emzWkGtkS0jygnHPeVmY3kgMiVYpYgOK1vIHbpocybBgI5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2N/2MfFlmap8WCkUHLg4mSR5K3hpAL/OwSMiz8Xznk=;
 b=mEmIzkqUCmYeKctZE8i5sBZV1YXQ0f2kfAY0/NxyWdqst8HVoD8+dVoYwlev8puAxYHYQw2cgOQdPhr6JIea+8h5XvPUMnk29JQQpVhutyloBina60mFzqKBw5HhoazQ5esT+WF1HQpsJNFZOILCD3I4Fdmpsa5Zl3i7erogNcw=
Received: from BYAPR12MB2917.namprd12.prod.outlook.com (2603:10b6:a03:130::14)
 by BYAPR12MB3141.namprd12.prod.outlook.com (2603:10b6:a03:da::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Sat, 25 Jul
 2020 03:33:39 +0000
Received: from BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456]) by BYAPR12MB2917.namprd12.prod.outlook.com
 ([fe80::3844:ed8:654d:7456%5]) with mapi id 15.20.3216.025; Sat, 25 Jul 2020
 03:33:39 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 03/12] usb: gadget: Expose sublink speed attributes
Thread-Topic: [PATCH v3 03/12] usb: gadget: Expose sublink speed attributes
Thread-Index: AQHWYhOUDJE0Rv53NESyUDB10nA4C6kXn1uAgAAFQgA=
Date:   Sat, 25 Jul 2020 03:33:39 +0000
Message-ID: <d8539fd9-ffa6-824f-0347-71c73315d8a5@synopsys.com>
References: <cover.1595631457.git.thinhn@synopsys.com>
 <500284ccf0353ee17a6bee8fa55011f801e17630.1595631457.git.thinhn@synopsys.com>
 <1595646889.23885.68.camel@mhfsdcap03>
In-Reply-To: <1595646889.23885.68.camel@mhfsdcap03>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [149.117.7.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e047700-a21d-49d2-c8ec-08d8304b8576
x-ms-traffictypediagnostic: BYAPR12MB3141:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3141527B0420FB684E903CA8AA740@BYAPR12MB3141.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UsMomTNJxCVLfAV3lgc5L3ba4WdZ6V3R1mcB79lSVwV/GQdMKrXdk+wiJ+WZui0C4sYmxXpzIrQiNct3do9fqUDJUH8VuQ0sLc7m2Rd0tshZFp2Qib0/yWLooTot7XSKhzI8I5xCNzeqeFRGpXGhJWpRBHMQd3C4zAlbdACg18T0gO1+Rw97Mg9xnSzRIFMO+pBhg6ZGZCvY1Z/gWVEdivWWZ7XuKzo/SsItNliIHX39ZFRPnrXl/tO0sG4QQWUz+lSyzysPk42Bypc2JFuj///wNFYoUR+T6hkGk8SUElxOXtuOLIrUA5nCNA3moyl1ROBdVBOTM01o6O9qC/XK40O4E9slUl1cl/oWihOu4FFYV/4AZGAyVDNJdNE0ahL3
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2917.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(376002)(136003)(366004)(39860400002)(346002)(71200400001)(6506007)(36756003)(2906002)(110136005)(8676002)(4326008)(83380400001)(107886003)(31686004)(316002)(54906003)(66556008)(6512007)(8936002)(478600001)(2616005)(5660300002)(186003)(64756008)(76116006)(86362001)(26005)(31696002)(6486002)(66946007)(66446008)(66476007)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 45YZKd2fXMrGbXGdQ/wNxnMEUTZ7SpUnFW5+QLqmci0C0CPHSuHPB9nSdYzoutEwFUk7aFeVLSO8v7aDbCyo44DeQ6PiWqPDa2nbfAjX53uGLwbUQUfpqR2G97TefgKFoclLDCM/BjwhlbVZ2TssTkGgAuCB7nPmDNKPqTdtpCGl4GsEQqm4KsofSyx/o3Flkro16Vgq/toSZq5S1bD0pQbYdfuWTDaF+xMP3H8kRMMtoRsuumcGpCxIV9eO09Aa2aMTGYbanvJJEBtfVJRZtIP0ucfwDn2EXl7SPVT7RBgwVBqbX+6P512lZGdmo/4MrEyL4kRZmWdmzoivv1EDWFWdzXScOl05LedfTM1oULwdMu4pFQnvjvZvA5WrRghMYTnZE0aQciVUIYf2YQ57rFGv6tLDds3HWfyjkZAJz6qAhkBjNXp42FaenrAluVLmEqjykdkzF3Nup6mbNlcNwXVOxT3mavskRVKG5HYT6Io=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF32DDF5E3BAF64DAD5747A913FCCAC8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2917.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e047700-a21d-49d2-c8ec-08d8304b8576
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2020 03:33:39.1510
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a6EPNnmzH3CrInHcLrQoXVbjQ1NjmAUanuUuXgEq0IxsnBwlk70p/WsEVzPqLEkXR3GvVpf4yqd8xIgQZoimeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3141
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Q2h1bmZlbmcgWXVuIHdyb3RlOg0KPiBPbiBGcmksIDIwMjAtMDctMjQgYXQgMTY6MzggLTA3MDAs
IFRoaW5oIE5ndXllbiB3cm90ZToNCj4+IFRoZSBVU0IgMy4yIHNwZWNpZmljYXRpb24gc3VwcG9y
dHMgZHVhbC1sYW5lIGFuZCBkaWZmZXJlbnQgdHJhbnNmZXINCj4+IHJhdGVzIGZvciBzdXBlci1z
cGVlZC1wbHVzLiBEZXZpY2VzIG9wZXJhdGluZyBpbiBzdXBlci1zcGVlZC1wbHVzIGNhbg0KPj4g
YmUgZ2VuMngxLCBnZW4xeDIsIG9yIGdlbjJ4Mi4NCj4+DQo+PiBBIGdhZGdldCBkcml2ZXIgbWF5
IG5lZWQgdG8ga25vdyB0aGUgZ2FkZ2V0J3Mgc3VibGluayBzcGVlZHMgdG8gcHJvcGVybHkNCj4+
IHNldHVwIGl0cyB0cmFuc2ZlciByZXF1ZXN0cyBhbmQgZGVzY3JpYmUgaXRzIGNhcGFiaWxpdHkg
aW4gaXRzDQo+PiBkZXNjcmlwdG9ycy4gVG8gZGVzY3JpYmUgdGhlIHRyYW5zZmVyIHJhdGUgaW4g
c3VwZXItc3BlZWQtcGx1cyBmdWxseSwNCj4+IGxldCdzIGV4cG9zZSB0aGUgbGFuZSBjb3VudCBh
bmQgc3VibGluayBzcGVlZCBhdHRyaWJ1dGVzIHdoZW4gb3BlcmF0aW5nDQo+PiBpbiBzdXBlci1z
cGVlZC1wbHVzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRoaW5oIE5ndXllbiA8dGhpbmhuQHN5
bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gICBDaGFuZ2VzIGluIHYzOg0KPj4gICAtIE5vbmUNCj4+
ICAgQ2hhbmdlcyBpbiB2MjoNCj4+ICAgLSBOb25lDQo+Pg0KPj4gICBpbmNsdWRlL2xpbnV4L3Vz
Yi9nYWRnZXQuaCB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAyMCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdXNi
L2dhZGdldC5oIGIvaW5jbHVkZS9saW51eC91c2IvZ2FkZ2V0LmgNCj4+IGluZGV4IDUyY2UxZjZi
OGY4My4uYmQ5ODI2Njk2MDljIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9saW51eC91c2IvZ2Fk
Z2V0LmgNCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvdXNiL2dhZGdldC5oDQo+PiBAQCAtMzM5LDYg
KzMzOSwxNSBAQCBzdHJ1Y3QgdXNiX2dhZGdldF9vcHMgew0KPj4gICAgKiBAc3BlZWQ6IFNwZWVk
IG9mIGN1cnJlbnQgY29ubmVjdGlvbiB0byBVU0IgaG9zdC4NCj4+ICAgICogQG1heF9zcGVlZDog
TWF4aW1hbCBzcGVlZCB0aGUgVURDIGNhbiBoYW5kbGUuICBVREMgbXVzdCBzdXBwb3J0IHRoaXMN
Cj4+ICAgICogICAgICBhbmQgYWxsIHNsb3dlciBzcGVlZHMuDQo+PiArICogQG51bV9sYW5lczog
TnVtYmVyIG9mIGxhbmVzIGluIHVzZS4NCj4+ICsgKiBAbWF4X251bV9sYW5lczogTWF4aW11bSBu
dW1iZXIgb2YgbGFuZXMgdGhlIFVEQyBzdXBwb3J0cy4NCj4+ICsgKiBAc3NhYzogU3VibGluayBz
cGVlZCBhdHRyaWJ1dGUgY291bnQuIFRoZSBudW1iZXIgb2Ygc3VibGluayBzcGVlZA0KPj4gKyAq
CWF0dHJpYnV0ZXMgaXMgc3NhYyArIDEuDQo+PiArICogQHN1Ymxpbmtfc3BlZWQ6IEFycmF5IG9m
IHN1Ymxpbmsgc3BlZWQgYXR0cmlidXRlcyB0aGUgVURDIHN1cHBvcnRzLiBTdWJsaW5rDQo+PiAr
ICoJc3BlZWQgYXR0cmlidXRlcyBhcmUgcGFpcmVkLCBhbmQgYW4gUlggZm9sbG93ZWQgYnkgYSBU
WCBhdHRyaWJ1dGUuDQo+PiArICogQHNwZWVkX3NzaWQ6IEN1cnJlbnQgc3VibGluayBzcGVlZCBh
dHRyaWJ1dGUgSUQgaW4gdXNlLg0KPj4gKyAqIEBtaW5fc3BlZWRfc3NpZDogU3VibGluayBzcGVl
ZCBhdHRyaWJ1dGUgSUQgd2l0aCB0aGUgbWluaW11bSBzcGVlZC4NCj4+ICsgKiBAbWF4X3NwZWVk
X3NzaWQ6IFN1Ymxpbmsgc3BlZWQgYXR0cmlidXRlIElEIHdpdGggdGhlIG1heGltdW0gc3BlZWQu
DQo+PiAgICAqIEBzdGF0ZTogdGhlIHN0YXRlIHdlIGFyZSBub3cgKGF0dGFjaGVkLCBzdXNwZW5k
ZWQsIGNvbmZpZ3VyZWQsIGV0YykNCj4+ICAgICogQG5hbWU6IElkZW50aWZpZXMgdGhlIGNvbnRy
b2xsZXIgaGFyZHdhcmUgdHlwZS4gIFVzZWQgaW4gZGlhZ25vc3RpY3MNCj4+ICAgICoJYW5kIHNv
bWV0aW1lcyBjb25maWd1cmF0aW9uLg0KPj4gQEAgLTQwNiw2ICs0MTUsMTcgQEAgc3RydWN0IHVz
Yl9nYWRnZXQgew0KPj4gICAJc3RydWN0IGxpc3RfaGVhZAkJZXBfbGlzdDsJLyogb2YgdXNiX2Vw
ICovDQo+PiAgIAllbnVtIHVzYl9kZXZpY2Vfc3BlZWQJCXNwZWVkOw0KPj4gICAJZW51bSB1c2Jf
ZGV2aWNlX3NwZWVkCQltYXhfc3BlZWQ7DQo+PiArDQo+PiArCS8qIFNTUCBvbmx5ICovDQo+PiAr
CXVuc2lnbmVkCQkJbnVtX2xhbmVzOw0KPj4gKwl1bnNpZ25lZAkJCW1heF9udW1fbGFuZXM7DQo+
PiArCXVuc2lnbmVkCQkJc3NhYzsNCj4+ICsjZGVmaW5lIFVTQl9HQURHRVRfTUFYX1NTQUMgMw0K
Pj4gKwlzdHJ1Y3QgdXNiX3N1Ymxpbmtfc3BlZWQJc3VibGlua19zcGVlZFtVU0JfR0FER0VUX01B
WF9TU0FDICsgMV07DQo+PiArCXVuc2lnbmVkCQkJc3BlZWRfc3NpZDsNCj4+ICsJdW5zaWduZWQJ
CQltaW5fc3BlZWRfc3NpZDsNCj4+ICsJdW5zaWduZWQJCQltYXhfc3BlZWRfc3NpZDsNCj4gY2hl
Y2twYXRjaCB3YXJuaW5nOg0KPg0KPiBXQVJOSU5HOlVOU1BFQ0lGSUVEX0lOVDogUHJlZmVyICd1
bnNpZ25lZCBpbnQnIHRvIGJhcmUgdXNlIG9mICd1bnNpZ25lZCcNCg0KWWVzLCBidXQgSSdkIGxp
a2UgdG8ga2VlcCB0aGVtIGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGUgZmllbGRzIGlu
IA0KdGhpcyBzdHJ1Y3R1cmUuDQoNCj4+ICsNCj4+ICAgCWVudW0gdXNiX2RldmljZV9zdGF0ZQkJ
c3RhdGU7DQo+PiAgIAljb25zdCBjaGFyCQkJKm5hbWU7DQo+PiAgIAlzdHJ1Y3QgZGV2aWNlCQkJ
ZGV2Ow0KDQpCUiwNClRoaW5oDQo=
