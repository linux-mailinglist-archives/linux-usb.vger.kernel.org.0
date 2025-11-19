Return-Path: <linux-usb+bounces-30735-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6927DC70D3A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 20:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6BA574E204A
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 19:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6506B313281;
	Wed, 19 Nov 2025 19:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BQ53SPsN"
X-Original-To: linux-usb@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012046.outbound.protection.outlook.com [52.101.53.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCB833DED0;
	Wed, 19 Nov 2025 19:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580667; cv=fail; b=qm8lcfLtAxtNDwcEPo51nQrFooP/Z6/qIaO8x7uwW/Ksy4Yw9IqiXW7IwhbYvr53Zl374VonXwtaJ/zuokIT3/Jk2VKJZZmGSVioWJpQJxaXcpDtmVPEyMyDFve4NwEAt9NX5WgW77Tr92QsZFeB2PlXj3hYHJYMgHm0bCI0lH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580667; c=relaxed/simple;
	bh=Mbq453VbfdE8pfZZWInfnvzBlAWEPGIdgIJOV09Tbj4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEeoP9cXbvo0mxeT2WGl1ad/3OxLFd4JIQhesE23zaDCyL/68o8n8MQ6j0r8sU1zMD2J1tYO1qG3JbX4OsdNXHp4tBo3eP6INQ203zR1rhUCq1oMcIUVIeRMJL8Fb3DkLm+yK2wsf/MLm0Aqqou0IdRo8Ve0plVupkk2LqR9J/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BQ53SPsN; arc=fail smtp.client-ip=52.101.53.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXMz9VQHMW9RqKb6Np5G0HxX10/4zPj/KVuMP5Qg/07N4fAG7VYbuVcAVZggavJg+cdedil8RvS3jloMb7gEdzIleniw0oO6TwLIkWaNdbkTSSjUSTN7EBFXQRLLoNUzCHFdgDROzBx+LiNESjxSLSloxuZUeUFhqLPs+eFY2q8WbgYoUnxB7n1q9ROHekv5F/rQdRFaN0ElfkG//v4jgqJ474um1rn6Ajbfst5Yf3T324jr/KTvK4NXnCa1QS7Ya9+KoF1kDT9Njx9jgrJewtS0FCj0TX6PE7n0yqmtVX3UMTkbRtqQPR5rfMp2mqYuf5Awp6IAuAtlvAVv2DKMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcqWhB5mlUPsE4isDdF1Ln89Vh0nVVE5rRtY3ptpglk=;
 b=fkbgh6V1FoWbqNBTLAcE+uJ4lTSK26MbkbQMP8mG1c1HI5oABCS26WYQD2ULeWphxFmsH63afMJQZ0bZNPnWY/u3U/fJ5mN3OomEg9OPJt/+NzjsbBMoYYzdM0S+QO4IxslCzyKmHVsdJSHWfdBMDc2H3TxgsnvTUh9cwUDXZ9Pi3TBFkW/tVKksywiBYTtb2VAUDrKzWEdr2MPSNDRGcRsgo0VkmI6M49rr9J9BCLjElrJVcWZ9tNEPZMfBO59Bg0/FU+iy9Gcv+SPYqyIyg4J42tvGmK7DAStoQ9Z4u95XFl9xJvFQWd5w3h5wYRD/3csKzfotacSPtaVHOLdZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HcqWhB5mlUPsE4isDdF1Ln89Vh0nVVE5rRtY3ptpglk=;
 b=BQ53SPsNSSpO8T9ySfA2cFWOTuevvA4kWeahRAo+QP1FkJzZCofOyi/SiSI6eRoVIOQpZ4kQGbt60mrTun69M/DY8tC4m49BjkDbZrSCx31+/pCKY/7dxFNhnXMESS/cfRYQTNOSNggFfXyqllw18ZOs9PtK6XGWtnfPoJhm1/k=
Received: from SA1PR02CA0012.namprd02.prod.outlook.com (2603:10b6:806:2cf::17)
 by DM4PR12MB6011.namprd12.prod.outlook.com (2603:10b6:8:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:30:50 +0000
Received: from SN1PEPF0002BA52.namprd03.prod.outlook.com
 (2603:10b6:806:2cf:cafe::52) by SA1PR02CA0012.outlook.office365.com
 (2603:10b6:806:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 19:30:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002BA52.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 19:30:50 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 19 Nov
 2025 11:30:48 -0800
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 19 Nov 2025 11:30:45 -0800
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>, <Thinh.Nguyen@synopsys.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<git@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH 1/3] dt-bindings: usb: dwc3-xilinx: Add MMI USB support on Versal Gen2 platform
Date: Thu, 20 Nov 2025 01:00:34 +0530
Message-ID: <20251119193036.2666877-2-radhey.shyam.pandey@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA52:EE_|DM4PR12MB6011:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bb7430-f788-4b24-8608-08de27a2258a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VNLKLa79fgHDsW6lJtDdaDyaUm3JtPsC62ZMoYFx4uNRPbtyJ00Wz5DNWXsW?=
 =?us-ascii?Q?Qu+Yvk7SfjceNaIgGuKn+Fh9RnWcEbgoe2NsJLaPQv/9KyN82hODedXjEfkt?=
 =?us-ascii?Q?odif5KYbSN0VkumjsuLpbj7RGiOfgt/O0ZGlSyxOKNQp1fiI9Qdv3bCHrSpw?=
 =?us-ascii?Q?21NeoxlkmWdaV9Eq+/v5bgEmOF8U64zM1qaZ1XQ6xuXuDXueKaw2toqzJ5ZA?=
 =?us-ascii?Q?WBXdOqmDoJplwDZO9aWZ79cWCyblvlSzLeAtDk4jADY21/U1C7jwGfqbt1up?=
 =?us-ascii?Q?v3mbe3MllUmZRVUHkSdtUDztQkd9cUNtgJ0W/dKcJDMF6AjGgfaMrjvZzx1P?=
 =?us-ascii?Q?+w7rXbRuBvTyrESap5lQOlDbK51CRvTNgh2SN3DYD0A8N5J33xah5Kj4OD+2?=
 =?us-ascii?Q?PCwfPkMRuKmfZoU1Ysl+dn23Nvzmy4t9fNGq8jO8R3OMqeV1C3M+R+wfLM/N?=
 =?us-ascii?Q?q/it1hr/jhua/ZFBIGqvirT7M7pyUcUy2YFqqcTtM60U+0+HOLx6GlEQBfcI?=
 =?us-ascii?Q?Uy7euKM4YK+Lu1MtUOoitf8mtM98gpVDmRetLcYv1xZBSLFqXYcEyiKzzOjv?=
 =?us-ascii?Q?fL3npQGFMUD3Txhdd0nMrAFOyJ9FYMucStTZWOzUcoxPfhTJqFpVykOJ+Nc1?=
 =?us-ascii?Q?m5uQd4hpd1HHOyUKJJZPbgP0bQtZuyaPwFHHTBOJm8hYqcM9kEFnpoYk8EPD?=
 =?us-ascii?Q?PY4/XiFn17IWdvM6n7NWd1Dik0XFbk/HmX2Hn3oZtvQCPuYxujpVXEx/+25y?=
 =?us-ascii?Q?3+Ju/K4pSUaBMnTq06uVa0X0L/g45KEgvyKxVvqIA0IwYexCkJJVKgOqbFz7?=
 =?us-ascii?Q?cr2Kv8E2KgJGGNuDTgrh1pKKP5+ukKSuUqEGeZ5S4hiKNfngvJziquq9niTl?=
 =?us-ascii?Q?yXoT76OozU+6NxCMI0lOJ6MFtGtUhBGEOESr0maPoIWwjMwT1S8MBD70cgHY?=
 =?us-ascii?Q?HpIDFjXawomWB29M6zXpzcHw2SqrfsBG6kPLMssFBUomafhqEZRc0Igz4t0T?=
 =?us-ascii?Q?w5ygVKH8uKjV6uPW1GaO3qS/3nxwEX2OdMzdh20j03aZFtkf+X2nVdrK7l1N?=
 =?us-ascii?Q?dpJlr71lKcLkGSkfWCqHcBmscHGAaN2aslI0Pmrke0HLWO/06zk09GgihEzZ?=
 =?us-ascii?Q?MLEXCH3jGIrmKG6KQJAZvAXB19ONuoPNTJ3sW4ngek2qlcU5U2AzsI4hkW34?=
 =?us-ascii?Q?WZm7pOBCTK9KNkfDDPwNxCDzu3p6mcrzJmrfEl9xye7hFC+pa85bY2Ah7jW7?=
 =?us-ascii?Q?eirivMtgO9DUrN8+jlnC1Xrxyj/JR3FfrHHFrC/gpY7TipFdbH+DBhM27CbB?=
 =?us-ascii?Q?W12ydFKVVVvX8zjlw3lrAJsDiuezpP/u81oZpYe3lzm4x3zymNx1q9ErBT1Y?=
 =?us-ascii?Q?vKMyJSM9sQj07SuP4fP/OL+ch+oJk+QWKif5nPhoeKygNezgvtI13UD03uLy?=
 =?us-ascii?Q?LPlYC68XKQegOFDBxonnVZQrKPw19qh5lni+uM4g4ukY57MJIhm02fMTyDN9?=
 =?us-ascii?Q?RDSW1cBWSeszTmcDUsdv/f8DNPO7eJxhdwGlZw9l7tQmjgoNIW8TQklBBA+x?=
 =?us-ascii?Q?wp4alx7liJnPIfwU4oo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:30:50.0606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bb7430-f788-4b24-8608-08de27a2258a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA52.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6011

Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
2x1 Dual Role Device IP. Introduce a new compatibility string to support
it and make reg optional as the register space for USB wrapper IP is moved
to MMI System-Level Control registers.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
 .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
index d6823ef5f9a7..502294649a6b 100644
--- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
@@ -15,6 +15,7 @@ properties:
       - enum:
           - xlnx,zynqmp-dwc3
           - xlnx,versal-dwc3
+          - xlnx,versal2-mmi-dwc3
   reg:
     maxItems: 1
 
@@ -37,8 +38,9 @@ properties:
       A list of phandle and clock-specifier pairs for the clocks
       listed in clock-names.
     items:
-      - description: Master/Core clock, has to be >= 125 MHz
-          for SS operation and >= 60MHz for HS operation.
+      - description: Master/Core clock, has to be >= 156.25MHz in SSP
+          mode, >= 125 MHz for SS operation and >= 60MHz for HS
+          operation.
       - description: Clock source to core during PHY power down.
 
   clock-names:
@@ -87,7 +89,6 @@ patternProperties:
 
 required:
   - compatible
-  - reg
   - "#address-cells"
   - "#size-cells"
   - ranges
@@ -104,6 +105,7 @@ allOf:
           contains:
             enum:
               - xlnx,versal-dwc3
+              - xlnx,versal2-mmi-dwc3
     then:
       properties:
         resets:
@@ -117,6 +119,17 @@ allOf:
         reset-names:
           minItems: 3
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - xlnx,zynqmp-dwc3
+          - xlnx,versal-dwc3
+then:
+  required:
+    - reg
+
 additionalProperties: false
 
 examples:
-- 
2.34.1


