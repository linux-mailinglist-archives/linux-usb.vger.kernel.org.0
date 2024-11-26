Return-Path: <linux-usb+bounces-17857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2BF9D90B8
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 04:28:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40022289A80
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 03:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956B05473E;
	Tue, 26 Nov 2024 03:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JEyw0vDC"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2088.outbound.protection.outlook.com [40.107.247.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8118481DD
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 03:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732591728; cv=fail; b=ZCGTuT+boTVsIjB6cjK0G5Zi4SE3pAOiwtWnEZzzaMrMbMK1y8Nj5S4dpz5SI32Yz7xG0n37wq1YfiSws6rXu7noww1pu3oAMF20rG6o2hkr4h0+efmgA1che2jN4ocoBcnUNmXQRZJAGvOSURSUNT0CQpsi82WLTLU5IXQ7Iwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732591728; c=relaxed/simple;
	bh=8hIEAJtp4Bs7xGzJnqUuVRwiOTkN/aGoq/MgHB6S6yg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tL2I/n34EZlJftPHoC7vVfA29dAOCOSJnOk3m2uY0UoedpKBpOQ5/95gH9SR1iQieVWd6GRxXPFqvaY8+ddBQ1OoGp++ftewRp18Ux0hbe5kyiPV70KTUNsIhx+dgj4zd2DJUaHb127RpFg8uSMhVtTZjE0CijXGyJF9NPEGVbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JEyw0vDC; arc=fail smtp.client-ip=40.107.247.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA0v664f9vHeu/Gv2gG7amzUYVzsPzbToSz0Gp936J7sFqg18wf4ouFwUMeN8IpwkcqsHw6LivBABottr9uu/DDE6+vl8XZ+HM3F4oCVIN2GQvTQNtIXrp3W4dhV7W9wbEgAV7DKCIWj0tKli0kdr1MSSaz6OOYE40mxqXz6Eb+QX1gIlPoL50MoJTsya1s+e7/TxghSJdVdm3PYhkVxOct74qwOhlnQILj5AeaNZamm9yVViOlfg58XWcG1bczgxsarnBrdQDTbskloYJmjsgQX9A8y6t06lgVoI35XClgLAiPe2hemrH3413nuDvQpnPOzFeXIobuHeapX99qEOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7oxT5p3jlpyQF23Tu6bM4H3H5xQ2/z5Er5C4h5esvk=;
 b=zPaekG+Fo4PmzxThiwY+4OwEUluXS/Ad5zkYpu6D6jUt7mj2N8C/8Lka/GYOnpJ1SwrR8L9+bkwwEwZUsRQPsUtjQ10oNdvGKuaD0bbXtAFBOGARksrqGhkqyprS93eK82r/rA6duMTc1Jqy3+hPW9IMEHQxIwNDECkVbJNec+nBbyeMmGKqBe/JF3QKYQDnMmb7FVZU5WnC+HDeTkXKellQ3hNdrCe90iJjeyBjcD9P3pnwwEPMl52W2j4Kqj4hqetRTfoXlJQ3ivAiPLGe4djyG75sT9j3paoBX0B5lZlbio+LUCpFk1W3VGMbmRqu4rLcgeEv1GbCpfj6eIjeVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7oxT5p3jlpyQF23Tu6bM4H3H5xQ2/z5Er5C4h5esvk=;
 b=JEyw0vDC8YrUYlCwaNaCIOxSQkMarKHE2nHXATdEWcpqumA83Fbcwua06LwPWuq889w+ZkPgGHcORKju3wyYWJsKXeWuWvBP9bbS257d3OmfRKseK5y4BZqACY88no9fVGSwQmOpvE9N/+74xP57FRp9BC8KhGkrypWAZXEV5i4r1OclhbEGZfuVxlm+NKHw8DTQD2EUS3VJ8GXvTI+H7i8AvUYwoHbIZ9+akRilh+WFbk5nmcpLTwOHWZZKXOzdMxbwaXN3iJpwRDzsZVfUX1yxvXNBE4QzlFKQctulo1OK29UozGwt2BdhFuGwsqxihw0E+EfpWrw4lNlpT8KmCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by VE1PR04MB7471.eurprd04.prod.outlook.com (2603:10a6:800:1a7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 03:28:41 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 03:28:41 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH v2] usb: dwc3: imx8mp: fix software node kernel dump
