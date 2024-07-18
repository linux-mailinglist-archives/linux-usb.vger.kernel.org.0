Return-Path: <linux-usb+bounces-12268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63380934B9C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 12:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D71D1C21B74
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jul 2024 10:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F4DF12D745;
	Thu, 18 Jul 2024 10:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hgt8OX/E"
X-Original-To: linux-usb@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09DC12CDB6;
	Thu, 18 Jul 2024 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721298396; cv=fail; b=aqGIbFA5moPjL0h+88aZ2XAPZP7krc1u/NYqI2XJNI/jlbHPYZX2c3rufGjTbSd4xXuMBEcKn1xNhNEnkbWfk89/3ZNryJfTHr29svNBSg4PMHAsg0X2TwWrUKucFkcZdffRw0JWm21amXDZuYDm+3MgtkZv+3WKH9mIrZVQd40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721298396; c=relaxed/simple;
	bh=rfYxsSMSdVvuB4VjSF4BhDjnjrq8L/NUYWK7HrSqIL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j1Kcjx3QYDaaW7elnG87HFmT0iVNgpy54ElQ/kZJHMOjObuBTAbyIp8ve9W9Qgi1U/1MySa12S8DEr18J+tCdkFFsmphb96iShMHjDCAyXMyvFfpJUY0e366xYEcptZcHFDkjaqc8/jbg8IzTmDfLqxTxeHcLuzjH/OkFykOMf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=hgt8OX/E; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8lsy4IDjWFZGfG9F3oGsDPkyTTlZMREVaOT6O06501rOtBPH/Y5Z62IEbxwE9Ck3XlDrYND3F4CclS05aHEsWlQld5rZlA0zPGAbqVWh5fA9wawC/14S8gCJ9AX4weinSxV9GcBK6j+IG/rIKPzJtdPp/EQc4xRbCF+tL626TxNeIGm+sRI2lv4lKY6YHitf3QkF4QA59JA0gSNN+CrMgAmZFmw/2hB7u8s70Q9Kc5Lzj+vmjjr3kA9vOIkFHtSG7nvCA5HSNI3pAl038QHRr77sdsIDzFBIPq+w6RXJzItDhCSaVTVcrLsfRb5XyNKUTtdjbX9cZFe8RJvDBWEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m51t4uc5Oy+0Zciu0H66lXyWPQeyP0+RVa70o+vUCRE=;
 b=HBPzp6S2w/tbM3eA9ELtRvqefCZqHut61gSzMu9yaTNuaqWjqi69nMLd32ePl/vDzo5uCkoWRj5XkBt7aSZqCfX8d5Bn/RQP4s+SRSgHca78Mw7PwBzVbPIg7nh3q1YyMfpb9DwqJUt/PjtVjrMhVIXr0G8A4JeYB5TV90jYOF1vYTKPzwF/f5gjfbFgY2H32uQB3V7al59hSy0VPKY8/NEW08uZB7xeLHs2a1DNkPOmqn2JxisfUFCXg0zvh10g7VpK722xsN/h6s7VJbbZadvL9Mq1cEWkahvmcpbYGqyL5ln/rxdg6an647IdgsvTIZ0PDjoKrrMgoy9AGGWDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m51t4uc5Oy+0Zciu0H66lXyWPQeyP0+RVa70o+vUCRE=;
 b=hgt8OX/EgC8bmKV76CrZ99rChHRyD9DT0G1kykd+rJWlODPdjcToNnmEB+hU817ovNmszWeNPn0ThoZYK7RWSINUirLdtHfuwhBu7twnY057nOAfEMMzGcByh7PIYYdrDrjbGwj6sWQZ0cEdfXs1rQVSihQ5OoFxa6T1Agh91uE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PAWPR04MB9886.eurprd04.prod.outlook.com (2603:10a6:102:37f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Thu, 18 Jul
 2024 10:26:32 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%5]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 10:26:32 +0000
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
	peter.chen@kernel.org,
	herve.codina@bootlin.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 2/6] usb: phy: mxs: keep USBPHY2's clk always on
