Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703452CB2D5
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 03:32:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgLBCaa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 21:30:30 -0500
Received: from mail-eopbgr130084.outbound.protection.outlook.com ([40.107.13.84]:36256
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727099AbgLBCaa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Dec 2020 21:30:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y893s0PyivPaYNtMHeDvEU8tjVesAgfKAc/fOSF/Kp+hLvxq+oHQGSBiL81WoKhNZgU1aPM8vTFMs6OnyjnOvZkwcwUsRjG6jKCDCw94Ex+FLgySPGIK1pHAX4SqnnsnlbNDFATDsHR0TNogkTE+dyHaUpiEGDF+01YJOnOZlH617xAUAkx/tgng6tr6JJ0qmfGMEZOdur0ba+kWVP97DDAWoQiKzC7jhgmHVoGC1ZD/VJeoqEG6BR8nghflLGQxDHd0UNIH2nkZ6AGmvVp4DBjTFA8PjPPdGWcJd+gCB5ZLTmR+PpEmLIkZJm+MTflKltuJVTYuq2DaqaU0/s7Bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3kh7lGtJXTwo7ybaw38k6+cmrm0pegcKrmRlYL89DE=;
 b=Pb5BrmjyZFnIADx8pC0zPnY7v7yjPzKS3JI2jakujDFqsLtcm+2F/QpgELgTEn2UGh+dafpsyBDy/sLqIVVYTwcBrbVqXszV75M3qlC4F6RtZuN/BGNvO2WJlL8kqEZH/PZ/ZCOV8AF5kUt++RPLu8bHTqOUZxJQEv79ezVW6LDakr/77/3bNhW8Raz7Vw4bAgo3VU6cbBfarRRK2pHPGppIIXvcz9RAt370DT8ISOoLPtcpLEEUH5FrP18tr2TONrYToVmnpiOSSIpUeSESPl8HYhUKZZ33LMiF6FDImMWlZ1Xnv6+vh47h7e4/kN4+Jcc9UGHFVO5EDtbwTmG3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I3kh7lGtJXTwo7ybaw38k6+cmrm0pegcKrmRlYL89DE=;
 b=A4rwJ2iSPLUBgz8S9CqMZVR9P0FB3Joio/PWjjJbUL0TvhcA/cQ58PR/t/d+RHm1erfSJe98lD09glpfD6aks1zr4pEXOUTg4suYE+26hoycwq9MzbZJqJYiBaXr2IukTuRtbb+8bKIXWg8KxC7yU+CyCyhyM0EBUUMgZCWd5xA=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB6191.eurprd04.prod.outlook.com (2603:10a6:803:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 02:29:37 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3611.032; Wed, 2 Dec 2020
 02:29:37 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] usb: dwc3: gadget: fix delayed status missing for clear
 EP halt
Thread-Topic: [PATCH] usb: dwc3: gadget: fix delayed status missing for clear
 EP halt
Thread-Index: AQHWx7PLOvMNNuK4pUO3s8ukQgQrPqnid4mAgACeqEA=
Date:   Wed, 2 Dec 2020 02:29:37 +0000
Message-ID: <VE1PR04MB65281BB0DE22D75D3C1F60A289F30@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1606807357-12574-1-git-send-email-jun.li@nxp.com>
 <e077da14-0741-9374-9ac0-6670a65cb719@synopsys.com>
In-Reply-To: <e077da14-0741-9374-9ac0-6670a65cb719@synopsys.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: synopsys.com; dkim=none (message not signed)
 header.d=none;synopsys.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 564d7533-9a7f-420f-05e0-08d8966a1d2c
x-ms-traffictypediagnostic: VI1PR04MB6191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB61913ADF5482720FFFFEFCB889F30@VI1PR04MB6191.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YUSunieQFpLe7i/tGA5Y8c92iwHzf36HmJjAJXDKlvSNEZckp2X6eWyZEz66bJbhsP+Bo1HhAE/GZ0nJEwU1bkri6TSgyU6xcazMxwrsLq/DnROA4gRXzx6XNOWHWwq0vjQw8U9zTE4IgAo9Xu5gvdtoGEivgMtlLDe1N9cSk5qM7iY2RZWM1hsoFRVH6sX3Oce4jsnhOfBhb4EfG+XJlJxVIVTSv8WWsbLThnKGSfO7lbFPQXDBzATg+ACJpvi0OMdNWonewUkiqe7xFQAGaifzGkF2Dv+d83gZzzShrUQlFaNVmMoUln+kalhLjHdtp1r6lExUIKK1OLcF86P20j9eAPzoHAq31Sow09En5kwfnJ3z6HhiRe1VQVMOLat3TjRX0sAWOdTnZBifjKqdkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(8936002)(6506007)(45080400002)(478600001)(966005)(186003)(4326008)(316002)(26005)(8676002)(54906003)(44832011)(110136005)(86362001)(55016002)(2906002)(5660300002)(9686003)(33656002)(66476007)(52536014)(66446008)(76116006)(66946007)(64756008)(53546011)(83380400001)(7696005)(71200400001)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?YUNQeXFodzBOK2ExaERocmE4WkpKR3FFdkpCNTdVTmhnelNWSDRzZEhTa3dF?=
 =?utf-8?B?d0lLUyt6NGhuVjVkT3g1TUs0THZqT3FVTnpYc1pJWHVKVWUxN1hCZXAwZUNY?=
 =?utf-8?B?Szd0a1dFQStJWlFzYzRLcGREM1h2cVBocjZUVTZEeWNQaGRzVklBVEJuSGlY?=
 =?utf-8?B?RHJ1Z1gxVzRhR1RIQmcycTlmQndXWStLMEJzTDlJWEM4YWhCRkJRbGM4TGxZ?=
 =?utf-8?B?cUREUjZtUXRtRnlLM2RoZEFJTWlMQU1YRVBGamwwcFBKakppbG5JT20xVG1P?=
 =?utf-8?B?RjJUY1FGbVYzNDM0NlhyTzhsOVZMd212ZTYxQllHaFBxNDZpU1N6QlZYZld2?=
 =?utf-8?B?VC92Qmt6dit3WHZkeENySHNxN29yOVVyZUwwbGtJenNDNytvbzN6VW9zZXpn?=
 =?utf-8?B?eFZQLzl0d0pyOEpkakhDV1YxMnJDeHg3WVlqOTJsM2Z0SGtIdngrblZ3RGdv?=
 =?utf-8?B?dEhsSVJlclNMNUU0QmFGQXIzcFFOSThLUitqMGY0OEdvcU5mWWZXYWpjUFFr?=
 =?utf-8?B?Z05iNGFZek1WbEJsR1dJMk1XcGIxRVZoL1FWdE02STR0TXBjb1ZEWklQV0xj?=
 =?utf-8?B?MjlCTVJQUkl5SEhPNHZiZlNMREtueXZaRFROdHZGYUcvT0FOc2FRN2VRVW1G?=
 =?utf-8?B?Ny8xM2taaHV6TzZSazdMOHJoY01LQWlReWpBRklqbmdZam5kUXJmSFRXeXo0?=
 =?utf-8?B?WFpIcHo1RHFoaWxBSHB6MHE0emJzcGRXOGE5K1JadmhobDZoOWxnMHZ4TDZX?=
 =?utf-8?B?TU5PTEt5VEJIVzNhejlZOEh0U0h3TDBRcVF1OVNyUGtjd1RwSndnQVkrd3Qr?=
 =?utf-8?B?K2E5ZzJIeUVHZjZ2RG1xeTJCajNIT0FvbllPb1g2UStBZG5HVUFSekNHZDAz?=
 =?utf-8?B?ckZzYXBkRml1N2RXdWt3cU5qRFdEWURibUwzYkxKV0VGVUx2UDArWWxpeEMx?=
 =?utf-8?B?U3E0VVF4WWg3TjRZMG8zakM3U2JRWGtjMmdnRCszVmhGYUpHZjkvcGxKakY1?=
 =?utf-8?B?Y2VORlQ1TkhuUjN5NUpoRktXLzZmWnN2OEExMUVqM1prSjIzS25kdnZFY1JO?=
 =?utf-8?B?NXh2V2FnTGRsckFnZnV2UldLZ3MxbFVyV0RmdHpEVUNsa1gvWGVFeWxhVzQ4?=
 =?utf-8?B?OFlJTkpiV3dPQmVGRDJPbUhxMktVRVJtdk42L0xSdlpRM3J2ZVROT2pWZUQv?=
 =?utf-8?B?eXNqOU1aUmhMWW1pZjJIdkFSU3F3RlhUSlpkOEQ2NXlVZXk0K1pnQys0TGdK?=
 =?utf-8?B?WElaVHpQMjg5RTJYbE43b3EwbkVvUGZqeXQxS3BqZ1RqU2NTZXY2RkpvTUJX?=
 =?utf-8?Q?0mwcy24s/ysSU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564d7533-9a7f-420f-05e0-08d8966a1d2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 02:29:37.2749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ixkfqjrIlfXeiz7Y1bnKRYP0twg2iCTI9J9Ws/sohCj5QGq6GWq6I0HsbjcCsWAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6191
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhpbmggTmd1eWVuIDxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIERlY2VtYmVyIDIs
IDIwMjAgMTowMCBBTQ0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT47IGJhbGJpQGtlcm5l
bC5vcmcNCj4gQ2M6IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBUaGluaCBOZ3V5ZW4gPFRo
aW5oLk5ndXllbkBzeW5vcHN5cy5jb20+Ow0KPiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnOyBk
bC1saW51eC1pbXggPGxpbnV4LWlteEBueHAuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB1
c2I6IGR3YzM6IGdhZGdldDogZml4IGRlbGF5ZWQgc3RhdHVzIG1pc3NpbmcgZm9yIGNsZWFyDQo+
IEVQIGhhbHQNCj4gDQo+IEhpLA0KPiANCj4gTGkgSnVuIHdyb3RlOg0KPiA+IFdpdGggc2V2ZXJh
bCBpbXByb3ZlbWVudHMgb24gaGFuZGxpbmcgb2YgQ2xlYXJGZWF0dXJlKGhhbHQpLCB0aGVyZSBp
cw0KPiA+IG9uZSBjYXNlIG9mIGRlbGF5ZWQgc3RhdHVzIG1pc3Npbmc6IGlmIHRoZSB4ZmVybm90
cmVhZHkgZXZlbnQgY29tZXMNCj4gPiBhZnRlciBlbmQgdHJhbnNmZXIgYW5kIGNsZWFyIGVwIHN0
YWxsIGNvbW1hbmQgY29tcGxldGlvbiwgd2UgY2FuIG5vdA0KPiA+IHNlbmQgdGhlIGRlbGF5ZWQg
c3RhdHVzIGluIGR3YzNfZXAwX3NlbmRfZGVsYXllZF9zdGF0dXMoKSBhcyB0aGUNCj4gPiBlcDBz
dGF0dXMgaXMgbm90IHJlYWR5LCB0aGVuIGluIHhmZXJub3RyZWFkeSBldmVudCB3ZSBzdGlsbCBj
YW4gbm90DQo+ID4gc2VuZCBzdGF0dXMgYmVjYXVzZSBkZWxheWVkX3N0YXR1cyBpcyBzdGlsbCBz
ZXQuDQo+ID4NCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiA+IEZpeGVzOiBkOTdj
NzhhMTkwOGUgKCJ1c2I6IGR3YzM6IGdhZGdldDogRU5EX1RSQU5TRkVSIGJlZm9yZQ0KPiA+IENM
RUFSX1NUQUxMIGNvbW1hbmQiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IExpIEp1biA8anVuLmxpQG54
cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2R3YzMvZXAwLmMgfCA4ICsrKysrKyst
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9lcDAuYyBpbmRleA0KPiA+IDdiZTM5MDMuLjk1ODBlOWYgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy91c2IvZHdjMy9lcDAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMN
Cj4gPiBAQCAtMTA1OCwxMCArMTA1OCwxNiBAQCB2b2lkIGR3YzNfZXAwX3NlbmRfZGVsYXllZF9z
dGF0dXMoc3RydWN0IGR3YzMNCj4gPiAqZHdjKSAgew0KPiA+ICAJdW5zaWduZWQgaW50IGRpcmVj
dGlvbiA9ICFkd2MtPmVwMF9leHBlY3RfaW47DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBJZiB3
ZSBhcmUgcmVhZHkgdG8gc2VuZCBkZWxheWVkIHN0YXR1cw0KPiA+ICsJICogYnV0IHdhaXQgc3Rh
dHVzIHBoYXJzZSwgd2UgY2FuIGNsZWFyDQo+ID4gKwkgKiBkZWxheWVkX3N0YXR1cyBmbGFnIHRv
IGxldCBFUDAgWGZlck5vdFJlYWR5DQo+ID4gKwkgKiBoYW5kbGUgaXQgYXMgYSBub3JtYWwgc3Rh
dHVzIHNlbmRpbmcuDQo+ID4gKwkgKi8NCj4gPiArCWR3Yy0+ZGVsYXllZF9zdGF0dXMgPSBmYWxz
ZTsNCj4gPiAgCWlmIChkd2MtPmVwMHN0YXRlICE9IEVQMF9TVEFUVVNfUEhBU0UpDQo+ID4gIAkJ
cmV0dXJuOw0KPiA+DQo+ID4gLQlkd2MtPmRlbGF5ZWRfc3RhdHVzID0gZmFsc2U7DQo+ID4gIAlf
X2R3YzNfZXAwX2RvX2NvbnRyb2xfc3RhdHVzKGR3YywgZHdjLT5lcHNbZGlyZWN0aW9uXSk7ICB9
DQo+ID4NCj4gDQo+IFRoaXMgZml4IGlzIGFscmVhZHkgdXBzdHJlYW1lZDoNCj4gZmEyN2UyZjZj
NWU2ICgidXNiOiBkd2MzOiBlcDA6IEZpeCBkZWxheSBzdGF0dXMgaGFuZGxpbmciKQ0KPiANCj4g
aHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGZ2l0LmsNCj4gZXJuZWwub3JnJTJGcHViJTJGc2NtJTJGbGludXglMkZrZXJuZWwl
MkZnaXQlMkZ0b3J2YWxkcyUyRmxpbnV4LmdpdCUyRmMNCj4gb21taXQlMkYlM0ZpZCUzRGZhMjdl
MmY2YzVlNjc0ZjNmMTIyNWY5Y2E3YTc4MjFmYWFmMzkzYmImYW1wO2RhdGE9MDQlN0MNCj4gMDEl
N0NqdW4ubGklNDBueHAuY29tJTdDYjRmNzBmNWVlZGNjNDY3ZTBlZTcwOGQ4OTYxYTlmNzQlN0M2
ODZlYTFkM2JjMmINCj4gNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzQyNDM4ODQw
NDc1NTg3MyU3Q1Vua25vd24lN0NUV0ZwYkdac2INCj4gM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlM
Q0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTcNCj4gQzEwMDAm
YW1wO3NkYXRhPTZscE9qJTJGV1V2TGMlMkZuRVlhT29MallxNkpMRXFkaG1KU21jWHBzVDglMkJ1
MFElM0QmYW0NCj4gcDtyZXNlcnZlZD0wDQoNCkFoLCBJIG1pc3NlZCB0aGF0LCBzbyBpZ25vcmUg
bXkgcGF0Y2guDQoNClRoYW5rcw0KTGkgSnVuDQo+IA0KPiBUaGFua3MsDQo+IFRoaW5oDQo=