Date: Tue, 26 Nov 2024 11:28:41 +0800
Message-Id: <20241126032841.2458338-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|VE1PR04MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae73165-235b-4abd-7158-08dd0dca6c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XAxICVO/luNYFh4bNgOSQixTaLejf5mL9xfbs1Wj6ePd60r7mo7IeDi/c7R7?=
 =?us-ascii?Q?9oj0Fvq6hKY4aRi8rTIyUMcQOTXFAei9ZLppUTUbR/ZrbZv5vKo5Jn9NHofA?=
 =?us-ascii?Q?sfThcV4BesE8g9uU7zcinPvgtVNgikK+Ady5/0IO10066/LoDm+kPPO9Ru17?=
 =?us-ascii?Q?kgUjNDV1rVemQLV2K1JwJY/T2IFwsnXlFfRVRR9lbX5ujwMrC1GvPdnchoPQ?=
 =?us-ascii?Q?PPG8Lw0ztdU4J5vdzlt9nkxgD3rTU1I6YXjq2FjIgMY/nJiDbNpNPNKiKxfH?=
 =?us-ascii?Q?txkZs8ha5xxp6/qz8mdEeiP5Nd9cxTqzUMCBL0kFH1CPagw8NjQkW388hZFI?=
 =?us-ascii?Q?U5S1tdhEkqAaAb/0HPWb7g2ZHvZze3FEVFs2v31s3wKXPGMigDsv4dZGP8hI?=
 =?us-ascii?Q?82/pWEw6nhbXPknHNOwXowpDKP1k1EHeL0fg8Rj+8apcdSmw6UYbzu88V16w?=
 =?us-ascii?Q?WBaGsRFQENvYm9zHne2/hOqWuz4sewsdszYTYBnNjEvJdusoxw47oOHQduiJ?=
 =?us-ascii?Q?/4/FcGjpyp0e6SfOXUnMhv/6vdEo8zQxydYHT+lLdZHc6OiSQ2jCneGbuche?=
 =?us-ascii?Q?Njl6gCIDJPaC3f7T8MJTaEbJdfTh9WchlCx/igYrbzy1HFHlZBsWd837Ln/K?=
 =?us-ascii?Q?tYm++W/17XoU1YAt5cw9Qi8sDB+Y8ZbNK94PNj3zxl/cxArf+O0G0zGL+L4X?=
 =?us-ascii?Q?tNxvLN308Hm7bMjx995ShaAtZzMDVRn3n+1hXPAUVL1XlIqaZnB9QylEFstk?=
 =?us-ascii?Q?SVkkAvCWJ7CuMQ34tpsaMwj8m8NASMm9uOECG9r85tuZzTz6GswHjMYoM41+?=
 =?us-ascii?Q?2tEcbvrKECDHhyQJNFfWI9hqIFrwG2VkNDCfqZ5/gZm3Av+eqUVryMrqHXMN?=
 =?us-ascii?Q?8q1ltJtFWhklEbBvjZlL3od4zo8yafryWrN94EyZWMOqYa9POcoHJDBtlsf3?=
 =?us-ascii?Q?h+8b/pQgvtkoD0R5LZjYvKSoQCzSSdviquZj9ysxkLRxVOvgyOmuQewuZG7L?=
 =?us-ascii?Q?vFt95Ac7f/GcS6DTB3q6DQRVdtF3E13QAIPhjJq5wZ/LYUNhp4gsvEXk/kLm?=
 =?us-ascii?Q?eb/d1COtb+Si8nSgvwRzF5SADj8UmZ7B/0PzEpN75B6wWAWXLwbzcsUZwEJc?=
 =?us-ascii?Q?17yH9xyYl0UxuTIeXTTm+cXRIecWxlrbgcq/ww3PB2+wsXwPmAFS2X+p5Hgp?=
 =?us-ascii?Q?aaHPeISG/7EMe87zfP2/Xr+rvrEP9AzYxSzq7KGsAqBb7ajuDb4ZOJIiCW+z?=
 =?us-ascii?Q?MoV7wBQUcpL2SPokEv1JSGRBOmRMFj79ODcw+jE0IuZPAmYHQrYVhnPBF7sq?=
 =?us-ascii?Q?rN8MZbOxS50E8a4iRuD97Wx+K5DYU1T5SrddGFSbboqjdn8J+MIdRlYcgMOY?=
 =?us-ascii?Q?LMG/9PQGYy0s594dWexICi6EzCnOPVJMRaQd31Jfe9v467JXwA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uZYqutERHt3Qb4EQxQ0/5J0pxX+7ZP5pOOFuEplnVOV6e4//gJcx6GpXC2lh?=
 =?us-ascii?Q?Nf5tQ8q6XgGUcjxRv6I8NoRQbJAXBhpBtu+u4UaUq1pYSl1YJ2/Py+tFOtD6?=
 =?us-ascii?Q?SsVpxSaYsIzKPEV4gl5zg/V7K3feB99Zs92ccVGo8no1q/Gjqkbr84g6/e+Y?=
 =?us-ascii?Q?jyiTaO1kXi/FF8+Ieh2JNLsmlH1MOdKj59EFj7TN8HrFSM4Bd4e2kVDbifkm?=
 =?us-ascii?Q?QIrMt6DknbykPqnUncfcDr7jmIDOmO+HAV80BnK12Ov1pMU4xpqIRQRz0MJ+?=
 =?us-ascii?Q?tZmXWierc/9JyUMKVIBszA0cqDncd9i92976IuRdPPy+773H7aYyIYe+AnE4?=
 =?us-ascii?Q?GQjxB7HWY0aBBHErtqtqBNmiyTT3klfMb0nh9wf0vdgJ6X0UFVXD478O03Ed?=
 =?us-ascii?Q?I9n23Di7ZLl7I2ZShDAvUL1kIIeSfu8NCxzadzV7M4Xku1dCozM191zi/Eml?=
 =?us-ascii?Q?U7Y6moI/aqg5ik+HZkIzHl9fWy5m4Rv25lLFww+Il0B9scUNy4bMb90GcFWP?=
 =?us-ascii?Q?MBy5Wez72m03ET0ghds3baOAwnXSL62+OMHrhN1QQg7a4KE33M2wJdx1SCL3?=
 =?us-ascii?Q?icfRS+8oRGDFXcSQdD1VlPW4+N/BpmgKAVc9dx/30cRzzl66b2QF/EUFPCj3?=
 =?us-ascii?Q?xxfrw7PrazVAyilDVRBy2+a9mwtSWDMY2J+NIrkR4+SLCYW5vYxnBqKNK2EX?=
 =?us-ascii?Q?AputJZYGE5ZbXvM8xl8vrSgEUUACb41FM/R59lKWJMuhkLwDyXmB4tt2J80C?=
 =?us-ascii?Q?MbbTIEKB8SiS17Q/meNLYjmQYkUN0yTq54MO+Fn26nwWRSzGXpt6b530Zghi?=
 =?us-ascii?Q?7PdwHiSBGodI1ltGt4heBQ8Tl+cGQbxt2y75iFeeybiw/tVuRYwvYsLLuAQj?=
 =?us-ascii?Q?KimiGHFMMuGfkq3urXad6YZE5UmOr8Z2Fjy98g50syWnEKONOUEPqnV+c1UB?=
 =?us-ascii?Q?n26/rd24LlUHWFYuANNxxYFvdpMvPS43exzhkqokdNKlYt81HySrLAwKNRAP?=
 =?us-ascii?Q?e4n+trvThO/O8JDa2OqGj7Zrhe09Vbd8tBOGNxqR4+HneQy5AqlI3E5m1C5V?=
 =?us-ascii?Q?2Nw7srB+ngQLmdXK1LkxJCy0EweW9rhcDDDKFiVU2kOpeSZ3q//Hb/A+3fHR?=
 =?us-ascii?Q?mv1dZiIaAcGjF44eP4cCIxi/30NUXG4NxKXn0J5FsYm6Gh/Xnasgr7XqLGrr?=
 =?us-ascii?Q?dwAGc3qlalPNqj9TLQYvvtscJzQsBcs4FRpPwwDMtmO0sj/CsL+AaOsS12rK?=
 =?us-ascii?Q?mGwqod7axtg0IWrFQey7Cc+QnHQmPJ4g+fVmGwQz8gtAnPFKI+uTxCGfQrmM?=
 =?us-ascii?Q?2UQthLanXypWrbbS1jxOw07CjF9T9ocV8OV1yWFOMIonzSaDkUe+hZM0tj2o?=
 =?us-ascii?Q?9Y42k00nh7YMOTefH1ftwO0ww8TtpoYawut81l8gGUn9JxfaD2N+zLJ147E/?=
 =?us-ascii?Q?OWOrDpkr46u9dIBKq2Xz/Cqk73iB5gUJFrdUFquEqoXM8kkhlFhQwYhm75on?=
 =?us-ascii?Q?xXnZiLWBHfEtl8bvMnafy6rB/Hmgs5C8BiIiV/dqPhuWAJR2eobSFHAAiHNK?=
 =?us-ascii?Q?GKxztR8ebSGFAhvKxSmcS2gKkKMfnEYaBcUQ5hZa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae73165-235b-4abd-7158-08dd0dca6c46
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 03:28:41.1719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byWskyCDUado/2cGdF332pWM9oh8vO17G8iRHa8jt+MyQn1rFJPJCNqivteHrTjxec1YWPNQsqt2IuJwwzC0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7471

