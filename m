Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238961DFD8D
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2020 09:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbgEXHkl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 24 May 2020 03:40:41 -0400
Received: from mail-eopbgr130045.outbound.protection.outlook.com ([40.107.13.45]:63702
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgEXHkk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 24 May 2020 03:40:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIGswPPr9SjKms8GyFvPkCvdoi0AJFnQXKxMge5HicnO1EwK5ykp8v+k7/l2SRGHAPcJXZ62/QbAonAriTWVLxxwVykD5m8TIluV3uPdr/NUX6CPajT5M9ClFqKsI0Z5PN57hDjvskYsBMtlVLzMYbBEETU8oDIFpT4LWAfaZua+l6VQbeUn/WNNaWuPmAEUA1xN4iFdr1OFtXnwvewU3C88RZXkpOiRGVlPWQjyLIszeLAsaRGTJ/vU/hQrrzWlMMyshEicXrGIdgUQcXdQpJvQOKdevDe01FmkKwMCmRaUQ5qhpPGnAl+uAHORfAs4D675MIWdHaS/7nnqNxY+4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/DOZ5mDlt/GAnu0AUTmAzBzddNOIOtAjnIHGQqeEac=;
 b=WyyK+XgxAsCYcdaVp30kjVpGC7FCARuvjZ/ajFLABPomEozAxkLdqDo82So/f+IDeEo0Xok2IXfx9A85jG9XZ00LiAQoxyqYTec0yvPemOM6HbMKFkFokAp0+EDKAWVF/O9x7HVtltXCOUiATeiPv1ju/RE7Q8NXoLo3k/Gmp/xmTVuVv54OEydJzC/vZgSs5y3QOASdlAZfEr5jqYOJy8/tgoDG1OBWZgi9WytWR8PI5kJg4YIdwp6ttTDi9NkisW7T9SSMlTrM1ae/idOWBm2KZgETEH5fN9BB4bvbWl3uadybtVLXlGXoaD6yYu5iZem/Vdh3By9cFCUpepXRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/DOZ5mDlt/GAnu0AUTmAzBzddNOIOtAjnIHGQqeEac=;
 b=OfLxhl2Xh72BpBEimi/ReFo6Bchrd7GIExWfMYTSiJiJLJNhVY6oz8S6zrfM3C46wphfyhzhOERVYFxf0SBtwswjhzSx/5OqrgV2pmOD42I0vMV6g50yu+OOEadwMrqr8ui9MWNzaKqPo0xzt6fwxRrk6H1QX13Yy+8+zrs5j5c=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6736.eurprd04.prod.outlook.com (2603:10a6:803:128::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Sun, 24 May
 2020 07:40:34 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3021.027; Sun, 24 May 2020
 07:40:34 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Topic: [PATCH v2 7/9] usb: host: xhci-plat: add priv flag for
 skip_phy_initialization
Thread-Index: AQHWMVkhOJT6Y53YCkmYwUN2fNlbl6i22S1Q
Date:   Sun, 24 May 2020 07:40:34 +0000
Message-ID: <VE1PR04MB6528C7F33B4C35AF9DBCE84489B20@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <20200523232304.23976-1-peter.chen@nxp.com>
 <20200523232304.23976-8-peter.chen@nxp.com>
In-Reply-To: <20200523232304.23976-8-peter.chen@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4aae3251-d05b-4b53-93fd-08d7ffb5beae
x-ms-traffictypediagnostic: VE1PR04MB6736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB67367E2552043D8ED7C3E8C989B20@VE1PR04MB6736.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0413C9F1ED
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G66i40mJEDTGBwNapPEVEsbpnFtAUTvexS8wmzs+LOtwN3wL35A9RqBH8BEisasTJYGEHZ6mSBkCJ3fONGWVTO90RLD4wVTTqUAraOkH20cXfxaAqw8EnlE8GTPlwmjJHIyzyEDJw1kZ+ojs/dI5kQPcY45n4tGcTffI51oNMvAlKejwyVFhzUovQmkCN+OAh+irmvwTGBP++9Ew0gePurRONt0/al34T59sNwmc9AeZSL9mgbywGK04UQGtLcK3gY2ZS5CP9DZD3MafBVQ6rzr4aZG6xuSI8F+AOl/4VVJzJj9EPzIMPwPUbN0cTjCtOn7TKRJQ63I84X+6+egF2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(478600001)(64756008)(76116006)(66556008)(66446008)(9686003)(55016002)(66476007)(4326008)(66946007)(54906003)(7696005)(316002)(26005)(53546011)(186003)(6506007)(8676002)(71200400001)(110136005)(8936002)(52536014)(33656002)(5660300002)(86362001)(44832011)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: /A+KDX5B8SUFN86IIVKyAq+CHCy+AP1/RxSkskAl7ojd80aLh8NxFB3A0GAYMfewMtxyb7FdU/cE7KtgStTJe7ONkNCFgT6r3UhKkxETTzHO6BCnpqX9K/h1gl9YAZYK9RWBCTO8XhkRrYDXqENQiPYUfgXpt0OKfzBCkuE3+Dd4AULw9Ev/viva7REybxQnTWWYAcMWss4UP4KBxBM9qv3iFSqNRqPYvt83mJgWn2o2Ct+HsLqb4WU5W3vZKbsEtnrx4Gn+bd18PCsFO01pczDCDBTj8as5tJMucOwG56+XdWHIYKygwXmi0ewa6WsoPVKFpB/Kve7HgXGV9jXsBVAIONG2Un99/X5MTkgoDuW6mTFAZYA+kyPZQei4sQ5smQK72YHV79X8+ixwBk6/qO4SSb4lV0g06SmuhY1Ebq8fAhk0ZSWV2OUj2zKqwNtkh83ggNIpMDkSb2tbtLjTQ8K3V1vhTwqTJCAxs37nm18=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aae3251-d05b-4b53-93fd-08d7ffb5beae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2020 07:40:34.8380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/MXbHm0KcIg2M7KL8y1IkHDRQKyDvASHpRB24FtzyP2eRTV9+MrVyQGYl8md5K3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6736
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQZXRlciBDaGVuIDxw
ZXRlci5jaGVuQG54cC5jb20+DQo+IFNlbnQ6IDIwMjDE6jXUwjI0yNUgNzoyMw0KPiBUbzogYmFs
YmlAa2VybmVsLm9yZzsgbWF0aGlhcy5ueW1hbkBpbnRlbC5jb20NCj4gQ2M6IGxpbnV4LXVzYkB2
Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgtaW14QG54cC5jb20+Ow0KPiBwYXdl
bGxAY2FkZW5jZS5jb207IHJvZ2VycUB0aS5jb207IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
OyBKdW4gTGkNCj4gPGp1bi5saUBueHAuY29tPjsgUGV0ZXIgQ2hlbiA8cGV0ZXIuY2hlbkBueHAu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNy85XSB1c2I6IGhvc3Q6IHhoY2ktcGxhdDogYWRk
IHByaXYgZmxhZyBmb3INCj4gc2tpcF9waHlfaW5pdGlhbGl6YXRpb24NCj4gDQo+IFNvbWUgRFJE
IGNvbnRyb2xsZXJzIChlZywgZHdjMyAmIGNkbnMzKSBoYXZlIFBIWSBtYW5hZ2VtZW50IGF0IHRo
ZWlyIG93biBkcml2ZXINCj4gdG8gY292ZXIgYm90aCBkZXZpY2UgYW5kIGhvc3QgbW9kZSwgc28g
YWRkIG9uZSBwcml2IGZsYWcgZm9yIHN1Y2ggdXNlcnMgdG8gc2tpcA0KPiBQSFkgbWFuYWdlbWVu
dCBmcm9tIEhDRCBjb3JlLg0KDQpDYW4gdGhpcyBmbGFnIGJlIHNldCBkaXJlY3RseSBpbiBfX2Nk
bnMzX2hvc3RfaW5pdCgpPw0KDQpMaSBKdW4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIENo
ZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2kt
cGxhdC5jIHwgOCArKysrKystLSAgZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCB8IDEgKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuYyBiL2RyaXZlcnMvdXNi
L2hvc3QveGhjaS1wbGF0LmMgaW5kZXgNCj4gMDNkNmJiZTUxOTE5Li5hM2Q2Y2I0NjQxODYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvaG9zdC94aGNpLXBsYXQuYw0KPiBAQCAtMTgzLDYgKzE4Myw4IEBAIHN0YXRpYyBpbnQg
eGhjaV9wbGF0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJc3RydWN0
IHVzYl9oY2QJCSpoY2Q7DQo+ICAJaW50CQkJcmV0Ow0KPiAgCWludAkJCWlycTsNCj4gKwlzdHJ1
Y3QgeGhjaV9wbGF0X3ByaXYJKnByaXYgPSBOVUxMOw0KPiArDQo+IA0KPiAgCWlmICh1c2JfZGlz
YWJsZWQoKSkNCj4gIAkJcmV0dXJuIC1FTk9ERVY7DQo+IEBAIC0yODAsOCArMjgyLDcgQEAgc3Rh
dGljIGludCB4aGNpX3BsYXRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
IAkJcHJpdl9tYXRjaCA9IGRldl9nZXRfcGxhdGRhdGEoJnBkZXYtPmRldik7DQo+IA0KPiAgCWlm
IChwcml2X21hdGNoKSB7DQo+IC0JCXN0cnVjdCB4aGNpX3BsYXRfcHJpdiAqcHJpdiA9IGhjZF90
b194aGNpX3ByaXYoaGNkKTsNCj4gLQ0KPiArCQlwcml2ID0gaGNkX3RvX3hoY2lfcHJpdihoY2Qp
Ow0KPiAgCQkvKiBKdXN0IGNvcHkgZGF0YSBmb3Igbm93ICovDQo+ICAJCSpwcml2ID0gKnByaXZf
bWF0Y2g7DQo+ICAJfQ0KPiBAQCAtMzI5LDYgKzMzMCw5IEBAIHN0YXRpYyBpbnQgeGhjaV9wbGF0
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0KPiAgCWhjZC0+dHBsX3N1
cHBvcnQgPSBvZl91c2JfaG9zdF90cGxfc3VwcG9ydChzeXNkZXYtPm9mX25vZGUpOw0KPiAgCXho
Y2ktPnNoYXJlZF9oY2QtPnRwbF9zdXBwb3J0ID0gaGNkLT50cGxfc3VwcG9ydDsNCj4gKwlpZiAo
cHJpdiAmJiBwcml2LT5za2lwX3BoeV9pbml0aWFsaXphdGlvbikNCj4gKwkJaGNkLT5za2lwX3Bo
eV9pbml0aWFsaXphdGlvbiA9IDE7DQo+ICsNCj4gIAlyZXQgPSB1c2JfYWRkX2hjZChoY2QsIGly
cSwgSVJRRl9TSEFSRUQpOw0KPiAgCWlmIChyZXQpDQo+ICAJCWdvdG8gZGlzYWJsZV91c2JfcGh5
Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLXBsYXQuaCBiL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS1wbGF0LmggaW5kZXgNCj4gMWZiMTQ5ZDFmYmNlLi44ODI1ZThlYjI4ZDYg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmgNCj4gKysrIGIvZHJp
dmVycy91c2IvaG9zdC94aGNpLXBsYXQuaA0KPiBAQCAtMTMsNiArMTMsNyBAQA0KPiAgc3RydWN0
IHhoY2lfcGxhdF9wcml2IHsNCj4gIAljb25zdCBjaGFyICpmaXJtd2FyZV9uYW1lOw0KPiAgCXVu
c2lnbmVkIGxvbmcgbG9uZyBxdWlya3M7DQo+ICsJdW5zaWduZWQgaW50IHNraXBfcGh5X2luaXRp
YWxpemF0aW9uOjE7DQo+ICAJdm9pZCAoKnBsYXRfc3RhcnQpKHN0cnVjdCB1c2JfaGNkICopOw0K
PiAgCWludCAoKmluaXRfcXVpcmspKHN0cnVjdCB1c2JfaGNkICopOw0KPiAgCWludCAoKnN1c3Bl
bmRfcXVpcmspKHN0cnVjdCB1c2JfaGNkICopOw0KPiAtLQ0KPiAyLjE3LjENCg0K
