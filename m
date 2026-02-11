Return-Path: <linux-usb+bounces-33279-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOl0AIZcjGmWlwAAu9opvQ
	(envelope-from <linux-usb+bounces-33279-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:40:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 520FD123810
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 11:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 691B730F4D49
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 10:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DB3369204;
	Wed, 11 Feb 2026 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gmlv+d2a"
X-Original-To: linux-usb@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAB367F31;
	Wed, 11 Feb 2026 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770806096; cv=fail; b=dhhgOSAhHBtTzGsIIixafMOY5P2ibAFyc84TDwgMzth23+Lei94rYhBiP/lTP1ajo2D+fQA+AtACWYR8rm+SwSY4nPznqTSOn+5epKXyUZ022J1UWdk2yIxB4dv3n9YAmSgzqcf7RWUMqGUfgLZt+DQmE7Z+BGAFiTWQzAyr4uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770806096; c=relaxed/simple;
	bh=yogCTSdF9+SeZS7PMA332398xm9iEf23XN62bNaJHfU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=sp26KFRpjqlUIta/FDb8YBijZUOpbHq10ueG0ig5L9qiqdGKuqPFdnL49UVPXUs3WdloRspu1hTxt/YQBdfp1rOf/R39fN6rhPdUTjGzfzVdPonfWfWrwJujFM2ZZ4T114I0xhkw11EK9K4W3IvBkeuqYbkMEzQkZH2BmxsRQ90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gmlv+d2a; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/Ql5RU4orIoqe/KdR4HfdrDHX+m1uoBNEbCbgGTAfEZyB0PgzwhJLiVWZqvjHPIUlkPqd9om0fVXqqVRnoSgQk9b8pMWCoVM/bU+uwZ4whJyPw0BL4Ukasd7TvZgQDteB/N1aAdfcQOBnZEUceOc1cYSZ2ihE+y7lK9kyvoeiiToG5muzOEUGfW1a7/VzXsJzD+XkQpS5EckExYj150PLUj2zt/scNjUfQ0K1FNp2NVRHl8LYZkMrduQoTdz2jkqFdQl5p6/xM/f3mV/TQPe6OjytUB6wTLDAtv2yQJQMcEIv2avBuWYdDtOr+Y7b821f1vECVr4FsMJllrBvWN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyVf9cR8mH1nGm3QA3QUL7df+g5Uxp22ydeXibj/yJg=;
 b=XP+8CgHe1ngLFoEXVDrh2LgfJ8asGc9bht3Mfv1onBo2grfLPdRsn6B2tsRjwsex2WQTC7nXvZZ1mZ/jx9NN/GO6xINIRTpP+sm9oNjY+xMtD94/mYp+vuGxLRkmTOQfyQWzJtHVZq64+UhZXx2Tdxf9Aq/UL9cw6XJUmv+PeSooYMHdYGBnSXyyx1IS9NVQ+AacmJdyFr7i28BrDYWMEVjKcmtjPe/7neDfmjO+A1slwfxClbED5qC2kyjStKV0PbWjONOZCI0TaBvfBjrkFpooCir6Wz90MAjuS9lybzmZmZmlixx/7j91NUkT5Xsm3iRoKP8T85WPRqEp95yJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyVf9cR8mH1nGm3QA3QUL7df+g5Uxp22ydeXibj/yJg=;
 b=gmlv+d2abg2OKwB5nzuCkoh5oC0TpqmZ/K1cOJaXygWLZDPU+MeHJg/ZefK+3mkN7zuHhpubLHJilJ4WoK97rCXwNykr4zEslVMqGmvEm3hFNg2+K1w6Hzyo35M1c8US9xyU/0soMi9TXrP1rDZrcElExW9i6ZTH55ozb6cm7lJV91xAbBZ1Hp3mWnR9+M7wV1pNbg8GdnPP8xDhe1xGlCAKlY3NQaQ1f0eRlCzO4be+5hDz7eFySSEgl9wA4DuocnDm+hifjFle84Stq00ZYAzvMghdqHeurLWfgsjV+Ca1MPdoTdhY1deDTTz57Rm7p10rlh8YCoDAnUmGzJ0yjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 10:34:51 +0000
Received: from AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781]) by AM9PR04MB8825.eurprd04.prod.outlook.com
 ([fe80::49d0:5fa7:d131:7781%4]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 10:34:51 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de,
	stern@rowland.harvard.edu
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: port: add delay after usb_hub_set_port_power()
Date: Wed, 11 Feb 2026 18:36:28 +0800
Message-Id: <20260211103628.3265850-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0038.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::7)
 To AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8825:EE_|PA4PR04MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 470b7abf-b7db-4c47-b1e8-08de69592ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rGirWAjMgViVuvBDE2rVQzN4zyt3ukzI3yB7LYbYcS9gQ2CuWV+E4fmU5dwE?=
 =?us-ascii?Q?mSDESiSYkWKCKGy7DNAIOwFyKqReQH9SnMFlIj4bPsuuz2s5rO0AgZy3gwmt?=
 =?us-ascii?Q?S1SwwDsLVYpIydTyGCyJx89VvRQPtLOQKxHcRrgaFN42WH7GyRVwyatyqGT8?=
 =?us-ascii?Q?FU3q/i4a/wTzY1XnQ8c7h6oWdJIOeMfOBgAeV08rZM1AZKDuJINqFzMDRG2f?=
 =?us-ascii?Q?uKhpdHuq1PkJx+2y3WkFY6npjSme0vV55e3blSOsYk88GJ+ZSDFZe7eUL5o0?=
 =?us-ascii?Q?6BhOLAQvEJ85FGC2hnxj+oxPGXGqxjdOZMSe0g9VjQ2SW11T+hPSQhc1Ln2k?=
 =?us-ascii?Q?A1SUJu0OxrrSnIE7ovc3txAeeFZNfN8WjF7jJupWwkl3VcQ9Qpor6T0W8+Dz?=
 =?us-ascii?Q?2mw+XO2A8tLwuPSRzIVSpb7y9jQMSRTJollwGWJ3cAIStAGfkEiDQ1LC9LBb?=
 =?us-ascii?Q?q1X1ucQd6pr45+21I+/SOsas6lNhMo9q4IGwmJkQVoGDfHgickk0nDL/eX3O?=
 =?us-ascii?Q?KGWV9PCWFqaJJOKWGKaTb06uvX0l58cWIKYrtG5Q59xpqxAcfPOgxpI7Dbw/?=
 =?us-ascii?Q?hiOSWyVTGWe7sg37A9Zu3XWlDfIZzeRzEZ832w3HRVA78vYZ67vGU+Nktm1s?=
 =?us-ascii?Q?OsMy7jOt/KwlTmgQ0fKy6Ny0AAvDEEMmCmxuTZqd62D9vsRCREyf4HGjgpdR?=
 =?us-ascii?Q?kNXFnM8ioDlp1er9BZutmZN0jwC32NjMhTvR62zHFVzleGE/C4GTdWQ1k7XN?=
 =?us-ascii?Q?mA9SNlwmH5Bfl+wxTOmZI98QUIplhhF7oMLgFF9Fie2z7CKkggCTYmEr+PEG?=
 =?us-ascii?Q?xWKHI69nVZcbZSjVH2pT/l71Xk/yh1TJ4+GZmV4FSb74MZF6dOIsqgCOiSG5?=
 =?us-ascii?Q?zqKhH0YxDQkgVY9yHMEOEx30JkqyJkK4QoTycDMldAk4hdN1XHYV+ZPm7NRW?=
 =?us-ascii?Q?w6ilPeKm5OBQIsIJe7/NUuwRu3tKnnpOD/uw28gpolveJj5Uk5LtA1dgyJsN?=
 =?us-ascii?Q?6nRXnqBALzVdN1rrtI9GTnS8rdgHnTd3Ysl0jjoCoSKX4fcE4n/6M69h/lhZ?=
 =?us-ascii?Q?DoYPJDjVTrJchQNdABTmNrzR5UTAcnUUS+smUqNa8ALHh43mp/WM8f5/oZ6l?=
 =?us-ascii?Q?Qee3ejEVTSTQsUqCI18Lg6fi+bj/Nf/SPbZgR413eCUsfd+h61M7xKzwAd4y?=
 =?us-ascii?Q?jYljGL/9ZFpw0GWocpSCVSNILeMpkRwMf5hWGCEUs5DV7+LJx5+WSK3Y9YF4?=
 =?us-ascii?Q?sSW71ceP+7ikcGXhxQcDQ2FmcHd3JlTjdoIwuj823JLfIbzGebGydI5WpiG7?=
 =?us-ascii?Q?XliZG6lgAGceK9Vd3FWZRtXFfTRqsw6QANTQNO25xT3HVesePOdq4HsLp1RB?=
 =?us-ascii?Q?d+2Iy7EavEdo4U3sk2x0+scMhOR5jgZyxIP++wrkWtkViWSTxbhnV3SjY9qY?=
 =?us-ascii?Q?V8u7+Wiw8DRWQf13YWAwutmUSvLqp9RYRDK8h5ZX5d0WriL3eNpEO0aGqv9d?=
 =?us-ascii?Q?F1G/3PYMJUXw3IFXhNSSFDtinZ4IK9o7zpMF1/Tij8s2t6+OT0YzIemAkEcI?=
 =?us-ascii?Q?iPncsRIbK7PBkcqL8RLIZWr6Db96kpiJVe+QswW3CpuMGP0+UOFp7AN1+Viy?=
 =?us-ascii?Q?HGW8s6y8bz29rh5z1OrI7Kc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8825.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZQ7ZjRpgSpC+N4ZZEcVDT036zttdi3+GrhN/aU/9IaDGOqRRFyxOem+m1SD?=
 =?us-ascii?Q?JcyyGF5/Cu7WkzrmiKEFLrXMGUHDvbk03snufoLaSwIQOOIKFXjvq+og29g/?=
 =?us-ascii?Q?/1Wj4zkRjHv6JHswUix+P8f4dZMFd+8wFs6AORYxGW77v1epZeRW+5UETY5a?=
 =?us-ascii?Q?f8zW4wgM2iGyhQg9cY62g6kQW6RwXQzKyOLHVzNuHNDBOGshITKfsmivIWwu?=
 =?us-ascii?Q?EQz0rXV3Oxa3olGDb5ToC5uIu5J/sDONSCDECE8D7SR72mZDp5zG+eZbLA5V?=
 =?us-ascii?Q?sbE+/YvI/cpSvW3XjJdBz+S0G18JCn67xdcyelBEuzz1z/Spi09GJMcPZsMK?=
 =?us-ascii?Q?zIVldxffpWAmNcOd73aNWXEQqIg6kFnIx38FbOuGZc7bTKMESgMavoDeo2dt?=
 =?us-ascii?Q?uwhUzDpJeJlm1+58wkxVujG1TpFKsmTYb71VM8O3w2AvAPmk7SAbfJYzB+7u?=
 =?us-ascii?Q?UaSgmAPsNwJdRrtnB5YCRcyN2ZYlQgfUrXTUIBgu4IAwoDPXJGH9l/z8ol18?=
 =?us-ascii?Q?gmb7mqzcFYrwhrJRCN8am0GSPA0y+Ma68sLxALZP3ZkaNEDJZONpVxiLXCwF?=
 =?us-ascii?Q?9STSPpYcZa2HeFcIGipjCrqKlKnuPOstUoGavlglXqRwBz2UOmnj4ZopBPLA?=
 =?us-ascii?Q?X0V62heFTJr4rb4fxeXe4yRjREpr+lxn0Q7CGBmJCAJZKF/Dt9/QI9jW9Fgn?=
 =?us-ascii?Q?GjemMBWSF1Ie/9TOokKuWc4LvX613yQJAhqyUv9pFGogOJIoQx6sXiO+eE0p?=
 =?us-ascii?Q?FD7Ka4fLGZvDqjv2qE8nF2CMCSk7jJZsxHpvlyiKUjU2iU+Gr/iv5qTcXF29?=
 =?us-ascii?Q?BlMUDPaQ5GCbHtIrTjq6A5fWs3mjTorYuwhv5+7k536agqhyC7pgpkhKgwqh?=
 =?us-ascii?Q?cijfZ2tU1/k2MOR8YSIUOVdlzi5mE1E2AwilVIrGGH7VhmxAX6M9TgBdHPTB?=
 =?us-ascii?Q?LctYY/jmoMVY1ANZuUBVkM7hn66oqoB573O6/Lm3r84+dSowUJS6GNHfh6d+?=
 =?us-ascii?Q?qXXBxXak+vNXvXq44JOcS9Zyl0IqX8xSyZYklmwfApBEiZfEXDWC17axWphM?=
 =?us-ascii?Q?C2WGuqdKIL97c7kqBnRt2BDZyJkASGFNz/6FnlzURsH1SxjgI4WA0m0Jaqym?=
 =?us-ascii?Q?P7qIXNh3np+95uigX0tswRFDQ6Huy/2PoXk5s0h1hE/LhRICNDnACf6Kx8pg?=
 =?us-ascii?Q?c8XXk6BvgjuVSMpWCWF2MPi60HKNEKm1/n8gGC0kQgm0LdCg06Y0wcjNmOQD?=
 =?us-ascii?Q?NySNjD+FD5yzUaJKnXVFnu4/r5oU3w1O5CBfBCO0tIZu+H6I8h2rxMCkI9Ke?=
 =?us-ascii?Q?5FXnKKRVpDNsmF7X9uBFj2iEBXzY0FOgJ0fn55OBHedPEHGalHmI/8yHNtU2?=
 =?us-ascii?Q?DP7MKuC5oJD7Ca3ytLKKTtL4wHA9AR7+5UmGBuuxZl3NbSYU2xtp0NRzF7eR?=
 =?us-ascii?Q?g8xR5AP1Mxn3egoPoEIiRBGu2ka9jp3R5wR1U+UVMa3B1PNNl5R/POiUB7jR?=
 =?us-ascii?Q?UR87h/CpGKCMIhgRDPrxav0ndxZ3I36PM1lUWld/k/8xRpGiNSqPGjOLkEoH?=
 =?us-ascii?Q?Wk2MNK+9IdcLPFqWnSzPGRS+O2vMBHKN12RqgrI2qu96WShnlY5SdhZV+c9M?=
 =?us-ascii?Q?9hYaLsdw2yXnuCOMXqq46NlA/LteLWwE4d8sqhQqZCwL34BQIzzU1XLErZVj?=
 =?us-ascii?Q?JiupyWL5O6S/b7Day+ijO9kCkAmfMnFE4+an7EZVu02ABRYMsUQAdUbVf+T/?=
 =?us-ascii?Q?5fLB1Z4qfA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470b7abf-b7db-4c47-b1e8-08de69592ffc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8825.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 10:34:51.4445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rSFPY3rv5pg8FQu5DfRO3UGjmulklVVJv1BEzEhkSCx1zt9F0Y5CChh89FW/3UF/FJZz0bL95sRQAa1UnYxOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7919
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-33279-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 520FD123810
X-Rspamd-Action: no action

