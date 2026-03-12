Return-Path: <linux-usb+bounces-34654-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Bj1K7R0sml/MwAAu9opvQ
	(envelope-from <linux-usb+bounces-34654-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:09:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820026EAA7
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 09:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC27B30967E0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 08:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14339331A46;
	Thu, 12 Mar 2026 08:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OcWJU6Oz"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A15F30B51A;
	Thu, 12 Mar 2026 08:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773302773; cv=fail; b=r+Kj7xKlvRNzBve8HOAR8+bOlYGzCE1d01ATlkMuPbShC82UiUGEW2VkgDZk7Stng1Yj+uYeiFAkMy9lhw910fCr2Rg5CzbnJspglC0L+7F/Zr8cgOSD9IgFyngz6baHs8phJsUUP1Ra6QZSmPaML/jjHvLWdwz4fPNYtjne3zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773302773; c=relaxed/simple;
	bh=RXrtvhM2ANM5wBvfw2vyPnN3I5O68pifuZYlSuyFpMY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N9tpPy5tF0m7JRD96DfFjE7uleBlcw6llButji7PuwLeuErNM4KAgnlf2nqHfvxjTkyo3O+DFWmfuzN5q7S9f6lF1k3TGt1MMn8UCsXYk0S37pyWw0AB5bJnOj32t1Y63phClpbHWuZ/FHjl92jpoIyy7QkOZjMbI2o+gzx9A6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OcWJU6Oz; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfgBqv8SpeGsVDCSp6/LMwnnF30jQpdmxDu/oUtocRMCejpuwts2dOml1upSpHIm8ieSqCY2WrnOLOGyRksxJ5y+ZniM8iHgwWRYNN0G8Jfi6TMItiIBQkXtH5pkRUEJd6I3YgZC/zxjt1/72vbTPOf/MZgdH9SXblJIBkHvbLBtIekAnf+EFqowj9WcUShHYYeXEwFUfC7LpfWx0TRhn/uj2sj8S9Jc6Q/wRcwCW9RFIsHkw8FyvF/PaJ/km+4eEOnI8IBkQRP3GNbbs+pyA8VtvW01tkQp9NwEA7CPEN3PhD8SY2h32HfsPK5aZvZwcshnmRs3jNYCFiqQiI3uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8NroW97w0WDro0WCZUyY/fI59pB83PYFAcz5YdYR4o=;
 b=bACTBv1MJi1JGachag2RQJIKUrhcNsW8pz1R5taSqWz0bnGyyVSpT0F9ScaCuN8wGl+QRTqxfdejtrb+F6bUWxzgS5qw2YxXkdpyxq5mqvJw532iQvtMXle3nAKxnUr8uMq2Im+c/Q6bQcLx0gNLFP+Ilb/lVDhKXHy5BMROeBDHDiEaEIVe5Itg9Jr+tg+tZXkXZl/BWtbMzWCf1G7pJEUcsFdj0nXhzTzljpQAEmevnD1XFJzVt5UKvCgFv9QMrhkifcufyY7gz3TJOgnx0bRBFrryZoF7kg87DAk9Ddbv+xTC1Hjla0vW63dshBuGP5hFQ4AZyV9xHYE8X4gaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8NroW97w0WDro0WCZUyY/fI59pB83PYFAcz5YdYR4o=;
 b=OcWJU6Ozq4uaBCmDkbfMso0v9lxYUdKYdlF1XXoPP75wE7DWiMdLEi1tFOBBGc5VMVTYj1HZsjb5Cw4Ej8dDhMWhSMLtqZbDgA1ykp17VT3PE1wUH4Mv0SrP1X2vM2o/Yatgt745RvGiUalVC9CY/umOL2byYz+QZxwp7dWv7C4/q5zr2NfO8DcIFjQ/UILt75C6bMQLotv1hjkPPtHgPdstmq5b+nth5ceecaBTvP/pBmXHh/uIGCGLaMDmAyE0E9hXoTLOhhLBe1/K/eHQ72bf0cVRZVPgVYedVmSEQx2BDaQ9mG5BLma+g/drDh2e9U0F7qllgDVjdrATYpvsxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAXPR04MB8427.eurprd04.prod.outlook.com (2603:10a6:102:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 08:06:05 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 08:06:01 +0000
From: Xu Yang <xu.yang_2@nxp.com>
Date: Thu, 12 Mar 2026 16:07:24 +0800
Subject: [PATCH v2 1/2] dt-bindings: usb: nxp,ptn5110: add optional
 orientation-gpios property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-support-setting-orientation-use-gpio-v2-1-59c523a09f12@nxp.com>
References: <20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com>
In-Reply-To: <20260312-support-setting-orientation-use-gpio-v2-0-59c523a09f12@nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Li Jun <jun.li@nxp.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xu Yang <xu.yang_2@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773302893; l=1340;
 i=xu.yang_2@nxp.com; s=20250815; h=from:subject:message-id;
 bh=RXrtvhM2ANM5wBvfw2vyPnN3I5O68pifuZYlSuyFpMY=;
 b=5yruXXMfvbkN152vN6+gUbB6QvVjPMl0vuRH6HsM/eZruwH4As/LqKWRrM7YKmVQvEVZGf9E4
 63q6/a0Sr03B1rRfqoOoxWDY/Nk7M0miulB2yrO3iJpyyKvxIjUVFHz
X-Developer-Key: i=xu.yang_2@nxp.com; a=ed25519;
 pk=5c2HwftfKxFlMJboUe40+xawMtfnp5F8iEiv5CiKS+4=
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAXPR04MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: d70aef28-2705-43f3-cba1-08de800e32f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|52116014|376014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MIk9t5cou/aVz69IS4vP0dwiXs6WTzKruppvMw8nom8WNHRvSEKqedI2jvgD7HkvUafCttTaMqAy9ies6atel8x3HS8YPtg432FYLdbEidbDAiQRpl8AZXzASz6tvWaYNRjj4H1H+LKYFxWhaVJg56b/fieWQNqYiexRRFYIsHSmWEQvL4fcVOIAuOciUW9ykr3M1E7cPcHW2OUvU1W4fAWocbC9swFYvDv8cvq/NOxHHmCb6Ph5nYVQ3tVSDDXU89uqp1g9Hju6D0u+MeTfSG3J7cqhBCaMnhNQN7wAM6U8ottkovA9VL4usEVQIFZMkCUohWYF8HOGT/pGzFNLkUTBnjw0iyPkYxO/79HugML3HnA/shB5bnM557OxB+hE8GQ6ZO4vsVGeg4laXQNxPdB7pii1v2fPYoh3XkOAkx6WGcu7gKqdPPXjme6FtgGTpd2hWkaQYHHzoZE9SLZ/n8VOeXVKTLzKHPfdIm/E/IlMD0wngVoBzZbxsPQL0gvbK2B8YiKQVWb+ZXAU1Wd4d/WiH4Lqrcuh0VPY1uVpyt818f10eRasLY3j1oDH2trV0EueFF4op9MSAVbBeDwTZz9djQUlag063Gbrw92XXUcQNiV3Zhy/OLEk+siW39F4fIOLLxl5q6BG9hzoQriMKwmLOD5coWgbOxeknAtxji/stEfuOvag20RKIPd42/5UoTlGCnltwWxDyFh/rT0+XcpEJWhqEI4+6SuWsNrC5AEGcnmrLHxTIg/Poqi9uj6EHMNi9JSQ8GlFBoVJPMjMUGrEbYvf3pm6RUg7DKjofSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q21BYlJkeFBuUG12M0NPaUk2NUE5Z0daWHhSN25GUGlWWkxNKzExN0lWSkp3?=
 =?utf-8?B?N205NGk0eHR1eFIxRmNwU2ttNkp6K0ZYNUw0YmMyYU4xcTNkQlVGdFhlV3ZN?=
 =?utf-8?B?VjFZSENyenlLWW5kYVZoMlk2cjAwRFlvQTVESnQvUVZ3N3pKTlBxdmhEVUdq?=
 =?utf-8?B?RjhZbkdNQ0lLamJDdE5wNzFwRTR3ZzYrSHY0UEpkQlFkdUs1NGR3aDhxTklY?=
 =?utf-8?B?UHF3QXJ5VEVseUVrTGJLUGFoMUpzRXQ4ZlY4a3pxb0JVVzA2SDN5Nm9zTTNF?=
 =?utf-8?B?Z3F4a1dQVlZmYlU3SHJLQXUvODVkYzdTNCtUS3U1TzZidjhIRVdrdDNvYlJQ?=
 =?utf-8?B?NlUraCtrRy8vNzB3empUR01PNUhHL2dsS3EvV0FsV3c4Y3daRFVVTFl0dmta?=
 =?utf-8?B?TnE3YjlCdkcyMjUxSCsrbzhIbE85UkhGdUdjcjFhZ0tkVnQvcStXZGxENXZZ?=
 =?utf-8?B?WSsvUDJzeFBnczZSNnNHQVVCNDhGRksxL014N3A4SDdRMFQ4a3Q2S0RMWjNU?=
 =?utf-8?B?ZUtMbHh5NmRjeVlzSGZxZE9TckEva3gzeExLclJwUmFucnNIbHptUUVJRjF5?=
 =?utf-8?B?WCtEb3FWemxENjFhbGIveFYwSHdWblAydEFaemt0ZzFwQU16YlJySHVRK2NO?=
 =?utf-8?B?M29FYlcwTGRXamdXL2RmWWVDa1N2VFhibDdxcG9iY25YY25sV0p5YjBTa0dQ?=
 =?utf-8?B?OUg2RzFZN2VMdkZKdElsanpqbDVhQzYzN215Vmd6NnFPME9kc1lSUkJPTWhQ?=
 =?utf-8?B?NU5id1BUVTRieWJsd2F0VzVzaG0ybDVQdmdFVlExdXNPVktzcU5TcGRtL0Jj?=
 =?utf-8?B?SFlIMFF2T3cxRWxxREU3UzFseUJoRFBaQVFFRXZjd2I1SHNoYXdOcDNLNVNX?=
 =?utf-8?B?UWVIMXN2U1NUelh1cjFGNHV2QUxhNWVUOVVRNGxCQ1R2VCs0ZjhQKzBLRlNI?=
 =?utf-8?B?U2o4NlVvT2ZZKytEY3NtcWd3eExzcGdQblhJNDRiNGdOR2RsZkpDRXk3a3hW?=
 =?utf-8?B?NndOTVh4MnczdGd1SDVGKzBTTlJLT054cEZRTHZTcG5MN0Q3RWVhV0cyaDVk?=
 =?utf-8?B?T05Wek83a1pmS2hFNFFaU3FaWFcwSnBOMzZ1T29vVDRNRVhmMmdRb1RpQTkw?=
 =?utf-8?B?c2t1c3h2emVZQTcyUGhFNHVyWm9ZOU0wSWt2SXdTMGhFbTNjaGx3Q2RlN3F5?=
 =?utf-8?B?MGM0eGhEVnB3VzU0SWRjZVRSRE1ib0NCeFo2bnVJV0ZhemYvUW9oTG9QZGlC?=
 =?utf-8?B?di9lRmRBMFhRai84WWhpcVJOOVNnZ3VpdjVMUHdid0RXRWJCUkZCNjM0V0xH?=
 =?utf-8?B?dloyU2lkWEtYMmxCK3ZaZkJHMFRWTFRUZUtoSGY3QzhqSW1mdTRvdGF2dkFk?=
 =?utf-8?B?WVVhTGpXeUFobmdBa1VCcWQySUo0aFZLNWhaZ0M0VTFiTkJGVFRMOCtWNzAz?=
 =?utf-8?B?UVV4aHhTRDBJMWFYcVJUWnhEb2Z1VXdySmxxZlZkeHdwSGVqamMwcnBlL2pQ?=
 =?utf-8?B?UjlsdjRQTzBhTnhabnNwdDU1allwQkM2Z0VrSEZGYUUrSWRTMnRiWXZNNEY3?=
 =?utf-8?B?YXdWS2VKZGNwZnpEYUVkNTVPU3lXWWRGRk1mZlkxUEwzWjhUcHdvWEN0ODVi?=
 =?utf-8?B?QkZxem5xRG94YllPRUltVnI0ZlJoSVVKTWxVQVRFczBpQ1hZQXhVc0hhM09B?=
 =?utf-8?B?NWZHMWNsc2U3cmlEcGtseXhKQzh3N1ZRV09MRERUK0RCM0RHdlhGSnlUdlAx?=
 =?utf-8?B?aThoUVZCTlQybUxTaDAvLzdrUG11VlRUY1Y2R0tjb2U4L1Z2ZWMvbDQxR3R6?=
 =?utf-8?B?R3Fyc055OWJyOU0wWFBxbE9UZWU5NGFwVnU5ckxwb2crRkIyQzVla3BkMStU?=
 =?utf-8?B?VUgrR1JxejliSkxYNE0vTkNKZmd2RkNVcHVGdFo3NWRXZldKNkZNdkxQdlJt?=
 =?utf-8?B?RlNiY3pzdE54cyswRTlRU1ptYkExVFlmdEwyODhjQ1U5UUV2VEZJMm5TUUNT?=
 =?utf-8?B?K2gvTkJodXp0dmIweXhybTBvZVZwbjVuYzFrZjFKb1NiZklqTlhmL3NVOVBs?=
 =?utf-8?B?QkZMMnhaODZZQjhEZndhV1psczZaTXZjUGZJNEo2ZXNyVHc0RWJPcXFrckdL?=
 =?utf-8?B?MXdUR0NRSUFWQ2JuaUlKZ3dXSHRSdXlJWExEV2M0a2V1QkZlWm9XZHAyZFl5?=
 =?utf-8?B?c2Nrb1ZrQ1hQeFdoMHFYdUl2YkljZHV4YndLcktWSUo5R0wwL3lqZFkxSjZS?=
 =?utf-8?B?S05VWmNCSi9xcEdycFE2a2ZjclY2TGNEWWhDZllqd0pyZVIwelBMUTFES2lQ?=
 =?utf-8?B?aW9HR3RQOUtseEQ4SHV2VG44UjJnVDBXSVVqTXFSR05memJuVmU4UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70aef28-2705-43f3-cba1-08de800e32f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:06:01.4507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AsEdxykOnYugIckg1S1oZ8wkb+Z0KUtnHauvIIamnFQoToGb2E3C4RrerzfTKy+zA57/dfANititG9a/KbkY1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8427
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
	TAGGED_FROM(0.00)[bounces-34654-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 2820026EAA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Type-C chip know the cable orientation and then normally will set the
switch channel to correctly configure the data path. Some chips itself
support to output the control signal by indicating the capability in
bit[0] of STANDARD_OUTPUT_CAPABILITIES register and do it in
CONFIG_STANDARD_OUTPUT register. For PTN5110 which doesn't present this
capability currently there is no way to achieve the orientation setting.
Add an optional "orientation-gpios" property to achieve the same purpose.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
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


