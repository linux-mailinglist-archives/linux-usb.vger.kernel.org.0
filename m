Return-Path: <linux-usb+bounces-32038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC2D01C97
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 10:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB73132CACC8
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 08:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD30036167B;
	Thu,  8 Jan 2026 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iwUReWHv"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849836164E;
	Thu,  8 Jan 2026 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767858126; cv=fail; b=jvrchoafbVYXEigG+yEIKFnO0EEGOXyITP6jn/AEfQ5La/JVm01qMwna3S8uiup2K5sB0eZ+zG4rt8tSNWxhEMwNZ1lcpCD7v3OtHOBFnzRUpNPLFufSAMGxIAVSjzpur2zESmoc5SLshR6GOJ9NCjgKAkQJzUlVEnupoKtzp/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767858126; c=relaxed/simple;
	bh=fAF2UM4sJbKeCF4F0zL00kVG7FR9E40n7lre4EImxo8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i/yfzzL9JMEpUxLpJ7jgpfUDXZpX1QOWcCZ0ojKErTMMuIV0/mIfAi8LaiDlIbHL/MY1nw/DCz2Wclol0pJ4eHh85FVT/0xKT/TQjKU4NGo8dyzXIgGgMQlZHsGcdJZcKOF3zGHZXq17KOUl5CdbMD4bhgVNdWz0I1uiwPzZzCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iwUReWHv; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlcqHRL3xVW3z+JRSYLTJ9hg6pyRciLP03d9nqg7aNc1W5VIwilCz0WDY/yT+v8o+kYBlVG4yR41GM+wPLqUK0HlSiF3GKvTnF7oS240/SOmZePkKA8LhfbOH4TjUde4ahU8OZ1EGu/qkaPo3VajywucsgImR9OClu2wZcAiksf4S5f/20xN6opZPpvXCB/NMADxGiU7bjXj5n8aeaig2JFwyvayXwSDgJ4sxmEUhcIUkMMc0qLLTe5CuYG9uEdmvI4Zj+o9C6KwXh3DdIQfHNegpt+oUYsIKhREwuOzYpHUJPkhmt2YMadOX41b5qOKVov7z+rXw7yN+iUZL2e+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Z38foown8TEk8Uob5UxDy2ZQvQadr3EoOD7LnUwN1E=;
 b=MledokQc/UFQ1zVhiqKga4imFEBouIcj8GQKsrChnL6E6Bl7ls4qL+vd+o5J8+03n+yBMSNBuVN/FlFQXvxJOPKI0lG4dMd2Y2mO2Fy9a52j/pm4J5JginukPVDsgec59cbamaNkdZ9I2mSmls/Phna2uNo6A04E9rYwq7Z05qUeYGdZnYYrPVyGj5qATifrAvBI123mHpdb8q48qHUMxtb1R+pEhfjgKJgLWuCSQnkCxgKOVFfGtB+AvOwc0QwB8pT+z90OaxJXE4B2XRu00jpxOhHXJC25e3y/YPnvnliRk+aLeYi1XshEol+A0IxKmLAoq0vRKgyJnPoUCaR8xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Z38foown8TEk8Uob5UxDy2ZQvQadr3EoOD7LnUwN1E=;
 b=iwUReWHvlba8iBVH86ldiGoVbOLafp2dAHBtUYOCDzmU3UjukIDh1A0avp7bKHLbgu5pFRrKMYCQKWzv98gAB0xw2E04uXbxYtqImJcL1nwXoT3ziHU3oxYcBeWFbxHA+WaEu6wQPpd8HQeue/H1ylifdnNmwUN73EE/ufvHKS5xZ9IS9uNH/YFIyixzFIvH0bhkga/6wdSWaV2VWwTO5rMNra1EI5/uiH0ajffTJ7yh/cWWEoHGELnPx8lnPlWjhxePXkstiDy8GqNazxdC5PRKyi2Sxmn/QaYM2msW/4c8he1XMVu9D1lqw8v8Z0TeRLINryCmYvkztU0iGsXymQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VI1PR04MB7197.eurprd04.prod.outlook.com (2603:10a6:800:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 07:41:54 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Thu, 8 Jan 2026
 07:41:54 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 08 Jan 2026 15:43:04 +0800
Subject: [PATCH 3/4] usb: gadget: uvc: improve error handling in
 uvcg_video_init()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-uvc-gadget-fix-patch-v1-3-8b571e5033cc@nxp.com>
References: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
In-Reply-To: <20260108-uvc-gadget-fix-patch-v1-0-8b571e5033cc@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc: jun.li@nxp.com, imx@lists.linux.dev, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767858202; l=900;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=fAF2UM4sJbKeCF4F0zL00kVG7FR9E40n7lre4EImxo8=;
 b=jGDMRVKNesMccgIetuns4YMnkbY9p+h+65FbnWPcEneb2YHTA44wS0v8AUJJJNLB3CzH75y0g
 cfF5j1NjJFzAFhD02hCCeXxnAJs+ej2NWW27nTLJ+xvlSQS3GUVyNkJ
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VI1PR04MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d3eaa5-65ee-4e7f-cf7f-08de4e8964b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blBqblJRWHQxMjR3by9HVWZiK0ZLN2dEMUd2NjhiMkNoTVh1OXVmbWtWRUxB?=
 =?utf-8?B?cTJ4eG80K0VObENvSnZXbytjRVVxMU53Y2VwRFhROTRoMnhIcDdvQlMvU0dJ?=
 =?utf-8?B?VDRFemZ0UmJEWkxoWEViTTFqTjFUMzlRVFdyd282b3JmbDhkN3NlZStWYnlJ?=
 =?utf-8?B?N01PTmo2eThZVGpCUmhRUENva1F3ZTFLTVVWdVBMV3N3dlhvN1QzRGVLTXgw?=
 =?utf-8?B?NnJYTUZPMmxEOXluaFJvcElQclpxUGhvM3JNN0h5T3g2S085TWpBelRaRldr?=
 =?utf-8?B?K0FQY3MyTHBaZm5FYnlLL2doUUZnQktiNTlkRFo5czM3Q2RxTTFXRXJmRkI5?=
 =?utf-8?B?OVRnRGVSSDJlRmtSRXlScUhTTDdOTWcrMU81ajd6Q3kwNVN5Y0NKS1JITmRP?=
 =?utf-8?B?RXJnRnlwRUNNaGlDUTJtMGlDTGNlU1NqakdnVk5BTWxFbk9DWXVkamhKZ25G?=
 =?utf-8?B?Y0dTSFpHR3BqVTlaUFVCVmlteTRuZHoyVUNUdndxZStaVHZnb0ZEQ3Vhbkcz?=
 =?utf-8?B?UTIrMWx4ZTVVUWJXcjVOVmxYRjZrRkVIWStCZTljNFg5WTFBQ09relZNdEhl?=
 =?utf-8?B?eHNkYlIwOU9HNC81aXphMWVsRmpWTHZwNGZrdFBKRDJwWEpmcHNUalc3NER4?=
 =?utf-8?B?QXZKNTZaUGJCKzZtd2NXSnJxQm42N1g2Z1pEd0tMUHpTYVJMWHVhM3lsNExC?=
 =?utf-8?B?N0NjWENLMCtJb09xZlBLNHNOcUdmL1g0VFF4dDZuT0ZtWERRc2JORjN2bnNi?=
 =?utf-8?B?ZVQ5MnJJVy9ZUXF5M21zaWpqK2c0WC9EVFduM0d3RzExMm1ISjMxMXlkUXVM?=
 =?utf-8?B?MnAxQUV5Y2JaV2RUZ0Z6QlFNbFJkNnpZUmtRNU5kVm1BaE9TdjB5eVFjQ3hj?=
 =?utf-8?B?YVpxbXlndHpRODZ0Q2o3Q0FrMlZlRm5XYTc1QjVVd2I4WHhjZmVNVjlFR1ov?=
 =?utf-8?B?N3NuWUQ0a0xkcy9OeUUydGZCMWlRUndQdlNMczJKUzBjRGNqK3Bva3FsaDB3?=
 =?utf-8?B?YWh3K2lCNXdCdnBaUlc3MThra1RVdmg3RndFLzRTVVpQbmZxRzd4ME5YM3ph?=
 =?utf-8?B?S1hidWU1bzZHdHFGN0JZVVl4ZEFKZjVySUlCTm1heUdjMkhxR2k5dHlpNldr?=
 =?utf-8?B?MG1ScFA1TXk2MU4zWSsrSW01dURGa25ra3piSGFHVnZTYjFnWjNWaHFtL2xu?=
 =?utf-8?B?OVIzT1JSSXBRemRER09zYW5qaWtyNDZQckVBeCtWNHhvUmcvR05xd04vUTE5?=
 =?utf-8?B?UnhYc2VWSy9FeE5RbnFnVEFDR0F2K01wS3VzQlZEV050Wnp3UHdESFVDakFq?=
 =?utf-8?B?bXVaM3hHQW16d2haUk9QNmdtUmp0M0MvVWozek1uYWN6T0dWWXg1SVJBemJO?=
 =?utf-8?B?VDFxQ1N4K1lrWkh1dWFvUkxnMXhMbkhJQ3lYQzQ0cFhDQU5DcGcvR2tBR2pu?=
 =?utf-8?B?eUo2M04wcmliVDZ3MDdDenE4SzE1MW8zckVQVEd6bndYVThIQ0JIWUlSa2lv?=
 =?utf-8?B?Lzl1dVZpMmE2R0xIOVh0Y2NFQTZyZDVzSmZNQjVweU1aRWJOendoa2h6b1lH?=
 =?utf-8?B?M3o2amEzWStXR3g1bk1RYkliT1I1SGFpWVZwYWVCeml4U2daQWszQzk5VElk?=
 =?utf-8?B?SWRKRENvNkQzZ09Vd3pmalhUMFYzTURUT0xIRmErVGt1empIOC9sTFJtTzdF?=
 =?utf-8?B?Ry9OQ3J5TnZsTzUyUXVEYzdpalJKRzlteEwrMGR5aHM4WjJrNDRubmFzbzY4?=
 =?utf-8?B?NGVndU5LeUNnUGxpd1FyL2N6TWkvZ01mQ2J4YmY0elpWU1U5TU9hRUx2S3pF?=
 =?utf-8?B?ZEs3emtMSXpLWnA3amNPbHpzaHRpSEgxbENnUGw4SzF6NWoyeFB2UmR0UDFM?=
 =?utf-8?B?STlOZDZqMHRPNXZ5VGJMWDVValpreXVtS2szNnYvT2Z5TjRkSWNsWE13dGFD?=
 =?utf-8?B?akxJdUU5S3FQbGxXS1RSbFNSek83TlV1WS9ydE5VMElNL1VFdC9RWHdKK3pO?=
 =?utf-8?B?UTNyZFlVdmFMeUNDUHN4c09EU09Ucnh5b0NZMDNwaDUxM0ZKcGwzYXUxaGNt?=
 =?utf-8?Q?jLrQZv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1hOMzZ6eXh4dDg0ZTN3N2ZucmJWVjM0TjNQTGZYYTE4NDdzTHRBY3B6VVlq?=
 =?utf-8?B?RkNONGxvUjl0K3hJT3p5RlVUWlZmdGszQjRkeDRTb0pPRHJvK29KS1Z6cHps?=
 =?utf-8?B?YmJpVzdreDhxa2VSUmtnK0w4Tkg0UFl3UW90cG5yNkRRWUhBaStyWkpJZEtY?=
 =?utf-8?B?SVJRNVVTUHRibEZwNXhjN0pmSXB0TE9NeXJzRi9OcGpzZ1RFSyt0WWRaRFgv?=
 =?utf-8?B?dG0vYjkrTmJLTzhseE9XVkM1SGJLUy9qeGxMTURXMFlaS0tTMGh3a1JOVXli?=
 =?utf-8?B?K0JNdWJVVjBoSXRqQWFXMVdaaFBTSEZHQlYzWVRJVDdkN0d4Y3hFaVNkS3Yz?=
 =?utf-8?B?bzZnL0dxR2t1aU41SS9Gd09GdlJjenpPamJyeERjK3AxSmJUa2FpQTlrT1dm?=
 =?utf-8?B?VXNPdzRjcU51TUQxYmlpWGdLM0tOMFhXN3Z2VnRXSkt2WHNPSEFjdE9Pd1lE?=
 =?utf-8?B?MndvV283QnE1b2VMSlpqeGdPbmJBT3hhckVkZXozRHdEcHMrQWs3WmhDNVY5?=
 =?utf-8?B?clFJWmp5KzZDOWhEZmNhYm9QNEVyM2FzMkVJN3JQTlNkSlR0cElTcjVtaVlt?=
 =?utf-8?B?Uk5MR3RvZ3JteTJyY2VrQXJULzNJK204SFFpMldxYld3NXhGemxBY2dUb0U4?=
 =?utf-8?B?RTJoOEF0aDJtNzVDMHkvMk5kUUpIY1RvbEViNWJpb2tkRmhtTzZBZ1NwVXhW?=
 =?utf-8?B?R1lIajFsUzQ1dVNsU2VMM3V4NTVOVTZHcmNyMlY4THhvd0tQNWxPczVZNE9j?=
 =?utf-8?B?U3VTUkk0cnVmaTdtTVZ6VEFsMzJlNDl0S0VaRHNqblZEczF3N3VMcW9kZWpI?=
 =?utf-8?B?RGVIeW9Jbk0wSlZEL0J4UVg2S2tCYjVjNTZpL2tlMWhBTEdEaDE3RXVqMHRE?=
 =?utf-8?B?TTJJbWF4d05Odnh2aGZaVGNveGJuMUdhMER2cUk1cEtqWDcva0FnOTVKK0Z0?=
 =?utf-8?B?WnRLUmdqNlNiWmh3RUExTFZjamlHeVd0UHhvZERpb0Y4SVdBVllpaDRtVGI5?=
 =?utf-8?B?Mk1GaFZtcHZMSVZSZlVFRXJ3ZDV4MkRFYWVQN3VPNmdicExlTm4vMGlwM1VV?=
 =?utf-8?B?VGFBOEVzMmkzZ28raHoyNjBuYmowZGNwQUV3ZDRQRlA5WG5ZL054VVFhSGxN?=
 =?utf-8?B?Vlh1Um1BMm9FeUtMWEdkbE5kUXRjdU43MHRlMm83dGYvbHQ1TDRhbEhSQjRW?=
 =?utf-8?B?am54eDVQSkZ0K0RFTnNGV2lTVk9tdm9nanBmejc2cWh2WEdUb2RTbVQvRjF0?=
 =?utf-8?B?TnFvQ2tLRlYrNzdZaHM1N3c2dmRVckdkRUJ1cVJrQXQ2V3hOOWV4OEt0UkNP?=
 =?utf-8?B?djRoYlVXVGJ2NW9DSzA3Q1FpdmJVTVlTenJERTJxeEdvbWpYbUtzMTNDTXM0?=
 =?utf-8?B?MXpiSys1K2Q3ajl5aklRT0p2a0ltS1RTRU1PdVA2OHpXSEhRMjJqNGJhRVUw?=
 =?utf-8?B?bVd3TmcwUmJlSjVhQUxPWnh6K0FRUzhYN3NGNEhuemx1L1NyVEJNd1MwdEdk?=
 =?utf-8?B?NGJHdXY3S2NuTGJDQUxOYWg0MzVCcTQ0eGRXY05PakROTVpCNXBqN1ptcEFy?=
 =?utf-8?B?OEdCU2pCOTgyUmJJdE44K20vaERmcVBZRUVUZWRyV21xTHhtQUlKN2hZeVE0?=
 =?utf-8?B?ZWpUM3JEQzU3NE5wdzBCcjRGTmVBNi8xRHdUOU1YWjdtTGJnL1U2aFZzbVhp?=
 =?utf-8?B?RnRiYUxkRU1UNmNGZ0lWa001ckZFWUhYMG9WSUZXdGlLT25SbjZialdBVWlm?=
 =?utf-8?B?ZW1vWEk5S2psa2hjckg4OVBRNUs5RUxoL3VuU2V0cjJIMkFMZ3BUaEw3cWFG?=
 =?utf-8?B?Rit4L3c2R1p6ak1UUUZURy85M1ZEdTg5RkhEbmdmM2ZKZ2tTRG9iZHVMejd4?=
 =?utf-8?B?bkxMTnRQczJrUGcxcUd2UTRUK3UvRjk0OGVJaUVmQmdxWTZjSkQ0R0xxLzIx?=
 =?utf-8?B?NmtCeTA0amQ0ZnVLTXNGSnl3NFVhOVRwZDlHV081aHd2c0Y2TTJEMTRVZng4?=
 =?utf-8?B?ajVDcno3SFI4eVlnZjdVZ1hWRmRWREkzQTQ0ZUVubDFVdEtqZ3dNSW5qb21i?=
 =?utf-8?B?SHdmVFlQSWo1MGNacExvRmdXRnQwTHgwWWtvNWxrNDVia3htOXpOR0lzdUVk?=
 =?utf-8?B?N1hzcFlBNHdoNWIxUHJBWGdHaS82Rk44c1B3ckZBQ1JSbGJFdFEyWFJrYWpi?=
 =?utf-8?B?RkFoVDZkZHN2YTZLRWcvYjd6OFVHOG8xYzk0K0xCZ3dMbWtuUDZqaWphSXhu?=
 =?utf-8?B?bTdNN1k5VTY4b2NQVDZOK0JZV0EzUUxINFByY253Tzk0N0gxRzIyTzhtbGc3?=
 =?utf-8?B?cUFxWDltSTFNbTJHYVJ4VGllVjVmVUM3eVBIdFdXWTVUSXpmUDhQZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d3eaa5-65ee-4e7f-cf7f-08de4e8964b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 07:41:54.1415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fgd099HlZb3QJRagvZd3CqSsB5sBb8QstTihZyXPpXXgDCYzA4qXqP42Ud3cOUPgXN+oL56tH59XPsLO4/I3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7197

Let uvcg_video_init() return correct code so that error can be handled
correctly.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/gadget/function/uvc_video.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index b1c5c1d3e9390c82cc84e736a7f288626ee69d51..ede300190f591d39e306aecb565c614cdff5e664 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -838,7 +838,6 @@ int uvcg_video_init(struct uvc_video *video, struct uvc_device *uvc)
 	video->interval = 666666;
 
 	/* Initialize the video buffers queue. */
-	uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
+	return uvcg_queue_init(&video->queue, uvc->v4l2_dev.dev->parent,
 			V4L2_BUF_TYPE_VIDEO_OUTPUT, &video->mutex);
-	return 0;
 }

-- 
2.34.1


