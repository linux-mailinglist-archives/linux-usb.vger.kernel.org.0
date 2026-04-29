Return-Path: <linux-usb+bounces-36704-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKIOG/5A8mkApQEAu9opvQ
	(envelope-from <linux-usb+bounces-36704-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:33:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AB498370
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B9693024611
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 17:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE67F41B375;
	Wed, 29 Apr 2026 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="turgR/Um"
X-Original-To: linux-usb@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013042.outbound.protection.outlook.com [40.107.201.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF03410D17;
	Wed, 29 Apr 2026 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777483960; cv=fail; b=aqPQZcZcY/S3kugEPP3lx0KylPitO4tVVU82YYIULrSzao/xBvjYmwqOTy74jAFOVUejQ2+sBDCvnjkMKHKJlPYtLNpNbgF9c/gge8Fa7ETtRXbkFG6KNuheVJmigv8/syZpFIeAyHF3ycnzjDab/jzGTX1piyqD5PT8ju7QpEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777483960; c=relaxed/simple;
	bh=93SoFMjl1O+L5yc4+n4FkmupuVoUGMbsGYINKe6YGy8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bALagFFcj1MJsoBnwEOK/aJJb0dYMizr02/C4ASxWY/g9Ap6iBO4Yik3B63yUyh6j57Ljjz21TXk2+CLj5K5pHLlqKEl+5ORZRE3sWlVIHdpP2Tcl7hwvDsSmzi/hOmHiZFs0K9yPMU2dFw0uJGa8S/qMn2dTtexefumR+SMKr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=turgR/Um; arc=fail smtp.client-ip=40.107.201.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svNeI2g33z3A2V9tw5UFzyeixIYZ2Z14qGkmRDEkHThW30tZRp4H9bVhX6S8JLqsAoH1PPX9uX6XeHPN+pLDkCDKDhHgpp9INl0FztNZMTsqz5AaZadZo+oV+F+40IiUWSB9aSlgoQnw2ahklkA3fa7oiGoW+MbQYcEnuGQN29znOG2wXZR03+Rr08cDFsFhQ2P/0FMEkXjxk5t9/BZNshuajEBBxuvuWD/AoDohKS+hHV7PCOPg8Yd0xp5IQOJgfp0I9xifRZ5u76mnn5eCF9pAWVi0iTXRkN3EDzOxYZdEy2+QXlKxbr4olGbJVKqN5IrD2Or8pgCu0DwJbD9gxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxgsOjuMBg+nR+h/5ZIz401LrwJ5bWo0sTvhBMs20jc=;
 b=hNeuhnhQqf4N1c42m0xm8jqVjp+kUyQOo8I04Y8RiZwOqgFxbMRleeVqntEuLmtA9QEYxwUfLNeVynmcr1hEdASXrpaxSUZbu0HHzydDu7qcC+HkOSnqYziM5UL9vH0SRMyEIgWR1e3yis39VBYuqF7fyA+cTGX8ubWSIki6jJExCz9YFM51tGDIZzozBrXPhBeFsMlLSeQ8DpOLzKDNDgGWFFy4xd1Yn9U9zEHsARpJYxLwu36btWovAC6ir12pg82e1ejGVqY3v1pskaxh/G/ZvHC1P6z8vNCXvg7orKKmIGs1hJMy8g+dNaVcxOu2RBJOJ99YMmyGjif26xgFpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxgsOjuMBg+nR+h/5ZIz401LrwJ5bWo0sTvhBMs20jc=;
 b=turgR/Um86NaoDDmKRGRUIdaPbA10qSGdMaG2inSr9TYq9lhVTIwZfAZ+XtZvLamrcGgamWLMdXDqFkdEOn+QMQts9Ftk0IwmQ0RXsQv4wj9rb6ThoQDwdZt/GtDmRwOBmFcRIMmvT/Ce0ufnHu8naDdF3d8g4dH+ctjWbfYkrQ=
Received: from SJ0PR13CA0206.namprd13.prod.outlook.com (2603:10b6:a03:2c3::31)
 by PH7PR12MB6444.namprd12.prod.outlook.com (2603:10b6:510:1f8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 17:32:32 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::d5) by SJ0PR13CA0206.outlook.office365.com
 (2603:10b6:a03:2c3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.16 via Frontend Transport; Wed,
 29 Apr 2026 17:32:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:32:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 12:31:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 12:31:26 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 12:31:23 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 2/4] usb: dwc3: xilinx: Introduce dwc3_xlnx_config for per-platform data
Date: Wed, 29 Apr 2026 23:00:48 +0530
Message-ID: <20260429173050.1772377-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
References: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|PH7PR12MB6444:EE_
X-MS-Office365-Filtering-Correlation-Id: 196989da-3d65-476a-3347-08dea6154a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nJC72asbofGQY6oksBW7vKEf2GnIk74W3dKOqKkq6/aodJP7VTc34Xuj45vmMYpiwboCSuAyR57WohCCfC9iB9mSStwu//WYQ81JoypWezY8Z3x3w97HlWfVZo6cASxiEXxXZxK6klzADkXUYxpczqYEB5oybfVpIKNY/POCz5XvvbPPhuQr6T8AXTF+J8gRcJ/Wjs5HUe28T+lOGp85fwWpZB2PuBKPulAPQ84G9GCSfb/FIYjY5AEzB2S5qpXMWWaMlj7Ff7m5ABS631VgwQd+VWpxKrDMZDbUHHEANCYeD4+KTuvbEUy5wRX6BYE+awv4OU4f43n79X+IBdozYAuXs+v1mD1QEs/BxgOSaj4Si/r7Kk8kIG/vo2jrXKo9IkzmOEJtgl3HscFWgsGnpkui1f8s15g1ITwFaHyTFkdvkTNl0+F6ujUQROT3+fyssgBxHpszAKBuMDKupmffYZaA1I6NUerkRo8Cao9+YK9Y3IorKFPJ7pz7T/duGA4+VwqlbmUBbMDmvl1jWAB05WScizVbmOFFeUSgSiWkai18KBeuygQVGkvizPZcY3w5R3t0bA7RWKt/lNHGsNtdIoTc36BNYj9HqZaCQ/Fm3v34lRy+hWpD/sc7akHa6bLTvegzdPD0WbEfEsjj9AUGrqA3Seys/3I0dJBn4j0ZeQS9v93hn8GmXA2sB+Vq5J/tVM2ErcwS0sgvsgMV5meT7+tl7hg+5on73bTRqq5E6jnxk6TWpuJtM4i3IPSepTDjo/JKcL03JASoWCMUYFeG9Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jRaaQar9kFj/6ucDTdk1HPhxpqXu07fswZYAwUKXYG2cMzxicT2/aCxpiU5ySEcxOx+iV8oINjI0D6+dAs2ln+rZb9NOKgnFIwiWmBM1cFHJZI+Aa33tgzWawQMXizX3iHYmv8dm3gqvf7yHkF19OAcESFOWgZ4VbNzl0o2XY6scMYhHpfzhSND5JwObudNH3NW62vJS9N3fMfaf/vE7iU0gVmc5XuVfvHMN+D9699gACshE0Hfvap8vWsi4VyZVr/Ee4R+XbysapfW9DuE9EwAcZ08aPjDeOT7ojA+wvCQB2zk6BKLigZ+z+16XgZqrIWOBI55eS56q4qvFM466lMdB7AzeLzKndFg7ZVWQpa8FdrJnf45Os6bdOqivPqIB2od5mM6alZqN6rVz4DOE+1mz0pz/5GEdqjEzIzezQiN9hY+BvZUiuSfdI0gd2QHO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:32:29.8328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 196989da-3d65-476a-3347-08dea6154a03
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6444
X-Rspamd-Queue-Id: 620AB498370
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36704-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Replace the direct pltfm_init function pointer in struct dwc3_xlnx with
a const pointer to a new struct dwc3_xlnx_config. This groups
per-platform configuration in one place and allows future patches to add
platform-specific fields (e.g. tx_deemph) without growing dwc3_xlnx.

While at it, switch from of_match_node() to device_get_match_data() to
simplify the match data lookup.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- Add check if dwc3_config exists.

Changes for v2:
- New patch, split from "Add Versal2 MMI USB 3.2 controller support".
- Use device_get_match_data() instead of of_match_node().
---
 drivers/usb/dwc3/dwc3-xilinx.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index f41b0da5e89d..af0ccd060c8b 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of_platform.h>
@@ -41,12 +42,18 @@
 #define XLNX_USB_FPD_POWER_PRSNT		0x80
 #define FPD_POWER_PRSNT_OPTION			BIT(0)
 
+struct dwc3_xlnx;
+
+struct dwc3_xlnx_config {
+	int				(*pltfm_init)(struct dwc3_xlnx *data);
+};
+
 struct dwc3_xlnx {
 	int				num_clocks;
 	struct clk_bulk_data		*clks;
 	struct device			*dev;
 	void __iomem			*regs;
-	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	const struct dwc3_xlnx_config	*dwc3_config;
 	struct phy			*usb3_phy;
 };
 
@@ -241,14 +248,22 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	return ret;
 }
 
+static const struct dwc3_xlnx_config zynqmp_config = {
+	.pltfm_init = dwc3_xlnx_init_zynqmp,
+};
+
+static const struct dwc3_xlnx_config versal_config = {
+	.pltfm_init = dwc3_xlnx_init_versal,
+};
+
 static const struct of_device_id dwc3_xlnx_of_match[] = {
 	{
 		.compatible = "xlnx,zynqmp-dwc3",
-		.data = &dwc3_xlnx_init_zynqmp,
+		.data = &zynqmp_config,
 	},
 	{
 		.compatible = "xlnx,versal-dwc3",
-		.data = &dwc3_xlnx_init_versal,
+		.data = &versal_config,
 	},
 	{ /* Sentinel */ }
 };
@@ -284,7 +299,6 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	struct dwc3_xlnx		*priv_data;
 	struct device			*dev = &pdev->dev;
 	struct device_node		*np = dev->of_node;
-	const struct of_device_id	*match;
 	void __iomem			*regs;
 	int				ret;
 
@@ -296,9 +310,10 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
-	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
-
-	priv_data->pltfm_init = match->data;
+	priv_data->dwc3_config = device_get_match_data(dev);
+	if (!priv_data->dwc3_config)
+		return dev_err_probe(dev, -ENODEV,
+				     "missing dwc3 platform configuration\n");
 	priv_data->regs = regs;
 	priv_data->dev = dev;
 
@@ -314,7 +329,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = priv_data->pltfm_init(priv_data);
+	ret = priv_data->dwc3_config->pltfm_init(priv_data);
 	if (ret)
 		goto err_clk_put;
 
-- 
2.43.0


