Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DED628E224
	for <lists+linux-usb@lfdr.de>; Wed, 14 Oct 2020 16:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgJNO2J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Oct 2020 10:28:09 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:48630 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727468AbgJNO2J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Oct 2020 10:28:09 -0400
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6A3D4C0A55;
        Wed, 14 Oct 2020 14:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1602685688; bh=bsba/OwaQHPgbdd0qLlrRojaKyFlqqnATNoJxj8CQtk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=BzzOfX7wfQDmz70/R4fvX2MLWMiVa7cbC8p2Wri3TzhB9g4+HGLBvXaejrJ6w2826
         4uVB4mHcXjQTXzG2+RuEpm0NzoL4Ikht7ghn+Btr+uRp7WVqFUkT6AKf5eYBKvTXn+
         piS30L47Z7+xHhUxB7O+HE8fVp0Fwn2AQwQDYMKi1RXiOQ4aAv4FTkmq680kQ2a2Ft
         AK0O4s2SAN7B1ES0uV46yXq9bMfx7RtuMYz4GksCqd+0VVVcjXxigBJ12kKSJi84Vy
         JZMJeksHQwt2hn+Yib2Ylh6WXNQFezSqvPSwEibRgVpAWY2wd+jqszoksHQKVypITA
         BC6Vi4SzJ7DHg==
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id CF30FA0081;
        Wed, 14 Oct 2020 14:28:07 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "GlobalSign Organization Validation CA - SHA256 - G3" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 20EED800C9;
        Wed, 14 Oct 2020 14:28:07 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=joglekar@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="bQZGYfCQ";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7gtd3iRQGwJXhRV1T5NiND6fNDmV9SU03sxw5MD5P9VkYGL9aPJBb39NQpBcux+jhD+phaW4roYcqd/VAfuReWLbiULaTLXO25uBC7CFVAXJgmdxxxVXxC9YL5WlWZgRu2XWmJvCsQxjb8m5303BYpVhIluehxWjNsOlSn53H2JmZfMzGC26jJGGFLWW9kV3AVyikzr0CGKLnGzOBl4znwWn5sGJO2WW2beZBO/t4h5jP4bYbFy702R3yV0UWhEVXFLhp1aM/hawQHBJFW/ASeK3IAMBpVBn82sHH7WpBk4OqXVSaOu/QY+10jj9MGzkoVQaGvGdz5xEZCUSdYTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsba/OwaQHPgbdd0qLlrRojaKyFlqqnATNoJxj8CQtk=;
 b=Sukh/lzGabfCjyNNowb0mpybJmPFki2vLH7sn2nBvob5uNDYWmXLY+LSmkKm3corV7RpmVsdG4Zsylz9V9WnHKY/7GxaTZaR1T+qknBakySF233Y8wDOkOJ60AyITOjP/tr4++aAKSqUHABfjTkInFAKHT3tbRN/f29WlK6RQ/vHbBHJM2wtOT3G/Km/pAafrJ4FbP7IZXYNRFanVe1hjvXMxdXo5OSM0J1Aex4+m471uPHXuqdJVKGITPeKNA8fsUw45cFTHVhTNh4IEuHFOHhXGrnhfQ637xaDmeaky+R1wxkH7K+DDddxGkk0D6v1whpKjINlBAuKXF/3zfVnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bsba/OwaQHPgbdd0qLlrRojaKyFlqqnATNoJxj8CQtk=;
 b=bQZGYfCQ187zDzgr6s5xOnD5/fMxQio5FHlmJyQLcGnPoOi9egGj7wPzjowpfRLxccxcnUAzlDm77t4SIL8kUraVkX0v9tk9TE7o0gY5Dg4e5EKr8j825oU5F/uiCRlEOdAxbyy/xj9AIm34N9cIDTHRoTgzOT7Blhs7YAgz+8s=
