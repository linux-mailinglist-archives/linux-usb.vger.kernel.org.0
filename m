Return-Path: <linux-usb+bounces-30736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3351FC70D22
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 20:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 69662347A2C
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 19:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECA236CE1B;
	Wed, 19 Nov 2025 19:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bmXbIdnr"
X-Original-To: linux-usb@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5175228469C;
	Wed, 19 Nov 2025 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580682; cv=fail; b=PTwbdcUsvGH2jji0c1lANoD715rDe/5etZzRotsftjxBVefbw1XvllmXbLgQMFspKaGxz8wUZ7BE2fcdNOGEJBNS8GbDqJ3wWgJxI8WpV17qLMmx7XVdaBBZB/rToeZQC83rD7JNWVTLLa6EdUi1OuUcdl/mpuXm1oj8J6QSsWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580682; c=relaxed/simple;
	bh=RFifCJc4Sq4tf/+LDPKYhDaDolWwlQmZHnoa66NuaFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V9NksbovL3cJL1y6AUYK9DseqjDCsIeFgHinn/A1hwe1uPa8F7vBvzXTibUxb6oLYrobFu1H1YL0F9vmQpvcqZTPqPICXCHBF4ZhrLNC6/AmkUVnTzwLhq/xvQ+swvZjIhXJqdcZhl8cSGxhYTzXcW12+545DlzEVptCNvfOHlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bmXbIdnr; arc=fail smtp.client-ip=40.93.196.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFJJg9k4mUxK4NV9hn35jABSQfEInNBvuTuLchRtMSUQlu6hsihljIOfKzABdB5JZfkVNOampL53OJdCV6qEmaEXmX9LuTQ5hyAQkLhzkZNGQ9YhuyO+xTD7qC7XZwi3RJ20xuQLAbAuZDqKu+QJEREssrI35XOd624NFHNTq2peh8dYJKsupBW+LvJfachtFPNlXxuLGmyvXmtzT0DKr66s2G0n/bs9i3CvCyT5sqoKDeKiQdwJ85DMaHZJMvaJ8kjRMRT70zkHbxAnifZxqcX0bD9uY06JSgR5HPx28avGAZWcwIkkN1aYuzGI9GmAPGcYfoLzRBU5b9JuffsrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGM/e18qquKnfNQJw7VHkW6TOT7coZQaep8htBIGk4g=;
 b=DkfSJeUCh98QyLyj5X6G1i8jENNc1wHZ9jImRmrFY6ctCAG9vCFXd/mRByiWkzxnOBmSO1nKCC6hro+3f2gpv80GectKuogw8wn130/FI8UCeZuy7k8udQzzz6R7Xuq1VVFye+xsQ5zgbTK4pMNd5kmd5uC6UOi2+F8lpp+76W+tLmhUMw+9Sp0lB1+jHoxHY7V0YxXGN6WX52XNO3a8v+zL6YjhH70ooBZZFlndfNiUiE/6R1EmEDP8zFV2fyxvdvxVMllB59fI7qg9nk/OYW1VV9hlz5+fBcK3QTycLh+ZppKQQEtIdww3AjcwhRfO9gbPbNsObd34m0rsUvphsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGM/e18qquKnfNQJw7VHkW6TOT7coZQaep8htBIGk4g=;
 b=bmXbIdnrySWyWa9jWFo3H+UgOG6NHxVAgs2DcJrAv42OTZMtxjQRvH+kCd3nvHOCkgm2sVxvTRsJt302RfodHdFR5D7kutrzhjKvEWRwTNIl08US/fBxf5x1xh2cDB6aa4cEeagQNuTnq0nchHXRcT8H4DU4lwFi5KNvckTnW2o=