When unbind and bind the device again, kernel will dump below warning:

[  173.972130] sysfs: cannot create duplicate filename '/devices/platform/soc/4c010010.usb/software_node'
[  173.981564] CPU: 2 UID: 0 PID: 536 Comm: sh Not tainted 6.12.0-rc6-06344-g2aed7c4a5c56 #144
[  173.989923] Hardware name: NXP i.MX95 15X15 board (DT)
[  173.995062] Call trace:
[  173.997509]  dump_backtrace+0x90/0xe8
[  174.001196]  show_stack+0x18/0x24
[  174.004524]  dump_stack_lvl+0x74/0x8c
[  174.008198]  dump_stack+0x18/0x24
[  174.011526]  sysfs_warn_dup+0x64/0x80
[  174.015201]  sysfs_do_create_link_sd+0xf0/0xf8
[  174.019656]  sysfs_create_link+0x20/0x40
[  174.023590]  software_node_notify+0x90/0x100
[  174.027872]  device_create_managed_software_node+0xec/0x108
...

The '4c010010.usb' device is a platform device created during the initcall
and is never removed, which causes its associated software node to persist
indefinitely.

The existing device_create_managed_software_node() does not provide a
corresponding removal function.

Replace device_create_managed_software_node() with the
device_add_software_node() and device_remove_software_node() pair to ensure
proper addition and removal of software nodes, addressing this issue.

