Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930782E7021
	for <lists+linux-usb@lfdr.de>; Tue, 29 Dec 2020 12:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgL2Lst (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Dec 2020 06:48:49 -0500
Received: from mail-eopbgr70073.outbound.protection.outlook.com ([40.107.7.73]:22087
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726502AbgL2Lss (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Dec 2020 06:48:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsdg4KUPbWpLJQ0YU0OhVlaRBg1kQH7HVtSSzyCu+Qqfxb+W51/ceYSR0SPadm4BSpcPVbsqAAE181cVDu6VvHtrPN1xbzSu+XroaKLrW2SMdGxjDFhQuAMR4Ea6Oe2rGZEXvQibLJzk1aL1ctOnV4XTcVulAI0JoPOUg64AGP/y2gLavUy1gaXp+YijZM8ThG1uK1CSFe1nau7t5IbqBKyzIYcTc8NzUSfushz7LF4h3jBb6UFDgMOTz0PLrVOUx1NpUJEPvKLd3aJMZXJ87mo9/1UcVx+bChEcJ7l52wD2nU8Lk02lMxha2mHA39rPsDUo/J/prd58vF0k53hY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWMyP96KTLLg4ZSJ/mYsX69PIzF2bgURpvD9dte1CQU=;
 b=n/Jm6vq2Z4oLSbTi56dguwI/DrT8yv11EHDho0tVuyDGY16gxbRq16alydbXIWhCcfSsIpf4drwiiaUUqHKRHraKx0p3jzX0hecHVZrQTH74Wsnm8y35jITHrwagchTz9BXR17fmJgFU67WRV6Sqb+uNOpdY1gvjz/QB9jm5c4O/etxDO2gsSztlocrjGtSPEE2NrQlwe7y48ynozN41CRRuOT68owUnY4aDmq4tktnVg7DQmLPDvhTLyXr6ys0zn3aosPsb7THdQzzzDbiLnDeSRzoytzivSlQa8zyObYU/Y2SRvy4Z9n0/zVcW1q2r85gKfaDTsXGPb/icoPqKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWMyP96KTLLg4ZSJ/mYsX69PIzF2bgURpvD9dte1CQU=;
 b=dZNyde7vMmKGRmmUPynScaMIYBWpAh/LhqU24qKk9KwAEWR3LBNSbD4aOw0GxqEEaL0y8MSaG4MOlDN9UTdnIdKHd3fItNskl+TMclT449cgWlFFieo1uj58WPQBIaxX38LYtr9m0bmNuypLXOIxXWb67Crs0ZrkQj8+SYPhUzY=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6653.eurprd04.prod.outlook.com (2603:10a6:803:122::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 11:47:14 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 11:47:14 +0000
From:   Li Jun <jun.li@nxp.com>
To:     gregkh@linuxfoundation.org, shawnguo@kernel.org, robh+dt@kernel.org
Cc:     balbi@kernel.org, krzk@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, l.stach@pengutronix.de, jun.li@nxp.com,
        aisheng.dong@nxp.com, peng.fan@nxp.com, peter.chen@nxp.com
Subject: [PATCH RESEND v5 4/4] arm64: dts: imx8mp-evk: enable usb1 as host mode
Date:   Tue, 29 Dec 2020 19:37:46 +0800
Message-Id: <1609241866-9508-5-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
References: <1609241866-9508-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0173.apcprd06.prod.outlook.com
 (2603:1096:1:1e::27) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0173.apcprd06.prod.outlook.com (2603:1096:1:1e::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 11:47:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4cc6a4e7-ffe5-4c40-3d62-08d8abef7c7a
X-MS-TrafficTypeDiagnostic: VE1PR04MB6653:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6653880E280E474B328D6B5A89D80@VE1PR04MB6653.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PcgzH8JZhW6uKRPd6RCpbw5tR6f5153IiflhGQHN+eMxrV0BP1GYMMSUjQBehx0aqxKkhJGDisYpCelInpxcTlg7VOalMyaC8bO4rI2aSBf/sCj2xG6B1DuwU+oMk1cdqeRw6cAXJihISqPp4fdfAvs1FVRrLX6QpdmCgas/tX99rBitkKnA+TcQHxw5og5VbZ+5bUMD37+YxGYPuIce0jG1g64hh41Zl5z1MSjGJFDNOkyewAMVUEgBK+Tj36Ztq0FBgWnxI7ntsKVwxnfAaXmzEBuCPnMG/6XS1jub856O14ZIpV9T8dB78AytpCw5LTpbWJ9vaCmwncFFvIqy16gaIUFZgMC6dqjJtmxFtSfCDO+CEkPpf9TKiPx9T/Echb8sXUhUJOGRwc8XfcG+Bpf7hwdiKjrpBKv9c3rVO8lLm67yxoHqVikry63VG4wXfSS4asdO90ojUYSnsFgmPI2Mvi6l2GG9jkV/1lFItmwfqLSPemfh8c9uDOBv1m3sjdDpaZisncfwW1Old+w85w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(6506007)(66476007)(4326008)(83380400001)(26005)(8676002)(66946007)(956004)(2616005)(2906002)(69590400010)(5660300002)(66556008)(16526019)(6512007)(498600001)(6666004)(8936002)(7416002)(52116002)(186003)(86362001)(36756003)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rm1L067JCIr/sD23Y/ST9k3/vqxALoexKIVMWOckkcN+0cCkjj+ItcNu/DeZ?=
 =?us-ascii?Q?Y2rwnJpCH8nijMJW0EfXTjYAQseBtY+D+18o7smBB0xQXt+S29GhyaUJRb85?=
 =?us-ascii?Q?yRK8wCAes+F0XuatkTyj04Kb4yRs4FaxCUmU161YC7JywigG0DrUtqNQRLdy?=
 =?us-ascii?Q?jtwm/6llOky6PlAq8s4f8m3hGPCyaAGWfMBf2W3tmtCGJIG/Ilj/bG9PwSOJ?=
 =?us-ascii?Q?cALtj85kcJux5HrhkUf0zdVtb1SjGCT9v3l3H1dzk2miVfGuNTHdJRSksfvO?=
 =?us-ascii?Q?XRInXoA+3mzks484TZ4JFDrXAQ0ldWNRA6S9eaJfgTvVOiW7MP4/gyOhBDEq?=
 =?us-ascii?Q?0vokj8mjaRqwkckHkEF+tU07qOgCjQ7cok2kimem3Y8mtF9vVxJEShQ1q+6i?=
 =?us-ascii?Q?8NExJmLiaaSGSwPhER3PY8ieltPXb7mEjzCpnshhvTvFQUILNTNCkDjdN8oz?=
 =?us-ascii?Q?2vGeHsAMsf2NyyR1+5m+hsQoO8a3ZkmP7vkGEHbnDWogJFhQvWPffagkkHnY?=
 =?us-ascii?Q?ToWwawDBKriCgB939U3e4ckXjpChF4C3AF7Y38gE0lLfVKCxN+SxVPDfy+Hu?=
 =?us-ascii?Q?2omWWOFy2+SSE4t9DwFzJRqm9723Aj5pnjkB/znHLwZtIxgv2dNkNfSulHNp?=
 =?us-ascii?Q?Lg+A1r37SruP3QzpNPfT2zEm5pICBa+7urakT/f17Td6+3VSVl458WaFxyLT?=
 =?us-ascii?Q?ATuR8bhfmup4/vi6hGAaTwqP4M6mkBkH02o+wQiB/+03QALTt+S0x6J13GoY?=
 =?us-ascii?Q?nhdNQOzxje0rnFozKiIWYDsGkrmyInV7cstCOTBklWZDtXzQVTGMflYRyC5L?=
 =?us-ascii?Q?x09yMZGbBhH/qdOK4d7C068lJ2Kqd/3DHh/q1DUQpYiSjNSeYqqvo9cnUgq1?=
 =?us-ascii?Q?FAFpdHCICrEA7IuWOXF0VtVBXHg/0AutjW+g9gkbpZ0o7yPN6uaLwrr6QAy7?=
 =?us-ascii?Q?PtTmFPYPzpgug6VxQQ50B1PmjxA8R4KieJrZcvbs+1YckpeTe2rrKPds+oTG?=
 =?us-ascii?Q?ldfA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 11:47:14.5825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc6a4e7-ffe5-4c40-3d62-08d8abef7c7a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnajqx15cpyQru+TriUa4lH9fDe8GdP37bZGn+bVxx2RxZLD4K6ML3WpyN/tQLG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6653
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable usb host port with type-A connector on imx8mp-evk board.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b10dce8..7db4273 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -127,6 +127,21 @@
 	status = "okay";
 };
 
+&usb3_phy1 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usb1_vbus>;
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usdhc2 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
 	assigned-clock-rates = <400000000>;
@@ -232,6 +247,12 @@
 		>;
 	};
 
+	pinctrl_usb1_vbus: usb1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x19
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
-- 
2.7.4

