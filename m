Return-Path: <linux-usb+bounces-18080-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C865B9E32FC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 06:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A1FCB2A238
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2024 05:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA0C188580;
	Wed,  4 Dec 2024 05:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="h+ntihaS"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D5A184551;
	Wed,  4 Dec 2024 05:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733288955; cv=fail; b=cpnh7AtsqHOHDJuk62G1LTxU/vLG94kEdBVaVMsZFMQ7Ah84R125WiD7U8LA9rgdIprkaFHC+d4f2+4+/85TE/qht4xuIUpPxP2KMefjfsMOm0p/sQ9nhgL7OSPaoQrqCO59B3S06wMiWb0f3ZA2BYQwIO0EKOTOwnCFe9lNGnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733288955; c=relaxed/simple;
	bh=P71cX9jNbHT2jUaYwcRfNWtN26kMNmNZ1he3gMz6IAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KPajoVHf1hZQamWqBKAlDYgtgt2iTr9PKRySLv8CxEAzmnBMUxiYjCrSchrBejRdbuDCWlX7b7HlPnT8p0WyZSoXPTtu9QzH3a9L4/GnDwWP8dVi8Ehif+b2f7ua7veJGtlxA23qpGqIr7Ozig5DLQMyQOdd6a5P0QAJO8DEOBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=h+ntihaS; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbUv1JoRYdeCVRg5Qok69yVY8yvkoATWTweyOhRsGz7keIQfmXASivGpoacSueJuQ+no0OjX0TmAScimdEJ5j9LfImhmY/aRieCTKcCrKxTHX1Hdts/Awrp4/Ls3KAPv3TXkuqBGXhOk+VeJlvezWdEFN6xYFuQkC/eeaNQs7Q2kkZtfTz9APffEUzMAJ/y3vhmgWRtb6Edj4fPtHyX4F2OtWd/S839/e4l2jDI95YUbZOWAG0AMX8zBYKfhFdJ3Suk9BX4pcAk4mFw/dD9GkBIn5tIDfkDcZX0uPh25M/uurTNfbZ8l8hCx/vuMX/tX5EFVqEPi5aUapn085lkRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLSNYD6wGueMZiNlElmaTZbyxnQf35pRSotaDxam2yY=;
 b=s21b8pZZn0KvE9+rt9vj3k3PrZi+oi2/5cLEqvcJaeGrIP0jD6JK6uYg0IwZuaiaPSRX1O7xyTlc9ZDO8J0qQyJIorCyXwdgmNr8yXu7Hi7WyAngymNk4aaFcq6X3LNcko40RCNwGPh84794fvdyqbTGNxyGJCAQhXlOunIVkyTvTU0E4tH5ld8laVUYjCUbDPBs836c2AgYGY0jpR6Zi1lH2fiM5ZBBuq4OINvO97wnu3l63+dsm4oY3Mchr5BnExubOoY3oIorkPGlomSK59bJxuUfv6UaEQhCOcyOlbgo3gFSDEwjaLO9SWHXfDMXxMmfd7VSclDokXP1sAN+Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLSNYD6wGueMZiNlElmaTZbyxnQf35pRSotaDxam2yY=;
 b=h+ntihaSuDbOmmeDJZhYnF9Vvw9VRmUsTzUyootNM74lOvAbaEjy5vp6WQaU08eQKkXZ1cJfuYGGZkpmlP9SraQmPiA1qbznAHC9AiZjRvQXX7vk/+AppB9W15k1TTrb3+GeOcv0lHE5SfkMDnzy8ldccebMz5TDDLs5tnShmIYgfuY1PDOvvkB+k4epB/ftTF+DxhX6Ezku7HLoOcejPCL1TWYtANcc2l3GwAIqQio9uWGna3KVRQ/LvdX6S7x0SyFbYP7LmKrcM3aN0YFFUbkua1lmKnPbsx3+CLjqfegfk4uWccJDDz/JNSuxsslA2qjy/bvyR7DPcgFaCDQGEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB10435.eurprd04.prod.outlook.com (2603:10a6:10:568::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 05:09:11 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 05:09:11 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v11 2/3] arm64: dts: imx95: add usb3 related nodes
