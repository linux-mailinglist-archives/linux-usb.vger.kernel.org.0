Return-Path: <linux-usb+bounces-5250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC1A8324E4
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 08:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 317741C21320
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jan 2024 07:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BBAB6FB0;
	Fri, 19 Jan 2024 07:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="flwUygz7"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2083.outbound.protection.outlook.com [40.107.13.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A35C13B;
	Fri, 19 Jan 2024 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.13.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648411; cv=fail; b=iGTZJ26Rr1r3feovG/zOSmK9HLiQJLA7W5Fte2JH1lF2GyxCGkiozPJb7UaZV2RrptpNOslqRo7CrEmKiiAn6XGcpGop+F6moPlgAQyemMmZHCQ3fkbsW6UnS307WfWvp8ZEvMVKzQ/YaCkCsZtwoVuKG37MZc3OIfR6ruyMkuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648411; c=relaxed/simple;
	bh=AorFnCWj5wFyg6XEPIPrNCrcwOJZ+eEka/AQHAuF+uE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NeR9exxWT1b6dXtOnCV6Y+dHQjg4qM+86uGWeBp03kQBksfhg2BGdv/y2u1Qw0lVCH8GSaXktkmLwQziMMi8oehxKfZicfz4jytQ/WdOe7OcX5zi1Oh9rP6oEWGZDcmnOmb6kC40jdEp7KVNpqwyAmnLlET/ABbhpzFKTK29Zg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=flwUygz7; arc=fail smtp.client-ip=40.107.13.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2D5uO6DUZwgc7qFRaIOHoVsbKGupT1fSig2hJQF/t/kWDfBWPZ/SZ7hLzE+bsVEypWb3IaU5PIlwI5oDbyvQKKY2ZjLt3pq3KyboMQSK2tWzU7SoUnOuK34UsTjlZrQCasGR55DoAo3LIOXBSox7z+E830avN5KDIiUTHz9mMLR/Lcbr9BS1FSJxM9xf59FbAGCjaK7h++9FZfVit7SqPl1CfoImib44esCUJmcSvDFyG8poqB+DVQzHwObnEr1snpt3gtcqWiZYdsfwnSuvE86Gd815ps80zoetutYM7v3E79CMkM6fBe9wuqjs69d6e5AulueMwKN8cHCv1DVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thQMYdFO2yxZaFTZ+dOpxcw3VkK7OIaATkx670RmRP8=;
 b=TCpfXZZtBVlji4ULxasDKiZcfHCdrI5ybSkeqgb1l2M3pKjNFG+1hz7shK9GpyS0hqJrkrSAFw6b0yLcvXTNPlEISMKzp8AiEblVuZdzJns3cQ02D+12BcZLXFY6RYnGHqllPEAX82Yg9V1QhkylA8h2e57yGgNVTTsTHooOs/imz/xPFZ6tmcNeCGvZX01tUcZiKyMkYysKnybJ7NWqUTha8o220d+sfPiEAZ1fI+xeascieUlGkiMMT8KedagMBW7BbdVgMSjNapb1ti2iZb2YqBy70a8ox9ZUFq4Dj2H531JLS+Yvv4n8hoKCr40KjNgiejb/NYbsR3g9wc/piA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thQMYdFO2yxZaFTZ+dOpxcw3VkK7OIaATkx670RmRP8=;
 b=flwUygz7sSD9J91RKIBQjd0SvpgAYK73baAugFr56uwYeeMjsVcVV3OcJ6M6qstJT/Nhk6fDda9gZ5MeGWlVhZ/T6j3ISDKtPzxB+snjm+lCUDyubMUG+s5y3lX1RkIKyjGZ+xNJoJ1MOY5VxJ59AZT7skW+wxdlUZhe2YpXCTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV1PR04MB9134.eurprd04.prod.outlook.com (2603:10a6:150:25::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:13:26 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:13:26 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-imx@nxp.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 3/7] arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes
Date: Fri, 19 Jan 2024 15:19:32 +0800
Message-Id: <20240119071936.3481439-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119071936.3481439-1-xu.yang_2@nxp.com>
References: <20240119071936.3481439-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV1PR04MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: d1662c2a-6ecc-47a6-6702-08dc18be2178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XglFoYyM8MLUjDL14022L2yBxiUge4q3UTXDP2Efu5xyP1MsG6hrhv0ImcHQFuFIS0O5m8hnwoTiavNrAdwcIskU0ywJxKxKSEWZ7CEmCUL6GQ84i4xs5H5eU00n5zUQocRLrJsyxDMotJKUBEaRVy2oyFAWhHlzBKBEYkKSflaJ8nBxbH4QUG7SOyL9bD7k0dASQBTj48OiASz6KANInuq58K00WtXuDwtJY8/q0E+2zHoG8n8b1M/0JlY/w5uYvsqdLbXUiapKYC3LHBrwddX9AOYZGCLZPvVs9T1B9FPSIgyTlFLZYhCc9HjBSOwXom3v6ZKubBvGWWfAc0/HBZIwUGaeEFXztrQYk//l1LBsssNeUBtxA5IOMPFR13pAioi4Jqhm9b/HkDFo7o+LUgsn13bP7KHKPp0cyXNpjXojDnxOi2jvPT23fbq7JYLBe/odfkRR5m0bjS3PqJ7gQvWmwFb02jDJFGttUBS+Rdkfl30hp/GW8JUiAB6mO7mzTBaHqsaBQUyf4eMIAPuihMSu2v0LjqvonMjxlJlQ1LFJQe/frTiiCODEPlnGVsQ4IUFQS9Ia1jW9tn6N3RuPMMw+PHRyn8cKWj3SanmjSeCcmrCSp1fZA+jmo2tH4hYzhILjAP7MuNvoBdH74/J90RWOKTZ7/PE1ZTgqdY8kRkltEEJv5V4RuPu13rXGjM45
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(41300700001)(26005)(6512007)(83380400001)(86362001)(36756003)(38350700005)(4326008)(8676002)(5660300002)(8936002)(6486002)(7416002)(52116002)(2616005)(6506007)(1076003)(38100700002)(66946007)(66556008)(316002)(2906002)(66476007)(6666004)(478600001)(32563001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yVUZRlSDSeWDcWpRcK5orhen5e84jEvhU5lsd87FsT2EoJ4nZPIQtslBT47m?=
 =?us-ascii?Q?3y9jL/uRHIP04/HsdQ4zzKRE+hgcSLKu0CrdrALd4yaI3deDAgfu+bIlcxfK?=
 =?us-ascii?Q?304doBYGwSxn/YCCu5DCFsKUX0uimgdJZohzBrkleznKcutYhwlLHDuZVYIQ?=
 =?us-ascii?Q?tpI5FkAtlLoGDzkjKyvDUSXwGxvm3MC+FtJKG3Jifn0BpieIxYPKouh7Ybtu?=
 =?us-ascii?Q?mQyjKisI/d+NL45eVYY3M0+pGsivGMJ2V6GnlrJqbyBgqRs19/64lDJv4TiH?=
 =?us-ascii?Q?nyE413VYYwsw/B/91aqnCWllIPdBdC6fiwXN/HLWMwk4Edl42BcDiFShb7a9?=
 =?us-ascii?Q?3re6/Yz9W8UeydJ8vJ7s2LSSJDH1bVqmNy2xcHNPSSYkbMgDFmb38rHHZL3J?=
 =?us-ascii?Q?MxNxE8iq01w2a9wgUsxBLNR05DgB524e4w1xrT1iz4SpTWasieZFD5sS7PHo?=
 =?us-ascii?Q?DiEigffdOsAizLX0kbNB6sm0uKu7JSeoLGl7DLhn3J0/5y6ITKWrewSSW2gZ?=
 =?us-ascii?Q?MJnPIoWEcjstr47vZRTWFTMfCoTr764srcIdD9lcGiABlEfnWAzA1EBuQydE?=
 =?us-ascii?Q?z4k/+yIyEP+c7GDu5Tzgg5XW2ohOG56ACnOok6OVsPGaW5HwK8Hj4GOFbNAF?=
 =?us-ascii?Q?fJm4gqXkenDdvQgdd+nVpmRnIcwnMjso9gweWS6jwAJF9T6dOhwVl9e7Gu/o?=
 =?us-ascii?Q?IuyPOB/OKkJ/2kHcTi91er9P+nrBr961E9y5KaDqRRB/8wpmNb7lfc/4o2MQ?=
 =?us-ascii?Q?3v69KlEF/cd6RH/Ie1SskE36w7VDGjaLBCrbI2HdkKODPGMxuenWu5JLGrjX?=
 =?us-ascii?Q?Ngft5l6McQw1jK2Wi6+Hmokj1Jy0Y3szzpJY6wAGMcIydEuw/shpzbGl8NgF?=
 =?us-ascii?Q?zVRByxTbvOEUxQvGIPqF6AtFeGHbp0A0ZWm6ny8ZNm+aKkKoo0494G13nUD8?=
 =?us-ascii?Q?Iyl8+eLZmpoOLUkc+ljSGfzCl1w5Ejyn6KKFQUQv6aORHWNPmhAL2TwLL54j?=
 =?us-ascii?Q?dV56Fc3jQmJStIw70UFmPrR8b1qPLWkG0M/OJCAXq3IIEo2Ni7uySr6SpmtR?=
 =?us-ascii?Q?SQ+9EMY1uc9JBiuBdTHixC0iPRvMPu1Xmg90E4Fg9wtKK7dqDnKoLXLsG2O7?=
 =?us-ascii?Q?Np1Mh/RywG4S2n+xGPash0uQw7ezfcQbcvt+ql98l83S9WJoZv9/SVM6tJfg?=
 =?us-ascii?Q?OyWNWnb7Ev8O+mkH6GpUybwhUqDEBmHt+stjkulaHeGLk2C3rgQ3iCMh9SQ9?=
 =?us-ascii?Q?1H6DJBKnEqZUrzxxeOeWFL+Sv+yPv8F8KHbPYI7TIJN96Ig7cRudL1tZfrKc?=
 =?us-ascii?Q?CrDvBTJa3rW8zovWCgqHCunqaKxx4m0IaANBWxm3QlKbcaNFaR/AeKK/OTO5?=
 =?us-ascii?Q?jn+CgWWx4s3z6mGzvKYP4KagFgABkGPDWfQSxJaI1leoCtN8RFrLW5r7KCaa?=
 =?us-ascii?Q?64pVDtdm3iHW5QoXTCZrKMgzXUXPbg+6nXL1BYrsQOpwVZEuHkSrILGZHrpZ?=
 =?us-ascii?Q?+vpYUwZENP+JY7X95Zexu3eCAqXz9AnU0GdGYKeH1FvdAXWmKcrUK453a51E?=
 =?us-ascii?Q?ZG2BMVyLaWsSvidHtMOiL6MWg2DC4BS+FBD9THko?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1662c2a-6ecc-47a6-6702-08dc18be2178
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:13:26.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up3EEEcTwSeZ3qCU4xbkcoqpaSFFOLFbf+G1osJ+xgf2SRxGM5peO0/CXrw+MY4Knk9uiwRCVIZPTBP7Ba3P/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9134

Enable 2 USB nodes and add 2 PTN5150 nodes on i.MX8ULP evk board.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix format as suggusted by Fabio
 - add PTN5150 nodes
Changes in v3:
 - no changes
Changes in v4:
 - no changes
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 69dd8e31027c..bf418af31039 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -133,6 +133,64 @@ pcal6408: gpio@21 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	ptn5150_1: typec@1d {
+		compatible = "nxp,ptn5150";
+		reg = <0x1d>;
+		int-gpios = <&gpiof 3 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec1>;
+		status = "disabled";
+	};
+
+	ptn5150_2: typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		int-gpios = <&gpiof 5 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec2>;
+		status = "disabled";
+	};
+};
+
+&usbotg1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1>;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	over-current-active-low;
+	status = "okay";
+};
+
+&usbphy1 {
+	fsl,tx-d-cal = <110>;
+	status = "okay";
+};
+
+&usbmisc1 {
+	status = "okay";
+};
+
+&usbotg2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb2>;
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	over-current-active-low;
+	status = "okay";
+};
+
+&usbphy2 {
+	fsl,tx-d-cal = <110>;
+	status = "okay";
+};
+
+&usbmisc2 {
+	status = "okay";
 };
 
 &usdhc0 {
@@ -224,6 +282,32 @@ MX8ULP_PAD_PTE13__LPI2C7_SDA	0x20
 		>;
 	};
 
+	pinctrl_typec1: typec1grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF3__PTF3           0x3
+		>;
+	};
+
+	pinctrl_typec2: typec2grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF5__PTF5           0x3
+		>;
+	};
+
+	pinctrl_usb1: usb1grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTF2__USB0_ID	0x10003
+			MX8ULP_PAD_PTF4__USB0_OC	0x10003
+		>;
+	};
+
+	pinctrl_usb2: usb2grp {
+		fsl,pins = <
+			MX8ULP_PAD_PTD23__USB1_ID	0x10003
+			MX8ULP_PAD_PTF6__USB1_OC	0x10003
+		>;
+	};
+
 	pinctrl_usdhc0: usdhc0grp {
 		fsl,pins = <
 			MX8ULP_PAD_PTD1__SDHC0_CMD	0x3
-- 
2.34.1


