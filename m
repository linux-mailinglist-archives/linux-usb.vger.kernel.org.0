Return-Path: <linux-usb+bounces-27769-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3CBB4A48A
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 10:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3117C3B143E
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 08:07:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE99F27453;
	Tue,  9 Sep 2025 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hCffxLd2"
X-Original-To: linux-usb@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11017245020
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757405267; cv=fail; b=rH/6ZeXC3ajBX+7fMGMxOrOtnFNjSb/KgeKceuXRGm5uIDtdOp8e8wXYj14MtmpJSQbXNcKOakiArW4O+eEt5bqeLG0JPvpkMxXohV7DyNwcvUzSsuhDoELYHIoImB3KWvp3ruT+fqwCmGaJSMucDx0CrKhAN7oXqJmGFTmKfv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757405267; c=relaxed/simple;
	bh=+JnXaSxtMhVgcjdhMn9l2DxNNTCz1O5gkMbAbm+Dz/A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Sj60y0ke5Fuovze5GLRB+qPPJVAFA7HS5aiNZxGJrEpWBp4Fa3ZX3DdheeFF+7CYZSrkSw6IQEUr45uwNt6MgQrNwRacYIwDRd+JYPyOF83vs3KGvHLVZXQYGSi9bHEbJNTf67E9MOmZi3diYh3MFtEj/jwk/LZGr2kik7cbpzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hCffxLd2; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOZINf15pCjs7grqBTzKy5zw7sGQtT8Shv52rxoUDOS6QLG+pbvoaW9zfQa2g1wzmrwZmn2Q4mEPREqyUSkZ1TH09OF1H0vLnVKEP/m+3R8X7I+NoVqsx3DX04vQLthpR6aeb5DY+9W8cy1MLSLQrn81rMTIHCzT0tKUP1x+nCTYyNREMRGGy496SlMkQnWNLMqlvgvmPmh65z4cx9RtlW/RZu0G/QFkXqDl/UZ4FbdY717VTDQJzQrBmZiKphVMc3NX5ApKTLnlv2LYXkN/pFJhtDvVR5Dx548JTeO6RqIT7B9eV+6fPOKvAKuGtMs0DG1piWTP29MyOMuMyDWUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/SoAO0xgVn84WuBXZ6hVJMj6BQHL4un/LEHsWtMO2Q=;
 b=lRPaAcVvQnQO80TPskdzuMkAISFItzhf9j1Et6De0LMWdHYu8G1bAdhJ1ksKcDY8OIFSMAk3kyfvxG32JMXI/plIoxN+Stvz0CH9UzGWAtSET2BHmF/wO1lEF8qpL/N+llDmfVkEEgDhh3AG7EfW4LeY/dJzbEB8AwWGmzCwGXTSgLjnxl6qAVlpX75W2HX34o26Vp6UZBc8P2h8Fk2ZZbqsMUVHzUMJCRGceOLn6F47yuHeB7iJzkmVZ17nMtWNB5LYueno5kh7IRILC3nZ/QmdD8qTRnDFqxKGb5VNXARCWHdyNw1ss6zwyKOy/X1u5yyNZW6dCxz/9uGXfAqM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/SoAO0xgVn84WuBXZ6hVJMj6BQHL4un/LEHsWtMO2Q=;
 b=hCffxLd2PaQHuqdSAt1t3BNHOwjK5pxzPWeKGh2xXsFqxW05m/3qz/1aWsfQWW+Y8CCkPWDIvDCIxMchUHVR4NG4vOz1hVOl2BhQ3poZ3lbuUtjO5sQV7aQkHaqPM0+fztd7WBsf3oXwpYJ9Oen+0jiqkE44Q9/eUcp0GmtphWkDC+ZIzv1yQDoohF/yKI5J3g97gXyvV08xErGdP3mXHJZKKFhBH9ZrBZp6AcosC8YCJHPUaOKSKVJAvthJ3D12+6LJ6Kb4u2rzc9ej4W8YcaaCRnXhQ5IaHiKf2c2WRHh7XPhPGZkqoSLEEYIdfYzKW/Ua/4fFEBWjTOu7rgsQ8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA4PR04MB7534.eurprd04.prod.outlook.com (2603:10a6:102:ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Tue, 9 Sep
 2025 08:07:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%4]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 08:07:36 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	jun.li@nxp.com