Date: Thu, 18 Jul 2024 18:26:33 +0800
Message-Id: <20240718102637.3964232-2-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718102637.3964232-1-xu.yang_2@nxp.com>
References: <20240718102637.3964232-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:194::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PAWPR04MB9886:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5bf809-f277-4974-5096-08dca71417b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|1800799024|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q6q1k1b3Cm3RtipL4ee+W3hnmvORt70ThVP9vC0tZJRTqep6ElLheGFV2pWO?=
 =?us-ascii?Q?+kg1LdOgEhC5Kuxjbas9tCLGfRiFVxMPNZBi+ZdyVxBAKqlmDjZ+Ly8/PiNG?=
 =?us-ascii?Q?YxycdqzBxaxaUf8NrTLzWVMk6p6XiMqVLBZGuXF7dm4bOLmloAimDpE1Lyxw?=
 =?us-ascii?Q?aescOLZyaNLrU8mw3Z9RFsux0RNhqdumb6Va6PrWJRj1W2CSBNXStlfxvCvq?=
 =?us-ascii?Q?WGcvmrXG47tH9W/Coq2VGDAeaznRUocXoUi4kPMkEBqu/C3d/lsLGTGUav2X?=
 =?us-ascii?Q?8nqz2AEN5xFBSuGqKvIPYr0NH2Nyq0OGuL2iBhAS//add/z7dd4P8cpAlXsc?=
 =?us-ascii?Q?wjuD2yKp57dbIUJV4NXHQ5yqP+SydgG/ai78M6uY6lVura68tZQ1SJJDQoUT?=
 =?us-ascii?Q?eFs4uPD0kjkxtNqtIa/7CMUu8ncqnUBg/RtOzk5mIe0Uig9cWmgvD01pkuDM?=
 =?us-ascii?Q?dFD97shNAEWdPGRtf/DhyDJKEVatSN3uUInvU0MeDEkOxWeQwRLhItDK5gXJ?=
 =?us-ascii?Q?HSNrT2d02rNtQI2fkygW40+Fxm8B6mMXuTHsaqKvlKBDSX5bkTXkYwbg4huP?=
 =?us-ascii?Q?eWQKhiatzPlFisBBF56mNDwV2zDmcL5JQ5KEO9zzjkmscucwhON2BZDZIUdj?=
 =?us-ascii?Q?/4nI0I1zo7ZOeWGsK8kToPhsGavVXd5ojQpB1xgguK76nWNcFDokd6r65Uvi?=
 =?us-ascii?Q?0PA4Oqhb3GC6V+2uz78tBWlNtq0tNQNbpV2DRa7rbtxQV6Zsajjo5KB4rhQf?=
 =?us-ascii?Q?ZtLocdsrrtqUz4mbkcVJGADBfp7srGGJh6/3wOQDU/upaO+iF4WdV0Uu0Gum?=
 =?us-ascii?Q?m5xvIBiWcIJb0HXRcwjq+opLAmchQXdIyiN4aOwnRlmnbO/EhMvmvgqk8t68?=
 =?us-ascii?Q?pgJkWWmt2dDPN9aIvkyfCz3znleBICQJKW+iORmcM54ZFlHtu1/7hJ+ooDeF?=
 =?us-ascii?Q?GR/ftA0VF2aAfY9orpwH+2qO8ZCsSUqiodNKTvUrh5XC4jUOAXF0m0rx+v0c?=
 =?us-ascii?Q?pmvk1Hq/I/v6NdhTFYDEWJ3bFq0Hk1dey3Nwdh0/NkhDUxcU4yPKZDttq0n4?=
 =?us-ascii?Q?kKf7L19wfnkeclKwa5eQazdhXD8w4C2FC1vL2v65x3Ea+O1FwdbUd7wk8fFH?=
 =?us-ascii?Q?EFcycVelAAm1aaBADFDGVSD34REtSJUux0fokDu2fhPK9vcjlzw6i2UfqAQ2?=
 =?us-ascii?Q?XTaZsw+qRQs9qm7G08mlnlmXc5EmIxpISEKKtTiZb9JxN7Q4zLxc+aRRt4og?=
 =?us-ascii?Q?xcz7IBMERf1ihKd7uBXmpevsqPGBLREDqKnOeM73kyREJtbCW6BtA8EQmsgN?=
 =?us-ascii?Q?8maUJtqazg6xbu5gqM4gJyq0CTlfySHk8rpOlI45YrJjajCrL9yN9i+yG0sc?=
 =?us-ascii?Q?kH8TKTi6rLlSZHPEMztZEq+arMfWfwnhn8HK5Q+TSXJL4/oZg9hseI0SDxSs?=
 =?us-ascii?Q?xrVJWa8GpVA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yU3JYDGVQTBHYw2E7gDVLYBR/iBu1h9ewvkYO7Fn6L4FVJERI4CY8CA23pFG?=
 =?us-ascii?Q?C3+6hNZqBgIM0YFfN0gR3hDcHuYnPi0VG25q97kk7WW5uQNo6X8Pij+V+Isd?=
 =?us-ascii?Q?4oJbKHit7ekLeNOiLFd8RtC/0CQEdPxruGlc8a3truse0Vzc2CvFNI08Wtuk?=
 =?us-ascii?Q?X6uM1YhlsKGcjS/s5QTkAXsqn9xorSXuQXlloyY1lqVGhJWSe1prHUClIEkR?=
 =?us-ascii?Q?afT9K72+td78f43YQJ/ogjycOhTiYWTRTHJXVe7dQAhA3XDt4j/wmPTlwlgv?=
 =?us-ascii?Q?8M0qyHnWJpO9Qcs8KDxLsrp1JTtQ3pmC3Dn/EDX0a0ckc33ex9fyVVxJmhCe?=
 =?us-ascii?Q?OFxWa8G+p1y812z+P/IDDuEX8mZYskXvZsvB3Vk0TQ6hCTOMzDAAFuIltO9J?=
 =?us-ascii?Q?3+bXU142JuaGzyVBam7EagMCi6tHANj0LkgWCuUQL25sIBKUTEoWVl/DnGUN?=
 =?us-ascii?Q?J+XhXi/4ArHUIN7uj120x0hwuC5oa75yDJUHoMmrXU2jM/SrTu0LpPxo0k8E?=
 =?us-ascii?Q?54aAK1yOBip7FffPL42eJ4F5UCdqAyMQ9HeLpkQp93b1mdgpdustT3DEG0QF?=
 =?us-ascii?Q?DEHWaqNvse9I8sZ0gqfguizS82JEGw//H3JPJyLihiMGcbUP73kZ9mZwBqVY?=
 =?us-ascii?Q?3BgJfbnbiUKE26DKQ5t+O0cqDn8DZB5CzruDkDENc4sB9BomrtSMawRK9UoS?=
 =?us-ascii?Q?R6ifNLBVHLTRSBNwUN/CopdhAo4IfOeeeBdKgvuMjU7pa7Y0XpErjsr6wLqh?=
 =?us-ascii?Q?FzmrNvGYW/FtknOQkw+HSPlJfStLESPxMws7tyHX8ij3JgS0WbY09C3TRdYn?=
 =?us-ascii?Q?JK2mK9TZZy3HDHNYHB/9V/Xeeh4Uql7lOkMNhN5G60oACV2xQyCopkvZmJhE?=
 =?us-ascii?Q?XK9hpt0Nn53hrqGKZkR6y83857iw6epTSOx94G1AsnmeNfXqBcdMTB1B0FLV?=
 =?us-ascii?Q?8cArMvX2yFgLrUUuNSakSnLli7cAL/hyi6/J6coHQmHOXVnEGPNSF9cig7/Z?=
 =?us-ascii?Q?neRxDuxOsE2G93dQAkxH/v2J8POW3fAkMiH7a2b0tFjfEg9HJjrmMmj9J6qL?=
 =?us-ascii?Q?TkOGUipwBIw7ZUGbH8FkbpdvFSQ6kEV7hhthAw5e8oNyz4mTeW+7ufH04Om+?=
 =?us-ascii?Q?ki09o5aMVVSkHf9LAFY5gAQZ39zbJZyGNyHq2+wTAULlpjh+voOyX5aKjofM?=
 =?us-ascii?Q?IxGrkdNlozsoaTbTIP1qqzxM1ZRdcpIPZJ/Qj8ofJtZkwyNbCPijZXgZ7EhQ?=
 =?us-ascii?Q?c4avz6Cu0EEPeCXSY3hZzO6H1WkKYOfzEmFPPmfmyvZ52WAfrsa3IALMt8Jx?=
 =?us-ascii?Q?Y8qzYBX5YltL3kRL2iFcKzqsbR9WOl+G5hlw0WuztnuCJvdv/VfaAoC9UUVJ?=
 =?us-ascii?Q?xmtPCh4lkEWhSdb17/Ukl8e071aYnwjucqj7qqe9xVOEgWFPcGkQdNwRVHx6?=
 =?us-ascii?Q?0wU/scTVPlrf7G+Kqt4SgboeXywghepB8bWUZdZy2RiJ6sSC96/tEC1qHRfJ?=
 =?us-ascii?Q?zXckHFFLvv9d7y2T/OOLGt7rk5CUVuKU5k9x3ZlDQAA2f0APk27g8HbHc0TF?=
 =?us-ascii?Q?6MCkpttvAQ4aOUK1ANyKXb9lBHHrDiYqzAjmlxRS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5bf809-f277-4974-5096-08dca71417b2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:26:32.0470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9YFkGJjo4wzMrp0T1I6bnhbBhMBtuIBNCj4Q7BVq+1zuPOmLixHY3tDIleL5PNmU7cu78r91RZKu/ltbxe8MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9886

