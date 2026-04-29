Return-Path: <linux-usb+bounces-36702-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBXoBctA8mn7pAEAu9opvQ
	(envelope-from <linux-usb+bounces-36702-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:32:59 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C75449831D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E6AF3032DCA
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 17:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381E041322A;
	Wed, 29 Apr 2026 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="O/IQct9a"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C12EAD1C;
	Wed, 29 Apr 2026 17:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777483953; cv=fail; b=YDf3/++D2rIxQwC+rRpJ6pPWGIIeh1A1UUpZSV9wYUGQ+pH4YbTXUJBkoXZbr02KIs0zMJYCm2VgFxKeBh/8bn/jEAIPje050UIeWJttBexluspA7OreTMh3aVpzQkRTOhVfJlQ2PzIHvFVa+Gj1x2kkHsByEN1UzvTwvQjWuoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777483953; c=relaxed/simple;
	bh=osnOiNVFxnSQGCOThltKbDbF5FiQNpimqaMdzfZSYJY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KVjD6fp0D3CWD1mlFfavKPk6LilntrIQ76mJEzfIX3TdyfXUzxsO/0YoYuhrvXjuXjNeRPGRUlYPPje7kLcTRMnuKwBmIYtCfGgkQ08/oXsbnh9H/6DHqD6RZrW8MmyzgfzWsz6Q5gJGluPeuBuh85aS8grcCzBpMYaBY4THY+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=O/IQct9a; arc=fail smtp.client-ip=52.101.52.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6sO8L818QtzjOby+MGF2oL/NCb4D5TdHA1m909LZBYQJNmCiVjGvZuUs48LEPIKqV9AX5+n0UAYAu34JXkJH7xYkvS1pcBDVVkdwstSCqz/qsirLv4rkvICTgk5JIUYG9rMfyLxr4ZfjZdhPPDpD6P9jZtRJI/+MQQKjtF1jTtnQlIxhX42M5wxmZ/D8I16WjyucFxDoFDXzFYe76SAL7rSiBLelK5QHTWj/kyCwQf8YRUHoNxmsS+Jz9nwWRygQpYUuh5Wv9cYLPHsm3wY6vVT0AFJatyM2+V6RqIqdHPq07t1SbKMdxPIOswwU97u611++b+3LeVh7uS0b1kAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWtHcRxszGfX+2YktMBPq3OHGMpj50PEH60+SA0g8F4=;
 b=Mj0aL8F6B6x9e6p/3aLXDcQ+ZCGykEp+/nKufBMz4Rcr7yUL8Dx/LN7XAmnX5c9fqUoFOI08Ggp5phM6Vs43HJ5blRXs+bnJCSm4Rq7U2vbhT/GgWewOA5fcjP8GwIlbOhajOxKxqwgweysqkxzLNlbY6ZutULGn0rT7nOmetr8Pg4lk9Tys7yye3e41GVfHyaqni8t40drofpIKveaWNYfchX1vXcOb8jKuLUMj4Wz0r3eur/KEZwpORcAoZqVx4jdofmO5If21pMsTyu+bZmydRy8fTdIDfoPuQdPvlMPWUiU77mI0Mlq5ZNTaJsMmPAo0maCF4fmmPOJtDz7wRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWtHcRxszGfX+2YktMBPq3OHGMpj50PEH60+SA0g8F4=;
 b=O/IQct9adfH8hwXk7vdqYvOWT/oVobJUf222a53XN7KoYAEMN+QUikE+AYNicVl/T55RBFcY0qgG+m9ODuKuvAerCWQlCD20QUlINWMivPBmDQDi7nhMuzUOl1V4G1TmLsyZP6R7Lb0HKlQw4/J5FUIUZN8poVaW4DqQG/FgWwE=
Received: from SJ0PR03CA0238.namprd03.prod.outlook.com (2603:10b6:a03:39f::33)
 by LV8PR12MB9618.namprd12.prod.outlook.com (2603:10b6:408:2a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Wed, 29 Apr
 2026 17:32:18 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:39f:cafe::6d) by SJ0PR03CA0238.outlook.office365.com
 (2603:10b6:a03:39f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Wed,
 29 Apr 2026 17:32:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 29 Apr 2026 17:32:17 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 12:31:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Apr
 2026 10:31:30 -0700
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 29 Apr 2026 12:31:27 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v3 3/4] usb: dwc3: xilinx: Add Versal2 MMI USB 3.2 controller support
Date: Wed, 29 Apr 2026 23:00:49 +0530
Message-ID: <20260429173050.1772377-4-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|LV8PR12MB9618:EE_
X-MS-Office365-Filtering-Correlation-Id: 6952c014-d9f9-4408-b6b7-08dea61542ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9AEpys3ah1Zmt3MGmW/UFzoLhL09zcy3bMspYif1IpL2kis6IOanPtAMiyPDdqBkxRCE/4BBgsZ/Z7l73pRU0oLa6VcoX4CDCE3BIsfSs6Jxc6XKrexPSkaW37zmoFOPV95nM6eMU6HDqcZ47P9eVEQDNS57+YkvN1U3Myc+rwubWs9qTYS9q9eL03roB+jUA4ndQz/50PxMyfTu/PyQsOgSzw6iO42nZHQ7RVTte18TPzXaTX1DwUpARlAWDYDrhui/i8jc0b1x3YqbUOo60j3WIzDee3qTfij8a84IcEDr7WjZJIRDHLuyLz4Mjf4Vf/lD6SZhphjkPPyYOTcryggiPKEo42qd5qU6XucNASjDpM2Vgsdee2WpKZJVxhi974of/DpkVRKAikrsD+NxtxPPf8zNLpK7QK+k6mVJynKmEadULM6CkBAIpQpdpwFnkvydUK582FaBXbY9tYngAF9cWTlGQjvhLQ/w34J22Gkpaf9KeaftS+NQfK0dUmxfB8Zeijt5Pgr/oR7iEneYwK3+UWnvLZBmg03+j4hqRwZk3z4torVDeEf3nDs7vGA/2s2k75BmQd6xTyE90mDBqFo1kQqeYopBX4icgZKHaZt08gvMKQRxMonS/ww1Fc6RBzN+zTqPAVADg46eSYaA/IRsyjsVK5oHevxa1xiDqrdcuyKqbwjnL9OMpjMBq/2Z2ZW32ndRoL6igJ8pquBMNbvJS3uxRQPVAajLUNFVZtmSSqmkhGA5yO7PkAQYuAtrx5HHBm0obqQ6AF4enh3OSw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Uab1AhjcCqzgNUk0MGWYo4RUpA3FNrQKQ/nR+NsbNkf/IK7JwjhDrWvSpuGpbKJgMmyzMfBIY1fSP7rmZCirryBBoJtrB+PaJWOzHBI+B+GqbqKwnGogCI5H4wYNbH5wsKUT4SNsOKacSwjlosfZd5aK39+tiCXv8jpPhEqGPIDOrcLZb0jSHdFqCzajhaW1Fq23XduPIb/sKA2OIf5TnEeFdZl7mWutc80i/63ook3Jm9+X9wjEh+5KkzmP2avGoCYE3kmr2N2B5daoVjBloJwXNBBSoXzikzSXDeN2KYgfaSW88v7kJnUbsULIN1KzllNfyKbqOEJy4zUOS6kcU96src4Mq1rG2tG1hl64WMuRZ9AKSsaGMYe+t3GR1v2ImFVfxbBbgrFV3b0tCqCGDf72nwzfb/dDwhhZK/qhUSFyDegFxxq0vdNPuMlyi5pa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 17:32:17.9931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6952c014-d9f9-4408-b6b7-08dea61542ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9618
X-Rspamd-Queue-Id: 7C75449831D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36702-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[radhey.shyam.pandey@amd.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]

Multimedia integrated (MMI) USB3.2 DRD IP is usb3.1 gen2 controller
which support following speed SSP (10-Gbps), SuperSpeed(5-Gbps),
high-speed(480-Mbps), full-speed(12-Mbps), and low-speed(1.5-Mbps)
operation modes.

USB2 and USB3 PHY support physical connectivity via the Type-C
connectivity. The MMI USB controller does not have a dedicated wrapper
register space, so ioremap is skipped via the config flag.

The driver handles clock and reset initialization. In this initial
version typec reversibility is not implemented and it is assumed that
USB3 PHY TCA mux programming is done by MMI configuration data object
(CDOs) and TI PD controller is configured using external tiva programmer
on VEK385 evaluation board.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v3:
- Remove mention of xlnx,usb-syscon phandle from version history.
- Rename map_resource to no_mem_map.
- Add assert delay.
- Rephrase commit description.

Changes for v2:
- Split config struct refactoring into separate patch (2/4).
- Remove unused regmap/syscon fields and parsing code; defer to
  patch that first consumes them.
- Fix error message capitalization to lowercase ("reset", "deassert").
---
 drivers/usb/dwc3/dwc3-xilinx.c | 56 ++++++++++++++++++++++++++++++----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilinx.c
index af0ccd060c8b..b601cca485ed 100644
--- a/drivers/usb/dwc3/dwc3-xilinx.c
+++ b/drivers/usb/dwc3/dwc3-xilinx.c
@@ -46,6 +46,7 @@ struct dwc3_xlnx;
 
 struct dwc3_xlnx_config {
 	int				(*pltfm_init)(struct dwc3_xlnx *data);
+	bool				no_mem_map;
 };
 
 struct dwc3_xlnx {
@@ -93,6 +94,35 @@ static void dwc3_xlnx_set_coherency(struct dwc3_xlnx *priv_data, u32 coherency_o
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
+	/*
+	 * PHY databook requires >= 10 ns warm reset assert time; 1 us provides
+	 * safe margin for bus latency variations.
+	 */
+	udelay(1);
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
@@ -256,6 +286,11 @@ static const struct dwc3_xlnx_config versal_config = {
 	.pltfm_init = dwc3_xlnx_init_versal,
 };
 
+static const struct dwc3_xlnx_config versal2_config = {
+	.pltfm_init = dwc3_xlnx_init_versal2,
+	.no_mem_map = true,
+};
+
 static const struct of_device_id dwc3_xlnx_of_match[] = {
 	{
 		.compatible = "xlnx,zynqmp-dwc3",
@@ -265,6 +300,10 @@ static const struct of_device_id dwc3_xlnx_of_match[] = {
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
@@ -299,22 +338,27 @@ static int dwc3_xlnx_probe(struct platform_device *pdev)
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
 	if (!priv_data->dwc3_config)
 		return dev_err_probe(dev, -ENODEV,
 				     "missing dwc3 platform configuration\n");
-	priv_data->regs = regs;
+
+	if (!priv_data->dwc3_config->no_mem_map) {
+		void __iomem *regs;
+
+		regs = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(regs))
+			return dev_err_probe(dev, PTR_ERR(regs),
+					     "failed to map registers\n");
+		priv_data->regs = regs;
+	}
+
 	priv_data->dev = dev;
 
 	platform_set_drvdata(pdev, priv_data);
-- 
2.43.0


