Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3152859E660
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 17:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238349AbiHWPvG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 11:51:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239108AbiHWPuR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 11:50:17 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BD72BCEF5;
        Tue, 23 Aug 2022 04:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmH8kJnR82a7rg3F31sJDu1HJz7j4Q9d8QDvHdiuo60ejiKWkCjYbHtj/ZawvOE5iaLulxGyvJKS/JWVdSjJHVFkhkEWb5rPjKgR7Ce8SkyalEygtphirv6eASU/h6iFyUuF5KbOVVfaC6f9tnfv1jM7cM0OTwsn8z8JhO0KzoO8E+TAtTIksaX2PqSNPrwBUL3DKkhUl5rTaC6qdzD+nUN8Czjv6UNO8/vKDWflB8MekQGZ/1PDYFAAXMPx2ZRhQji5QyXo4XjaBpLyyiZLBhy2Z2HOrMaGZx7qeoOhKLRjkHM74dbSqTsTLeRFfd29KoSt3OaMoPNMAZbxAsXycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8g3FiEBF4Yiwk+v1X73ICBHVpDpOvYiPln0ZfGYDplk=;
 b=OSGTZKv8EV8DmQJqCecpSOIb0AaLHqLFXWG+b3MDu+Qbw52cHK+uEE8tfA4ZHcDSnzyXHnkIJfqRrb8S7ISn8D3t4VSGx+VLLiGEbjPs8buPFGzEhy5b2QF++TIlK3NAlJ0pIRsxVDfrsXhOqd/LNkyC529Z2BgZdZ2kLtNEpUvSfZyjfT77GmU01pOTTFBlNyzoIsMs0Q0T30d7v/p7N7rywaTjLh4pHC04t5uzmv3p1qqeqOu3LC/liAuK7WZSk3XwzgtkTz0MXMpHMGy50Bsp6sghA+fgcX8+/d6iBd7ykZjGWN/2xbjjlirMc6Bbg9shpQNO/+R2x586tD9LhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8g3FiEBF4Yiwk+v1X73ICBHVpDpOvYiPln0ZfGYDplk=;
 b=NdRCykY37BH3csPo4Ka9BG/HzTg5yTRQIC1+ZuPzYjpcVpW9vZAXrNJPq7s+hJ9D2Oxoy5TGHGvmEbyGzs2TDUmLjNPJi/VmHccCzy03Vcfur/iWn+4SyKXFtDMFERz77Mk6z3dJrwNebH9d0cMMRzHvwE9vNKhdqRDrXmEH06I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by VI1PR0402MB2720.eurprd04.prod.outlook.com (2603:10a6:800:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 11:53:19 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 11:53:19 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] mux: convert to use fwnode interface
