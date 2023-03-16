Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E19F86BC56A
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 05:56:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjCPE4x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 00:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjCPE4u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 00:56:50 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::604])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5306B945
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 21:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLUJv0jUZwlh2U1ZXvBIG2yP3cndqOz2w0EieUVeX/CTSGjS7tVYjkUyEAsIpg/kh1/CkwKYHPmeNFq9JZy3ZFkJ4t5HGw9gqVgycq8PdahGRbDqC5IWdKBaMo8BdoQuDzcTCIlhJG1Gc1Cz0jXKQhvCg+cE3zSyC9bBXJAgmFy0a191C/rdVJZX8hvHbKx2nz4NXl9+gAypBElQmCTmdyGrXR3opwPRipaabbSa/tPQIWQ+2ZQpkBEhj6Uku7uYvpD2f+uFTTnuFzYX3BXYzT16gH3fOzOMY8Zs0NIdICWfL/iLkVTlTevCXLTU88VQLc9kSxVz4IVwbYNBk6kuyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FI0Q6rwuDdVDHqz1tXGyj9flMrAI5dg87j5T9778ubI=;
 b=UHA5gUMbExawmlOnT8XdZj4e0tP/PCwDgz8bnRf7pc/fIfb9sqso7v3LlHdai2lsQsJV5soIWPdWbYJE64AFsm9+mIdtrUVyvjOMCv5mP6zjyKi950R+EQip7s0hIlLSiBmRvV//6Uw1Y/N/r+4ssdAECgoq1/A91NPXsb50Yny3mhRt9woFMk4FaGiSIGht3sbTNpw0TA7cVqssJLQ0D5M37VPl1IEbYK2kjLH0dXSA7lqN3Fo05lnDKBnETRrBr9nU1q0B1JBoC8b4S3EHK634wGJwJplJV3yW1P3ogY20o3B+fiIIe0KjeXKCrG+9yNlfM6MhwUca0QpDMbeIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FI0Q6rwuDdVDHqz1tXGyj9flMrAI5dg87j5T9778ubI=;
 b=nfJo0LdIpAaGbtnEVZVjET7AQeClDhabMWnszZZr+X49Rm6ak6yhfJx4XFsh1Vjjh8eHTaxeqrEwUbjTdT/NrC3fj+b+AvA5nhesux7oU3UgJUPqUeHvm/xhFe5lCxXl/465mizMl81XRYBI+87MeXwLsqtLMvg08qDsHEBvcxc=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by VI1PR04MB9953.eurprd04.prod.outlook.com (2603:10a6:800:1d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 04:56:45 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5b9d:2097:31d0:c3a]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::5b9d:2097:31d0:c3a%9]) with mapi id 15.20.6178.029; Thu, 16 Mar 2023
 04:56:45 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: add 2 registers dump for debugfs
Thread-Topic: [PATCH] usb: dwc3: add 2 registers dump for debugfs
Thread-Index: AQHZVy5Dr6Jl5JWP/kKY/X8oHENqoq78QTYAgACXiWA=
Date:   Thu, 16 Mar 2023 04:56:45 +0000
Message-ID: <PA4PR04MB964011E8D6B0050AE071C83289BC9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <1678876758-11272-1-git-send-email-jun.li@nxp.com>
 <20230315195312.4a5x3ziolft6fvaa@synopsys.com>