Received: from SJ0PR03CA0179.namprd03.prod.outlook.com (2603:10b6:a03:338::34)
 by LV9PR12MB9831.namprd12.prod.outlook.com (2603:10b6:408:2e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:31:09 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:338:cafe::4f) by SJ0PR03CA0179.outlook.office365.com
 (2603:10b6:a03:338::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 19:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 19:31:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 19 Nov
 2025 11:30:53 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Nov
 2025 13:30:52 -0600
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 11:30:49 -0800
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 2/3] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Thu, 20 Nov 2025 01:00:35 +0530
Message-ID: <20251119193036.2666877-3-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
References: <20251119193036.2666877-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|LV9PR12MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f1c558-ef7b-4977-12e4-08de27a22f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BA3CeUsup89IFAJ5LtHNgWquL8FfuUEeJFCeZfTbOAR5HpyaBEvoovZwkT9w?=
 =?us-ascii?Q?ujra8vt/YETykN6jC2aNnsINsDC+E8/QwN8XdLK8Q9iIF0OUP0ztgIszsHi3?=
 =?us-ascii?Q?hEBigFPnuBAU3FTAVDgXc/Am+hlOM7CGOICUameyAT/NWXNn1FsFZ1wwWC7t?=
 =?us-ascii?Q?v4Pg5leDm5bqHPH3SIgq/zLXJEMGRriCjDcGZglC/KyfVdtlOM0LcZ6oqVqD?=
 =?us-ascii?Q?yf5QnDmYaJAD04PDhNZYDx+jIKBhcdyN0Xo2EGuj4VyEoGsLUwNv37CBw1+2?=
 =?us-ascii?Q?jowRDbzkOfqvW1YCqxxfjgrw/ulA+J9VMBmkvc4J8q51I6Bbd19UMgSovbGC?=
 =?us-ascii?Q?VLWs+d6UHelIIZWwWnJP/PVadv41ZvFUmh3tFcXU4jNYM6NqznqS43BEf9P8?=
 =?us-ascii?Q?9bFEGZ0xo74lgOH1VYQiftMMROTOaLMwEVlK6j9Bv2JUayYsBQ6efFiENvCx?=
 =?us-ascii?Q?7cTHbakSwVDxY5+8pOXEMYWeLTqp2vvQKI5ymdGVs2mGu22xic1rpbCPUwb3?=
 =?us-ascii?Q?Mrepu6lv8lUoZvxTyc4ZaMiVtlwhBfMFvtCxmHwXoPVks70BPfgySH0Lzn5t?=
 =?us-ascii?Q?CiPc7n/rQcaGn+VcmJwbxWUwN8RHSLRUHqK4hsLKWy60I/mwaJ205YH1sPcP?=
 =?us-ascii?Q?1P4nG0MpdyfLKaag0+XIbpwjCiP7qq22d6HLTMMsUZDSFo/IGXHZpEQ5ifTr?=
 =?us-ascii?Q?s+yp0bQfRiaWeT5NFdFrzuhwH0AsE5sBS9eDBQlAb32MnuSosOma+YocnO5G?=
 =?us-ascii?Q?rzjVZ2ZF27zWIq2ml9Xw9euci7FiSkA01vf0dRhCBNnESzeqRFaTndgDKU4S?=
 =?us-ascii?Q?tMTWbXlhNFzvezQu33L7Qhcqf2qNe5ZXJ1tSBJtWqJBXddDjxnx1J4/AJsUv?=
 =?us-ascii?Q?uX/UFmAU87RsIW3mU3moTMohJ3/7QODx2M1r6q46Mmb4/61PmZxoO5XnoI2E?=
 =?us-ascii?Q?OFearZeQkqqJsh0QyFf2ooAfGuyEOAwmNstlfzACstqtCJ7W0ylPB1zLLN7I?=
 =?us-ascii?Q?gdfI6iWSl1RsCiN1ZcMzcZNm5Rjo8IUgQxrBm7pfvd4x+rvy/mImIpyNQfcL?=
 =?us-ascii?Q?lHnuax/pGYw1rj0lHYYn6LXzUUqXAMEDQV15IUlWWe6nh7nJdmdZbQzUdcGK?=
 =?us-ascii?Q?Gj5xzQwFVg+JEBpXRYH+tVDefDnCMdVfX3KbzV9KRWkXtWFAODDGIcSb3GzN?=
 =?us-ascii?Q?egWbFz87HIHwy58a9Z8ynK1Mluj92o1Nyacra064wH6f85t0U41ohEA/970k?=
 =?us-ascii?Q?8zSPilJomFpiKMhptH8M6nl4K9WaFfh+KbqgTQlnQpyXhtJ1joRTCNhuTxxz?=
 =?us-ascii?Q?FKr7MDFXJfkAn8bBhS4Cdg5YO2ii8kd+E+LJfYyH84tHfc/D/VsgrUD+aXwn?=
 =?us-ascii?Q?CjKBOr07RQ6d/7WVFRJMClHMn2x47WN19k9kmOvtusUteJV/mmd3Jg8PZp7U?=
 =?us-ascii?Q?4tMHLmIjH3gAiwbIIw2DqZNysN8MsEswl7GhZ6QnIDlwBVnO1wJ1+h9LhW8+?=
 =?us-ascii?Q?iBPpfzgHtfzLxeWqdLKfcZqokJxWEY/RbKs/yudN8w+QGW9RqBxHgRK098Gf?=
 =?us-ascii?Q?kE7UtFm34SRq66BhjEE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:31:06.8864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f1c558-ef7b-4977-12e4-08de27a22f9d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9831

