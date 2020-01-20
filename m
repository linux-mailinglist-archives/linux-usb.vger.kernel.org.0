Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 426F51423AE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 07:42:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgATGmh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 01:42:37 -0500
Received: from mail-am6eur05on2072.outbound.protection.outlook.com ([40.107.22.72]:36395
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725933AbgATGmh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 01:42:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA33Bc6zI7vBBvPHWpRchoZMTM8SB3BoTgbF1zTb2xaWqFLBAFRkR/c7GOyp8YXs7i2uX2WA+yoE1YvKESdeVwXIEdzUJ8tbVCoF2mo72vrkK2xdJ4eld6tBqzverif4j0bSiLLYCUBIqZo+kUK4jS8OxPvI5wrpDo/LMUH0Rtr/72xRUhgZisPQU6FcEVcaaIm/YhrbKFNUeLP00JJNsxpBZ4jRxyrq1bMwHUivSv5AlB6KY9Ifbjvx0s8Qm37/Jx/UbFgQjnyJFOK1O1eZDugJykmQ8VpYR0ZusZt58Lziay8tLrECAY40ETvd+6BhL9SopMpytZh4ksWWDpvXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyCXobTSdN0PfilQSwLi+cR6Jhpomr4hvDcmoyyDsms=;
 b=c5xtWoxJnzYC+UIUtQ18FhinPuXz297ZQAHtBOqIyos8PFKdVpbVhKZKyzUuQmUKhTiMEv/ZlQFdmUsTGoOUP9+H6qv2xUnip/heHo9FLGwicavShMhECvPdRBsLKAOGqc3zViJG5AMC1TbTKb7yQlqyvb8Z8KCQ07vE8JwQ3SVHDT5O9TYfStEi41AA07s+D2NwoaRU4uO7kcxduiIWgKWieFJqX1QSpfMm2Yv4DSRAZsx5UGk/0bOV434bkr0T0xcKqR+JGIH/yi12/T2DwXzL+Lres3JfYMk0QsZaMPRuK5Q8tCu/XObTo+ZcrHPVXQWTpfcLwnzqR2rb6qlgEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyCXobTSdN0PfilQSwLi+cR6Jhpomr4hvDcmoyyDsms=;
 b=YvuCdcBiGI+SIljLRJcqH4kL8sIBsVd5X8uPqGG0XBmHqyNLl8d96v5EW7JeLl2Fodqqi2MzAGH9rYzI1HCLInOZ7VShBJzK+8nwD3nlSzRT8pL/AaY9HVCsTvHAWvQL4L+1YWp7TFZazdsva6WjMzahe/2dI6k+LPKXlGye4iM=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (20.179.235.146) by
 VE1PR04MB6541.eurprd04.prod.outlook.com (20.179.234.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Mon, 20 Jan 2020 06:42:33 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::fc52:45c6:88a1:b5e3%7]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 06:42:33 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH v2] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Topic: [PATCH v2] usb: typec: tcpci: mask event interrupts when remove
 driver
Thread-Index: AQHVz1Y2u7sfBLh5k061yelxtRo6wqfzENaAgAAEHRA=
Date:   Mon, 20 Jan 2020 06:42:33 +0000
Message-ID: <VE1PR04MB65288B33F4AF26A8E21FD4A689320@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1579499461-13076-1-git-send-email-jun.li@nxp.com>
 <833f7fe4-37f1-5a8e-755c-4f92c467098b@roeck-us.net>
In-Reply-To: <833f7fe4-37f1-5a8e-755c-4f92c467098b@roeck-us.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=jun.li@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc745aba-6241-4ff3-8306-08d79d73ee0d
x-ms-traffictypediagnostic: VE1PR04MB6541:|VE1PR04MB6541:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6541FD54D51878AD660E690389320@VE1PR04MB6541.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:398;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(26005)(86362001)(66556008)(5660300002)(64756008)(186003)(110136005)(66446008)(54906003)(44832011)(55016002)(81166006)(76116006)(81156014)(2906002)(66476007)(8676002)(53546011)(33656002)(8936002)(9686003)(66946007)(52536014)(6506007)(316002)(71200400001)(7696005)(478600001)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:VE1PR04MB6541;H:VE1PR04MB6528.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iH/xcWYFqK9GNLoCwAZXBu3BuliyxyYf9Qpa6m+wDl9BVNG1r/Quy/campzrZgRPJjsR6rh+K7VEASk64EwNYmFf825ha7o+XiDpOZxob/cJWuljZ7TQidrHpn3CKLN9X/SSDxYSw4vETEL65wBN04yBEwSR/SIKQ1c8wZL03o3OVJvxaw/6wao75qi0XInm53MyXpsnNASBgw5e7q2alJpeLAMDlhkOmiJngp/gouaPeoS+voTbgBTf31WqFr1ImR0kbxaCiuHFwgfOGNaCj2Mzf/KIkJFpon3E4EuWIOU0HVkgSNBHgZVdj8eN4LYl6Yw9vqNorVTIprtfy8oDRiiWgCHaOBnyK/84Ts7cVseDfnHcr/P76tFyDhO7k3hQb9xrZzEFj7IZy6s+CdpJO7wxWctnrdvygxYQyDIwY7IxSGNKCIqcal9L/XWDMUva
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc745aba-6241-4ff3-8306-08d79d73ee0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 06:42:33.5887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mifNuUdB50Y7jWgObHoQeQclohgY6QK64jUgy8zPxfLwUvudUJqP14bY1Y1ZWhJn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6541
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

