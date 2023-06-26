Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC5D73DB66
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jun 2023 11:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjFZJ2U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Jun 2023 05:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjFZJ1e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 26 Jun 2023 05:27:34 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2044.outbound.protection.outlook.com [40.107.104.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326DD1BDF;
        Mon, 26 Jun 2023 02:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxVWzZ6STpciekRf9zeu+LA+VCMAqy0uLD1RS7RsBcqzNSECGrqC44ODr0ckuZZwOjdUyq9eQEDYsSUK3jYVzVNWxkLxw3yrWpTP8t86dnSvqsHzbRJAOtCZFqUJQYG9vgAe1YsuzirjtiPBCYYKes33nF/Nca1ZmGXCZvTCUAaIbO7vC+WGrxtwUz3xC7hcuR3WYXPI1TFb/181y+4l2fS6dY2NVnhoVQ+3daPAyY6+B8QNCuMpP3Hei3OOHKVZ+h5htaSW4i3DpuHtEkLYaOyXSBzaK78MDpKb7qeS3G669XIu+yhC1MDO23F1xpdQHwecp2y4za+1nBHrINBpgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWfa+FnS5Ot71PQgqfhzfr5ZR2DfDbGFBV67ZZ34WKU=;
 b=b1Bv++eOXa85MbtFK/Ci+ofKPhrhEJwHQOGFoDv0HnM6lLIL9sMbHy46F/y0k6T36eorJ+MwOZqoXxpQ5VVcDcwPh+kaYwe0Q7P3TPNcn4veGo9kHq/75K6SSq41DB9lr5P5ipzVRPCGjhykogmdGxGYqZIPZw3NgGZz00HiLwhaj/mX7lfnDsqaUnopUsGUNRr0vQCWqLalZSQN2A5C/jvfzYwF1VhTVbHRxaOJqry6i3XPk5VVwxTpa4EbN2Bp7j93Qh+ZMaglNNqEhd3FtfYxTcVyiDrAWBczBl/mIe3/4CKBOqWTdTLLT+0Scu+A4XGbtapoK7Jvm3brMTXmZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWfa+FnS5Ot71PQgqfhzfr5ZR2DfDbGFBV67ZZ34WKU=;
 b=EhSPccRKDMsGXMiQxtlD8d1SBCAZJNtIPw4+QIWpipH1XYWTQ1g+tJ8xE/6mDutUsqWWtiPZfYvMeohmmIGyT4WSefg6avdiqWEsGDwn7GosTQfjpw+Nyi40EUCjZdrnPVe5lcKO70EwEtDjeqSJF70V2L8LvZ3Yv1f9HnrBxN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AM0PR04MB7156.eurprd04.prod.outlook.com (2603:10a6:208:19b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 09:26:33 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 09:26:33 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH 3/3] usb: chipidea: imx: add one samsung picophy parameter tuning implementation
Date:   Mon, 26 Jun 2023 17:29:52 +0800
Message-Id: <20230626092952.1115834-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230626092952.1115834-1-xu.yang_2@nxp.com>
References: <20230626092952.1115834-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|AM0PR04MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: ce1a8cc5-e9a1-433b-ba24-08db76276e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvI4Ddm1lq2Y1E2ME98J3OOhSEB/5OOJgb9tHmHORJi3OZWY1MO6GRUeO2rwJjsQOWYhmFPjzTo7NNeHjLgKnfUxH4p6IHO7Q9m3I+hHpAVninb290lBKtt5X0bNKgf1Ape5J6NGojBcqW6GDpasmnyjmgL58uDH0nYaFOYsNVJAJOzYvGBXXrpSJJ5FiU4fBG/XHiupgPBJPNc93KV02WEsRYQH/s9yuGUOdxORhBLKDaWWiZfI4VrYqrDkt9b28VjCB7i8pfPTPelpC1HWXAItJtz2jfAojbgUEd+45o1CX22lN7eBkMUSffQTWIZW4anScMqs/BrEUHAYDBcWchQb45EVrc3FpGlawiR1zHoGvUbZBdJz2m1qUBc5D9lfU23NapwpOyRJPdxdAmUFe8t5T64h/BiZ5q5uydOfAqpyQCw2yJb6ONI8KESTzIY4xrqmHeu67Ez1qxYCymZnUP07KD1Z1TKAUXCEfwBY0YqBay4aZVuGamd8u9+zPoIpKu/erBlMjIdgI9pPsR220AEezpPTvW1ZP17Acz3H8y5lEDF7HZllQiBeWEDi/RZydIXpmekvB19CevZb0PwpBJMCRl6V0ggNYvftQTs5kJwQ9MbnL1H/pxfxkgUB6+IH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(478600001)(6666004)(6486002)(52116002)(2616005)(26005)(186003)(1076003)(6506007)(2906002)(5660300002)(36756003)(38350700002)(38100700002)(4326008)(66946007)(316002)(66556008)(8936002)(8676002)(41300700001)(86362001)(66476007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X8TmJZnFt1f7QQKRpVDIPYcXAu0g4jb+UDB+yEVvw9yKZ0WTi3mzlWWHdp+3?=
 =?us-ascii?Q?VsoPjghtmG3sc2n74fbZgf1LzV7bj+9QMB3dzjHtpc+I8qRcXjnxkZcn7V89?=
 =?us-ascii?Q?lwqrKNckeXVNK4Fe3MZNra+OG65/8sfbeUg/VT5cyd7z4UBDFCzIJM5DECOo?=
 =?us-ascii?Q?iH3L2+hW3zpodboi9JZ0vVxKPFpw+bHqnN9EiqaTZpF4J9pJff6JC7jkGQXr?=
 =?us-ascii?Q?mlmm2NyKEKci1k0vvRMaRezs1bBts61z9D8wcGUBCg3v42zy/ZcA7hnJMlcc?=
 =?us-ascii?Q?WKrCwpOCuXTC0sEo+cOshfvveX16NbwcQ0kwi1P47OYIilHWDqwPjQX3KJsT?=
 =?us-ascii?Q?DKh0HkyhqCNfC7ed2NaYvyo1+vqg2dvWCZjMnYaYW4rTnvLOJW1Q1eja1SxB?=
 =?us-ascii?Q?etP+PiBKRUrgYAM2mPSPqBlDU7jVTIYaiAViTA8cawHjFHlhXB+34P9A253b?=
 =?us-ascii?Q?vXBZZfv3anChHX0iWSeJ6ZX4CUDbAp+qC74VMkkHCWBme2EZ9XEDOj7Q4v2Q?=
 =?us-ascii?Q?Qdy2HUyFKpTyPtA19d+r1vfgVmz5rOhaW5OHwmXbMR1fy4e/BLdBev1jfe74?=
 =?us-ascii?Q?CwGmctGEYnCiPu3TQyG8DKfwbLsnD0JXP+7nUXyHlsPx2PBS3rpocMqp55bD?=
 =?us-ascii?Q?HvtnYtQoY/9oElfTAFibqlHU+Ld2TNfDJBrT6FEaebyrOlyxqq+FTg9OoLq+?=
 =?us-ascii?Q?LoP9nNqhhi915stjD52zfuSjnCFSE2pQxKFwXvPKmAC7G/YFIBeIa3AEkP8f?=
 =?us-ascii?Q?bt06IB8LptdyqmZre4HlxbvN3tYpB5PXCPZ0PBhQBuaQh3fvmT4ZrEYXc+MR?=
 =?us-ascii?Q?8NhJXjhCF5iR0Upy7uMSdnVabFFx1uY/6J9PMrLUGbkCxcAhzHiOS37/gdS3?=
 =?us-ascii?Q?WfdYdhZmdgGLNgR1y+0hdQgLCn7ft4nBX+tcgqAw1g5K61eA/muv0Uj0hbhT?=
 =?us-ascii?Q?JdiRSUEeCuladUI++vxf5XGj+RioFucn4L7d7aQAjxjmQV+lHusgbkYdWxgE?=
 =?us-ascii?Q?Nae4u5mJQFROA7yB0g7ZH9GStIDxEDJ79qGdKoen/6FmlUzrIumeNAE8CZ1X?=
 =?us-ascii?Q?6L+2zc3YTlHXferQSsUaMsWQkE2mRl4vX+O3RwHz95vpFzo/5j4JrvY4kGAS?=
 =?us-ascii?Q?yERWs5ndt3R9FGbIoEQb7uKIdAmhEctUZhdwSB1NbCHgp8OyGZUQpc/cSRoK?=
 =?us-ascii?Q?zmPZ6cfsHfMvCaoEn3lnin5z+Jdrbp7cEWQgIc87Bj4EAJam59koXfpyAT9k?=
 =?us-ascii?Q?GtZFxjYMjreI4Co6g0zpXOiWwGyQtfeZ1ev95SBpU0VweP/s0T6sjHIGcx8t?=
 =?us-ascii?Q?0FGUblsmU3Z8k5yA/6Azn/VqUxUvYYJQRenG6kdiTTUsX2casVapA2uwyPTy?=
 =?us-ascii?Q?Wp7WyAjWKQMxwwya3TJB0QQYNh/pNoO/bncX7lCWrqcmknIFO8cJUAiPrcqV?=
 =?us-ascii?Q?09nzn7FeqgIkbfSclEqCx/O4DrSbJH2+YGb3WnagGa2DSC1fmbEIWej11+CK?=
 =?us-ascii?Q?M6RKV/J0R5TzoAejP39LJv6XqZWGfsn9CqgUwJBnSZUDpnfJx4Mcteoa2Gu7?=
 =?us-ascii?Q?sqghKSKgX/JvevL98WxG9lZOGVJx/tJ0RDbVU4Bh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce1a8cc5-e9a1-433b-ba24-08db76276e3f
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 09:26:33.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdVQdpiaJ9OoeDzeCeO4PGYDD3v72cUF8EDyOUJkdipajRQkKH0gFF+MgeBOCqTt7kQqgQlvXURi/xKkJPXfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7156
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In some cases, the user may need to tune the rise/fall time of the
high-speed transmitter waveform for USB Certification. This will add
a parameter for this purpose. The value will be fetched from dtb and
finally written to the register.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
 drivers/usb/chipidea/ci_hdrc_imx.h | 1 +
 drivers/usb/chipidea/usbmisc_imx.c | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 873539f9a2c0..140fbb8dc320 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -181,6 +181,9 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
 			&data->dc_vol_level_adjust))
 		data->dc_vol_level_adjust = -1;
