Return-Path: <linux-usb+bounces-14876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76964972A27
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 09:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AFFE1C23FCB
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 07:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 415F317BB3F;
	Tue, 10 Sep 2024 07:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KWNaC0fo"
X-Original-To: linux-usb@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011009.outbound.protection.outlook.com [52.101.70.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25817BB1A;
	Tue, 10 Sep 2024 07:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951816; cv=fail; b=TVrycGRTCpNBFbkPzxDMluM1MPMEutwJeOU0BPAPWkuCtDLZwchk2ZX4tWh26p2L+KMJdEClbco7Dkiseh3m30XKSabbtdWGCnQjxsbe+IN6yQjQGNbfZWWzuxr0HzUqV/yt9Aziv6Hj00oyaVtaf3frClu6RNUPzwjg9uuEjuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951816; c=relaxed/simple;
	bh=8rAkoG1B+QlpzHClCwmv51emn5JoX1Nk2h9a+02/17Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pARV3Vsmx4cyL5xjiByBntjzWLyqI+2o0efAWM1mOC+/nfuqB8QxABAnUqovpHRVSqggV8pBqbEu/OAakjyTdQc5DLHRHNadCNkUxSYVG8fE6Qe83dXmID0gDb7KLLHBk0hJd9t1ToDVktdezFnIXokfx1mt7QoBjS6nxwFOTuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KWNaC0fo; arc=fail smtp.client-ip=52.101.70.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF2ot0+iGshAYFUebRfivJmmSs+sMc4la2WGceYyWZmtway1r3kGH2FzFIoNDd6Pn5cfoaGuGIvhT79lgfC+/wu7rncMNeuuVvxLMoRd7ay3oWyfv5rmgFALqhHVHE4AucV+2ZulQvIlkcE43VLZj+BNflsFDuWSnc+FEuWqwgVALFXzd6ror0SxzMn4xu5emEKyklb3lzfr9rGNvQqhe9fQbOJ7QBzRjmK8tZ6ZzGs+Zg3EJzVC7FfpZsI86DTICsYX0zZl2PcP533mObZJtdIg6OGX6WIjiyaFaVjPkm3ZJBbFC78/1hCWl1xEedXUNMry7N/EegXY8c0cuikchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWtFwZNYr4McLYbcRlIJfcpoNE0hW547G/ChkhKnPl0=;
 b=lL/oGJMma0yF6RbpkkmUzQhPV6+pH/fmPhCRSavEEs7lNdw7pRKP6LfFHwtTT2BecWYUA+8UvUr1DDdJwL4Ea1X4q34ZtYFkf1jCvCF/09GxRchD6vBeS0cV9BLHYdh7HlNiri3uwYnwVi3voJqAIlyWr3Y2lDsHg5T4LBiK6Bdj+ADF7FG6J4grNl01i4wJQJwOIsyfxULI/M5kIL9hPH/Rz9KHGc8tcbvZdLUS1gq7ZCTLeZT6J6/ruZh3A0iGvbnyFXkghqtAi09/jgoGHzPGDRxQenlSJjvejyzWZlOXuMWn5HuFxy9nZQIgm5x5kyM5UNNyUPG/3uFOJxXsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UWtFwZNYr4McLYbcRlIJfcpoNE0hW547G/ChkhKnPl0=;
 b=KWNaC0fon7cu2BQwmyYcoX4F4KjYAz+HdP/EwdzDWokV6E2PCmjoGjsRI9exwJv8sPH1y0tJiFvsMMaSq2sReedLGH6PmZGHJ0DT9o+27TTHo4dLwoniHjXKqTuQeqgaG5iYqjcIoUNuUPf3Oz24m2ukKZTp7pr5FMRYobqm+mlnz09evu36qnami3pHEfMprpNtDDBJNneRKUaIAwpKqx61OS5AEqDuyvPMsYzFQ/Mak4RnPQ9uoXOVys2YhcfNL5Z0fJm2kV/23BmgrgZlzBl/NhFUmjB7sWuzBXaGj1IdC8nraOQNg7qnYRoEmX2k+ZkscXdK1mdXrDfqoPPw/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB8PR04MB7099.eurprd04.prod.outlook.com (2603:10a6:10:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 07:03:30 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 07:03:30 +0000
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
Subject: [PATCH v4 5/5] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Tue, 10 Sep 2024 15:03:39 +0800
Message-Id: <20240910070339.4150883-5-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910070339.4150883-1-xu.yang_2@nxp.com>
References: <20240910070339.4150883-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB8PR04MB7099:EE_
X-MS-Office365-Filtering-Correlation-Id: 98bf546a-d147-489c-d2fc-08dcd166ad3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GskSktdOiwi+j17FZO6BXJ7zZ9DQ7fYdmWQkKIGWF6zkgqfATjwQr3nQQ1QB?=
 =?us-ascii?Q?zAf2uONU0zYTvrQYOfdt71BlPbgy9UqPjAcxQkO2AwmeI33yYawWT8OiG2B1?=
 =?us-ascii?Q?gwu7+pOTCcbmedB4RUa3RbgFIkMA85Ea7fG8iiZMF5rbx6fu+yqMNKOtpBJ4?=
 =?us-ascii?Q?2uzIvTyOOr46ddIx7yKbGsK+5EMStPlQvUU7OSntdemhpkRxNPRiFpK4xM05?=
 =?us-ascii?Q?tQzhxTRR+nLQkBuZUdDhGfjrOKR3z/JhzjFMwBgpIZD6pw9aH8W8qkfe4Cpj?=
 =?us-ascii?Q?BE/8nfVXmQVgFjlE8GEUzGWmxOkQTxslYhoTaUhpgvP1mKbwJMz8VuIEjDZ5?=
 =?us-ascii?Q?NPRKK2QbaL6QR/U1ODjoBlWMjOIQUJw8u1XRZF+UmkwJ7WvwBXZBB6SAGbcn?=
 =?us-ascii?Q?M3js8AsyEEZoIVEFTCga0UZovd7hJeWgoziQD4XokB/UbF+FoFzVN3pGW4Xw?=
 =?us-ascii?Q?4dHzIOj1VwLlO7Pxo3zdjAXK/UaXusfXiD88uBF2yRxenrbTCeJ3MoO6gybA?=
 =?us-ascii?Q?8c/wzJWawF0UMfnRXdBPTGOzzu3lwZLK1cO32uXGoB+DkU3HoqdUfuc3sM7l?=
 =?us-ascii?Q?M+UEFj4qarL6q3gYj+euFDHH4pUFsR6dPAza92z4iEI3J2gQWDHqob7lsnAL?=
 =?us-ascii?Q?JKTdGW7ydtC+RIVuOInnnQXCu7bNahyub7gGxTweYsSpl9m6jsmyhbZoOU8c?=
 =?us-ascii?Q?ywBEmzUUSc1OTD3oN9QjCngh8R68DIiIVOeDO/yNvl+hohoyJ/SNduvH88BU?=
 =?us-ascii?Q?crmGJkBX0u7oTfcQHmby4TmMzWuMeEaroQVRGZtlDCkbQ9DKT2li+oRAlR8f?=
 =?us-ascii?Q?UmeTgcN/8pOpQPerNOIiniotAxthKhzJRnDev4actRCH7TEGzDQNWO8LYMtn?=
 =?us-ascii?Q?emGdn79GEazTQ1jQ6gy+BdITil6JsSISh2yAcAq7gqr0EYlsjkWyZCswErEs?=
 =?us-ascii?Q?XLZpH0BNqWrCwgpbeTZ18kQXJhRGWMMROuBxZFPVqm7R//hlCTRj9rpMuIRb?=
 =?us-ascii?Q?YAJryk2BAK8zE0XwN1oI2Gx0Zvbm2EbqMxgVeTxVmnwFLYNypqtPTkqfJvoV?=
 =?us-ascii?Q?52vmMAiUAx81q0gXsfKsptbr5WMBo7iQHAhANa65KANbu9KtcxncBvv44JuQ?=
 =?us-ascii?Q?H6HTF1VYOEQyOX8KcpSdiNq7YXgdg0tMX0wyoHiq5nN+2PhjTn1e/aEIQ8mJ?=
 =?us-ascii?Q?/wAY+1lVE4/yPOYfOP5n8f7oUHZYGYVuOfr8e6m0744RLUnglMMUvrHA4GMt?=
 =?us-ascii?Q?ppyusqe10FjEqKnjg1nMeLeo6qjzgP1+GYHbTKaeMEnqlG/FAC1HHnf5GWYZ?=
 =?us-ascii?Q?z53KW/VQq/tZjzOuaijH19EIKHW/RqKS6RPNhGdEHdu4WfKIM3n2/dfhIH3H?=
 =?us-ascii?Q?qvlrdqiCgapMoSBaK9Rhli9PWvFzeTHEQPMPgbmswM3AuY0dmyoO16Rb3496?=
 =?us-ascii?Q?Y97jtvFpS+g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DQHJ3464BnYOvBfP4RpMUHxU7+178JcSTrw7ho6CqNO0agvu74omVhpuBkcN?=
 =?us-ascii?Q?3+/O3+hXJR6TfdcpvQ3RmaZl0W1Sj/3YdpBRNfpKscRgFlhoGHuMOsTN1crZ?=
 =?us-ascii?Q?Qj4mCdESyphwJqJxVFhZF7Zg/+g9r/y5Sy0xDuW4WTvZfaM8glP+KVAz+/M+?=
 =?us-ascii?Q?tmuyPQrK62+TALEFPZwgUTFGTBuGrOjmYEZbBNeBWIe/GmhswDK2Y2CyCLI+?=
 =?us-ascii?Q?wAZL50U3QPyiMT0QttZAhD/q1bNRU1JPk5/yvA4IwAnI1OvRaL+gUqjOs0jy?=
 =?us-ascii?Q?CbNvzZ3LcM++JuljcVoJ01S2woyLgmPamE3KaQME2OhDPmsLmFnjmTxDBnjQ?=
 =?us-ascii?Q?ii+SxZP9754Ipz5V0z72xQk+yyjfzFcqGvhz5PmHU7AqbWKz5NHldXKRyoSP?=
 =?us-ascii?Q?pJVVaYwM/cHfQslLQLxp1dXtJrAKlY7FjN+cJDQo5I4ZpJAfGbZo8oxcOb0u?=
 =?us-ascii?Q?Guz3Q7en8cuBJIfQQyKp51CMJCu+VtbZJzsXXnmzIppFBkTUcue4rXTQG0Ts?=
 =?us-ascii?Q?8rQ6zJsxjd2Yc8w0hpDjs7QmyK/I2rNkcR6eoXZ9o/Yg7Pq7vYGB2eythK1k?=
 =?us-ascii?Q?JS3xqabAA3D+dJiNcEt8xllO8wCUaIODFj7O5Icq/poScaneKWkcqmyHxY4Y?=
 =?us-ascii?Q?GjqD27Gzvesc789kaGzSnTs0jtLVdt+aVlmT86qjnin7ZC88UlUssCREyz3k?=
 =?us-ascii?Q?Gdxa5Hz/tkDqFPAcEfZae+0YZnD7/IZc67Qe7/EKIQ8MV/BhO6ExAfLxZlWL?=
 =?us-ascii?Q?f2FoScnILlet0HFbx6rtHzfob+UhIKK4W3LqU5nogIhfLv6GrGV4Tpwu8I0w?=
 =?us-ascii?Q?Am5XHsDHOlwEL0IW5NqSfveOSzVa5FydLuKN59SfNzoGdPnHLIPI6G1kEsVC?=
 =?us-ascii?Q?uUjQCO8++LdtqlQ3JPAwUPuDlwon/kpm1wqEbTn6qfGJ95WMxfv+PZcICQep?=
 =?us-ascii?Q?KeexHGi5E1YLLVA3ZlnkH0RKdPmwVBFiBpkSliBTpUepaXIddFkbScx7zCou?=
 =?us-ascii?Q?kOBMdae6nN0PSP3kL2rDtwXeQzc5re6wfzbYv4+oltAvdlkCzMRiMg6mCFVZ?=
 =?us-ascii?Q?YdsXzfnkrW8uOrTh/TbJzEBOw/icin2D1fncelP/ioB+yjbNCE6Ru5/RUS5H?=
 =?us-ascii?Q?3u9SrHAQWx/ejugiCgGQj03bksO6hk7UxQsiGwNme5sYGcTsf+RI2tGfbRtF?=
 =?us-ascii?Q?2sNazr8/Ab+BLcT1fm9glrhBSCOg9dKa0LSA6FdMtA8UzONO/HoKYT8rtrIG?=
 =?us-ascii?Q?jHjrFYZN5BqBq5ZB+QwFETuwq7XTZD9OGdW0tOlrYh/OSHyqFp79xV8Xp8oK?=
 =?us-ascii?Q?AVskySnkIiXSMyR30oDNkeMiVMpOrA3VeGJ4bTAzpt4B3YjnW3biX2f94K7w?=
 =?us-ascii?Q?peBoFvDJf7EruJ0U8m5/9vbTFENP0RPcJtHLp6sT5397R1NEb8q5waHbY47D?=
 =?us-ascii?Q?H+Hevr9iMY2svqArAUNrxEgYAAibF6uLXTWug8limeEYiUuLltWghEzgQBYT?=
 =?us-ascii?Q?O2waku1voPF8IzJj0TlJzxqD2uHrtQmGvENVzCETNb8lAZaDfcvFspylyG4L?=
 =?us-ascii?Q?2t21hJpWbh14aeTiUEF2yFE2v5TLC9ma/w50cDFB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bf546a-d147-489c-d2fc-08dcd166ad3d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:03:30.5075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6rWqLCwS00XnuvgVUylYeZbkDnipN9r9kSEL8MfvmfyNuPIaAo2wj0WozmI5fkibrNCmF1OMMkbVMMZd4wMog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7099

This board has one Type-C port which has USB3 capability. This will
add typec nodes and enable usb3 node.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no changes
Changes in v3:
 - no changes
Changes in v4:
 - no changes
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


