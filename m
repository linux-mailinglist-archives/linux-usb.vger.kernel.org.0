Return-Path: <linux-usb+bounces-34263-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CkGKq95rmmPFAIAu9opvQ
	(envelope-from <linux-usb+bounces-34263-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:41:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC62234E61
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F30A302159B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 07:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE459368956;
	Mon,  9 Mar 2026 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rv5VovDj"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1663D36894F;
	Mon,  9 Mar 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042089; cv=fail; b=OlCfnEYgfXEMBEstxx6lP8Bx2jIqvLTuQBFCB5LOJLQOfB6qxYCFxmTkfRXWquPvSZ6bw5aI08XWNuhJjTvsQYwvzEuDMsFNCTprrCN75volN31CJXT6i/FBUmBWox2xYcpPEIOmWVwHNyjDsp9cVvDr9mwJQ9axH5aK0LBmb4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042089; c=relaxed/simple;
	bh=Czd4/fqRYky2GJCrLdCGU1n5GyDuET6L5swwtc8PN/M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mLKO+xcLrYQHnAdMLSnvLF5Vdz/RLsQ43krfDPfoBml5H8INyg2QLhf2DIA4JWhewkMtCAlGZ6ka/7cQJvlVIyDxJhw6WdS3sZZatZtJ5y8PVeQATPzeLo8O6m7fs7gMgrO0qwi3soCNcDZ1yJ8TDNJfIoSRiUInhtdXJY2NUNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rv5VovDj; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJlHiRamstupD0gACJfHSigOi71x/V2St3Gro7AzqVuSK8opwoU/QDH+p2dCt2M8RnvrUHZuX9sqj/1dvrSZRJs+5izgvSie6Dn3oHbD6OFhmyVvLSdZMK31VA4CEiBkP3cTC5inqVPP3puUlaqu1GZbpBM99fU2J8f9VKeFSgvsTQuTUyMZLn1znrWO7sc9bQVlspcLC50U78KDCmRBXHoxz2oG6iwR9deFVpiplo9+cvJzDdfZ5C11BeCLLwwKOizD3gyE+Qb/577ULJQM6zi1Xc2i7zB/WYFqUAlOQrzisvcvYGAP+ISQyB8TnSFozbsP4UnhROYyyILm3qFq/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9lHBjn1s5iUv69Tys7sk6QMc8Rf0fegjKO+gwnnpJQ=;
 b=Wkd3j9VZS6V3EHjOkHK+0by8P/nl+aDNzjB5/ymb0qS3edPe3nMbql5izu+/8WzgxaJXftJ6eGAlAWFeMgj/yz/ECtCoceHPEk34WIz3KUkvAfPQDhdNK2AGoi9vx51hBH9mlkD6IUJcOTegbuJSy34KJVF7sxRjrzT+AF90JjxTmletJExMENUst9yUnRjH+0FEpI02Y/4yV4Q/i4hW9qUqajISqVzuf1JUjz4kWMYl7W4TU0lcefWeDtZZbJsUETyIvgu1VXBTH2uNy3zFOE5JzCbNW4q732SHhMzFH1umBHAe54zjIJqmBfRSk2dkScIU+Nc8v9xtfEiNAtXM/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9lHBjn1s5iUv69Tys7sk6QMc8Rf0fegjKO+gwnnpJQ=;
 b=Rv5VovDjMtJid76DdydsoEZv8PVQaH6GJSqmFdIUz6Hl42NfLmv5ulXD0q+wuO4NQ8Rjgx4Dw4J/VWVHzgAGdI4tEcEO4tei8Ethw4Z11Ytd6cJYINEB290A3PwCcEQQSz9JT0R1q1+1zj1Y2QpiqS7uYIDJQn+fvIkXd7vm6aXQ/DltgTasnz4H26NL+vTKzRZJ4TOoj0VRuHjEKa9AHkeP8/NrbgB/+3XJOX38ocdnn+131dd2vr40OVAkbssOASt42dsLh1FF5I4/s4kehn8rarxA5mMMgJ1TljyLAueh8vCha/934Vvc53U66aRR0+bQ2QCQmXMW7jv/DtwMmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12470.eurprd04.prod.outlook.com (2603:10a6:150:341::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 07:41:25 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 07:41:25 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	arnaud.ferraris@collabora.com,
	dsimic@manjaro.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2 1/2] Revert "tcpm: allow looking for role_sw device in the main node"
Date: Mon,  9 Mar 2026 15:43:12 +0800
Message-Id: <20260309074313.2809867-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309074313.2809867-1-xu.yang_2@nxp.com>
References: <20260309074313.2809867-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0174.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::8) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB12470:EE_
X-MS-Office365-Filtering-Correlation-Id: c611a85d-bbfd-402f-bfb6-08de7daf4422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	VR7WAaFQjozq0nLu2jWvRn6UCl/mTGidPFzDI301SjGHlBrM4aYDHEyH27O0U0PWtO4WaZERL/VJsb6edLrDQgoRAyB/JmgBsKr3rzQPexUFu2wlKzuuGTQkqFYPHnmlRXJEaE67crfjeNtAu9w55BwkdVYsG4WE8UB3F1efaWM72Va/Y1Yen32Wa8ZCDbYunTzAtonu0MvyTxCrI8GtlAVIOo32h8nS/x7MZMlPDAc0WsJEioEj05Cy9oofZVbv9bCGoBPQMtBquLkiwAfSI7zFsoW2zf0SnRJnGGFy/tKd/p/MRnFidZUjiA5tNdmxc+daFX7fSC0Nz+AyFehKBxUcJqzHmr1HenCXHYIrO268VyiX7pLrMP+A5aI1qGTYw4eYhLuJUFH4pU8+/taBX9WZlqH1Eg6nMn0GUOZcYrvL/GOWZjb7rkamgzVlj0MqZLLQ2VErXSNLI3GfNkH02Rizwt6q2+t3755NwxqOeiBZD56nyc7oxTyMlnjo3D0RIEAHqeq1zUe6vUA9CsMF3iFy54uZVGyaAx3MYtOOXbiqETKOiJ92eROkClJUNHowT5KNgSCsj/f1ZsYRVTub9pEc2oHbYhkQ+Yz9Y3EuIrlaJXnrJtZxpbZ7TNcCCDqTFP7cWoUJV8qyL9Up+I1qb/MkOwzFXtAy1O/aGIV6sCs6MFX07upuxyv+EUrF5PT9u5xIANuLSYlAQIshv5C9FFOa/Viy/j6GoEnQgZeyDcAZaiZIUvou1Vobt0B2mjndmzlDa/XCOLsr8E4ABIJdvXj/P5lFAOARXdvMik4UUdQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nDnanbcwc3u5RMzeFsyq2FZzJ+jAEBBq1dtJkCl1zLBjjeiPKmaTZeQk7Ppp?=
 =?us-ascii?Q?F5gsqk7eNSgedCsYEqvrMUykx9/Agp9ARXSQqdeKPcB7P5XvOM5OF/PaGTNt?=
 =?us-ascii?Q?wZomwXo5vtx7B3dVPEhuJi5eaRmlhmTnraQpWACl9OKrbWF2sylgr4VuwNwk?=
 =?us-ascii?Q?NV3Xt8Mj+vN70BByooF+ZZINwQVq4WmtZZ2bIItPfLmAew4y/AuGOUz4Yr7v?=
 =?us-ascii?Q?BtJf70vHQm5/WMCxLKYd1nJN5+cFBwHTCBmisFeNgYwA4QccZlnQX+4GliMJ?=
 =?us-ascii?Q?/DZ/jt0LAJRFw4M3H/7osoIn/nc45yWIEUfkVY02yT4N2/33FdsKbH420yha?=
 =?us-ascii?Q?B7482siSIvTkSxiZ6xzKJmbiuKpWSFoWFgvPSIx+aZap5upqv86Ur3Omdqmr?=
 =?us-ascii?Q?M3Je6QPyu5Hxx6vslFO2rshZtda7d83J8jwanequbfPc2ggwEtrKsqHZuT27?=
 =?us-ascii?Q?naPp5b27oeuEApLSlvPLo+nd0hxVWinHm/0hQbQrjwOhQtzppetPMiIC0/V5?=
 =?us-ascii?Q?jzk9F4cKSM+Jku0BwDvnSkdmB1zaoXEVaK51g+qMuLn47SbFoW7tJRxeAbkP?=
 =?us-ascii?Q?4gu7QOTD4jsqu95J77V2Qspcr3VrdAK1gr/bfqOGfNIt6qldQtiHXQ11foPC?=
 =?us-ascii?Q?A0kLGIHRacdxQrouSXBB3zm90zgcQrRjtK3d6u3IemUQeroyQuelLA3JqxqG?=
 =?us-ascii?Q?Tf5pZsM2AxLRYjNDfyoiD5fmB0HObu6ZaT38YSFdXakHKHCuIVWtkYFaKtZf?=
 =?us-ascii?Q?KdvlrMZD4YjJ3vXf4yO5a6Ai4Lhd/e30pQiXaYGPom3bwLXcmkBEk37UQIMv?=
 =?us-ascii?Q?BThINnut9EElbbFvojlDpMe3itfitbS+hgWRTN0CUMLWgUlRG5dWSDXlfusP?=
 =?us-ascii?Q?Nj0FoPIn9sPSwR1MosKlnF5vkEcPBRgy9AOYQGYgEvGEAzG1Kgm8BX63yXWW?=
 =?us-ascii?Q?0rVlM2loae09tuwu0mUfAJB8WpK2DYlJCGcMfIwmvJgfUfHb222Ny5yLu9fw?=
 =?us-ascii?Q?5Cm2jAH7qXcSrYwwwhJaewTi1z74/K4s1fammB1wtKiOgy5ff8CmRM4iFj/G?=
 =?us-ascii?Q?tINXlCTeqk3F1vzda5XYyWEyjO7bDNsBd7fGQbBGhuY+M+zgXo7x0118vtBZ?=
 =?us-ascii?Q?WpD87vgvijWOD7Wyq1JzeiGoGL1B6xnR421xiMA0fTRa/GsesIue24TkTUEN?=
 =?us-ascii?Q?MwqBUILbwE2ElACPLdMMRpbPNO0QCo07e3nDXGME1mAmiwEb5/aF7nMmKYjX?=
 =?us-ascii?Q?v/onMmJo4LIdNiKyT3ZSzcnlMfz2mTKe4YiIglEg4VFcjXWRAQWxiMgi+T3/?=
 =?us-ascii?Q?wX8BjMX755UBx88yGQ89sTQUWgnVksdT1p49w1qO771k/P974P5cC53319+X?=
 =?us-ascii?Q?lIWM/wub4TsM8vfZ48Mc1aPG+q58V+6vdtqcR3hpiMzElTNwBAyjp0Zqtltr?=
 =?us-ascii?Q?aOUe2H8/XeTP3xTvnCtXdBPO1LKQrpwxp11tkkxuwHaTg3g8o80D0Z3NAYOz?=
 =?us-ascii?Q?yGFvF+Jwh0Z3spdMvsM9KTSnUUxSd4JhG5+DUxkW27t7Cqny+kVeYmWyce0d?=
 =?us-ascii?Q?PSB3X+zowxuIICu3HxXiFUNaie2Q0QXMZ3p0ETGBDi2nEtW7xsn5hiKZypIr?=
 =?us-ascii?Q?FrQGqjS3l0+o6RuH+KEWoNDlhLcJY6kzjjSjfqQTLI6L3ptWvFGolxVGgaYu?=
 =?us-ascii?Q?Cur/s263IMMytYdyQXRAH/BLESBUxsVYMezX+dJvH+oEIoMho/lvNqauAmJp?=
 =?us-ascii?Q?kkheEeWFxg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c611a85d-bbfd-402f-bfb6-08de7daf4422
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:41:25.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1a48rhYv38TUPjCQPPh7Z+SQ3I9tfLaMg9Xd/S0+iQ8V5+N/OAXdKgV5NQyNXGRkbB3D+9mhJH0quK4iSdmNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12470
X-Rspamd-Queue-Id: 0BC62234E61
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
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-34263-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[nxp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

This reverts commit 1366cd228b0c67b60a2c0c26ef37fe9f7cfedb7f.

The fwnode_usb_role_switch_get() returns NULL only if no connection is
found, returns ERR_PTR(-EPROBE_DEFER) if connection is found but deferred
probe is needed, or a valid pointer of usb_role_switch.

When switching from a NULL check to IS_ERR_OR_NULL(), usb_role_switch_get()
returns NULL and overwrites the ERR_PTR(-EPROBE_DEFER) returned by
fwnode_usb_role_switch_get(). This causes the deferred probe indication to
be lost, preventing the USB role switch from ever being retrieved.

Fixes: 1366cd228b0c ("tcpm: allow looking for role_sw device in the main node")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 1d2f3af034c5..8e0e14a2704e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -7890,7 +7890,7 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->partner_desc.identity = &port->partner_ident;
 
 	port->role_sw = fwnode_usb_role_switch_get(tcpc->fwnode);
-	if (IS_ERR_OR_NULL(port->role_sw))
+	if (!port->role_sw)
 		port->role_sw = usb_role_switch_get(port->dev);
 	if (IS_ERR(port->role_sw)) {
 		err = PTR_ERR(port->role_sw);
-- 
2.34.1