Multi-media integrated (MMI) USB3.2 DRD IP is usb3.1 gen2 controller
which support following speed SSP (10-Gbps), SuperSpeed(5-Gbps),
high-speed(480-Mbps), full-speed(12-Mbps), and low-speed(1.5-Mbps)
operation modes.

USB2 and USB3 PHY support Physical connectivity via the Type-C
connectivity. DWC3 wrapper IP IO space is in SLCR so reg is made
optional.

The driver is required for the clock, reset and platform specific
initialization. In this initial version typec reversibility is not
implemented and it is assumed that USB3 PHY TCA mux programming is
done by MMI configuration data object (CDOs) and TI PD controller
is configured using external tiva programmer on VEK385 evaluation
board.

Tested host mode with mass storage device.

Bus 002 Device 002: ID 0951:177f
Bus 001 Device 001: ID 1d6b:0002
Bus 002 Device 001: ID 1d6b:0003

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 drivers/usb/dwc3/dwc3-xilinx.c | 70 +++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index 1e28d6f50ed0..32f87a238d0e 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -46,10 +46,15 @@ struct dwc3_xlnx {
 	struct clk_bulk_data		*clks;
 	struct device			*dev;
 	void __iomem			*regs;
-	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	const struct dwc3_xlnx_config	*dwc3_config;
 	struct phy			*usb3_phy;
 };
 
+struct dwc3_xlnx_config {
+	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	bool				map_resource;
+};
+
 static void dwc3_xlnx_mask_phy_rst(struct dwc3_xlnx *priv_data, bool mask)
 {
 	u32 reg;
@@ -86,6 +91,29 @@ static void dwc3_xlnx_set_coherency(struct dwc3_xlnx *priv_data, u32 coherency_o
 	}
 }
 
+static int dwc3_xlnx_init_versal2(struct dwc3_xlnx *priv_data)
+{
+	struct device		*dev = priv_data->dev;
+	struct reset_control	*crst;
+	int			ret;
+
+	crst = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(crst))
+		return dev_err_probe(dev, PTR_ERR(crst),
+				     "failed to get reset signal\n");
+
+	/* Assert and De-assert reset */
+	ret = reset_control_assert(crst);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to assert Reset\n");
+
+	ret = reset_control_deassert(crst);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to De-assert Reset\n");
+
+	return 0;
+}
+
 static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 {
 	struct device		*dev = priv_data->dev;
@@ -244,14 +272,32 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 	return ret;
 }
 
+static const struct dwc3_xlnx_config zynqmp_config = {
+	.pltfm_init = dwc3_xlnx_init_zynqmp,
+	.map_resource = true,
+};
+
+static const struct dwc3_xlnx_config versal_config = {
+	.pltfm_init = dwc3_xlnx_init_versal,
+	.map_resource = true,
+};
+
+static const struct dwc3_xlnx_config versal2_config = {
+	.pltfm_init = dwc3_xlnx_init_versal2,
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
+	},
+	{
+		.compatible = "xlnx,versal2-mmi-dwc3",
+		.data = &versal2_config,
 	},
 	{ /* Sentinel */ }
 };
@@ -295,14 +341,18 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (!priv_data)
 		return -ENOMEM;
 
-	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
-		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
-
 	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
 
-	priv_data->pltfm_init = match->data;
-	priv_data->regs = regs;
+	priv_data->dwc3_config = match->data;
+
+	if (priv_data->dwc3_config->map_resource) {
+		regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(regs))
+			return dev_err_probe(dev, PTR_ERR(regs),
+					     "failed to map registers\n");
+		priv_data->regs = regs;
+	}
+
 	priv_data->dev = dev;
 
 	platform_set_drvdata(pdev, priv_data);
@@ -317,7 +367,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = priv_data->pltfm_init(priv_data);
+	ret = priv_data->dwc3_config->pltfm_init(priv_data);
 	if (ret)
 		goto err_clk_put;
 
-- 
2.34.1