In-Reply-To: <20230315195312.4a5x3ziolft6fvaa@synopsys.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9640:EE_|VI1PR04MB9953:EE_
x-ms-office365-filtering-correlation-id: 7d33b17b-2d49-43a5-8bd2-08db25dad79e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LsczsNxqFrXyr1w1MucFb6Q4Zc0iY3Kpg9/VKREE286V55kbD859CpRKDj3gZuJ98Ho0D4Ki2vDlPXn31108DqpoMJQRn/Zj3q4N+HzBXcLzmxmv3BtzBvp2iAE/rZwpG0e0QCIPtKST50HUKfiCeCUqMVnzz/xRh06i76zc4L/WEaJlT8V+eewjEF3qtA/pThLeg1KYZ7FQNLcyyepUKbMI6pqSK2x+fS6Be+3E6YnKVQVd0wUOsvfFNOVp375BEq2p8FSQgnlr65eDfUKYiltBHW7QY8v789x0Dyz5w1ST0aawkUJc6O1aaMLCmYAoNRLbiLbL4Djpgv5Xg+0x5sDZ0NnDVffbW1zaa+wwghkybipG30ppRmMYbP6xGLj9aaSDPP1dektjUiOOudy14keL0jHJu4lEF6mLpGnKHXR6CSd/m8vySwWapiXUvJAINfJu/VExVE5oQLz9ny7I0J8E/ipTnvXfu4NBy9YXnSu30yZNFXktEtsCCN34yr+JTHN/E7HL3RAMGrF0CsM+tjKVuLIY/wd0R+8okN25k3oLiOANg1A/Vhged6zsPFmjGATSvnTs3GGpvlrWccsr6bAfOh7LxZ87Ntfvausp8JrsUy3V66HSkmXHECssOG1OsxMWJ0BtXxoVJpWWrVd91sT7QmnHGAooQAZ+G7ApVcCWuw5+aWHKgUEAarkyauqHIHXH1EM1Unkj2NIsU/3Txw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(41300700001)(8936002)(52536014)(5660300002)(44832011)(2906002)(38100700002)(86362001)(33656002)(38070700005)(122000001)(7696005)(66446008)(71200400001)(478600001)(76116006)(66946007)(64756008)(66476007)(66556008)(8676002)(83380400001)(55016003)(4326008)(6916009)(186003)(316002)(9686003)(54906003)(6506007)(53546011)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW4zZ0xFQ2ZkZG9wTUU4a2c4Sk9HeWM0M2FxTnJMLzRuanFzQUpMK28xR0Nw?=
 =?utf-8?B?S2FKRFNrSnpUbzgrU2ZMZ2NvSzk3bW5hd1QrQk9tY3lIM29Ea243OWZQZVFn?=
 =?utf-8?B?NnNLNWJkMk9Dc2xjTDc4VHJhZzhqSW54WEc4a2ZqcndWalVLaDg0TnVhb3Uy?=
 =?utf-8?B?RUlNazZXSUZ4T1EyTnZ4UWxLbFhpOEhnL3lJVXM2T1Z6Q1hTOUR2RElnQ0Y3?=
 =?utf-8?B?ak9jNkVDeTBTTEF4T0lmeVBkZHJlSWZKdnFBTUFCK2hkV3JvenV2WDJ1Ujlt?=
 =?utf-8?B?RXBEVnlRTGZQa3EwUTlPQm8vM2Rlb2I0ODBmZW9kTlJsM2h1Q1lJa3RTS25Q?=
 =?utf-8?B?ejUrTEk5VTFIMGNnS0lOdVdJVlYvOFJEUnpWVlIvU2JsaFNDR3AwUW1OV0RG?=
 =?utf-8?B?MHRiZ01WQlhlRko1TU1IS0Y0OHp6NDNzaTF4aTRad1ZNc1UvYTZNWGxSWEQ2?=
 =?utf-8?B?SzVzY1pteThJeXd0ckE0YXJ2eEJUNnBFYXBueFZzTVdNbmlMTkw5MnBaai9Z?=
 =?utf-8?B?R1JDWFZDNkx4Tng5L3kvS2p5SkkxNHMwSnhtUHRjUnpFNVhsWlk0VFFrajN5?=
 =?utf-8?B?MDRNaDJFOHFGNnFLYWF4WWYwUHA0aWpReEJDSTltMzJzUHUxUHg2cEcydmM2?=
 =?utf-8?B?Mm9MTm4rbnhmN3Exc0x5NVUwNkV6b2UrRXNvS3YreVVEVFpwaWFWdGE2TzZk?=
 =?utf-8?B?Ri9ZVkNGcGxSbDk0M1ZyWUtPc2xNYm1LMFhiS3kzdXNIbGdwWDBVT1NOREQz?=
 =?utf-8?B?NXFpcjV0VnRnSVovdHBFSmNMc1cyU0hCNnlrMUxIZDB0YXVaRE8zZElpdnJw?=
 =?utf-8?B?MGlzSG9pYXEvL0NheDFQKzFoVXZpMWlVZGpYVlJ2azhsdVdxOHpUOTNITjln?=
 =?utf-8?B?aFh1U0h5T2Zqb3F3Vm9LeTR2M2dVeW5mREVuZWRPQkg5blFrRktxbXhLdnVZ?=
 =?utf-8?B?ZEN2WEFqQkNLYnpaN0plMmNIUHJkTVZHTHhHaUZkR1Aya1krblBrRHVSNDk4?=
 =?utf-8?B?SHpNVjMvVHE1RXhYYXNhMWgrNThBaWVibURQSlM2blhsYjBZUzQvR3ZIa1RH?=
 =?utf-8?B?dGNuVGtkMWdUTEFYQlgzV2lISHlhZVBLMGtFRERjdzY5Y1NBemlyc3dQS2lh?=
 =?utf-8?B?bHpodlBoVHRyZlBxd01xTWVZRklUN3M1dGdNUUZlSnJLY2RRd0phTkZ1dnkv?=
 =?utf-8?B?SGxoOEdRZnhTUEpFK1IxWFRYbUpoYkM0Y0s1QXJOc0JvM2l1YXdKTHlaQnA4?=
 =?utf-8?B?Z3ZBMEpUZU0xeFVPRkRJUjdNMlpVTkZxTlBzd1lzNHowSzFZblkzWC9tN0xH?=
 =?utf-8?B?NXlkZGxlM2EzZmN2Q1hPSmw3MVFwOEhQN1NmbFplWEFrWW0vN3lsMzFoRW83?=
 =?utf-8?B?VVF3L2F0OGE5Tk90Yk5Dak0vRjBjTlVhSGFoU1dEcE9OdlBVd2p3M1I4cEQ4?=
 =?utf-8?B?M2JSbDlkR0sxUTZqWUYwTWJ3K0YvUjFpbnoyWXp4N284NXRsUVZlQUF0L2R3?=
 =?utf-8?B?bjJENEVFdDB0RDRYZ2RPQ0RRck5aWjBQWEVIMnAzUjFES3RlbnlFMjdXYVF4?=
 =?utf-8?B?QktZRXZjU3h0TE9VR0pMWEhOOVllMUc2dmFYeFd6azRBQzJKVUw5UllYazF3?=
 =?utf-8?B?NFBNSThNUXI2UHUxaUtKUi9PMWpLUkRRd05mYW5QN3ErKzZ5cEphMmtnaGFj?=
 =?utf-8?B?Qnpod2NpMm5iZFJ6RDc2RU0vTmFJamdaWlF3Zk1oeWxjSGZ4UW5HbXpQamM0?=
 =?utf-8?B?VjNCeW9VR0ttUjRhZENyd3dLcFFQajNwL2hWU3h4ZUVwOVBCN0Vnc01KQUVl?=
 =?utf-8?B?OVUxV3p1ZCtFRnpKQUczU20rMVBLckNGaXp1cUE1VUk3RHZDdTVFeFZsV2hC?=
 =?utf-8?B?SGpwa1RlMFN6a2tQWUhvS3Z2bmFhU2d0K2pBRmFrZmsvYmFWcmsycDlEUGZ3?=
 =?utf-8?B?TlB6NEtnamQ3YlUxWUJBcnZwc1pTeUJQL0dIUXlDNkNENzBFR0tIMGtGQmlY?=
 =?utf-8?B?Z014U0hKSEd5MVhlU0JPdE1NWkJDOWdIYlJud3VlZUc1M1NNb0hLQVJyNzNO?=
 =?utf-8?B?S1BhZFczMG1YaUNZdDJMN0xLVlE5UUdnTTZDVmQrK1BRUFZ2SU1EMmdHbzhq?=
 =?utf-8?Q?QzGg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d33b17b-2d49-43a5-8bd2-08db25dad79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 04:56:45.3178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tD8q503kYeAAvMUHOAxSw59v4xzANGZA0R7YlPDIV8rEYe9iPTz+71/LQVHUuux9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9953
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        T_SPF_PERMERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhpbmggTmd1eWVuIDxU
aGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgTWFyY2ggMTYsIDIw
MjMgMzo1MyBBTQ0KPiBUbzogSnVuIExpIDxqdW4ubGlAbnhwLmNvbT4NCj4gQ2M6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT47IGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnOw0KPiBsaW51eC11c2JAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hd
IHVzYjogZHdjMzogYWRkIDIgcmVnaXN0ZXJzIGR1bXAgZm9yIGRlYnVnZnMNCj4gDQo+IEhpLA0K
PiANCj4gT24gV2VkLCBNYXIgMTUsIDIwMjMsIExpIEp1biB3cm90ZToNCj4gPiBBZGQgR1VDVEwz
IGFuZCBHRkxBREogcmVnaXN0ZXIgZHVtcCBmb3IgZGVidWdmcyBhcyB0aGV5IGFyZSBpbiB1c2UN
Cj4gPiBub3cuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMaSBKdW4gPGp1bi5saUBueHAuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYyB8IDIgKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvZGVidWdmcy5jIGIvZHJpdmVycy91c2IvZHdjMy9kZWJ1Z2ZzLmMNCj4g
PiBpbmRleCA4NTBkZjBlNmJjYWIuLjU0ZDQ2NzhlNjIzMiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MzL2RlYnVnZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZGVidWdm
cy5jDQo+ID4gQEAgLTIyOSw2ICsyMjksOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRlYnVnZnNf
cmVnMzIgZHdjM19yZWdzW10gPSB7DQo+ID4gIAlkdW1wX3JlZ2lzdGVyKEdFVk5UQ09VTlQoMCkp
LA0KPiA+DQo+ID4gIAlkdW1wX3JlZ2lzdGVyKEdIV1BBUkFNUzgpLA0KPiA+ICsJZHVtcF9yZWdp
c3RlcihHVUNUTDMpLA0KPiA+ICsJZHVtcF9yZWdpc3RlcihHRkxBREopLA0KPiA+ICAJZHVtcF9y
ZWdpc3RlcihEQ0ZHKSwNCj4gPiAgCWR1bXBfcmVnaXN0ZXIoRENUTCksDQo+ID4gIAlkdW1wX3Jl
Z2lzdGVyKERFVlRFTiksDQo+ID4gLS0NCj4gPiAyLjM0LjENCj4gPg0KPiANCj4gRG8geW91IG1p
bmQgdG8gYWxzbyBhZGQgVkVSX05VTUJFUiBhbmQgVkVSX1RZUEU/IFRoZXJlIGFyZSBvdGhlcg0K
PiByZWdpc3RlcnMgdG9vLCBidXQgZm9yIG5vdyB0aG9zZSAyIGFyZSBpbXBvcnRhbnQuDQoNCk9L
LCBJIHdpbGwgYWRkIHRoZSAyIHZlciByZWdpc3RlcnMgYW5kIHNlbmQgdjIuDQoNCkxpIEp1bg0K
PiANCj4gVGhhbmtzLA0KPiBUaGluaA0K
