Return-Path: <linux-usb+bounces-33315-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4BrHEDCRjWl54QAAu9opvQ
	(envelope-from <linux-usb+bounces-33315-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:37:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 971D712B67D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 09:37:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14A49317F294
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 08:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60A92DF144;
	Thu, 12 Feb 2026 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hGEFkmXV"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA852D97BF;
	Thu, 12 Feb 2026 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885250; cv=fail; b=NjUc91w8b83fkS9yk3yG7ezKn2Vzz0MKGEJEn23LMbARC+JCWJXhob8GkGSxIhXWnJaxQRulklJt4ehllH1xTy0gYTk2Mvemxuslm7yAtMLMzhPBLpX1cxyATKObzY6NaBOjZfy37usjBYiGoiFKYucH5MApJZyw3yXie2oBOsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885250; c=relaxed/simple;
	bh=gTREy3dJ/Xl0WowVsn42BDAtp5Pb2bv0JFzKxd4EHUA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=P+0fe5AIqQnkQJF2jOQc2srAEHETj8YaUoLmDNdj6LjcvIJUTzqI4IpxKxVbSkebfnhRXO9joTOOil4/9zZ3JCVGwAkLpx9BlVpzHDXGFTwNsOSWawPu8MtiKWHLAyfR/VHDbgjsbcv2tN6ijhy688WOWc+5wu+8d7KUKe+aQo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hGEFkmXV; arc=fail smtp.client-ip=40.107.159.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JITS3cHhiZ4naSs77+YbuWxzB1Y7ju7DEJjInIvAcqnKxHGt3MIy2gbAjZEWvPtrCCoDAYPbD8FuwbLJQ6pJEpxE1L2GsHPuCIYPg6cKbhCfdNZijun3UXh70cR33b9weBqlo2D8c3H5W7olTHaABWzjbCGT2WHuwsbFIqAL4yee/wTP3FsGZi7L97pbOgP3b4g8WG06++kScxCSh9n1o9FaKA3a5Iag6sCcVDZPeIvt/02oKA25INPTAYz0ALh6XbdP/ckypRWDP1vHBzwmW7ytUxx9b4bNGXYuj8soae2xCDnMwsEX4j51jRZroRXTR+/p98maF5M/O0VVHeUtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6GXoFbLjwRoMJFdcjcqzwmX1FhKWU/O+LR4f+MPqNE=;
 b=OHG8TFmY+ghtUW1F14p24KTOS65iAYG+P1tI9TFh9kPPKN94brGXR0VRMueEdC4tvuMotCWFAvhFUHqDGaUnDPEXzTI1gGEeH9fEInj2338bnmS0OAaF5JFzojGKHjwVdrC17c+vL6Ck9osW6D7lYgKeZPbcXvBR4b74Cb+oTQvSXjVq4Nhn9VwKt3LW9YtrWjrqn/QywjnbT4rFfmFKNrNgR9ZrHN8YjM74eKYdio7eK5asXeTjFo55y84IyODuvLcVxkajLPW3XZtMhA8ZO14kGNaOGJL7Lhb8m135kNna5gK+Tqtu/TB3XPhD1Qs0jCS99MKGZPDzHejAXRdqEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6GXoFbLjwRoMJFdcjcqzwmX1FhKWU/O+LR4f+MPqNE=;
 b=hGEFkmXVjo3BoPbTmU6giIRZKZQKeU2+H9c7P68xCcXM8HVti/xuaw1f2J5MFXnR2PyF203tRrAItK1peXbnXhohwnumjxWN/T0F3atnuPPUvwLLSP0pTnDnnwjWIvKq8MDfnGN4GRfCcedNx01AVylIcHV/P9MtOcS83oo9tijMpSWW2fo10cbRsGl12S0TUY7O+4sZUrPKoOAmqQGbbY3rHCrGwxUnu22j8lg9CTyDojCGvrzb0MGCJPtc0B0KjCSBWlucXYCW9wgBTsPijhOdif7UAiva4xVhQscc0IHE0LoPD7cdwpdzzEHWRheHXfKvwsjuhPudUgQy1rMrdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by GV2PR04MB12269.eurprd04.prod.outlook.com (2603:10a6:150:329::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:34:04 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:34:04 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Feb 2026 16:35:05 +0800
Subject: [PATCH v4 3/3] usb: dwc3: introduce flatten model driver of i.MX
 Soc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-3-08c10b08ebb6@nxp.com>
References: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
In-Reply-To: <20260212-add-flatten-dts-based-dwc3-imx-driver-v4-0-08c10b08ebb6@nxp.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770885336; l=15904;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=gTREy3dJ/Xl0WowVsn42BDAtp5Pb2bv0JFzKxd4EHUA=;
 b=4XQDTfhZcdAF1u0KYr5zJkPon6nTfmyK2/ljjv2smcQgezz7K4Rsfy7Bejaq/xBAIJGxvR2Rf
 IKJ1sYN3QHkBetEMgGycuAfl3Tp0qpPzo6t2jRLGNWVMzBf8W6U4K0m
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|GV2PR04MB12269:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5d24d9-d2f1-4ceb-799a-08de6a117a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjhzaGhXL0pheXhiYTlqU29hbWhjMmtvMkNEcmMxWXFqRXZvOFpycGEwd3lU?=
 =?utf-8?B?V09ydFpqcUVwQkY1V0dSYjhPWVkvSmMvTWhpaWorT0xad0p2QWJPY3RNL3N0?=
 =?utf-8?B?RXAvaXZEQ1ZianpPUFEwaVZFUjZmTkRHZEw2cTdKOE12Z3JLT29Mekk5dlFt?=
 =?utf-8?B?VnFlN3gzNVlXM3JTbUVDT2tsV3R4OVFlVDcvbTR2MHk5Sm1KOTBPbmFnZ3p1?=
 =?utf-8?B?NUpWTXVBRnhYNFhkVHhOaHIrL1ZzSkt3QnZnc1hUU2p2RlYxTTVPVzJWcEo1?=
 =?utf-8?B?TkdJZ2dERlpxUytza3M0djg4VTJMWDRDQ1gxb1FRbWZJYTdBcXdXamI5Z3VW?=
 =?utf-8?B?SUh6cktHeG12dkMvNWRhcWF3NDhneSt1R3drc0pQb21VamVMMVViejB1eXho?=
 =?utf-8?B?ckZoUkl5cC93SUFaQjFDYmt4ZTUvNzFZdW41dnIzWVdsU3d5dGxTRHUyZWZC?=
 =?utf-8?B?TzRYK2ZOSFN5Szg0dGoySW4vRkRVMC83RHE3Tm5CM3Nmc3hoK0hWQmd5MUsv?=
 =?utf-8?B?UENSWHlXVXFUVWNkU0JUT0VqYjNvN0EzbzNOalV6UnNWU3NSSGxubCt5RUdO?=
 =?utf-8?B?anhCOEx0RnlMOTM4QzRscHNSb1FkcHc4Z1VTVk9zQzZRald0K2gyZ0NUMVhm?=
 =?utf-8?B?azV1Nk13cUZGbFJQd0VOcm9ESXZDRHUrbmI0ZVhxNGhaOWF3VDc1NzUwbHUr?=
 =?utf-8?B?VnNTTzhpS1NrajB3WFVWWTNSVmtlSlBxUERjdm84d0VRMnBSc205QmViRUx5?=
 =?utf-8?B?VHZsdzRsS0pBOGJObGFISnZ1MHFsUnM3citzeUVWRTcwNlFZTWR5SWZCTW50?=
 =?utf-8?B?cDVvVlpQUWV1VE44cFVuNU5OZ1pKWllYZk92TE5VTVFhaXJzZEtCcmFmcDQ2?=
 =?utf-8?B?UmlhM1JTWlhXdG1aY3pYbFNDRElTbG5rNVFPUWI1R3BxdnNhTmJyM0hjdDBx?=
 =?utf-8?B?MHBzckNBY0ZBdTR0d1FNbU9wTENaNmZVa2J4K0haQjZCTUduQWtRZ2hRN2hK?=
 =?utf-8?B?TjNOdEpURjFsc2Q1bGQxQ1hSSHdzNXlmWk9uK3YwRXRYeFFMZGxObk5SOGdV?=
 =?utf-8?B?dkpzMytxc2NzQUFkZ1NPUlVTMFp5WFlvcmU0QVRUNlhOM091djh3bUJTOXRH?=
 =?utf-8?B?OUtDMzRkVjFRdE96N2p2WXpHUVNjQW53VHBSdXpuSG51cUtzQXk1YW10dDdz?=
 =?utf-8?B?eStRdGhaZ1BSbVdhRzRHZEE1aHFwQVNGZ2lCOElsNFRVS2tFRWh6Y3BMc2pD?=
 =?utf-8?B?ZlJrbFFtSVRZQVZmRXE5QUJCQkVXRG1oenVJVnBsZGlmeE9rbW1qeHczT0Zj?=
 =?utf-8?B?MExuU01TYjk0aHVWRXM0TmJZWkxwZk9tVzFNK0xyRWxIMVA4TmVheVhCVG9W?=
 =?utf-8?B?MkI5amltL1oyZEY4Um5ZQjZNaXVCUG5OMmpQMzRCZnIxMk9RTTd5bHoxeGxO?=
 =?utf-8?B?amNyL0FWWUthMmFPemQwa3R6RUx3Y1lUUzZLTWRxUjR5YkZUVjNXUExtb3Np?=
 =?utf-8?B?aWNWVGptQlBlay9qTHc1VTI3eHBCWUJQTy9OLytXZUFtNHFqbGs0Z0RJTzZz?=
 =?utf-8?B?Vlpxd3AyL2xFS3M5cSsxbEMxamxMSzh2bEk0MGZEeWx4Tm5VT0JBNW9pNkpG?=
 =?utf-8?B?NkQ1U2c4bzhoTUUyZmc4Tnc0RnhuL2p1QmpZa3BPdU02K1J5ZDkvSkNwVVpa?=
 =?utf-8?B?MFpaNlJpOUxyMmdFbjVTYXJFYVZsTzFsMWZTQkRETkhYL0M1Z0xnejl1NTRl?=
 =?utf-8?B?N2FYdHp4V3Nwa2NSTHY5K1I2TjdwWXkxZExwam8wSGtvdVlKNXRxMlZNQkV1?=
 =?utf-8?B?RDRIcWo3WDY3Um8wa1hMeENobGUvbEpzbDlkNmxkOHBYcG1GdXd3MENBZDV0?=
 =?utf-8?B?NVNjb0RlYzBWU1F2T2FVSUdXTEk1ejZ0YktiNFFrK2xNTFU4NDRGYzdXeVdu?=
 =?utf-8?B?SFpXcWtPcm1VMzBmNWhjREgzaDBzcGRXNW5zMTh6dU1SaW42R2VQVk9ZSER5?=
 =?utf-8?B?U01YYlc3Q1FNL1ZKYjJtNHdkRUN2dGI0VGpUNkwrTnA0MmMyVzUrTkUycUdN?=
 =?utf-8?B?dzFSeUtHT3psR3ZabDIzRElITmk1NkRVdzhkU2paVVhwTXphY2hRRHB2Si9W?=
 =?utf-8?B?U1dnRW96ZElWY2RiK25LcXI0VENyQkhyaWxCelRrUUl2Y2tYUVNFSnowM2dz?=
 =?utf-8?Q?N+ScmWWMMP+s8YCow+i6a6lA1v0yCJUcYO3aLYTl238I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUt5QmQ5Wks4YWVLaXUzc1NHQkFhcVl0alI5c2pOd1gwYlM4QzVlazBNMjFz?=
 =?utf-8?B?RFJIWXZiSTEzVXlDK2duN0JKdFl2MEFQQkJQZUN3aWZyQU9WUWxUSEFXQzFG?=
 =?utf-8?B?OHYrd0tFSHd0MGE3SWo1YWdtcjREUld5SllHUnUzM2F5YVdFM1NYdStlcGd1?=
 =?utf-8?B?SnhZVU1SakhtcU82aE4wWERydkNzZEdERDAzZFFrc3dzdzd4ajZTbGt5dElC?=
 =?utf-8?B?NTRyUWhXNzVNSTVPcGg4cnhyMkNDa2xvSi8rT3N6MnJCWTdkV0szSTVCQ01L?=
 =?utf-8?B?bG95SGhzaFUrYy8yWm14NlA2QkFTY09DOFRucjBTNGZvN2F1R2VQa1ptS0Ja?=
 =?utf-8?B?Zkd1cnRHUlRyeXF1V2RXZmNleDQ5eGVFYnhlMndWSlZ0dlRnMzZHYnFyR0RM?=
 =?utf-8?B?Qld1eVB2dVpvVThmZ0NvSlp0cEJmbjZ5VUxHMVVaUTVTbVFuOTFPN1pBVi9D?=
 =?utf-8?B?S2RYRVp6R2xUVXMwdjdLSVpOYVdCUUY2b0FScldkWFZGWEMvdnhTeCs1UGhU?=
 =?utf-8?B?NGtxMWxOTSsxY0REbzRHNDFuUDhGQzJGVmpmblZaSklPcHh3d05NWVhiVVJP?=
 =?utf-8?B?OFozZHh2Z3dibFJlWGQzUm4xMnlJSVpzYk80WmJaZG5RY1owcmlyY0UyN25Z?=
 =?utf-8?B?VkdFVUp4S3pWVHIxbkxGT2VEK2UydDlIQWd0TVAzQnhxaWNHbkhTdTFIdVFO?=
 =?utf-8?B?bVQ0VjZFYUtScEFOWUh6b2F2OWFJMnFLNjY3QW1wS0pxU0FkZkpzZFBKYXg3?=
 =?utf-8?B?R0ppQUVCaW03bnJkb2ljay81YSsvVCtuS0NsZS9wSXlwcDZ3VldVTlJYU2dZ?=
 =?utf-8?B?aVBOSjNNdXdpN1NMY0NxeFdRRWZXT3NIamoxb1hhdVpwNFVZYkdEOHpibmsx?=
 =?utf-8?B?S2tDcFhiT1hnenlseURJVTZ3WGVqOXU4ODFwMkVMNkdjNHlzV1QzWlpEdnNU?=
 =?utf-8?B?THdFMkJMSEp4U09wUThTdXpwbCs5RERrVzdLU1RsZzBnRW1JRGJJNFpWOTVm?=
 =?utf-8?B?ZTZrdldGMlV4V2ZCRUNCUEh6b1JhWTNEd0FkZ2xZSWNUNkVpaCtTUkRQbFNz?=
 =?utf-8?B?U21YUTNCWHhrRi9ZaTFZdHRIcHRKU0trWWRGYSs3R1hjdlFyNWFyUW55WjRw?=
 =?utf-8?B?MVFsK0NnL3F4aEVWak5mOFBoUWZCcytqTmJqM0RuSUNSY3BJb3pZVDRaQWhu?=
 =?utf-8?B?NnFGVDZXQy90bDJXaXhKdkQwUjlyNGRFQUxxMUxQdmU5bHpENXYrd2RnZ2Q4?=
 =?utf-8?B?Z1lhNjhjMkIvcjEwUTREb09KVk1WOGNnT3ZlOUNNWG9HK05DWEJad1U4Q21J?=
 =?utf-8?B?TmhRNUdReng2UWVlK2tROTZ3S2dOMGpWa2hjRmp2aDdZZldZSkIrc0ZsWE9v?=
 =?utf-8?B?NS9UY3AybmovWm94ZUF4TnhtQkQyRVhKMUlqbHdaMDc1WjlXY0ZDTEJmN2c3?=
 =?utf-8?B?SVFKMWt6bWZsajlpWGx1dmNWcWRadVFLVzdBY3lRQ0JuYnNZSE1FdWtGRnVo?=
 =?utf-8?B?WXpWV00yR2JNUHZZSnVJRmtsaCszNXFVS2oxZVFOM25mMEJ3Qm44V3NvUjZL?=
 =?utf-8?B?UGhnTTlneWZlMDJ5alJ4YjJ0WHNReTEvTENuVUhWTjhKSDBkL3R1OTkzMWFs?=
 =?utf-8?B?d2ptWkZUYXFhTDJ4VzBVZGdyRHpCNDJqMmpSdFJhY2JWeWxnZHRuUmJxWmNo?=
 =?utf-8?B?OUlZaDZZblVoVU1zaVRoZDVJMUVuMXNtZ29EVGN6dEFhQU1KeTMyaWcwK21v?=
 =?utf-8?B?VmhwUFpOKzl4QklGcy9NYXdLYktkWkh0R1ZXL2NmT1JHMy8rK21kbnhaeDA1?=
 =?utf-8?B?QXhOVFpSQ2tMa0t5S05qRzBJTXdxTnZ5d3NJcHBpUU02QnZKbndaZSs3L0ZB?=
 =?utf-8?B?aEthR0RyVHdNdXc4YXhTZWk0QVV2VGNONFJzNEp5YlkvRzVpbmJ4VEhUTC9T?=
 =?utf-8?B?UHBKOVo2Rkh3OTk4MU5SdnFzK25mdUZnWVA0bHArV3ZiK2gvSkRMLy91RDIy?=
 =?utf-8?B?a3ZNcVlNRFhGMnVHSEpPaHU3YVJlQ0F3amoyY2poUnBpdEtnNHZxeCthT1dh?=
 =?utf-8?B?Z3JoUUpqOEdZSWpzOE4rdzNadnozaWVLTitDODcvUGtYZUl1VTk3ak1SMmFQ?=
 =?utf-8?B?cE85c05Cb1NOUnVwamdtcUtEdjRCL2psZTBuemlGRStnSlJpNHhPbG5DTkU3?=
 =?utf-8?B?WUNkdVNXM2IxOVN0MmJEcW9YVkZGM3daWFc4Z0FHY1dIa1pBbXZid2l3S2tV?=
 =?utf-8?B?Mm5BV2JmN0hhakRwWHl2TkcrR2ZqVmxob25OcENLSFR1UjhXVTdPOU03d2Yv?=
 =?utf-8?B?cy9uckJFSVhHOFd3MTNyYlpBNHdPemdaV1JLTFBLQ2pUbWVsSWJGdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5d24d9-d2f1-4ceb-799a-08de6a117a9b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:34:04.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UojhZuHlcJJexUlrHfw7akFfCJakE9X16iYopKme7uXvohPafGdIsjTS1rw5TctMBEE78UJjawF2exMJOY3PBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12269
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33315-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,pengutronix.de,gmail.com,nxp.com,synopsys.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[probe_data.properties:url,nxp.com:mid,nxp.com:dkim,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 971D712B67D
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation. To support the flatten model devicetree, DWC3 USB core
driver already support to directly register and initialize the core in
glue layer using one device. And many notification can be received in
glue layer timely and proper actions can be executed accordingly.

To align with mainstream, introduce a new driver to support flatten dwc3
devicetree model for i.MX Soc. Besides this driver disables wakeup irq
when system is active, no other function change in this version compared
to dwc3-imx8mp.c. After this new driver is settled, only maintenance
fixes will be added to dwc3-imx8mp.c, new features will only be added
to this new driver. Once all users switch to this new one, the legacy
driver will be removed at proper time.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v4:
 - add dwc3_imx_get_property() to parse of node
 - add some flags
 - remove dev_dbg()
 - add more info in commit message
Changes in v3:
 - update compatible as nxp,imx8mp-dwc3
Changes in v2:
 - improve commit message
 - fix code style
 - add IRQF_NO_AUTOEN
 - remove pm_runtime_* in dwc3_imx_remove(), dwc3_core_remove()
   will do that
---
 drivers/usb/dwc3/Kconfig    |  12 ++
 drivers/usb/dwc3/Makefile   |   1 +
 drivers/usb/dwc3/dwc3-imx.c | 442 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/usb/dwc3/glue.h     |   2 +-
 4 files changed, 456 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 240b15bc52cb..18169727a413 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -150,6 +150,18 @@ config USB_DWC3_IMX8MP
 	  functionality.
 	  Say 'Y' or 'M' if you have one such device.
 
+config USB_DWC3_IMX
+	tristate "NXP iMX Platform"
+	depends on OF && COMMON_CLK
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
+	default USB_DWC3
+	help
+	  NXP iMX SoC use DesignWare Core IP for USB2/3
+	  functionality.
+	  This driver also handles the wakeup feature outside
+	  of DesignWare Core.
+	  Say 'Y' or 'M' if you have one such device.
+
 config USB_DWC3_XILINX
 	tristate "Xilinx Platforms"
 	depends on (ARCH_ZYNQMP || COMPILE_TEST) && OF
diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
index 073bef5309b5..f37971197203 100644
--- a/drivers/usb/dwc3/Makefile
+++ b/drivers/usb/dwc3/Makefile
@@ -55,6 +55,7 @@ obj-$(CONFIG_USB_DWC3_ST)		+= dwc3-st.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
 obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom-legacy.o
 obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
+obj-$(CONFIG_USB_DWC3_IMX)		+= dwc3-imx.o
 obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
 obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
 obj-$(CONFIG_USB_DWC3_RTK)		+= dwc3-rtk.o
diff --git a/drivers/usb/dwc3/dwc3-imx.c b/drivers/usb/dwc3/dwc3-imx.c
new file mode 100644
index 000000000000..303708f7d79a
--- /dev/null
+++ b/drivers/usb/dwc3/dwc3-imx.c
@@ -0,0 +1,442 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dwc3-imx.c - NXP i.MX Soc USB3 Specific Glue layer
+ *
+ * Copyright 2026 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "core.h"
+#include "glue.h"
+
+/* USB wakeup registers */
+#define USB_WAKEUP_CTRL			0x00
+
+/* Global wakeup interrupt enable, also used to clear interrupt */
+#define USB_WAKEUP_EN			BIT(31)
+/* Wakeup from connect or disconnect, only for superspeed */
+#define USB_WAKEUP_SS_CONN		BIT(5)
+/* 0 select vbus_valid, 1 select sessvld */
+#define USB_WAKEUP_VBUS_SRC_SESS_VAL	BIT(4)
+/* Enable signal for wake up from u3 state */
+#define USB_WAKEUP_U3_EN		BIT(3)
+/* Enable signal for wake up from id change */
+#define USB_WAKEUP_ID_EN		BIT(2)
+/* Enable signal for wake up from vbus change */
+#define	USB_WAKEUP_VBUS_EN		BIT(1)
+/* Enable signal for wake up from dp/dm change */
+#define USB_WAKEUP_DPDM_EN		BIT(0)
+
+#define USB_WAKEUP_EN_MASK		GENMASK(5, 0)
+
+/* USB glue registers */
+#define USB_CTRL0		0x00
+#define USB_CTRL1		0x04
+
+#define USB_CTRL0_PORTPWR_EN	BIT(12) /* 1 - PPC enabled (default) */
+#define USB_CTRL0_USB3_FIXED	BIT(22) /* 1 - USB3 permanent attached */
+#define USB_CTRL0_USB2_FIXED	BIT(23) /* 1 - USB2 permanent attached */
+
+#define USB_CTRL1_OC_POLARITY	BIT(16) /* 0 - HIGH / 1 - LOW */
+#define USB_CTRL1_PWR_POLARITY	BIT(17) /* 0 - HIGH / 1 - LOW */
+
+struct dwc3_imx {
+	struct dwc3	dwc;
+	struct device	*dev;
+	void __iomem	*blkctl_base;
+	void __iomem	*glue_base;
+	struct clk	*hsio_clk;
+	struct clk	*suspend_clk;
+	int		irq;
+	bool		pm_suspended;
+	bool		wakeup_pending;
+	unsigned	permanent_attached:1;
+	unsigned	disable_pwr_ctrl:1;
+	unsigned	overcur_active_low:1;
+	unsigned	power_active_low:1;
+};
+
+#define to_dwc3_imx(d) container_of((d), struct dwc3_imx, dwc)
+
+static void dwc3_imx_get_property(struct dwc3_imx *dwc_imx)
+{
+	struct device	*dev = dwc_imx->dev;
+
+	dwc_imx->permanent_attached =
+		device_property_read_bool(dev, "fsl,permanently-attached");
+	dwc_imx->disable_pwr_ctrl =
+		device_property_read_bool(dev, "fsl,disable-port-power-control");
+	dwc_imx->overcur_active_low =
+		device_property_read_bool(dev, "fsl,over-current-active-low");
+	dwc_imx->power_active_low =
+		device_property_read_bool(dev, "fsl,power-active-low");
+}
+
+static void dwc3_imx_configure_glue(struct dwc3_imx *dwc_imx)
+{
+	u32		value;
+
+	if (!dwc_imx->glue_base)
+		return;
+
+	value = readl(dwc_imx->glue_base + USB_CTRL0);
+
+	if (dwc_imx->permanent_attached)
+		value |= USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED;
+	else
+		value &= ~(USB_CTRL0_USB2_FIXED | USB_CTRL0_USB3_FIXED);
+
+	if (dwc_imx->disable_pwr_ctrl)
+		value &= ~USB_CTRL0_PORTPWR_EN;
+	else
+		value |= USB_CTRL0_PORTPWR_EN;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL0);
+
+	value = readl(dwc_imx->glue_base + USB_CTRL1);
+	if (dwc_imx->overcur_active_low)
+		value |= USB_CTRL1_OC_POLARITY;
+	else
+		value &= ~USB_CTRL1_OC_POLARITY;
+
+	if (dwc_imx->power_active_low)
+		value |= USB_CTRL1_PWR_POLARITY;
+	else
+		value &= ~USB_CTRL1_PWR_POLARITY;
+
+	writel(value, dwc_imx->glue_base + USB_CTRL1);
+}
+
+static void dwc3_imx_wakeup_enable(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+	u32		val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci) {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_DPDM_EN;
+		if (PMSG_IS_AUTO(msg))
+			val |= USB_WAKEUP_SS_CONN | USB_WAKEUP_U3_EN;
+	} else {
+		val |= USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
+		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
+	}
+
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static void dwc3_imx_wakeup_disable(struct dwc3_imx *dwc_imx)
+{
+	u32	val;
+
+	val = readl(dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+	val &= ~(USB_WAKEUP_EN | USB_WAKEUP_EN_MASK);
+	writel(val, dwc_imx->blkctl_base + USB_WAKEUP_CTRL);
+}
+
+static irqreturn_t dwc3_imx_interrupt(int irq, void *data)
+{
+	struct dwc3_imx	*dwc_imx = data;
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	if (!dwc_imx->pm_suspended)
+		return IRQ_HANDLED;
+
+	disable_irq_nosync(dwc_imx->irq);
+	dwc_imx->wakeup_pending = true;
+
+	if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_HOST && dwc->xhci)
+		pm_runtime_resume(&dwc->xhci->dev);
+	else if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+		pm_runtime_get(dwc->dev);
+
+	return IRQ_HANDLED;
+}
+
+static void dwc3_imx_pre_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	if (role == USB_ROLE_HOST)
+		/*
+		 * For xhci host, we need disable dwc core auto
+		 * suspend, because during this auto suspend delay(5s),
+		 * xhci host RUN_STOP is cleared and wakeup is not
+		 * enabled, if device is inserted, xhci host can't
+		 * response the connection.
+		 */
+		pm_runtime_dont_use_autosuspend(dwc->dev);
+	else
+		pm_runtime_use_autosuspend(dwc->dev);
+}
+
+static struct dwc3_glue_ops dwc3_imx_glue_ops = {
+	.pre_set_role = dwc3_imx_pre_set_role,
+};
+
+static const struct property_entry dwc3_imx_properties[] = {
+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+	{},
+};
+
+static const struct software_node dwc3_imx_swnode = {
+	.properties = dwc3_imx_properties,
+};
+
+static int dwc3_imx_probe(struct platform_device *pdev)
+{
+	struct device		*dev = &pdev->dev;
+	struct dwc3_imx		*dwc_imx;
+	struct dwc3		*dwc;
+	struct resource		*res;
+	const char		*irq_name;
+	struct dwc3_probe_data	probe_data = {};
+	int			ret, irq;
+
+	dwc_imx = devm_kzalloc(dev, sizeof(*dwc_imx), GFP_KERNEL);
+	if (!dwc_imx)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, dwc_imx);
+	dwc_imx->dev = dev;
+
+	dwc3_imx_get_property(dwc_imx);
+
+	dwc_imx->blkctl_base = devm_platform_ioremap_resource_byname(pdev, "blkctl");
+	if (IS_ERR(dwc_imx->blkctl_base))
+		return PTR_ERR(dwc_imx->blkctl_base);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "glue");
+	if (!res) {
+		dev_warn(dev, "Base address for glue layer missing\n");
+	} else {
+		dwc_imx->glue_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(dwc_imx->glue_base))
+			return PTR_ERR(dwc_imx->glue_base);
+	}
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
+	if (!res)
+		return dev_err_probe(dev, -ENODEV, "missing core memory resource\n");
+
+	dwc_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
+	if (IS_ERR(dwc_imx->hsio_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->hsio_clk),
+				     "Failed to get hsio clk\n");
+
+	dwc_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
+	if (IS_ERR(dwc_imx->suspend_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc_imx->suspend_clk),
+				     "Failed to get suspend clk\n");
+
+	irq = platform_get_irq_byname(pdev, "wakeup");
+	if (irq < 0)
+		return irq;
+	dwc_imx->irq = irq;
+
+	irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", dev_name(dev));
+	if (!irq_name)
+		return dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+
+	ret = devm_request_threaded_irq(dev, irq, NULL, dwc3_imx_interrupt,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					irq_name, dwc_imx);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to request IRQ #%d\n", irq);
+
+	ret = device_add_software_node(dev, &dwc3_imx_swnode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add software node\n");
+
+	dwc3_imx_configure_glue(dwc_imx);
+
+	dwc = &dwc_imx->dwc;
+	dwc->dev = dev;
+	dwc->glue_ops = &dwc3_imx_glue_ops;
+
+	probe_data.res = res;
+	probe_data.dwc = dwc;
+	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
+	probe_data.properties.needs_full_reinit = true;
+
+	ret = dwc3_core_probe(&probe_data);
+	if (ret) {
+		device_remove_software_node(dev);
+		return ret;
+	}
+
+	device_set_wakeup_capable(dev, true);
+	return 0;
+}
+
+static void dwc3_imx_remove(struct platform_device *pdev)
+{
+	struct device	*dev = &pdev->dev;
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+
+	dwc3_core_remove(dwc);
+	device_remove_software_node(dev);
+}
+
+static void dwc3_imx_suspend(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	if (PMSG_IS_AUTO(msg) || device_may_wakeup(dwc_imx->dev))
+		dwc3_imx_wakeup_enable(dwc_imx, msg);
+
+	enable_irq(dwc_imx->irq);
+	dwc_imx->pm_suspended = true;
+}
+
+static void dwc3_imx_resume(struct dwc3_imx *dwc_imx, pm_message_t msg)
+{
+	struct dwc3	*dwc = &dwc_imx->dwc;
+
+	dwc_imx->pm_suspended = false;
+	if (!dwc_imx->wakeup_pending)
+		disable_irq_nosync(dwc_imx->irq);
+
+	dwc3_imx_wakeup_disable(dwc_imx);
+
+	/* Upon power loss any previous configuration is lost, restore it */
+	dwc3_imx_configure_glue(dwc_imx);
+
+	if (dwc_imx->wakeup_pending) {
+		dwc_imx->wakeup_pending = false;
+		if (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE)
+			pm_runtime_put_autosuspend(dwc->dev);
+		else
+			/*
+			 * Add wait for xhci switch from suspend
+			 * clock to normal clock to detect connection.
+			 */
+			usleep_range(9000, 10000);
+	}
+}
+
+static int dwc3_imx_runtime_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	ret = dwc3_runtime_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_AUTO_SUSPEND);
+	return 0;
+}
+
+static int dwc3_imx_runtime_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx	*dwc_imx = to_dwc3_imx(dwc);
+
+	dwc3_imx_resume(dwc_imx, PMSG_AUTO_RESUME);
+	return dwc3_runtime_resume(dwc);
+}
+
+static int dwc3_imx_runtime_idle(struct device *dev)
+{
+	return dwc3_runtime_idle(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_pm_suspend(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	ret = dwc3_pm_suspend(dwc);
+	if (ret)
+		return ret;
+
+	dwc3_imx_suspend(dwc_imx, PMSG_SUSPEND);
+
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(dwc_imx->irq);
+		device_set_out_band_wakeup(dev);
+	} else {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+	}
+
+	clk_disable_unprepare(dwc_imx->hsio_clk);
+
+	return 0;
+}
+
+static int dwc3_imx_pm_resume(struct device *dev)
+{
+	struct dwc3	*dwc = dev_get_drvdata(dev);
+	struct dwc3_imx *dwc_imx = to_dwc3_imx(dwc);
+	int		ret;
+
+	if (device_may_wakeup(dwc_imx->dev)) {
+		disable_irq_wake(dwc_imx->irq);
+	} else {
+		ret = clk_prepare_enable(dwc_imx->suspend_clk);
+		if (ret)
+			return ret;
+	}
+
+	ret = clk_prepare_enable(dwc_imx->hsio_clk);
+	if (ret) {
+		clk_disable_unprepare(dwc_imx->suspend_clk);
+		return ret;
+	}
+
+	dwc3_imx_resume(dwc_imx, PMSG_RESUME);
+
+	ret = dwc3_pm_resume(dwc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void dwc3_imx_complete(struct device *dev)
+{
+	dwc3_pm_complete(dev_get_drvdata(dev));
+}
+
+static int dwc3_imx_prepare(struct device *dev)
+{
+	return dwc3_pm_prepare(dev_get_drvdata(dev));
+}
+
+static const struct dev_pm_ops dwc3_imx_dev_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(dwc3_imx_pm_suspend, dwc3_imx_pm_resume)
+	RUNTIME_PM_OPS(dwc3_imx_runtime_suspend, dwc3_imx_runtime_resume,
+		       dwc3_imx_runtime_idle)
+	.complete = pm_sleep_ptr(dwc3_imx_complete),
+	.prepare = pm_sleep_ptr(dwc3_imx_prepare),
+};
+
+static const struct of_device_id dwc3_imx_of_match[] = {
+	{ .compatible = "nxp,imx8mp-dwc3", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, dwc3_imx_of_match);
+
+static struct platform_driver dwc3_imx_driver = {
+	.probe		= dwc3_imx_probe,
+	.remove		= dwc3_imx_remove,
+	.driver		= {
+		.name	= "imx-dwc3",
+		.pm	= pm_ptr(&dwc3_imx_dev_pm_ops),
+		.of_match_table	= dwc3_imx_of_match,
+	},
+};
+
+module_platform_driver(dwc3_imx_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("DesignWare USB3 i.MX Glue Layer");
diff --git a/drivers/usb/dwc3/glue.h b/drivers/usb/dwc3/glue.h
index 3dabb77d8acf..d738e1739ae0 100644
--- a/drivers/usb/dwc3/glue.h
+++ b/drivers/usb/dwc3/glue.h
@@ -13,7 +13,7 @@
  * dwc3_properties: DWC3 core properties
  * @gsbuscfg0_reqinfo: Value to be programmed in the GSBUSCFG0.REQINFO field
  * @needs_full_reinit: indicate the controller may not remain power during system
- *		       pm and need full initialization
+ *			pm and need full initialization
  */
 struct dwc3_properties {
 	u32 gsbuscfg0_reqinfo;

-- 
2.34.1


