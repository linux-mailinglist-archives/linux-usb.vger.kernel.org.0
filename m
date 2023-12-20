Return-Path: <linux-usb+bounces-4390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 544998196C8
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 03:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5FE51F23BE0
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 02:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAC48489;
	Wed, 20 Dec 2023 02:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="lg5K3fK8"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2062.outbound.protection.outlook.com [40.107.241.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F0168A4;
	Wed, 20 Dec 2023 02:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcFVS51vQyqNcLiMNIo2Lnli8GU5z4v8NUFIm+tsgtp+YKUXDky+yjJkVhDYr73xheZ6VwPjRtbdIdEx6D6fYxLqx3yvpF5jsNmRCtELtUCf99SjUU1gzAHJLyHSWkFKlRl8Ns451UvOj+XU7SZ9Jp3dsXMzrmEyrjLuF8kZaW7zFhEqZjFL1Bos8vgAHqiFc7xn7LkemcP3DqtwcQsmBqr+DGflLtvzX96Z4xPL5/KZTF8NzdxrWDYW/sgEldRbtuVL6OHS8RYEOJuICb/fOyLeURHG9F+oVfRpgZRjao5pOaRoYP1h270DsB0fHOlfG3bY/eyJGW20awvpgkCHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ssz9D5Zetc0pRTwvxcmENrgSKomkyE6m3UgHvjS+vS8=;
 b=mZs8lXnyDUACKJaxTrOw/S1GkXZfzGOukEZ7+jJxybeJN8JSTtj9sWxr7Nedrpkim/A05zZCJvMDPMZLW4QFke73AmtuJsZHfDKaJiEgYcMYfnFUWb+WULlQKF/HHetJqrF15pZZmVihaklOszb2ctf5gmo9MgUf4kihck0XsOs0ztlHdPTe/kBX9WMXQjlQoILmBhkzY7GWr/BhbmiAhcpiUZUVhfbBPDZ7lfZbLc1vNGLGACMW2bkikxTQyzrkclaQjSY4rzAITv7e7IcTOHg6DqjC6R1kIFtXIi9er63eTUz3oqDq19QQgvsK493Am6MY5Vs7mZRQ742hjKzl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssz9D5Zetc0pRTwvxcmENrgSKomkyE6m3UgHvjS+vS8=;
 b=lg5K3fK8CR1mZZfX6Jszaynb06cA0apfZ6ETxEdzsYOibsFl8izr41daI1Hlvb67tpT7jUTRx+Wx9AwEDrL1BvcMGu9Bu5BfF9Tgs+Ia9XFPll1qKjbKmXHowAa1fj4UKpzarb581ajXft4eu8XTOAO45E5p6+eP/QaedS+1cSU=
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com (2603:10a6:10:23::16)
 by PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Wed, 20 Dec
 2023 02:23:18 +0000
Received: from DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30]) by DB7PR04MB5146.eurprd04.prod.outlook.com
 ([fe80::709e:6876:7df0:fc30%7]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 02:23:18 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: dl-linux-imx <linux-imx@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jun Li <jun.li@nxp.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 3/5] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Topic: [EXT] Re: [PATCH v2 3/5] dt-bindings: usb: ci-hdrc-usb2: add
 compatible and clock-names restriction for imx93
Thread-Index: AQHaMY8UOQiWyFDAzkW6GCXANeLhorCwPDMAgAEvKKA=
Date: Wed, 20 Dec 2023 02:23:18 +0000
Message-ID:
 <DB7PR04MB5146154E6C62BCFCDA7879F38C96A@DB7PR04MB5146.eurprd04.prod.outlook.com>
References: <20231218085456.3962720-1-xu.yang_2@nxp.com>
 <20231218085456.3962720-3-xu.yang_2@nxp.com>
 <eb93c554-ee35-49a0-adfb-0d3030f9a77b@linaro.org>
