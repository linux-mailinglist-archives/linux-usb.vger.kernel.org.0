Return-Path: <linux-usb+bounces-35695-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI2ZEj3JymmL/wUAu9opvQ
	(envelope-from <linux-usb+bounces-35695-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:04:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 873353601E0
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 021253016150
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 19:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D95F3E121F;
	Mon, 30 Mar 2026 19:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z4ebTpj4"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB392C21D0;
	Mon, 30 Mar 2026 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774897413; cv=fail; b=crF7wDvCyT2SA60YUxVL3y9jdP4PPqjVSTmw6joqt83GVv48BgziwUp2pSmP2/cTf9yM6JiRp/GB1xlFOuxL7xPXtecd8HcZ+IjAjuVN0mptrxymyg1RHi9OfbGdQniucqLQrda80Bmdzbuf8jKyUrnCyNZJWvxxq3OHCSixGkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774897413; c=relaxed/simple;
	bh=xBPggGNMdiLnypBQGe+xcJFXEii+OVcD6Uuhauf5Kr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAcEZNqtobSwzCp5+hqpsa3XYaKcmBpX+aEsRu7hYr1nuKmZI/+yXfN/fMNLbzwZ9OdDhCuhkAbRBkYM/RcueQsJOeMIuwzVxAnWtm8f5DIppDBwEfB2TLn3G4+Ub5ZBZUjXVZfM9Y1Gcg4QsSlgO2nUnB/SPhUm6kXIiIet0xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z4ebTpj4; arc=fail smtp.client-ip=52.101.52.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zuu+n4ltUg78Qusm8u+cYaRqF8QQoHUS/9s0KK8AKa5TDo5EDSYgSehu0v4KXQUKE9ri9MNqPjSbkRCORlT7p0icMwv0YepWOkHwU0KZ0Pjsk4y7/SXp7Dv4VONs+hoSfaRp1QYkzssys5tIx1RwYsVjheTrCAtkR9eqoiyaP08JHRH5gTt4tFGlgwqmOQeY/4E7EvjxeRXn4pWK2U6Zswm8KAjeIwtsoGxmf00gkHB/7A1Ykt6aV6Flo4VuczpmHQleFsyyZEFGR3G5kHka4absHMLi6/mPHu2kplnAJr+pzXHERCmtfXotUQD7t3uhUMbEy2Mr6EG53gLSVTrhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yUpBIcHcTeVFOavUv/A92xychCX0F2lmdoJrnrbc6VM=;
 b=BThRQ+EhnwIPYB8YWCYmwb/Jw32pD6U4lDEwqzMBlpOjVy4YujoDl9wtxwU+rK1BcV12kP2O0FlrMgoE5fJ0FNdbj6ugJNPNmowf9MHJd7Y2NgfeWNM8mIfKNaE3lltUYmedx3kgnDRP4WTSAT9Ey0eK4TbrCQ7W1jHNuUX2fbLShTwdrxE+wa+RaUVq9J/1mb1Tk9qaFRFZ92giBHEvSnCr5J0HbJFHNbuS4zDA1xGaP1hnH9t2TJ9ZE5tqqMZuwdyTo329zo7Fdt5z+83vHvgUIqHSdS9X9hknKGrUjvxcS2U+6jWusB3y04JY0Ua2VecDRPP57ed5SxH9RqMtdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yUpBIcHcTeVFOavUv/A92xychCX0F2lmdoJrnrbc6VM=;
 b=Z4ebTpj4gVNEjI7hDKuWN/T7Pu5w7CwdK8VSsgy7hG6x4SaxAnIWHiTM/2gPDCEgySSaopeJqRFSXwJSiadW73Hd5Fv58ON9P33wyczhNzCFXrku0vKPQQlvgWjNbyMlGbFXbp7ZvYugPhE+M5jCtsqmCAW0iLedJgFaL221Ffg=
Received: from BLAPR03CA0109.namprd03.prod.outlook.com (2603:10b6:208:32a::24)
 by MW4PR12MB5642.namprd12.prod.outlook.com (2603:10b6:303:187::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 19:03:25 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::36) by BLAPR03CA0109.outlook.office365.com
 (2603:10b6:208:32a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 19:03:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 19:03:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 30 Mar
 2026 14:03:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Mar
 2026 14:03:23 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 14:03:20 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v2 2/4] usb: dwc3: xilinx: Introduce dwc3_xlnx_config for per-platform data
Date: Tue, 31 Mar 2026 00:33:02 +0530
Message-ID: <20260330190304.1841593-3-radhey.shyam.pandey@amd.com>
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
Received-SPF: None (SATLEXMB04.amd.com: radhey.shyam.pandey@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|MW4PR12MB5642:EE_
X-MS-Office365-Filtering-Correlation-Id: 9216567d-ecc5-48ea-a3d0-08de8e8f051a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q/GPcoUJbPjgtobti3vG+n7TYI2UWSVl8VKd1gNe9+hYu2OjYLXQUNmkDI+i9ttZ4sQxc6br2EbiT7fFXV7g0PEo7FFJoFw55IOOmj3Zv/bnkE0PqUTybKq7KAewg9iyrc8AY+LK7HffYLy1v0DpcFonYioyBLtyG7ttlIHFWlOz7JrPOF4nHCOqARJdm4gFhi/GrtXNBrKBRulPgBciZ7cxPhxzBGM5gnqix2rSfXADJ2ougmkgqwd3iWt/wObWJOYnB1HWxqSXFBX4oNfwvh//LJ5l8srLm8R6osCZ2F5/b8YS/Vh5YO0IsDdVVqnfgRat4P6UQHyeCqdmQu3pa7neLW+VFPI4Z8TgMNCLAknzVFl19GF+K62UxjKvaxqD0RB/a2Om9AO1iBHa8Jd5z84rGP9qKRJD4Z+T9Lc3VVBUTy8oAf5liWDXwBrlV8Fxv7BNkSq1WvymZX2vhR7PPzo3JB/QFgNQRfN2Pol5uSMw46aO8kZA8X1yb9FVLaYrGtZKdfcWPv0Bnx9JRLAkSCKYcmazMfVual7kBuSOWvrPSp0J+I82j7w8tL5yZf5W/cUYKGyaMs5IdzwNnxVee/1DLt57y6aAVEDH20uWDk0cZYgHObZIVisCiygkGiNHHXWglfx7+J5NRz+Xxw5O4ECc76I6LwQQ0Pd/PahFQBNMh5hPxZroAKC5MU9yU+2oJu9RLulTHpxx+XC7Y89iMp+dVUYBSWhhOHvi0vECYE4VMaTE8RwTUNHwTj+MOeqEASLbxf63J2MwhXh/432rkA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tnYQHmWQOfySXRMnAOgBqCyKaclExl7luV4aBl1INwT8SKjLAwRCV1fTLMrcrU+aCOPZSgF2PSHf/mGrNU6hSp5AtjI0D6zhseUKDiVTzMr+yn8UD1ZEnBhG3mRSw+RaYhz1j+4HMhHN9LzIbT1gYbv4ZJAwm5VoJx0vdUUzP2DpP2nj1XtZcX2OmfI7YyfdBWZPCfioCE17O5jx/+9vMFSQtaviJE5P6gLJ+w+pIylToixSYXyi8cE+Nsg2ihdV0X2Y+0ca8N+NdZJSON5JBFbJU5/8YET+vcabfpkaH5xgHmAitNMCTGkycYK1GlyLN280rcJtwxaSrDSP6EDclwxOAdQQoqi03wP65spRMJLV5cOj/eP07rMQeq6rVeTj6SVrviHlQGtl7pVyAbMnxb8D3K/TzaAj+eyxD7ipGpSIabyLKUWgpoDyokJxG2I7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:03:24.9833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9216567d-ecc5-48ea-a3d0-08de8e8f051a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5642
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35695-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 873353601E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the direct pltfm_init function pointer in struct dwc3_xlnx with
a const pointer to a new struct dwc3_xlnx_config. This groups
per-platform configuration in one place and allows future patches to add
platform-specific fields (e.g. tx_deemph) without growing dwc3_xlnx.

While at it, switch from of_match_node() to device_get_match_data() to
simplify the match data lookup.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v2:
- New patch, split from "Add Versal2 MMI USB 3.2 controller support".
- Use device_get_match_data() instead of of_match_node().
---
 drivers/usb/dwc3/dwc3-xilinx.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index f41b0da5e89d..bb59b56726e7 100644
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
 
@@ -296,9 +310,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return dev_err_probe(dev, PTR_ERR(regs), "failed to map registers\n");
 
-	match = of_match_node(dwc3_xlnx_of_match, pdev->dev.of_node);
-
-	priv_data->pltfm_init = match->data;
+	priv_data->dwc3_config = device_get_match_data(dev);
 	priv_data->regs = regs;
 	priv_data->dev = dev;
 
@@ -314,7 +326,7 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = priv_data->pltfm_init(priv_data);
+	ret = priv_data->dwc3_config->pltfm_init(priv_data);
 	if (ret)
 		goto err_clk_put;
 
-- 
2.43.0


