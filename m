Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1B35F28E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 08:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfGDGHh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 02:07:37 -0400
Received: from mail-eopbgr60070.outbound.protection.outlook.com ([40.107.6.70]:17610
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725861AbfGDGHh (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 4 Jul 2019 02:07:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ16Ib3XMCJDYOLoPtc3TeNDgJHEQhwcHF2IuVctsXg=;
 b=iq/ulQUzMmW8AZVLYPbtui9ag/SoR3kGxe2QGds1mIUxDVCNDmQTZBPItwEmycR9TQ9+UT2l6g7DnkJ2HNJMLEj9VjQNYelmphtYUiuvpVuRnnEj+S2EPRs6eXoPyN8hAUtAtQCwb9DdeprIrjsPrn49GMB3OFNpJf7/nvR4unM=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.52.16) by
 VI1PR04MB6062.eurprd04.prod.outlook.com (20.179.25.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Thu, 4 Jul 2019 06:07:34 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c1bf:7842:6630:b87a%7]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 06:07:33 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Kai Ruhnau <kai.ruhnau@target-sg.com>
CC:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: No carrier lost information with gadget RNDIS/ECM
Thread-Topic: No carrier lost information with gadget RNDIS/ECM
Thread-Index: AdUsFPmU+UglLYdrSGuD1S1toRlligAA5T8AAAEwZfAAJNKCgAAS92iQABTOtQAADByYoAANCr7wAIiH2PAABPEL0AAkgO9AAAj0V4AAA/2TMAACNVdgAF1YWiA=
Date:   Thu, 4 Jul 2019 06:07:33 +0000
Message-ID: <VI1PR04MB5327B582FFEF33AA52F7E6C58BFA0@VI1PR04MB5327.eurprd04.prod.outlook.com>
References: <AM0PR02MB3841F110F7B6931A087DF566C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <87o92kk0ih.fsf@linux.intel.com>
 <AM0PR02MB384108B692229DF41816A363C5E20@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <871rzffszm.fsf@linux.intel.com>
 <AM0PR02MB38418BFC9965F044B307B13CC5FD0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <CAL411-oZUtL6LETk+oNZXXezeLK4PahPz3_iVZJiM33A3KLaqw@mail.gmail.com>
 <AM0PR02MB38419422D499F45C8475A000C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <AM0PR02MB38415FA372C7A8B8B7BAFF22C5FC0@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <VI1PR04MB5327BA15817CA04C5ACC4A8C8BF90@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <AM0PR02MB3841CFA0BC4FC084D8517E00C5F90@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <VI1PR04MB532799F3F92BCBD8616B51868BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <AM0PR02MB38416C39915E57C8855BBDA7C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
 <VI1PR04MB5327E9F0660A36A52A3E258E8BF80@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <AM0PR02MB3841A430DEB6ECEC0CBEE9B6C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
In-Reply-To: <AM0PR02MB3841A430DEB6ECEC0CBEE9B6C5F80@AM0PR02MB3841.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2887dc49-0a6d-4d42-11bf-08d70045e7e9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB6062;
x-ms-traffictypediagnostic: VI1PR04MB6062:
x-microsoft-antispam-prvs: <VI1PR04MB6062E2E7A86689A95730E9948BFA0@VI1PR04MB6062.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(189003)(199004)(52536014)(256004)(4326008)(76116006)(8676002)(76176011)(71190400001)(81166006)(81156014)(446003)(305945005)(316002)(6506007)(73956011)(33656002)(71200400001)(102836004)(2906002)(26005)(478600001)(74316002)(64756008)(186003)(66556008)(66476007)(25786009)(5660300002)(229853002)(66946007)(44832011)(66446008)(6246003)(54906003)(7736002)(8936002)(9686003)(11346002)(68736007)(53936002)(6436002)(86362001)(486006)(7696005)(55016002)(4744005)(3846002)(66066001)(99286004)(6916009)(6116002)(14454004)(476003);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6062;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H1VDp8pNwSL7FiX4TDlmKD8VvJiS42XyvII38FVeHQo5a5tzNKjXxlzy8E4hc70MpLkEOClyvcReytOxwd/rrlMq3zuy5oRiZ5NNhFy+BTzRwuO7ZPxPTCAYsuqvAcYz9kzbRMc0CQcaMalYKJN5Km5BwhMR/wX6slwu6Jlw5aEKgJss3wUeyAxs6+O1EhTpp6Xcet0PBMVCPEdKFMntmYkHXgmbyvuap9XTl3jE91I8yBCAF49WlCXl2enbsva5/ny6fevqFNHzm7LKHOaDv8T2AY5LB6OLLRJ4dO2paMyFR+sGKnTHgi5SmLVVzXor79I3iG00zj4yqoPbnq9zFbhw/fYQA6yXyTKH0FBFCMC31ackutLPiWdvxfHXOCPaXudJ8pkgDIv9T2M36lmSXPmw3m0u5i+Hx+fM79Z+HvY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2887dc49-0a6d-4d42-11bf-08d70045e7e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 06:07:33.8759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: peter.chen@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6062
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

IA0KPiANCj4gPiBEbyB5b3UgaGF2ZSBhbnkgY29tcG9uZW50cyBhdCBWQlVTPw0KPiANCj4gVGhl
cmUgd2VyZSBFU0QgcHJvdGVjdGlvbiBkaW9kZXMgdGhhdCBjb25uZWN0ZWQgRCsvRC0gd2l0aCBW
QlVTLiAgV2UgcmVtb3ZlZA0KPiB0aG9zZSBmcm9tIHRoZSBQQ0IgYW5kIHRoZSBwcm9ibGVtIGlz
IGdvbmUgbWVhbmluZyBWQlVTIGRpc2NoYXJnZXMgYXMNCj4gZXhwZWN0ZWQsIHRoZSBjb250cm9s
bGVyIHJ1bnRpbWUtc3VzcGVuZHMgYW5kIHVsdGltYXRlbHkgc3lzdGVtZC1uZXR3b3JrZCByZXBv
cnRzDQo+IGEgbG9zdCBjYXJyaWVyLg0KPiBUaG9zZSBkaW9kZXMgaGF2ZW4ndCBiZWVuIGEgcHJv
YmxlbSB3aXRoIDQuOSwgdGhvdWdoLiBEaWQgc29tZXRoaW5nIGNoYW5nZSBoZXJlPw0KPiBJIHN1
cGVyZmljaWFsbHkgbG9va2VkIGF0IFNSUCwgSE5QIGFuZCBBRFAsIGJ1dCBub3RoaW5nIGNhdWdo
dCBteSBleWUuLi4NCj4gDQogDQpZb3UgbmVlZCB0byBkaXNhYmxlIE9URyBzdHVmZnMgYXQgZHRz
IGlmIE9URyBhbmQgT1RHX0ZTTSBhcmUgZW5hYmxlZCBhdCBjb25maWd1cmF0aW9uLg0KU2VlIGJl
bG93Og0KDQogNjU1ICZ1c2JvdGcxIHsNCiA2NTYgICAgICAgICB2YnVzLXN1cHBseSA9IDwmcmVn
X3VzYl9vdGcxX3ZidXM+Ow0KIDY1NyAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7
DQogNjU4ICAgICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX3VzYl9vdGcxX2lkPjsNCiA2NTkg
ICAgICAgICBzcnAtZGlzYWJsZTsNCiA2NjAgICAgICAgICBobnAtZGlzYWJsZTsNCiA2NjEgICAg
ICAgICBhZHAtZGlzYWJsZTsNCiA2NjIgICAgICAgICBzdGF0dXMgPSAib2theSI7DQogNjYzIH07
DQoNCklzIGl0IGF2YWlsYWJsZSB0byBzaGFyZSB5b3VyIFVTQiBwYXJ0IHNjaGVtYXRpYz8NCg0K
UGV0ZXIgDQo=