Date:   Wed, 24 Aug 2022 03:54:27 +0800
Message-Id: <20220823195429.1243516-3-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823195429.1243516-1-xu.yang_2@nxp.com>
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67470485-9557-45ce-7563-08da84fe123d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2720:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iBmFBj4e7SvpJdvAs4q4vVz92MJxN1GlOR6LLovN7BT83oA1tg+MyR2tFqZ0hR7c5C6+Wag3ui1GS1olWRUZFwZ8o42F2onGYjJm87jwegrWtgVDfmJsnsL1z6Fwfttc2vUS4t4+o2GT+8ekgdc14sqnBs3KUkHBbQRmRsqDKp2kS6bVK7d5X9iKS3v9lN3ckapTO8XH91/QGoakuQTNvi11/2+Gj5BPoUg4XF1WnFhkmco2imeTa9a+AmxHBZJXEMrtwcLDrLylPnAJNyQJQyxCUDblIaN4l1FahUPzR++yw6U3CFz+ZAHnnqrI9nDi7oxZWefK3I+4xdVnXcI27qe0DUAACQSmeXkGw1C+GLh5pd7LEc7AxeXDAyTgLt4UTvG4OIxIL4susWcrBT0+ml1p1OymJ/i+6ECvnEDfgZSLPr0aZG6LwC0jSxFWecMDcIkGp6/9p2GuncFeQBLPZIC5hQAZ6GAs9EZXSnoQ2fXwCZbj1wXXcgldTcz8RxMWTC6O22XqHZBS23p+Y20UEq7dISp3vuhMS13GbMyguCFluEWGP1q9E2r9hTqQaTPNT5Ii7LHQjSDjEU0rGDMRqiQUtmsl3+cC1kRAZksRcFahPk5vZtsq4w1X1K7hDgVUCjKvIEFMcqXdPouimmHvr3DN9L0Ocb27JN654fyMJhW4TMfFYQjam4b2JgScLAG5nI2iS3I8IoOPbJOqeWEzLXcPhqjU/Ey8EH9A4cgNKNnQpSX7f3vfbDRc2DaVz5VS94YC4Wt4Fy11jqaIspB96Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(66556008)(66476007)(66946007)(8676002)(4326008)(86362001)(38350700002)(38100700002)(36756003)(186003)(8936002)(26005)(6512007)(52116002)(1076003)(6666004)(6506007)(41300700001)(6486002)(478600001)(316002)(2906002)(5660300002)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ku9D59BFeoZWGpSVbzaDq+eF0Ag+48ExFenE2LO6QYXAaZtOwSsrPjNFGi20?=
 =?us-ascii?Q?t+1yjG/b7Ayc4RzB4zp39a9jJelKnW9iK0hgcfkGVj3zs3iPmqHesgu4etry?=
 =?us-ascii?Q?8sA1nULnqNxHRzfTv8LEsN2FdXWiv6z/VR05Y5jTFVHXnBhFqDIWWEzF6qb0?=
 =?us-ascii?Q?EZ5qcMt/79JyeS9iY0fHPNiTOrisKQhegkQyE9Nyn9bPxm3kir3L8Yv/1moY?=
 =?us-ascii?Q?jJNJ6xV9U3S6Hf6ukr9alGoEQ7a6wxDIsRLH6HX4ReMhkIE7mlDJRvHS4SDY?=
 =?us-ascii?Q?kQ1hI7b+mrCDTUWllTXnrpT1gqT4isJZGW4RwrqoxRxx0QEnDqVB3BeGjJpT?=
 =?us-ascii?Q?3263n9JR6W9pt2i+jxH4WCBKqvthh02SL3SH4QI0ooN9d6bz59IoSEzzisWf?=
 =?us-ascii?Q?q+/7TWshTfr2Q8uP4eYNXJXG1ToiFGYlzhpBiZtV3SLu8OLVHK5xVhEqAKTX?=
 =?us-ascii?Q?XmOeaF9b16gc17F4JrB69nVjHxiHfWVKnox0a4v3OxofKbEAkkLOwlFtjbJy?=
 =?us-ascii?Q?OHHnbxq3qwfaw85rYqALl5MRmEpV9fixdQDC1ujUZliq7yioKxA/vJWxQoOk?=
 =?us-ascii?Q?5LdlmRvHvjktiMtk84lo7184gk/oQZRd1r+SyiLJWwukvxsnkCqeZsKDOhNz?=
 =?us-ascii?Q?VMV710i56D/MACehXDRVFY7jwT6LK1NgfG0l+bCv/ArWQJXmHLT2dbxUCjT2?=
 =?us-ascii?Q?+rHv43k1NY3G1p7Mive/L301qbxejPDxTCFx42MMxclKlgRhCsO+Xlk25IpM?=
 =?us-ascii?Q?rSOPKilteq6o3yDnq7BscohTdEYKURc0QHeaIVAr8QbkieV++wNTAldOHdV9?=
 =?us-ascii?Q?d/JHBUlRE+kwvA/tP3sth3T69TeXxoSaH3C1VbmymJMBCuwXTNoc6ZbQfjn7?=
 =?us-ascii?Q?FjhkEf/CDUJaNifdypvXKLGX5GFn7kh7C0TH1dXRLalcRfrg0L3/m4nmRGou?=
 =?us-ascii?Q?ixYpHtVPa6X4MTk19OqxacsrCKaj0C8dzdkAvQPVntTvb++bPdNjBELOgCfr?=
 =?us-ascii?Q?ShmyGHS7IZclZQn2/x6N1TGNdg/SB54T7g6+U/Hf3WEd2Wd4Ot8F4FGhsarh?=
 =?us-ascii?Q?oHSpn00HuYFFuUtMP8C+WKb4ZuVUGUcb1FN3xpU4OAWroGnEgfERfhE+FjbP?=
 =?us-ascii?Q?ztUNpwV8Q0UIaVio5Oc62SDcBu1V38OxNIqzeD/3gQbyokDUXiX7AxahI1tD?=
 =?us-ascii?Q?Lf8H/9zW97DEXanQ2tP+YrgJWOxGh9j1sRbQW6K/IeK3AgUwZ9EDFNFGXP3G?=
 =?us-ascii?Q?g+S8UstGO9rTG/rBF8Ft68g506uQsrPurgz2FLM17X7sKps08bH1P1QeFTSu?=
 =?us-ascii?Q?gMAQ8lOZoNA639c4FpmuJ+1UYzz4Tybu9vFpj3irM5he7jrOBJznNEqlvIyN?=
 =?us-ascii?Q?I2F0Ar1XJTmblOVcFaOQJDiGeKW1TU6105THfmUkF9uj2h+KRhauafq311Kc?=
 =?us-ascii?Q?paeXkPIKdMmA9Jc0RL51yxunb47dxqxwQsjMD11OsEiqoL91m+CSb/n8vw4w?=
 =?us-ascii?Q?SxJoG1Q0AyrwM4R9zO0A8RQXhQ7EN2mWAuAqkfIfWKBQzR5io/lpV1uifcO2?=
 =?us-ascii?Q?o5DwNJ2gAhoxbfLWoelG2Cu2YLj3x0jD4+JtOW6w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67470485-9557-45ce-7563-08da84fe123d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:53:19.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPlnzjfdQSooDHTDEpJzAHfyRIhHV6OtlllkU93U7glSKvfcH8FUwofPlm7c3H3f8Z0XIsQRUQm+dkWhNsux+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2720
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As firmware node is a more common abstract, this will convert the whole
thing to fwnode interface.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- convert to use fwnode interface

 drivers/mux/core.c | 65 +++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 49bedbe6316c..e30e859efd33 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -18,8 +18,7 @@
 #include <linux/module.h>
 #include <linux/mux/consumer.h>
 #include <linux/mux/driver.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 /*
