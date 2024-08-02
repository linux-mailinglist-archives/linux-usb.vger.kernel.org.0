Return-Path: <linux-usb+bounces-12881-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B114945ABF
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 11:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFDDD1C22094
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FDB1DAC78;
	Fri,  2 Aug 2024 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RkvCEmK8"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9023E1DAC58;
	Fri,  2 Aug 2024 09:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722590229; cv=fail; b=T9Ngb0rDKpbxoaJlc+P+RPvkTNZzg3u2P3l6a0DZxe3Jgix0jvt1zLkSIoGN6HWmloCXjV8GZajX7ch6FHr/vykkokwfMSUOyvA8hIhMrH71WmkzhZH5O2GIIg7ZyvCVqFDn8NqiQje0l4gqb0SisBDuBoUbhYxq5045J5sxlCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722590229; c=relaxed/simple;
	bh=j5Jaza2tH0AeV30rfjXbyqUPEcApwqQaJupV8G1NTxI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kqnmBFsDNNTwvdHb4wRilwix46HjojjY7dmXUnexmUgrKDeOLvmyXZ9BZGsENJQ0Sdh+TlviaoR+JE/8ARpiaPqzmaJhfvIbFsAYVXHUx5Ql8NhM8nMzILW8CfDHuuIt4gwJ6ZYYXF9j4C0hXEQ4hymJJFmQhFJb/yGvXWHAbjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RkvCEmK8; arc=fail smtp.client-ip=52.101.70.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kB11mWamGc0dQIsGDYZIhDx3JfvYg84tPg+rGGZ7cdiM5Wih9XxIoAwov5n4pG+/K959Li2Cl1KLuVKeCFK4yoVkKUaOSqmewrfU3HvyzKfhJgO9s0bsOwLndDIsDrkm9w55tF05Ji1jqN6V2aaaBcMIvRMzwYpiK9hfl+6fwL46Ei+hZIF6wXApwcIU2PDpWcpCIP44OTDKUfY257hi2Uv/uZoDv1y57gxTY203TWPSRRLzbfbCfUxVb8NGRbsBiVduT0aPvhOAuhwHfYZtdRYEFiHkZHfAqDFWgBnNRzx9a6DpC75xc4GgcUDV0Qev7UlPYr+3+HzNFftKLZ/5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNddA1rkEiftGjcD3zl/m3iFopu9UlG+2gGTplY2Qqs=;
 b=FyGv4emAQi8/hAEtIrxlIv2vMQk6q/BwRO3up87R3/v0g7jg5IcLkzJRCWjJ57gtRk27tj14dGGMFBZgSvRAsL4geHma04ffGwadWNMZQzGwLRzS6K8mbbIJ3rJmMXEQqOu6sPgFrzLywxVTxSkCr1Y0MQAWnLKVfA99Lg88RqLOIWduqMMic0TKxH+NehpIJopYch0l71rHdqUT5v9j30k/ls1v9DIw/TCes1j2k/vLj2rIgRyGnAaNiNe36HNKQqmiiMNi3hgEuZFzuD1xOyz6LqlVsf7E2HBDx9tb3GKnXRdQGO8bs/JlPeXzyvYwiyLJMT4a4FMlFn5UAz9lDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rNddA1rkEiftGjcD3zl/m3iFopu9UlG+2gGTplY2Qqs=;
 b=RkvCEmK81DXlVPhvYoBk0+l6mGnSJ++pwGx6Im9Cw1tMko5rpXNfy3iquHwB+JECpPqqgIYqM15HyNTRru87kPSmKI7y++u+3ECPNDz4T+uIS62eIpHfhOuiKqYxMw5AHMiLWwEulsv2w5mfh4UDClr9nLn3gZOc3nnXXZM8KfF42G4oGFRaqsJ1rTSz4XGDbxFdvtfys2yu3e2qHcPHr2kpoet3oWS+YCnXlrDh3/c9AZd8cqll+fOHn6Td5gsEik+PTKvxqq7bhO18pxgulK8xliYm4rmUELV56gzTMKhR9qJ1PZhw39g/sy1nbPoBqo31R7P3l8GBPrWASYt1pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB10577.eurprd04.prod.outlook.com (2603:10a6:102:493::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 09:17:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Fri, 2 Aug 2024
 09:17:05 +0000
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
	Frank.Li@nxp.com,
	jun.li@nxp.com,
	l.stach@pengutronix.de,
	aford173@gmail.com,
	hongxing.zhu@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Fri,  2 Aug 2024 17:17:02 +0800
Message-Id: <20240802091702.2057294-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802091702.2057294-1-xu.yang_2@nxp.com>
References: <20240802091702.2057294-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA1PR04MB10577:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c90ebb1-1178-4e09-5e84-08dcb2d3e017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IdHIFA63FyLwnybH7JKS7pDxV2zD+42FY8YRYoIRUFolRbvXeTmsp3IZ7/XI?=
 =?us-ascii?Q?bj/GgXhQV+gnUE4jmEuayRxSrfSxLCzNEn8tdePUZqZnR4yQix78zKwccdDP?=
 =?us-ascii?Q?WpYc2qQ1EA0XvMbFApdPIYqpQMh3+X/o2gBfPswxxzpzJw1zp5Etm6BCq8gU?=
 =?us-ascii?Q?0Bztlaaf58k9bDv8y05S3rszPJSGP6X1GP2jA4jtcq9kJbwtFzm63yUbjK+3?=
 =?us-ascii?Q?K+48CRVXwl/x7KpEVnwVwKL39tRLfOM2KqsUISi9BkOhshtAYLwULr+bA8dt?=
 =?us-ascii?Q?wYabrYz8XEFwK3IheSrtM9/rFUsG/4KzLQmqcpY51/UaGpRwnv2FQ2EjIQFq?=
 =?us-ascii?Q?KLec64bTRFKRkIZD108OdFLYdnO92bz5wsoEkDgdcR5Q8j1OSS9XjTTtvA7e?=
 =?us-ascii?Q?IfMCbwlYY5CoNdJO6QWtbKTBnVqFJBfAzK8INa++t2lr84v3Rqqm4HS6awU0?=
 =?us-ascii?Q?ixdbzMDqPzD3+LDwglwQDAlDdCcsPtFbQlKLDSzOqdRIskJms/VjnKREmxK3?=
 =?us-ascii?Q?eUDBJymCHkj5CDcj4tTepKLapxQaz+4veESAadyJmgORhsigkeyV789uVed+?=
 =?us-ascii?Q?DXcs4YRPEL8oRKDagFyfWYRdGwpykUA82k9ZJhUShEZmx5CCGjoB2WS7Klgq?=
 =?us-ascii?Q?ywUzuQSsCY6eZjf7YtcE3kbUn5I6u8jQnDnIFMTMNpc8ZR0447XOacXGm/cU?=
 =?us-ascii?Q?skLCs/Q7Ix/nZb/OsvViveeYQvcLYVAVKcznjcAxLxrTXhBF6s1Uu7bQL9P6?=
 =?us-ascii?Q?XK+IYMhe/rbS7huFvnpenh1Xss8onXfnD8QIbQhKyXJuFo1KDy2opc677DQM?=
 =?us-ascii?Q?oeOBMMD13hKjNyO+KXopXK15P3t4AI50gMMPUyZAZW0PAMG+rmJfvazYREwZ?=
 =?us-ascii?Q?uGPgNzvm8YSDtSpuP8XYxW+UqxE8nicR2YqLcPkeWCjmMymawCwV6RwP2Hxd?=
 =?us-ascii?Q?TY+rPV81gF36WhwmTK7pcVpbEt/wEWVSxi+ax3i0hdq7LwvDlkhjA3eCJkES?=
 =?us-ascii?Q?4flf8sycDeetqxo4TLf/yJYA+elarY/nbyN7SNGmhn4tFSK5+UgNxAi9o10W?=
 =?us-ascii?Q?54TfllL4Sq7UVAqXKhgRiIgJiOeuwmS0gx5KthqfwRLqFir9XGuJ/qxWA/vt?=
 =?us-ascii?Q?N+MIRX6JVUEGAmFfVnIfll+kC7WAsorxVVlB9RdFH8buYZjcUPivU9xgDYxD?=
 =?us-ascii?Q?SXj8QkKmaOQaYk3WJ/pdyjwxDRVl2tAtyOPA3DJqbr71+4291LLBD5LkxsRh?=
 =?us-ascii?Q?HxT+aOHOaOyHxesLOniyVj6kE0OkyUDMeMQ0zc4WOOeNvi7lproFYf/uphSf?=
 =?us-ascii?Q?LlAoxc5PnM+UppBqKX0tGgcd9zTTDu9jPxaXdTH1BKQMTsSS6vI+0ueGoNPJ?=
 =?us-ascii?Q?4s9fm4kFuB7yot62rrwWIaVZg2ioPzL8Wq9cv0vxUkCA2pTWJap/yoElHVFl?=
 =?us-ascii?Q?KQEubN91cZc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FgCct+j/PjviZGvpBSwnwSoS37wKY7EzfNQPxna3fXaYTT063DOpj6YUguEs?=
 =?us-ascii?Q?YxevImyaJy+ZrSD6DSk1sWjUJ2LPCzMY1TF/xyxSPOr4P+rHOamWEm9RMEcm?=
 =?us-ascii?Q?L4xNv8WF7KAQYwwi3/V0t3HyAykb1h0Na1mF2jyvKOjmWWYeqPye73k/QjoO?=
 =?us-ascii?Q?Ue8B8Scec+NjVvkDxFUjU/Ly+jOyK8HVeWpNWgWDrhgySX3+rDdMKsDOALPO?=
 =?us-ascii?Q?IInSRakbOXsliCf70+S1En25ZhaQRiPzYoGxVXtL/on/rvdbHjWVWunDctw1?=
 =?us-ascii?Q?AwKIfL0VcxIb0FNNk/noVxaQAZ28Bm9jr4lI9r4QEUnfmval21VE0W7MZlpL?=
 =?us-ascii?Q?8iPPe3XAjBtciw7cXEjLvfLGwwFOPE9pA91fLt98hhQwVN6mjtVGiXFbxfO8?=
 =?us-ascii?Q?HAOT/nYdn8danmtKxsLYduziXokt2V4wSKqUplAdcNrT23/56H1fQ9AAZL+p?=
 =?us-ascii?Q?WJ+M4ptSWMnwDzt9GpbJ+dtOybCyVYc1mib9V2pgEwJ34OzG020SD8ulyuen?=
 =?us-ascii?Q?bDcguDFJRXxVqPndtl+jykIS3u9T7PW2TM9BbaiBK+SCfOZqbHFr1xVwcI3C?=
 =?us-ascii?Q?RtYqTZm1Y/6/SWNRE3BHe+qahix/Y0sLAtqeILut/OLrL2HBNWhh6308fVW9?=
 =?us-ascii?Q?YvtijR6qSpOfhs7KjWyjXaIX2XWZ2XbvzABEQwM/flYrSGG41n++WmC6vrRE?=
 =?us-ascii?Q?DNyMHMOgdprMmrFum369UufW/6tuoIOmJOUhQr5SwZLAa8RZER1rFQz5VX9+?=
 =?us-ascii?Q?Vom2efHVoUUoUlOa7jWjIQDJAamrNeuJ4kaKgJ4EY6IVtmH0FWKcPpuDJwNu?=
 =?us-ascii?Q?BZu8qKEhs4j0YvBnnCkehztkc0T7Oiuhay/EpLZJdZCL+hKnEMInkP5L0AQm?=
 =?us-ascii?Q?2uLzyURMfEKxhvIkhJmDjJctH3CsEK97hYcPibx+0sXlckS2jeUuGCMG8mBh?=
 =?us-ascii?Q?3LQPIxcgN/iyNChr3NkvKjgZKLdhHJmyT0mF6mys6sntsy8eA7MbikYb3n02?=
 =?us-ascii?Q?yINuFIAa8x6ifwgA1gij0x4ePBg16EDm/smcTvxu25uvbW4T46jVdkyMnJ5k?=
 =?us-ascii?Q?b3yUG8a0HkET6hu67O7S1Kj4DE1LomsRo9XdGnb//enN6g57pDzDBnhAzZRQ?=
 =?us-ascii?Q?dRJvBwErO4kT+S3kZTKBk7ImgHbZaCgFvPFIcp9zttrE2YRl16KxQNpgqdA0?=
 =?us-ascii?Q?5XEH23jsrOoh2FlMtwh8diYM8ojETEnA+u4Oc+P0xLIf3NnYYQZjiTYU7rGG?=
 =?us-ascii?Q?ItCCGDOtyH4sECiGDBi3c/g8zYz5bGgW1HvUWF3cdxN2rh+2QTjyvFAkw4ew?=
 =?us-ascii?Q?L3vh6frJ241SKqBhkZ6DAhv7k5nkaZS4QtWZgGGQddJY+g1EHzKjHHrcci9v?=
 =?us-ascii?Q?HdHGyPyOgl5SKHBLaOmmS4pDPV1QdTivgpLo88Zos7tws3blWNEjpD7T8p34?=
 =?us-ascii?Q?oxZGNkvTKnV6DPjq5TAfiB9DYKrvzkxWpprzX20Ef/2QA/RVW9UZHzUx0NJa?=
 =?us-ascii?Q?VTXpEaQ5+EW+I/20d2hKCBdsqG20Se4q6HgqJs8OdOiBNIviPLCNXG30V/AM?=
 =?us-ascii?Q?fyRywe4S+IRUDEKS3oVMW7MFQqn1xlEXI+6Odu5y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c90ebb1-1178-4e09-5e84-08dcb2d3e017
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:17:05.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n34QnvbP5Xqkkrd593y7F/JX7l8EKq+u+49sSyS08Y/wknM0uhZkdOKVehuELcNfT78SYrDkU/EF/907aRtU5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10577

This board has one Type-C port which has USB3 capability. This will
add typec nodes and enable usb3 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index d14a54ab4fd4..46a9cd3d4403 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 / {
@@ -99,6 +100,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec_con_hs: endpoint {
+						remote-endpoint = <&usb3_data_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					typec_con_ss: endpoint {
+						remote-endpoint = <&usb3_data_ss>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -128,6 +171,38 @@ &pcie1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+
+	port {
+		usb3_data_ss: endpoint {
+			remote-endpoint = <&typec_con_ss>;
+		};
+	};
+};
+
+&usb3_dwc3 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	role-switch-default-mode = "peripheral";
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	status = "okay";
+
+	port {
+		usb3_data_hs: endpoint {
+			remote-endpoint = <&typec_con_hs>;
+		};
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -245,6 +320,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
 		>;
 	};
 
+	pinctrl_typec: typecgrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
 		fsl,pins = <
 			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0		0x31e
-- 
2.34.1