In-Reply-To: <eb93c554-ee35-49a0-adfb-0d3030f9a77b@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5146:EE_|PR3PR04MB7308:EE_
x-ms-office365-filtering-correlation-id: d2c00d93-640a-4f04-b87d-08dc0102a0f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tlTcA0P0oNtshGnqXBqAraNQudp5XAye/hfol6NQ9hVaB+Zp0hXMQu15SqxavT0Vq8eJB0BdLVgrj2ml+qpfDvnv+5RbSheilIfpzdRzZ1u0hCTNYJYjui3LcfWHHF97otSJRY/gFpMzCLpKFLA/5b+oB4UXHc7paGrAHRVT+k7O3qeJsSdW+cSlvtVOcTRTm0kegJ3F8SH+Crz+1x8PT6RKDmReRtJJl4R4rJGSMyJGs7ZTLxSC7jPX+w8pWXMpGc1bI0ys24tSdfsp3w8f6C4Xz45IZgfBMHs+JTXFq708ErmIf1mUJfGj2ZecHiGGooQb5WNwXnHFnf97zVPR6VYZxdS3nL9HQVgL7JNmX82Y9VocLNlS67W7wgylf22rBC+0rq8T1wd1uGm/kQ9l7xbfxd6pt1rp8AP4IaW/K8XmbRqYnge6fWgx9ynwUxK3hMKIlV3e2wCB7KsxC+0t8H+KGMex2rXsMEru1Il8rbmfwlvHJQj9qEVTeXKqI4bxx+xOncCbHr7uc/vNoEkfTzFIpH1Q/moIs8BV7hTmbyiYptvFrxK2ljbu0LsBKL9koHPQOSExKIdqscKWDsz1uWiw0H7UEZ7thmA/J/aKib+Y0KhVZzEFkIPbZDNha15xPxTjA5WO7i0xcvOMdTke4+TDfoFvqhFlEQHq//n+lPU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5146.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230273577357003)(230922051799003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(64756008)(53546011)(122000001)(8936002)(9686003)(83380400001)(8676002)(71200400001)(26005)(38100700002)(2906002)(7416002)(66476007)(4326008)(52536014)(41300700001)(5660300002)(66446008)(7696005)(54906003)(66946007)(6506007)(316002)(478600001)(66556008)(110136005)(33656002)(86362001)(76116006)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEZxQXNwK3FkeCtYaFhFdXVNRSthSEZELzY4L0FwNG5nV21YYzRoOGgvM255?=
 =?utf-8?B?UCtQQ3Z0MGkvZ2U4eDNwbWVNSlo0aGhUUUVrODlUMlltRm1VWU56UjZ5Z0pD?=
 =?utf-8?B?c2FPdjNad3RnSFBpNVJqa2tYdGhUWTJYUGJKRmR5UDdMa0NyL3JIN2sxQXNF?=
 =?utf-8?B?dkVXcHpGdDdvSnVDQkNacXJrV2VucHRXUDJnQzhybEpSVk1DNUN4U2lNTTU0?=
 =?utf-8?B?RUJMY2Vmdy9laTIwYXJTeUtobm1FVXRycFZNV3QzeU52Sk1weTNoWHYwYnA3?=
 =?utf-8?B?dmROdS91aDNhRVBuY3oveFpuMHZrcXRFMm5FTGIzM3crdlp0YXZiQmVNL2h6?=
 =?utf-8?B?Z01mUGY2MitmRDRWUGE1RTNCZ09rRTgwU3RQVjdJSElRSmhOY1RuV0NTL1Za?=
 =?utf-8?B?MFZZVDduVFBJZUZSY09aQTlXb2JGM0R6a0l4Z0RmMW9YMXdwWG51eStJbDdw?=
 =?utf-8?B?c2tacnhYRVNDUFJwVXhYQ2VsVDRTbHJheTBvOTZ1aGJVajI4aW5qTjhNRDF1?=
 =?utf-8?B?VzN2RmZEL0VlRyszUXd4aGhseHZnZmRRMlU0cjVLZWVaUnhiSlRnUDRqMGMx?=
 =?utf-8?B?Zkc1NjNRcUg3d0theXNxV1Z4bDViZmJiaFJBbjlqbmtKQlpZTXhPSlJzZWtx?=
 =?utf-8?B?dXMwV3dNV211M0xjYXhTR01Na2ZFSzJZR0Zwd1htRXpyY042SkpaWUpBeDg1?=
 =?utf-8?B?VEwyVWUza2tCZVg1akwwNFQrTDdZRXhCZ2ZaVDZYS0pob0FrYVhXQ0FLZ1V1?=
 =?utf-8?B?Z01RcjliYlVOUzZxS0tFdnFIZ1ZVcklKTFd1L3BkQkJjTmxkQ2wvb2svU1hB?=
 =?utf-8?B?dFNLS3IwTXNMSmVlS2thTHBsWEM4M2V6dnRBNDRwbTA2Ni9pTkRTbDliWjg0?=
 =?utf-8?B?dm9nTCtQcmg5aHZRRWRBWEYxNlFFVkttajFxMWdzR0YvckIzMVF6ZDlXVCtY?=
 =?utf-8?B?ZjB3eVZjUzZRTnMzY0VJZEFvNFRRSmlJaThvM2M3ekM4VUsweU4xVTMvTFp1?=
 =?utf-8?B?SlJZalpTbENWOVZlMm8vekhuTFNrbGI4MFk2RGo5MytFV3JQUGE0QzMybG1S?=
 =?utf-8?B?eE5DVWJtcUJ6TjRXMFd5eDNaZXVoZkVRbXNhOU04OERrZExBNlZJWnNZTDBz?=
 =?utf-8?B?MW5GQWpNYjlLak4vcWVUWE5hK1Q5Z0s2WjFlTUVhRDQxRjl5bHhaNnFEa210?=
 =?utf-8?B?UDRhSWFzaERGZzY0dVJibFpHdTBNSloxdHZyb3FvYjdkc3NLMlJhMStEeVIr?=
 =?utf-8?B?cVExRGcwZXd4eHVaUThQWjBMTHdsRWlBODFjNGp6azJNT2pJU2tHQytsM2wy?=
 =?utf-8?B?cERTZDlGRkNZVUlINmVCdmxzSWtjZSt3aThUT1Z6T2RyaEU3a3d3d0Q1WDVk?=
 =?utf-8?B?RDF3WUFnS0k2RDBvUjZ1dy91Mk5ONWVtN0V2eDUyT2hZMU1DR29VT09EQ3NC?=
 =?utf-8?B?L0gwUHg4QzF3d2MwQnBoZ1dVTWhORkFseUE1NVluL3V5NzFYRUFaVEF1SVJP?=
 =?utf-8?B?MENZa29MQXFVWHBuamZKeThseERGUTNQanRtQy91cjdlVDdVRUI3QXNtSHVZ?=
 =?utf-8?B?NTB2L3ByekJsU1Z6c3psbEkzaGRSM3FmWmJXcXdON3BVWUwvRXNQSU40N3pw?=
 =?utf-8?B?WWlvQ0NTOFJ4SmFWRndLY0Zmc05NNXI5T1hjVUE1U0E5MlhZNS9va2ZIcHl1?=
 =?utf-8?B?OWdzcTc1eEZZZTZuQk84Y3hvNUNFWFhxSFNIS05YQ2lRKzg5bkRYa1VXUEZB?=
 =?utf-8?B?aktnei8xK2MyQmNObGV0NzFkUmJQVmFHYnRVcDZxM3hZajVXdk51ZytpTS9p?=
 =?utf-8?B?dFJtVFpsOW16aVF2bFNuUC9EeDUzU2s0ZTBheDc3RC9nY3lXSTRxZTlNNHRY?=
 =?utf-8?B?WkZ2V3BWNUtRLy94ZG9paHMxcHFPRXg3aEVoUG1DRmtrclprMGx6NzB5Yktk?=
 =?utf-8?B?RWlKNWlMUWhCVkNxRXl2ZkZaQmpqbEQ4TTE3WUlmZnZ6LzE1Q0hmenJLNExk?=
 =?utf-8?B?R0hjR2ZzM01mYWU2MGN0R3B5aUdkQk9ONzBYS2svNWFiWStCeDk5V3VOU1V0?=
 =?utf-8?B?SGdwbjBjZkVQUnYzckJDUi8yMGd5bXJsQW83azBhRVpEb2UrK3NBZkNHNHow?=
 =?utf-8?Q?9hCU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5146.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c00d93-640a-4f04-b87d-08dc0102a0f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 02:23:18.1120
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F4ShDSBH3hn9J0NuQ0nDVF/jRXnJyVMlBg/Vl7O1MKyb7SZb1cC3BnpmK/bi3ajQQdSnrzYWcDWiWuY/Fjk79g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7308

