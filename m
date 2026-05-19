Return-Path: <linux-usb+bounces-37665-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHK6ACskDGpqXAUAu9opvQ
	(envelope-from <linux-usb+bounces-37665-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:49:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CA857A7D8
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7B98F3028B4F
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 08:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD93399031;
	Tue, 19 May 2026 08:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="U4rTFttS";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="kj/uMbvn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8EC3955F2;
	Tue, 19 May 2026 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180475; cv=fail; b=O+H7KeWFcdwYkcKM+LsD6/9gAmHRlNUqxD8eC9D0FDLb0BwgUxgD2AVWdAgpGBhsjwlBWxUL19+08DVPZklJYB5KjxYaJztyp7Fz/hkqu9J04asjJa6T5kBySF8V4GcQpi27QdfC6TQMAdR/NkXfpaEb0I0ZqERJNZy1+b50dFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180475; c=relaxed/simple;
	bh=KvuOD/H2gtw7h9kzUts2kps7QpCypKL+OY3snoV2taE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OmPHsLVvxMs0wgsUFnQBF9gTnQ+t2WrZTbOj2bNdI9EHjb+m7wWgyu1f4mR1Z7TiAQkgkV9DrK7YI4Tkbe0WEtyA0Kxo57I+wyPyfAKJehpSOxVRTnhvoFGc4keQjk5C4G2OySo4GKlRSdSCuF48igMDgoMMXH5vmtyJDnFFXrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=U4rTFttS; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=kj/uMbvn; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8LD4a2478841;
	Tue, 19 May 2026 01:47:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=5XoWDnFGG0lUWeTCAfsJsbtdVgnbLg+swYBOmulDKmw=; b=U4rTFttSL/ue
	LOqdrPdO75nyMIS1YO8t4Xd7gg7eqKLiHjaqkQJ/MxZ1UNaEkd0bcpdTXaGvAldM
	n4oGLEpozwLPWX7r3P2owz4IvJvL0hIo7h9Fy5uoAESR9xuo0ZhVSUZwOuI0Yrro
	9ArHmWoE2YtkzMGS/wP9CLcCe+Pjr8sbpgU+P6H1mNxDcfPIyCpzL0kw9ozu6gFP
	p7mglEJ2HyOHr+1a98/43FiZ0O3ICl5jZGWo8TDispiPFwVIhVuyWhrfhn9E3wqI
	ktRRivu0i9x+wOKybxiOnWOL89rroNbV3SmcwF+4bDdgI80//ZM118o8H5V8z4Ua
	HeKpc8eeYg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4e8e6whkt8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 19 May 2026 01:47:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD/5WOzzX/Wn0f/knblx6jTDmXg19NZebWOBKrNYNI/TKcDKgaEqlXAzA+ytNczSqKDvqlggEfuEvWbQp5pmvVXTAHaqLc4wjXj321eQOj+IG+6I3fGhR9AaJF31Zh5c08HGQb705GDdVWdtVEh/X7cN3nNCKrX1aAgCwgKfdW7Iaceco/8W/HXNKpBqTUXlQytEMbgYJRNEZVxlN2oUEcMJEgvaZXK2pOM5XxeCkmp/0bkHkx1gRWrXKkaT/foe/IVFQsjFqR4RMawjZSwtXDMy9u2CBEmLBUNty+u+LatGARULIClWhUmZXD7z+fWIcvsyUL0PbFXTSylJ8cTSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XoWDnFGG0lUWeTCAfsJsbtdVgnbLg+swYBOmulDKmw=;
 b=V2M0SbckwhU2LUIsHsp1T8tsVucWmAfZn6PvZoVv1LQMGIM4GA0kH5E6M21OP3umXJP4z4lRbGt4SuOXsYnrHjSG6Jg7OehlmxgLIwJQCkFqFxayDRsnf5rM+WO5ppxXh0AmnajTwL1wSSgYWvY4P2ipuyr/z5zojRdJmEIv+tbWmzALCmRPU5sOwDbIAeJHvdtGfjPOgQcoLpZAE4YlAX8u8HpPk1Ew/NAznq8RamNwG7RdRDNxclQnMAMzmWr01VLGOUipGNMYDOkDFIymSqa2/e71durHbs0DuT+3yBmr4s9SNm/YG9sD9tf5AaZBJ8LT1+DjOgn0HA6zxHFinw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XoWDnFGG0lUWeTCAfsJsbtdVgnbLg+swYBOmulDKmw=;
 b=kj/uMbvnudJcInqgx8MCHjqBqozAh1hLCT4g7sosPl9Av3w1qAhZhU0vDBhAZ/fuaNrBUUW/Pmh7NlUsh3ZPaXaYG/aOQSXmAR/jpCvWINDYe0BioBClme7TbSApiHagdIc/s4UfKyxrBq5N6Eb+ag7wnM6zddVApGudCjsuUslAgabiSnjFsQ7qA11GS+bhFZ2+vvTi6d10rZV8U+USdWkJ73xSWb1rkcw38yzzdztdQ92Y7+nzU2dIL+EeUfWlMTXpGr7slQAm3uU+Re1nzjEfrxpJsMBDZeQhf3w5FuIP4axfXeyBv0Grdhd4wgP5N38toFT+lqzgcGBOm6u1RQ==
Received: from PH7PR07MB9538.namprd07.prod.outlook.com (2603:10b6:510:203::19)
 by SN7PR07MB9749.namprd07.prod.outlook.com (2603:10b6:806:35a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Tue, 19 May
 2026 08:47:30 +0000
Received: from PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe]) by PH7PR07MB9538.namprd07.prod.outlook.com
 ([fe80::9088:4354:91a3:3bbe%7]) with mapi id 15.21.0025.012; Tue, 19 May 2026
 08:47:30 +0000
