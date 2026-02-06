Return-Path: <linux-usb+bounces-33133-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SE30Ah/AhWnEFwQAu9opvQ
	(envelope-from <linux-usb+bounces-33133-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:19:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AFCFC95A
	for <lists+linux-usb@lfdr.de>; Fri, 06 Feb 2026 11:19:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A300D30715FF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Feb 2026 10:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D448936E494;
	Fri,  6 Feb 2026 10:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D8k+IMcm"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FB72FB085;
	Fri,  6 Feb 2026 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770373043; cv=fail; b=bmImT/260h6vGzJ0eehuYFicmpwF3Xy5WOsZWQNxQ873eKo4lM3K5JBei1vCmNzNTbBuHAAhurHjshSI0YM5/ErgIrb023fzASjeDjzegQg75mBrEMU7vZqXHDmqvG22+aSJyH4XeU9AK/o9CY9j2yj88pAE83l1Ty/NEylOAbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770373043; c=relaxed/simple;
	bh=Z+MJcc/fMGgrtMNbFvJsgjyDW3GRftktNNIZCBwM5HM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Qd+N1Z6kT4rF1xwrV1ok1xKy4F5jhaiWx7i+n2tXSDSp5hE8BwPEFF417alub9AVeLAzWXRCYnkFD7QC6OuxztyUQZwgBXVmajeRGSx4mKbQBAZj4kkqNBDZEy6Kp5u1/QjhsF65N9iTbtb0+gyR0UxC+ua5qVzEsd7mS9YNm3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D8k+IMcm; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQuNSXWqTC+xmnSPF7iRt45iUp7VD/Vh8vpHYdxBax5ELsF8oPxUjqXgRPlq+jpASYH1pA2vuKZbrUz5lha6iM1rJttIYSJLV8wuF6ZGlpHTGefOCNHO3a9anD7Bxyb0QTgxE9xtN1P1Gn7clt9lp2F4X6a3QQ/AEux4Vo+QOED1RA8BwBF4PvYahYrG1s7eb2srho/fQZLLG6HrJ9wG2/RdGMayIfIjj2hAgobtu5gh22KOuapivdD/VJPnuSqbNaTZOixTcBeNLtEyCuS8zsT1QRs+48/Zd9ZGAzLALk+fWddMIy1HynkA5dgQuU+wZtBVvvcIclPKL2Hxh44BLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2b+vgeL6G0TcGcouXUpAbYj2gBw4J4Vz98xGNa6fso=;
 b=nEPTSx6YPWPnxEPN1TKVPD3URlIsi1nqNOnYx1Bmh0W5xT2huCqQXZ7tZ4jxlZ+ylexSgFYaHj7miQ0K1uBHZC8lLJjjbGgPcp2rpIL8v8w/tr2abtPTsqEiQCa0jkASTh0TDjNm3RluYfj9UEjVZ7LFnpatQrnlc9XIG7MaDn2mXxsR3xD02DcjG+ZbG2odz0bKYc5K2mXzawh/T1INoojpLAudZneVSw3QOlHhaJ+jaGO1g2e733995wKKk/mhzSJtWOUaqN7vTwzeB4aZM0jfVibIh4jrfsNufyj14+a06ipkC4GlwUXMr7/F/c7h7FbXuYH4/TWYGbzy1kzPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2b+vgeL6G0TcGcouXUpAbYj2gBw4J4Vz98xGNa6fso=;
 b=D8k+IMcm8t/ICWwnFlR54a+fOLk4VKxuQYi4EEmfeH4QNvPLVy0KMaqPsuyGJSd2kxrZwWBLBZr2biz6tE44FXDIixQ+dg9xashwfD8VDLPTraw6nFVelC/SAoB+0E4vYLsuyO0NP5v7Dgb1pDo1WVONNE2bHvAl+LM1CcVVVOwKkjNO2/Y8NDOMS4yL+aow6/1JpthLjkGwkrhBlZK5kX3iomstoHtOZgJ48F2pNitssX1mOKphoMXh2pCn+xrkv9g9fAUO9WiUvqkpbxaXP/GMrgidsiGToDnOvOt5vmIZYqDuVq6S983tvsL9gfCJ+zlzgAXrmU7jdfzyW2nBnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AS1PR04MB9477.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 10:17:16 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 10:17:16 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Subject: [PATCH v3 0/3] add DWC3 i.MX driver based on flatten devicetree
Date: Fri, 06 Feb 2026 18:18:48 +0800
Message-Id: <20260206-add-flatten-dts-based-dwc3-imx-driver-v3-0-ebd9b9b77049@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAjAhWkC/5XNTQ7CIBCG4as0rB0DFGpx5T2MCwpTS2J/AgRrm
 t5d2o0udTPJO4vnW0hA7zCQc7EQj8kFNw45ykNBTKeHO4KzuQmnvKL5gLYW2oeOEQewMUCjA1q
 wT1OC62ew3iX0oCoUWuhWyRMl2Zo8tm7ed6633J0LcfSvfTax7fvvQmJAwQihJSqmyppehnk6m
 rEnm5/4tyl+NXk2LTeqkVrWhrKPua7rG21nN04sAQAA
X-Change-ID: 20260202-add-flatten-dts-based-dwc3-imx-driver-96e4a4af9570
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770373141; l=2225;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=Z+MJcc/fMGgrtMNbFvJsgjyDW3GRftktNNIZCBwM5HM=;
 b=6TCv6dsKvwn4u0uOLO2oQCZh/fzRypZ7md1fmnkabW9jE8CCfUeC2cRkv1Czmlr/q73gN8duk
 OTijgm43G2hDMzRMyGnFXA/RrJKeaU1ZE9SPnnvsqSsKHbOY3elVY9b
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:3:17::23) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AS1PR04MB9477:EE_
X-MS-Office365-Filtering-Correlation-Id: d9ab3c49-e0e0-4b72-5889-08de6568e708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWFyczJPUDZPRDBUSzNLblg2cThRVlgxREdmSmZKaXlDUkhqRUxlZFF6YkpB?=
 =?utf-8?B?NUd0TmpiTWVwYURKNDhJUXNOZUZzWUZGcS80T0FTL2M3RkVXeXcvVEZrSWNN?=
 =?utf-8?B?TXNBaHoyMTRMb3pvSVlSMjF1TllsbzRuTHJ4Zm1jR2lJazJCL2sxb2FzbVly?=
 =?utf-8?B?ZC9vQnhyZDNXYm56a2VJZUI4YklWYlNPVndCL2pUSXVhWWtPV0JkK2VyZTFr?=
 =?utf-8?B?N0FaWVluNElPdG5nbmhzUE1scnF0U0NFZ21zdWdUdzV0WlFEdmRYZ2hUU1NN?=
 =?utf-8?B?UzhhaDNMc1NqY2dtVFEyNjJtcUUyQkxxMWEraWR0SWp1U2ovQWNxb0c1Z3VN?=
 =?utf-8?B?bGFEQ3k4L1JJL3NuY2JuWGNrS0s1NWZQZWdTcjZxT1dqWkF3ZnErQ2o2S3Ry?=
 =?utf-8?B?L2QrVlFiU0c3c0MxTmFyS3Jxc25yeno5M3J2dHc4U0dIT3VkdkNTaEhCZUNL?=
 =?utf-8?B?eHdaYXBURWFQUDFLOFF4RHBmL25ZbXJXQjBmOUJYQWRQMld2Zys3dmRSb3py?=
 =?utf-8?B?cnZXb1V1TVZSNUEyaGVvVHZxZWI4SkFnVm9xaFN3TjVLeFlFWWRESVhBb1FX?=
 =?utf-8?B?TEhPVURYQU5RR1lJeDdyMXNOcWlKTG5wa0wwNHFpekRIVmw5bldkQnJFVlFW?=
 =?utf-8?B?WlU0disyQU9XQTBpaEJwcFJEVFh0VWxjNDM3K251ekE3alhad0dPWjV5djdC?=
 =?utf-8?B?YTVHdHk5cFdzYWJkWndWVFAyU3E4QnVDR2tPc0tPVURob3UvR1BPWUcxdUx3?=
 =?utf-8?B?eUlGRmllL0ExSFJ2YWJTaU5tWEpnWnc2b213U2xmaXowbENrYmtvSERyQW9V?=
 =?utf-8?B?bVBHaURNNjRtQ2xVVDM4ZVlleEpGSDU5LytOd2dxcFhTUjU1cGVmdzFlMysr?=
 =?utf-8?B?WTJNTTBQOXE2WmFvQUFQNGtzU0JwOGpETlB4TDdybG1tZWtLSWVWUE4rNVRE?=
 =?utf-8?B?M2hLMUZKSVlBbjluUTE5ZmhFQXVnQTVhR3FseTNpT0lpdkNCSjhWQTdqalVO?=
 =?utf-8?B?WGZBMHB4VWlrWlhsTkY4TlFQS2JaemtiNzRnVUd4YzBmNjByVGJFZWx5b1oy?=
 =?utf-8?B?cnNobDcwZUk4U3l6dmxBUWhYTlR3cGhlcnhlR0NUWWhuRVVZT2hIQSsrcFFs?=
 =?utf-8?B?SVE4eVoyWGRLcDJ6bERLai9qcURuK2V2L2dSUC8vK2tzc2x5ZytxVTJCekhR?=
 =?utf-8?B?aXI4UlVhM3BiZEJIVDZmOTFyM0Q5elU0Z2llcXk0Ny9NSmJKR2lwT0dXOERF?=
 =?utf-8?B?N09sWFBOSS8yWXBDZEJQVHc2Z0d1bllQdmRua2wrenR0REFCZlZ1TUcyamo3?=
 =?utf-8?B?azRXbHRJNHA4VDVDOVh3UHdZenRGNy9HUGJMWXpoU1ozUThLcEhaSStDL1ZX?=
 =?utf-8?B?YmVOaFoxd2svYXpGM0tGQlYxaWo5VVVDT3dXK1Q4M3dMcEU4OGN5dXpodGJY?=
 =?utf-8?B?V2RlL2tJd1RBUDdTcTFUeStvVjVnVkEzeWg3OGprZXlhbGUweVlSYy9VUTlS?=
 =?utf-8?B?bklweEJiQWRoSEt1Mzk1MEx1NlhLeGFIa3dPUUR4VmZTQW1ybXU5U3ZSQVBG?=
 =?utf-8?B?dDB0c2Q0LzFXMzliOEZRNGs2VWVhcDhudkozaW5OYVFOV01YU2NVR2xwUFFD?=
 =?utf-8?B?eDJQQWVtOHlLQ2tzY1prUnN3azM4R2Rpa0FpbTM3VE5mVmZsY0dqYTlIVDQw?=
 =?utf-8?B?MHZ5Uk9yUm9iRkpvQXV6L2dpWU1MN29BRXdVREFIU29BWi9VZFZGTWRlZDFP?=
 =?utf-8?B?emRjbXhwKzhTUzR3QXJxY2ljaDRwaDdtWDFUVytFdUxra25IMzA3YjBpN2Ny?=
 =?utf-8?B?dGJxVFBoSlR4RElFY3JOM0JIWHo1WndwbjNlYjEyZFEvZERmWGFOc3JzeTE4?=
 =?utf-8?B?WmhOQkZwR0xUZzFEQnAxYnNnNlRIS3krL1JacXZRR0NDbWVacnZrS3RMRHVj?=
 =?utf-8?B?ZThhbkFjVXlXSUZhOGk2ckZuaHVpSi9OYWhvVk1JY3NHT1I1L3hrMis0TDRq?=
 =?utf-8?B?MGw2ZzhCQWxJcmx3Q29jU0RGdmRaODJRN01sdU9mbkxCeWR6QWpBS1NSS1la?=
 =?utf-8?B?STlCQjVVRDdkeEh6TkVzTExLK0V6cm9INDljQWZqcTNLQ1E5Qm5VVzZ2RlVt?=
 =?utf-8?B?bGUvTVV3MGRZN3Z1dEp1WmpvOHNCTVNQNHk5R2o3cy9WeW5lSXNkU29IeXpn?=
 =?utf-8?Q?YqKiRgvl62kznGctdVBc9yxtj8/bs41mahCAbLqzhM1n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVVIbDNFOGxLWlBZNitJdVlxeHhNdUpzZjUvUVNpaGxPaVJNODdFSXdXc3Ry?=
 =?utf-8?B?SFIwT21aR1E5U3hjcWZLZDVuTzBBcXVNdytjbTVmQnY5ZmN5M2pZemtxWGVi?=
 =?utf-8?B?OVNWOURIbzdGbTRMWHZ3aDd6M3ZIY0hSTkdtdDlSSWcvK2NXMHZucXZ5K0Ez?=
 =?utf-8?B?enoyS3piREp3RTNNNWliSWtlUHQxVU5OblZUbkM5ZDFXOGFmNnBaY0FnQVpm?=
 =?utf-8?B?YzVmcllyMnhEVllQTnh4cFF2eFVVdGZ0cUtZRFdRcFNOTUxEamh5dXUyWExP?=
 =?utf-8?B?aURrMmQwQTF5bU9EZ3orQTREekNlQ0tiV1gwVThOeDBQKzdrYUo1bFh2ckQw?=
 =?utf-8?B?SW1EVmpVeDIwekY5L2VCZVFudTBaK3VXNCt2amFnSW9wS3cxejRCd1RsN0Rs?=
 =?utf-8?B?R0FFTTNsMHMxV2pmVWI0b2ZTdTVJN0diZXZNVGdaYnBrT01QdklvcVBQUi9F?=
 =?utf-8?B?aU5EdFd2SVhYQmJyVjVsV0swS0w4UzFMRUI0Zkp0eit3Z0dhSnRlMzNjejB6?=
 =?utf-8?B?b0diSHd0dWtVQnZWN0h5OHR2a2U4eldhTlR0RlMwVmcwRGo4TVhCcjZhR1Fo?=
 =?utf-8?B?SFZ4KzBuYUhEOWo5dnBUNlhNSjJMckhKQWlCc2ZQK2tRVEJPVGhsTDk0cjV6?=
 =?utf-8?B?Q1RZSzVMa3lqR1lEaDNhSWFZYURNem5lL3Rnbkc3TU9Ub25tQUcwUTdUaGdH?=
 =?utf-8?B?WFdnRG5BaUZxOVJxYVVMSUx6cm1zeCtSYWN5RllQWEo3WGM3bTNaRTQ1RGN4?=
 =?utf-8?B?WVJhQ1FXWXFRL1p6UjlWYU9CVlFtTXkydXBxY1l1YTZNd3E2ZmZ0T0JSbXQr?=
 =?utf-8?B?R3hiRS81SHZsd0szTlcyQVBPc3ZPOHpUdHhPOC9jd3NaRTBnY1B1UnpBY0l6?=
 =?utf-8?B?bDAzSDAxT2FiVnlrbHdxWVJZdWJjdGppM0pkb1FNTldhSG1vSnJFMnBLMzRU?=
 =?utf-8?B?ZDFSV0hkVUJyUjBmTzQwcEZwTHM3ekg3SVRlaU5qMmVIMWlJckdaeFkrdm9C?=
 =?utf-8?B?Wm0wRVlGSTFmdy9Db2xBeDcvVkdGdUx0NTVSR3FUSHZ0cWZxMG83OUdtTWlv?=
 =?utf-8?B?VWVQRU8rSWxLeHRxdXJnSjRtUXM2ekM3ZzlVR05CRjQ3RjRKY2dQU2ZtYlE2?=
 =?utf-8?B?Qk5tKzhzaks2a0lqUWdDOXEyR0IzUXk5OTBZNC9MYlYrcnp2RkFXa2tZd0x1?=
 =?utf-8?B?WnJIcnVpY21aNXQ2UmUzSlFzK1J5MXZMWGM0VjJhV0NUcWEvR2JaTjFtdFF2?=
 =?utf-8?B?ZHlWL2dKcnl5bTQ5cFpMZXBNUG5pSjJEUVhOdnB0eXBKVjB6L0gxWUYrNS9N?=
 =?utf-8?B?bmJ5blY3TGtXR1I3clVscjQzSFhoYWRGa0FQbjgwVUc3WWViR016OFdWYkxM?=
 =?utf-8?B?UXhIcTk1cDYrU0l3WVc3SW9JTlEzQmY4bndsRlpsekprY1BIUUpZSVJqbExq?=
 =?utf-8?B?bkg0TUx4T2wvYmZxbWlxbWpMd3RYclExS0tEK2h0by9IM0VtMDNPcU5pOEJR?=
 =?utf-8?B?bkZkRDZTWWRxZXhGNHBaUTFXK3RXVk1uZVVPYzBqVTRhaGR3dXJyRUhuZ1hZ?=
 =?utf-8?B?MEt2ZjlobzYxcWN4R3RucElTOEhOeUw4UWM0Nko5MUtJN1VoZEcyWm5CS3pP?=
 =?utf-8?B?Y1dmejdyMXBLRDdGdkwweEYxUmp6RmVDSTlDTG0wMk93aitDeW5Ed1lid0pP?=
 =?utf-8?B?OGtlV2RnT0YzWExWbUk4bWh6Ty9yazJrSDUzdmJoT2xCWXptcnBIM0dDNnJW?=
 =?utf-8?B?bmpxUzZBNGVOQ2xGaW1ES3A2cmVVZXprSDhWd2Izb0RTTmNxRjF1OGc0SWJs?=
 =?utf-8?B?UlBZR1ZUSHE3S3NFZXVXdUcvdS9aL1JzaVBnNTU1VFE0OXVQZ1ArYlVOelFD?=
 =?utf-8?B?ZFZFMmg3Wlc3ODRFWnFlam8xS0xxYnhXR0JrRzFTeWloQi9MS0I5Mi9JSFRY?=
 =?utf-8?B?UzFhQ3JBcXNaLzY4cmt1LytVRFNhQnB4eEFQaWFkcEI1em5PZ3NVMkp1V2sr?=
 =?utf-8?B?RWJJSW1iOTRyMVlyOExQR0pha2ZnM2REZ0NNalV3Q2dnaSs3UjloQUwvSFND?=
 =?utf-8?B?eU9lVUtGMjMwNU1DQ1pIYXV5K0FVNFBSakQ2dTBicW9EZ1Z2YnpRWXFxaVlQ?=
 =?utf-8?B?UkRrdm56WDdKb1pNV3RzZ3QzM3IrdTExWlBFRzduQkx4YnJZQlcrdnVYaHRk?=
 =?utf-8?B?ZlF4Tk5QU3BnT0c2Wk0vU2liZXFrZFVORXVhR2JKcnBWaVUwQzJ6WjRLMFRZ?=
 =?utf-8?B?V212dWdLbUtuSmhNbVRveWpuSGs4Tk1mVm5ZbXIyM1lGQ3hTTWRuRWhhU3Vm?=
 =?utf-8?B?YlpRUnJVMGJtUUZoeE5sbUpnbU0vY2hFZDRTZ29DN3l3dE53dkloUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ab3c49-e0e0-4b72-5889-08de6568e708
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 10:17:16.2061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qaR/9B9BLoznZJeETis3DzzugDULDrBCfwW7rbW6F6uCOaCKkLIfhtkb1T7XAPluza1JGnUjUBYM+RGGPrB1QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9477
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
	TAGGED_FROM(0.00)[bounces-33133-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,i.mx:url]
