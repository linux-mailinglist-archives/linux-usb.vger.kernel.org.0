Return-Path: <linux-usb+bounces-33971-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHURJJkZqGmgnwAAu9opvQ
	(envelope-from <linux-usb+bounces-33971-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:38:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079D1FF19E
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 12:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18855304951F
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 11:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782653537E8;
	Wed,  4 Mar 2026 11:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bMrzTd98"
X-Original-To: linux-usb@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011061.outbound.protection.outlook.com [40.107.130.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100C3537FB;
	Wed,  4 Mar 2026 11:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624250; cv=fail; b=LCkFSNQST2kImxcq6IIcSAc4JvPplrxipJwfWyXb0SqEmEe/B/8J/lvqg5RZEAJauUSrHQ0TjRcKCn0JFou6OUtV8PpyCOC3J+4Txv6EPNn4KhbxsH3L0WeaYECytqWfPIqYTdCSsPWD39ij2biTgUTaKM+T7o+OxA9iA9/upXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624250; c=relaxed/simple;
	bh=wobOHRFc1ubppAXe6M1GTUmSJXZssWt4NfUNCTx9+nI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HSp1zqLCHxQW/sV3LIUtutWbbDEb9SrMhKSlZ3XYHCWJddRcdM4GQnQSWZK/evjyqrTUDqsyVXU52ItUptvsYQbOLholCU/j4eRrxslyyuybkVZc0e+drQ/V3Xuq5I/2IDrxhXS34R8OFYfbO+yNrI0PBiAsN+S9rjIH4yN3iJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bMrzTd98; arc=fail smtp.client-ip=40.107.130.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlf3ig3wMbanFc6R6cKVQ7kb98mIwxi+1qLOyQhTs+BFkGV780/PWTFYXR5Ng7DoFDhcbitDE05rVs6qq6jWcvT4XP05Y2UERC37wTs/d7t699IB/Ndtc0ulLnYuWQrv4oe8Z6qgsrEw+iDWPmF0VcI0sjdqRDBsJ8234h57ySQ6jhdimsowk5WsfulhzQfFsyah8YPSMG8/Z3T6lbPPgs4uZJhVNWrZJe1HUinVpTRjrdcK+If4R7lIItp1wMlawFNeZ71EifZI4Mii8fWPQe4HqQtp8B+Bbvb7yx+CZ5+ibMwBqx0Ntkv7k6EOVLDAYU/IbZb2QkVnI7dubCMtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jq5QwCCDwOg8rmKhl6n7Wlnag5itzRNs4EmCyP41MA8=;
 b=ZqdIpbx1mwFMTosei+cx+W9T7NzC434YraD3eM71v4cYYa1bUEYeLSVrQ9lpP2+JhPOgSD936B0Li4Ckdu4+nV0ualzjVUsYbAeuqDUnkQmAto8P5bLFQaUBlgbgF3WFgz+XHBkeZBur1emy/QAKR63pff2wT8KmS5989VyOsOuwrFtlFcJinmFktrxQVlGk5hFkq7iDtrNul0zr5wtW3CpwyuJr0JCGxSV3wAjD60okMc6NiQi+fXa+dFmLcqa/sdz06WU7hXv9HdwOFKKqz78lGIC+uAnuyNdDD88Ia2loJ1Kx7QtmOCZ0frPjz5twOUAnR3CWZbD7Ldh+g5XPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jq5QwCCDwOg8rmKhl6n7Wlnag5itzRNs4EmCyP41MA8=;
 b=bMrzTd98beVBfh82Msj/WYHMXM5o4p9zqAnM2kT4qmR7rvTyMllLbELMKBdf31GLR4BpYnuH37EDuwrkErP/AO7vQNdMGi/SW2AoV3C9oHR7W2LocyMQ8Bb3ky7XbTBLfFbaFroZCVfqRm7u1/AZz6sMO7a5xIXFDoi5LSotphQjyK9aUxhXfN/HpR35BMO7MOxQzD4NwmanncJE6m0pu//GT+S7k1HcSgc8mR3oN9XGC1eNB/UaGUUjAMpCdqyxcbTFz/UUIzPW3wXswPvgxHlCzJaJbVT2BULJVs896cXFyQxIG+zt7fjLkxsWR1YvFA4fuPAT4lRZd0Ze7Ic8yA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by AM9PR04MB7588.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 11:37:26 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 11:37:26 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] usb: dwc3: fix a kernel-doc issue
Date: Wed,  4 Mar 2026 19:39:15 +0800
Message-Id: <20260304113916.856841-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|AM9PR04MB7588:EE_
X-MS-Office365-Filtering-Correlation-Id: d49b22f1-fcfd-4f76-550a-08de79e268ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	xk9K2i0ctpLlfGiJPQ2MmRmWJkm+INAGDZQfply529mp8rCFpk17kOFFpMeHdaMJCTR+R8eyPaTvd60YmqSHomC35fk+vdLOqEP5E5wVPjkS1ec/6M/O4rRlptJT0kRY6T7vX15pVYQc0lDoiedwMju+anBmbuH6AJaXio7qTPjs5EKzIxsqRNtAV3yXiJA1g9CEhbb9G1C8z2ewyMxGScjULoZtReDGrUXUKUR5G7zyTbfeO1VnjGNR4eIjgmzXAorp2vtTFWnLknMzZ2YJ2En0ffBZGommHMiExiWgzmgishuo1rXhK38RNbRed0lU8EDtvz3Bw/CP6TjAtKDyQj4qsZr58J82v+gpW6z2IQ78fh5LGyONVvKoFUArLKAd/TBt2Qcx7yWZkeX6EThHloq6qwauyzBgf2Qqp5V9QLHuh4RQzO8Lew0Vm9X2x0ev0522zbuEoLXVIi5yLdFe7iLMM14m0bjxP9TnexnYU8aQ4dbQrFXEJIT44H/6EmaSS21dA4eaDIWa6Zj6S2oxgJDSzyT7JC4FnoxAmvZcsrIiZDXmyTe3tF3JUoMPT6j7qz/OcCLqgIRwZVfXj9x3Tr/ugAGEKNMO26fG/u3I+2ixQO/hb5MOCbKdUeXve0l1Fq7iy4CA7TSMBwiEusvk5IohTmfe9B73SPi1zoEKDE/s8+Q9LFYivGRyn6wdIHg2mqIWbg5cNJQwirhDCcsA+QkdEtwVSdi3IfS621c/+XFdcGzHpGRag8pYbs371ZJ1NdLZyYl0TBOUtjmCBS5ghF27q544g8GCnR2imRM9Li8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OXiZatGij27cEuer0actrH5Phbn1di+CU6IXuLst2dGek7dS8KDw0J/Nudw+?=
 =?us-ascii?Q?og2xqvk6IYFcysiH3B3W7y/o3Jng44plZG21uywrDtmirPNyTiBXQRUEZM6V?=
 =?us-ascii?Q?DLDu7ktIlRjTSu0+Lp5yY3Lh9uGa28qWPx0yuvhTjiGt+tESRipQN5EFFKV8?=
 =?us-ascii?Q?0FwbIKlLfNRlhfPYV1uNlTpfKQxx3EiB7pVzyQY23TcpkRErE9RrPPCFwQaZ?=
 =?us-ascii?Q?/cYusaTEvwz0dR4VXCisnjcDkmAfd6ND6JcIR77j6KgoqGTlfYPg2Ms3xkXY?=
 =?us-ascii?Q?od77GwcUwFQU0JucSqJSBSdPV4YTJP6jh81HafpB5TUdYKyZhEaHjDOMzr7e?=
 =?us-ascii?Q?Z6cwA2k2K/PKYqOSOCs8hSR4ZC56seCyK1OfCrIddaF8d3M6P6aMwm17pncx?=
 =?us-ascii?Q?l6yzvyQ55hh8UNxy2gBkZU698h+gMCsWd6Ynoe7Ut9LPLfj6kvwm71G8oe3S?=
 =?us-ascii?Q?W8YdB3Md4p//IU7eXL/7jh7ZxUWAgmm1lIOhdIPk/0wk6q7W1nNwsIrs4Ly3?=
 =?us-ascii?Q?wmaPuR8iTKFgJfGgYbmEaWb7Os80GhQpI+VnABCxDpqkXOwnUPYLT9DgzzU/?=
 =?us-ascii?Q?SL/Ew6EDGbcwS4/wjTGWua+V4mrCMjzQJJrcvyhKNGs+5r7dz+icO9uKvOvK?=
 =?us-ascii?Q?j0apMMplxpvjdzeIUo41t8xexqpJFU5PM7K2hfkVPrBKj3UoTUXOxLry8s3/?=
 =?us-ascii?Q?8QPSy+jk9sNn/A1OeAJvXH1vu3cQCkz2doy3/R5anrGL7UnrYDASrGoF2ou5?=
 =?us-ascii?Q?1w1fyaj9b+4OjFTG7Ldewv8avsCLVoBN5Qo7ENa22xkKLb2vmzDVKJu1/Gs+?=
 =?us-ascii?Q?oK0AhUfvJjUcSuqF+qHhSetEC/LfDT3DBdo1Zy8tKVkW26/Gw5pUIsOMUEO2?=
 =?us-ascii?Q?WNe62mdTJAlnZ3f8pzRirV8yGwypi91svmGLXtixdlfA2aH7T4dMckZlIF+r?=
 =?us-ascii?Q?Bl5PvFrlSsjl5K7bYFU2NDOS8Liibi+Xrwqi9xzBODrmzFrKGrVNLq3l49de?=
 =?us-ascii?Q?6oLV2bJdNj9qXg8Dh3aD0ZCFq0PYCh6EZrmVtxl2SLhqvxjKnrRDFwh5p7Ex?=
 =?us-ascii?Q?d8Ae6rJ/LxJ1d3jnYWD7CK/b9jW3XS0HIySgyesG3i0fF1l86AhrsM/RdHJ7?=
 =?us-ascii?Q?2bQkdmFpTWrTl1+2Llv2aP4hxvO/ejb7XvB87+jV+BUbvjTh+sr9m7cs/pHL?=
 =?us-ascii?Q?WOjjWfZ7XGbZ+vRNpa5273N2uPLHTvdS3xYwE2gLcP1OCTScpTNFrIJuTbGl?=
 =?us-ascii?Q?ZAbThJ3LaPw8VLDegH4gKGgytrEaLDSmoeO2AMIBsuUxX6ucC+nQ2lZVCAUP?=
 =?us-ascii?Q?rSn3wYQESgdqIKr5cqBjKSPQ4rI9EoQ7NPrTF7Qh2VDipQFZe0W2IlJohjM4?=
 =?us-ascii?Q?8/VwqeuEs1/A4FNffshfXkxK2EaSAB7cTZBt49XbFtvHhnMrlbxzMr1zAuxd?=
 =?us-ascii?Q?UEX4U4HAjsZtXSr+Q8X6cleEMB95/p3/e/eKQHT0nGcTOhrHuCaAxru+FSc2?=
 =?us-ascii?Q?4LpVC7D0rkAHLHICg5HaZQwXzPmWseSjicQJjlIz7dBxVoYdbIvgaLzy5ZGp?=
 =?us-ascii?Q?jeMG0AyRpAlQkU0IwinpquOkgiROcxUNlCz3kwypwi9pHpySC2zOfnMg97GR?=
 =?us-ascii?Q?zXXBK2VKhhYFdYsefcjgQGnC0BcBhZWoo9ScA1jqrjq1aV6hGa/sj0ZJKHgr?=
 =?us-ascii?Q?MjdA0ehI/YWFGFaFtHufX3FTWrkA0QPHUP7cL2TuSlqp/d8jpLTqAdi87C1d?=
 =?us-ascii?Q?zN5mBoC2rQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49b22f1-fcfd-4f76-550a-08de79e268ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:37:26.6486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2563ROJasq/B17qZLEC0lPZsCNS3HzJLKAZsuK6rr4MOxGpK42cZAErOv9FUosVr6cZR4cO+maKa2rXG9EZRjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7588
X-Rspamd-Queue-Id: 0079D1FF19E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33971-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

Add '*' to needs_full_reinit comment line to fix a kernel-doc issue.

Fixes: a717321ad7c4 ("usb: dwc3: add needs_full_reinit flag")
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Change in v2:
 - improve the commit message
 - add fix tag
---
 drivers/usb/dwc3/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 67bcc8dccc89..7adb8e74bd84 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1120,7 +1120,7 @@ struct dwc3_glue_ops {
  * @usb2_lpm_disable: set to disable usb2 lpm for host
  * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
  * @needs_full_reinit: set to indicate the core may lose power and need full
-			initialization during system pm
+ *			initialization during system pm
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
-- 
2.34.1


