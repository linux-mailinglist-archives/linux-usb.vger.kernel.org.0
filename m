Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9DC273FAEB
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 13:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjF0LSs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 07:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbjF0LSe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 07:18:34 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2041.outbound.protection.outlook.com [40.107.6.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 659A1213A;
        Tue, 27 Jun 2023 04:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAy1ogB4jwLzPWmXcXaMjbcVnoFFm7C8d/VV2D5Yn4RJXSetDmeopwG0Faq7fBJB4oMFv3doyh7VbNRUV27Ap6O0JwMmydXlaA+9Krcd+O3w6dA7DOn3MAv2div+q1YXWj0C+g5UUNMv0PfVumNLzoCD1PH8jRh+w41ig+l1h/N1DDBW92s0IbTi7rQzorIzuQ9x4EOg/Bjd8ULGhtc9YASFgWp+J9MLWzqA92rl37zqF3QoTMrx6BY9IA6FNxeldhdhc0ucz4PIEKoqDA6asNgrt9WGv6DceSTR2J8AXxFu9hrLRYsuZ7qxX0EWr8ITxqyQ3bOiV0nVJZUMAm87Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzS6psld5n3EiJMp/1gGHKnyCAQJ+jvDECKGVPsUSf8=;
 b=mG58UhyVPu9JMjE8AftfHnkZgd+h/svS07KscDyqxEOc6BesLDhyGK1YLMBhsYitFMH8911v4Cz/CvnzmguZzLkjVnMGEi0MW27+FyC5r3Ac6Wtl0kpexEzzQk7P4PPQppbrRF440JjKbWLAz/WDpLi9cBo8pBs0NPTTPFF+rJHC3TWviBBQJYp814VXCGItJYPixfnXogJG/4KMO9cOPvVMFjg5kj2LWXzJVengXH1hhgzWEtLk6vdge62TiK2L7oNw1KYb7yiM3lY+Cn3fUWj/Xf4vT3iwqYRGDwuod7oFnje6QRmKDc4CZ4nU6nxS7VmtoQjxgIGRff6ASFRwMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzS6psld5n3EiJMp/1gGHKnyCAQJ+jvDECKGVPsUSf8=;
 b=ZpZUX3M/ZSzPRK9tglwAPV11eaFW7jY6LiPYKyp5H4jLLlsKRXKU7WXkFrV6xt4jHbFfSoiE030YKrd1mel5zm9pTSBwibhpiz6GGHJQW1MbE0JI7gvmwsWy6kxFRn2fBNAeaXkc0Vrlid8HnF1NMoliugeokskdhYG5MmCr+NA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 VI1PR04MB10026.eurprd04.prod.outlook.com (2603:10a6:800:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Tue, 27 Jun
 2023 11:18:30 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 11:18:30 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 3/3] usb: chipidea: imx: add one fsl picophy parameter tuning implementation
Date:   Tue, 27 Jun 2023 19:21:26 +0800
Message-Id: <20230627112126.1882666-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230627112126.1882666-1-xu.yang_2@nxp.com>
References: <20230627112126.1882666-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|VI1PR04MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: ecaafbaa-7c07-45bd-bd75-08db77003c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W2WhXfutDi8igfGaiB0HPg6nfhRxdMZhXnWBaZl6Fh1Bc+GnTRSb5xvE5P8StYLm+jWzTnAx0XD8Xh8mRweVGx3a8ipJPaeuGhgw6qAN2a6DbdeNKj6Shye0WviJj5AlUpEtmmcjwqDWEM8w6A64OHN1qWaXBFXry0U8Glzs8fiWFUHLZ0R64grvO3WAQICTenbdbXf0SZT21z5dkDoytjSDFq2/LYg2m3iInqQfLsIlUm2jux2mgodRgGKf0y831oQ4qIgNNmK8gLGLYA7eZMBixyumrbbbX1dGf3EvGFboCxHUA8FotLepsQPZSDJqkhu7fID1PReqKDl3n2zYPcM9xjmGlGboe8pnsi1HOu5QaxPfrCoM9xBKv8+HwjRn1g10REXwOaRcKvFHNUGZyzDt0A3S6BBwVmuiMHVauC7RDyKlQ4nyApNPAjfG3YtrqyKnjV8LNV5xHBQycHyX+iW1hhe4KYZjVfIz4Uzy/y42UxgcGij3BubREO6hAUw1w2Vaj2b0ttrnHx5k/csRZBQ4U+DnHDD94F8Bg40bXGL8uq4mWi8r7dJC44LVxx5r/6AWMZKcHxgYP8lF/mZQoYMKf/cJIP2EjoLM6w0A2hWGzTD2sIvU5f5LE9/tmfVi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(451199021)(66556008)(66476007)(6506007)(478600001)(52116002)(6666004)(6486002)(2616005)(6512007)(26005)(186003)(1076003)(2906002)(5660300002)(316002)(66946007)(36756003)(8676002)(38100700002)(8936002)(41300700001)(86362001)(4326008)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BhYoQb4ku4nk7FqMh5h55QuBeKTWDkYgQzW3TX5yV7sAK+EOEYIxBMN4CS8D?=
 =?us-ascii?Q?HkWDTd7e3IGJLyrjRWnIBICeViB9BoTMNRK/ZbLycKNLwKCR4/PYS+JAyMrS?=
 =?us-ascii?Q?Xto0PxYpArQv9U2P23BaemaALRg0lbkXB6N22qkqlZ5kUgZmWrVtoRUisTv8?=
 =?us-ascii?Q?Vvjv4nQsL5edbZ5rpJgW3whmwBd+PJOeNKaa+tdywoTRhyfwxL8+oE2o4dGa?=
 =?us-ascii?Q?IbtggX3RT2Rm9Q43whTkFz+n51zfz5CSI3LldhrLkneEOujJBQ+Tg9CZIrk1?=
 =?us-ascii?Q?otkivsWlbQeda+/XzWwVFR6/NviP7Z1rLb7e6cNikJHAAg+D/DRebpekSs6e?=
 =?us-ascii?Q?gRGLfK+0YThrR9EUdwWckCi/l2Dah3XgN2TFXZ01/S4vKx/igEFuBel2dpNS?=
 =?us-ascii?Q?/YZS54HlbfFZ/NILGVDr5Cj+T3gxngD438/snR+KGQcoI564cwhH6IC4C291?=
 =?us-ascii?Q?jBdC+wesIdWcQmw0kChkXrNb7IHs/7KyC3UMLybSSia5OhCSq5s/bk6prVgM?=
 =?us-ascii?Q?VoY3f3xcnO7FwQvjyKlIqaf4hzTuIGnb70/WpC5QS0uFKko5UWB+w1g2pwq0?=
 =?us-ascii?Q?I+5G8PtvrrjGp0iBYHgggtNrTcPnxPwAr413V5CyCHapemUZePl2olXJebs0?=
 =?us-ascii?Q?zwoxgQjCsdXVqRfWKWLhR06fpndeIX1BhbokUv7voD1cqKqvosq24PUT/W13?=
 =?us-ascii?Q?mf/oG6+yXmb5sc4w3kVR72cBYE1tPeFPDZ/XWQrG751ty2fHbF80rm81GjnH?=
 =?us-ascii?Q?NT798VoASFl0BXTdaadE4c1pjcN6wLltW96DS8wLgmQ/Zo6KMtTbjk4dSaXA?=
 =?us-ascii?Q?/O/6SoadNUQ5m6Xzi4IBfVRFKGMG8zkqek1GaM6snBMTtuU2D+1Rq0RJoSZu?=
 =?us-ascii?Q?LL8wrcytcIpdPV3/X6iG3Llr+NaTPpR45TrGwxyVqkho1e4TB2oGB3ouGxBp?=
 =?us-ascii?Q?eGCumUy2ejxDijflxS+B3VVGVnaqco7Dheq0pvOr+P+4T9cR+bRPnQiLMXey?=
 =?us-ascii?Q?qjWR3CAUI/Lf6WmeQanf9urkPt1VkjPjnqp+XsxC364x6LnyO/FSceLDePYA?=
 =?us-ascii?Q?u1eMULxWs+5R6YJVs/oF0kxVOHqpDjLelF5YegQhpvKS7ETdGeG5UXS1mqrw?=
 =?us-ascii?Q?+UXxup8Y/m1Se51LDZRbU+K9vebIjwoojNq+xaYEWRYLCCeq5+cbDduNobQQ?=
 =?us-ascii?Q?DvO9O5N0tFXcfUr3AJM0grdS6ThMH566k3xKgV3t9uwB5onWlzr9mqkkidce?=
 =?us-ascii?Q?ZmMLKSHQpchzZw+c4tHlhB5DfigeOb75nhZr04RI9BpEUrDbfbS+xHWV9m8q?=
 =?us-ascii?Q?r+/r2L4r/7sbxraAlVXHQD1PXZ4nN13RpWohroQjvfrPQ1ytSqfBhY7xCPdQ?=
 =?us-ascii?Q?zJI+96PoyzO0R2ynLu0n0W68BatVkpPhT2H6Tbw4dqHZ4gfYHnW1KEdJ6In7?=
 =?us-ascii?Q?t6AVpcpeSvMXhkpQVKelCgDF/pznEcKG6JOapqfTHGRIvYcIJWGQ3CeKNFnO?=
 =?us-ascii?Q?cmE/sz/2s/oNIjqMSpft1j7av5I0/reYRpe0vsQRHGNm0bC75HxGcbXpSzlB?=
 =?us-ascii?Q?n/g32yqusdPSbviLWxvqr+lqHhXq0Di9rLhXfapE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecaafbaa-7c07-45bd-bd75-08db77003c6c
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 11:18:30.3322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVJ7Gc5z8oDY0SRLvlQGRNn4K4gIwo0Je4yl8r6/aNmpcJLoUXbvJjDJ3sTqtHhWlN6ac0FdnHtiupX856kg0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10026
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
Changes in v2:
 - rename parameter name
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 3 +++
 drivers/usb/chipidea/ci_hdrc_imx.h | 1 +
 drivers/usb/chipidea/usbmisc_imx.c | 9 +++++++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 873539f9a2c0..159509c5fe58 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -181,6 +181,9 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
 			&data->dc_vol_level_adjust))
 		data->dc_vol_level_adjust = -1;
+	if (of_property_read_u32(np, "fsl,picophy-rise-fall-time-adjust",
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