Subject: [PATCH] usb: typec: tcpci: add wakeup support
Date: Tue,  9 Sep 2025 16:07:33 +0800
Message-Id: <20250909080733.567796-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA4PR04MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: f1dca41e-ed85-4a7b-26c0-08ddef77f01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uRBEJs4yCuAzUG1CZLtPazjrJe5LOJqXb7cVPv9fvvprW3l6T6hEABvbndCc?=
 =?us-ascii?Q?we8APVm768EV/8ZlVE7UBQvI7l/4zaf1Zglg8zayq4a+uI8JjkzoaSkLXFhj?=
 =?us-ascii?Q?Vcz+e6ks3MxzBNBaWWqtzwhtmglGgM9k+o3KvCwqhsA/2YYwKvy//EDTzGOJ?=
 =?us-ascii?Q?1lfiEX0VBTa82H/pa9DAaLJAjF0JsqvGTnSC68JNR8orNpH0awgq0H+IMLVY?=
 =?us-ascii?Q?eVzs6GUEeIgbhXaho9icAFIbpFKJXqzFxpaKOLf84cBOb5wswQHpRP2tvsmO?=
 =?us-ascii?Q?5Lln+OwFR6DecFDZ6Vc93B79Es3COl720x9TOrexZMgImCFeSxhSwRfuJkfi?=
 =?us-ascii?Q?PGIHHyiH85/qCtFLlCIXW3qE8R+H5GATGh06UxeN2AOn9o1El8DM4WTMWMfQ?=
 =?us-ascii?Q?mPf+AH7iA0eRtjGy8qUM9SBkyXEtYoG1swEIt3/VWkBFRN9DrRxez9jbdIQk?=
 =?us-ascii?Q?5AG5ZIjG3dOS8iM2op5hTWZXFqMhkYyMaQwiAs6BLXN9Oo+TFlchSCpMeEQ/?=
 =?us-ascii?Q?9Iv7ELnx8OMYmStfo4UJxtYV9yO8vpX2Buoyi9Z9MlVzf1J8exppISWBIbCB?=
 =?us-ascii?Q?RdCprORvBskMR9Wz5Vqz+6HPp7heal88RaxtOD2jglUPQybBmvBTuA2mZAME?=
 =?us-ascii?Q?Im43dlo69y6Hj2VcI3met1IQ8wZMpgElpBVaZ+vm116yw/ycPgtlYQyvC4Kf?=
 =?us-ascii?Q?2ZAOkdwWUVnEFxfEFCw+RuIV+97m1CBHTnPNea+FG4oF5GXR1cWns/Z889C3?=
 =?us-ascii?Q?Y2QzCT5eEYpjuKlLzojTzdHWXcWRKPvFYdYMDG1aGcTS36pMYm//QB73UsjY?=
 =?us-ascii?Q?kg7xgxbzdHQH93DS+CVwZJwNQumzgF3ES8qR6VkjEPXZAA4zNxQZKCv/6nkp?=
 =?us-ascii?Q?sxr4c3lh7DYt279zBOWQAlSKS22e03MQM64ZmDteTM+5iyYvNvIT1zQAyV8d?=
 =?us-ascii?Q?XvHVJJ+KWyT+d4VoGozsMYTxhiGM2+bcDDPDUvjDakroztRnStW+i9qVowgW?=
 =?us-ascii?Q?WRQZeKz4841vOUCPk60a/lvkAGhAi3Jr5w37yM7XrzyWS9yofuHZ59RLSUw6?=
 =?us-ascii?Q?UjR/iz2dkqz2lm1bnhzKJOs/drXEk6iLXvq3OXf4qt03anvkD/oYdreKvym9?=
 =?us-ascii?Q?PNKr7e60bteQJnOIewLs00SzkiXY6onXxoWqbTlRgvHHC6DuNDWRdjBDAifX?=
 =?us-ascii?Q?t7/23RU3E7nS7mVEREt/qbhGlSOa/R3kJwqWsXAJjcicfkfUXVRZSbaBtwd7?=
 =?us-ascii?Q?SdMs8xPKaqLkdhyI4Si1PWvkxx8Q1gZZjPca/ZnGAmVhUzMOokbl+wHiBIYy?=
 =?us-ascii?Q?gUaVznPjIx5IX2zrL4/dnwlBAbLfEyUG1SUmYohj377bdRmP6ZnRGr3DHf2b?=
 =?us-ascii?Q?EXYuAHRcM27Bl9G9uDwQAf/R7CubHTzj7/YFPwYbF0ZGTn1il+OOMInObKn6?=
 =?us-ascii?Q?zyWICbcIH7SXRA0INtwCERxBivAFMsy8Rsla3+hzdCsmOHPBGuWL85InRaah?=
 =?us-ascii?Q?BdtlZYpdsYanCKw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uDoYMdK2y/BDQyATDkGyr4pKLsnmlozGY8hl9BO/dm3MiY/hCm207tKIpsMJ?=
 =?us-ascii?Q?v9msfgGtl50rkNMVkBhYNOzUa2Ah+Jfog51XI8X4NBaDZ6M/MbVILmirnXYk?=
 =?us-ascii?Q?YcfyPnc8KuwKQP51aYdBicTREpI1LSPXs8n1kgdWepDWEUjbTfit99vfEI+J?=
 =?us-ascii?Q?PBTPOpY2ZoxOYYJQic12uNeF8NaGu7ZLFiRfKLMy3sJRG6+AlNzq0bCLmay+?=
 =?us-ascii?Q?4KWgIGMAB4KEEwnLMZHd05AIKa2tXegtPK4vLKR21dzFreV3+I0xio2RQoWM?=
 =?us-ascii?Q?UuJbF8tfFboTZUhYpCHBNs5EFSt2rs1eIcOrLyMUZr5uapo53uYsnWylVFUz?=
 =?us-ascii?Q?rsM5CH7ecCavo+ZY9ocAx28EIHVfvDyqMy9we4FR8+a7gRhdLeYWdvinYxSW?=
 =?us-ascii?Q?b39GwcEFW/PKNkZRdHkCPhftvzA2xLxlntF6TejZxeC/G0yUikYWW0aQsi/x?=
 =?us-ascii?Q?Hfmhi1bxdZOx4xEIHjgH2Lxi/V9a9G4AeEhKSb371FrSStfMsgIDGS+L2sKn?=
 =?us-ascii?Q?aPXKfOE26/y5034ek73XzXfWrb5ydBDq0SMb+qKZrjZEr3Hk9BwGTg/Pe9vk?=
 =?us-ascii?Q?ETMKULOuEbeEfN3mcteK2btxWhR4f5H0Y6F6Qdv/moUcdTrAk5iRwgXLjK+T?=
 =?us-ascii?Q?4UUIiszdly5WO3MZkkIlOG4FW+1a4Lr9GN0YME3+U2jJs3HGV5wEWLLn6pqt?=
 =?us-ascii?Q?Z9YOhSCQRjYPlQP8fv6zdWcVWBriLvkyfCJd4F0H5kJYIsHH+kX2i37DypdP?=
 =?us-ascii?Q?D1rlluqnc9hGmbDYBzfhFwF4XFXUHpp8c99bKciG2Sir9UP+ozz/vYL5shA6?=
 =?us-ascii?Q?jaKgDKNSCIsGl+v6bHFr9wFpFHuQU0GrYdQ94fwF7idTi4eaY70P2cMF/z8H?=
 =?us-ascii?Q?D+RvhGSFDao04WajImu0Q5Twb9Q+jbFLohKWDYczcPEziKDmd/b5d8G7AOvF?=
 =?us-ascii?Q?m1WFzbUFn+jJ7pKYHsvPhRFy+Hx8awu/5LbK75aLPOHIZ1iGIDcYzWomL1I0?=
 =?us-ascii?Q?i1YkmYXNjKt8y0bAjS8jRBFy/bnpdgp4JsEIRjVH/9ThG6TvVql22uAZO6A3?=
 =?us-ascii?Q?5tqACyJss7HD7wxIKQy9v+zLYSbOojPjsoVa2ydCv/gV+zo8aRB1xN7Ihh24?=
 =?us-ascii?Q?kowrJc32fM6zTjPoT/umpkx3Ns0nlbJ4uqmG5f2VnMrFX+LyVOQ4/KW9qLFD?=
 =?us-ascii?Q?nyEIXbUafrOJZpYt0ltWEG/al/1stHGPjUSuF3p38hSfIzuCc3In868tUYuN?=
 =?us-ascii?Q?YoKjOW2daD/Jc33JVXl7Wm1swZuc4zbrTxaxAFvvDC7nwmcvY+V3zBh7rqyi?=
 =?us-ascii?Q?9C1QOUrRPp/kbNnuc4Ugr4pI8dbLd8xae833vMA0DlvTbWqhQqknZIpvfFb8?=
 =?us-ascii?Q?R3xtrkj17zhkGBeYUiOJfdttcgYHNdxJuDrLrblr7xDSz+8+T4iKhp556v+t?=
 =?us-ascii?Q?HrbMfJ9nivhJIcjVRwjalKpAdhXR65EZVPlGKdXeaxu1+wxYJ+4sP5gi4hBI?=
 =?us-ascii?Q?ojdaP0P7tx3oz6XGTZCS25qx+LvcGxzFRv+CLcAUOk9Y5cjNyH5BhXxPs8cm?=
 =?us-ascii?Q?GL/4Wq9cv3ssaDklB85huRBPFpbY3FOJPBottNF2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1dca41e-ed85-4a7b-26c0-08ddef77f01e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:07:36.8461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rjNZHCQxys5PIm31R26/1s8elDf93UOLvNr0UOkDHmuLO47AY64X9+mWCo06F4o+qn7c+aJAXqkRed+dBiK6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7534

