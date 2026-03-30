Return-Path: <linux-usb+bounces-35696-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKh9FzXJymmL/wUAu9opvQ
	(envelope-from <linux-usb+bounces-35696-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:04:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C303601D0
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FEE4301F39D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 19:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6DA3E1232;
	Mon, 30 Mar 2026 19:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Q11s4+Kl"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4A03DFC7B;
	Mon, 30 Mar 2026 19:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897418; cv=fail; b=rqq2ItpPVzFAhYROceM8JZ3/muk0SLEnoAC/SoCdeoILUY/lx1GNRCFxxsd6DnUbetZGtvXGBAuRJHXInK4O53/CzlmAci/mRZ8fgOpo21ubvP5iFK7yN43ltlSWPQf2gCdwAFWAtJKXUZeS/YDaj7HYF79sGsHiXUXAmPqepAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897418; c=relaxed/simple;
	bh=jFeDid0ngcMk5Owpm0IGXgmj9egbLWxIGMdqwsb9OBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PhHQTLqidCiDkxOTgVb9vIXkhmJHoIWl2eavFfnJtBeTWS34Gddh4DZGxsmhaAH4Pvl8byi+62vG8ulKI2ranRoeA/nJPDAfnrH4vpsgUuI92IDuIa5RiMUkmqa5+k9XKXjJAsQpMR4S2+0p2XoZ3HmafQRqMi45LLhVZHsyW5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Q11s4+Kl; arc=fail smtp.client-ip=52.101.53.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqghGuoQMO9MNi/LPXp42Geh3TWrF8hld5Wm8TSmv73Rm1epIgFMW3xXdp8kLWpSLLh2EZfuP8Z6t3Zswzn8nRhDCOMS2hwO687+PptUIkXuZ9Ety2NgYmJqYq2pFaFb4f7C1g2Otev2ATAmZ9rRLbU8PA92lHkWtkKIzA2LAXRwL7+Omx4T2U4NRVl7/Xbg1SQDp+Y69CrZ1VztMv7cWy8x95lpLG0rWSweTH5dbTErAJWm6XgfH9E07MrI2Af+5aY2UoEEMLIJdCZMjSIEk/bdrz2qzOZ5+p4l1/HJk0uHQh3RBNA4zRrNFr7g2hFqGksV4mbN2xNvJNJ04loNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rfjt+/Nac1Cypu0qPqtp3MMvLDOEJvWIzqEKaR++luk=;
 b=sQgZwrqBuWN8A0uoUgePITnlBDNMhC3LgMDl4upqQgydXjJWghm0RhB/ccihkBjZI9TPrdCCrqIkLwn8a16vjsnM9waeB11r/B1viD0ew4qOQIjY5ejCuZcBETXXm0Dr4SFNmSAGCkAqNjvqNT6O+75jwxSq/EDO6cfVL0reZ+NgF8cdEOolsBZouq3R6UjAE+lXRIAOsGGtGQcXZIHmwtPOGYqFtK6jX5AjkQ407K0smDvhHxGvmIyXyv/bfSHeVY1pFaCa8/JIKJf8IcC6iHUTsd2Rfl7WK1t8W/GAGR8XJT9hwKpXm4Uu/s5Qll47ybs9LD0tB78KvFy5JdQhZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfjt+/Nac1Cypu0qPqtp3MMvLDOEJvWIzqEKaR++luk=;
 b=Q11s4+KlSOkNwLhD7lAeD1RMNUI4IGPtTBXQqj3F/KEyJ2+E0r8HU/i+3lOUcyVx7T4QKK/N7vj7TsPo4RKYTuR7m8t20kPR2vj7qREN9Qcxa58pdyu9Hi131KUzKVJ5O3lIr46/WTE7VSR9VpI83zpOrzcWeifHw2w/1Rsl4V4=
Received: from SJ0PR03CA0331.namprd03.prod.outlook.com (2603:10b6:a03:39c::6)
 by CH8PR12MB9838.namprd12.prod.outlook.com (2603:10b6:610:270::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 19:03:29 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::6e) by SJ0PR03CA0331.outlook.office365.com
 (2603:10b6:a03:39c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 19:03:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 19:03:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 14:03:26 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 14:03:23 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 3/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Tue, 31 Mar 2026 00:33:03 +0530
Message-ID: <20260330190304.1841593-4-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH8PR12MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 187c7c3b-97fe-49d3-918e-08de8e8f073d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Cb5bvisdnrmPQW6xqER0k3LVD2CtTZhPMe8HVk/oT+v7NYq5uwH5NyYUbDim4u2BI+OhCFDTlewkmLPJ8MjQm1hYrDZ2FMjkAI1t4aMyP4OykEpYDfido1z/AmZtdv85cRka2mH6MAVA+p7zY36BQ/kWbEF3xScVbzzz34k6V41r1NXnLZ9+s6T6THWRqUSU+ouU8bEkPhxEa8wM3DrsO9SJRYnG5EifAMbaywqLEzxFhFSQBJzmGiP90fVRwpY+19axv3/RtVJ/1X+Q4R0pSbDNHUm3zwt2F0oHXudkm4+YzIPSjo0Hp48++GMkMrn6cxfzorgVmKeLVloeWTZv10QBl8adbog0LN/WK5iUIWDnM7vMv+HieU3caw/9WAu2MpCut1mBIvaj0ICw8i8Tp95SXdI40TF7cIqInEpA4A4oNnOQAwgB4boDpCcXp0fb6nEXRSNG+I5kuQ5t4gFUly7DFr06wXdwyRNHMr5kXJo8opjsICS5EozIN+C4VC0dgzmLIxAH1LhzOIXhvfB/tIDY4lXXcwvpiWLBBHIVBC6oxS4QLaZddCh6T3EkRzX0MIUFwXPwm6ttoQu7vEJ3ycujjZQxVNhPEvuwcC/o97KuA8VuGdeZVSJuWQsaiPAh2X5FjITrrUvqDDs6DLLXTSsUGBxNFs+ckOYwFFVtComnEH5vBQnA/lCbETmCxWRqSabwGRkf2yOOJOClCe39EyFuzJAGxSix3fhJSX0JYlF306Im/aPcmeUfli+KqYdSM0fcbnBi4IA2Yi8Yfzbe4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	spjZCYU+pffOZzLQdTGa0wLMfnCAnd5i0WBkq0VxxqLkX2YIAcX9EgvYWvjoMUOf2rkeZh2+Q4O9nAe1cSfjson2I46DZmoJFXHrzGS0DXoROoXJ2rgS6Bg1M9dOhnsmec6Pk6z/Nu+Av3V+jkTOxZV/N/vGpFVAuf0DE3pVFqPBhD1Og0N4JLb+JCGSM4Yx4Qfh+zP7DzkNf4Zzy9PYPr5t4S00B4Tf9WyjEv3mN1cr6VxGNvJdkW8mhsKjfDLjOu8Bw7hQONqCoHUfj5aqRchr8kp5fOekzlzc1jDQkCKKNWsnmKt2V2i/Th58i4/NXzdUYqOBd9GUhzy5TXWFU5NsokooQZOJezrRzyv087Ep1mCLtTUpDkbfCvuX1jK+72/nkdJJBIOHPW0FC/fry0USa5xEjUhkE1RVcpsgWVMFYnGYLZw04LSpQHvMKhmy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:03:28.5017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 187c7c3b-97fe-49d3-918e-08de8e8f073d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9838
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35696-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 18C303601D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Multi-media integrated (MMI) USB3.2 DRD IP is usb3.1 gen2 controller
which support following speed SSP (10-Gbps), SuperSpeed(5-Gbps),
high-speed(480-Mbps), full-speed(12-Mbps), and low-speed(1.5-Mbps)
operation modes.

USB2 and USB3 PHY support Physical connectivity via the Type-C
connectivity. The MMI USB controller does not have a dedicated wrapper
register space, so ioremap is skipped via the map_resource config flag.

The driver handles clock and reset initialization. In this initial
version typec reversibility is not implemented and it is assumed that
USB3 PHY TCA mux programming is done by MMI configuration data object
(CDOs) and TI PD controller is configured using external tiva programmer
on VEK385 evaluation board.

Tested host mode with mass storage device.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
- Introduce xlnx,usb-syscon phandle to access UDH address space
  which is wrapper subsystem IP for USB, DP and HDCP.
- Split config struct refactoring into separate patch (2/4).
- Remove unused regmap/syscon fields and parsing code; defer to
  patch that first consumes them.
- Fix error message capitalization to lowercase ("reset", "deassert").
---
 drivers/usb/dwc3/dwc3-xilinx.c | 50 ++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index bb59b56726e7..f2dee28bdc65 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -46,6 +46,7 @@ struct dwc3_xlnx;
 
 struct dwc3_xlnx_config {
 	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	bool				map_resource;
 };
 
 struct dwc3_xlnx {
@@ -93,6 +94,29 @@ static void dwc3_xlnx_set_coherency(struct dwc3_xlnx *priv_data, u32 coherency_o
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
+	/* assert and deassert reset */
+	ret = reset_control_assert(crst);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to assert reset\n");
+
+	ret = reset_control_deassert(crst);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to deassert reset\n");
+
+	return 0;
+}
+
 static int dwc3_xlnx_init_versal(struct dwc3_xlnx *priv_data)
 {
 	struct device		*dev = priv_data->dev;
@@ -250,10 +274,16 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv_data)
 
 static const struct dwc3_xlnx_config zynqmp_config = {
 	.pltfm_init = dwc3_xlnx_init_zynqmp,
+	.map_resource = true,
 };
 
 static const struct dwc3_xlnx_config versal_config = {
 	.pltfm_init = dwc3_xlnx_init_versal,
+	.map_resource = true,
+};
+
+static const struct dwc3_xlnx_config versal2_config = {
+	.pltfm_init = dwc3_xlnx_init_versal2,
 };
 
 static const struct of_device_id dwc3_xlnx_of_match[] = {
@@ -265,6 +295,10 @@ static const struct of_device_id dwc3_xlnx_of_match[] = {
 		.compatible = "xlnx,versal-dwc3",
 		.data = &versal_config,
 	},
+	{
+		.compatible = "xlnx,versal2-mmi-dwc3",
+		.data = &versal2_config,
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_xlnx_of_match);
@@ -299,19 +333,23 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	struct dwc3_xlnx		*priv_data;
 	struct device			*dev = &pdev->dev;
 	struct device_node		*np = dev->of_node;
-	void __iomem			*regs;
 	int				ret;
 
 	priv_data = devm_kzalloc(dev, sizeof(*priv_data), GFP_KERNEL);
 	if (!priv_data)
 		return -ENOMEM;
 
-	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs))
-		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
-
 	priv_data->dwc3_config = device_get_match_data(dev);
-	priv_data->regs = regs;
+
+	if (priv_data->dwc3_config->map_resource) {
+		void __iomem *regs;
+
+		regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(regs))
+			return dev_err_probe(dev, PTR_ERR(regs),
+					     "failed to map registers\n");
+		priv_data->regs = regs;
+	}
 	priv_data->dev = dev;
 
 	platform_set_drvdata(pdev, priv_data);
-- 
2.43.0