Received: from MN2PR12MB3549.namprd12.prod.outlook.com (2603:10b6:208:107::17)
 by MN2PR12MB2960.namprd12.prod.outlook.com (2603:10b6:208:101::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.26; Wed, 14 Oct
 2020 14:28:05 +0000
Received: from MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::50d1:2a06:c83c:2cbd]) by MN2PR12MB3549.namprd12.prod.outlook.com
 ([fe80::50d1:2a06:c83c:2cbd%3]) with mapi id 15.20.3455.030; Wed, 14 Oct 2020
 14:28:04 +0000
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v4 3/3] usb: dwc3: Pass quirk as platform data
Thread-Topic: [PATCH v4 3/3] usb: dwc3: Pass quirk as platform data
Thread-Index: AQHWoV6V4+82So3zgkuQCMl6ozWo2KmWx6UAgABiDwA=
Date:   Wed, 14 Oct 2020 14:28:04 +0000
Message-ID: <a6444c5a-c7ff-9437-a2ba-e5a4995a6f2c@synopsys.com>
References: <cover.1602592488.git.joglekar@synopsys.com>
 <b3dbe5d9de39fb5105b8474e9c560917a78e2c63.1602592488.git.joglekar@synopsys.com>
 <29322e22-3b5b-037d-82ba-8e8ac28cd325@gmail.com>
