Return-Path: <linux-usb+bounces-4954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E36182BF0D
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 12:12:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCAFAB2443C
	for <lists+linux-usb@lfdr.de>; Fri, 12 Jan 2024 11:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08FB667E9C;
	Fri, 12 Jan 2024 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="mVPEen2w"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E333065190;
	Fri, 12 Jan 2024 11:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmvQzzQUM4Oo8x+VAMEr2Dy12Qp/fWLBf/poM5TPqXqlEy5Z0DnZIGPGhwX7+QUGc3FJnuvUiPgMfamGX4hnny6rJJhAABWIS5p2OceXry/RwnlATswkdqi+mRmTJTNgNcGs3bI0DbjKhEGyP8XBtdieANmor+AR7kX4A/ESbbfId4sguOQSsT+3D1tsIQaSbBJ6ZrCh6P7ozx6FKzXky/wTCgA4jamGCkPRiGflqagjmO0SM4Fl0tZEN/95ChIbcVn8v9TlY1mss61u5QMepi/nQXg2B2jkivsPmquqWK1aT/PdnwjTDLWFvQFYgXwOnou9EOSpoFsT4zU6RCVDnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zit3191EBYOlefVrX4C17UkZg9XqeXbCvic4XxZ9aBc=;
 b=XqU7DHb8+ww7wRPLSAIQpyTmhkbrELgykawrP2dgfjh7AF8xmVPcDUV/46C5YYOQ0v9v/chS2e5N1sFHyWq1mqHBtSm6HEGW/VAFLElF2qFMzro+kn/dVbGMHUHP+7dCDeYbfxaGfexU8tMAawijGtWwpblv69Ti4cqm4dMQ3opFkAlr1G1wr9raUAtHyGlTUTDVef+WrD305Q49JYFsnDkvLbk3EqFoybPQx7hMwQ/QP3flRh/8JhOb+Tja/TaVBMlEy9De2Kt/W4CygEZeHls04+GJKqejiH9yxGjOg7MFEzLElAAGMSYmUb1cGe8I3gTzYGIRq1hxJ3L7cd15Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zit3191EBYOlefVrX4C17UkZg9XqeXbCvic4XxZ9aBc=;
 b=mVPEen2w+ZwRvwgLSOk6Zd6zIqGuQo4ghPpJuMmxQnbqpSwnwuMjKb6ERi9nVNHBAC7tpmQH3DVFr9iw5E/gH1dgG/L022IQNNO17DDf+n9zP95Uq+hvjpr+2z+WJFCqzvC1PW0GTHHhq4bhINAKE94q9rBPOvibFA82K5QBXiU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 11:11:46 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::efd8:23d4:18bf:630a%4]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 11:11:46 +0000
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
Subject: [PATCH v3 3/6] arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes
Date: Fri, 12 Jan 2024 19:17:44 +0800
Message-Id: <20240112111747.1250915-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112111747.1250915-1-xu.yang_2@nxp.com>
References: <20240112111747.1250915-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PR3PR04MB7227:EE_
X-MS-Office365-Filtering-Correlation-Id: ace55456-d168-4667-eb80-08dc135f43c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	unX7apggyHLNjOYpyT1ptO6rN5/jCj0/6cRamXVxKJQq2mSjU6WI7Td/s1nAdwlwy2puZVwk+FLpTWEevoVTWoUO/23UHwbRAaBthvKiXxphZOajcLmzCVqm6NAIDDvBGGqdh072sJtqbNedwP0tIDp8mBFp7yoXiwgWtqS5MxPpmeW6mE+82gLdIsmQYOSFItAAGF9/ESvIpMYleGOjL7mrYMmEWKPnpwLqYHYLbfPEpENvj+vMzv1eLUqo8/OXkx0kWUAkgplpGK4CXfIhKBBR8rIyJ6IrU1z7txy42tJtTbUGymatusJxhy+oVw0zT4LcEIrLbP6JdgkJpCdXJJdoLfxXHYzMSbV0+Pn2wE/ce6R+GK+9Kei9ZjsTlXc1GWDhALtSu36KuKFSfZbi6hbR5f/pMcgI+ql2/QKt0ZcfDQa52/WXHDZRyIGj8HsoqvbMTAcVVRFwavGJmVNKlaTYDpSuWLsltC5HNv8hrcPexKpNXp2CTEy7/TkEJJd7QqGsWOWVa3vC9Ndm/eiowoPWYogZzzgygDrpiZQvQeqCQ/LFhlOPB2KvlxusDtUL9Gy9tAV2agg0YEGUexYlxpLOTQDl0/vugiRn2M3To7NjwPh030+qYnd00YzE8M8KctD2nbqRaQxyTx3F2T/Y1/JxbgfqRMLRFdt1+PeiQ+u4bOAfsI/cLZAPgkwQ2eJg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(6506007)(66946007)(478600001)(66476007)(316002)(66556008)(83380400001)(86362001)(8936002)(4326008)(8676002)(52116002)(6486002)(2616005)(5660300002)(6512007)(7416002)(2906002)(1076003)(36756003)(41300700001)(26005)(38350700005)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ezdwYPTVvH+Nwdk3BCDWZ6smqyn4fWuQlxuUJnlSJCFpPBJmKaltpCExm5+L?=
 =?us-ascii?Q?AgrmEVnSBrOeo5jWvD2dyyi3GotWE4gwzxZR9C4mfClLosfk+89EazLmhnr8?=
 =?us-ascii?Q?uqP/flvSmzPXxeblHAYEGPq98ZUGPygzJaDGU7Xy5JGHP0VmrTQl2PpOZn6f?=
 =?us-ascii?Q?fDH8QmMiRDOZHROZXsD4lAjH06mvLZXP4Oc6VzsG9NEo9dz4Q5PqUADfC0Nq?=
 =?us-ascii?Q?kM+cLnbRW/4VHFYAv/SGrW4Ki3psl2qUKGgfEwQNbgD+JoyUezhf5nFRHJle?=
 =?us-ascii?Q?8WshhVUFnqwQQ3JQWQEZZStLWj6oQTIVf306SffaFnsf+tO0ECzoo9DH27Fz?=
 =?us-ascii?Q?DLMHKnkFSAgOn7mKEM3/4fxU6/lokFFfh8wNWhOIn1j9UJVc8u6B+vDfJ5Ni?=
 =?us-ascii?Q?Z4XNvkoVzwkOgsEtV3Q/F95i+B8yEKI2sD9vR+Sbpd+cnI+TDB1wabrcbc8U?=
 =?us-ascii?Q?gkGVhMtB8JOSUMgUDG4l9ZKySXpPN2iCRelob8nvkHi9u+DWFdhdNnSxv1hj?=
 =?us-ascii?Q?ENQFCLSPeOTIUFBUpd7u8RU2X53gK5HbgwIXAVMRnL4PhzhsdDrpzxTIzbmA?=
 =?us-ascii?Q?4OJ2eTUISHQoi/doJTP8gJM1RhcXf5lSNqCzEe29CUNnfWlu9zptGPnVm22z?=
 =?us-ascii?Q?HB1UFChGsz/hPfW8v/EELcmPld29M7tlcZ/mo7J9qYnJhVHaK75p9U1PFw9o?=
 =?us-ascii?Q?k7GT5/KpNrVHnpqT8/dkk/7KGVDgaz0b8fdhS/5ZbzpJQsmgAS1RiA47P4Np?=
 =?us-ascii?Q?u44pRGz1VATLPjNryuHGEgMKUQxOJ/PnOfja2wj4m3qX0OEApKSEMXr+TIeU?=
 =?us-ascii?Q?ZA9pDTFuUSkji4FZatKwZBYZ/O04sSN2n1BcVEORzXLFEIAYLpH+P4Xv/83G?=
 =?us-ascii?Q?sDWIvDHEBVCqrLkdKjs2vjnlmKVuk7gFEcbadZCPXvthKN3uPYC4RMLgBGjU?=
 =?us-ascii?Q?KNu3GdiBeosAZFJ28AXHilWuek9ADVliXDehoYwa72Rp7SesuZHstGyJOJTl?=
 =?us-ascii?Q?5IIIlo34nJcgeUXVCpaZ0LgWqBDHq2d9TTHbsgiz4DXcxUJKcub4g51NGel9?=
 =?us-ascii?Q?IKZlG/saiG+4D1/qPsuSZY04zw4Fc0Tgth9eL40zxlRK2NrbZhyXHhjpxOp2?=
 =?us-ascii?Q?OOonz8XQdvcTT9r0u/PqBTI4a0K3B8NZrgq1XqzAnVXfAmXv1uO8j6ne1n78?=
 =?us-ascii?Q?W/Qr4v4M4UZpvI1XkpwLxxytrUP3VW7o4wIloa3m7v0Bri2diafF04MQAh7a?=
 =?us-ascii?Q?IQcsX9Jp9TYddT9r6xgThBx+5HP7MYP1J0V2k2+11WIb+ONdT8ntHut6UJVh?=
 =?us-ascii?Q?uwNkjVzuacaGcgBG0J9P8in3aVNqqCYXNvedGbcrquTo0pehz8igA/BNOJ6z?=
 =?us-ascii?Q?XyoZUTtv7f0WFth1j6FZ3vJJsW/7Y7AloCTMzq8QSXCRe/odWSva0jvL2sWI?=
 =?us-ascii?Q?L/v5Zm9GqOEbb9wET+wcEw4++uVqF9tgk3eZl64jwUgOrnGyi0ynUZyFVlkV?=
 =?us-ascii?Q?w1s0uLMbQh3c28ktJZSZZ3A76Nx0NqNtWby9M7Vu+6R1pdPOoYSv7es37bsr?=
 =?us-ascii?Q?tZZQPjxWJSZaZVOOSMmSu5+aMaO2lwsVZQNITyRD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace55456-d168-4667-eb80-08dc135f43c2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 11:11:46.2202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOvq/9pUM5fYD0wsDgR0aFAZDefKF+nNkb2M7PGrHPeOG8PFZOkZfyMk7LztKltGaqWeK30hYhH7jqdwrN/zCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227

Enable 2 USB nodes and add 2 PTN5150 nodes on i.MX8ULP evk board.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - fix format as suggusted by Fabio
 - add PTN5150 nodes
Changes in v3:
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