@@ -510,11 +509,11 @@ int mux_state_deselect(struct mux_state *mstate)
 EXPORT_SYMBOL_GPL(mux_state_deselect);
 
 /* Note this function returns a reference to the mux_chip dev. */
-static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
+static struct mux_chip *of_find_mux_chip_by_node(struct fwnode_handle *fwnode)
 {
 	struct device *dev;
 
-	dev = class_find_device_by_of_node(&mux_class, np);
+	dev = class_find_device_by_fwnode(&mux_class, fwnode);
 
 	return dev ? to_mux_chip(dev) : NULL;
 }
@@ -531,8 +530,8 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
 static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 				   unsigned int *state)
 {
-	struct device_node *np = dev->of_node;
-	struct of_phandle_args args;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct fwnode_reference_args args;
 	struct mux_chip *mux_chip;
 	unsigned int controller;
 	int index = 0;
@@ -540,11 +539,11 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 
 	if (mux_name) {
 		if (state)
-			index = of_property_match_string(np, "mux-state-names",
-							 mux_name);
+			index = fwnode_property_match_string(fwnode,
+					"mux-state-names", mux_name);
 		else
-			index = of_property_match_string(np, "mux-control-names",
-							 mux_name);
+			index = fwnode_property_match_string(fwnode,
+					"mux-control-names", mux_name);
 		if (index < 0) {
 			dev_err(dev, "mux controller '%s' not found\n",
 				mux_name);
@@ -553,35 +552,37 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 	}
 
 	if (state)
-		ret = of_parse_phandle_with_args(np,
-						 "mux-states", "#mux-state-cells",
-						 index, &args);
+		ret = fwnode_property_get_reference_args(fwnode,
+					"mux-states", "#mux-state-cells",
+					0, index, &args);
 	else
-		ret = of_parse_phandle_with_args(np,
-						 "mux-controls", "#mux-control-cells",
-						 index, &args);
+		ret = fwnode_property_get_reference_args(fwnode,
+					"mux-controls", "#mux-control-cells",
+					0, index, &args);
+
 	if (ret) {
-		dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
-			np, state ? "state" : "control", mux_name ?: "", index);
+		dev_err(dev, "%pfw: failed to get mux-%s %s(%i)\n",
+			fwnode, state ? "state" : "control", mux_name ?: "",
+			index);
 		return ERR_PTR(ret);
 	}
 
-	mux_chip = of_find_mux_chip_by_node(args.np);
-	of_node_put(args.np);
+	mux_chip = of_find_mux_chip_by_node(args.fwnode);
+	fwnode_handle_put(args.fwnode);
 	if (!mux_chip)
 		return ERR_PTR(-EPROBE_DEFER);
 
 	controller = 0;
 	if (state) {
-		if (args.args_count > 2 || args.args_count == 0 ||
-		    (args.args_count < 2 && mux_chip->controllers > 1)) {
-			dev_err(dev, "%pOF: wrong #mux-state-cells for %pOF\n",
-				np, args.np);
+		if (args.nargs > 2 || args.nargs == 0 ||
+		    (args.nargs < 2 && mux_chip->controllers > 1)) {
+			dev_err(dev, "%pfw: wrong #mux-state-cells for %pfw\n",
+				fwnode, args.fwnode);
 			put_device(&mux_chip->dev);
 			return ERR_PTR(-EINVAL);
 		}
 
-		if (args.args_count == 2) {
+		if (args.nargs == 2) {
 			controller = args.args[0];
 			*state = args.args[1];
 		} else {
@@ -589,21 +590,21 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
 		}
 
 	} else {
-		if (args.args_count > 1 ||
-		    (!args.args_count && mux_chip->controllers > 1)) {
-			dev_err(dev, "%pOF: wrong #mux-control-cells for %pOF\n",
-				np, args.np);
+		if (args.nargs > 1 ||
+		    (!args.nargs && mux_chip->controllers > 1)) {
+			dev_err(dev, "%pfw: wrong #mux-control-cells for %pfw\n",
+				fwnode, args.fwnode);
 			put_device(&mux_chip->dev);
 			return ERR_PTR(-EINVAL);
 		}
 
-		if (args.args_count)
+		if (args.nargs)
 			controller = args.args[0];
 	}
 
 	if (controller >= mux_chip->controllers) {
-		dev_err(dev, "%pOF: bad mux controller %u specified in %pOF\n",
-			np, controller, args.np);
+		dev_err(dev, "%pfw: bad mux controller %u specified in %pfw\n",
+			fwnode, controller, args.fwnode);
 		put_device(&mux_chip->dev);
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.34.1

