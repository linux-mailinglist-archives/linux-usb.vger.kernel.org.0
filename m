Return-Path: <linux-usb+bounces-36324-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOQ/MhOX5WmWlwEAu9opvQ
	(envelope-from <linux-usb+bounces-36324-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:01:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B3B4267A7
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 05:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F982300C902
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 03:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E236637E31A;
	Mon, 20 Apr 2026 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Yj8qFFc2"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0CF33EF;
	Mon, 20 Apr 2026 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776654092; cv=fail; b=Ox0vEmgCOZkTyeQmeM0DdqXIVN4Ka6JF7KnaPRuQLk9PaE+r9WTsPM9BiRBNyPLO+s01kRxlrsp/wkGEh5FzYuP0ai0mXNfPtFZcFGICQbs0LnhQnuhPFHucnH2dPI9l5AyaSg8eU6fTxsEAIBmM/NSRStOgEV4ECOuAGPZdUuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776654092; c=relaxed/simple;
	bh=/mH1wZWxXrO8AWfLTnyvkUzbnLGAiEznr57/k5PxWw8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HaSHHY+Z3IRFKarrCo1pSw6z+te3BwBDBVKRtSivDUYWIw0VqRHGXuYG31Tc7oVXw6Tqq5uFmSdezSAjXWyE7zSfc1ZyZdpFXymUoIAQmwM3iBFN1GlR7JM84xQM0M7J3Ib3KrEofKwQKgJis5qaH3+nRU56nqufgt9XIU3mf5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Yj8qFFc2; arc=fail smtp.client-ip=52.101.83.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFVvDm6DpxiyI8AKWRO+BGMF3vnrRndP6SOZDbmePJoBJjXUNEON/U7w39vLzNCrkIcnIZurG8mWH6J+FppKwolVgZWgRKu1q/AWIskhN/ACHMm/sP5U8DDbw9rkrqthp8Wund+e5nUwJSRvwcOkGNqi61HvLQ0/Vg7C4zHJovEFTZOZY5nmESR9QBuOgfYGXjxA9LbggDFjqVbe4vBLAnzW7eS7YYshmWGpjuncSg20juaNmS2ZBIg0BzJxjh3ZfqvjHhsYcZD8/mghhVKRMLxxR3+IDc9uZDBl+WadinOUdS5V2qV+hNsHLhl2jJMNQ4d4DRXAeh5H9oaQKbxKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z30w6FQ6F4qFXSu1zZBMRK/imvQiSK7cCEqeII1EWQ=;
 b=qJxb/+EFL9LRzzZTkSPDGjUZinEXrs2gpIE3Z26t/XnYKGK6+bawF+dLbIK0PhJw8b5hsBH8n36Y9QYPK98V/fxYRCttFNzWDg3oGLQYxudqodEWWNMludEnvhxH6NW80ayPyBBRXmUwkkasy1oyYEQpGPfH/5O5jYgF3tDZx3gEaWRg6Fl4vuTB6B/J42cDBJFAVD8STauMiTRvtmNS5+LbirZZ5WkhL0UCHXlyVYEdt+ROHSytt9S1kfsj8DuJMnYKBaFG7NQ2vV9C+yjAaesgmhbMhQCyU8ctL5KGUBNaXvn9DN6Tg5jQGKvTFg1YkCjU9xmlkYI+XSeVdx2cQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z30w6FQ6F4qFXSu1zZBMRK/imvQiSK7cCEqeII1EWQ=;
 b=Yj8qFFc2eb3gsJgOtlX4YeziosfZLzzD4pJL/CU+pYI+f0mwNpQJEIynpoGhlDsfgnkNnvDA+68Fm+S9VLv/psCQY07IFV8tefFeiYLK3sF5yEm+jLkWXpD3LOJrQ03cMEK/MRJ/y6dBkA51RBzy+phL6e4+DtMoeb9zk7y3LZxHoN5MDteNhe21pRK6kiDcotz88Nucp0cGQQvPL313bC/QSIC6Uy1agKVUnb/fr+ByqlDrxdOe/Nt/jkPZyzHpckWICLe+Y8LOPWKIFJsYe8oZMF9e7wm/6QJ/lIytf9/CEzONU4R3wsKvxFmGtrNRAxn+CZxeWqeKPqLaBgMQJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.31; Mon, 20 Apr
 2026 03:01:27 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9818.032; Mon, 20 Apr 2026
 03:01:27 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	m.grzeschik@pengutronix.de
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpm: fix debug accessory mode detection for sink ports
Date: Mon, 20 Apr 2026 11:03:17 +0800
Message-Id: <20260420030317.425022-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: b8318dbc-73d1-431f-c3f9-08de9e891d4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|52116014|1800799024|38350700014|56012099003|18092099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	NBiIpFvx5J/kRlZ7hs+Wskv9HMTDmzutmUu4z8YFZwRu3c61/ko4V/gQzdq7RMqbeJyhpjsuK5Mgg/Z8ukx1xba/2J5PGyDS8YhxoC3USXSkWek+KcFMnbSO3wRm0IO0Ck/XUlrVGShaKbrgkh8GyNbLLEhhzEtYJLy7np8S3b9aXLazoXmsuHtlH7uS3HYWXNcbPIKXR65ga97uIk3vO9WV7aD9G83Pv9DM8y+vx3gH4EtSKIbbbBazt+lK8VD+8XoUVtEMB+YfeoB6xAqIRyTrM+960X4zmU2fG80DNphbVg4wF0+6VOcjsxYOA/6Sgu05P9F6o/pVZstd3BVQ05vlGMt5i4RCHquh4L4TUfkkbfIB/Nt1A3rSgJYO6Sic/81xqT2sg/QtzAUy0cEuOwzqRJB5Y+CZzQ3qq1/KoMRb/Cz8uJwqI5hH9DsdFyPgOkDK6L1dQ6/URl4BPssnH5NiybifjLEve7Uns/wTGqxF1uag3mIs1zN5Iqmmz/oBlxaTy9XEy+KkhptQMmOeCXuVn7thZ1hG2OzXwACg3NlWdFsTAv2neBGXnzta0vnkAJEAN7nrR9BPp2lycFpNaKTUtpNEXWo72C0NZQHAGqOuRWz8gS6Eu9xO+EB4bslJqsdxLByGgMbxub8nr26RVzIPPU2usZXj+Y/JkYZDsCwEiTRgXARzf0wZxSFjM5aKkFV6UWqvm9Yi8cckFY56Tnj9W+nfVN6xhQjqQGwj+GSE+aBn0amuVrItLpYyLbd4z/Co5n/AlYOwNwPSKQPEz35gX6ibyZFrlMp53GWzn7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(52116014)(1800799024)(38350700014)(56012099003)(18092099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a5lHR6Tsie04G859D1pJuxDrLHpz5ILqQN554Gq8EiENBq9YF/hywTJdnxLs?=
 =?us-ascii?Q?04ybkP+L4azfz/tjk3jXSRqm734oFQY/OHw3Oe+8P5kcuopTl89oKXWnA53p?=
 =?us-ascii?Q?CW2kuBybrqkjwPqe2NNOWlHcw+UA8OYmDtB9ZvcMmv4zVz/s/pjcPXzs3MQz?=
 =?us-ascii?Q?Mxq1Afai1sj+1wu50pF063bH75I0BXmxm3I3EsuKNGZ9n7/cHIX6P/XAay+o?=
 =?us-ascii?Q?XOwksQLPav/JG4b/d9cI7NuybKe++bLzQI/+JIk9Pfi4F1FwOpMJekdZ/cGi?=
 =?us-ascii?Q?RjFHQWhQXdAgxqUExO0K+uvHaz76VQ7rtXAOF8hTbbl7uvPvCiH/Hljnjbh7?=
 =?us-ascii?Q?kYNX8Mpj+JJ8YbkqQRTkE23uAuXrFd/7Wm9kIWz/wmcUrhk+7kEa1m8/pQTA?=
 =?us-ascii?Q?c4HAmeKYs7UCdMcWSVSwgyPzqpkpLFbixnJU/EbxVjR0wLb+HyJC7gxJ8tDI?=
 =?us-ascii?Q?vFf1DwzznPv+/KnW6AiWm10iNcZmmM8//beaYNshcL7GkpsKr3As0cWIEjiB?=
 =?us-ascii?Q?X2NfMBEFkVNVWdvGP784cEB3T/gM8h8Z1cooJFiG6eLQjfhjB7suHDBmIGc7?=
 =?us-ascii?Q?qST9Q0iVhWD257NbIm2ikRzTDkteCIo+WT315M4B7AkE2c3R43/zgg+BKiSJ?=
 =?us-ascii?Q?LAxm+4JwaLrX32d9cFLPQ/lxGtke2lfJe95nIDZY4mk+4JXm+aa8zZzaLXRM?=
 =?us-ascii?Q?n2a4Q72qSZq+tFtb0NxXCXpQ0qKMjtsmcp3vaazr/Y1+WOFuhuC2D+7zdAB4?=
 =?us-ascii?Q?+dcLNnHfccktGzQxB8UKxlnHC3NDE9slhGDY71hnCvABgAH7AU/lAGlb7Aw8?=
 =?us-ascii?Q?ds3gfsFNQX3yDnUC2auER96rLuixsH23waYpH+EEvulsmpqAs+H/xUurf9gY?=
 =?us-ascii?Q?MhQEDjPIFdeXx/CorkK7MQIqU4aZe/FKFhhNHRv8a/2iWerOlvhsF5zc11HW?=
 =?us-ascii?Q?hSCcAfrErUemZ2LXI4vzk8Jbtpcy3JF/o7nwIa8i3lpg1ATy2nIaSgUtggZW?=
 =?us-ascii?Q?xtxhYfNiYTWBWdM2h/oPERqDZ2fvXVi1920SBdOQDfL7yodCd7E6svYTxfrm?=
 =?us-ascii?Q?0ki62hyxfX1EGPC6yvB/q9+COrPVmihXZl4YxILWbnucf7ALaDLFLfQT7bNl?=
 =?us-ascii?Q?YV8xuq892Rle2AZSC6UTcpwJe8tiZlJwIRCH00CunXzgxbyid0G+apYtgEwV?=
 =?us-ascii?Q?3CElmqJCBTJ4RKXrX9KRgdxbNtkv7svRuRguhk6S2QRQe2peZrVHKbETh/oo?=
 =?us-ascii?Q?XPZObb0t0vU0Nz6/1WjJQOEY7KbWPlfwyXX7ja/CIYTAcB1vYPHD8Z5ZJnvT?=
 =?us-ascii?Q?nNmdOgfmQsaT/7WWpV2bEN0oB7nQ4enbGhxcxVAKWCnskiyLNEmrfyQ0g8Gu?=
 =?us-ascii?Q?DfbkhAK+Y3jRe710BkQ26C1ZRdkVkPxKn5s0BK6Gt3cQii5HFtn1j0n2nOEf?=
 =?us-ascii?Q?6RfRr9ACTBhtW2FQW358dUtIdm7OIchIhc1zjjE8BOFrNJZK/7ZizuhiTrK5?=
 =?us-ascii?Q?jppcBESCd+daa1SMXmGIcrFPWk+Da14CkncoSqPQrLSqxDpMWWLKS+BGHxoJ?=
 =?us-ascii?Q?oWiG5vcsj9IJhCuRN7IZM0iherh3JeiDs0zLAcSYjO5ihm5awmsj8zuUMnsB?=
 =?us-ascii?Q?AzvPV/bg5iMeA9yff1yTsThIZKh7g/hYpi5lYo3gKuA9Lee3LYIw+K93EuzK?=
 =?us-ascii?Q?SJk56H1edHYYntKXus0eG8qaz98WP4rSjc2DRS5+m81LUhL/UYMcRl7iuXeb?=
 =?us-ascii?Q?t6HiviHq2Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8318dbc-73d1-431f-c3f9-08de9e891d4d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 03:01:27.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lB7xxaYgZb6fGnIDUjw8J2vtc0rqV0klCMZeHUUJwY1HIB0zYNPnLt4QZNI9iEjvMwKuNBwN76bYi+VGi14g7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641
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
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-36324-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: 28B3B4267A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The port in debug accessory mode can be either a source or sink. The
previous tcpm_port_is_debug() function only checked for source port.

Commit 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into
accessory mode debug") changed the detection logic to support both roles,
but left some logic in _tcpm_cc_change() unchanged, This causes the state
machine to transition to an incorrect state when operating as a sink in
debug accessory mode. Log as below:

[  978.637541] CC1: 0 -> 5, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
[  978.637567] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
[  978.637596] pending state change SRC_ATTACH_WAIT -> DEBUG_ACC_ATTACHED @ 180 ms [rev1 NONE_AMS]
[  978.647098] CC1: 5 -> 0, CC2: 5 -> 5 [state SRC_ATTACH_WAIT, polarity 0, connected]
[  978.647115] state change SRC_ATTACH_WAIT -> SRC_ATTACH_WAIT [rev1 NONE_AMS]

It should go to SNK_ATTACH_WAIT instead of SRC_ATTACH_WAIT state.

To fix this, add tcpm_port_is_debug_source() and tcpm_port_is_debug_sink()
helper to explicitly identify the power mode in debug accessory mode.
Update the state transition logic in _tcpm_cc_change() to ensure the state
machine transitions comply with Type-C specification.

Fixes: 8db73e6a42b6 ("usb: typec: tcpm: allow sink (ufp) to toggle into accessory mode debug")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index dfbb94ddc98a..1ee00025de56 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -732,9 +732,14 @@ static const char * const pd_rev[] = {
 	 (tcpm_cc_is_source((port)->cc2) && \
 	  !tcpm_cc_is_source((port)->cc1)))
 
+#define tcpm_port_is_debug_source(port) \
+	(tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2))
+
+#define tcpm_port_is_debug_sink(port) \
+	(tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2))
+
 #define tcpm_port_is_debug(port) \
