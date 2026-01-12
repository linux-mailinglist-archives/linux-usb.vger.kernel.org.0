Return-Path: <linux-usb+bounces-32182-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D85BD122AB
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 12:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6113F31080D9
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jan 2026 11:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F7634E747;
	Mon, 12 Jan 2026 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OdRLe3uU"
X-Original-To: linux-usb@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011047.outbound.protection.outlook.com [52.101.65.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FDB26CE2C;
	Mon, 12 Jan 2026 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215769; cv=fail; b=qAXweLgCJO+lFf6sj5gLdzDpzVPn9IKUL4S7hHP9FRN16T8xF2UddZ/R3eMCjeyF+e/F+KPketyPIqrKIng3g4YdV7ExCemsX4HeGVvneRyTmSKXho0gKGVC6Tu7k0pE5CDbkK7s7vFE0f75cFkEulN4MFtxgdvf1T54AA6+SjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215769; c=relaxed/simple;
	bh=WMxYyLAjKWjAig2mFhT/cGfxJpPI6mQZkLV6xpqgqlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Iu4+7tgGOD6/ddn6KPHHwc49+8G4pVM6Hq1Y0zGedNTSa+LZ+KXOIO7TFqXI0fnyhd6izVzCtKj+0bsrLvgzv+JGZdY4fQwCUNXdiUZeE752wTiYN9yGqcKy+1hDmZQM0V3pSCCsfW45W8TgFGnqdNYrf3sy2r5zBwpwMbgT188=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OdRLe3uU; arc=fail smtp.client-ip=52.101.65.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHntRXpjacs2Xa0S+oagOtQidKfYkPiFhEZPp54bpdKcZGqd4oLtcDzDO7vfzqRTbqXdTq0qLOfYg2U+Ts7pclEVN2wDmlpT3MOVEbMUppXnu/LmG0czROidyS9JV1Q0cY+nVKdtb+u2/fIbZpWY9/ZZ7evNS6RHWVrJmFi1cxBVUMN6r6AXqY4iVId+B6PXgvd6PzeR3rvC+nv9WOS+2+2GOOzvOkyYHC2xlo+Ri7kKnvu4txPJAr+/ron3ZegPrmBoNgmwUE2xNXDfOrxaRKQ8O7YShFGhnGsylhZQ+67BJIfrXOwV50Jo0f1aI+9sbDpdy6i6DJpe7vV3B520xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nvs9uYqOzvlHAGSYgw3y/Kpt7bZm9ZTbjVjUMfkPL9A=;
 b=MhqDJTjxRSCGxy+pccvS7BdW0Or2Jj6wMaypIB8ubAKq4zdz6eK0WtgGhoGoGHxvH/wDXY3c8XMldgzlf9ZamoQb9I2FgrAoX9+cWFY0jE+FZl+R6+CEFT+MXZWKDo7+CKpjb2oWTERcHx5Hii6RTEX8RFNBe9/dBeCVMIFCGnjt1NVHWo5APoM8j74iIS8Nvh4nPdr37zo+CLyykBtaUjRlsmYmaqifj1QOGgA1WszXHBjTQ4wmbWnkFGVwezhszdFKoi4PEXm4nKW5n13f5WqNSS1MiP8/13pycAd5XzyueFUuobVd9fXT/cu2nid/wDPLhh18HqHOsii8n/lf3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nvs9uYqOzvlHAGSYgw3y/Kpt7bZm9ZTbjVjUMfkPL9A=;
 b=OdRLe3uUUZNNtJxYqmZ7mpfInSupGvMjQIYHS/MStyuS/IYhVLrur4Pi3BnwK08tNGaDW66HSsiG/1AOInoXhjzDnPIyn6Auw8TegeMEmUvtBf9DDT1TJ1I9btfUSibFm0JX5keGqtUCE6xsjctFGKK7D/gkG+Hx3i3kvY7QnlB3Lfb9X4DX+e4CSSmQo79GVRvHVqj16W9wq0dPb7jpvWMcxglkSZ+Gv0wHFlc01yuVGL11WOA/GwzsT7y8CGs8dg9ff3v0hUaU1O/vU4ffCpkOueN0K8FPtcSgDwcXDfsy9yDaAWzKZ89OoeyG/C1ub/DKFGYP3CGTtrqYFZXkaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS5PR04MB9756.eurprd04.prod.outlook.com (2603:10a6:20b:677::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:02:42 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9478.004; Mon, 12 Jan 2026
 11:02:42 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: peter.chen@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH v2] usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name
Date: Mon, 12 Jan 2026 19:04:08 +0800
Message-Id: <20260112110408.3263954-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS5PR04MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 60622e69-49a5-42ed-d4f1-08de51ca1b9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Gy7ygNx3Cx60l9aAuJeGgC51BfGo/71Zzp9qvSnZiHqX/KZtiX1rYqTKHauc?=
 =?us-ascii?Q?d81IMDwO+BUGx8KwoQrQtQzgC/E77ppNr2rEAID63JwEW0Mcr6HXzCCpSEhh?=
 =?us-ascii?Q?O5Pb4sspKOeOxXZQ262N5gcBJG5AZS9fofr9iyMExbI4M/5yiP/UZ4e0JeWH?=
 =?us-ascii?Q?VAW3Nz0TKkLaBO7++4HF7bb4EkBqP2ZD05hff8XizUZwGmQ2wVTnUszjHqZ+?=
 =?us-ascii?Q?0k8fSpS0w9YOy+ddAdWUaetFxfB9I63Hj7/lo74iyQCIQfrSnPVr65Du1HAa?=
 =?us-ascii?Q?ClTF5WbQQbSgb3kxJj0mXc1UrYYd8M8FMV3uOnBDFBNghenGXx304iZqXgOi?=
 =?us-ascii?Q?HJasQ0eZVjiDCHS7hJLEh1O6aeUvRN9bn9jupFDVXuWHMkcJ0a2+VG7Hc0u3?=
 =?us-ascii?Q?6Ydd1yRy/WQYkNCVHABJm0GOzFRDMmXcMk0hQ5vIITSZ4Vq3bNARvr8SA7tM?=
 =?us-ascii?Q?lhlsYHFwD1RYk6S9jSHufby/pDkAWqQWESZAUz8uBYm4Yvl5vDFILm5iteqn?=
 =?us-ascii?Q?FWsnCbpVezbz/w34T1pU6QcxVZuRRhT+7D/1aDUGrZu77BTt7HRbfVtTErWL?=
 =?us-ascii?Q?5+WpDK4//Az71Sx8IXzcp73VW++x597GJlTiMQt6vaifk9rAXZiiwMbZ/Ees?=
 =?us-ascii?Q?4L6ia0Mr1Pp0bSSEC3mU+USmpoQF28J4IvGcCFd9rxAb+tZXZye7XrBo0fDO?=
 =?us-ascii?Q?R1krnOTXh6fR19S+F32QSjiBmKoI/wrugmQx/U4soST1hEi9FlSFZWdvz6X0?=
 =?us-ascii?Q?iB7lY6AfffD55vkIynQD2fJOuwxCfOvymzrTsKI5Wfg5TV75h05HHkCfgu1K?=
 =?us-ascii?Q?9lnJI3BfwZphS4/UF0ObW9PZjKhadtvfXaEM2Dm5lZofh5RivexqyE0ccuei?=
 =?us-ascii?Q?cIDER6sgqjSxBOdfTw+udh0truKKs1sVnQy2ygrQL/wJqByWN/EJyzdqHJhp?=
 =?us-ascii?Q?tPca33wPe0crjA1Z3gBpsDnxdat1OigZ43BPIuvtighO0/Iy7IzVPEBr+FXf?=
 =?us-ascii?Q?t6XkiMqpmwWHc1g1HSXWXZq0vTIfsNoFUGAHtWpjsc6W33mpVpdJbDQrTjGl?=
 =?us-ascii?Q?MLXmTA4DdyqwaqZEkhBHFTkvHoW8SBpOMEPZJ8KXAYSCWMcRoqIJtSv7wrxT?=
 =?us-ascii?Q?DBbwLl3C0bT9HB+rfRpUUlRdHX0K2U+GSFW5Wh+rTJ/DFtK+R2mIYDkGxfnI?=
 =?us-ascii?Q?yI5XX57BnQM5Kzp6Ebd89qEylwgJITbB2RGpRmwckFAr4y4DzYMN98yKajsV?=
 =?us-ascii?Q?f8fu7uAKN9+VxIDsXG8raYZizrv5K18Aj7BkFB9WWPGYuhykLJMOYKq+K4nr?=
 =?us-ascii?Q?V5twdw9VuiE3zrMRvjzdg18PS8Vtsd/EcE5Xzx+hgrlVgupBuThUv+EqPavH?=
 =?us-ascii?Q?u0fyOCcAf5lBuvApvNLWqBZ0SP5J9ukolp0kY8auGl/WkLNC7FxXY0DBrnoF?=
 =?us-ascii?Q?XNhTF5feHKWX617Lbcijo1wpYfIvc9M0WwIFeSNjv6PcXZL8ZxkKDGQWuQRD?=
 =?us-ascii?Q?NC5L35YvKsHwKQDwy+hWaO6NAVTMhi73f+0l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2ecU8Af9I2CqW2kGRsrJzJ6wC9Lm+d4S7TfWufNVfX/ySqnMtY8VxEcoRvag?=
 =?us-ascii?Q?bQJP+u4dRxpGM9qlhICbTquZ31rQmKpZySK0urrTadYPxZ+JfNCTvLYy8JNT?=
 =?us-ascii?Q?KlfDqRRTXTpi9IxIex14l0aTWC6K0/JavP94Brxh0YFdrFPv3B3MA8ROfC1b?=
 =?us-ascii?Q?BlS5sIEkL/9QrmZ/x/V6pyOY3tL3bIymTLTvi3H5BoYddzfkpnLn0o8WlSt4?=
 =?us-ascii?Q?JcndhiTaKhIqSLSDhjB5bBwheZRVWPacNOaJtAMnsjhk8r7wb3ba4f7Kvygj?=
 =?us-ascii?Q?Q/ovStIuDP2AYYzTDai2YeAq5jbb3NujoIMaFOTEAGP0nah4vsqDTeBcOu+v?=
 =?us-ascii?Q?oK4fGrq7PNFC7fMWBFbo0kczVy8GCOXMNu3L1xT6NWNQ6Qc5lOoozzWPH8aN?=
 =?us-ascii?Q?tVfVc4V6qPIuEooTt3oiyH/ddvb8U2l8lJwdgnAoJBJjq+INN0OVJHwfo6JO?=
 =?us-ascii?Q?4iOXjbYv3LyzQXEc+PifFc8GukhlnapzlGWJxM7zXrhsgvLEezokVKESAVpj?=
 =?us-ascii?Q?wK5j9OnlK6Ws3Ch1oUQowS0jX8kon6Jx+OZ6lBmD1AHhxrsRfcD/4PcxC4gW?=
 =?us-ascii?Q?qMJ7eEfbL87dHZowMHWhb5g/fIrE7x4uYpoIwhi4Wzo+3RdwMCNNyWj/h+fZ?=
 =?us-ascii?Q?48WefJ+TSGv4ApM803eW8dxkMSbx1o172ImErXCKO2A9lZQt6hOrQyL9yUYc?=
 =?us-ascii?Q?zL2m3BNKIRlhwFdDNRpHlTNisZ5ejTpyo7P+QC8rjnyt6yxHyeRv4PvGqdQs?=
 =?us-ascii?Q?nufnX0pk3SK2QUc5akhyuMsy4I0vsAmP4iRKV2JFbixEMKy+VenObxeRrIGu?=
 =?us-ascii?Q?hGn3V7NJiN6Sexdv9uwBn3GH0yxDJ0NItSe4Rn873I9RO5dbgOKYYYkgZsql?=
 =?us-ascii?Q?ExVJ5Cg9flWlSKNzf57ST4xP4nEMJXUbaXxcFG0JIa+D3dKtO22DDZ5jbBji?=
 =?us-ascii?Q?5rmVLZqd0KccM5yf/UD/xpHdf2ycWOq5AmmV1GU6i3wAbkl/Iwj5xFRIiryc?=
 =?us-ascii?Q?nQvUBNbBQhLcmGT3X6hXKai9Rub+ZQ872HSxMTvFs+BD5WFEGsLzOntbTN68?=
 =?us-ascii?Q?DAJzRkslO1+tE1HrcrpxToZAsifQCuVpWw9vcWPvDO3WDOVtKAFjetrsxKcu?=
 =?us-ascii?Q?awPc1HOoXxe8ppgGEXrtW8hx/pQtS2Z7Xtr0xv0mHn9mwshRGHkQfP0/xz0F?=
 =?us-ascii?Q?NJM8G36XRtWK3Pm3lGioU4a5AaXG1UYChMA5vWUDETi7H02mqF5SwtajwEdA?=
 =?us-ascii?Q?p4CsmO/qtjY3hPrrD//Y6arMJ0C89C7bNlezEIDmrlRTbEsdAmlODU8S7l3e?=
 =?us-ascii?Q?FaEiGAkmxHTINx3TPFMZsK80vBHGnIpD5etp8ffoJ9H/i72XdhRHV9bcarwF?=
 =?us-ascii?Q?e+pbo1BCm/6vZBL2XrhfyvZ1+YAhnNuTXGoG3A5hSDSP/ntiBzYQjqzAN4n/?=
 =?us-ascii?Q?nWy/XNYsRHJU8B5VMG/As92RSY2YlFHbdCxqJXAKCD6DJ7EryyzqejWgl1Ub?=
 =?us-ascii?Q?CKV7jayf7M6eQDYr9f0f0WgVn/9ETj+UpnXCFOea1v4vG/w2MNmmAIAGAXqP?=
 =?us-ascii?Q?WwS/MeTKaLoz2KyF/2jnE8dfrE46ZOY9rWrhRKYKE46aFj1gv6t2RHkUZsrc?=
 =?us-ascii?Q?cIEbsmoSgp8rxhkIZ/zzrEHcfgvcYWwOBf4XyDxQ1xYD4y6YuK95CZ6lhYEA?=
 =?us-ascii?Q?3aB+9PdgKt8vvj7IbFbbFLLbkdx8ROg5EUgiIvVQ4nBfhF/1ZAOLrtyT9vIC?=
 =?us-ascii?Q?7r3mLgDKEA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60622e69-49a5-42ed-d4f1-08de51ca1b9e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:02:42.3616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGbUs/X+OR1LMBG+beEgpT5QUXh6laO46WsEZ2eCd5CVBC3Cj9ttBNrQhEUXDLlDx2uwinj+zPGI0KaRrAV2PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9756

Currently the wakeup and controller interrupt name are same. It's not
easy to find the correct one in /proc/interrupt at the first glance.
Rename the wakeup interrupt name for better distinction.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changs in v2:
 - check return value
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index d4ee9e16332f..56d2ba824a0b 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -385,6 +385,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	const struct ci_hdrc_imx_platform_flag *imx_platform_flag;
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
+	const char *irq_name;
 
 	imx_platform_flag = of_device_get_match_data(&pdev->dev);
 
@@ -525,10 +526,16 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
 	if (data->wakeup_irq > 0) {
+		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
+		if (!irq_name) {
+			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			goto err_clk;
+		}
+
 		ret = devm_request_threaded_irq(dev, data->wakeup_irq,
 						NULL, ci_wakeup_irq_handler,
 						IRQF_ONESHOT | IRQF_NO_AUTOEN,
-						pdata.name, data);
+						irq_name, data);
 		if (ret)
 			goto err_clk;
 	}
-- 
2.34.1


