Return-Path: <linux-usb+bounces-33895-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P4MOW1EpmlyNQAAu9opvQ
	(envelope-from <linux-usb+bounces-33895-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 03:16:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE21E7EBD
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 03:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A9E130B2B91
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 02:14:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4903750B5;
	Tue,  3 Mar 2026 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fhyApiL3"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AB330B0B;
	Tue,  3 Mar 2026 02:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504056; cv=fail; b=p+htoxUlM+fepJZZFURCFn7N1hbuQbfTAi5IujvWJJQvH9TZ5MeM7BtMhwreP/axbaV7yh/bljhbFYbdJIejvz7sahLUGPbJ0RzMHXnLoMc2UvD7P/vL93gjIn0s8iJKCZ4ypjH+E9v/3sA2KIRSh4JDhqh0lP29vZEpOTmXksM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504056; c=relaxed/simple;
	bh=mtOHrwdc1zCJHfI5qZwE3fvelvuknUN8ImFXMPTf3CQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QH6cRGfklb3mYjhuTf1Ou4L8Vowgs0RrvYlzsJO7sdEo48CgEwoS6ny5s9MPnY9xysjqfuCzLe18fwUrr/qfTrimOTfydbT9LNnST0xrD7jm3k8+cpyN6zFh2osmEb4xbD6XS4IkDOiGaYKvO4wo89v9KLGK6akD523bYq1mOJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fhyApiL3; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jU9hvWh2re/vlviJfnzXEJEcpd2yYCljbU5z0nsKKO/cq4UC0ZBgUhxUUcDpUpHXk+SZW3puANO+hNpv2Ng/V2Nna9fgZ6T4zWs1kIp0e3vTgogBJ5KFHFYts76MkrB5BMnKnGVIVlKaNgxQxfDYdl3BzMLuRLSmp7tx9O9Fvq0NMacHIdbF+/D/Xc2uASxeavJZNmXn5RHHcbJa59wLLeIOgt0SPEWq4xUVC+13ZmR1TNxOXGqQtVjSpATO9qhP9s9+083DNltdNmi6dnzGX+jhwQzu3CHj6dAV9jOxx9aSop2b8U1qclw8jMnuYXSlV9doh2j3o1WG42I+srBcdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E63S9n7tj2UfrtnM4dxCuqcB4A4CoMKH4wK649gCu5E=;
 b=V13IBMmfJuUZIEHOVqxB90FopYVzczSB0dukCjuHI1bJ8+eXXCMBZGzHNXcc1x18howdPHbHkuL91M66S127mJyC89cia/VTvI+ys+XBzzcCJwfNmMXSGs3IIlMYb5I4/HnuRWkP9If98X/kgFp4vMh0vQQQw/s9sD97RevgnIxFlih3YVkF4BA8zoDbVqKbTwrT1kgzPYz9wsxHFUr6D+2PdFqLJp6yg3SRV4CbeTv7+oErkhnxeW3Enuw+wZA63rZ1b0m1xHUPqNklGOkiLh+js7WFLHXPi2rMH8FyYOccvaPZfly4/4n7jV2IUUfFCnFFl9yfLigaU9eqCqA3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E63S9n7tj2UfrtnM4dxCuqcB4A4CoMKH4wK649gCu5E=;
 b=fhyApiL3VaBaXUcH+g6IysBBFyrpbxt8ZB8kya5gqhnHufvIOYxtI0r4CK7zARQLdOWyeoyhWIUf68oaRM1gppvDM8mBjAeFvl8/bEadAnxnl2eKQ8qB/OEwVRBuzphXsHK/iDXtF4hwz+dKYJHYoSZLnaVhuHpoVO5fXOiOzU0x87yOHgBFHG56WIVUi4BKHWNgh86/fQ9MsrNwZGeJGEt0RKQRHN6uu3P+SvztMSOMJfdcz02agY/7VKbWrp3wMjSGT6NSIBXPb8NWbYNPTeqvldAtMwnHkUo/yUJf/9gPnA6xksBez5pgrR5OTnno81zjCLG/WIuCYF9qecwVAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PA4PR04MB7807.eurprd04.prod.outlook.com (2603:10a6:102:b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 02:14:12 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 02:14:12 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] usb: dwc3: add '*'  for @needs_full_reinit comment
Date: Tue,  3 Mar 2026 10:15:58 +0800
Message-Id: <20260303021559.4021177-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PA4PR04MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 578b16cb-9b82-4825-7f53-08de78ca8f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	OcYTol43YoF3CovXDZ60yfsgQBeO8f87AA8h450iSoLcw7V2CeZJo+Pod7NrJvjPgDtFa6Rh2Vk+ISvfuxiBFikwpdE2rtRbLLkunTxeXUEYGWDZkFgIF7L272WH3lRzzcHbUnB/dWhXDp2wpVPc95BLUKxtenrQFZuM5OGy1whHJGEfeC8NjjZGfIwRjkIAY32/71XFKdGgUBgHWW89MVC3TE+DKGpvXiGsSq3/0q/FyMHHsw78U3hLjskOiyq0dZeYkQ/Qm6+rph3SC8sDfQTi5L1rr/EWephgOt/6VYsKc2IkpwUwVCbGEu5n46B+sgAO1D4+ZyoSDe4lvxxAczyZEJpYWf98+Uxzfvz8GtQ6+W27DNwb4Ne/cUmg3agwnNwOlthdTcVqbxml/lPGNKXQF7oyZuRZYqxtxjkpuSehEcMcQ7uryLTM2BNF4Ba40Fcp49zgScLp12+38FsUwK1VxKV26VNfyUurDxCH2JVaqFmLLZC1s21gAnt3JMkiHANBvBFUsvfsnsod1z5uNPbYgeneAnp+gwgh2r5sDnnsTj2O9e4vYd738WIcVO432HxKKLKxrlVq8EsTKZIX13tyRT5WXqb1YGR1a3ImTkbqLtUy+6ygQMUUMqnQeB65ozmw0rGnUwmGPyvj2NPFMXhyP/T4iEUnAQ7iENnuak2npTepgIlkSKcfLtgmWHdOiL+M4YB6hCdywRtUa7JO0N9JoisEqxjMuJQVOZKlYXW3oXVK6/TnafSjHEe0XZa8mu9ESBaxlDzhSp2yGj8Stay63ys0EGsiIZOj5b/LjQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Atvf8M5mnZQn7CO4K+4m8Ve2ugMRMdCKAojaQ3kWr7Gni1or9ghIF5LBjKWl?=
 =?us-ascii?Q?m5o4d6nyIevu7DR+z0Z5Dp1XA4efwCSvKWJw3q4aK5wQFhdPQ/1Akfind+n4?=
 =?us-ascii?Q?GEcwW22X5aZ6GdewdgEykhJf0h2lsaQOpCSXL3HNNTfd0eY5ORL9ED1n8A5p?=
 =?us-ascii?Q?8GOCAVc//0t4OKMGwAztPvmVOPDwkVBVflLtzcx5IVoITlpkv5ciaNU/Z7F/?=
 =?us-ascii?Q?09IKGumlEHwOu3zYChEBjPMu4qGJsaKGxqJ9pukQu6HeJKT98x6aPXaUVx0q?=
 =?us-ascii?Q?txo9dO5rdrqaV7D9OMqqWZCqeTIU/yCMS51cQHyj96vwyaT2MOyteDEP+oez?=
 =?us-ascii?Q?LmE57+T3PVRrYfj2WGN/d20Q5zzibK0BhotGQJrkada2GntHsU7dRVx44Pja?=
 =?us-ascii?Q?770JJbvmpEe5jOKuWlfSb1RoJDtPCX5q2aj2AZlfKLi3hLMMXJcxCYd1xbIa?=
 =?us-ascii?Q?A+oQBCDd7Sef4WFtvZex2VYEzuHciO8IGtCs5gynsIJ7qwb5lelRFDDtk0wy?=
 =?us-ascii?Q?gVmgawoo8hJbZMsOPavaxQb760AX7TlHaW7Jjr5HxOFMsf7/Ck+fOJD2zb7V?=
 =?us-ascii?Q?yNoV1DtEPRbb58wrVcgfdzitilt3YEw2qwnGWOomX+BQ+bVbi0o/m115V7MY?=
 =?us-ascii?Q?QUfim7y1Kw84Addl/1U/i8zmKUfpP+ZyRsTPmdK4Wkf47pHdi/9doNxBEa8B?=
 =?us-ascii?Q?FGRSIjzT2nDFpy5JQIWxaH2YnbsOzm7H+ptRP3TyD85fiQTsZfawtfCBhehu?=
 =?us-ascii?Q?KzhVR2MwaDq1A3sp8aOK+6xYnE3oQhGvjoZmWicW6d2rmP8cSgURDQuGGwab?=
 =?us-ascii?Q?Om2s4dMpmXEsMQJejRHs4L7e9yjBsrTAm7YpMo71hKv8Z/vqjFhdLyjlqJTg?=
 =?us-ascii?Q?165wAWBzMeDMLdsdxWs6yuVe0NXV4GGjWVUaEfdUlfjFnxXURq78jcqAI3/w?=
 =?us-ascii?Q?jvd53YL1RGszvxfLCwUPMv5E/55Rz6bbVUJAbIRT4bzhBNLizQj549mebhwO?=
 =?us-ascii?Q?afWihKeKfjFfqqUWrbcsjKrkCJGgexPGS0TmpVQNDu9bjpqjt1/UEHzXc8Li?=
 =?us-ascii?Q?lWJUBG6e20+CUhpZ0KkfH8NZnuSVZVVN1th9rF9y3isLbGyOl5twa8QkVmDc?=
 =?us-ascii?Q?0EOA/iIInyCMWKzBsSEYpeV7jzyMs01zeR6NjG6PMnrobzlHX/3yPkpACPf4?=
 =?us-ascii?Q?RibHfGsVRMyXCMymMrHciPnL+2GFfYTnCLEXlu/gWhsv/bKSnUUS1e+iCJzZ?=
 =?us-ascii?Q?O+mByLwdS/WIKA/n2QcjXNS3U4DztMHDeYF/XpdKsANSA07JirK4nJ8XFSrx?=
 =?us-ascii?Q?fbBjZtLdqHt40kyOYB/6MaDpTPtGcQ8ambK3iGak0SJgvc763X/ZYz8xcLF8?=
 =?us-ascii?Q?/zlbylAKvYp7nplJ6t7GlFAGvTNmscudfdAwL2iJQyFliahaZAHerzvL7LDI?=
 =?us-ascii?Q?xPJYUcHQ9z0SzlniW/whlDipwih/zvYXASU2QcoDYhe1uIPRM/W9PFIyvDuT?=
 =?us-ascii?Q?+Z9TCt1OcsKbbW1/XrqAZe/H5CNjOXM5sRCfiTINbh//X7snphvlgw8vEWY/?=
 =?us-ascii?Q?4zL2RiB3MfxF82ql46MCHTzLLmUM2YfqS+V3ttbFXCBqwcxrGZRlUUy2jPtD?=
 =?us-ascii?Q?nGHL9/odp02e78cK0vDJT72n9gPnqvHtBegYM+4zASsgUlh9hh2Y+Ut3JHNu?=
 =?us-ascii?Q?hUCjkKQSQPzoQtFDB6SugUw7A5x4qiRRSv07x2w7Fk0D+boDGeFrikfAT8I7?=
 =?us-ascii?Q?3YSLAnmw0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 578b16cb-9b82-4825-7f53-08de78ca8f66
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 02:14:11.9686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCkcPpyckIyUp5Z16dq2LNV/1RJuO+4czRbv3fz8dVNwkvEMga0mU7ri0h3F5vUcbdqYoeaEYePB6tENmjXNYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7807
X-Rspamd-Queue-Id: 4CCE21E7EBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33895-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:dkim,nxp.com:email,nxp.com:mid]
X-Rspamd-Action: no action

Fix a comment codestyle of needs_full_reinit.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
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