X-Rspamd-Queue-Id: 69AFCFC95A
X-Rspamd-Action: no action

The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
USB block in a single block will bring more benefits than a parent-
child relation.

Now DWC3 USB common driver already support to do more key jobs in glue
driver, such as power management and core initialization. Now let's
make a step and add a flatten devicetree based driver.

The first one add a new "nxp,imx-dwc3.yaml" binding to describe all i.MX
related USB controller.

Then, to support wakeup capability even when controller experienced
power lost, a fix patch is added to make controller work after system
resume back.

---
Changes in v3:
- rename file name as nxp,imx-dwc3.yaml
- rename compatible as nxp,imx*-dwc3
- remove status property in example node
- modify commit message
- Link to v2: https://lore.kernel.org/r/20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com

Changes in v2:
- reorder compatible property
- rename may_lose_power to needs_full_reinit
- remove Frank review by tag due to some changes
- fix code style in dwc3-imx.c
- disable wakeup irq when register interrupt by default
- remove runtime PM operations in dwc3_imx_remove()
- Link to v1: https://lore.kernel.org/r/20260202-add-flatten-dts-based-dwc3-imx-driver-v1-0-c44a5e919380@nxp.com

---
Xu Yang (3):
      dt-bindings: usb: introduce nxp,imx-dwc3
      usb: dwc3: add needs_full_reinit flag
      usb: dwc3: introduce flatten model driver of i.MX Soc

 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |   2 +
 .../devicetree/bindings/usb/nxp,imx-dwc3.yaml      | 123 ++++++
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |   9 +-
 drivers/usb/dwc3/core.h                            |   3 +
 drivers/usb/dwc3/dwc3-imx.c                        | 429 +++++++++++++++++++++
 drivers/usb/dwc3/glue.h                            |   3 +
 8 files changed, 580 insertions(+), 2 deletions(-)
---
base-commit: 0a06917432a762d6233f88963c0b53e48dbac6b4
change-id: 20260202-add-flatten-dts-based-dwc3-imx-driver-96e4a4af9570

Best regards,
-- 
Xu Yang <xu.yang_2@nxp.com>


