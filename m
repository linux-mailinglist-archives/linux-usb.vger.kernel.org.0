Return-Path: <linux-usb+bounces-34851-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JmfGRvQt2n0VgEAu9opvQ
	(envelope-from <linux-usb+bounces-34851-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:40:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA372972B4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:40:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D930301A522
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 09:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32DC38BF96;
	Mon, 16 Mar 2026 09:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j3ZPrGnU"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012009.outbound.protection.outlook.com [52.101.66.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28B738A711;
	Mon, 16 Mar 2026 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654020; cv=fail; b=b8rFwIxdpPgYDXsacQ6VxeRbCDHYelKru4j1GmpjahIRz+Pqjtn9pEDyBzRFE33ucMbIWVG18591HDRiGxh/BAnq3OEd5zLkgL6UlcJIuBvvHfebcfTSfqLtENNceW6IFxpibqW2jELDawo9rBYFZolY1Xf8EhGI0Mz7oLRlKx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654020; c=relaxed/simple;
	bh=MmL+Ni76Myp+/0UetYi7U6AY5EwzyYU0bZsdDwj+HOE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RMWMPq12XgS5XomksqOUCqGMnS9MSaTbNM4HkeiGVD+EdW+uSeEJZf5iinzPljyGrO77CrcmKANRePdDfDfVo7ILJEodaAD4FB5QxHgD2WesUo5ShJ/e07tvvQ/ZC+gEwg8KyFSIEczHirKFJvlH+oXxX6LX40BrnL5vwcwDkR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j3ZPrGnU; arc=fail smtp.client-ip=52.101.66.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIuglMrUU2BDrSe0HHR4WNR7P9HOiQqVPR4dRWtzXg5WWZ9yIkmu34E3thmqHriFrqlSG9nW9L8zFFFb1moOSiqCSZS0EW1l55dKWkasTJtSyL579nrR2ii1IwQuU+tLsFsR2FQ5k22Z8sKP82qQF1tj3tWEOC0Pd6KBiRKPUv/orF87esWVYMAPxbK8R9V6jERpAj9ZhxD8eKZ+dm/98uIF2bof8x+I4cZ8Qpvg6ra6PaJkKLtB0eO65RCUkvRbuYty68nRjaGrcs1BV2xsXYfegKfBDiBweglX9COKUxCvmiiYCxruRWt89L/0G5bj7hwlHNkgtFvx9il+3GQ6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qucpg2ERjnftgLnGlVMwf5s0Djso/EycBBowcuerJA0=;
 b=bpo9AdySZ1vR5NO0pCh3HMWK4td6aCaYjr9P+BomNx+SGZ9ACN3U8Aqik44YRPT8+CePc5MZiIo15bVsFvpvNZqfK4ZVz26CSg9QJUkaDVyqiM5zhB7iPPMeUhhQA2sQUCpWVAqzSUlEHXIaDKbizHmcoJP3UXfIkHTPO19a50XbxvIxC8m589IAEAAKkKphnAlum0zeQ6urJpv3k+HbG/GeA4e2+xiXTlokTJ6b/loKksF7+jZo8ymNHTrid4vXiJA/OtsX4gBJLhlvEYs3fJEgaWSNk6jNynD+0Th8mer9gOGjmrBaQIxXe0oB4PJ3u3KLYhJRjJzChrHIpY5HmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qucpg2ERjnftgLnGlVMwf5s0Djso/EycBBowcuerJA0=;
 b=j3ZPrGnUjAPSijfMQtAeuhe1K4/2fXPZAgjhB8NYSY+4YbP8y3ticc6qReDbZoahBVHsTt2NY1ZjDt4kyG1GDVDHcticJQ8J4qNiJPdi66P5DUZL489nrGYT2nPiTDKwYDyeFcMfih+h2J+UgwNWCtJfl+E9ZiRTQSoNZLbPhvKdfpuyzLXWfSy2y6vWUAqfa4RFC8jytYPnwxvtvZRwETOX/B0lGvs4K/bjkpbmcAxiS7+QUcky3yZk00fT1mIb6b9D4oIQfqJ/P5+M10EYomRoVe1q7DImTC10ie1cA9TBws21fbvOpC62xTaMcPaCr7kjinwCwtEVIfpI0FjcOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AM9PR04MB8131.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 09:40:16 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:40:03 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Mon, 16 Mar 2026 17:41:55 +0800
Subject: [PATCH v3 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpios property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-support-setting-orientation-use-gpio-v3-1-0e6622b00dd9@nxp.com>
References: <20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com>
In-Reply-To: <20260316-support-setting-orientation-use-gpio-v3-0-0e6622b00dd9@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773654143; l=1423;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=MmL+Ni76Myp+/0UetYi7U6AY5EwzyYU0bZsdDwj+HOE=;
 b=uvFjfRNFsyie/65dfYFFL16wTTwQY6Suxh/jQE5N973qOR8rPcis8WnB9p1BbS5ygZwXR3Tep
 40Lz+h87IxvDuuHAjOBu6Uk6fyP17ovPdJItLxCcvwWzPMrEDTvIlXM
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SI2PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:195::15) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AM9PR04MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: fb8a4b48-2cd5-4cfc-7815-08de833fffa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lkdDBBZTm6LPSFEBSlxXQTxqjDxQ102YuKSvntCq1LE8o0Efj2DpF5CL8AqJx6jKOkEx4TPRCAtLulm+kFX5wLU7qODChztwnoNDUY4nL7+RAw/HUdrnvByIvJDKG3AYITIEWyu4GE6zWlDj48BZvJg4rNOzZq6wd6hf9S7azzpgOS/ynlo+4KzKFJKKqZdX1nPOZmzCLCIheqPdy9yFr8EwCuVcVX651ZVIIxDidLRzPfIKMdhHWHwfoEAGm0mOoADIQFCytV0zHbvHZvBbXJVf6jAAobMgiL7027V98sxwELSdTDjVlTfZxfxC/reCdJ4Efo0adv58GhotN0tdqb9mcBmZHSmFOWc6UK4AdmmB6gFX+7kPUqoSg48oCRvjT6LsENAlQj5HBaBXJ8rSlfHw/LaVkAfXGKY7j6xEQoCQpeGQUQ6tlbTmEhExgMz7oDjizk8hUp/2Nb0pw4lRcDTy2nu32tAOgQfzC27MQ5syZ9bfA77rinjfr12MQrLoYTe8pCvHRwXKzkp1KyzFD/OPhx4f8Mmmhw5gIZGhcfvO4HPW3LYnsm7EqE/yaztpKwohfLHoyk3hQxy7/z137afh4rbpCeoCgMyEZXbUbw+1SpRrSlwDzXyIbmoSq4NkJM6I6BFsj8sbr3OZ9SIzPQQ5QxTud8S3AprVAPV9PmZz5JExVuu9/PlNmI/AveOmDKDNRu2dgGMoKpVZNb87UEdUp0Rrrt+tKqPWSn2PPf8EmCWp//Kum7gnWrXcXN3tUQeAhcqLwMApV5nmqenPTU0iruXTDPH+qm/9xWIbhe4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkNnNFNTTXB4UE0yWTJ1OXhucVVsV1B2NExGK1MyS3VqMDR6RTRaN0gvcDFi?=
 =?utf-8?B?dVZqY1MwVGNhTVlYVTB0RVVjOTRJQTRSVU1KNTJaSjRBb1d0RWE0U25va00z?=
 =?utf-8?B?SXVKdGlYa2w3MC9JclZwaTFWUU1zc0ZHQnVDeTN3cjBBQ0lOUkVnMTZuZ1M3?=
 =?utf-8?B?Y0JmRWRhb01kTkVNV0RMQkxWT1ZPRW5hN3RkWm01VWZqVGVUMzNlY1BaUUpo?=
 =?utf-8?B?QUlaTnR5Um9rWXZSUmdyT0dDcjM3V2ZHdy8wbE9WQ1phQ1JzNGo5S000T1dY?=
 =?utf-8?B?MGpTdkZUdlpNRWxWZnVrc3UzVzhLR3ZqVUpZTHdCRmE4bVhYME9BMFVNWjZC?=
 =?utf-8?B?OExFNFA0VGJqVmNUNWJ3STNaWUFQd05BZ0MxRUYzU2U3RzBEUUFRWXc4c0ow?=
 =?utf-8?B?ekZDMm0xZFFvdWpGT2tiYWpOTTFIa1BWa1Y4YkhRMmthT1NwblBQeU5ZVXht?=
 =?utf-8?B?aVRmek1lUEhOVG9QdzNZSjIrTktUdjNiZVBxS0dtMjN4VTlkeU5HcHJDQWVR?=
 =?utf-8?B?cFBMM2R3bE1TZFlucTgvcW9NZWFZRExPN1RJaGk0OFROTGdWMkJTNjB1bU5S?=
 =?utf-8?B?VmVKeTVzTDllbzdiNW5udGpNanhuRkkrS3owNTZ2Q2lScmd3MGFUMGhjMHdI?=
 =?utf-8?B?RHpMU1ptK3F0TUd6MW93bUFpMGc2Y0ZPQmdLMUpPVHAyRHc1NFgwekFQUVpX?=
 =?utf-8?B?YTFWejBtalgxNnB4eWZLbURCK2NCV0VZcHZvUzVaTzFRczhUSjlidmszeEJh?=
 =?utf-8?B?eExoM1Qxc0NzMjVJTzJBbUVSTXZ6Nm5YQWRJVkNoY2pOQVNBK2ZDclRHNlRN?=
 =?utf-8?B?eEpiRERlVE9DcmprYkdUaTFjOFBKZnFub3lYbHVrWDZKdkRzZ05RWUZKa21x?=
 =?utf-8?B?V0phUldidEtXRU5yQ3FlZGpLY1FRVE16SEpnYTVicXZjSTJLOTRBMHliMUdj?=
 =?utf-8?B?bElvazJ0b3oya2dYd0VNYTYyeGJObGxzNDMwVWM0U2Z3TEtYQk95K1d3ak5W?=
 =?utf-8?B?cS9UTGppbVY3ZlBvc2FSM2xkLzVyZHljcmNBeEk1RW02cE9JWDExNXBUQUNy?=
 =?utf-8?B?RXJGQXdxd0NqVk96dWNjeEZ2Y2xhWjFBRlJPTUZ0cUpHeVJJQXlPazVaWGl6?=
 =?utf-8?B?WFAyUjRFdDZCK3VzTDNZRDErUHVteGJVL3FaeDVOVUYvOXpqekNKRkMzOGJh?=
 =?utf-8?B?V0dzTTBUUi9HbFF4RzVVaXRtSEhodTJaL0JSSCsrbzhOei9hNmNSVmtlekRI?=
 =?utf-8?B?RWNOb05lUVZwNjJTU3RNZGJDVFRrRloweGdBZm84dlFoQktWano5dmpZTWJ1?=
 =?utf-8?B?dXNSUUwvN1ZsSTVLZEpQR0lpT00xR1l3ZEVhMzBpUW5ZeklOZHlUMUtQb29l?=
 =?utf-8?B?UExHcU1NMWxpbWdYdnVYT2VVdHFqWU5FdDRDR1FqNE5lMEdIMGxiU0tIUWdy?=
 =?utf-8?B?NS9XU3lKS0hTNWVWSVVFbCtMbTY1cWZvZCtqNTlzSGJuOTJVNW5HRnJHZHpF?=
 =?utf-8?B?ZzZoTndZK2lLMVZjZ2RrSElqREM5ajBnUzlsZzJsenlEL3VzZFc1UDBpL2Q5?=
 =?utf-8?B?WFMwTnVhVWpGSDZsRUQ2ZFVJZHN4WitJSFVhSHdhbXp4Zmh0NDA1V2pSSU5y?=
 =?utf-8?B?OHYyQ1o0NjB6RVdlSklqWmhpcFhBVUY3MFJJdTgvQU42Z1lya29uejVKU3A0?=
 =?utf-8?B?VnNHbGhsY0xabTNZeW1RNktTSmdvMXEvNkF4ZEx5a3VXcm5tTjhhTFdVcUg5?=
 =?utf-8?B?VWNkQnlBeFJmVGFVdUo0MFJBc2MvcmlDekhRM0hEU0pKWHRMUklPaWVxR0RC?=
 =?utf-8?B?UHBWUHBhSUxJbzZLZXBzSTk4eVo3a1ZGL1owb1FsdSthU2t5eXJQeEQxTGtO?=
 =?utf-8?B?NFNyb1BEQlRkWGpObjdiYnpEd3VlTVlURWFHQUJBcEgrMVBWcHZoTkRRdnZs?=
 =?utf-8?B?V3J0NjBGRXRzcktyUkQzQXdOWkNnb0Z2cVFmQnVjZitMQ29MM2twRlltUlRZ?=
 =?utf-8?B?dk43d3RjWjZzZU13UktKd3BIMWJ4M0lGb3JvS1M5eWZxcnpVcmFrckgzeUxY?=
 =?utf-8?B?UVE1K21MYzQ1RTNNUEZWN2RoRUVRQzZMSnFEanpMMFBGSThqbjhVQkNSeTkv?=
 =?utf-8?B?UERtSW5XN0V4TGpORmZjYzhmREFJQXJJVkpoMzJ4K2xGZm1VekV6SkxkQW1G?=
 =?utf-8?B?SHZGSUhMNWV2aHVLYWlFYVBISGVQNmt3cGNYSGlvODAwRTdKeHNHRHE0SEFB?=
 =?utf-8?B?b2orUGZmOEpvTGhWMWpnWDB3M1ZDWTNCcXBYWDVRRTI0a1ladGZIM2pzWTBI?=
 =?utf-8?B?clM1bURuT0FSQUk3Qy80cDFCbFA0dWVZcU1EN0Q3akZhMUhPV1lJUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8a4b48-2cd5-4cfc-7815-08de833fffa7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:40:02.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZDDqwhpeQMBRt1YKW2HlrF9D+/joZItQ9UdXSBJZqyIBe/0CSjH4RJT30yVxDWwHUIZ1LZJjF073uIfIeEiIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8131
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-34851-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Queue-Id: 1CA372972B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Type-C chip know the cable orientation and then normally will set the
switch channel to correctly configure the data path. Some chips itself
support to output the control signal by indicating the capability in
bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
CONFIG_STANDARD_OUTPUT register. For PTN5110 which doesn't present this
capability currently there is no way to achieve the orientation setting.
Add an optional "orientation-gpios" property to achieve the same purpose.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
Changes in v3:
 - add Rob's ack tag
Changes in v2:
 - use property name "orientation-gpios"
 - remove the "if" condition and modify commit message
---
 Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 65a8632b4d9e..581e5916eadd 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -26,6 +26,10 @@ properties:
     $ref: /schemas/connector/usb-connector.yaml#
     unevaluatedProperties: false
 
+  orientation-gpios:
+    maxItems: 1
+    description: Optional orientation select control
+
 required:
   - compatible
   - reg

-- 
2.34.1


