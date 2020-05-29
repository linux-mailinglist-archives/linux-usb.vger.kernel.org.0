Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA4C1E7E5F
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 15:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgE2NPK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 09:15:10 -0400
Received: from mail-vi1eur05on2043.outbound.protection.outlook.com ([40.107.21.43]:44624
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727039AbgE2NPJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 09:15:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6uSWHxwxIP1IjazKxo1JlDbU+dSalGVbnxRekON8Tmf67NcRzy73snpg3LZOUvYflF5wyenHpgLMWCD7vks+pMr/XtSK8EZjBKHalgSeouG2dchMJtRg+ya9tcRRa1iO33bDCawJWo4DYsQ3MuXQyjtIEKX6xpLDU1WwhE3PAp114qzJumuGWBalqgW2K/qexMMTav5+hidrb2D3j1ucSkTCJvoTHcEc92IdFvQyrAYW70v15G/zhN9Q1IB/vMyKsWhcH6Gd9QIw15vfB0dClT32T6qPJrZdP7bvApbHyxKD0FX8RurQxq5B7BcWk+NBZc50mWC0J45xeJOYHr6Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/JtvIEWa8g8pqdDKfmOq+il9+9ezSm1RuWAgIIgc0U=;
 b=fmylYp6isdPXDNKkh9CfaUnfCkti7QtQqdByuWy1tZS2ZbuzQCveQzkLoaK+VPFyk3umHjm9T7SOY7FTDBIO2ccS8bYh3Xbmvo8hgHWy+KMHIg7wm4KDVA1JgceqyM80rWvalXC/6ALGSdb4FoM4UNY5mIa5CnRKicc2tIUOtOSiFENzrxriS61eAMGTCUexxsZK6abwsP4FO97wZR+/KPhSdeDgdg3cx622spyv4DDmkQQNTRtNkVTFnFdzlWl6YHBFoag6vgX/qtMdrPvCdpkYPbzFHKpY0laPQps55wsYHBuwQXOiJBTGgFkK+r8E94AgMiEnm/Xs6WpzMpjT1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/JtvIEWa8g8pqdDKfmOq+il9+9ezSm1RuWAgIIgc0U=;
 b=gx75UYVkRMO6H/zoIQq75DvnI3B8ciZzRtdqIXJrUpyAQXFoVompAZd8njkh4goY6rpMTBkjegf2lrNOg8y4tG15IbCuGoct2drjq6n/W2p4LJDjttnBL/yhQNsPiEUpmKfFrn2AIyksp58R5PieZXviNrZMlvkEa1tMhTLRL9Y=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM7PR04MB7110.eurprd04.prod.outlook.com (2603:10a6:20b:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 13:15:01 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 13:15:00 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Topic: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Index: AQHWMVkhNTTKDE+VhEWiCwuIqij7b6i/EmaA////zTA=
Date:   Fri, 29 May 2020 13:15:00 +0000
Message-ID: <AM7PR04MB7157EEC770AE46036EC6D3628B8F0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-8-peter.chen@nxp.com>
 <6b86de18-3765-af94-a658-40f40c7be5d3@linux.intel.com>
In-Reply-To: <6b86de18-3765-af94-a658-40f40c7be5d3@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.65.251.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f9dcf4cd-d25c-467e-5232-08d803d24b03
x-ms-traffictypediagnostic: AM7PR04MB7110:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM7PR04MB7110F7A9345AE7AF6C37C9DF8B8F0@AM7PR04MB7110.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TbWj+1x6966w8VRWgOtJBsZL1zU2wd4UAaoljrF2+Pxel9zKtGBHauJOHppeq+rl1GK4HUwqvDaoV+hfHh2cgTEZpyKmZXsJSSLkPX1IcCdsrelTlkrBit3NJDiybaE5I5ih8ozrrmwJtLw/juOIqDtIeDv3uAg9Fi3Wl3uuiomYAHagWnVCCWmHK0TDQKFCjyeGMevXhBDoo1R8oGbltYx95a4W1SM1QMzuF25OgZUtesKbW+1vqcpkvDNb0V4AJpdG7FNlipYxnSQtaUnKPwASy2qAww7gW+FKvWuOzvL38YTJe648WkVngBr2PTO7zAJ9Zdy06tn68DQ4FZoJmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(8676002)(71200400001)(110136005)(54906003)(316002)(2906002)(186003)(26005)(7696005)(8936002)(86362001)(33656002)(44832011)(6506007)(9686003)(66476007)(66946007)(52536014)(83380400001)(55016002)(5660300002)(76116006)(66556008)(64756008)(478600001)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GIWeApOyDsZ+Ys0hXcMptfbZvEMC+HdflgPgJehKVdyRjn6/9QGfMTdVWHH6nldLai6elROdSdwrK+wqY1RtBEQ6ZQjT59krcf8SYai5etxP2UJIvnhkCZ8g3ctgAqzI4Hxpag55FosONHEek2/lInpqAoxP6MIpXwo4y5vt7GSwLD7pcRi10SiNBEa9x5HYsUNp44cWnE7YUsxHR/VnOLLvyC5/zauHb6hNMHco1MgSQMzgDjljfiCjMQrly5UKfzHfQuIZ/QACBPOhh+hZ7nYAlCjdCg5pGMxq5qzNR/zwpck2s0shMmu2D1efZJ3Yy7I/yfWB24wG3o0wE+tnvsqT8QK8T9NbIClKvpIjsGVRN9HRl56Ut7Fbg8kmtUIdXW/Qf2t4TnkTMPrq4tPf+8Dv4ypoQfWyH8ISsY7fRS6jFcrdZkR3UjbDs+zhdrVm4vNO2EFzS6UWBiEGL7u2MMAVKnZFxQkqPFdz8lxOCbI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dcf4cd-d25c-467e-5232-08d803d24b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 13:15:00.7966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a1DXf0GKpyGvNBlPLfjaxn+5wuKd+SsMsDkX6YLkOFMGotE2SaCYjZUsfUEk/47CFgt1IiyH9IQcRQ7cqTjAuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7110
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gT24gMjQuNS4yMDIwIDIuMjMsIFBldGVyIENoZW4gd3JvdGU6DQo+ID4gU29tZSBE
UkQgY29udHJvbGxlcnMgKGVnLCBkd2MzICYgY2RuczMpIGhhdmUgUEhZIG1hbmFnZW1lbnQgYXQg
dGhlaXINCj4gPiBvd24gZHJpdmVyIHRvIGNvdmVyIGJvdGggZGV2aWNlIGFuZCBob3N0IG1vZGUs
IHNvIGFkZCBvbmUgcHJpdiBmbGFnDQo+ID4gZm9yIHN1Y2ggdXNlcnMgdG8gc2tpcCBQSFkgbWFu
YWdlbWVudCBmcm9tIEhDRCBjb3JlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgQ2hl
biA8cGV0ZXIuY2hlbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9ob3N0L3ho
Y2ktcGxhdC5jIHwgOCArKysrKystLQ0KPiA+IGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0Lmgg
fCAxICsNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYw0K
PiA+IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyBpbmRleCAwM2Q2YmJlNTE5MTkuLmEz
ZDZjYjQ2NDE4NiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5j
DQo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYw0KPiA+IEBAIC0xODMsNiAr
MTgzLDggQEAgc3RhdGljIGludCB4aGNpX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gPiAgCXN0cnVjdCB1c2JfaGNkCQkqaGNkOw0KPiA+ICAJaW50CQkJcmV0Ow0K
PiA+ICAJaW50CQkJaXJxOw0KPiA+ICsJc3RydWN0IHhoY2lfcGxhdF9wcml2CSpwcml2ID0gTlVM
TDsNCj4gPiArDQo+ID4NCj4gPiAgCWlmICh1c2JfZGlzYWJsZWQoKSkNCj4gPiAgCQlyZXR1cm4g
LUVOT0RFVjsNCj4gPiBAQCAtMjgwLDggKzI4Miw3IEBAIHN0YXRpYyBpbnQgeGhjaV9wbGF0X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAkJcHJpdl9tYXRjaCA9IGRl
dl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7DQo+ID4NCj4gPiAgCWlmIChwcml2X21hdGNoKSB7
DQo+ID4gLQkJc3RydWN0IHhoY2lfcGxhdF9wcml2ICpwcml2ID0gaGNkX3RvX3hoY2lfcHJpdiho
Y2QpO2gNCj4gPiAtDQo+ID4gKwkJcHJpdiA9IGhjZF90b194aGNpX3ByaXYoaGNkKTsNCj4gPiAg
CQkvKiBKdXN0IGNvcHkgZGF0YSBmb3Igbm93ICovDQo+ID4gIAkJKnByaXYgPSAqcHJpdl9tYXRj
aDsNCj4gPiAgCX0NCj4gPiBAQCAtMzI5LDYgKzMzMCw5IEBAIHN0YXRpYyBpbnQgeGhjaV9wbGF0
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gPiAqcGRldikNCj4gPg0KPiA+ICAJaGNk
LT50cGxfc3VwcG9ydCA9IG9mX3VzYl9ob3N0X3RwbF9zdXBwb3J0KHN5c2Rldi0+b2Zfbm9kZSk7
DQo+ID4gIAl4aGNpLT5zaGFyZWRfaGNkLT50cGxfc3VwcG9ydCA9IGhjZC0+dHBsX3N1cHBvcnQ7
DQo+ID4gKwlpZiAocHJpdiAmJiBwcml2LT5za2lwX3BoeV9pbml0aWFsaXphdGlvbikNCj4gPiAr
CQloY2QtPnNraXBfcGh5X2luaXRpYWxpemF0aW9uID0gMTsNCj4gPiArDQo+ID4gIAlyZXQgPSB1
c2JfYWRkX2hjZChoY2QsIGlycSwgSVJRRl9TSEFSRUQpOw0KPiA+ICAJaWYgKHJldCkNCj4gPiAg
CQlnb3RvIGRpc2FibGVfdXNiX3BoeTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9z
dC94aGNpLXBsYXQuaA0KPiA+IGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCBpbmRleCAx
ZmIxNDlkMWZiY2UuLjg4MjVlOGViMjhkNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3VzYi9o
b3N0L3hoY2ktcGxhdC5oDQo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaA0K
PiA+IEBAIC0xMyw2ICsxMyw3IEBADQo+ID4gIHN0cnVjdCB4aGNpX3BsYXRfcHJpdiB7DQo+ID4g
IAljb25zdCBjaGFyICpmaXJtd2FyZV9uYW1lOw0KPiA+ICAJdW5zaWduZWQgbG9uZyBsb25nIHF1
aXJrczsNCj4gPiArCXVuc2lnbmVkIGludCBza2lwX3BoeV9pbml0aWFsaXphdGlvbjoxOw0KPiAN
Cj4gQW55IHNwZWNpZmljIHJlYXNvbiB3aHkgdGhpcyBhcHByb2FjaCB3YXMgY2hvc2VuIGluc3Rl
YWQgb2YgYWRkaW5nIGEgbmV3IGZsYWcgdG8NCj4gdGhlICJsb25nIGxvbmcgcXVpcmtzIiBhYm92
ZT8NCg0KSSB0aG91Z2h0IHRoZSBxdWlya3MgYXJlIGZvciBoYXJkd2FyZSwgYnV0IGl0IHNlZW1z
IGl0IGNvdWxkIGJlIHVzZWQgZm9yIHNvZnR3YXJlIHRvby4NCkkgd2lsbCBjaGFuZ2UgaXQgYnkg
dXNpbmcgcXVpcmtzLCB0aGFua3MuDQoNClBldGVyIA0K