Date: Wed,  4 Dec 2024 13:09:06 +0800
Message-Id: <20241204050907.1081781-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204050907.1081781-1-xu.yang_2@nxp.com>
References: <20241204050907.1081781-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0235.apcprd06.prod.outlook.com
 (2603:1096:4:ac::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB10435:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f0fb8f-69e3-4505-8c04-08dd1421c9cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|52116014|1800799024|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TMcgUK7i0vX1YUv7Q87lx94ILzmIayfjIOnkTyb7UfIfQnD42SXrnJbKkcA3?=
 =?us-ascii?Q?or3jcpSQZpjB5m3MwR9t1KYZw2wmdWfS/GVMxU1EeLr8afQxJy4c1x0GtHGq?=
 =?us-ascii?Q?0FZdCxa8qWJ6v9dD1rTbmDCc1DiPCbE8BW8tyXU28rBXGxwUtFndkPKv/FTs?=
 =?us-ascii?Q?DJO37yKvtMwdOK8B8C7aBuT8kW8VYkNFcQyd/oOJFDY55fP/2XnhzKSHVJAJ?=
 =?us-ascii?Q?eIA0QE2yemtqSRqvzSDAFshfEbIYXSC5vXCJTEStxwUt+u4s/AM4VO9u6zBD?=
 =?us-ascii?Q?MVVTPIOxuCqG82idHN/9NkV29EajzJqdXahBRHkAC6x4nVSejW1mrWFhpLhe?=
 =?us-ascii?Q?SRsShj5qrkcHP+yhQYMFM3PyNapf4yztW42UfiFDY57uTjZRXkRBTy+EIDRU?=
 =?us-ascii?Q?sD08WqgknoCZ5WccMfW9d6xjM944rF6MRH04XBNyqD52aUMA3tkc3HucalZ3?=
 =?us-ascii?Q?kmiocYPx9uE8Zd4NNOdAjemF0ovYeTRsM4PK4QW/BPGxrFaEAtLTlLtYiGLv?=
 =?us-ascii?Q?ItuSSyL/Y9XU5IOSOwQQI6/YI+oauoJgBLeuacFyqpJh5DdPlE9iuiUQkNzW?=
 =?us-ascii?Q?7FXblP2qL9j9iueUksQGFDHlVU7oEpMgf63Oy+RTra5YpyXW770hv0Fk45um?=
 =?us-ascii?Q?9SOQKgqZr+wsBLbdJahqWLCiulJ+eE2xQs0nN7gBBHAAdED6al+VeNc6afUT?=
 =?us-ascii?Q?Wn+XNqKN+y851IzPkGbeYKJ3ZieavKeQvujCPpVWNx1o4psB/ApLUTslLMRv?=
 =?us-ascii?Q?doNntKsDTmphweQ2xpJQdlra5oNexRG5+CTEizl0z60iCdt4IF5+RzOv/kzT?=
 =?us-ascii?Q?1WzzOtSew6zfwFhAMmFgyIj9yw0va1yDm5eEgIQ7oanBG4FRagF+UKEJNSqX?=
 =?us-ascii?Q?g2/DV7vkJZO97r+raO7pso4tv8VMJif///UesoUHTnQINkpSZAUlgIh1N3aC?=
 =?us-ascii?Q?+kploG5lmhKEfu0jLutMMHwFzabGAtDAkRdMgnp9epBjtmyr7Fz9SFpv7U5s?=
 =?us-ascii?Q?QDi4ztRoiPF3JYc9gXx6FtB1t/945EwdodYENy+AtrPN0YTU1il4j5mHCj1L?=
 =?us-ascii?Q?QLFkuDUjQepPhPC8yV7jDcd2XgTXLPMu3xztV0Ztd/Kf9Z1M6S0//aXWfS7M?=
 =?us-ascii?Q?gxMbE0eCnCX8s9t1Zp+yjXxIdFZOfQwhI4UvQKvpYUCtG/BKjcnoY0e2CvGj?=
 =?us-ascii?Q?HbJJbinQkyedVT7B/LAj+D75mHZbaTbbLNi10vWlbtcze2N9iZQRniW0rV8x?=
 =?us-ascii?Q?8mAu7CSmjEjzDZvGq4YjVf5qZNN/QZKMKC9P7vIg/Ten9FzSwvUiCr7A6vJp?=
 =?us-ascii?Q?aTfK+Zo5h639TkUmtTsYDX4SENHEwapbKnYz8dT0VXAmtwif3WLaIO+i6LsV?=
 =?us-ascii?Q?gb9/26WPxPZlDhbkLDxTFODTF6uu37isVBe8WiCoqwmKN9PLoB9rYynFO14a?=
 =?us-ascii?Q?ztsL2JKnkVk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(52116014)(1800799024)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Y1UDEGHFFITEIY5QGd6/e5JfquOKgI7uKcVLem+rU0L8u88wsTn85nSEBpr?=
 =?us-ascii?Q?/lRm9zslqgr/g+IigDEZcVZFNsHsxzW6gIDjLPdNydxJaIugB28UnRmGVi75?=
 =?us-ascii?Q?GcMmX2rQl/IZ16eXQOe2UYYAhMLUxygo2gKOOywl3fb9eq36fUOe6GvTDkBn?=
 =?us-ascii?Q?nsDK2Y+MnyiDq/CZdOKvlNAsueOX7rMPnoAipYmUhXol0O4BRj87yHUQ+r0V?=
 =?us-ascii?Q?sM5fKQpIqQENad/qyR9Rq0P+3PsjMsBYCWc9AWEZcwVCX2oW9Amu9Zd9Z4Wp?=
 =?us-ascii?Q?OjSNIogRa2hbTuYZmURnUlgz+vmxgrhc/1fg2Uz1uRALmJri/rPtgqD7dyQ4?=
 =?us-ascii?Q?qwPUlzVoBR9RyjoJUVz+M9gD+6ngWFPpcvJCqYZ02L4gL/iNErgeAS7yxAq9?=
 =?us-ascii?Q?fseHSEG9mtTb3zyZr+h3B7eOkad4G21276ql+eKPpxvpKtt6syWxd6xHM8ix?=
 =?us-ascii?Q?7eyfWkLKChORqZ3l2ewXbKbSzaKuSTF9chzD1B3t9Dnaz4uQk6fxGKatVTZd?=
 =?us-ascii?Q?iXR7pwceESsf3NbEdLIGdKKAuhRNZ/FMmqRXrjDH+UMbs8aRisaP3NlI2LUb?=
 =?us-ascii?Q?m7jXKZ6QMqqK6HqLpMRmj6kyZ+Rir1/QeoZKAGexuHQzVYJ8nnjm/s48uEZi?=
 =?us-ascii?Q?SxNnbWEmKFvs+DTDP8r2fek9SR2Nv4KntSk3OV2Y6ZKr3RqD4Lm2FJFHT2P3?=
 =?us-ascii?Q?8viVdh2PBLvxh2+Uv2BILkaIAW9+kG3A2bOHcIg8S0W33Rh7NgZsWSuAyP9u?=
 =?us-ascii?Q?wG0b9tMfAFiN/FcBbaCKIBRSa6UNv56zzdFrvno85YpsgHs6PGzIysT+lSa5?=
 =?us-ascii?Q?bGOUPhIUr+1GTZ9AG8D+HkfQCQKyGO+gMuuf/0BIw2QALi20iOegpGmos2eD?=
 =?us-ascii?Q?vHjI3N1woc3+IKsXbfuzTXA/dcVugEg4tJfzaQalVq6pwwua5jk+xLUvIsSs?=
 =?us-ascii?Q?8LMt6Jwj+G9aEJ/WHT0/m1VnHtn6fHpvtHPtJez9N4Hd3ZLSv8SFeMFG7dnf?=
 =?us-ascii?Q?TIB2UlUJtIZbzK/UvMFkfqbsgMctxAhmYuQ3tWvEznV3Wa5BZu/zGDVY0wnZ?=
 =?us-ascii?Q?JYSwxeUn636zlCCo4n7FXuu+MCNxcTwvVaZlmxd1wkIGpxp4z1MNygk3VJrR?=
 =?us-ascii?Q?17tGEzD7DJjBFqY44Y6eQvVwNbEDriI3y00J9fFDyaJ8r6Ms/BLeuM1IQ6aE?=
 =?us-ascii?Q?rfJk2XLEivPdr/MHcn8WbD89QrohV7eDLjmXEzqqbTr3g/Smucu0A4lPoZxZ?=
 =?us-ascii?Q?GKDol5y9Ws969elAhjj4ihBBrkRXcfMs8sn6Lxq1dOw2ZwTvU1Zt/FABQW1T?=
 =?us-ascii?Q?lcGnmg9SU0ig1fnCXG5dhUO5pV288xjg6NUVlEHPe0TNfo6k7vqXvDsFMw99?=
 =?us-ascii?Q?4RFTRrL9CyGX4QL7qLu+eXGd/1rg0Kzn7W/ETbzbK80RUwS57wd1ejrGFaEH?=
 =?us-ascii?Q?dEgSw5KNlv4iS/tncgKhRkTb3DEgAn09XJe7FTaKCyGta8HNpNExkJSnqDPu?=
 =?us-ascii?Q?bSrIgTaMG/Ko+KBrpEveU/9fcoCzhQblRsKO1TPhOUoRh0LVFPcrDNH7qBpZ?=
 =?us-ascii?Q?md0IpysdJFgQdy9ZceDVSeuxINBuDedLk6ySjkeg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f0fb8f-69e3-4505-8c04-08dd1421c9cc
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 05:09:11.2044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8cX/Daekds3hpQnVYB31lh7mhA2k7dovTzBOy9ArGh7pZb7iFUJ3NnNBZtBxrtavXJ77/Q3ZxGSCypXoTVE9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10435

Add usb3 phy and controller nodes for imx95.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - reorder nodes
Changes in v5:
 - no changes
Changes in v6:
 - rebase to latest
Changes in v7:
 - no changes
Changes in v8:
 - no changes
Changes in v9:
 - no changes
Changes in v10:
 - move orientation-switch to dts
 - rebase to latest
Changes in v11:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index d10f62eacfe0..facdfa37073e 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1537,6 +1537,48 @@ smmu: iommu@490d0000 {
 			};
 		};
 
