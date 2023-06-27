Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0DC473FAE8
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 13:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjF0LSp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 07:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231562AbjF0LS3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 07:18:29 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2048.outbound.protection.outlook.com [40.107.20.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF852950;
        Tue, 27 Jun 2023 04:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/d62S2R1uS2aTJiCAp0sb+Y0vGBxpF0vZuUCV7/qfL2ud8QKruu4r7IbYvsSQDVFP4fCv75c+HhEAy3wWh/4gdJleyoGG1IodVuA21KfkaOQKYuAqzpdNB3r/CCBQHuZb67ZfHxc8emWGA06v+wHQ4Wu/FiVQm3itTruGkPRMIBmFYyBvq3UjLbCkZ5XtCneL7RdOhVy9ABOy/A9Z+P5BWrt/XxaApdpec6yaZdKwSbueeARJVeNjFyV9uP4iL9xG965sczr8yCJityLIByCpLZX3WP5/wvSly22PioHBhMZRymIlhQBMAKapywH0n6pO9RBtfB0em2GJ5md1lAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxGd8OUN+ZqgX6qyvp+GP1PUjDByFVShYObY321Krnw=;
 b=Ul7pyWa7M2+6v5C6O1LdJtUxWcHEZjTTTtoEVfZ0Oq/Iffpgfxcq0RD4X3dlKrtWQgbBpZG9WidqoS6KlnVx02dQScGjQdtF6BCY5/mRdmj5JuFecBGygbxwIhaeLQHIK5Yw+gnoZu8F0s5nmrXpOpDYuZiWEGL4o5BlLA5W7Yy0OBMM/BF3/5Z6w6K7PVnWzhLVoyNYhyzxtRNI/FbK3SHQmvm15fiNaJHycPWOxlQvwj9shOFxG+G/6ekGHdZ2b+X9ENCQT5PNXX2G1rDUz9VAKGWzMC20IVJKbRspg4rPy1Vo8AkZPbEv8YwlT7UjAcG19S2c3lOckVA4wP2/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxGd8OUN+ZqgX6qyvp+GP1PUjDByFVShYObY321Krnw=;
 b=oZ96VNeFk/Pw0kI/Zyzre/pPmhqKkvdn7SXPR2bRS8KLiLBryGLZgatEzzm7d4lk1x4j8kbaoOlcHEm8oxxgdoU0UbJyvnBdjbxJMAqtV/sDljwv2ozI+U+189KP16C2fU0VEG1iH/a82BZLBTTb5zKu2EbDfn1LPUwvXjHfh5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.26; Tue, 27 Jun 2023 11:18:22 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::f9b0:8c34:e57:92a4%7]) with mapi id 15.20.6521.024; Tue, 27 Jun 2023
 11:18:22 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     peter.chen@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-imx@nxp.com, peng.fan@nxp.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, jun.li@nxp.com, xu.yang_2@nxp.com