Add wakeup support for tcpci, so if the user has enabled wakeup file,
it will call enable_irq_wake() when do system suspend and call
disable_irq_wake() when do system resume. Due to this driver supports
shared interrupt, if the wakeup is disabled, it will mask the chip
interrupt by default to avoid affecting other IRQ users.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index a56e31b20c21..2a951c585e92 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -949,6 +949,8 @@ static int tcpci_probe(struct i2c_client *client)
 	if (err < 0)
 		goto unregister_port;
 
+	device_set_wakeup_capable(chip->tcpci->dev, true);
+
 	return 0;
 
 unregister_port:
@@ -969,6 +971,36 @@ static void tcpci_remove(struct i2c_client *client)
 	tcpci_unregister_port(chip->tcpci);
 }
 
+static int tcpci_suspend(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
+	int ret;
+
+	if (device_may_wakeup(dev))
+		ret = enable_irq_wake(i2c->irq);
+	else
+		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
+
+	return ret;
+}
+
+static int tcpci_resume(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct tcpci_chip *chip = i2c_get_clientdata(i2c);
+	int ret;
+
+	if (device_may_wakeup(dev))
+		ret = disable_irq_wake(i2c->irq);
+	else
+		ret = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
+
+	return ret;
+}
+
+DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
+
 static const struct i2c_device_id tcpci_id[] = {
 	{ "tcpci" },
 	{ }
@@ -987,6 +1019,7 @@ MODULE_DEVICE_TABLE(of, tcpci_of_match);
 static struct i2c_driver tcpci_i2c_driver = {
 	.driver = {
 		.name = "tcpci",
+		.pm = pm_sleep_ptr(&tcpci_pm_ops),
 		.of_match_table = of_match_ptr(tcpci_of_match),
 	},
 	.probe = tcpci_probe,
-- 
2.34.1