+		usb3: usb@4c010010 {
+			compatible = "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";
+			reg = <0x0 0x4c010010 0x0 0x04>,
+			      <0x0 0x4c1f0000 0x0 0x20>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>,
+				 <&scmi_clk IMX95_CLK_32K>;
+			clock-names = "hsio", "suspend";
+			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
+			status = "disabled";
+
+			usb3_dwc3: usb@4c100000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x4c100000 0x0 0x10000>;
+				clocks = <&scmi_clk IMX95_CLK_HSIO>,
+					 <&scmi_clk IMX95_CLK_24M>,
+					 <&scmi_clk IMX95_CLK_32K>;
+				clock-names = "bus_early", "ref", "suspend";
+				interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usb3_phy>, <&usb3_phy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,gfladj-refclk-lpm-sel-quirk;
+				snps,parkmode-disable-ss-quirk;
+				iommus = <&smmu 0xe>;
+			};
+		};
+
+		usb3_phy: phy@4c1f0040 {
+			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
+			reg = <0x0 0x4c1f0040 0x0 0x40>,
+			      <0x0 0x4c1fc000 0x0 0x100>;
+			clocks = <&scmi_clk IMX95_CLK_HSIO>;
+			clock-names = "phy";
+			#phy-cells = <0>;
+			power-domains = <&scmi_devpd IMX95_PD_HSIO_TOP>;
+			status = "disabled";
+		};
+
 		pcie0: pcie@4c300000 {
 			compatible = "fsl,imx95-pcie";
 			reg = <0 0x4c300000 0 0x10000>,
-- 
2.34.1