Subject: [PATCH v2 1/3] usb: chipidea: imx: improve logic if samsung,picophy-* parameter is 0
Date:   Tue, 27 Jun 2023 19:21:24 +0800
Message-Id: <20230627112126.1882666-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To DB7PR04MB4505.eurprd04.prod.outlook.com
 (2603:10a6:5:39::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4505:EE_|DB9PR04MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a5f38f-8505-4eaf-fac1-08db77003781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Ee0g56X3GPJJjN8ifdMfyn+B2vc6t51x1jeiO0SVWVGyix3exhqdgUmhOEdNOE9eBjAUBaebd7HsVzV8wu/lo/OZwccVI+UtrGI6TkZ2cU/Vr1rIxwf0WU3FZEAS0XbL9AP3nOTuTEjM2RRjShbcAojVHKOL5AzPgP566BWoT8V4c/2vcUqomgRm/yLnLE9cDKxvJBibBezAFHnH+fVbEGVUxUemT4Krc9O0lI7COsOtYj7hTtjQzyW3ZDMzAHoau+ClW+ZGa3Y6OQUh6xRnpGEi4B747XlyBF9ZErKrQmcMtCQsqXViEkxCRHrjtcaz448LClYHfSkUCYurZj+W3JLTmwFBvU4vVFttFnqRFhoTVLk34WvEhe+uHLP10gs6SMpGO2ZbYI1HqnPIcLM2/eLrh7yPgBN/kv89/EQa/FRBWBHYWxx6EEWNQuEBNUusO4wWyODlkalaxrmDMwTuUnOVTH5NnDBIq8PmrvQOa/sOJU44gsONVRKoaOJxhdacJcd3IPLuQ+dD3Kl7hH46BSk8z/p0iyRWHTESzilv0ZPQbfbNORZHXkpsTUY16bNBNQxz3PRNTIWLVJ2LsbXTuqM8E7bX850g4EgmMi7jD1lpiJEKEURxqRPI+EJURgY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(2906002)(186003)(38350700002)(52116002)(6486002)(38100700002)(2616005)(83380400001)(6506007)(6512007)(26005)(1076003)(41300700001)(86362001)(316002)(478600001)(36756003)(66556008)(4326008)(66946007)(66476007)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X2/jTHs675XU0rVULdVSUCkW78rvx4Vpy7VJJp1Nlq4Krna/23hxxqdNFaW5?=
 =?us-ascii?Q?KYiJjJ7zT4NtuLZ5xe9xFN4XnVJhmSo5KUbryqgt7cuFColnzZs+1sXhZcqV?=
 =?us-ascii?Q?HGciN70F4msdLPOLE2ewu1dJETUOW6bGL547YvcQDrEmkVrRnC42/Zkz35yg?=
 =?us-ascii?Q?igW8qNT7j3Oj9JXUmGj8RDO0XjFxfB+soRB6LtdID1F0bzZyE0gRcng7AfBH?=
 =?us-ascii?Q?ZnyMxeZzaxryauqIa1Ydj6WY1yT54yRk52QDKdgpKVIFesugUXi1TT1eOTB2?=
 =?us-ascii?Q?EAARc2ohAnskmA0MURqOs3Qa+A7DOW/lI+3qAkCUEnU+iYtDgzgJ/U8I+zor?=
 =?us-ascii?Q?p31O4X9iKCO287jj8CtXX095Ut8vQ/2juDyCqYCdNTQwXWe7dvq3sZ2p0cwI?=
 =?us-ascii?Q?fumH0fWNkX7R/bvOI3fb1A91wxvpYDH+U2XtTVgOaqxEEvrNh8MF3gaZHQBQ?=
 =?us-ascii?Q?WPopVlUtLuS2uRIWON3MtKdmysFjqJHBEMUGOFw5JkQ+GQF4mKTk5CzIAmon?=
 =?us-ascii?Q?9ocS0zZ6+BberDIS3A/ifMwrJOu7pLHhzNyu+lyNyc/neA5lTg3kgjmOLuQ2?=
 =?us-ascii?Q?l60MKopGgjnw3rLivJEI5GSq3PGQwv9h8PNMa4t1l2F+VBCeioRd+yoC8zy7?=
 =?us-ascii?Q?yYIWBfcGQ/zZP0f+kKrjHdwTG+FX5D9krWj9MN2hq1b/fwWg7qN17UhtVvz6?=
 =?us-ascii?Q?L5Jqh9YOHXTUF82UsGQ9R3omc2skV5Kk8dkZUEqStwuOV9bmvRks+XkqVD/s?=
 =?us-ascii?Q?1XbHInIqI5NGdTPVok7fmWzthuq/h4pYwV5tLjpb2HXy6v6z3LE33i4j4b8U?=
 =?us-ascii?Q?ZtTwwRuCy4m83b1ACuYj1Pa6qfuUcDPmxMhxj0ljO5TAQMyf4tEiuxCBXX9F?=
 =?us-ascii?Q?ZlNr7dJ0zTht+nwPMQqgsGNJmONUXddCTFmqcaAcIf3RC+tFXk1Lv33AbwAc?=
 =?us-ascii?Q?K4pBUMpnMoxzC5JMpqhRAmYEcDFj7wT1m37M0MmknmmhP/GqdjZJruHhR5+a?=
 =?us-ascii?Q?FMPTs/io3K3HMF5JX4fzalrS+7MY1Dps3eruVvBJbq8wAoyF1fUPvZOWHhIL?=
 =?us-ascii?Q?7O70DF8Q0pd4Ydn6OWrhaZjfsuJG3iLpNJLe7VPF3GJblC67J3HmmLQwjvMW?=
 =?us-ascii?Q?3fd7msYPkuwLiJIK+VfBiATQRHwHm58rB1cFj06s6t/9BKjWQAvkhvmBauUx?=
 =?us-ascii?Q?IPre4lUIbLPN0EHYTgFVQ5m4/dp79LqWJbIrMtBRi9cqviHN4iL3501N9uCE?=
 =?us-ascii?Q?AcsYutC8LgdZItpY3uv0wiWyFYAXEV3gseB8YLL7PbxB8pfMTBixqxhnUMbC?=
 =?us-ascii?Q?LRhuO6vlTPv32T5MScMBpndAlq+CnWIOb32qu97C3D0EO5bNpzq17aBvBqv6?=
 =?us-ascii?Q?x/Sncv10MODhfKzMbKph7lc6st+e4GkueJr8P/sWT0DXIbBHyOifp3WnYPSv?=
 =?us-ascii?Q?kafECf9ZVYajJMRYBrh70TJdV338iTe6xqhXXUVKP4gDghYzMpX1kVG+5F1T?=
 =?us-ascii?Q?AdfHQDqSsf1tMRg2yzlYlmEuRH+pOoZoWNoeEWDmqJJi2cpVgkxOZLh1gBnt?=
 =?us-ascii?Q?+GzhAMbs1zZJvXzx8kPaAXw3lhkIotLzcZr7j7w/?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a5f38f-8505-4eaf-fac1-08db77003781
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2023 11:18:22.0614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ks64lWdk3XdDMUt7SotVZUIEs3cd4zAOCoz1R3rhYsJ8xwO0S8KavHHcQRzrCvkhH4Vd4ndDkKj961Qb8BKe9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

In current driver, the value of tuning parameter will not take effect
if samsung,picophy-* is assigned as 0. Because 0 is also a valid value
acccording to the description of USB_PHY_CFG1 register, this will improve
the logic to let it work.

Fixes: 58a3cefb3840 ("usb: chipidea: imx: add two samsung picophy parameters tuning implementation")
cc: <stable@vger.kernel.org>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - no change
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 10 ++++++----
 drivers/usb/chipidea/usbmisc_imx.c |  6 ++++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 336ef6dd8e7d..873539f9a2c0 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -175,10 +175,12 @@ static struct imx_usbmisc_data *usbmisc_get_init_data(struct device *dev)
 	if (of_usb_get_phy_mode(np) == USBPHY_INTERFACE_MODE_ULPI)
 		data->ulpi = 1;
 
-	of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
-			&data->emp_curr_control);
-	of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
-			&data->dc_vol_level_adjust);
+	if (of_property_read_u32(np, "samsung,picophy-pre-emp-curr-control",
+			&data->emp_curr_control))
+		data->emp_curr_control = -1;
+	if (of_property_read_u32(np, "samsung,picophy-dc-vol-level-adjust",
+			&data->dc_vol_level_adjust))
+		data->dc_vol_level_adjust = -1;
 
 	return data;
 }
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 9ee9621e2ccc..1c7932f22218 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -659,13 +659,15 @@ static int usbmisc_imx7d_init(struct imx_usbmisc_data *data)
 			usbmisc->base + MX7D_USBNC_USB_CTRL2);
 		/* PHY tuning for signal quality */
 		reg = readl(usbmisc->base + MX7D_USB_OTG_PHY_CFG1);
-		if (data->emp_curr_control && data->emp_curr_control <=
+		if (data->emp_curr_control >= 0 &&
+			data->emp_curr_control <=
 			(TXPREEMPAMPTUNE0_MASK >> TXPREEMPAMPTUNE0_BIT)) {
 			reg &= ~TXPREEMPAMPTUNE0_MASK;
 			reg |= (data->emp_curr_control << TXPREEMPAMPTUNE0_BIT);
 		}
 
-		if (data->dc_vol_level_adjust && data->dc_vol_level_adjust <=
+		if (data->dc_vol_level_adjust >= 0 &&
+			data->dc_vol_level_adjust <=
 			(TXVREFTUNE0_MASK >> TXVREFTUNE0_BIT)) {
 			reg &= ~TXVREFTUNE0_MASK;
 			reg |= (data->dc_vol_level_adjust << TXVREFTUNE0_BIT);
-- 
2.34.1