Per IC engineer request, we need to keep USBPHY2's clk always on,
in this way, the USBPHY2 (PLL7) power can be controlled by
hardware suspend signal totally. It is benefit of USB remote wakeup
case which needs the resume signal be sent out as soon as
possible (without software interfere). Without this, we may see usb
remote wakeup issue since the host does not send resume in time.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 36 ++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 42fcc8ad9492..b6868cc22c1e 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -150,6 +150,16 @@
 #define MXS_PHY_TX_D_CAL_MIN			79
 #define MXS_PHY_TX_D_CAL_MAX			119
 
+/*
+ * At some versions, the PHY2's clock is controlled by hardware directly,
+ * eg, according to PHY's suspend status. In these PHYs, we only need to
+ * open the clock at the initialization and close it at its shutdown routine.
+ * It will be benefit for remote wakeup case which needs to send resume
+ * signal as soon as possible, and in this case, the resume signal can be sent
+ * out without software interfere.
+ */
+#define MXS_PHY_HARDWARE_CONTROL_PHY2_CLK	BIT(4)
+
 struct mxs_phy_data {
 	unsigned int flags;
 };
@@ -161,12 +171,14 @@ static const struct mxs_phy_data imx23_phy_data = {
 static const struct mxs_phy_data imx6q_phy_data = {
 	.flags = MXS_PHY_SENDING_SOF_TOO_FAST |
 		MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
-		MXS_PHY_NEED_IP_FIX,
+		MXS_PHY_NEED_IP_FIX |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data imx6sl_phy_data = {
 	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
-		MXS_PHY_NEED_IP_FIX,
+		MXS_PHY_NEED_IP_FIX |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data vf610_phy_data = {
@@ -175,7 +187,8 @@ static const struct mxs_phy_data vf610_phy_data = {
 };
 
 static const struct mxs_phy_data imx6sx_phy_data = {
-	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS,
+	.flags = MXS_PHY_DISCONNECT_LINE_WITHOUT_VBUS |
+		MXS_PHY_HARDWARE_CONTROL_PHY2_CLK,
 };
 
 static const struct mxs_phy_data imx6ul_phy_data = {
@@ -206,6 +219,7 @@ struct mxs_phy {
 	u32 tx_reg_set;
 	u32 tx_reg_mask;
 	struct regulator *phy_3p0;
+	bool hardware_control_phy2_clk;
 };
 
 static inline bool is_imx6q_phy(struct mxs_phy *mxs_phy)
@@ -518,12 +532,17 @@ static int mxs_phy_suspend(struct usb_phy *x, int suspend)
 		}
 		writel(BM_USBPHY_CTRL_CLKGATE,
 		       x->io_priv + HW_USBPHY_CTRL_SET);
-		clk_disable_unprepare(mxs_phy->clk);
+		if (!(mxs_phy->port_id == 1 &&
+				mxs_phy->hardware_control_phy2_clk))
+			clk_disable_unprepare(mxs_phy->clk);
 	} else {
 		mxs_phy_clock_switch_delay();
-		ret = clk_prepare_enable(mxs_phy->clk);
-		if (ret)
-			return ret;
+		if (!(mxs_phy->port_id == 1 &&
+				mxs_phy->hardware_control_phy2_clk)) {
+			ret = clk_prepare_enable(mxs_phy->clk);
+			if (ret)
+				return ret;
+		}
 		writel(BM_USBPHY_CTRL_CLKGATE,
 		       x->io_priv + HW_USBPHY_CTRL_CLR);
 		writel(0, x->io_priv + HW_USBPHY_PWD);
@@ -819,6 +838,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
 	if (mxs_phy->phy_3p0)
 		regulator_set_voltage(mxs_phy->phy_3p0, 3200000, 3200000);
 
+	if (mxs_phy->data->flags & MXS_PHY_HARDWARE_CONTROL_PHY2_CLK)
+		mxs_phy->hardware_control_phy2_clk = true;
+
 	platform_set_drvdata(pdev, mxs_phy);
 
 	device_set_wakeup_capable(&pdev->dev, true);
-- 
2.34.1