From: Pawel Laszczak <pawell@cadence.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>
CC: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v8 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd
 compatible string
Thread-Topic: [PATCH v8 1/2] dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd
 compatible string
Thread-Index: AQHc5Fs8YXjvLtP6jUqxPlu/ue4fBrYPUziAgAW77GA=
Date: Tue, 19 May 2026 08:47:30 +0000
Message-ID:
 <PH7PR07MB9538E14BE6778498A48FECEBDD002@PH7PR07MB9538.namprd07.prod.outlook.com>
References: <20260515-b4-no_drd_config-v8-0-75cb05317679@cadence.com>
 <20260515-b4-no_drd_config-v8-1-75cb05317679@cadence.com>
 <20260515-trinity-unthawed-c5ab5d7783f2@spud>
In-Reply-To: <20260515-trinity-unthawed-c5ab5d7783f2@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR07MB9538:EE_|SN7PR07MB9749:EE_
x-ms-office365-filtering-correlation-id: 581feda5-e925-4bd4-6281-08deb583430a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|11063799006|56012099003|3023799003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 G9bBsg5Xla9ijhvtIWe4VLewhMZ+j+GlB2f+/1vZgko6shqJn5odA2G1xm8SjAHAfbKkQE/D1d0eB/mxito1ryDjE0S7iD9hXI5wJJ8zGS/Mo5xjY2BumTFKIejWw81NUdcMNG4oO5MSiqaLAnjQo78XV1wQYkF2WjwSply3AGAZpvqO7AyItMH2OW2n9p7qzXoPiqIcuM1qPa2vq1SfJuNRePJZNHSZCI4DiofxAgyURjEhwfVN+dz296VKto9XbuXUuWUEMoyOZO8KsUy/u9SrNmbynmuPaAhc+13pLC7PwWXRa+HVbdYEA6qwNLPqPLoIfNt3iKmguGzh3VQY1Cmhw4GWbzlu1gnhXuPRJdh9OnYwuqhIdeCt8Hc7/RogHXutYtcDTeRQgAgvBl10AuU5Z4/1LCA46YqG1TxJtQ/kkAcveEFTy6Nc8HRnmf2lZU6wNhjXUX+DhLZduQtfHG/hSki71WP9IocXwhT5Y0S+wn6gNhM54uSeMuGX+AsTPWC63x4Ble8UVV7PfU3EpsyDF1RrEU5T3aTn3Kjt4kjz0JbWKkyCViuKDrqZGuJUGsBehX96d47IN90ym+MbeBrdUtmOk/Yo/s6eiCsLpR02hMCkHsveRnDImfBYI/4GccIpcwuDRuf9r7G4hng7OB8EVIZL91HVvQlug/+7h0cdoPAE2gB71bIK0zkRcIdi4I1mt5mRC1GdWxKThDy7SDMxhaS/N2y8rCzA0glnnZU1D3xwU74cpJljqELuoEcY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR07MB9538.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(11063799006)(56012099003)(3023799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?n9JWdHCj3fUd66/kMNzS1VnGPk22XJD7Po62/tFyE7obisggbO3k/Pj194e2?=
 =?us-ascii?Q?MtwXwoIlPl3+AHfhQ2r7GyE0QemVI8noyoHNhhj5UVC5LQ6+MyqFtNaBhwxs?=
 =?us-ascii?Q?NM2Cfas3aGmBf5m/6hIaDTBE2T+SLR+dij4PQRj03pYn3fjCsFlc5qn0Uw5D?=
 =?us-ascii?Q?7Zn2XPy1/h0B6JeZl4io0Gq3GO6E6S7NWfVIpeVn0hmvb8Iborf9TPr0kETj?=
 =?us-ascii?Q?dPsOOlEfnQdYOq9RDB8aCewzk1kAkKjBfoXGzuqi6zg462O9aQBbRZ07++8U?=
 =?us-ascii?Q?GH74SOeYIr5q86o4cIcJu+KnbuSdJFx5hixFmaVamev1LtxykzseAiS9AxgN?=
 =?us-ascii?Q?YC9uzV4K6CzdEbS76patWma2T1hZNx9E+b7EkE6eDWrw17c8SBtfW//kCTle?=
 =?us-ascii?Q?SFh5mp2oF8FgXfdkLlVucntmfRaV3PZv1X81aCBlpb8nwzA1atqQadJUHmiu?=
 =?us-ascii?Q?UwTAVGW5ibANFi47lEJp5qCUZJ0htTVPcJQVxsaEm5A25VaRedCkha8d1yb5?=
 =?us-ascii?Q?D4nfDF3V8huuPTf1mMcVdZASzPaYeHI7WXkpMzvc2fIRTR85VEJBS1efFTu4?=
 =?us-ascii?Q?BdluE/7MNNXh3ofwY3NYp7mgd22XEgVcW5MtDZOiZF4mIzVny/r7xBXyFfZB?=
 =?us-ascii?Q?FVEjArkCX4wMuSqY0eDZ0aEO1r4ktTQ4U984ljs1rgukGueWZZnoC79RqNo4?=
 =?us-ascii?Q?q6BEle1TLp1/i/n7+ViTcUjM/8I4HTzZ9j/q6GSSipk13v0rm7MxkXDmMoP1?=
 =?us-ascii?Q?VVKhQW/koCblyQ3K8O57xAApKJWC5B5GepW3ZkXXJ3M1muHDYSzWlZypmbjy?=
 =?us-ascii?Q?GqJKTN7k4sAXlrnYcEevkkFe6bgMf4zyjsDZz2maiYayOEwIoTBrKrDhu1SW?=
 =?us-ascii?Q?c1uFlf55caB8O7Qgq3RsFm4e06duYu/lXZni2YhAX4wrjkjl6eCUYfoVYbx6?=
 =?us-ascii?Q?Je/dvF4OSrjXB9LHhKzfefza2y/PDgs2AR7QfCam/BtLR1WZUyIagP/EleEL?=
 =?us-ascii?Q?LsdZK5MBGH0pm6jYw5LNrU8ROSvciX8wTOY2WhqEEwcB2pfpkm2fyHvELvsv?=
 =?us-ascii?Q?z2kY/cc+iQ0lsoaLca0YOHul4vcgCbe3eZu3oEaRnuq1RZVqQe506TlZx2RZ?=
 =?us-ascii?Q?CXj5sgXSJt/uVzsmPuT3h5rQxaubRy7P5JKzJlqr1MlU7mfcwNzmSHvDudv5?=
 =?us-ascii?Q?RvBXumcSLJiuuDwOKXjZs49H89eNHS0gZKGTjYIfQ95IbPEKACqFBFIhK1Kx?=
 =?us-ascii?Q?7J0tVF5GRDk3J0JUAjpkG2YMv7St6hG+HPHF8srfewPGLHpaS5VtqkDSNXo3?=
 =?us-ascii?Q?auN8ct/yg8Ox2UBHIqegBpDe1zNLOVGGt52/Q/uEOYsUsrEsVoGWx9H8T015?=
 =?us-ascii?Q?y+907/vZWjKvmn6ZTxkJ7bITA3oVomMG4cah420022TVSLZKCJ++LeYbObwm?=
 =?us-ascii?Q?q7hpTmST7wEtM0QbCHKh+oxNISbcqB7MMR5faI3PGrMEfvvkSSobC5NCqG+U?=
 =?us-ascii?Q?8PATdkpRdV5HM+2JkgGt1WPtHYL0c590e3kRAKHNINZhF3Or+2gA8TDQy3yG?=
 =?us-ascii?Q?2n5qZ172vbn3seAo/NuAvK4tbYiNri09kd9UFEGcqrlDlR2QUmr1l7H5fvaT?=
 =?us-ascii?Q?3QbLq0Ch6CYw45xmUhZ0ha2E8nDSbMsym1FB7jQ3nUmm6ekURiHBXcXR9Qpg?=
 =?us-ascii?Q?5kBbzQUjOSni9dElLrEFxnhYU3uBbIdA1zqDoxk/ljXAdjbuQrMSYABvP8Ae?=
 =?us-ascii?Q?35oz3K1vSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	ARn0bIZUAGa+WL5WwkinjDt6Tz/bmhs1Bn620+9O/T0bq+gnMpSpROniEY6ui1q0AdUqXRoOurxEuJ3MlwoNM5LUKS/ECvsttWH2R/skhXdhHAzIHbA3KEATtRYO6hFJloh0l39U4o0YMZnCKvKX1yjLs/wXoTHeHIpaFLGx3EsvilXDgVPuqQmIuaxrzrizW5+LEIT6c7Z301hISISYdrFHjnJVKUk5vRfsfO5WInFpUUCEFVj08l6IvYuYEW/lVlWF2CIIHDqUOSfr++ZZlux/D1klrNkvedayXBPK6LnMjAiq+4QNTYdc1b6eDYoIbV+v3FkjQIYm8LOLMvrBlQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR07MB9538.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581feda5-e925-4bd4-6281-08deb583430a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 08:47:30.3137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgWz3QaxHxgDQMT/DYN+bhPG0EqdNSXFGqOD4GXaFprwCDr9pNscsqAKVL6LCoiklDb+bK6MSN1+eIk4HJ6pxhvnbgE3rC3f1uv98It3UyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR07MB9749
X-Proofpoint-ORIG-GUID: zO4zogQY86tAtm9oUWcZj6vFmDc0Nvfm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX614/P7ykShqs
 sNEe82x5vLcJ6pgy4LkvMIN/DRZz4ahnZlbLWGqlAEOIZVeTxZddIV+rpxQ2I/nrDPBA8M6tBh+
 wmGqRL6W9EvNPNYWs5g8otzp/f3rcVr2fWK+dqmVQKmoVQM/ynqZad2jvGYVoNOpRI0Hb4W92jA
 DB8AJ0PA2VaR83poHbA0nEDzgMXCqmOX/OQEMEwwZWTr+zN16pvTmzUm9QytYm6o1N0cHI+10aH
 G3jZMTZYdpmi1XQkYnv1H/aAINpYHjZWHJL5IxaETrNAqoou0Yuj6vtuhoJFvPq6irthf7l0NK0
 T8HgovxeukAq3SLYnqEFiOkm8Bs3s3SlQEn0Le7w5vGjYL3DXCsDD2CxA08UbajidpFPDl8zrF/
 0mFYziGJXasph3ZbXFfS2IZHF87VCPLpTmtyvvp70EHFuJRKHMC2nsPysb+QhSC6/fYD9+eM0WP
 IeManCsvjsq4L6DPNdQ==
X-Authority-Analysis: v=2.4 cv=RfWgzVtv c=1 sm=1 tr=0 ts=6a0c23a5 cx=c_pps
 a=7wCTOXyfr6KSlQaUtw4X3A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=Br2UW1UjAAAA:8
 a=iDCbAsSP6ybqiK2pilAA:9 a=CjuIK1q_8ugA:10 a=WmXOPjafLNExVIMTj843:22
X-Proofpoint-GUID: zO4zogQY86tAtm9oUWcZj6vFmDc0Nvfm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190086
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37665-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,PH7PR07MB9538.namprd07.prod.outlook.com:mid];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[cadence.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pawell@cadence.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51CA857A7D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>
>On Fri, May 15, 2026 at 01:24:38PM +0200, Pawel Laszczak via B4 Relay wrot=
e:
>> From: Pawel Laszczak <pawell@cadence.com>
>>
>> Introduce a new compatible string 'cdns,cdnsp-no-drd' for Cadence
>> USBSS/USBSSP controllers to support hardware configurations where the
>> Dual-Role Device (DRD) register block is missing or inaccessible.
>>
>> This change follows the recommendation to imply hardware limitations
>> directly from the compatible string rather than using a dedicated
>> boolean property.
>>
>> When 'cdns,cdnsp-no-drd' is used:
>> - The 'otg' register and interrupt resources are not required.
>> - The 'reg' and 'interrupts' properties are restricted to 2 items
>>   (host and device).
>> - 'dr_mode' must be explicitly set to either 'host' or 'peripheral'.
>>
>> The standard 'cdns,usb3' compatible remains unchanged, maintaining
>> backward compatibility by requiring all 3 resource sets (otg, host, dev)=
.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>> v8:
>> - Update commit message to reflect schema changes.
>> - Removed 'cdns,no-drd' boolean property as per Rob Herring's suggestion=
.
>> - Introduced a new compatible string 'cdns,cdnsp-no-drd' for controller
>>   variants that lack the DRD/OTG register block.
>>
>> v7:
>> - Rename 'no_drd' to 'cdns,no-drd'.
>> - Update commit message to reflect property renaming and schema
>changes.
>> - Simplify 'reg-names' using a single enum.
>> - Revert 'interrupt-names' to a list of constants.
>> - Move 'reg' item descriptions to if/else blocks for accuracy.
>> - Clean up 'if/then' logic (remove redundant checks).
>> - Add explicit 'items' list for 'interrupt-names' in the 'else' block.
>>
>> v6:
>> - Fixed validation error for 'interrupt-names' by correcting
>>   the items definition.
>> - Adjusted 'minItems'/'maxItems' to properly support the optional
>>  'wakeup' interrupt.
>> - Fixed 'too long' schema error in examples.
>>
>> v5:
>> - Implemented strict conditional validation using if-then-else logic.
>> - Enforced 2 register/interrupt items and required 'dr_mode'
>>   (host or peripheral) when 'no_drd' is present.
>> - Enforced the standard 3 register/interrupt items (otg, host, dev)
>>   when 'no_drd' is absent to ensure backward compatibility.
>> - Updated 'reg-names' and 'interrupt-names' to use enums in the main
>>   properties section to support flexible resource ordering during
>>   validation.
>> ---
>> ---
>>  .../devicetree/bindings/usb/cdns,usb3.yaml         | 60
>++++++++++++++++++----
>>  1 file changed, 50 insertions(+), 10 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
>b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
>> index 2d95fb7321af..7b0aa9c4a2bd 100644
>> --- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
>> @@ -17,22 +17,22 @@ description:
>>
>>  properties:
>>    compatible:
>> -    const: cdns,usb3
>> +    enum:
>> +      - cdns,usb3
>> +      - cdns,cdnsp-no-drd
>
>I doubt this is what Rob meant, he asked for soc-specific compatibles
>and this is generic. A soc-specific compatible would be something like
>microchip,newsoc-usb3

Hi Conor, Rob

To clarify the hardware situation: I am developing and testing this on
an FPGA development board connected via pure PCI, without any Device Tree.
I do not have a specific SoC platform, nor do I know what silicon target
the end customers will use in the future.
Introducing a fake SoC-specific compatible string just to pass the DT
validation feels misleading and unnecessary.

Since cdns,usb3 is already an established generic compatible, and we
cannot use a generic configuration string like cdns,cdnsp-no-drd,
the cleanest way forward is to make this resource-driven instead of
compatible-driven.

In v9, I propose to:
 - Keep only the existing cdns,usb3 compatible.
 - Update cdns,usb3.yaml to allow minItems: 2 for reg and reg-names
   if dr_mode is explicitly set to "host" or "peripheral" (indicating
   that the OTG register block is absent).
 - In the driver code, determine the lack of DRD dynamically if the "otg"
   resource/register block is missing.

This elegantly solves the issue for my PCI/FPGA platform (where I just
won't pass the "otg" resource), complies with DT practices, and leaves
the door open for any future customer SoC to use cdns,usb3 with
standard dr_mode constraints.

Does this approach look acceptable to you?

Thanks,
Pawel

>
>Thanks,
>Conor.
>
>>
>>    reg:
>> -    items:
>> -      - description: OTG controller registers
>> -      - description: XHCI Host controller registers
>> -      - description: DEVICE controller registers
>> +    minItems: 2
>> +    maxItems: 3
>>
>>    reg-names:
>> +    minItems: 2
>> +    maxItems: 3
>>      items:
>> -      - const: otg
>> -      - const: xhci
>> -      - const: dev
>> +      enum: [ otg, xhci, dev ]
>>
>>    interrupts:
>> -    minItems: 3
>> +    minItems: 2
>>      items:
>>        - description: XHCI host controller interrupt
>>        - description: Device controller interrupt
>> @@ -41,7 +41,7 @@ properties:
>>                       cleared by xhci core, this interrupt is optional
>>
>>    interrupt-names:
>> -    minItems: 3
>> +    minItems: 2
>>      items:
>>        - const: host
>>        - const: peripheral
>> @@ -93,6 +93,46 @@ allOf:
>>    - $ref: usb-drd.yaml#
>>    - $ref: usb-xhci.yaml#
>>
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          const: cdns,cdnsp-no-drd
>> +    then:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: XHCI Host controller registers
>> +            - description: DEVICE controller registers
>> +        reg-names:
>> +          items:
>> +            - const: xhci
>> +            - const: dev
>> +        interrupts:
>> +          maxItems: 2
>> +        interrupt-names:
>> +          items:
>> +            - const: host
>> +            - const: peripheral
>> +        dr_mode:
>> +          enum: [host, peripheral]
>> +    else:
>> +      properties:
>> +        reg:
>> +          items:
>> +            - description: OTG controller registers
>> +            - description: XHCI Host controller registers
>> +            - description: DEVICE controller registers
>> +        reg-names:
>> +          items:
>> +            - const: otg
>> +            - const: xhci
>> +            - const: dev
>> +        interrupts:
>> +          minItems: 3
>> +          maxItems: 4
>> +        interrupt-names:
>> +          minItems: 3
>> +
>>  unevaluatedProperties: false
>>
>>  examples:
>>
>> --
>> 2.43.0
>>
>>