In-Reply-To: <29322e22-3b5b-037d-82ba-8e8ac28cd325@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [49.207.195.99]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cac7bccf-5f8f-4f88-66e0-08d8704d5d1e
x-ms-traffictypediagnostic: MN2PR12MB2960:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2960A3E4CFA395881A0B72DDA4050@MN2PR12MB2960.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 22jLxrB56gDhg0I7JcGoQZkmCurxZ+cjPp1dG9OLfWhDwnXMKVk8Wwve89qqgu9JlwwmdGDkXuhnq9EYsWFuQJjrlqexdi6SbuKRIOvkzdun5TX/mcBT7T9DQlXwJPj7CWQyGL04EMs19rhzdfPZeQte1puWfqRdc1zI99hTEKtodrOAN8tsl8xk8I/wnuvWG2LBC7p96Dsy5ZoR9YWCl4qprG2jyv7Ul9+D4VEDBB+WQ4puGlJyIB5wI+qKBCNL3Xub0JbHFqmLyf9FaGHJYYSZGfRhGob3HdiE8sRsZp2Zvjj8ZJGDjFy0OeA6E42D
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3549.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(53546011)(107886003)(316002)(8676002)(186003)(6486002)(76116006)(6506007)(66946007)(66446008)(71200400001)(6512007)(64756008)(66556008)(31686004)(55236004)(4326008)(26005)(36756003)(478600001)(66476007)(91956017)(2616005)(110136005)(31696002)(2906002)(86362001)(83380400001)(5660300002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: XgQ/gXh5g3OaevpCo9q2bn+KHa8ipXQV7YYbsvEhMBuUPiANYQQX+S+FLdShV/GjCBoWFx7SiqDpC5Jb+a42/4SlYvz0hgt0DVZNRcLwNdHrnimXzVZ7XnEsUsPIiwWYQsq5DEb5Sb40fAIIyAzAV5HJrqPqspAzpRq0zG9S3EyG6CIKD4UViOTvx11SXwU++zOL0eD7iKvHcb1qViePmoFwDo/iXAHlxxkeAQlNOSTeCo6VAd/QTmf1Fojl80kxeYLZ52wTwaSx0Gb0X0vEk9HoDtngVsa61m5eg2DwriCt5e3pLRyYdLiUrz/lQXK5UgqXEjxSYldM2lGMck99I9NtojmBoBKw6xuqkvEDivR7hJTUQXJrATPX9Bz2kVMjg7lflbBfhAGO3niwDwZE37V8DWA2b6hK2qVLGNrG0Yih9qhqntJU3ju4WvkaomX99kjQLQ0rPYw+rl3NVjInT7jqDVnAF5Mq3LxVGnDS6KF0X3SsjmfLi1V/AvpqU6PsIjqGgwwc6FaTmLI6NOc/kwsCghHKwTZnPNibaHKCy7QUytOK6V+0R0+Htg3MrTgH5s12sbEwkMmBRibz2e2tacBY8ZLyB7Sj1/VcO16foyY2kFohEQROsR0stG+Wbz3KjK99qRO01Q/gDc+7R5Nl0A==
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA79463131672A45A079354349BEDC79@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac7bccf-5f8f-4f88-66e0-08d8704d5d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2020 14:28:04.8112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44zy9j7tdu2zLTUaN/8OuAFmAwxNTjRkbzVQtknxX1XvAwcgZNma6iA6hD/aXNkqZJtChA9CWfgWFDu/uDi2Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2960
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGksDQpPbiAxMC8xNC8yMDIwIDI6MDcgUE0sIFNlcmdlaSBTaHR5bHlvdiB3cm90ZToNCj4gSGVs
bG8hDQo+IA0KPiBPbiAxMy4xMC4yMDIwIDE1OjQ0LCBUZWphcyBKb2dsZWthciB3cm90ZToNCj4g
DQo+PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSBwbGF0Zm9ybSBkZXZpY2UgZGF0YSB0byBzZXR1cA0K
Pj4gdGhlIFhIQ0lfU0dfVFJCX0NBQ0hFX1NJWkVfUVVJUksgcXVpcmsuIERXQzMgaG9zdHMNCj4+
IHdoaWNoIGFyZSBQQ0kgZGV2aWNlcyBkb2VzIG5vdCB1c2UgT0YgdG8gY3JlYXRlIHBsYXRmb3Jt
IGRldmljZQ0KPj4gYnV0IGNyZWF0ZSB4aGNpLXBsYXQgcGxhdGZvcm0gZGV2aWNlIHJ1bnRpbWUu
IFNvDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4gYXQNCj4gDQo+PiB0aGlzIHBhdGNoIGFsbG93IHBh
cmVudCBkZXZpY2UgdG8gc3VwcGx5IHRoZSBxdWlyaw0KPiANCj4gwqDCoCBBbGxvd3MuDQo+IA0K
Tm90ZWQuDQo+PiB0aHJvdWdoIHBsYXRmb3JtIGRhdGEuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGVqYXMgSm9nbGVrYXIgPGpvZ2xla2FyQHN5bm9wc3lzLmNvbT4NCj4+IC0tLQ0KPj4gwqAgZHJp
dmVycy91c2IvZHdjMy9ob3N0LmMgfCAxNCArKysrKysrKysrKysrKw0KPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9ob3N0LmMgYi9kcml2ZXJzL3VzYi9kd2MzL2hvc3QuYw0KPj4gaW5kZXggZTE5NTE3NjU4
MGRlLi5kZDdjNzQyMzMzZjcgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2hvc3Qu
Yw0KPj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9ob3N0LmMNCj4+IEBAIC0xMSw2ICsxMSwxNSBA
QA0KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPj4gwqAgwqAgI2lu
Y2x1ZGUgImNvcmUuaCINCj4+ICsjaW5jbHVkZSAiLi4vaG9zdC94aGNpLXBsYXQuaCINCj4+ICsN
Cj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHhoY2lfcGxhdF9wcml2IGR3YzNfcGRhdGEgPSB7DQo+
PiArwqDCoMKgIC5wbGF0X3N0YXJ0ID0gTlVMTCwNCj4+ICvCoMKgwqAgLmluaXRfcXVpcmsgPSBO
VUxMLA0KPj4gK8KgwqDCoCAuc3VzcGVuZF9xdWlyayA9IE5VTEwsDQo+PiArwqDCoMKgIC5yZXN1
bWVfcXVpcmsgPSBOVUxMLA0KPiANCj4gwqDCoCBXaHkgbm90IHJlbHkgb24gdGhlIGNvbXBpbGVy
IHRvIGZpbGwgdGhlc2Ugd2l0aCB6ZXJvcz8NCj4gDQpTdXJlIEkgd2lsbCB1cGRhdGUNCj4+ICvC
oMKgwqAgLnF1aXJrcyA9IFhIQ0lfU0dfVFJCX0NBQ0hFX1NJWkVfUVVJUkssDQo+PiArfTsNCj4+
IMKgIMKgIHN0YXRpYyBpbnQgZHdjM19ob3N0X2dldF9pcnEoc3RydWN0IGR3YzMgKmR3YykNCj4+
IMKgIHsNCj4gWy4uLl0NCj4gDQo+IE1CUiwgU2VyZ2VpDQoNClRoYW5rcyAmIFJlZ2FyZHMsDQog
VGVqYXMgSm9nbGVrYXINCg==