SGkgR3VlbnRlcg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHdWVudGVy
IFJvZWNrIDxncm9lY2s3QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIEd1ZW50ZXIgUm9lY2sNCj4g
U2VudDogMjAyMOW5tDHmnIgyMOaXpSAxNDowNg0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNv
bT47IGhlaWtraS5rcm9nZXJ1c0BsaW51eC5pbnRlbC5jb20NCj4gQ2M6IGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnOyBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBkbC1saW51eC1pbXgNCj4g
PGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSB1c2I6IHR5cGVj
OiB0Y3BjaTogbWFzayBldmVudCBpbnRlcnJ1cHRzIHdoZW4gcmVtb3ZlDQo+IGRyaXZlcg0KPiAN
Cj4gT24gMS8xOS8yMCA5OjU1IFBNLCBKdW4gTGkgd3JvdGU6DQo+ID4gVGhpcyBpcyB0byBwcmV2
ZW50IGFueSBwb3NzaWJsZSBldmVudHMgZ2VuZXJhdGVkIHdoaWxlIHVucmVnaXN0ZXIgdHBjbQ0K
PiA+IHBvcnQuDQo+ID4NCj4gPiBGaXhlczogNzRlNjU2ZDZiMDU1MSAoInN0YWdpbmc6IHR5cGVj
OiBUeXBlLUMgUG9ydCBDb250cm9sbGVyDQo+ID4gSW50ZXJmYWNlIGRyaXZlciAodGNwY2kpIikN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+
ICAgZHJpdmVycy91c2IvdHlwZWMvdGNwbS90Y3BjaS5jIHwgNiArKysrKysNCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi90eXBlYy90Y3BtL3RjcGNpLmMNCj4gPiBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNw
Y2kuYyBpbmRleCBjMWY3MDczLi5mYjlmMmMxIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNi
L3R5cGVjL3RjcG0vdGNwY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL3R5cGVjL3RjcG0vdGNw
Y2kuYw0KPiA+IEBAIC01ODEsNiArNTgxLDEyIEBAIHN0YXRpYyBpbnQgdGNwY2lfcHJvYmUoc3Ry
dWN0IGkyY19jbGllbnQgKmNsaWVudCwNCj4gPiAgIHN0YXRpYyBpbnQgdGNwY2lfcmVtb3ZlKHN0
cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IHRjcGNpX2No
aXAgKmNoaXAgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gPiArCWludCBlcnI7DQo+
ID4gKw0KPiA+ICsJLyogRGlzYWJsZSBjaGlwIGludGVycnVwdHMgYmVmb3JlIHVucmVnaXN0Z2Vy
IHBvcnQgKi8NCj4gDQo+IHMvdW5yZWdpc3RnZXIvdW5yZWdpc3RlcmluZy8NCj4gDQo+IFNvcnJ5
LCBJIHNob3VsZCBoYXZlIG5vdGljZWQgYmVmb3JlLg0KDQp0aGFua3MsIEkgd2lsbCBzZW5kIHYz
LCBJIHRob3VnaHQgY2hlY2twYXRjaC5wbCB3aWxsIGNoZWNrIHNwZWxsIGVycm9ycyBpbiBwYXRj
aCBidXQNCnNlZW1zIGl0IG9ubHkgY292ZXJzIGNvbW1pdCBsb2cuDQoNCkxpIEp1bg0KPiANCj4g
PiArCWVyciA9IHRjcGNpX3dyaXRlMTYoY2hpcC0+dGNwY2ksIFRDUENfQUxFUlRfTUFTSywgMCk7
DQo+ID4gKwlpZiAoZXJyIDwgMCkNCj4gPiArCQlyZXR1cm4gZXJyOw0KPiA+DQo+ID4gICAJdGNw
Y2lfdW5yZWdpc3Rlcl9wb3J0KGNoaXAtPnRjcGNpKTsNCj4gPg0KPiA+DQoNCg==
