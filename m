Return-Path: <linux-usb+bounces-34354-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OAUCI4kr2mzOgIAu9opvQ
	(envelope-from <linux-usb+bounces-34354-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 20:50:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA6240572
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 20:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6DC0E302F147
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 19:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFCE410D3E;
	Mon,  9 Mar 2026 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Shjo2m/T"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80405410D21;
	Mon,  9 Mar 2026 19:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085761; cv=fail; b=MOqgDXAjkLzMGpsKRy3QkXTCDq8LV/4y3glfPJnHcQzTnzTRVK59zYJiQXranNuxoYeX1iSoU6SvldlPhqFklC2XqjuiTiywg+qKKmUFuP+W9Xhb0pnHaU3nR2m+kEvwbAdqKMi/K8W0jG3kyORuvt6n7m4iYJxL+tie6hBHGWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085761; c=relaxed/simple;
	bh=94oEAh/E6gRJ8kw76pPPlUWBJ4/pfXjQ4qMxVRNyyUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jp2zkhiI4uQcGFg9gZJGlNLeiVsCZhmL/Nz8f2dlNEwH4lt4MmCJ/HPeBrQtrG3QCvHyawaEyr9hKynmvUqtb4YGm6D6lS0b2ZMbHLlBfmXcL24/guWYVK6hZbPGNX4+57nV2vOhS6+/9MAPNiXyHAG0UBzL26LPN63fJru+uPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Shjo2m/T; arc=fail smtp.client-ip=40.107.159.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9/ce5YvMKfpAAPQMuhOUn88AtMaBiLWdonHH/tqB96jMk846hPOWHran0q6aN8p8V7nHrEMwHhpLvWEKr3+S1JXNy+uxQZr8RcYRjXm3owPjq4p2Wv5n5tnM7xWde9WXFfh10WQKZJc2sazAWhn5CqqRST9wNHmsa1IG5BOXhurrCKOL17AaXNhkUFglH/PPdvqrT/bOD3J2bHKcEvVTD55oH8ceLdL9xhi4h9ZdFl72kb09xUWatxVyXZY9kbbPbodcULkI2+g8kp6pLOEty3EK/Ly4E8aW394NOhPhDtTxAdPkinFKLMX29Qn/OE20uAOehvCTB84p/OSV5lA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTQsyV+MSlkCmSj7HiXjZhnb5ZsiK3ZkGpNFCAJGbAU=;
 b=hQEx3ONAqJZ/Zs0oGklyoP9UDhQPEtEVY6V3I2X/r6gGCeZ3IrMum9fJKaNTe4f07d8Asjn8soZ7Z3gaGNseFyHm5yE8DQcFCmqT2A3JJaqY4GFaAii338XAu8b4/4/D4YZdY6a7iWqoh03xv/yfaMvajYdKwLLRBFzDyEQTP2McQAW1X7dkYvCot/VbCc0VB/TMT7rScYBHoPdky4JNqVrXdtWqqwYl4zLziYlJKlpzyw33XLNW84H428Ov59p6qIPexu2GIfsHefSs66yvS0KODNwk2uta2GDZkDtBTWvhdRGHBCBQeFpi5wwt0Fzsh6dWBobkN2DCau6/q8sM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTQsyV+MSlkCmSj7HiXjZhnb5ZsiK3ZkGpNFCAJGbAU=;
 b=Shjo2m/TfLyTE9dzsMNiCv+NlC/j6RvLArt1xjIxqHpC5k/STFGuNThMTP8xH3YLDRgLmo4gzTs35kBBUFI2m2SNKBxUWtD0cX2WudCcNCkR/DM49OhUtqdqm+DchrCxKJA6rOYeE99BI+Ggmw4GcrhIjo/uey47uoEMbsnCtDW15QZ9zfvhUrFy35USNHN4644y55oIMik8dlD3pOig1KCfpv6BhtBnVU9ttZen0ULu3QPK6JduRhkwN3vuQT08aQiXQ7BolsazB4QYuc3kszYKyeEVjXYN8dsHGgfjL7sprOp9YzalIqXmC5Uo2wA9fnC0cIulbLD1Kl5K3LwoyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS4PR04MB9289.eurprd04.prod.outlook.com (2603:10a6:20b:4e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 19:49:17 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 19:49:13 +0000
From: Frank Li <Frank.Li@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	arnaud.ferraris@collabora.com,
	dsimic@manjaro.org
Cc: Frank Li <frank.li@nxp.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: Re: [PATCH v2 2/2] usb: roles: get usb role switch from parent only for usb-b-connector
Date: Mon,  9 Mar 2026 15:48:59 -0400
Message-ID: <20260309194902.1785552-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309074313.2809867-3-xu.yang_2@nxp.com>
References: <20260309074313.2809867-3-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS4PR04MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: 83fdb6c3-91c8-4877-d7a8-08de7e14f07a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	46t93NqF04Xu9XnXHHlUj7WMZzM99nNXOW2Twyvfcfqv38DjB+lySzYy5vj1m43GVaL12gZP+8nP3OdokTaPgvZKY6W40pbTGsgvsq6FeuWKIaRHTqz8OW6ytK8ce323XAWMIeI9OJ2ur/Ke0CirHEhnsp/nA4kdiTiGhqBd37L445lW0I53oNbxdf5Dh433cuA8z4wi77wPDOL/UT2NQ1Jmom90Om0Q/DAtx0BZ74ke42bRbpy5x8IzbBeaiOrkZ1b6/bv1sqIsoOnqAcsYeAYBdBrXoNRAni6Yw6W5muaAYHfJIHvUqp5XRDJN1+BWjPiW3F9lmQnjxNAUme/Kt694+uLoiy45cjMK/fWITokQ3F5dImDmmzIGo11v4bm0de2bwruUDkFzXzypBez7U2POTTMaWh0UIo3uMQITDIomN3pprtqRJSvb5BSHIX1CG5PwhMlTKHDnBBtPo2Y4QqDBZLN6AD/gDJiOy8whaU/yElMhz6jCfaZurB0e3i8JqwHwATAR4tmPElaIc+9syMbevOBn2338ODrv7o8JLCIcGWH05JWpAFymDYNrKXxhg7Jpa/tHGZYpd8tDKoald9Rw0pS3TbRWWD7XTRlchoe/oQgrVxWv19zCu7oAj0MwZHwaG/0bv2Jhzs2/v+LcLI5IQyirqKDO0S1u4YwiIA2ECfg1Mvzjd7bAzQHKrNGM/pnlroFB+dlBWYCcx8Sp5hNf1yra9qETPlR8yoI7TwzVEm6cWGbcXLEheTkH+dJ9hOg5j64ZkX8WKO4jZ+chDudeYKD/gBd14MhZ1JRPoD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kOckctCqCi3206gJcsaSGLqufMe4UBXkuZgXZO5yOA8zooY3JUrVdiYh/o8h?=
 =?us-ascii?Q?NyQakxES/0/BUNsdNhKiaCBE6McZWe5TLRSEryo9DIUPcOe+RiPX9ehf1o1m?=
 =?us-ascii?Q?j0Peni1rTM/5VuIjl8rdp2/1oxNaYSgEx93mfINxH3OMRgjzzS+AR7d352pi?=
 =?us-ascii?Q?5QOUIxGlpH3F9olDwGMHnfZ31SGQJ1LKvsd89lKbIAUuR68mRGrZR1fbrsrw?=
 =?us-ascii?Q?6H4Z3bENh3DPf/nJEXAvl1KhnB+86LxO940GF+d/1vWwKnzqH8MnCvz8YoZ+?=
 =?us-ascii?Q?KzQvuPwWHmsG69nYfBKrUKU8wIlZj99S/YvR4ZGauKiEnTzkObLFR8RfvxUQ?=
 =?us-ascii?Q?ncszCKM2UaVochkBXo+2RTOta6/QmtMQ5Uy8URF7loZc0gftTaLBlYJXvZcU?=
 =?us-ascii?Q?JXVkHD9sITeV0U/74/BDwbvnbPvUxOSMP/DpTjGjUcoYKl6foU00mt13wyH4?=
 =?us-ascii?Q?ue6Txqiei09bc4lNLLBEF5EMTyq7jfTwfZ4o7ZIJreQz2xxbWnIxO++7Td+t?=
 =?us-ascii?Q?hhrVvK5NuaDQf5vW8y105rWM2zMg36ilGBaYLjYKL2puctzVQhegWFiLzsmP?=
 =?us-ascii?Q?VWTMBDlyOTtN5irQrvvg0h3p8OGOUyJx9VcQSgxPWYGiVTPs2/oUorM24PAM?=
 =?us-ascii?Q?QyXD+OisLWoXkQs018hxRD0Cyd1dlqLUnizyWwUoRrEdtLyvoGg0DYtgnhkl?=
 =?us-ascii?Q?ZlzCRiwtHc+QNrHZutWn3GRV2G+pJ3azfBzwdi5sCHjv6xFuhuy6pwY+Ns8K?=
 =?us-ascii?Q?SAnDXcp0u126TCXEDIuO6kphELb9ZZ2lSVzF3vlhbMRLHalX7G7PfPlVu0GF?=
 =?us-ascii?Q?ckzMg2VTmRVmnH8BVsv7pTZhCyPxhVM+XLPaHy0Aj9NbsNPMKLx9W98bp4Ti?=
 =?us-ascii?Q?2usXdCQ9z3WqBL1sIdgl31+dTo5trzCRZ50HNvJecyFG9T9jzM10Y3CeDIcG?=
 =?us-ascii?Q?hpsz2xOtubu2TFheTYpFWDR2CVB8Vt4NXnvFQciBoOSLBr79wW3oc8LatKjB?=
 =?us-ascii?Q?GQTRzS6/HFHsR2GGkUsVk46AWHH5jGrA/88Tp2//qo4jAVINNsj//BBfFx8Q?=
 =?us-ascii?Q?OJUeEwzLWow2s90+OOHkJAmPyxCCjijz0iqS10P/mHTDRz3wBW5W+/N/P3w4?=
 =?us-ascii?Q?venqB7kzlGz6gvCjhn8XWHf65wQ80AefBvc+GIavAFI85FuJF6AQnmNu22i3?=
 =?us-ascii?Q?bDyKYS1vkvE80yvuwK+PRjuG59Lo9NbsxAFhEPJDY83sNf39R7xRY+tPMIM5?=
 =?us-ascii?Q?/0vf9mEdmG9M+vyVnrCx2tT4hxetPCG2gSFTVgMUTEw54EvXDZxMmnLZmVKQ?=
 =?us-ascii?Q?8PzD03MhSyD/aptjUYjOe4tqgW3JtJywPKT2fq+EO6XlSNlywaqx9kaoQLdR?=
 =?us-ascii?Q?zq2G0SDiR242cO0Mp2A1yje89OJymqdoTeRgNU3lf/4MUul4707lrKLr58N+?=
 =?us-ascii?Q?catetqBL13kFic4p5keAKO1Tqaa6AVcksn+Y1rtMkr2KYL+Yaommpb1PVe1V?=
 =?us-ascii?Q?U03T53DS0QpnWddoEP+CGsHPZemKe7+7XLn9VzUjdamWepCa9v2hihy8f+Va?=
 =?us-ascii?Q?CXDJAz8Zs0Ua4MWDVeoVVMCaVZl+83YZm5aQv9HKtasWMcwebapLy8CgHcSh?=
 =?us-ascii?Q?AD8zPUQu1OYVOPP7WaYeJN4lokZs7oqZTkZOTp4K4oif7Ha/ijoRn9L4tPkx?=
 =?us-ascii?Q?b0Z8kblxsq3yCguvRG47IuVb+xECdchyNWZNHsLCBiIYFv/i9/jscZG/o2Ud?=
 =?us-ascii?Q?2L172JZ4vQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83fdb6c3-91c8-4877-d7a8-08de7e14f07a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 19:49:13.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yLw7lMe9oRN4LlpF0nq0+lrPS5XYJNc72FgpozpXe4yQ6fz2YotVt59J5eiXgWEKoU3w9WBrRkRZcgcNpFZ1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9289
X-Rspamd-Queue-Id: B2FA6240572
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34354-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

From: Frank Li (AI-BOT) <frank.li@nxp.com>

> if (!fwnode_device_is_compatible(fwnode, "usb-b-connector"))
> 		return NULL;

AI: Nit: inconsistent indentation. Should use a single tab, not two spaces.
Use '\t' for the return statement to match kernel style.

> 	parent = fwnode_get_parent(fwnode);
>
> 	if (!fwnode_property_present(parent, "usb-role-switch")) {

AI: Missing NULL check on parent before passing to fwnode_property_present().
If fwnode_get_parent() returns NULL, the next call will dereference it.
Add: if (!parent) return NULL;

Frank

