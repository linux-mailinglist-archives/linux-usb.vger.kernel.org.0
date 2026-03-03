Return-Path: <linux-usb+bounces-33896-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HW1DYxEpmlyNQAAu9opvQ
	(envelope-from <linux-usb+bounces-33896-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 03:16:44 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 938331E7ECD
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 03:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B51E30CFF1F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 02:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB403750B5;
	Tue,  3 Mar 2026 02:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cDsLNGkl"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011031.outbound.protection.outlook.com [52.101.65.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9942F3750BE;
	Tue,  3 Mar 2026 02:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772504060; cv=fail; b=HNZrYLCgbZIh9xLiel1FgMzlXEuPYTkdDRCSQxUUnzE/QAAJAciiCwrszQHrSILcEplcK94n9cm5FtgSzSfYP04fT9BJE5l7a+/EUzKCBeKiEvPWHtXYwTa4DKqoa6Z3sTud+HVZ4ibGK1xRDSqT7K4OD1UcJg+YWZhBy8IHoIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772504060; c=relaxed/simple;
	bh=Z2CFm3Cqc71RP/9VWKElVuW12f4uLfeINQp7WpmRtpw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l2w0D/WA68Wm8KIHPPutSxPC0jDjac1aFjenf61W3mNM9pHe88K1x/BE8VH1aT3WCVVA7p5soP3tR13bS7KLJEI+FKFirbEhob6fjzsA1V8ZbIJdqMnO0W0YuwNYdym62RCfemRmXf1MUrUSE2DZ8mHEii4+H2dhZTgCMFidqng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cDsLNGkl; arc=fail smtp.client-ip=52.101.65.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXhUvAWUbhcnch/eUNXOhSGAg41PVfHhU0F0znx2aaAGcUTmI8quLyx8CF0yl2HQKOWqxQMsK68wZyHzERcPJyqEv+bUOvpzCWUCHnXf3sF1hXIFh9ElzjhmElWe6vTAA1gUfzypljGjaZqsTRiGNeGZN8i69JVE06HfKKzbxZZ5s6smicXCMC/3WBb4c1PjCb5ID0qSpOlAMcMatGCx0WOb9M4gYRAP+v/4T5Tq7wtLNBTHeuLNp+Z0z01/MJDMWi5UfWbAuLEp2cJ6uiVX6jEyOQloLGBeNXN0pYYPnMpVWFleDmG9IQKumWsl6QYXuCfGYAUkT9D1FmetM6RVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDju4ps6l4Fw5d09ZxuB1YBbnHLwpyw3YTVKyXeouAg=;
 b=SB3y0q7R3LBRujh7zJT8I3mr5Y2YB6f2uNB+n5MGlRtJn6I+/q6jTxs9ktDFdEALF9voeFPU/KfVsmfDaz8RtCZ9GJbO8JjNL2Ep4sSew/gOxb8wE55ayMN17bdSVxc4ACdDZatUGejRu69roqhg4KCbJCpEHd0lwNLVQT31h4dMBhwpiA1gpvRrEumkxkRHESIKd1p6gn4alVUVZ2R8t9eNSCUSdDYlRcm7pn7DlyS+MX+QlF+hIH5YRM7AGVEk1hG5uqszCM+3Or+MGWWlkBA9EfCNlk6+OuWvWTzSzfpqfgo5hhSQpQKbt7yu372+wHTNZU4OQ4hZYms7yz8VLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDju4ps6l4Fw5d09ZxuB1YBbnHLwpyw3YTVKyXeouAg=;
 b=cDsLNGklI8pMUtKIPQddkqQ4K5iqy/scF5QlX4+GKKJ3dJvOSs42z/UWJn19EcgOZE6NkAnaKgYn1QxW9IAoHbQfyHWCoZRB8rmUecb52K543+NnRzErsIiQSq4fWzKFW8LTnXi21Pi9P4E4C+/H49mRbPv0RJU9ajbv8HY0QhlsndYctG6d3GAMOrxCV6VpnfEV1psNnXK0BfiwWwM+ouNKrhW8QngQ6W+X1yAqb/XzAHBiLZBev8Daxw1r6VY+U/vjkvs8ijL7IJxo9JtZp7CJfDSZB2kziSXAV4PdZ1gjo9nHcLtLoUcuLwL0RSRijdjxyuxBFqjbbNcT2YhieQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by VI2PR04MB11098.eurprd04.prod.outlook.com (2603:10a6:800:293::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 02:14:14 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::52de:f9c9:8c2e:7dd5%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 02:14:14 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] usb: dwc3: fix a typo
Date: Tue,  3 Mar 2026 10:15:59 +0800
Message-Id: <20260303021559.4021177-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303021559.4021177-1-xu.yang_2@nxp.com>
References: <20260303021559.4021177-1-xu.yang_2@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|VI2PR04MB11098:EE_
X-MS-Office365-Filtering-Correlation-Id: 10ce6fb6-3071-4ab7-db61-08de78ca910b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	qk7/yfuLhrQIZJ8r5fOjXD0iJJTqY4WOuU92pwNUFFGxI6qLvNVNNFz1VyDeYqMTZxqjcNR0RKPRcHEskVy+Uu87NA/hqArDvdIVOqpbN/gEfyoR5ZsnZMEQPFGTS6Klq8PHfeXIxpvXsJYIOuneFayrR/lijw55SwN8Agl6vT37tdCLn1ulTC5asIgbqKNd3MBBB31DRPEf+bAWoxYesEu3W0sbQXo+6Co+fulKUGxb6U/oqYAU2F1TLDqjsFD0pXy1mamGxdiyGUAucrPFRLd4Um2OTuJugJ7u7IZwkBGDCeVPI2zEb6q9/ln7Rio1vzvFPXyQ7jOgtmG6nieLbOdx6ZIT8OW8nHgCLIiHiaeQRGkCDWLmTv9Z1eMnVl2kLXZnHJ/KpvjWmnxEaG9HHRd+aNqRj7z3WrZ2Oaq/uoghjksw98ZfyE/WQs17hY4DG14ZmnpELFVoDwVxfejiFZphd1+OB4JYwJuDHQBa0+aVkuKKDlANK9lXVYq25WsWp9XQbaLtSJzPjJezvQvQME3VvKTsAi/Ur/q2R7OWZVhIWxdyoBWFb9Puf4iGTy5Oz8ntgkMyR1oDr7wc0l9PZJrtHl9YV8mylviL2puFbsDRwCVvyXuJwJ7El/gMwltMNt4NAsp3s0uJskdFp19NpppCdZAhIPtVEO+TRgt5bLxs8N0hAMzFS0qLIQEJPLa3vAVpfd3tPQuUFXptnu9zguryeP3gZiOIRS7V2e6E8tB/gZFm29/23mRLdZNoY90gntADrJ4LZSuOX4BtPoXUMMGv/HbmXcvDTwEj6Q8TOv8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJBYUmH5cZDOM1kqqxLEK5uhCxqAwq6cMMUFd4SjUcLSA7tO/t66oXd7LNQG?=
 =?us-ascii?Q?Hqn3LPigGOGMzoqXTs35U3UW71ZxcZdwIui/9ewb+LCXMnK/1OUOZ/gAjEh/?=
 =?us-ascii?Q?8xM7zL/L7NvnY3cKihiq6qs5zrcLNJ/pi9QBqLYo6HTZ2tkhaD0TCHKF3Gp+?=
 =?us-ascii?Q?jDkj02n3DW4lIorD6heCpJjTHruZrw3AdgCgYLBFybP6qbPORwi2MPJRH+nG?=
 =?us-ascii?Q?ioWgDDXq42ARhTwBmblc4XYQunySRpsv6E0kGykfUMnw62z6Bb/SDhNRYTiz?=
 =?us-ascii?Q?dx/HXLEyONhlqtMD74vuy9vjKIat0eH8Ld+Gq0S8wncZe2liIv40+3VTPRu3?=
 =?us-ascii?Q?HdP9FV/y/wGEBqF+UpwQNs2BMylyw0nT6Eh6kQtaOfWtzFebKCOEorK7E9xu?=
 =?us-ascii?Q?AX7sc0Y+Jonvz6DUmnaIH0qNGYSEdfIJqrbrcICnXTBbDHvnRkXuC45B89NR?=
 =?us-ascii?Q?+FaNGOj4/TTj94fGhqe52GMzC/ZNd2aB84sv+YJ4bA1Z6XVtCb3ebK3AkEqx?=
 =?us-ascii?Q?fS8eJlBzTYSJ/JkL+BAoYFiKVu1lxAa853vlDVjhIwskcdGLAB1ouWPCu0dX?=
 =?us-ascii?Q?robna36NhTbj6rZRUgYMULUx5RsCOG+/T9tPw8if5Oljf0jL5iljT8QY5guQ?=
 =?us-ascii?Q?CoUdbLbJv3uEnC4IYsve0TwPRdL+oKFCYQ7khnMfSNOWVn4+9Vslg93vE9id?=
 =?us-ascii?Q?v536kHaqCrASPWBOidnC3/k1SppSRx4/z/ZteBXSI1yMY899G0ptEIskdEXV?=
 =?us-ascii?Q?4N6b+wD05G1uvdfC+KBI/e70ZjhEZqEpnWyDqE9EPd30eLSYGf/gDbnI1bRB?=
 =?us-ascii?Q?jCfKRzzVI8GjEe1Lkm5/YNymfnWyjeMcOK+JtFVf6Yskfs1ZXtfmZzdeQN+f?=
 =?us-ascii?Q?HEzirSq53nTvY70nvB9rN+L+cxHLnfLwmKpQ0K4yNqzQiVS7gJodWG0mq/IR?=
 =?us-ascii?Q?qus1orR+4suwRFY2NOLpWBIZGUAg831vBY72R6DLfLHOFhAbAnyv9i6KNo3G?=
 =?us-ascii?Q?cIchN9dJtUFDkdbXdo34jLvdbJ2tVyvceMAgpu7KENAN8xIRXp39zmlNrrom?=
 =?us-ascii?Q?jQPQi3Ky7UE5xh4j/q8mwwX6rfxoUH5r31/brFXYrDIupRcArSTHTch3SU87?=
 =?us-ascii?Q?F8yo5xmfj4990ZjYBY8wTtk5rufER/0omUPFCg9dr0aDwuC/Na4OeiROh8qP?=
 =?us-ascii?Q?yrgNZwkfCRumUO2SjMHG1/CHkqW0yyeGB5Pacyr13h7quqea6loYKEe0ao0p?=
 =?us-ascii?Q?m3zN1kjjt7sx6t8vP0OXfRm6vfUYriDHfc1rTagO+VGg1c4kIc6ovgyfTOMi?=
 =?us-ascii?Q?W2YUvmRYPqScUkWgNrfPd8ic3SqdAtXu0PMhOw7rg+6HNxc5PBEPwR5Ls43Q?=
 =?us-ascii?Q?WeMJI2/EtQnYUG83hfUv93YAUo3aM99HC40+3xoywPANxvaWy8FiRYETKiUq?=
 =?us-ascii?Q?E/RkbhNpOmBauO4ePuxdHCRaQ+3UNYBc64vkT8lBRQKrfBU/OyVrXizUCh32?=
 =?us-ascii?Q?qF88ebMYhrO2CNqSW8113sQoHMiWukVEgZtgdQhIMeJe1OW9mu64JJXxVTCO?=
 =?us-ascii?Q?nfYxhD8IizlVa7neIiDBw1rFORPNlXZCrJjonbARa8qaojBUui8knRYkVqrO?=
 =?us-ascii?Q?EwCUbBVf8kPZcqyHl6CY6P28pQZkThA6C4b9N7pOo7Vkikxp3zbTIM/C4ZVN?=
 =?us-ascii?Q?vXCHebgPBh/JFGjlhOLf/RKAoDUZ8AXZJoshcd9nDhg4uWVbEVZFwvSV0dAI?=
 =?us-ascii?Q?lwcgimwa4Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ce6fb6-3071-4ab7-db61-08de78ca910b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 02:14:14.8355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5VMj5wVs+LeLrF6pApvSeiX4D81H4P9I9178AVJva2dGDuMksfNspJdCBMWW8tSOwVb+cDCiz8TK4NKLtbMUIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11098
X-Rspamd-Queue-Id: 938331E7ECD
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
	TAGGED_FROM(0.00)[bounces-33896-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

HishSpeed -> HighSpeed

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 7adb8e74bd84..41cfefb34abd 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1151,7 +1151,7 @@ struct dwc3_glue_ops {
  *			VBUS with an external supply.
  * @parkmode_disable_ss_quirk: set if we need to disable all SuperSpeed
  *			instances in park mode.
- * @parkmode_disable_hs_quirk: set if we need to disable all HishSpeed
+ * @parkmode_disable_hs_quirk: set if we need to disable all HighSpeed
  *			instances in park mode.
  * @gfladj_refclk_lpm_sel: set if we need to enable SOF/ITP counter
  *                          running based on ref_clk
-- 
2.34.1