SGkgS3J6eXN6dG9mLA0KDQo+IA0KPiBPbiAxOC8xMi8yMDIzIDA5OjU0LCBYdSBZYW5nIHdyb3Rl
Og0KPiA+IFRoZSBpLk1YOTMgbmVlZHMgYSB3YWt1cCBjbG9jayB0byB3b3JrIHByb3Blcmx5LiBU
aGlzIHdpbGwgYWRkIGNvbXBhdGlibGUNCj4gPiBhbmQgcmVzdHJpY3Rpb24gZm9yIGkuTVg5MyBw
bGF0Zm9ybS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFh1IFlhbmcgPHh1LnlhbmdfMkBueHAu
Y29tPg0KPiA+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAgLSBubyBjaGFuZ2Vz
DQo+IA0KPiBObyBjaGFuZ2VzPyBXaGVyZSBpcyB0aGUgdjEgaW4gc3VjaCBjYXNlPw0KDQpTb3Jy
eSwgdGhlIGNoYW5nZXMgc2hvdWxkIGJlIG5ldyBwYXRjaCBoZXJlLg0KDQo+IA0KPiA+IC0tLQ0K
PiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwgICAgICAg
IHwgMTIgKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3VzYi9jaS1oZHJjLXVzYjIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy91c2IvY2ktDQo+IGhkcmMtdXNiMi55YW1sDQo+ID4gaW5kZXggYjdlNjY0ZjczOTViLi40ZTIy
YjM2OWU0M2YgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9jaS1oZHJjLXVzYjIueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy91c2IvY2ktaGRyYy11c2IyLnlhbWwNCj4gPiBAQCAtNTcsNiArNTcsNyBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgLSBlbnVtOg0KPiA+ICAgICAgICAgICAgICAg
IC0gZnNsLGlteDhtbS11c2INCj4gPiAgICAgICAgICAgICAgICAtIGZzbCxpbXg4bW4tdXNiDQo+
ID4gKyAgICAgICAgICAgICAgLSBmc2wsaW14OTMtdXNiDQo+ID4gICAgICAgICAgICAtIGNvbnN0
OiBmc2wsaW14N2QtdXNiDQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14MjctdXNiDQo+
ID4gICAgICAgIC0gaXRlbXM6DQo+ID4gQEAgLTQxMSw2ICs0MTIsMTcgQEAgYWxsT2Y6DQo+ID4g
ICAgICAgICAgZXh0ZXJuYWwtdmJ1cy1kaXZpZGVyOiBmYWxzZQ0KPiA+ICAgICAgICAgIHNhbXN1
bmcscGljb3BoeS1wcmUtZW1wLWN1cnItY29udHJvbDogZmFsc2UNCj4gPiAgICAgICAgICBzYW1z
dW5nLHBpY29waHktZGMtdm9sLWxldmVsLWFkanVzdDogZmFsc2UNCj4gDQo+IEJsYW5rIGxpbmUN
Cg0KT2theS4NCg0KPiANCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+
ICsgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAg
ICAgICAgICAgY29uc3Q6IGZzbCxpbXg5My11c2INCj4gPiArICAgIHRoZW46DQo+ID4gKyAgICAg
IHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAgICBp
dGVtczoNCj4gPiArICAgICAgICAgICAgLSBjb25zdDogdXNiX2N0cmxfcm9vdF9jbGsNCj4gPiAr
ICAgICAgICAgICAgLSBjb25zdDogdXNiX3dha2V1cF9jbGsNCj4gDQo+IFdoYXQgYWJvdXQgYWxs
IHRoZSByZXNldD8gcmVnLCBpbnRlcnJ1cHRzPyBNYXliZSBpdCBpcyB0aW1lIHRvIHNwbGl0IHRo
ZQ0KPiBzY2hlbWEgaW50byBjb21tb24gcGFydCBhbmQgZGV2aWNlLXNwZWNpZmljLg0KDQpXaHkg
SSBuZWVkIHRvIGNvbnNpZGVyIHJlc2V0LCByZWcgYW5kIGludGVycnVwdHM/IFNob3VsZCBJIGFk
ZCByZXN0cmljdGlvbnMgb24NCnRoZXNlIHRvbz8gSSBtYXkgbm90IHJlYWxseSB1bmRlcnN0YW5k
IHlvdXIgbWVhbmluZy4NCg0KVGhhbmtzLA0KWHUgWWFuZw0KDQo+IA0KPiANCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==

