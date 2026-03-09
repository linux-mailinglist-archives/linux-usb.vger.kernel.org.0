Return-Path: <linux-usb+bounces-34262-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJq6G016rmm2FAIAu9opvQ
	(envelope-from <linux-usb+bounces-34262-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:44:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E1234F28
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 08:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26EAC3046E98
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 07:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52677368965;
	Mon,  9 Mar 2026 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M89eDcDM"
X-Original-To: linux-usb@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770B2367F54;
	Mon,  9 Mar 2026 07:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773042087; cv=fail; b=rf4+CVbh2bbJg47qBQzpIg67nEJkF+pDxLIgpdD/5kEo/eiG1R4OxSaNL3IIAEVPsQvA+IsnIvsCG0fpEt936WOpJ5Nr+hJZdTS1ruZbDA+scc/R0fvpOieCnlIbw9SlR4qkNz5b010rStUXCUFCLuTSqQSnBEhOfzXxPfIeELQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773042087; c=relaxed/simple;
	bh=Y3fE/Akvra5bw43b178CMB9lz9cTGz5ps458GKIqFdE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AO0kco9Tr4fqnivfwfv7N72ofK6IM9K1u1hCH3DVEuVupu0sU/k8Wn8PDLUS1mN7MDQAYMj5IK9Bg1yYK/m0Bno7MXHHR2+pyRLo0UxhCG4fW+fKxvG4IjtH0kdDC55je6ftEsXrnSKDFvVaPeEmCFw51K6pbYfK62gtUdL5dhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M89eDcDM; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJoNmlHfsatX8VGrbSpcOxpGn9jol2tcu0h1dvJUfwAKaaoDege+qROXUdkRKcuBbVu736poPXxM2kJz03VxHYOV13YtdA0GnOwjgvtDC2OkHYX/M4urjpteeLZztBYCu0KhZn2T7q7le55HRYWau0FEJP7nIY3Rh8pBNKQxKwjyMAxq2BU2kM0VuK1sJyWcfkE8dMBI9rgF6nN1BAihsYu8mv5fo5f7tOUXs9Uonv47XP5jc9O5CIFm4e2FESZtlPlg8/jz1zCT9dY701t7+WoZVs4tXwJwnKkADBxIDuPVgDvfuFfa+UTQAqxJTuNJWBuC1wGTaD/cHKPRT56Afw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+0oyt1NERAsk2j+QuGJVv/s3mC8dJ+Iso+NwOw5iu4=;
 b=bqAW2GcYoYsrL8UmbQDPb89sshfDUhsNK0wKirsKSwnFh5a2D9m5IZu66ynEh69SiEkYxLBTNIWlzxGQf5FR3XSLFgIBc4nWbUtaGWNd4ZAY/6EsGh51rfn7VGxkgqaBp8etn5X982EwcqESe0VcBb5U6cDL6U3nQsYTU+EsI8pNYLMiu1N6DJFTcbT0BNFptT8GzzU7CIL5iAKZ94zwT62JiwzuyvZPbJpVFDrCsOKfWuXvmGcFQ2UiCjR4IYY5MGxZPT9IA36B5FWUJJPQpjQvTu+5BC/J7ynI/ps7M4A2PSOqByFQh9iTLjXTkcMuf/XU5bgUxvRgTWSQFJxFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+0oyt1NERAsk2j+QuGJVv/s3mC8dJ+Iso+NwOw5iu4=;
 b=M89eDcDM3LOULU3LbQMRzBa/rYGMjQirx0+j00vON3DwRXqHvnID9ediMW2UR7hQxu1xqq7c1ZgYmCnwDq6AZD5J56HAhdasChx7Y6IoIjPAOo8eboLCmMIMwrh5SILpKskQsNvTKJu+f/oAaELl0w/KLl4SckTW+mWFhgTaGk+E6osxikKIkdOvJN5jsokiH74Tmb98++LerKOZpO5FOfywBKrBCJK1ng3nCGuxGlj9tDc+QNwbwrUwldhMaMGFiD35ymrP/0TJMqct1wTXHoBv0g5iDwebtGi5Keb67rmih/nVrB17KCegeXRDZ12jM8ap7yHGnsWWMqnfh5FuHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12470.eurprd04.prod.outlook.com (2603:10a6:150:341::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 07:41:22 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9678.023; Mon, 9 Mar 2026
 07:41:21 +0000
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
Subject: [PATCH v2 0/2] improve usb_role_switch_is_parent()
Date: Mon,  9 Mar 2026 15:43:11 +0800
Message-Id: <20260309074313.2809867-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 01891161-9fa5-4b34-0e19-08de7daf4192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Fi6bLrqps81Qp6m2f8xiXyR7e33vniGNBagyHWyMwsu/GTmeqVBYurujjM1i0PJiIiHGGsKHmZ+pEHOY8Iel9/j+72Ak33+Qd4wGtOZFu70Zt3lLWlAZDNBZDRHwOWJqtROCDAaMT5ojDDAq/TcrNEFiAIEtfnvS67/o2dbDGlePjbIXm4t/elZu5mvcRdhypHanCQlVWJI4NNrsErI8iB73vmXELnBBZAy9A2dcUymwH6bz+rmL4NPU+GObT8XFvGJOKaBKD2m8D5gSfIv2i0iqzofJwtNComKReqjZ2pfBdYDK+1wdu0k6NS56JA/M9c4NOAk1R/JfRfhwm5kembP8Mtw6FPqV3rB1JRFr6zzLgKAD9EMK7fV2uT1hfuw3q5vNhQcsEw5dHgCVGXFX9FMzVX1RN98TxRLTs24Ufzx3kgJO0bHaerdjCCz+zWS+m2zAdsayG7AVCn4CIwXTYI3cphh3FW9FzOww/lep21TTl7aXJkDhxnfYMdILWiyTYTu/MALkpU4+SNqkmNIJRxuuTx7ho+GpgkckzE0T/8i35KnYuofS8wuq73tZCP44uEM9MbvWE0wOT3oZe/n/sDpVuDDmqUkcj7Ipjrq5H5R6i08Ad5kuGRkssR4HOT9aQEV+fg7OIOEpCsU4Hj36p41DuRCG3xgh3Z97T8AxbozU/6biVbFDTp5eveHuNFPQeBp7xrQCcS7/Cag1keeatBgb+mXMMjqFptarmnGik7Kkwld/jJ7NtuVe7T4FrpRzD9G6icUwIJeI84yu+UcrF37Wa6+1WRS0d8MYjhjSfGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y8+r/B5tghhrxnX6SFwDqrHW8YJzL+ILTyUZZESUabu8qpjOt0RRJNXxFnM+?=
 =?us-ascii?Q?eSwPi2wX/lRUUrCcAGqMjYG8zy0/15DBax9gs64mkwqhuA5YdjBCag41fxUa?=
 =?us-ascii?Q?lILaXsUUc99knKLH4KY6D5lM3TqoPKNYX3cYLXNNKAT39HvRQxYSno/UxK+5?=
 =?us-ascii?Q?e5WGjpH3L1j6uXzYtaKtI5Y4TTyre2Nni6c7nEzbXX/CjreL6WiqbF2nxUYl?=
 =?us-ascii?Q?3wRwrTjqTHPQT/f9VCv2WS+QbPZFVhe+rffikBP7UgSszbT9E1U0Esy6uLY0?=
 =?us-ascii?Q?VZx2COkDPGQ9LBUWGP/qOSs/mqySpFTv6ol+bMhJLNMyBxW2BEXT6MFMGSrh?=
 =?us-ascii?Q?XfVWxJ1r4lHaW1iwgXn1i+vKKJrMIeSRFLo+j7BLbfg3BYNjkyKD7GHdmeRI?=
 =?us-ascii?Q?NUQ9TXcDYlhOaJjOEjV2/IA3C4PNjXMO7zcqaiw6/F0DIFPIJwgjBEFQKsiW?=
 =?us-ascii?Q?kR0n9lVzn3jV8QrZ4F/GiD30DXCUjb4MfoHvIzLufeSopav09QXIZng2on+N?=
 =?us-ascii?Q?awCaUJuFWWQCVsOy44gZYsH5bG2qTNXh4KDi+NJw7KJeY4ecNqJ9v7cRWSA6?=
 =?us-ascii?Q?okUCuSFBI4wYhqDIzdZpWCad3WzrJ3H+WFpKX9b9kc9TpUre0qQjTjoP3/Vu?=
 =?us-ascii?Q?47M1DNfau2P4i8QySLWuFbkWh6i+mVzqV+I2hF+HavDqJAS7Y0laTeYyazF+?=
 =?us-ascii?Q?X9l0MwZsyoAuL5P350aFL4WdY0s6s02N4etyD8piHYe7tagSalZJF7CRDvsG?=
 =?us-ascii?Q?A5IdLgDFmWuEWJPrAf7bJ6Lfer2F7SU+h90YmRd6czwQMkY/7AX1+tnVkDU2?=
 =?us-ascii?Q?sgKo62KJk2B66Dvssxsv+JSB4FOf9HaLZY9aHlyMLeqaXN54gnMbkNqfrp9Z?=
 =?us-ascii?Q?arJmtVIJ+d1yi/FKECvJyYkPfcpRuoWEB7B2S1lzUtGNMEIvQCFHsyG7oGQb?=
 =?us-ascii?Q?pvKksHuecw/6Qg18+yeDl6QntJZRKDsLW6sZbbOCZnm5zIx4zWDZhbgpcYjv?=
 =?us-ascii?Q?y6Hc6XEwyqSevvFdC1u2M1HLvhQWqcxoepDShHtQg7/FCXbvyIDsDRcb7fmo?=
 =?us-ascii?Q?kef8m+3tnuerd1VghXwPOExSShb5rL5rhOdsK6sq5w10++slAeYyTxTbVwUr?=
 =?us-ascii?Q?U3KzVTsZHcTybZobK0sNo1CjwueWQav1gIetTEle94zos17glI+7zFhC+nX0?=
 =?us-ascii?Q?S0Y4rh87zI8ael9Hg8gR6vYM6tZhFy3BkiYxe6QUVYewZknFyIfbHZaq02NZ?=
 =?us-ascii?Q?Lw5GAd4isfrTPgggvtDTcW34rQQR72uqT1ISGIU0FgENG76LfqdBHhqrM5IW?=
 =?us-ascii?Q?kfKKq2lhcziO5D3PAF9Fgxy4TzVgQPopTl5Wz+50FLSRrxi676K0MolSax98?=
 =?us-ascii?Q?WRd++S9721zBb0bGU9dRXzXmcHgQwHYEHA/cIUGtEg5ogfPmgixUvIiuDLVC?=
 =?us-ascii?Q?zyR4B2w6ChTLtMrz8jKuxpR6/VE9OIflEGtGViTR4O+FbwDyVhcIUxo6yDhM?=
 =?us-ascii?Q?J+C3o+lfu37GKCpUYQEK+t/LGIWUn+YjVt2tSQUUukoFTews8jn7M3hIVA1I?=
 =?us-ascii?Q?ADx0GBwHMozqF1i8FcoPMz5gfQzg8nG4UTxudIBLSOXMWbTunxlv4NaTuZqG?=
 =?us-ascii?Q?I/bqWnAla/QDtq5dgudo1cy4kGNIhJXDKiPigclUwYhTDnF9hI0J3/N7I6sH?=
 =?us-ascii?Q?RhIlDDoiyI5Lfx1wChQkL75CfUAQHeFhn4UBPlzS0VB1yrLo+en8NtcVhSRh?=
 =?us-ascii?Q?Nqx73nbJVg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01891161-9fa5-4b34-0e19-08de7daf4192
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 07:41:21.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOB7uGhibv04jsw8M6/i5Plgrb+dl+2F13b69gW4qeCHhQFCrMsVavnGzmotXns1yG19IlhyaY2EkBEYG15sHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12470
X-Rspamd-Queue-Id: CF8E1234F28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TAGGED_FROM(0.00)[bounces-34262-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xu.yang_2@nxp.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.22:email];
	NEURAL_HAM(-0.00)[-0.988];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This patchset will revert a recent fix patch which will introduce another
regression, and fix the true underlying issue.

Arnaud pushed a fix patch commit 1366cd228b0c ("tcpm: allow looking for
role_sw device in the main node") because commit 2d8713f807a4
("tcpm: switch check for role_sw device with fw_node") swap the order of
usb_role_switch_get() and fwnode_usb_role_switch_get() and this cause the
fwnode_usb_role_switch_get() return "-EPROBE_DEFER" all the time in his
usecase.

The said dts use below property to get role switch device: 

  fusb0: typec-portc@22 {
  	  compatible = "fcs,fusb302";
  	  usb-role-switch = <&typec_extcon_bridge>;
  	  ...
   
  	  connector {
  	  }
  }

So the fix patch works because usb_role_switch_get() will correctly find
the role switch device in case fwnode_usb_role_switch_get() is failed.
However, usb_role_switch_get() shouldn't be called at all in this case
because tcpc->fwnode is already correctly set to @connector. And worse
more, this bring another issue that is once fwnode_usb_role_switch_get()
return "-EPROBE_DEFER" this info may be lost if usb_role_switch_get()
then return NULL.

After further research into this issue, finally I found
usb_role_switch_is_parent() not work properly when it parse non-boolean
"usb-role-switch" property which is for back compatibility purpose. To fix
the issue, patch#2 is added.

Xu Yang (2):
  Revert "tcpm: allow looking for role_sw device in the main node"
  usb: roles: get usb role switch from parent only for usb-b-connector

 drivers/usb/roles/class.c     | 7 ++++++-
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.34.1