-	((tcpm_cc_is_source((port)->cc1) && tcpm_cc_is_source((port)->cc2)) || \
-	 (tcpm_cc_is_sink((port)->cc1) && tcpm_cc_is_sink((port)->cc2)))
+	(tcpm_port_is_debug_source(port) || tcpm_port_is_debug_sink(port))
 
 #define tcpm_port_is_audio(port) \
 	(tcpm_cc_is_audio((port)->cc1) && tcpm_cc_is_audio((port)->cc2))
@@ -6360,10 +6365,10 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 
 	switch (port->state) {
 	case TOGGLING:
-		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
+		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
 		    tcpm_port_is_source(port))
 			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
-		else if (tcpm_port_is_sink(port))
+		else if (tcpm_port_is_debug_sink(port) || tcpm_port_is_sink(port))
 			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
 	case CHECK_CONTAMINANT:
@@ -6371,9 +6376,11 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 		break;
 	case SRC_UNATTACHED:
 	case ACC_UNATTACHED:
-		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
+		if (tcpm_port_is_debug_source(port) || tcpm_port_is_audio(port) ||
 		    tcpm_port_is_source(port))
 			tcpm_set_state(port, SRC_ATTACH_WAIT, 0);
+		else if (tcpm_port_is_debug_sink(port))
+			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
 	case SRC_ATTACH_WAIT:
 		if (tcpm_port_is_disconnected(port) ||
@@ -6395,7 +6402,7 @@ static void _tcpm_cc_change(struct tcpm_port *port, enum typec_cc_status cc1,
 		}
 		break;
 	case SNK_UNATTACHED:
-		if (tcpm_port_is_debug(port) || tcpm_port_is_audio(port) ||
+		if (tcpm_port_is_debug_sink(port) || tcpm_port_is_audio(port) ||
 		    tcpm_port_is_sink(port))
 			tcpm_set_state(port, SNK_ATTACH_WAIT, 0);
 		break;
-- 
2.34.1