Fixes: a9400f1979a0 ("usb: dwc3: imx8mp: add 2 software managed quirk properties for host mode")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - add error handling as suggested by Thinh Nguyen
 - modify commit message as suggested Frank
 - add Rb-tag
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 356812cbcd88..3edc5aca76f9 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -129,6 +129,16 @@ static void dwc3_imx8mp_wakeup_disable(struct dwc3_imx8mp *dwc3_imx)
 	writel(val, dwc3_imx->hsio_blk_base + USB_WAKEUP_CTRL);
 }
 
+static const struct property_entry dwc3_imx8mp_properties[] = {
+	PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk"),
+	PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk"),
+	{},
+};
+
+static const struct software_node dwc3_imx8mp_swnode = {
+	.properties = dwc3_imx8mp_properties,
+};
+
 static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 {
 	struct dwc3_imx8mp	*dwc3_imx = _dwc3_imx;
@@ -148,17 +158,6 @@ static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx)
 	return IRQ_HANDLED;
 }
 
-static int dwc3_imx8mp_set_software_node(struct device *dev)
-{
-	struct property_entry props[3] = { 0 };
-	int prop_idx = 0;
-
-	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-missing-cas-quirk");
-	props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
-
-	return device_create_managed_software_node(dev, props, NULL);
-}
-
 static int dwc3_imx8mp_probe(struct platform_device *pdev)
 {
 	struct device		*dev = &pdev->dev;
@@ -221,17 +220,17 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_rpm;
 
-	err = dwc3_imx8mp_set_software_node(dev);
+	err = device_add_software_node(dev, &dwc3_imx8mp_swnode);
 	if (err) {
 		err = -ENODEV;
-		dev_err(dev, "failed to create software node\n");
+		dev_err(dev, "failed to add software node\n");
 		goto disable_rpm;
 	}
 
 	err = of_platform_populate(node, NULL, NULL, dev);
 	if (err) {
 		dev_err(&pdev->dev, "failed to create dwc3 core\n");
-		goto disable_rpm;
+		goto remove_swnode;
 	}
 
 	dwc3_imx->dwc3 = of_find_device_by_node(dwc3_np);
@@ -255,6 +254,8 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 
 depopulate:
 	of_platform_depopulate(dev);
+remove_swnode:
+	device_remove_software_node(dev);
 disable_rpm:
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
@@ -268,6 +269,7 @@ static void dwc3_imx8mp_remove(struct platform_device *pdev)
 
 	pm_runtime_get_sync(dev);
 	of_platform_depopulate(dev);
+	device_remove_software_node(dev);
 
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
-- 
2.34.1


