Return-Path: <linux-usb+bounces-32994-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAzGLVB9gGnE8wIAu9opvQ
	(envelope-from <linux-usb+bounces-32994-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:32:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B08CB06B
	for <lists+linux-usb@lfdr.de>; Mon, 02 Feb 2026 11:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 220A53049253
	for <lists+linux-usb@lfdr.de>; Mon,  2 Feb 2026 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E666A3587D5;
	Mon,  2 Feb 2026 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fCBrIF8X"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013006.outbound.protection.outlook.com [52.101.83.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2B2E62A6;
	Mon,  2 Feb 2026 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770027997; cv=fail; b=TbWBTOg/E/VCTo9tZqssS5NaCBRRwIME1ISyHGNTVSqXYHHCUiUBbajLyO6sMM0Uyo9l0b8LrFe6E+lm1F3tQHeAUgkgcuLCYAg6ArNjpvD1aRGNpSJDFBadHmyQJpLRWI6uCGUif6GVv6bbpB6xn+HEB0JodDzGLCXjcdw3L2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770027997; c=relaxed/simple;
	bh=kqvsk2hjY1OFNeY28H6Ocz0bna+o9cg0vsHUtZXuGBg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mL+lm+uMkg/tAGnrL8g5skzNio07ukSrMXTEt6eQN2Zq11OIYU6KWdiC2BxXoDX9SfmUzXqtmonsCxtiW24oyIlHeQuhaMfhh5Yoy2+Ahp2YXW2oYqafcxZr+QMuapXwAAVDc9cZKl//nbNLSJRQ729/vjnhCa44XiINSdjlHqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fCBrIF8X; arc=fail smtp.client-ip=52.101.83.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGVhNXeWnSuCV5E4K58Dsb+hXsBZp1YpmRBCsibes/ITTaJ5Mdm6ZS4ri2MepcS+FSfZ8Bj31WZJmOJCkloX/LKaTvkq9kFL0AQ8MSuLC2Ud1/xyYtmGRMlgYf/tBsBqLBc9S/byso/JmsicQDe4isA1FMIiBc/MWFpaXuhV4O72dKc/XyEzRGQ42m/lwjTw1HGDP5707Ohw/8JCsaofdlTZJc32YuJLHuulpo6fTrWAKjQw69I0LznD/5X7Tw4veUXdfz/8MxdfI/mpHNW6Qo/IPGApDPXjSBNZet5Mpd/+7NlshO1sfYUB8CcH1Hw/os0bQEJdA5BcaD/lZcZEVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QO3m6xWrYuyuyCpkeeHGWqW0FdZHpSvd0P8QZ78kzf8=;
 b=YvnkDRjDOSccOVPJChDXueEsiZxF4k26EStWk1gXpHnf8ZZfPq9B/1tbIlzryCvBpwMHnAEpyPCW0psJblwQXqX18J1z7/FtypYX3n2+sZ6prJvua46x/vkzqJeKiBhekjVQRUbq7JLDHhEFc/rCJC3/ScBY/wifVJxCgOeUlG13rVKZVsaHlDaycn6TXFt6sXEEqoMMq/hysnNwH8xCk2g8NotVdf71zRuq94u/wZSP1lErQEKmSblwA6yHaC/FgHmT9BSLKODGiGivJuvEEhGAJTNg39CUEo/8g1H37Ks4XutW1FKxQmdp1ZXD68+vLx8izxqZlLNDWhRn1zdlLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QO3m6xWrYuyuyCpkeeHGWqW0FdZHpSvd0P8QZ78kzf8=;
 b=fCBrIF8XboBlhiI/rrKH+2IYfQ6a+KEBQ28At4m9YLGxs7Afzqk/u+08vRsrosSwksthGHnWah51Cu27aBzJoug0yhSvygQJWaptzLLAxELt6K+4JszKFOaQ5/eZ8Rp9E037V/YoL8vkBNvwtiw4FW3kgfherc8dSnKe+t7An34cxt3i4RVPqpCs/hi3L0/+uXPVaSpxbToIwrXXgjB4ofp+kZR/CCVrXVFMKXgGEC72X1TgWT5cqqM95d2CDqDTcB86OPSuaovPewvfBDQYL5GCkJrey8nThL5zKfsP82zjQStzzMh9DfpUhlAgzekkvKcmzuX9FhO0yiJhMk33pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 10:26:31 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 10:26:31 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Mon, 02 Feb 2026 18:27:45 +0800
Subject: [PATCH 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-1-c44a5e919380@nxp.com>
References: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
In-Reply-To: <20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770028079; l=5513;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=kqvsk2hjY1OFNeY28H6Ocz0bna+o9cg0vsHUtZXuGBg=;
 b=1MQqhZWA0rvus6eE3b56V2A8x0iPf7F6L0oVXzqdo1dbwEZ3k+vCagiLROGN1wzAoUifb9fFG
 qE+bnd0iyzMDYfMqFe9GNVAJTXVlQhRgSCgdHp6QcC8nLQlMhAYxZG1
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:4:186::22) To AM9PR04MB8825.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: af75d98e-1bc0-4667-a67f-08de62458839
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2NUL0tjTlU4bVYzemJMTHV2OUEweWRzcEpIaTVxSWFDVG5tYlhFMkVOTmNP?=
 =?utf-8?B?K2gvK2pXZ1hmaW5qTENZRXhPV21Tc3pqZ1RxelBXbitOUkdLRTNrclA1NUJh?=
 =?utf-8?B?RGErLzNoRXFnS29KZk11ZC8rdzVLNGxUUGR0Qlg3dGVwM3B5VnRXOXhkTElB?=
 =?utf-8?B?VExWVjFUcmQ2VlNoMk1wZExxeUdBUW0raFE2M0E2c0EvL3c4R3BtcWtWR3RV?=
 =?utf-8?B?Q0o1UzVKSlgveFhlbEhMV0xJWjg1WnJwdytEclIwdWhncDdONlV0RkJnYmlj?=
 =?utf-8?B?dG5MVEM1UlNhY1p0NWh5b2tJS3pDb0JUUGNhOHZlajg5YVVNS3l5b1VCTkNj?=
 =?utf-8?B?aThRSnhxYUZ4RFR6MEhJQmpXZHlxTEQ5QUorcFRnNUpibWxSYjZoVHhWcHBR?=
 =?utf-8?B?Y2I2YUlaOThqdWxDdllhZmZUYjRtRFZ4aW1NcUdNcDRCRVVuK2M4Yjl0ODhl?=
 =?utf-8?B?L002c0Q0ejNMdXZ3OFhQeEJvcGVlQzhaaWx2QzMvemppSGd3cm9yVU1xSVJr?=
 =?utf-8?B?MXlReE1DY1JTOU5UUU56V0R1VGdiN0FWTVArQ0JvdUV3NW5RN0UwUmI0N3RN?=
 =?utf-8?B?endxU09sVHJEUkExZ0VWN1o3UHRTMEFDZUg1TlI3eTJheVhTVytCZTJjeXZq?=
 =?utf-8?B?NW5BRzMwUzllRFozYzk1TGwyakxjRGIrQ01lWTBQN1o2VWlyZWZCRTNoaGtu?=
 =?utf-8?B?Ymo0WkczSU1ISGFCNEZ6bVNzYlFHRXFKNGJNRFU1dXkwdVo3aFhWc01MKzB5?=
 =?utf-8?B?Z1p3eDZRZ0RTR3NBY0kvelhaRWtnbUVjVnRCRUxjU3VhY1p4TEtpd0xaQWxu?=
 =?utf-8?B?bU1KQ1BNZkN0RFg1RlFIcTlRaFhsUU5NcnMvNmdvakgvcTdBd3VQMFpyNENo?=
 =?utf-8?B?VTEraWhwdXZaWDVPdGJqSVVESmx3Z0pUV0EzNm40SjdNQW01anVWcDhHaG8r?=
 =?utf-8?B?SGp3WndnWUhvSU5kaHphVnJzSS9vV1ZLT3dCaHVSUlBMaXBoS2l6RCtBOFln?=
 =?utf-8?B?MmpJR1gwVnBRM2dFN0IxbkVkdHZlYzFZNjNuT3FzYll5blFjeTFvRGt0Y0Nh?=
 =?utf-8?B?OWh1dDZCcWpPS0tRUUV6ZFhMVnoybDAzb3VnWHZWa0Y3clhma1FSM2l2Y0Rp?=
 =?utf-8?B?ZVNlSS8yYUFMbUF3ZFpNaDlsaThtQUFUM2tPeDhsUHRiblpmS25XZ2Mvclcy?=
 =?utf-8?B?R0ZkRE5WS1pSVWZDV3FrMGRKRW4rMzBDNjBRRENMUUZ2RHVYSjNHQnRzaXFv?=
 =?utf-8?B?MmVIdFk5Q0IranNpZ1AzTUQ3YURmM21sS2VvUU93SHJmOU0xWWRZQVJQN0xy?=
 =?utf-8?B?U2dJd0U3L1BrWFU3blUvYU1ocmpPUEo1dDRoV0VyYXJVdkxMQmRTd2lwVzdj?=
 =?utf-8?B?UU5JODd4SDQrbVlLb0dnTE9WdjNsSTRNQXlpUDBTMkV6OW5BbzNtOGpGaDYy?=
 =?utf-8?B?VG40Q1Q3Tkw1YlQ5YWZkZ1BHYmhkUnI0aUNjZXFFYWYvYWVCdGxGaVBvZmlo?=
 =?utf-8?B?VGFLVFdMWEgrYk1GWlM0SzhoVVZjem1BZVI0SGJQbVhHcVVKeTlXQjY1SVI2?=
 =?utf-8?B?ODh3RXpZVTIyYzdEUnF1WXloYWg4V3BxMUYvVk1mellTVi92UlZqS1g4M2NP?=
 =?utf-8?B?NVphdEhrTDN3ckI3NzY4SzducFNYSEt3c2d6Q0MwM0FTK3NJQnFqYWloL25m?=
 =?utf-8?B?bkJHYm8zWU9IemJFcTJPbkNwNUlGSXEzNDcwaWhzbEJpRXNwTjVoamQ5ejJZ?=
 =?utf-8?B?ZERUYUFKWFlYd3Ywc3B5QS9ydktlUm9LSy9xWXNNRGx5dHlCU0FWOHd3WkN3?=
 =?utf-8?B?M0NWUHJyV1poWGp5Y3R4ZmxoMXFRMUtuRTFiU1RYMUM1aDdSaTF6K2Q5MHV6?=
 =?utf-8?B?R3lHSkFTdGVCWWpHVGdYbVZ6d2J6eG1wU1RRUjhabFhqdGhncDVHTDhBL2d0?=
 =?utf-8?B?TENiaTVkZDBRUWNRSHdLVm51WEEvbjRmWXVwNk5pOHNndjFRQUJSd1ROVURS?=
 =?utf-8?B?Rlkwd3JWcWFPY0ROMHZBTEpkdDkrblFaSEFzbHBOVTIyUDZaSXpQZVY4OEkx?=
 =?utf-8?B?ZHFaNkVqeTRGaHpuVTZVRUtLWnprQ1Fvb3NmL1p0ZFYrUlRtWXJSaHJERjU3?=
 =?utf-8?B?VWxHcmh1SFBuNWpBcGxVclVRMDZiNXJUYTdUQ2k3NThTNG01RjB3NFBDNnZa?=
 =?utf-8?B?bEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkxWbEdMdUg0SmJkaENDUFd6QmN2K0ttRVdqS2laekhBbVFZdTQvdzkzUFd3?=
 =?utf-8?B?dUlkaVE2M1ZlMnJpcHRIWWpoRUdjZENnVEsyVllLOTVjM09hd1BEaG1FRmRX?=
 =?utf-8?B?UXc0ZHRGdWZ0Rno0K2NQV1FCaTZmSmJWUlJ2QTdtcnR3Lzd4QUthWk5hRy85?=
 =?utf-8?B?QitwMXl2VDdwM2kyTzg0L0ROVVhEaHY1MklmWnlZVFRVU0lJT2dBQXFSN3RU?=
 =?utf-8?B?MmtyUThnYkNxTFk2V2g1aDcySTFqMEVSZUNjLzE4WFZ3SUUzUGxNaHpWaW5i?=
 =?utf-8?B?MjhLUU1xM0lhK3ovcGFnQXVuSDdZbDdURkhsYXozN094YWhlL1ZIaGVYLzNQ?=
 =?utf-8?B?RDY0U0ZteStXdDdvekVwdE45cEN2UFlIci9PSkh4K2ZHM3BieG00R1RJSUtj?=
 =?utf-8?B?VnJrUTdFdWg2K3piSThOdTRtMWhVT0VNSDY4ck1NM1dzQmo2Q3phb2g0Z1ZQ?=
 =?utf-8?B?QWw4Z09uSXF6Z1h4dUFlK0xsTk93Y29TUDR4WjF0c0FJV0dKVVFzRk1NT09q?=
 =?utf-8?B?RzRnb2dNalE4amRvcHo0OEM4cDVKbDdYWW5vMG1GdGJaaThFbUYrRUo5Q2Q2?=
 =?utf-8?B?WDVVOFV4RHhBOXRVb2hQdkdLK0w5QUp6eGM0NXNIRnk5RTVNbmRVbFNTb0tQ?=
 =?utf-8?B?MVpQclBCNzZ4NEZxT1pQV3BxQlErV1E1U3dtbkhoK2s3N3VCTUx0eHl1ZzBY?=
 =?utf-8?B?ZkNJMmY2S1ZoYU1hRTN4SjlHZHkxWVdqdFFra3plQ1lMRmNsTU0vSlFNWkVF?=
 =?utf-8?B?Y0IzZldtVmM1Q2dYTEx2MFhiNG16YmQvZTg4ay9OTDJIM1dMbWpqRFZMYTd6?=
 =?utf-8?B?ZXlzR1A2TS81SGV0UjZObFRQTWs2TzMybkRkOFlrTzJpMEkyL3M1TzY3QlFw?=
 =?utf-8?B?cm9IWVQxeHRudjR3S0FsSSsvQ0ZOc2gxUGdxS2lVOGRIRUJGOHlNdFhGbE10?=
 =?utf-8?B?RGZsVkQ4TW85UFlQWjdiMlVyR2tVTjFrOC9sOVQ0NEMrd2s1K1M5VEdJMS9T?=
 =?utf-8?B?ZVJkODNRVFk4Mk9Xd0xGT3RTdXpzQTdXMFZ5T05OV251Snd6UE9pbWk3ZVVK?=
 =?utf-8?B?M28zaDJnSGxnYUEzdlhwYkZXcFA0Mm9SV2s3MVRmTTQ3OHpNQXBkTlhQK0Uz?=
 =?utf-8?B?aWJRM2JMNUc5RXFIcW1BSlBlR3E1emNWTmRENXZYSXVaRGU2UTRGekZMWUw3?=
 =?utf-8?B?c0JFcjdQcnRjcTNXRDRiV05GK3pqQkQyYVBZTTZrTlBxYiszb0c0MjFHNldC?=
 =?utf-8?B?amg2Y05zcGJCelBkRjJ4QnMwNlFUbUNBbXpXcVloNzd6ZlZuQ09QWFlqVTlY?=
 =?utf-8?B?WkdSREdpcHo1aWtmTXp1RUVrU1Bjc2pFdElwSUNqSlJ4RHFmT2t5TmZGTGU5?=
 =?utf-8?B?OXluZ2s5NXRSdGhlN0xYV08raUp0TkVIUGVuMmlBT05QTDMrTEFteFRCRDR3?=
 =?utf-8?B?Umo3WEVSaE9yQUxpd2tXY3ZIZ0cvS2MvakF5SWVDQVhCSnhheHd1YUJEdzVC?=
 =?utf-8?B?RFhmSnRlbndhQzBiWFNLQnV0UWdsbTFJSWMzSVFSOC9waTRZbXRJNkx3WGEz?=
 =?utf-8?B?MkNKSnhuNUZILzMxdVNxOGdaTFE2TVN5WmxNZFNILzZhbTc5MHd5OC9KOWhn?=
 =?utf-8?B?K0JHaTdRZ2hLTmdpOExpYk42WFpZNDNqVTNwVms4MmNhMDZTMTlBN1pEcTJ5?=
 =?utf-8?B?U3d3bHkzOVp4T1hMRjlyZzAzalFMV3ZsK3Yyc2srdEczblpsY05xOHZTY2cz?=
 =?utf-8?B?ODJuK2lkdVI1cmVyaDlhSENXMHJIY04wVUx1MUxWSS9aR3loSmw3R3BGVVBn?=
 =?utf-8?B?L1BYY2ZjTWJmY1luOWRvQ3FDNTNwL2lHWm5yWnZncENYb29DQWtPQm9WdW1j?=
 =?utf-8?B?OXFNOFVJb09Ub2djaG9iQlF0cUNtVjExVXcrcEhpWUpNZy9OdHVwWXpsSTdM?=
 =?utf-8?B?eU1pZDlHS2M4MTkvYjRKdWljODFCVERXQ05iaERxcXoxL2VucnBueW4zZW4r?=
 =?utf-8?B?YjBmUk5PYkVJVkJuanFSMEU5NTVPdmQrd1NLUmlybnpJVzJBaWNNajNCQlZq?=
 =?utf-8?B?Y1lVT0x6UlV3Smc5Vk94WXp5c0pSY1lubDdMZURHaTFiTXIyaytXdkdIc3Vq?=
 =?utf-8?B?bUc2WGtVRGFIdW1aYVlsMGh6MGlZY1hPbXJUcHpIYmdTWFM0b1FrbGR3bEJO?=
 =?utf-8?B?TVJDSzMrMkcxWG9ZaFRrN1VXSjZiaWY2TzFicHo1c0d6ME1vRTErOUtiS25C?=
 =?utf-8?B?VXRqRVZOaTZ3K2VsOVF0TUU0VUtFSlUxUUU3SmYya3Y5YUtwT0hCeW01NkEz?=
 =?utf-8?B?a0FtblhRbFZpQmlDSEoveTNCb1ZzY0lCTW5obUtNNUFiM1F4OXpzUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af75d98e-1bc0-4667-a67f-08de62458839
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 10:26:31.5142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hb9ZiUHlBA9uzxpwfzmfVwhDkQxKSBh0z3gmeSqAdhrZgtJWz7K2sbwegQE9HLWFP6fs5D+/LIPU0XiYs6cXvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32994-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[4c100000:email,devicetree.org:url,i.mx:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 39B08CB06B
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
the needed modifications.

Add the common compatible string "fsl,imx-dwc3" to indicate that the
flattened module should be selected. This compatible is also used by
"select" to inform the DeviceTree validator to apply this binding.

To avoid redefining all the platform-specific compatibles, "select" is
used to tell the DeviceTree validator which binding to use solely on the
generic compatible.

Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
using the new combined binding.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++++++++
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
 2 files changed, 144 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bc6b9743396e8f6b698706caae71241b0512ce8b
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2026 NXP
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/fsl,imx-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Soc USB Controller
+
+maintainers:
+  - Xu Yang <xu.yang_2@nxp.com>
+
+select:
+  properties:
+    compatible:
+      contains:
+        const: fsl,imx-dwc3
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,imx95-dwc3
+          - fsl,imx943-dwc3
+          - fsl,imx8mp-dwc3
+      - const: fsl,imx-dwc3
+
+  reg:
+    items:
+      - description: DWC3 core registers.
+      - description: HSIO Block Control registers.
+      - description: Wrapper registers of dwc3 core.
+
+  reg-names:
+    items:
+      - const: core
+      - const: blkctl
+      - const: glue
+
+  interrupts:
+    items:
+      - description: DWC3 controller interrupt.
+      - description: Wakeup interrupt from glue logic.
+
+  interrupt-names:
+    items:
+      - const: dwc_usb3
+      - const: wakeup
+
+  iommus:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System hsio root clock
+      - description: SoC Bus Clock for AHB/AXI/Native
+      - description: Reference clock for generating ITP when UTMI/ULPI PHY is suspended
+      - description: Suspend clock used for usb wakeup logic.
+
+  clock-names:
+    items:
+      - const: hsio
+      - const: bus_early
+      - const: ref
+      - const: suspend
+
+  fsl,permanently-attached:
+    type: boolean
+    description:
+      Indicates if the device attached to a downstream port is
+      permanently attached.
+
+  fsl,disable-port-power-control:
+    type: boolean
+    description:
+      Indicates whether the host controller implementation includes port
+      power control. Defines Bit 3 in capability register (HCCPARAMS).
+
+  fsl,over-current-active-low:
+    type: boolean
+    description:
+      Over current signal polarity is active low.
+
+  fsl,power-active-low:
+    type: boolean
+    description:
+      Power pad (PWR) polarity is active low.
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    usb@4c100000 {
+      compatible = "fsl,imx943-dwc3", "fsl,imx-dwc3";
+      reg = <0x4c100000 0x10000>,
+            <0x4c010010 0x04>,
+            <0x4c1f0000 0x20>;
+      reg-names = "core", "blkctl", "glue";
+      clocks = <&scmi_clk 74>,    //IMX94_CLK_HSIO
+               <&scmi_clk 74>,    //IMX94_CLK_HSIO
+               <&scmi_clk 2>,     //IMX94_CLK_24M
+               <&scmi_clk 1>;     //IMX94_CLK_32K
+      clock-names = "hsio", "bus_early", "ref", "suspend";
+      interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+                   <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
+      interrupt-names = "dwc_usb3", "wakeup";
+      power-domains = <&scmi_devpd 13>;   //IMX94_PD_HSIO_TOP
+      phys = <&usb3_phy>, <&usb3_phy>;
+      phy-names = "usb2-phy", "usb3-phy";
+      snps,gfladj-refclk-lpm-sel-quirk;
+      snps,parkmode-disable-ss-quirk;
+      status = "disabled";
+    };
diff --git a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
index 73e7a60a0060dee6417b9469251e121704b7a148..fd23c345149e0dba1ed3919a25195edf247cfc08 100644
--- a/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml
@@ -10,6 +10,19 @@ title: NXP iMX8MP Soc USB Controller
 maintainers:
   - Li Jun <jun.li@nxp.com>
 
+deprecated: true
+
+select:
+  properties:
+    compatible:
+      oneOf:
+        - items:
+            - const: fsl,imx95-dwc3
+            - const: fsl,imx8mp-dwc3
+        - const: fsl,imx8mp-dwc3
+  required:
+    - compatible
+
 properties:
   compatible:
     oneOf:

-- 
2.34.1


