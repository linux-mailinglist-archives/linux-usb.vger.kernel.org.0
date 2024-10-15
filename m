Return-Path: <linux-usb+bounces-16229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7599E52B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 13:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 000611C231F9
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 11:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343F31E7666;
	Tue, 15 Oct 2024 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TONr6Aee"
X-Original-To: linux-usb@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013031.outbound.protection.outlook.com [52.101.67.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E241E3764;
	Tue, 15 Oct 2024 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990560; cv=fail; b=CDs7PHN92pqd/t+kPflAG4G+2JVs3LQwFghtcL6zFihxoXaSAGROe/DKuGdkUSnS6vr7VnJYSaxHRbBgKbSLw0t30Apl2PoQKtxLEEcgC0YEDWW9O06jE6lE8ZMQHrUVHmoVT1KWEJhsRh/pFqBBfMLFc2MYXFpIF8Ni78Hy9lY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990560; c=relaxed/simple;
	bh=JO/xS1jBYfNZLfqvM+1S5CT/NwEXJWS0eB3+A/bi2Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Aa6qEHbHeN9onpypevcdPzPWaXA6RTOirzYwEIFg2lGITNSFo/r7NcF/eLa2bRva6Gm4mpCXirdrBLnLXiyPVgYADd32K/SFRSnDGm09dOLGOpMPImlhS4T90TwD+v4gBIvwA0GL8pdnj9DED0XWi6DSyMWe3SxIAtV8z6q6tdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TONr6Aee; arc=fail smtp.client-ip=52.101.67.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGtyXKtks8fbRZxcKJVVAFlge3y7Tzt52hSm/fCxkj82NvNnRlHrJQLH3RPKWt+P87zQiwmO9HwBt+/La2I5JGMXqSpLnHUlsISpDzNdtfOTnuqiIq1jtlnjip4603xOJHvSG6bNCoo3n0amHf9QHmYDdYNsVGWzC6UFr5lELURufsa7BXO6cPopAu43bBRv2E1qG4IXeMsbhU3ni0iDAyyPbxuT35KO5uGTFP/fqpqHNEQ1sefoW9CcgtDKOch+lQJF5XWorJbGq3xYnQ6mLWUOR069g0WPTl+mFMW1Qhu7TENHYdQHcTP0PWQrrry/8ONMVv1vJvT2VqxFmMhoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9GBIrA1Z2FAqfNyjsaauVdh1HyWj7rIsACFTdHGRoQ=;
 b=uFrRC7lEqGPq0ftO0SV7LrzCK6UYR61UhChRoJ7SuWUiPmUAQUihDq90C73cOm/grP13AL8n2ahrTUwicAFZAkknBqeHUIiWclP9hHTG5V7Ftswmw9KKiKRm2cAX5bJiaROED0b7f6E/PhEUqKChBVAC42Nq3iWbmD+AaYPLlT71VFL7GqJYoBRp5sMowlgetK9y2BjDIBx3PGqge5td6sbmaQ0dZIdI4wRWNL/rlXK19MDqgANRJssY17KBTNFqKYYdHgiKEdJz5Xmr3yJ7gxMsn+AZOX5ccHmO475XsaebYGQUO4gPScOJCo0pEtF3hwqBcOsf2p3Tc5w0TnGNVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9GBIrA1Z2FAqfNyjsaauVdh1HyWj7rIsACFTdHGRoQ=;
 b=TONr6Aee1mVO0KXVK+vwquFNAw6AE78/U6VRq//EVPS8Kz9OyJ/LgZt/eyWxbSIuejo5ofBJOYKomyEvZ4ifVF9QQZnJeE5c/zmZxbik/gDENDe9OE8Zdhw0+JpAsxSEIqrYgb4Lguk6dv9GF/eTy8BpBjIuWDoYH41ppqPZBr6C5tHNanH82vdLFQlfWO5GLmjIMaO5CB5cWKmZOdSlySwp88B6LrC4AFncQEzv9NgsGXLVb+YKZDjCpgBNi+EJywppKfGeWM+WGQyBI4yPY/VAsRrp10MbOfAughdcz1LFsyFU4Oj3WwUKV9u1JyxLMkE8YCDT9XqUEDEqnNMWYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7701.eurprd04.prod.outlook.com (2603:10a6:20b:293::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 11:09:15 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 11:09:15 +0000
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
Subject: [PATCH v8 3/3] arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node
Date: Tue, 15 Oct 2024 19:10:18 +0800
Message-Id: <20241015111018.2388913-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015111018.2388913-1-xu.yang_2@nxp.com>
References: <20241015111018.2388913-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 20bb5aa5-9101-4de2-8cdb-08dced09cea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/pXge5Na+NchsdgkjIaYfBdJdxmV3/Hg+AggojnX1k5rsNQw50ibgm5fNTJE?=
 =?us-ascii?Q?5VFrTBKXC5u7BaeGYv9DWeN7qPRksoChmQnO5SCPlJzDJ7V+pdnQpx8tNqGv?=
 =?us-ascii?Q?DLprki8m9vrnMmbvfexqIfa4XaZPP6shotpy+Zilv/nT504KK0EAddFZzdAA?=
 =?us-ascii?Q?wOBlq3Tf1lMEFWtPm/wC0BKEggB8LqXdVq7wgyj1xYBPGg+cfxthz9vjnCxk?=
 =?us-ascii?Q?4FjXBVjp9d9wf6yuTJPs0ITlYfUKFAy9NuF+UVJEGl1SOF5w/MfBPW9A3mNN?=
 =?us-ascii?Q?hVINA3kCjgDxSmFw9EpV4VGGAP30sndtsIV5mzngzmmAlSjxNMQ+60s7OZuD?=
 =?us-ascii?Q?PwfLsEeDKCINIWHfnXISBmNIA/RN88nlfgYwR6TRBA+uEitpIu9+79nqKF58?=
 =?us-ascii?Q?8BaZg1c7iLCBCRxwbQUw+yIGGQAEg6WQpYvSG/oePjPym+r9CqCunvF6b2xM?=
 =?us-ascii?Q?reI0V2IWTZjmFAj00ch6JI2TLO7wFX2qD3AEBC6Pw0CwnI/EqDYM43oQUFAp?=
 =?us-ascii?Q?7Ibas39ivhpsagw1LQW1sE/wpUSwrBVJhcDgQENLuXcaMG83E2cAwDw5r/bh?=
 =?us-ascii?Q?d2Yt8eYW6oIdpvV0cIEOZKi9RFfDvkC9duD84eTQ9ZAuBaBxOFeSEwS6vglx?=
 =?us-ascii?Q?ZGrvP3yeaENeJlI7xkWBo4SbSYM8ELG8VWwxm0yU4tmIsjYlIuK/8r1TxHjr?=
 =?us-ascii?Q?3w0RTfePsJ7E1f1E6OBToWXxar5K9swS6BMPsMohmo3tkERI/1ZarpDgY5oF?=
 =?us-ascii?Q?/zKa8m071uD/O4Gk7Ap0kbAVgfCygOrk/DTV5A8mEo/o3KkAkhnaZSi9ciAO?=
 =?us-ascii?Q?wsmRLTmVLbaBD5ROhfRI/hWAP8lf/+RcRdf6r1d2q7N8Ca5S3pmH8TQxibaP?=
 =?us-ascii?Q?k+LwX4MOPSxT8AW6ZPPFh8X/GX9XOfK7NG0rKqdwSRGqORUBcYQSIC1QnYgb?=
 =?us-ascii?Q?pQ5OacyQfqw/9UT11PoKyOQRWyV51yxHD1hv73ncD3hYooTKJHcOQZe1sHp4?=
 =?us-ascii?Q?ofX3u5lIuYIYfiTljSafFaHQOSPSydMyY+JuE0yeAduYALtQOPuCKbDYYfz6?=
 =?us-ascii?Q?XzEHWhcjWXlEQBXrdnyqI/qQjtT9+b8kEfn93dodcWSDj7H2QmMJBi/RadiH?=
 =?us-ascii?Q?HFr6C9E6nLWBfgBg88+pt8ZPEFrTFLSgLmV2ItP0jnWIRaxIol2T8TGKdcxZ?=
 =?us-ascii?Q?pGaFVT7ORYbkupIqaDlAQwR3FDbYJraFQEEatEY1JaBZ+xiyuQA5XB36ZkO3?=
 =?us-ascii?Q?8YK226JW8I42N7TiM7ywCzDO7G9UMuY4vyzCnS9Eb8MCQVYCjKEnaF/mms2I?=
 =?us-ascii?Q?UxcH/M1vvzqIqMdxXZRVXDdjYrYbUTDwOtd21XMEE5xN62+m5JNp+2PUtgj9?=
 =?us-ascii?Q?O02irNY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HL+wXR+/rtHI51GpTUY/88Hv2Q1OliYBHZDlAZoKWrUrhNktQp4I4+69aFHa?=
 =?us-ascii?Q?uceYp82yNnziYY0Wp6tMlpFD9uEMk+nVy3LhWNiqD/b8M1duNsDZQ5Wweson?=
 =?us-ascii?Q?cQ3nkmTB2k3bfcJllRqLX5WHbjse2eSpjH9d9XCqzYsrvbti7aEML8Rn0efY?=
 =?us-ascii?Q?UI75OUHZg92xnq0ePBodd7oNYwz43utGnMEPeb4RdYluSQZg2PLHCkf7Tmvl?=
 =?us-ascii?Q?5dUR31E9B9wu12JxaPZil61sJfM/A7L9X70LPaPK1JQd1GqsUrCewF6TXYjS?=
 =?us-ascii?Q?Hhotq7SCnblyhDrRMLZo1dHW7TkXSZBohufULLA92SJC+9PPSMF91P8I8MXm?=
 =?us-ascii?Q?WN9iO9DHtHJaj//T6nxSk3NWvSuUEsdFlrasW5di3/e5pp3YB79u2GHwAEmP?=
 =?us-ascii?Q?rot9r3rUeL3O40IqVidO8MvgCTbbpSDk7G21QXf2AXgUIC3N14NoIhiz8zZO?=
 =?us-ascii?Q?jd59D4XRBxvAyZ4UDRVv5LJG18T+xC2tPLBaXZQe520byav+8hd3jlNImvTK?=
 =?us-ascii?Q?qwOK/She51p8m/jhrO7mkb13MJ3lFcTMGwsHkuzVmV837ho4a4uE0Xg+tqWL?=
 =?us-ascii?Q?SIxthmVEpTqy/XT3F5z/yzfoF4XA5XnU8It6NUw/N5Gz2z7Jlr/ile/SK+pc?=
 =?us-ascii?Q?tNoodUFHxInEPOna3XzgcRmCqNzw9MvMOd0+kG1/4MtXYr1dCMvg4Xt2hQZC?=
 =?us-ascii?Q?HZbUQ74P2ZmH5JDimWXTD1BVqiIQGjqPVLSZS4eVbo97G39eXLhEiSVJd1I/?=
 =?us-ascii?Q?0xH8HJfF31bOMMK8DHm/+Eu9J2oCj+hmmlZy83+4+BrBjjCFyGMtoLFws9zC?=
 =?us-ascii?Q?qeS6dikiV6bcplFFNC84ndbOe/6PMTp+dSnhRKtBrBdFW1g71YSdxWR9SmT5?=
 =?us-ascii?Q?3qs/VFtt+pt+hkHU6oL9yQ17VPjhB2DOuAlHOA6ht8XaD+d1bN/GS+Jup3qn?=
 =?us-ascii?Q?30gC/g/Ti+fH1jckURth/b7Gc4T6zZwTv9urQBug0665ObG1s0aV4XZWy2ds?=
 =?us-ascii?Q?USUPfk5JRMatIQ2rfCIlrJUde7iHY1LQFdWkhUCfCLmHyrP5EUDCzVHAfgQE?=
 =?us-ascii?Q?XianlDaiFuqJtJaCjxM6Osy5MNBRPohgJrLMoZURZbZJjLV7dr0WE4GwjQ49?=
 =?us-ascii?Q?/TW2y6/KrgfiuAG8ZKbh7ZifiH/4G+QGqAjI0HDg1f1x9K8kuGbeeQRPNVSC?=
 =?us-ascii?Q?ObFF4YyN2ChJeBAbhB0jHDoYnHODDQXz5afphD1EWuqo03DWYon8OvLp1Fpz?=
 =?us-ascii?Q?zPyfUUErK9oVORZ6993w4cEVEb7/zeh7BjnIYSDWAwWcf5Y5cnk74pwJkqz0?=
 =?us-ascii?Q?ASzAQH5ElN2yI4gY5ILahhnn9h4rlDFKRxXGSK78Tcj4XElh1XtdFuTUl9Ds?=
 =?us-ascii?Q?drM2du+qhXu+rHyhmT3bx+Elnz24iqAhBKJADyNHxsAzqRFER3MwHy9pSOPL?=
 =?us-ascii?Q?30BMYGGpvLFTM/SiddEQdFbwe+/pRp09d9qwzxBcGy10xfVSMZBfFUPYds1Y?=
 =?us-ascii?Q?Jlv7y7z4C3JtFUhnjis/YCmUnzy+hXJQbo4IT1nVg6hAiJ0hEhw9Yo5xtGhp?=
 =?us-ascii?Q?0XP46eHenAk7xnHSpbt1ougoyWH937LhMzm4Yva9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20bb5aa5-9101-4de2-8cdb-08dced09cea0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 11:09:15.8519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB2MfDz+/tecgTvl+tx8A2JaEze524DLiIhbku5arDbixnB2I1KJE0GFfs3t8Hu6HrI8UzqxHF5EGUZeFEwfNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7701

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
Changes in v5:
 - correct nodes order
Changes in v6:
 - rebase to latest
Changes in v7:
 - no changes
Changes in v8:
 - no changes
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 37a1d4ca1b20..41a4ee4751ed 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/pwm/pwm.h>
+#include <dt-bindings/usb/pd.h>
 #include "imx95.dtsi"
 
 / {
@@ -250,6 +251,48 @@ i2c7_pcal6524: i2c7-gpio@22 {
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
@@ -332,6 +375,38 @@ &sai3 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
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
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -538,6 +613,12 @@ IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7		0x31e
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


