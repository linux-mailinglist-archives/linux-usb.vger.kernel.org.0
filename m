Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5504F29A25E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Oct 2020 02:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504154AbgJ0Bui (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Oct 2020 21:50:38 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:25821
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2504152AbgJ0Bug (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Oct 2020 21:50:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCAnHsMCdX46n6Ei0KHlsj2b1ASo97oayQtrpUoOoBBTqOTJmT4XCDvCjOry9ZRqBLaZEvMPbu+l1O3tIV4K2WQ7P7HDFDoIg68Qd1/oBoeKPgmusp0OwP1s2OKSL4g5vsBXhBLnKctXgZd7IMHOBisgdrPjo8Gklr74naxmEHW/iJN4rlMaWXgpzWP+7aC8yZ7bYut4VdHTd03gKnhzmeLdpKF/HuHDpOxYASG57jaZyLb1+1GfqatQY3ueE98hpBf/ekt1/EC5Cfd1FvOWZAmCFONCiee3SyHTtjRruEhQ76OBVLubJtHy/vos9BBNf4KB3q6ZJ6OyFnRgQUc7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvcDzMCSt0obsPlNNK8Jj/YovFxR2Kb95bcbMCWnUD0=;
 b=XZZNsijE+dxp4FgYMk+ueZshNm4olChGKwFBj5+4S467sgPzhpSyE0cLWZlIBamHCOes6qUgdOucradTtQS5krE/fUqKEw7l2csyDJoJgTYJKHcp1loZar6YMUkXDvOvLYIb6/FWV4M7ZJqKGqlcziJnd8gaogVxhzoyDyJJ26rqW96WlpvL0190A8dDqk+ORylPAo9o4dwj+elPwGDCZkAc1vVkrBgOr/Kj2QthxUpYFjpxNGjr6s3NpMX6TxyLZydP1lF+5NPr6kzmpM/nLnbiDj0tMsydHywsC1YBFEQ9okMGMxhqvyyikFR7anJN7RXx/ArYSUS/IvLwdd+gWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvcDzMCSt0obsPlNNK8Jj/YovFxR2Kb95bcbMCWnUD0=;
 b=a2s2s+0Gmcy3QyEQsp+oWe0wOxrpN7DAWYUpb26Pjb7AyesibU6pab3SmUp9hpCjrYI4RRru1KkEsJJrxp6OxEGPcKP28qpFCIS+jfZ0g49qToFlYjYS7U1UZjfestcQliwtIiLVnyMUeoAGTbPXI6kJ8a1W/Qk8I0Ss6lNK8S8=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR0402MB3364.eurprd04.prod.outlook.com (2603:10a6:208:17::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 27 Oct
 2020 01:50:32 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 01:50:32 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>
Subject: RE: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Topic: [PATCH 1/2] usb: host: add XHCI_CDNS_HOST flag
Thread-Index: AQHWqB+8EkbyC5HZU0qhM2+GN/QOFamqAbAAgAC07bA=
Date:   Tue, 27 Oct 2020 01:50:32 +0000
Message-ID: <AM8PR04MB73003D7F9CD52561E69616108B160@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <20201022030133.19528-1-peter.chen@nxp.com>
 <e3f75fb0-8fab-357f-d3f4-ca122995166a@linux.intel.com>
In-Reply-To: <e3f75fb0-8fab-357f-d3f4-ca122995166a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [180.164.158.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 145b9c02-e1a1-452b-6db3-08d87a1ab0b9
x-ms-traffictypediagnostic: AM0PR0402MB3364:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR0402MB3364F119FC8F52F6470127748B160@AM0PR0402MB3364.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:741;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EzZ723uYj7wQf08vtot0+wAKlgu0P/nlNDN/I8AyIY76JcuY5BC/iazn9MQLVovqcwo4duJ58SoxObIKyU6Pff/CD3W2HxmdZEaIBd6yLSGkL0oH7PXEKPjm3SWjmTyDNglg3hOZXrVXbIhM9+pXom65SFcFmfSAXDBivEsWUvC7uE5doWprRYgcDPGiOwqd5xCJWhV79FBHaLjiSceYinOI3vzSpWPq8Scvavvwpvwf8CCPv/RTgj33oIvFaFRyqZ3Je0sCZYEahDAp1kUEVzkVw77Byl8Yq/5cvXkxLCuUKLWPDa4kBgu7OOe374m+3F3BhsuCDiY2o2xDeogsFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(52536014)(316002)(4326008)(110136005)(76116006)(54906003)(2906002)(66476007)(66946007)(83380400001)(86362001)(44832011)(9686003)(66556008)(64756008)(66446008)(71200400001)(33656002)(6506007)(5660300002)(26005)(8936002)(186003)(55016002)(8676002)(7696005)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VRZgYCTLvj8bKMGEF6tyd3n6tggaqU2WCf1W/wPNgaQ3WyATg7qdw6rSpMZKDbtSiWAolgZJOaRERI8tv/eTiYhPDTzqpPzEIAb/n/Kx1cmHnpnLgsTNQlrbPxkfgHqTKw1t5i+ifYzjRBnufBZikcoWZHRfiTMj6G9S2H8OTBTAlvmj8zHcc2YuiOikd5BS2ft7mC8bEJZ3MY0mAxethBcEejq0799GBWNE1dG0qN2MI8mzA2sjbNDqIqIvti4ToZx+/jue4Q9GEeEI9262EnaweYfIvazMQZGub+gHCMg0vAjhCEuim64OuVd6hn7z+AjDluA7ekXPuIMzvk9gmcCTjPGI2TOQMi2RIQxh1n+QjDdOpbjdMju/U8l3HypqHImylV8v8sFr4PFWDQ8DyLxhwM8HpS+1Okqgrhh0v2LDgvhqlHzuWIkPbnNzjvs5HNcHs0vt0uZabwxCMZDFQ881yHHVGcWDv7USWhvvizqRUZHnCD+D8jknmYvr0y/NfZYEFHi4Ug0tYoIeqdGWTigs/dzYAXqJ7X+M6m/YvRphW4Ejt9qWt50JEbgQjPDCCVIH3xfYAl/p5br5eng1aDj5AHuAGAamOj4zl9ZqFnVhqwngAfyKNoHxLwjCN6zcmW9p7tfgK2eiw8eAAVsypA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 145b9c02-e1a1-452b-6db3-08d87a1ab0b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 01:50:32.4440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +RjwEwkP6Hr10LRDgKZP/ZD1ohuEU29RWepmkoVEx/6WvCZ0ylU4dkX62CiIU6+aLgEb54xh0xhUbJNQcFMDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3364
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiA+IENjOiBQYXdlbCBMYXN6Y3phayA8cGF3ZWxsQGNhZGVuY2UuY29tPg0KPiA+IENjOiBS
b2dlciBRdWFkcm9zIDxyb2dlcnFAdGkuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIENo
ZW4gPHBldGVyLmNoZW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy91c2IvaG9zdC94
aGNpLmMgfCAyICstDQo+ID4gIGRyaXZlcnMvdXNiL2hvc3QveGhjaS5oIHwgMSArDQo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLmMgYi9kcml2ZXJzL3VzYi9ob3N0L3ho
Y2kuYyBpbmRleA0KPiA+IDQ4MmZlOGM1ZTNiNC4uZmM3MmEwM2RjMjdmIDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvdXNiL2hvc3QveGhjaS5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94
aGNpLmMNCj4gPiBAQCAtMTkzLDcgKzE5Myw3IEBAIGludCB4aGNpX3Jlc2V0KHN0cnVjdCB4aGNp
X2hjZCAqeGhjaSkNCj4gPiAgCSAqIFdpdGhvdXQgdGhpcyBkZWxheSwgdGhlIHN1YnNlcXVlbnQg
SEMgcmVnaXN0ZXIgYWNjZXNzLA0KPiA+ICAJICogbWF5IHJlc3VsdCBpbiBhIHN5c3RlbSBoYW5n
IHZlcnkgcmFyZWx5Lg0KPiA+ICAJICovDQo+ID4gLQlpZiAoeGhjaS0+cXVpcmtzICYgWEhDSV9J
TlRFTF9IT1NUKQ0KPiA+ICsJaWYgKHhoY2ktPnF1aXJrcyAmIChYSENJX0lOVEVMX0hPU1QgfCBY
SENJX0NETlNfSE9TVCkpDQo+ID4gIAkJdWRlbGF5KDEwMDApOw0KPiA+DQo+ID4gIAlyZXQgPSB4
aGNpX2hhbmRzaGFrZSgmeGhjaS0+b3BfcmVncy0+Y29tbWFuZCwNCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy91c2IvaG9zdC94aGNpLmggYi9kcml2ZXJzL3VzYi9ob3N0L3hoY2kuaCBpbmRleA0K
PiA+IDhiZTg4Mzc5YzBmYi4uNGI3Mjc1YzczZWE1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QveGhjaS5oDQo+ID4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLmgNCj4gPiBA
QCAtMTg3Nyw2ICsxODc3LDcgQEAgc3RydWN0IHhoY2lfaGNkIHsNCj4gPiAgI2RlZmluZSBYSENJ
X1NOUFNfQlJPS0VOX1NVU1BFTkQgICAgQklUX1VMTCgzNSkNCj4gPiAgI2RlZmluZSBYSENJX1JF
TkVTQVNfRldfUVVJUksJQklUX1VMTCgzNikNCj4gPiAgI2RlZmluZSBYSENJX1NLSVBfUEhZX0lO
SVQJQklUX1VMTCgzNykNCj4gPiArI2RlZmluZSBYSENJX0NETlNfSE9TVAkJQklUX1VMTCgzOCkN
Cj4gPg0KPiA+ICAJdW5zaWduZWQgaW50CQludW1fYWN0aXZlX2VwczsNCj4gPiAgCXVuc2lnbmVk
IGludAkJbGltaXRfYWN0aXZlX2VwczsNCj4gPg0KPiANCj4gSXMgdGhlIFhIQ0lfQ0ROU19IT1NU
IHF1aXJrIGJpdCBzZXQgaW4gc29tZSBvdGhlciBwYXRjaHNlcmllcz8NCj4gDQoNCkN1cnJlbnRs
eSwgbm8sIG9ubHkgYXQgdGhlIGZ1bmN0aW9uIG9mIHhoY2lfcmVzZXQgaW4gdGhpcyBjb21taXQu
DQoNClBldGVyDQoNCg0K
