Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE78223375
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 08:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgGQGNo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 02:13:44 -0400
Received: from mail-am6eur05on2073.outbound.protection.outlook.com ([40.107.22.73]:55712
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725904AbgGQGNo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jul 2020 02:13:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0bM9sDbYKTYIZzKptCCT8DcecL4MfiQ5h8xjRe79KqacE+xe0C1ZhfWoIqR/hpkRsdvpIDynIoqrnAl9l7HTggYP7SnHLUniqcTyBjl20jlVtQEEGR4EjKTgRpb5w8LiONtAonjYnEG/a1HR1UBGKibHaPfz38lX4deWZ6vJFgzUfqccwwKSaFQYJFBPtd5N/hPMwDRGAyF5V1xgvN9W3D+kqkjI7Ta4LI05IRvt4rx/PWRQC4qT+z2EkkytTjvL1BfC5Zh8NKDax5kkMWJrEMXa+QYcA0k/rREsFEpMgdWu3XR4PKuYY1Frp29UrIH6i6K/qsEf9fyn7GPUsz/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HayxwauXYpog/7QVDKHa0JydC16E6XFVjfoFT28LUkY=;
 b=iu/xEA/0OzuM+wu9T9Xg9lvRUIBQ1OgS9fcXUcnG6pzrZb3fLRS3SRYnjJJP/FmnhR7BbS9D79Uzn8fGXLTWwFFy09t+ad2CjKzRV4rOzU4W1uyVdVtj7+epKixEMQZXWbMlZUXSO4V2EooS6nEfAok6YIaGGIQQdpDvnuGKaGw+xG6OYgOOPzh0W7UXeCEOagTE7wsJTdbFG6ZWLR5rLH6zaOhNuNe2lRxw9dHtmfjpLBc5pXwm2fzpwedsUyanTYxZPGDNLfUqRfh+rPyUGOd+CG6+43U4ETJubB3dF3e/GrMMriKeLJTXY9atjBwb0VE0LjSsby2ohx3GTzd1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HayxwauXYpog/7QVDKHa0JydC16E6XFVjfoFT28LUkY=;
 b=c5N7K5aSoL8lnKFxKqref6zReX1uXZYesox4vjqGr/ahUBuoP0tfygTEyQr22V5spre6jfqOgA+o29aKBcvx98Tz0qHzll2h3dKvwCAu2jkHr3KU3fPqwo+88QXWY4kz9VELd1bO/kEOTusCznZpqs6j3SugVWyl7+GPRq15PIo=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM5PR0402MB2738.eurprd04.prod.outlook.com (2603:10a6:203:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.23; Fri, 17 Jul
 2020 06:13:40 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.026; Fri, 17 Jul 2020
 06:13:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Peter Chen <peter.chen@nxp.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH v5 0/9] usb: some PM changes for cdns3 and xhci-plat
Thread-Topic: [PATCH v5 0/9] usb: some PM changes for cdns3 and xhci-plat
Thread-Index: AQHWVDMt1I7Ql8zn9U6i9fyobWWrqKkLWiqQ
Date:   Fri, 17 Jul 2020 06:13:40 +0000
Message-ID: <AM7PR04MB71574E5D0E33587A14B0F73B8B7C0@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <20200707074941.28078-1-peter.chen@nxp.com>
In-Reply-To: <20200707074941.28078-1-peter.chen@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [116.232.13.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f058f363-af53-4898-f38b-08d82a188cfc
x-ms-traffictypediagnostic: AM5PR0402MB2738:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR0402MB2738B9CBDF06C5B9FBFF02EA8B7C0@AM5PR0402MB2738.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6zn2Dzk2GgNAeirstuX+A129sPS0ZVCGMRDomvpfsu3CpU5UGk3sQdNx5JTZSryb9bNZDa8EfTS2a1UO9QczimYuoOoahSvoe8GLa7yqhVGkL2tyYPSjIV7V/I6kPKyzaq7IoNGZPbLw9xXTVmclOwNVAsZiTBRRV9lMOPHGxcfI5gZlqejor0wwkebKtGrZqrFo8dvm6AtLeGJp6/vPad96bBoI+Yj3fr/yJcU0mFE4UNM1h0+naIOYkWxiAlnntIOe2dd5GyFC4qiXnr6OypT8+xzXuar46cfrD6oH1LzVDkE7szbiuZD9aSmq6K/mMCepCdgb3ZFiEJVDWcdyfQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(6506007)(316002)(7696005)(55016002)(86362001)(44832011)(26005)(110136005)(9686003)(54906003)(64756008)(2906002)(8676002)(478600001)(33656002)(66946007)(186003)(66556008)(8936002)(66476007)(66446008)(4326008)(83380400001)(5660300002)(52536014)(71200400001)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3aboMnuRRpIpxxXg6TEZk8eVbEcUNSevrHLpcQoq6Sq6lUw6F24YMMu4l9WFZivGqtn8jaUWwliTMtbmlDZKcJX85gYdXHO4T4c89nQmrifuMihSuj41W6A4LsvCOOOQqL1cXHFDwgXdd0cZG5WXUpefREB8LgeRQbc9na3yKQ/rofnW2rSwNv0Bz8Vgkgk/45YZwGvX+yhxL4QkTfkitoEB6faFLpPM6mYTpAsr6Nms9P0eA4kuVXFwfm+taHw+RfHX+UHgLXuLmCzSF3J0wIXiR3yMLU4AzDRTtNu99hAfeBCSY26+A6QoSPHR/XSc6YrVX1iQbBXZfTm96Mj/9eI01OyTMiD2vP6QFVC62D5ETm9KGo+P3fMHWYoSxlBujjh5gTIFZxOUroFiuzqVF2ySrDmuhDuCJdnJT/DfzLkOtO4+B3Aw/JLNvX1GXcWRZN89x53AxKsNw5wE/2Q70Fbm9iYWanwpdAgjglGam6QVyJSNWRpc32a+KSeM3v63
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f058f363-af53-4898-f38b-08d82a188cfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2020 06:13:40.4878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w8ncW77IxN9LzvPDJlpCrhg3PEAP3Ihsp98EWHmCxopNLXDIe4438LqqyzO3dfjRiNOMVHAkpuT0yVhV+zJkMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2738
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KUGluZy4uLg0KDQpQZXRlcg0KDQo+IA0KPiBIaSBGZWxpcGUgJiBNYXRoaWFzLA0KPiANCj4g
SW4gdGhpcyBzZXJpZXMsIGl0IGFkZHMgY2RuczMgcnVudGltZSBQTSBzdXBwb3J0IGFzIHdlbGwg
YXMgc29tZSB4aGNpLXBsYXQgY2hhbmdlcywNCj4gYW5kIHZlcmlmaWVkIGF0IE5YUCBpLk1YOFFN
IGFuZCBpLk1YOFFYUCBwbGF0Zm9ybXMuDQo+IA0KPiBQYXRjaCAxLTM6IGFkZCBtYWluIHJ1bnRp
bWUgUE0gc3VwcG9ydCBmb3IgY2RuczMgY29yZSBhbmQgaW14IGdsdWUgbGF5ZXIgUGF0Y2ggNC0N
Cj4gOTogYWRkIHBsYXRmb3JtIGRhdGEgc3VwcG9ydCBhbmQgdHdvIHF1aXJrcyBmb3IgeGhjaS1w
bGF0LmMuDQo+IC0gLnN1c3BlbmRfcXVpcmsgZm9yIHBsYXRmb3JtIHNwZWNpYWwgc2VxdWVuY2Ug
YmV0d2VlbiB4aGNpX2J1c19zdXNwZW5kIGFuZA0KPiB4aGNpX3N1c3BlbmQuDQo+IC0gYWRkIFhI
Q0lfU0tJUF9QSFlfSU5JVCBxdWlyayBmb3Igc2tpcCBQSFkgbWFuYWdlbWVudCBmcm9tIEhDRCBj
b3JlLg0KPiANCj4gQ2hhbmdlcyBmb3IgdjU6DQo+IC0gQWRkcmVzcyBHcmVnJ3MgY29tbWVudHMg
Zm9yIG1vcmUgb2J2aW91cyBQSFkgcG93ZXIgY29udHJvbGxlciBBUElzIFtQYXRjaCAxLzJdDQo+
IC0gT25lIGJ1aWxkIHdhcm5pbmcgZnJvbSBrZXJuZWwgdGVzdCByb2JvdA0KPiANCj4gQ2hhbmdl
cyBmb3IgdjQ6DQo+IC0gQWRkcmVzcyBKdW4gTGkncyBjb21tZW50cyBmb3IgY2RuczMgY29yZSBj
aGFuZ2VzIFtQYXRjaCAyXQ0KPiAtIFNvbWUgc21hbGwgZml4ZXMgZm9yIGNkbnMzLWlteCBmb3Ig
Q0xLXzEyNV9SRVEgYml0DQo+IC0gUmViYXNlIHRoZSBsYXRlc3QgdXNiLW5leHQNCj4gDQo+IENo
YW5nZXMgZm9yIHYzOg0KPiBBZGQgSnVuIExp4oCZcyByZXZpZXdlZC1ieSBbUGF0Y2ggMSBhbmQg
UGF0Y2ggNl0gQWRkIE1hdGhpYXPigJlzIGFja2VkLWJ5IFtQYXRjaCA0LTZdDQo+IFNvbWUgd2Fr
ZXVwIGxvZ2ljIGltcHJvdmVtZW50IFtQYXRjaCAyXSBBZGQgZGVkaWNhdGVkIHdha2V1cCBpbnRl
cnJ1cHQgZm9yIGNvcmUsDQo+IGFuZCBpbXByb3ZlIHRoZSBjb21taXQgbG9nIFtQYXRjaF0gRml4
IGJ1aWxkIGVycm9yIGZvdW5kIGJ5IGtidWlsZCB0ZXN0IHJvYm90IFtQYXRjaA0KPiAzXSBVc2lu
ZyB4aGNpX3BsYXRfcHJpdiBxdWlyayBmb3Igc2tpcCBQSFkgaW5pdGlhbGl6YXRpb24gW3BhdGNo
IDcsIHBhdGNoIDldIFNvbWUgb3RoZXINCj4gdHlwbyBhbmQgdGlueSBpbXByb3ZlbWVudHMNCj4g
DQo+IENoYW5nZXMgZm9yIHYyOg0KPiAtIEFkZCB0aGUgMXN0IHBhdGNoLiBXaXRob3V0IGl0LCB0
aGUgYnVpbGQgb24gdGhlIHVzYi1uZXh0IHdpbGwgZmFpbC4NCj4gLSBDaGFuZ2UgdGhlIHN1Ympl
Y3QgZm9yIGNvdmVyIGxldHRlciBhIGxpdHRsZSB0byByZWZsZWN0IGFsbCBjb250ZW50cy4NCj4g
DQo+IFBldGVyIENoZW4gKDkpOg0KPiAgIHVzYjogY2RuczM6IGludHJvZHVjZSBzZXRfcGh5X3Bv
d2VyX29ue29mZn0gQVBJcw0KPiAgIHVzYjogY2RuczM6IGFkZCBydW50aW1lIFBNIHN1cHBvcnQN
Cj4gICB1c2I6IGNkbnMzOiBpbXg6IGFkZCBnbHVlIGxheWVyIHJ1bnRpbWUgcG0gaW1wbGVtZW50
YXRpb24NCj4gICB1c2I6IGhvc3Q6IHhoY2ktcGxhdDogYWRkIHBsYXRmb3JtIGRhdGEgc3VwcG9y
dA0KPiAgIHVzYjogaG9zdDogeGhjaS1wbGF0OiBhZGQgLnN1c3BlbmRfcXVpcmsgZm9yIHN0cnVj
dCB4aGNpX3BsYXRfcHJpdg0KPiAgIHVzYjogaG9zdDogeGhjaS1wbGF0OiBkZWxldGUgdGhlIHVu
bmVjZXNzYXJ5IGNvZGUNCj4gICB1c2I6IGhvc3Q6IHhoY2ktcGxhdDogYWRkIHByaXYgcXVpcmsg
Zm9yIHNraXAgUEhZIGluaXRpYWxpemF0aW9uDQo+ICAgdXNiOiBjZG5zMzogaG9zdDogYWRkIC5z
dXNwZW5kX3F1aXJrIGZvciB4aGNpLXBsYXQuYw0KPiAgIHVzYjogY2RuczM6IGhvc3Q6IGFkZCB4
aGNpX3BsYXRfcHJpdiBxdWlyayBYSENJX1NLSVBfUEhZX0lOSVQNCj4gDQo+ICBkcml2ZXJzL3Vz
Yi9jZG5zMy9jZG5zMy1pbXguYyAgIHwgMjAzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tDQo+ICBkcml2ZXJzL3VzYi9jZG5zMy9jb3JlLmMgICAgICAgIHwgMTk2ICsrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLQ0KPiAgZHJpdmVycy91c2IvY2RuczMvY29yZS5oICAgICAgICB8
ICAxNiArKysNCj4gIGRyaXZlcnMvdXNiL2NkbnMzL2RyZC5jICAgICAgICAgfCAgIDMgKw0KPiAg
ZHJpdmVycy91c2IvY2RuczMvZ2FkZ2V0LmMgICAgICB8ICAgNCArDQo+ICBkcml2ZXJzL3VzYi9j
ZG5zMy9ob3N0LWV4cG9ydC5oIHwgICA2ICsNCj4gIGRyaXZlcnMvdXNiL2NkbnMzL2hvc3QuYyAg
ICAgICAgfCAgNDggKysrKysrKysNCj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS1wbGF0LmMgICAg
fCAgMzYgKysrKystDQo+ICBkcml2ZXJzL3VzYi9ob3N0L3hoY2ktcGxhdC5oICAgIHwgICAxICsN
Cj4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5oICAgICAgICAgfCAgIDEgKw0KPiAgMTAgZmlsZXMg
Y2hhbmdlZCwgNDY2IGluc2VydGlvbnMoKyksIDQ4IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4g
Mi4xNy4xDQoNCg==
