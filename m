Return-Path: <linux-usb+bounces-32873-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIqAJcfpeWkF1AEAu9opvQ
	(envelope-from <linux-usb+bounces-32873-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:49:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AD19FB0F
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 11:49:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE2803013AB9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Jan 2026 10:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D96AF3314AE;
	Wed, 28 Jan 2026 10:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="k1qTbw4k"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013035.outbound.protection.outlook.com [40.107.159.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DFD333730;
	Wed, 28 Jan 2026 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769597351; cv=fail; b=u5aqcgUkVg6qY/hGR+Mulgs08WWnCjJZTNGwEhAMUpHtr/zmzAKYeKdW3pLER3Hy34+k5ab5vOKZBdwpvcH42tHK2vRxEndfMAr45iICRnsU6SkWLrSq1VqgTz2Qg74/RxFC7u9nDBEz8jmfFvO4Ko+o5aFlUzuKkbYDbuRiRgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769597351; c=relaxed/simple;
	bh=rpBAXrXEFPcqntnbM18sqTFMh0IgUBXnT1WHjKzHTjQ=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=lxN1LLMGH8eOLsQLkZsNd8+UQhWJdRLUJ2ZbOaGD6JhUQkxkJ2hXxqQZpU06sn3pJDY/OKc1UalDxqrC5Kzmmr+5+lC9vP1NgesoDmDvdnjmdgkuiRX3+25KUA8lOVcCNtJ3oKu38MDDQE2rK/qlTW6wtbLUEew+n4k1cwoj6CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=k1qTbw4k; arc=fail smtp.client-ip=40.107.159.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRdBJ2XrPC5wveWeyoxQI59D8sR7lh7PHQ7W6AXYmNJt60VR4Ja8U0xTB1Pkl4RauS5UvB1Z+qcNtt/r7PucpIAYhpd4SvFJDez7rTUe9NI5559MYZjOJSoNVwF61yobIdO/DWTGs1FIQ6dWNVBnh1wltRzg5jwtmKz+6Q4D+tO0JXb3n9r8gPX/GBbmBlurzvo550ZIFEU+rE7HN2Ls5/EBXbjEQKUssGULJ0PpONFByIvJxhMDhXSi/gkKY0B2orC7oXCZWALBro82t9ZpUuxH2UMtNZKXvvaQyRgLM2tXgucYG0pbvci+HoTOTczGVo9d86ZD0fVjh0j4Q8O+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41x3a1eE2gmP0Sg64Q4CzU4egjt6jVUV8wACws9Ni3c=;
 b=NkqqILtU4R7kFRPvCqs4IS/BTstweokNUmTMvEv7aNgCmKYYmlMxLemQVAc0tY8e9E3HZUiSbJCQRqu9amombC1/EQbGE4iFu4MiItOOe2aH9Kp45HGlkwrZfoGMTEESaJMxB+/KjK8pAeTCHzLhOEWUuDrq1gq0KmIJrgTGSOrWl7sr+zNJxzIBtVn4+5Nlx6YPRjW+VSPxZuzbIVfaSXwflxngP+vxOsn4O6zR+oP+Be215qQT+0pwCddE+kvQBsVI7JbtHuESWZXnSBl5/3iJJG2Wzki6LINArJc/MMis9HZnF20qHQ7CVifUgQ3Fj3OjkWaqD+ZoYcGE2BAMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41x3a1eE2gmP0Sg64Q4CzU4egjt6jVUV8wACws9Ni3c=;
 b=k1qTbw4krEvI49PDGfMmHywuKIWX7wiFnpmmaWmc/jiczZSBcF33Ai/qUaaLlat8vWhNhw9PoXg+ltdSBPtrDAI9hhIwK6+DVaopT7fouHOKCVOY4B/q5qA+dLVV72VfoDBTXB//EnCz8YKl6ieC/PZbNZs05oLZO+Kjrh90siE=
Received: from GV2PR06MB10809.eurprd06.prod.outlook.com
 (2603:10a6:150:2fa::21) by AS8PR06MB7192.eurprd06.prod.outlook.com
 (2603:10a6:20b:257::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 10:49:03 +0000
Received: from GV2PR06MB10809.eurprd06.prod.outlook.com
 ([fe80::f29e:9a49:43b4:80fb]) by GV2PR06MB10809.eurprd06.prod.outlook.com
 ([fe80::f29e:9a49:43b4:80fb%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 10:49:02 +0000
From: LI Qingwu <qing-wu.li@leica-geosystems.com.cn>
To: "hgajjar@de.adit-jv.com" <hgajjar@de.adit-jv.com>
CC: "eugeniu.rosca@bosch.com" <eugeniu.rosca@bosch.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"guofeng.li@gm.com" <guofeng.li@gm.com>, "hardik.gajjar@bosch.com"
	<hardik.gajjar@bosch.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "maze@google.com" <maze@google.com>,
	"quic_kriskura@quicinc.com" <quic_kriskura@quicinc.com>,
	"quic_linyyuan@quicinc.com" <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix Kernel Panic due to access of
 invalid gadget ptr
Thread-Topic: Re: [PATCH] usb: gadget: f_ncm: Fix Kernel Panic due to access
 of invalid gadget ptr
Thread-Index: AdyQPxHeVAEEb/Y4RLmOEh7j8bGjrg==
Date: Wed, 28 Jan 2026 10:49:02 +0000
Message-ID:
 <GV2PR06MB10809D32F05C864813CC36C10D791A@GV2PR06MB10809.eurprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR06MB10809:EE_|AS8PR06MB7192:EE_
x-ms-office365-filtering-correlation-id: be7fe105-abea-4ecb-286f-08de5e5ad9d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?eZkuTZvNrglq+Afbvrn/Bfuq55CXl1AeuK5PdIkQSRirGTMdre4FB+7ZdTXf?=
 =?us-ascii?Q?lbsZVaHAO21CJzcRkVKetJ5lU52h6bSAZV1bz1eCz2wn1H6gNoanZsJMnCcX?=
 =?us-ascii?Q?tODXvup3E2sF7W2IWWPbWDrCrbv7dfG0LAYhWlNRDAFxE5ATwIlcxjWwjHQq?=
 =?us-ascii?Q?0rAkMVeOdpylbVjVrZQc6GVPnpjTkoYm0U+LUGZlpGoYTC9nUymz8+1XDYHj?=
 =?us-ascii?Q?DTyuGG3HDieWx2fXDC8K4r8tpMy2FmKSqHLHuRPE5hS7pGeu4NBlbb5TOBJw?=
 =?us-ascii?Q?hYavRNgStD8AxTURJ7/VjfN+TPW0dzcRAEranm/xDsNC196ohPaU8yGsbC/3?=
 =?us-ascii?Q?EIfXLTUuNVBxCOn9Pjc23tqk1dU9K8X8aBPwee3WN/vT2VSzRWQAmjDUnw5y?=
 =?us-ascii?Q?X4BlVfGylp/QeWAzz4FXre6TD8HgKqNgQHHjfnQK+rLFWRyAuoi8vPMA4ZOo?=
 =?us-ascii?Q?zQDjQ7YLQQPz3l37o7OjArCrRZAaeyjeUniaBG93ZhebN98V05a7QK7ZmmbU?=
 =?us-ascii?Q?4WSnGITY72bzAx3ZeLWXCV8Y8w/4XwHB0EJChyd22losTTDYiglXs3U8Y+u8?=
 =?us-ascii?Q?eRfb0oErUkA9mqt2FjWFj/xGjSYrICGlHJDAO2eU69ZDpF4/jwfF6j731tuG?=
 =?us-ascii?Q?M+8unOUq2hpTqrQqpIkk78klxi72cJVpMdYNnsXaVJi4RIVjGWbf0KtzcozG?=
 =?us-ascii?Q?yzTQTZoTU9JGtB1oEE2NGe2K/RX4cyw8N/a8k6QWYUCSdKaFQEqH/BsQLPTe?=
 =?us-ascii?Q?cYB7GyMMefDnlgaYbgr8nm4mHeQdQZWq1aZ/4oVbRVWZy7qKezwN/S5RIL+X?=
 =?us-ascii?Q?sAX8fn4JFHj0veJVIMkvhY+DKFPyECtRXGnUzs7Q876b/bnIvPW8btGmPFLY?=
 =?us-ascii?Q?bMGOba95DE7ZdhTpgoDD9CyPa243BYl6lay0Kxt7ZuYukVGslbb7SOx8/N1M?=
 =?us-ascii?Q?6Z2vgW2mGP8B1dvJC3sdRU+ANb8dV+nytsmNvv2QOOfXEk4ZjK07DU5eSyfK?=
 =?us-ascii?Q?cCW56yp/GdPmjhoSTfsgwSy8R6+KDHhb0SaTN4iG3RoSCl6Gc8jAVQ+DBl0I?=
 =?us-ascii?Q?lHvy/YTstzRY98pJIef3g954oefXEvQK84F2ifAGlHouYwojD/bAEH9NDn+d?=
 =?us-ascii?Q?Z/4DMcz2fGBk0cJg98LjxloVohSgqPnF3WRXCQdZ6DCK+yOeoSd8QOmdkmO+?=
 =?us-ascii?Q?upmimZvOkro1hoPBWEO5LLCvEBL0xICPDAYc6dy6iJ007F/hNgY5BxT8QYQJ?=
 =?us-ascii?Q?iS9iXgJiR4LShDFDJS2OGSNDjK1vK8hTRZd4e20gdSijufjZ0QA8IQ8JZAon?=
 =?us-ascii?Q?xBcKiYhLTYyEGRl3oMIoI82TKP6w/II8EOI8RYigoFO7wbqJbv5uVcduBJEC?=
 =?us-ascii?Q?Paw/xpIIMff/s+K/NiRLguo9eXSvm60YeMnqUn3RPuY2Gf6m9Z+vFhcbMP8I?=
 =?us-ascii?Q?YFkbTtAhEjnHxj/F4furXGh/xYg57+S9lyF6wAjX5t08lW+C9Yq71RTKDvWQ?=
 =?us-ascii?Q?muMq7txp+RItFhpMWzH+54JdMJ802QAS98FyP0hEK/wWtZrF/XztCEw8wmT9?=
 =?us-ascii?Q?iDA5B37yVNC9MtRl3L4I9JivI0u/h2Q6z4T7pK1/orFxY7U2XvYiJiGSER4A?=
 =?us-ascii?Q?VZYRF5FstREUKCDbEVU1TYQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR06MB10809.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I7/SMzVWT3E4IGacVgv/8KGvg/xE0p5RmTK3+oOuK+T9A0c0FZDyUAb5DEla?=
 =?us-ascii?Q?Wla497XPcNZsoScqxtc3MfzHfdwkNk+G0nQcKg9jPPiLF5i70kZRarmoLlRY?=
 =?us-ascii?Q?UKvJD89//NaBEAWqFQHoBRPJ6RBW9NjVWhSgIfu9hHiPRnfFBntzM0nZiW5I?=
 =?us-ascii?Q?64QeJzq2F3o+MXk8wZLr/Doro8No9mAmDj0qev+Q3hqS0Vtj9K3YGeqiTh3J?=
 =?us-ascii?Q?WrFpdmqM+GoaVWfBL24jMKL9m5My+4wJy9eQ5ULDc3qUDGrxpNHCbjbJUqOW?=
 =?us-ascii?Q?t13VlEJnCcgvKrZLP1GghUbwpps996oxUw7d1OH/RXhc3xxigk9NQeJUL5LF?=
 =?us-ascii?Q?pObJya9sWhstUae97chlRNIn+nFK9c1ZAXpFiTqcz9shIIFK3RtxzkvgwoP8?=
 =?us-ascii?Q?ybb/CUVEAoWUZ6fJ+oESDXPTsmAyb0FJ/JdpNLP7DLpYuxxyV8L1yFTQqeSc?=
 =?us-ascii?Q?mUEm/JT4uAkZ8FhOTtk+a67T5jZWywjGbYvxveiFPEHUCpnk33W2E12g9Uvu?=
 =?us-ascii?Q?zDsG6vmJZBkD44Pjp6j866/KHxpvbUlM+poMTpKDVG0DN4k/xSfCaR6WR8ZM?=
 =?us-ascii?Q?UFxDCNSNjp79R9zkGdnl0YZu3CAY2TVdnpHwVQG5Gd+32p9zzWV8mz3d15aZ?=
 =?us-ascii?Q?KGV5oCkAADGm8MX8Cbzc6+ukq8Ao2NC3NWUMHV07OO1v24mIfgyBJmV0ok8m?=
 =?us-ascii?Q?DSL/DO6hzcjXenVCUz/5F3B+6fdo1ublcF0q53SCTrpxy0aLQ5a6MzoJrEG8?=
 =?us-ascii?Q?QPmr039Stp+tjH3M3uAe2GZMTKnFSVHdpysq/FHwC4K/epUZgj5+o7vVHynM?=
 =?us-ascii?Q?bubMUeAbSe0a83/2+oXJL0syFeh9KplMUJwoaeXw29QOWaYeSxitPWC14JvE?=
 =?us-ascii?Q?rEXD6cq43c3DXIfzDt4I+o9H/XvErWOPpEZ2o4bRG9pc3oY22IZNMqt4ENFZ?=
 =?us-ascii?Q?e/DntISzP0YErzhWJY5ovU5CQII2KI2Um0H9rbl3HKuhnsv6zJw5ORLNDB6G?=
 =?us-ascii?Q?MlsDEeF5Uf9kxMOLHpTp951wFjItugApWlDmuaNi/+lSYTYwy6b2LIHXt+Wi?=
 =?us-ascii?Q?5ACmPaiaYTdjSvI1P4jdiluCdzdcLQ+HIq8nRP+afsDDVhTiBFa06WLoyxDK?=
 =?us-ascii?Q?lN+wuc2BVlm2Liig7hflZMtU1rgeNaeYkMjlAURDpxIdKNvytfCtdxg7PVLt?=
 =?us-ascii?Q?HeUtYzoGx2fbTbvsS7SZ1qDvXBIHuhDtc/nKXBX4Qlla8KeQM5y2Vbp7LmfY?=
 =?us-ascii?Q?dhGAztEOEhjWsjcaZ2kSVclTUmKhT4yPv25iw/gxji9jL7YpPQrrTNaRNyKt?=
 =?us-ascii?Q?1vh5kQ/JKzVHETGN8a+xdXkmILlI2k9lYnKODoVKDAC3WfNCD3veep9RqGuT?=
 =?us-ascii?Q?LQcsNb8ZA7PTiIO/HqKwjytgUVTAleN/oCfxUJUK3YwHieVntWKl60CRvV9A?=
 =?us-ascii?Q?FeCgoKf0paWbHjwN6f3eNvLub0HZ6YFaALEvGUUJsz2GsJ18h6qCgKFHb3pT?=
 =?us-ascii?Q?7vnCj0492m9E5mtFujlf83akMdYCUORc4y1DpuiePdJ8v2mPBnsSH7p88UJs?=
 =?us-ascii?Q?ZwqfUpbLQOrrZoPt1i2D8nBe0LHUCrXEHe40agxBTH4LuwRBxI/Sgpa4K1+v?=
 =?us-ascii?Q?U0DOM2AlmomyaGP9Zn6gdOsP76xmuXPP6xJs91eeVbcN5dwgJ+KCB3KCwEPU?=
 =?us-ascii?Q?kVz3MU33RAzS/iKSPIOyckehlAx6FccAyyzaEu+4gS1zLpthO/xm9L5MBad2?=
 =?us-ascii?Q?tB0GO+loa7c1MFL8F0yWUfe5pgEO2Co=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR06MB10809.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be7fe105-abea-4ecb-286f-08de5e5ad9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 10:49:02.7489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJ+cq65l9MhYbGQYaLF2y7lqjgQsGfUkK8zxLp5jm0cLqw6JsAvdMHft8Cmk6HZc2y0JRJEH+kuVfCCY4wktp5ErMoSj0RLRKQ6ZaNC5hHFkj0pess+R5CIt9wbe8HE4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	FAKE_REPLY(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[leica-geosystems.com.cn,reject];
	R_DKIM_ALLOW(-0.20)[leica-geosystems.com.cn:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32873-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[leica-geosystems.com.cn:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qing-wu.li@leica-geosystems.com.cn,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,leica-geosystems.com.cn:dkim]
X-Rspamd-Queue-Id: F1AD19FB0F
X-Rspamd-Action: no action

> On Mon, Mar 11, 2024 at 01:04:18PM +0100, Hardik Gajjar wrote:
> > On Fri, Mar 08, 2024 at 05:47:37PM +0530, Krishna Kurapati PSSNV wrote:
> > >=20
> > >=20
> > > On 3/8/2024 5:25 PM, Hardik Gajjar wrote:
> > > > On Thu, Mar 07, 2024 at 11:12:07PM +0530, Krishna Kurapati PSSNV wr=
ote:
> > > > >=20
> > >=20
> > > [...]
> > >=20
> > > >=20
> > > > I believe using gether_cleanup altogether may not be an optimal sol=
ution.
> > > > The creation and deletion of network interfaces should align with t=
he behavior of each specific network driver.
> > > >=20
> > > > For instance, in the case of NCM, the usb0 interface is created upo=
n the creation of a directory
> > > > in config/usb_gadget/gX/functions/ncm.usb0, and it is removed when =
the corresponding directory
> > > > is deleted. This follows a standard flow observed in many network d=
rivers, where interfaces are
> > > > created during driver loading/probing and deleted during removal.
> > > >=20
> > >=20
> > > Hi Hardik,
> > >=20
> > >  Yeah. I observed this behavior.
> > >=20
> > > > Typically, deleting the gadget on every disconnection is not consid=
ered a good practice, as it can
> > > > negatively impact the user experience when accessing the gadget.
> > > >=20
> > >=20
> > > Got it. I was suspecting issues might come up during fast Plug-In/ Pl=
ug-Out
> > > cases as setting and cleanup of network interface might take some tim=
e.
> > >=20
> > > > In our specific scenario, retaining the usb0 network interface has =
proven to enhance performance
> > > > and stabilize connections. Previous attempts to remove it resulted =
in an observed increase in time of 300ms,
> > > > particularly at the start of Apple CarPlay sessions.
> > > >=20
> > >=20
> > > Thanks for this info. Makes sense to keep it in free_inst only. But m=
y
> > > initial doubt only stemmed from the fact that actions taken during bi=
nd must
> > > be reversed during unbind.
> > >=20
> > > > Furthermore, it's important to highlight that in Qualcomm products =
and msm kernels, the inclusion of gether_cleanup
> > > > in the unbind process was eventually reverted. While the specific r=
eason for reverting the patch is unknown,
> > > > it suggests that the addition may not have yielded the intended or =
required results
> > > >=20
> > > > Following is the revert patch details in msm-5.4 kernel, if you wan=
t check it.
> > > >=20
> > > > Revert "usb: gadget: f_ncm: allocate/free net device upon driver bi=
nd/unbind"
> > > >=20
> > > > This reverts commit 006d8adf555a8c6d34113f564ade312d68abd3b3.
> > > >=20
> > > > Move back the allocation of netdevice to alloc_inst(), one-time
> > > > registration to bind(), deregistration and free to rm_inst(). The
> > > > UI update issue will be taken up with proper stakeholders.
> > > >=20
> > > > Change-Id: I56448b08f6796a43ec5b0dfe0dd2d42cdc0eec14
> > > >=20
> > >=20
> > > Agree. This was merged first in 4.19 downstream (most probably for ca=
r play
> > > use case only) and then reverted in 5.4. But present 4.19 code in QC =
still
> > > keeps it in unbind path. The only reason I suspect it was reverted wa=
s to
> > > get back on to same page with upstream driver (atleast starting from =
5.10,
> > > this was the reasoning to remove gether_cleanup in unbind path and pu=
t it
> > > back in free_inst).
> > >=20
> > > Thanks,
> > > Krishna,
> >=20
> > Thanks Krinshna for your comment
> > Come to the first comment from Greg.=20
> >=20
> > > What commit id does this fix?
> > >=20
> > > thanks,
> > >=20
> > > greg k-h
> >=20
> > >Hi Greg,
> >=20
> > >The network device parent is not being properly cleaned up during unbi=
nd since the \
> > >initial commit of the driver. In that case, should I mention the First=
 commit ID of \
> > >the driver as broken commit or would you advice to say, For example "C=
lean up netdev \
> > >parent in unbind".
> >=20
> > >Thanks,
> > >Hardik
> >=20
> > @Greg,=20
> >=20
> > Can you please provide guidance on how to proceed? Should I update the =
commit message to exclude the term 'Fix' in the title?
> >=20
> > Thanks,
> > Hardik
>=20
> Hi Greg,
>=20
> Should we move forward if there are no further comments?
>=20
> Thanks,
> Hardik
 =20

Hi Hardik and all,

Gentle ping on this patch. I wanted to follow up on the status and see if
there have been any updates or alternative fixes applied.

I have recently tested this patch on NXP iMX8MP platforms and can confirm i=
t
successfully resolves the use-after-free panic issue.

Best Regards
Li Qingwu



