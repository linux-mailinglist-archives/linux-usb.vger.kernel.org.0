Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB1B59BA51
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 09:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbiHVHeR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 03:34:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232331AbiHVHeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 03:34:15 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18421275F9;
        Mon, 22 Aug 2022 00:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNEMLV1ELWFj63NmdJhioQl2dZbA2+AeNb3Zk542Wl2UqnFpwy6Pxq2n5KDpuI5zv7h71+awTLwQY1H0aN+qYHo/Vf6MoqGHL3XC9CQfVx2T6WjP6sY1pIIX0pD0/jIUrXu4Yf3/dR/lA0sPzFKc45uwR82SMBUliHAX7mzru4CG0LXST8xYA0FjUZgG0QCKcYdZl30/iiftKBI1Mv4nuDKiuwbmVuBJBW92L/FRCSJltR959TFpNsZOTyEsH6M0ITo2b50eGuga/58lCcVr97S0/eeBi34Lt99DG6HIEU1Nd5av5mBrjAHyPMqfajao0rdmAb3I/J0va27tjZ75RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BPkup+AUFLBnyGgonKYy29ETmrZi06gMGrzaV87zZs=;
 b=c2JqVRIMqo6ZZPlPrlEVk6NyM1lc4d7vo2jD+F8Hax4TS59a3QF5o/r/ON47F2qIpW67BBAKBeVB60XkCBwO5yhSdb165mlx4UnfHA7EKzTa+QB913rMez+rQszu3HQkP4cVh9BORs0re+9VfEWCEMOC2+iEgQgA4Q1625PNVqz39MHKNcC7V+wd9BEDnwEUaFvP/g3dC9j3lJFaMfcuS1hapbt0M6DMQxzKzrlepU9soihH3pSmV43z2SF/qiR8dEjWXVL8vybLhiz4CyV8L7hCyPQl7oJjgaXWPJxH5zFpbwmpwOIYhI81YrzfK0MeReAEXyXE+5t6TFopZBqvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BPkup+AUFLBnyGgonKYy29ETmrZi06gMGrzaV87zZs=;
 b=l0nfCwnw9cqz44ltccZPYlIi9VLT/yHp0Sq+HuKJOWPjPdKF6G1YvRhKIx7rzSFnoOlVZtUaujRYgqz5tlvgjqX1I67BAMDxfcDZY5XwgJyNV5DpKQStdrE+uFWNObhW632z+DMosbPHVdJkbR+OocZ+Te/mz8ogPZ3iUzQBJXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by VI1PR04MB4640.eurprd04.prod.outlook.com (2603:10a6:803:6b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 07:34:11 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:34:11 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] usb: typec: mux: add typec orientation switch support via mux controller