+	if (of_property_read_u32(np, "samsung,picophy-rise-fall-time-adjust",
+			&data->rise_fall_time_adjust))
+		data->rise_fall_time_adjust = -1;
 
 	return data;
 }
diff --git a/drivers/usb/chipidea/ci_hdrc_imx.h b/drivers/usb/chipidea/ci_hdrc_imx.h
index 7135b9a5d913..88b8da79d518 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.h
+++ b/drivers/usb/chipidea/ci_hdrc_imx.h
@@ -28,6 +28,7 @@ struct imx_usbmisc_data {
 	enum usb_dr_mode available_role; /* runtime usb dr mode */
 	int emp_curr_control;
 	int dc_vol_level_adjust;
+	int rise_fall_time_adjust;
 };
 
 int imx_usbmisc_init(struct imx_usbmisc_data *data);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 1c7932f22218..56570100ffb8 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -130,6 +130,8 @@
 #define MX7D_USB_OTG_PHY_CFG1		0x30
 #define TXPREEMPAMPTUNE0_BIT		28
 #define TXPREEMPAMPTUNE0_MASK		(3 << 28)
+#define TXRISETUNE0_BIT			24
+#define TXRISETUNE0_MASK		(3 << 24)
 #define TXVREFTUNE0_BIT			20
 #define TXVREFTUNE0_MASK		(0xf << 20)
 
@@ -673,6 +675,13 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 			reg |= (data->dc_vol_level_adjust << TXVREFTUNE0_BIT);
 		}
 
+		if (data->rise_fall_time_adjust >= 0 &&
+			data->rise_fall_time_adjust <=
+			(TXRISETUNE0_MASK >> TXRISETUNE0_BIT)) {
+			reg &= ~TXRISETUNE0_MASK;
+			reg |= (data->rise_fall_time_adjust << TXRISETUNE0_BIT);
+		}
+
 		writel(reg, usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
 	}
 
-- 
2.34.1