When disable the root hub port, somehow the device is disconnected and
re-connected again. This happens because usb_clear_port_feature() does not
clear a truly happened port change. That says, in fact, port change event
may happen after usb_clear_port_feature() is called. Then the subsequent
port change event will have impact on usb device suspend routine.

Below log shows what is happening:

$ echo 1 > usb1-port1/disable
[   37.958239] usb 1-1: USB disconnect, device number 2
[   37.964101] usb 1-1: unregistering device
[   37.970070] hub 1-0:1.0: hub_suspend
[   37.971305] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0002
[   37.974412] usb usb1: bus auto-suspend, wakeup 1
[   37.988175] usb usb1: suspend raced with wakeup event         <---
[   37.993947] usb usb1: usb auto-resume
[   37.998401] hub 1-0:1.0: hub_resume
[   38.105688] usb usb1-port1: status 0000, change 0000, 12 Mb/s
[   38.112399] hub 1-0:1.0: state 7 ports 1 chg 0000 evt 0000
[   38.118645] hub 1-0:1.0: hub_suspend
[   38.122963] usb usb1: bus auto-suspend, wakeup 1
[   38.200368] usb usb1: usb wakeup-resume
[   38.204982] usb usb1: usb auto-resume
[   38.209376] hub 1-0:1.0: hub_resume
[   38.213676] usb usb1-port1: status 0101 change 0001
[   38.321552] hub 1-0:1.0: state 7 ports 1 chg 0002 evt 0000
[   38.327978] usb usb1-port1: status 0101, change 0000, 12 Mb/s
[   38.457429] usb 1-1: new high-speed USB device number 3 using ci_hdrc

To fix the issue, add delay after usb_hub_set_port_power(). So port change
bit will be fixed to the final state and usb_clear_port_feature() can
correctly clear it after this period. This will also avoid usb runtime
suspend routine to run because usb_autopm_put_interface() not run yet.

Fixes: f061f43d7418 ("usb: hub: port: add sysfs entry to switch port power")
Cc: stable@kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/core/port.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index f54198171b6a..a47df5d32f7c 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -141,6 +141,7 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
 		usb_disconnect(&port_dev->child);
 
 	rc = usb_hub_set_port_power(hdev, hub, port1, !disabled);
+	msleep(2 * hub_power_on_good_delay(hub));
 
 	if (disabled) {
 		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
-- 
2.34.1