Date:   Mon, 22 Aug 2022 23:35:16 +0800
Message-Id: <20220822153517.3747679-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822153517.3747679-1-xu.yang_2@nxp.com>
References: <20220822153517.3747679-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To PAXPR04MB8784.eurprd04.prod.outlook.com
 (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511a9908-878d-48b7-550d-08da8410b4c2
X-MS-TrafficTypeDiagnostic: VI1PR04MB4640:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O7Id1ONBh5KtObNq8TqjbUdtSMwmWyG353vOs5nNxsbhLJgvqxmNyG6FA0kP2aVIAgJwIRVaKfKExDU4NE5AmQKB6gcGQvvPZccuNeTcNa74k1eoLgPbmiDQsvvd3MDYQzErnxZLWLlx4KGXQILs2LX8aTWjyNOStsx/Gr1V4QiUu22KzW2MisSCZzrfIh0qxcD4d/j0adEqS6+MzV0VbhGx4gAY5mohMOOzbaKktHBfRLbHRMXNJYg1dXKZlKeJMW7/mtIli/qlvLWMu6BIejj7t0WpTzL1v3Q/mbPXlylc4xucBlksDAlIMwM+61CKxdridyxnz0O8EW6b1r2OOqZzxo5zBVk4Hpe2mCblZ9K0hjWyPF+he3uYD/adGVlnaaRwZjk3tQHU2TZHAb8NovIuVauGN2hKyp1z1uOiVA3PRcRd5Ghuth2mC1YASyiYMlYfxwmztG4ka36U9tAbVor1tit7WM/sD1FmYAzN2muLStzdXMNyiI5Cn2KFUL6UUc9BAXlOs1SP0pY/bEJQieBatf0oZ/vISTuEodeDjLTqlW7JG4hXRiMAiEh9uRvsXjWEY0fqxmCCZHHixXVUPAyG8CbnHU9uJYtUj0qgs3RnRoDgZlLTh+pXQbqGxneftj/0Ak/7cquCq+g5rZfi8WbnjXOEsTc5whi3FLxTOLsiLMhXH6zDogoxMHbrigZ3Fy21hpuo+BF3MLbUbAxxwc+XI+7xUZRB2xNllS3+7OU9mSO+273CQ9VW58F+KptGrkubt2TwoGD7dC3jAXfCxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(8676002)(66556008)(66476007)(6486002)(5660300002)(316002)(66946007)(41300700001)(38100700002)(38350700002)(4326008)(36756003)(478600001)(8936002)(2616005)(52116002)(6506007)(26005)(6512007)(2906002)(186003)(1076003)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?auQIHuIlIxR0nifPZu3xvd4I2u9a/jUl/41HWPSmi5Z+enBUQkjO1+eWt6Mb?=
 =?us-ascii?Q?Ge6rvNr3nQtJ15ZRKrfqy5r+/BHV2nATLxsbBASzknR07cnQ73TGZqEefcLB?=
 =?us-ascii?Q?tPxiBQAXNPvjk9TJwxaySS7bem/z56dLYS8Rr1Sx67bXR/iay0eopdTFS1oy?=
 =?us-ascii?Q?eUowJsc50Z8qYAu4VPSzVqgfKz/aIYHHyeqbcjEUCCKP5nqwTP5SjCOJ1q0K?=
 =?us-ascii?Q?UN+8h+DtDe0VsLq5EvOJ/yVAMEG4VTH9rRMcbN+tx6CMKtRxfzJpe0mjHeS9?=
 =?us-ascii?Q?waSkSGFGFjDBG3R5V/cYE2Rf0R4v9Jl+HBqxt7DdwMXEz/sk23TM+qSEZrw2?=
 =?us-ascii?Q?54MUhrQUQAVzCgNKYgkrIeZ22iWomKH++QwMMvrPEWiRDl392fjsz5mU0lGH?=
 =?us-ascii?Q?d5K2wBJCCX2AbtokrOodUzwVvUS/tIGP6d2zpokrWpQ7Z5pS3bUEUJ+zo0AZ?=
 =?us-ascii?Q?DicMUOelGelxTuRg9Y7tVH3HZIj7B003f8hG1/v0/VaxOK0/chIjgaKHmA5j?=
 =?us-ascii?Q?NCSrDMclkV/DuhXEXDE+J6KcWa480iSt7vkBCMyzI3kaZUF4MUZ3TLo4eJr4?=
 =?us-ascii?Q?fJjaG4rB5vuDLAUVEQE9ssPGC/HFFOKe/sC2GUM519exiE+ofKOozISx40LR?=
 =?us-ascii?Q?a6/qVxtcp9l4+nWi2kXzaq4Mq4d96ae4u3LEM6J0RFY4xB6CoCBdhD6qkFAS?=
 =?us-ascii?Q?IW1PHiMSCi4+Om4+upjRxiGx2ZMKpQvQH64OtWHUw8TUrTwUQ+hEkp3nMBO6?=
 =?us-ascii?Q?MTcLQIRzRuIsUWm98gYXZ9G5Y50iwOzzxWCvkh9eOb/+ayOY6F9nK/rvovnD?=
 =?us-ascii?Q?OVlbDFlF9LFZf6gLM69emhY6J4N/2mHFH6ysnSXFFom1efeS/9dLW39rWmG3?=
 =?us-ascii?Q?POUhG8FpjU5wnZF7eqTV5/n0pHCN7SCRTpzCXMPAVFgstrcpRwvNz3Wv+cKl?=
 =?us-ascii?Q?gPvLBoTn8eUOlB+ihaIAsf625M4keb0XDnNGSLxBiZQ8Lhv269iIEtcqphFd?=
 =?us-ascii?Q?sSbrsxY3MaU13lhQj4vxmyl6dIlSXa/eJPUTooaBhN6izdjK2vOFyUnhd8aY?=
 =?us-ascii?Q?h/YjmZjTf4qBNMK1d5z0YLeXpuGkobTPoCGWcUz1hdflzfDHlvrb8gsdkcqD?=
 =?us-ascii?Q?6rFXW5oE5IVeYRdVPWl5jBB2LiPY6/nZ64TwLX0dOLPXP8qUJu7dWP2uPuPE?=
 =?us-ascii?Q?jWznURerfjPIPTOh6rwhhx1f64UBzSUPOHuJ0BW/jJ10btz6ftmVe8BXb8x/?=
 =?us-ascii?Q?pa3tYgHca9K2QhPPP78hzA43aHjma48Nwx+BQSdSSomSyIgE175OWtndvt4Q?=
 =?us-ascii?Q?1Usmasvx6OEujV7m45QuJMxQtv7xFylL3rdNTkrWpmoOaQOJjyvfNTq9g/RF?=
 =?us-ascii?Q?KiRh4O4jTCwQrUxIZePvjBgHZHauZyhHu8uBWkOSdQw1Ucc35DlHr35lNl2/?=
 =?us-ascii?Q?18McvsEAJF9ubhzlpqRQ/R7k4Asncjul6fdBi35+Zymo75R/MzCuBOABpnpp?=
 =?us-ascii?Q?22CTDHRbwjN+WFA9uTCG4y73xbWE7bA76p6y/AHI7j4BJXxJdteIZJKlt3oc?=
 =?us-ascii?Q?OBTHNiGvUl1b0VCDNy7nsO2hHpDX00VhL0J+oNGk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511a9908-878d-48b7-550d-08da8410b4c2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:34:11.5042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +IpYqAPtV4cn04pAeZgrbpGj2vhc/v1hMJo+iKmFY9VSHvloWBHxK8/C9R6LJCJ1m22WQUJJwInfHU0po9duKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4640
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some dedicated mux block can use existing mux controller as a mux
provider, typec port as a consumer to select channel for orientation
switch, this can be an alternate way to control typec orientation switch.
Also, one mux controller could cover highspeed, superspeed and sideband
use case one time in this implementation.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/typec/mux.c       | 74 +++++++++++++++++++++++++++++++++++
 include/linux/usb/typec_mux.h |  7 +---
 2 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 464330776cd6..5ee960fb668d 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -13,6 +13,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/mux/consumer.h>
 
 #include "class.h"
 #include "mux.h"
@@ -22,6 +23,11 @@
 struct typec_switch {
 	struct typec_switch_dev *sw_devs[TYPEC_MUX_MAX_DEVS];
 	unsigned int num_sw_devs;
+
+	/* Could handle HighSpeed, SuperSpeed, Sideband switch one time */
+	struct mux_control *mux_switch;
+	/* 3 state correspond to NONE, NORMAL, REVERSE for all switches */
+	int mux_states[3];
 };
 
 static int switch_fwnode_match(struct device *dev, const void *fwnode)
@@ -117,6 +123,58 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
 
+static struct typec_switch *mux_control_typec_switch_get(struct device *dev)
+{
+	struct typec_switch *sw;
+	struct mux_control *mux;
+	int ret;
+
+	if (!device_property_present(dev, "mux-controls"))
+		return NULL;
+
+	sw = kzalloc(sizeof(*sw), GFP_KERNEL);
+	if (!sw)
+		return ERR_PTR(-ENOMEM);
+
+	mux = mux_control_get(dev, NULL);
+	if (!IS_ERR(mux)) {
+		sw->mux_switch = mux;
+		ret = device_property_read_u32_array(dev,
+			"typec-switch-states", sw->mux_states, 3);
+		if (ret) {
+			kfree(sw);
+			return ERR_PTR(ret);
+		}
+	} else {
+		kfree(sw);
+		return ERR_CAST(mux);
+	}
+
+	return sw;
+}
+
+/**
+ * typec_switch_get - Find USB Type-C orientation switch
+ * @dev: The device using switch
+ *
+ * Finds a switch used by @dev. Returns a reference to the switch on
+ * success, NULL if no matching connection was found, or
+ * ERR_PTR(-EPROBE_DEFER) when a connection was found but the switch
+ * has not been enumerated yet, or ERR_PTR with a negative errno.
+ */
+struct typec_switch *typec_switch_get(struct device *dev)
+{
+	struct typec_switch *sw;
+
+	sw = fwnode_typec_switch_get(dev_fwnode(dev));
+	if (!sw)
+		/* Try get switch based on mux control */
+		sw = mux_control_typec_switch_get(dev);
+
+	return sw;
+}
+EXPORT_SYMBOL_GPL(typec_switch_get);
+
 /**
  * typec_switch_put - Release USB Type-C orientation switch
  * @sw: USB Type-C orientation switch
@@ -137,6 +195,10 @@ void typec_switch_put(struct typec_switch *sw)
 		module_put(sw_dev->dev.parent->driver->owner);
 		put_device(&sw_dev->dev);
 	}
+
+	if (sw->mux_switch)
+		mux_control_put(sw->mux_switch);
+
 	kfree(sw);
 }
 EXPORT_SYMBOL_GPL(typec_switch_put);
@@ -204,6 +266,7 @@ int typec_switch_set(struct typec_switch *sw,
 		     enum typec_orientation orientation)
 {
 	struct typec_switch_dev *sw_dev;
+	struct mux_control *mux;
 	unsigned int i;
 	int ret;
 
@@ -218,6 +281,17 @@ int typec_switch_set(struct typec_switch *sw,
 			return ret;
 	}
 
+	mux = sw->mux_switch;
+	if (mux) {
+		ret = mux_control_deselect(mux);
+		if (ret)
+			return ret;
+
+		ret = mux_control_select(mux, sw->mux_states[orientation]);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(typec_switch_set);
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index 9292f0e07846..2287e5a5f591 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -24,16 +24,13 @@ struct typec_switch_desc {
 	void *drvdata;
 };
 
+
+struct typec_switch *typec_switch_get(struct device *dev);
 struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode);
 void typec_switch_put(struct typec_switch *sw);
 int typec_switch_set(struct typec_switch *sw,
 		     enum typec_orientation orientation);
 
-static inline struct typec_switch *typec_switch_get(struct device *dev)
-{
-	return fwnode_typec_switch_get(dev_fwnode(dev));
-}
-
 struct typec_switch_dev *
 typec_switch_register(struct device *parent,
 		      const struct typec_switch_desc *desc);
-- 
2.34.1

