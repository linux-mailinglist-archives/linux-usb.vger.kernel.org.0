Return-Path: <linux-usb+bounces-5696-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD61843E86
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 12:38:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53C7295920
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jan 2024 11:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A04C768F4;
	Wed, 31 Jan 2024 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="JdjjU/8D"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B87762C3;
	Wed, 31 Jan 2024 11:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706701028; cv=fail; b=lcjGoiMU9mH2a4Ilk9N4MN/ZCBGkggqvHplc7bgO8RIedQrWTPBvddooyR6xsKIbo1lAWgS/L/jWjjCLPVNvlTZGqfNkR0jj7Es7VFPJ9fVo50BmeX25pOhDx0pxER4MJnxd691mKRrPYrcrxP/fvKicEzB93ulueZkd4qjUrnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706701028; c=relaxed/simple;
	bh=B/EH51pvxwCFWuMd6rUGmw8u3ufyQjybUTRUvHwy84Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SUYa9Fd9HgU5g7b05PMXuQumasgbwWG4pAFOYkI85NOV1RmiL+UxuTx084D9/xmb7BP/J7y7ZknUS+Lkgc+yX6rJgrXn4WVlQwC8/zLsjCqhRralsXKgitmaaDnEiWbvSyVQWdKnnO3Rpr5Rn3Ff5+bUutpGCZZUG2z/+586VTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=JdjjU/8D; arc=fail smtp.client-ip=40.107.20.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQNEpo4aoOmgIkBl+WXYRaeaZeuIvsgzK6NrbWP/Tw+gvv0ICBgJjnCAXAu8CzLSzzdKSeBdPVCHsVXJo6klRtnlXvctLRTblo8LnfTZpko7clJzMg4kUhI1QUsLLAwHDGodHINAslObKwNMbDEPb85PJVn7C1x+iB1CgYxVo0i7LVIhK8XswQmOXs0NunQGfC5697omdQfsS5t6+d9PL3lgskQNx+COLKfZGWczT+wq2+EeXY/7U0sF/9q6JWvTllH1JlLDn5siZagnJf5xvCFNyQRP+3J8d4lr5DtNGiezPgDb/IsiuxdOFzQMyenXtrNDQKQGhRY1eF+EKHUwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+YVE0y3rIeSllMgG1nDbmN/MjXDbSJd6RTrrXsNtjk=;
 b=la5qwpgMsF9JCbssp3MvZutMC9c6vPy4lN0o6CqDqzfWR439cyCWdKPNCnBB/HoKavqpbzUVtzHnRU/Bq2JTx0sJ2PqXsSBFK5er4PoPTJc4487XS4/BRyNXD+3a6r74ZYXOCkY7mCq7XfznA7HApM+GUB2IkmYJFjZuar3EuMzq9gW5hZa+fWi1UNskMke28Ioq5cQDTy2B8d+s3zWYuhL+h75mDDJ8fHf4MCcr+q+71osKQPFmlD+eNcMCHho74iQ43EGAWhiJjzy/BgFS/mSnrSHwFhxtjDZ7M+ZJhp1IEHcXcHjUFK4lOydAsmC8GKVEo2ykT4+8VG1tEyPDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+YVE0y3rIeSllMgG1nDbmN/MjXDbSJd6RTrrXsNtjk=;
 b=JdjjU/8D4G2LXVoRNCNpShviFsUP1v/6Om8jKTRETElDMOGphmrJWWSCQC5TMMOG1mvpUHsO/Lh04NgJ3ijvwdrfmrfCqIExW2Vrx67B5uyhK3AxjMuPJq5WNtMQq3jZpFiiTC3w57Ow0h4uxIm7gkpKlPBkGBjRW9VRi3cIYrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:37:02 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::d45f:4483:c11:68b0%7]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 11:37:02 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peter.chen@kernel.org
Cc: linux-imx@nxp.com,
	jun.li@nxp.com,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/8] arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes
