Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163D21F3994
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jun 2020 13:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbgFILXz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Jun 2020 07:23:55 -0400
Received: from mail-eopbgr140042.outbound.protection.outlook.com ([40.107.14.42]:11078
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727002AbgFILXv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Jun 2020 07:23:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U475S3149HZoTnD/YRuP4lNMn3+FZLBMtJ3AFTAjycGWOpf0uHnEScs+1Hx2uxqOF73hVSE91zCTcwh5JSUxaqFFtklqOaDlVmJ5+enMpLd7uG0HTV9OEf8CMaxellUKB6nyzhG0uKv7Bp6NE/MJOHi3A8B7aHBc7weCU2POhuIso4O8/8ISvQMpc/DbeHn0727y3F3uwL9Ry/UrGUlORYXfkr5NRVUQ3MXw7wJA9UfnImAxj4xTfCKCdgT4ORko2Na/J44Bi2bgM1g6pWGJVL3Gn8vFBRVTUqdHK6jHCjITezihN10hdBhwjkify3vvIGkRGbpUAKMa6sLewHkjdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur3qjH9e9P3rT8fJg5DFtU/aRKtEyuKrmcab7NQHpa0=;
 b=XHJ4QOp8l0eIqs75TbcqezcDh+Zfu8BJ+S8lFvUzqXaDwSQYQmyUeQ/U1jz/S5t9SRPveO7Os9ku9Fau5NZXyQMk0iPI9L+/999bxtXtTgx1/xyndTyeQrgkLtTeQ2stAnty2h9aYUk3NrJgv7hqyIfTVtqDrJBM53eBjJ1sTYBHbx+B1Tt8T96VSxmfCGvFyCCkkA2VvSESmbDjRXNy771z0EYZJO6LuVn6Kg+shzfK4apWuSJJsIDaOOEz5Xa1GCn1OLu3IT+BeGKG1CPjxK91G+oHQzqiQ1g4bC56y/R4AKoK+8m7CFVxJib2+UtcL9Cg1YzES9X0ZIf1OKYqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur3qjH9e9P3rT8fJg5DFtU/aRKtEyuKrmcab7NQHpa0=;
 b=H0d5X8bOm8d+vmoxxRk/k+UQxu4v9XBcPuDVqYcLSCGMdiwWHc+gje874W066UTaTOqQib/wndzPboLJ26V0+g5N7wPSzzze+lIjVQ95fxjIR6/6vMqQBhXUF+HJHh+NQaRGeomXdKPEvl7Rlq59pRLLZdFyyneQwIl3p3whAr4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Tue, 9 Jun
 2020 11:23:49 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::5086:ae9e:6397:6b03%7]) with mapi id 15.20.3066.023; Tue, 9 Jun 2020
 11:23:49 +0000
From:   Li Jun <jun.li@nxp.com>
To:     balbi@kernel.org, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, peter.chen@nxp.com
Subject: [PATCH 5/6] arm64: dts: imx8mp-evk: enable usb1 as host mode
Date:   Tue,  9 Jun 2020 19:12:44 +0800
Message-Id: <1591701165-12872-6-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
References: <1591701165-12872-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR02CA0069.apcprd02.prod.outlook.com (2603:1096:4:54::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3066.18 via Frontend Transport; Tue, 9 Jun 2020 11:23:45 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cfd6d3e6-bd59-4d81-34f2-08d80c67949e
X-MS-TrafficTypeDiagnostic: VE1PR04MB6528:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6528CF79DAE113C0E2383F0189820@VE1PR04MB6528.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:200;
X-Forefront-PRVS: 042957ACD7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IqaDeP/VzQTghCmgOFsNgLsDldE4hLWr0+rc9aQ1eYeigm5GX7SP4EubHIZ5pHJTbz4fP3EK4l5IXRNt5USP83iBe34x4t+n/OgfpB+YebHCmTsrbBnNXws3cC8Z1hrQiD0KMoZgkFEMAWq2BMOx27cu79FjwAFPrV13zgAX7Ch3fUTD+Avc4ylRwPSK2hYmmyaH+E+SatPVKO9VIU0FAo5v5LrYIKbDjphUqqX/CVd3dpWqDIWfWsxgoAMf7YQdLCBqyczMnNprCj2PIvR6CN7urvcE8EHmq/9wUzAih1NR4F7k2iYJor6i9RaZgHnZUW6IbYZkT1Of/y8DGJGhCTXy61E9C+WOkSfF+ZtbPpVnJaC8lglPsN3s+mttoYQN0WSeurxmQrcL3mOekw4NE2QRzdyk3IEtTiVDNuHqKOvZePJBJJRgIyFOtO+tplkhKZtpBV3Ske430F87bS/bGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(66556008)(16526019)(186003)(66476007)(26005)(66946007)(69590400007)(6512007)(498600001)(6486002)(52116002)(36756003)(8676002)(86362001)(6506007)(2906002)(4326008)(956004)(83380400001)(8936002)(5660300002)(2616005)(32563001)(414714003)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 5/i08jes765fokUNtG90AgfJCVeGRHQjEl/GrXWeJM/ycl3hD1NpNEejkr2mo6LpWxNlh14Jy9FWPxeEuX/KDVMYbQAD1oUJx6VRklmQzb1ZE/yV3tq1cyEsGJWdHV/dep7I95Xz526VFU2UfLuZufIaqd9Px8sA8r5ErKgtApg8Zr4isI5N144fQJOw8lnbFC3TxFF+3nHo7ekuBE0RonNYQZj2f9fG2XH85SEpDfx1eLMCCe5c3o05sFupC22HdWKVzVpQfMpddj+YuVU3Qy3GIFwP0bDSUT+6pnuHRyRDXF9O9KwjmHegByHdcWxHVLNIt0SjW7rJVrYLFamcZvfyPU9N0PoGeIg3mMUD2lQA08AuefJG58PE2qu/BVV22aLW+YNSOWrsOnOy84s9ffTWg2k512200r4PHfoDgdBqOUfvVXS41kgVNMZVrmdQynPR+I0g7EiM1i7DvSqNdaKuempjO+yd3FW6eQ+WW8w=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd6d3e6-bd59-4d81-34f2-08d80c67949e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2020 11:23:48.9674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdIQWzQXUumpu2qFxr66R1Rf5Opy5vKmSYP3IZnnDmI0F8qlnm8XPOcBW//q73Vd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6528
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable usb host port with type-A connector on imx8mp-evk board.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3da1fff..fbe056c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -43,6 +43,19 @@
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_usb1_host_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_host_vbus";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usb1_vbus>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio1 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 };
 
 &fec {
@@ -91,6 +104,19 @@
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
+	dr_mode = "host";
+	status = "okay";
+};
+
 &usdhc2 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
 	assigned-clock-rates = <400000000>;
@@ -172,6 +198,12 @@
 		>;
 	};
 
+	pinctrl_usb1_vbus: usb1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14	0x19
+		>;
+	};
+
 	pinctrl_usdhc2: usdhc2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
-- 
2.7.4