Date: Wed, 31 Jan 2024 19:43:19 +0800
Message-Id: <20240131114324.3722428-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131114324.3722428-1-xu.yang_2@nxp.com>
References: <20240131114324.3722428-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: 36368d51-842d-49a3-2464-08dc2250f10b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dT6SggXDMu1Qm5piXKujk2Lu/qi4KrvaNJkPozXGgiQnqHTZGS1lNRrIP7d1Na31nHs+PCUh6t1TBfiykTef8zvS+ieSPUSCBgtPf0H2OZIsmGDERPcNQNtAghN9VmJ9d8ukHonfDWGJsl9g49Mjr2AW77nnM7Fe2a7VzS4wOGl3ZXr4+MfIN5FiQ6T+A7jyE+8tvJxki2QYnUunHwTAHjXIKIKcxtcq2xWGTJsVNrk4tUolD4zM8/A2B85Q4oVSqTUfsF8i/j0UQNHgoLBg0QbwLuOPtlaqVb/dJoLLdz6ZmcB7eCg9wLOshyqa2GkHsq4Phg644b2KxdT6VavbGmmAfyuXkvQI65p4gxdtwiAAdWaTn7k9noikoexh7KL+GeIPOZxqrE2uMS96Zw2NQJk9y/+igq93RMadzf8oQ1vict9s3zNVCXFW2DSr5v1ItQJ3x05UXC9wbt61BRhACs3bV4wsUczG+wRS3zWhX8vp6FX9T8CoPxtsomEqdvQ13xfjL3DhbhsraCGZo+WCdGQ1V+RWFp+PtY6k5mJ8bmcoheZPZqfl2YiKCaBzanf+K2VVVlpA7oYsa3DuGVbxd6UuoYEsWk8JcDgTGMVOy8Ss0L3B4PeegOwuuaC/Ost4Pq2EqtkK2E1IdypiMxuFV/K7oc9+L6Y5L7xHTq7Jc7H3vubGVwmEPYgFhBswBpYu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(1076003)(2616005)(41300700001)(38350700005)(316002)(66476007)(66556008)(478600001)(36756003)(6512007)(52116002)(6506007)(6666004)(83380400001)(6486002)(38100700002)(66946007)(5660300002)(8936002)(7416002)(2906002)(86362001)(8676002)(4326008)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jBzqpPwwRi/e84IPrAxLnz4AvBe+T1Bg4iPoJ+tjjVZk8yILF1NZkUoo9V8e?=
 =?us-ascii?Q?e6L1WYm9E11+sIkLvyz76orBUDC2AsB54jMyfR9alAg31klUE2gt7M+RTcXc?=
 =?us-ascii?Q?WoZQE+hV1AjKkWLwNz0oBxX1Wx/GYKeM6el8FO6HVJi3dgt8Teeylc/yGiIX?=
 =?us-ascii?Q?EnXPpyspuo434DYp4uejG2K0quLs6iftXN3dO9d6lLiWfK72JotRvAvLQoYm?=
 =?us-ascii?Q?jx3XgKjumtjL9EW9TyoY7z21sa/IjItcH/efLne+zcoG6XIo0sFCzeJWrQKb?=
 =?us-ascii?Q?ba95fxJxyqcBd/Macs3IAd3j6T73zFAkQ6uF0qoszrCFrJXA9D8mOAzEtPZQ?=
 =?us-ascii?Q?jLS/lLkGENZLKj09wX37fM5OEL4WGTsqKpMK3sMcUbvdYd8/bFYj8dK8Uoa/?=
 =?us-ascii?Q?TvuycESlRPOH0/m4sv7tNSp+StxNnzFJJqIDhb7tyq/xWMRZ2VfgkMgnoXKQ?=
 =?us-ascii?Q?ik8S6+EM+Savt5n94Nat35Kp0wY4rYr8UT2KmzvGoi4QXRzwPgV0Z8Jsit1M?=
 =?us-ascii?Q?cxJI5xdL9lfCTRWUcXTRQNLytxC+H5oCqy4VcIo/0Z2rFlWVXt3IkAIopURZ?=
 =?us-ascii?Q?wdl8cp0BP/7OHxPeNwplYL11YyE9En6Y2Wnbhpe2+Zq2HIQRhNI4SjVlbFkf?=
 =?us-ascii?Q?NtGYL4GDENckWkdt9ci027jdN3ZiBapqgdnvUMMY2NhQ+i9E87zwad2u6vZq?=
 =?us-ascii?Q?v8SDItDLE5rz52vEyl81sD4EDaOzOBSixRYEXeukMmjUJdJA43r6fqWWBwxh?=
 =?us-ascii?Q?uP5+vOVR7JRBAprKPpUdr2eiEuWYsHrC6q7V1/wJouHwBUiOAe9lnbSpAiTZ?=
 =?us-ascii?Q?1CcL20+j2q8g7uStPKkjDx3kTpaTM1tZzIf1yvEI1ka+7nY1vC6DdV0DQbOu?=
 =?us-ascii?Q?2K6J2pozvJNjDtEpsyERFH2fdw+HT5p48P5oOLUEemedqmsCfO6Winw2LpW/?=
 =?us-ascii?Q?F4zlWvbAsL2YpE/ewJd+1I90OIRZVEsHyKsTsPCoDkI3g4C0fDLoE8GrcNFg?=
 =?us-ascii?Q?PYwngVnp7WEYTf7CyYv3xGtFIV42RwM+o1EsCs3F8ppY8HNowDfptp3v6KdD?=
 =?us-ascii?Q?YBycFZHXMMbf2ZbIr415Znr63RK6juoQVuDe6sJShZ9NaIUMnLypurzx9L4Q?=
 =?us-ascii?Q?kPfxsyzjOOV1Uz7QB6to580UbLXD3C6ax4+heh2ww2pK9HGdtYaQFeYGnlU5?=
 =?us-ascii?Q?nJhZMSvNgdXhSbnR+T260IMxnAQrP3zT9eX+G2SIapHTLw+BTaCWTrw6X4XT?=
 =?us-ascii?Q?niZ+IkuMZIPIuoajdW+FSHF5s0NJgTJFpx+bMrhQ2QpoAybWovZrhCNIns+T?=
 =?us-ascii?Q?Ov7MnIZoT3sJlfm8xEqj8AcmXvNto2Oz9lsyRWYjmmJGENUpb45KFyNNF6fx?=
 =?us-ascii?Q?7yQs/LTQWuyOmvacPGQiG6n5Q3/HeX1B+EjKNpdRvB2MI4D9R79WMdedzdat?=
 =?us-ascii?Q?N6g7cIy/pZfPMrvBxReJ3+dNA8zaqmGC5N5JP+fQqCBdAXvSq2OamJXirol4?=
 =?us-ascii?Q?AfmyWTUmjuoeUj8G/NUGbp1zZhb1Bqltv7shXGHQ7+n7XZFpMRZXFors8jJ2?=
 =?us-ascii?Q?9zngsWXxFcB/lfhGehK2HS1QAEaVo/n13ebTpKoJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36368d51-842d-49a3-2464-08dc2250f10b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 11:37:02.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4vNU09dXmsQaBNBYoI48B1BCm9Mm0sekHSlRWaR1sbpBu7BrYbZUYVubN45j9IhxJLVKo3MSEd2gnshNmfM9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093

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
Changes in v5:
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


