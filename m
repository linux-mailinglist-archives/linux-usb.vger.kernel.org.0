Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 237D459E53F
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 16:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242506AbiHWOlp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 10:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242564AbiHWOl1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 10:41:27 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD2F2CF90E;
        Tue, 23 Aug 2022 04:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OtSOhbQbApvD+bvwggMqsLC6eXE/xd04MHR9/fWKkA4M2JtolK+PByfpX/ngqXp6ZqIsiGBwHVTMuFcu6en0icxgaXP6Cjrwi1LI4pv5PitsiTMXxN7sqJhPHluUfTyEuxNrk8fJUBPrYRksQJm7HptRSFLeEWkNcBeud6pn8RaFCmb+9HlvjKb5Sbvz4eHFdwaQr5uw0EC/W8XLGdy3VgNX8laKNVtgfGHFnh/O3ZYU192zyIwcW+C2HGoiffDD273i6J/PhJBgQRrMlcg2qsnn4h8egeW25GGCfWSeqd4rZXO7jhfNXIwwZ6y8uzvCeo9PFzGcfoJNX0p4VWVfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDLc6BDZyYOkWIDUubehY7WBYEo7axYU4TpsHPO76q0=;
 b=XyMI17phl8ElILmJrnUts2ERfzcJZ1M/+3t2ftXb89KMprbM37T1rp+RxSjglCnGMjFLia4j5FqT5/Njq3S5SkI4sn4ZW2w+2qBdy0EQiTYkpdCzKKzI5CbTjOeqOEKfmCvfRQb86mjAHZRPd7khqaCh/YMGa8KAhcvSBwGbxifr5iGSvUwkQnKSY+sYF88s3k8jhb+JoaCyLqZupJ+h4uZg+z182O8eitXq0e8NgX5p9qkqRrhL9gcDJmHbN95mqn4iGRkUlhf7Hn7SU5Z4va3HNVWuTFBSjKro48+ZgtI9VD3ag7krKPKCnIQakV80sClpg7zWus8sx207ecaJlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDLc6BDZyYOkWIDUubehY7WBYEo7axYU4TpsHPO76q0=;
 b=hZZu1gfLXqY2qHelcMJhMHGTVqJ1no/v414o1D5ab5eabDlukOAhFZF7DYC1ZjDXz4F2QodkhrePOskzTxZ9sUVqBQZf+VjPo9Izo1+qCeVKdPWZ/p4RlZCgo1c1A5XMtp/h4rye1u1qu6juKwxhV9uU4obldoku7Qza35NIJ7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by DB8PR04MB6668.eurprd04.prod.outlook.com (2603:10a6:10:10b::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Tue, 23 Aug
 2022 11:53:22 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::60b7:af13:8472:2e8c%4]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 11:53:22 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        peda@axentia.se, shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net, jun.li@nxp.com,
        xu.yang_2@nxp.com, linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] usb: typec: mux: add typec orientation switch support via mux controller
Date:   Wed, 24 Aug 2022 03:54:28 +0800
Message-Id: <20220823195429.1243516-4-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220823195429.1243516-1-xu.yang_2@nxp.com>
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb2dce8-bd40-4001-5767-08da84fe145f
X-MS-TrafficTypeDiagnostic: DB8PR04MB6668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YDAK5RxILIQSlS8W/DbnhTnnyC31gR/NwSd+BiQK+g06ub+wwwdvHeVhwwMcrI6LIXuDhYSfHfRxHJ+MfT5T9nJFIxFM+8YulDg4j0NqYWXyzJlGmb1qXeaGAoDx9sPd2zKiAah3qLnYp8RyVQciztsDIsU0/z2VqQxVD9vHNggGOgOKg4EaR4YXUSMXDjQaIbmVIcE09B1GpDysRFs+y0NEgx8HjxhR8QVZa7lcyVJh4H7hKIJhiU6ZzedgCKz8XT7G5WcFasf42tcsOT/ER4Y2ZDIwp/hVp6nI7qLt6w7N6iip1mxho6BVl1z3c80c4wAvFidrhw/X9epuXhpDT4/tF3dnwNR/O4GdDzs2y4cJpv05mnhGbJ0KO5e4K8E/xnac6P9jLM5sCscEEGNnyG3pi2eCfQ/nXP5diPQ8GJmwhjVrBmHljJ21t346e2iP40GVZsNDd1NtUQ6im2oMJpTjN3aWqk+brh8UbJP76gc5pCD54zX9vUdYdks53PvuWYEXIIAOhImvMtJZ40VxpfKS8QP/Okk4rEQE8d9FPjkY4nay18s0zAzgJX3UKOX4cu5+dXOyYk2G/6sC9JVZmNR8oAWNxBRLZ1MORsWzzEs0EdaUM9p5xpvmJd9JcR+FV6UCZNgppiwZ9ToFoZrM+Vy8I8lnTZ0e3JCpQmHl64SMEN1eMfUvQVydJW+tcNVp+g490sRz9yih8siVxPab7XeamGQ5xN1+4SZ8qu2KOXC3RkrPZo830yonOwTn8W8Z5NcVHXB2gVqpurT/VKJr1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(38100700002)(66556008)(8676002)(66476007)(4326008)(86362001)(38350700002)(66946007)(36756003)(2616005)(26005)(52116002)(6512007)(6506007)(6486002)(5660300002)(478600001)(186003)(316002)(8936002)(1076003)(2906002)(83380400001)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lo2nh7cFpsenc4cworR+GmYSUE74dJkafQTsNfj9+xRhCdQCONZY33Rzvuz1?=
 =?us-ascii?Q?H1i5M0XcfdcW0Rxc+OzmfclFc2On4m9avd1B52lfffKdABLXlc/TkyGtJPG0?=
 =?us-ascii?Q?fV6yPt3vHSz5b3OkUu3tgYh8YR/8ovAut5jZT5udmfu4Zr3npRTjGo589FtO?=
 =?us-ascii?Q?tQfj8z1d+6kEa//nwccKKN8O4EbEen/RtfMz9SWK7G8W55J9ZN0ZJQP+VErS?=
 =?us-ascii?Q?xHZZERmudXYLM+J7LYO65Lh/Nw+bebTp0lbviQ9vfgFz3ANOeIV+rfBnBWGC?=
 =?us-ascii?Q?P5+vUwq4QWsNbzJz2G5gQ/92WAbW99mWmtWFfP3K8KZhJ97GmAy1LoJHghbT?=
 =?us-ascii?Q?kfC8/ZAZi8RSVPAIipwqkIplhrF9n/96ZIfOi0xHp77gRtvzLQ7tB0+Bu6K5?=
 =?us-ascii?Q?IM+JlqkYgIMRu1AXNM1OId625G9WUb9UuhMwOvWpc+iq0/6r1iE2/ojAIOWw?=
 =?us-ascii?Q?Vlh/VYyps8aiPVOZ5r8CWVEiJHLw+Hl2I6ZZZrf7GQpw0ptel9yWHQoV/uQf?=
 =?us-ascii?Q?GL3YhUFhpXuM81NS5xPRW+hCyzX7qwv1+dXWr8My0U9GoNlNxvNWcOzyDSNY?=
 =?us-ascii?Q?zqsRrv7n0pQuGOg2iCh94GNbMi0STFGt1aKxQHgEdcBmFcrkVW+OimJgK7By?=
 =?us-ascii?Q?Cixli6/o8y+FPw9GCHb/71CZzCzcji8t1Z6P4lI1qmdzGcPXLnphywg9qLvr?=
 =?us-ascii?Q?lRqIXVevFhkpxt7ed8zqkOUiwh3m4eMkjXrg3utktKwUloUKHrxEux+XGqRW?=
 =?us-ascii?Q?+PctPN0kVH1wmuJYXLNmHfD8BG0O+IVwINIDgyNm5CVUsMd2+LYwzUeW6PiF?=
 =?us-ascii?Q?NCml3FkWjiqilKVM48mwTgJfDbYV74fTUJ4RjwXLhf4kSHTXJKooKBQmkjYB?=
 =?us-ascii?Q?IEdVCn6IIpz5hV4q9CptjvOeTcQ/YbB8p9m/pykEh9gv1kheTCscphq/Bba7?=
 =?us-ascii?Q?HUjGeqwK22f+6TcQ1Xqx0nZ6KAhWRfa3Pqcl6ToTzQ4Xfv62Erz91NPcrZRH?=
 =?us-ascii?Q?OR4g+7ZFN+Yk3OxiQGZMGs6aWxtyHoC/ZsCXyd1PZ9YWS3UHkFHN1+WdGebb?=
 =?us-ascii?Q?Zfvj0tRls8hBXtezfbySRKO4ayRyVKT52R5qzf2nzWN6rdBAnZtcC2/W6lSD?=
 =?us-ascii?Q?xB1FmKr2as+DP+5NZIFgs78reWp/lH+kdRTU4p08HLtT2aczj4gQfe5qTUK4?=
 =?us-ascii?Q?Y+IET8GRH1MvTMGN92ayKmG7M5iNC3t6Yq5IWGZuTVI4ZTzYoN0rGjZHo22g?=
 =?us-ascii?Q?D3UxLytCKmmMCmkU+NfMNK4IXiS9ipGVm1aPiZRqrWKWoQ9CGDizUI9A27x8?=
 =?us-ascii?Q?JPLkIfkzE8gNBaIfTUbzz557OGg2k23mQfqmKuZXGy+mX6zRwFDSfbQrE+mL?=
 =?us-ascii?Q?/yr23EL6y80J4n7ros6XcFrLLZrLvuH6gOFJcaFFJhqoJ4GrpyiBvd6iprYc?=
 =?us-ascii?Q?NOai6Uz4ryD56Yb42uDWJ7pbswMeDvK5U2i9GYkQ5yiNEZ/PNzkRl0a/mm3a?=
 =?us-ascii?Q?HVe1LOfFdcncnhc/n/QEnGuQo5uHsrGZ7cXeXTvZ9lgDvjU6SJWE9vjG3FYz?=
 =?us-ascii?Q?xtgySCQNWazDeU1ieiyEqZVB5oilA1qq8XOkJbW2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb2dce8-bd40-4001-5767-08da84fe145f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 11:53:22.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4txh/yDkDwtFt2Phx9DZstC3eTaNYOZ9ZnkzxPNIrE/03D1l3DDFUhdxyqlUFyw4U3jrBV2LYYU85+mMkZ/pAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6668
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,DATE_IN_FUTURE_06_12,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR
        autolearn=no autolearn_force=no version=3.4.6
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

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes since v1:
- add build dependence (select MULTIPLEXER)
- improve Multiplexer control logic

 drivers/usb/typec/Kconfig     |  1 +
 drivers/usb/typec/mux.c       | 76 ++++++++++++++++++++++++++++++++++-
 include/linux/usb/typec_mux.h |  7 +---
 3 files changed, 78 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 5defdfead653..73d4976d8148 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -2,6 +2,7 @@
 
 menuconfig TYPEC
 	tristate "USB Type-C Support"
+	select MULTIPLEXER
 	help
 	  USB Type-C Specification defines a cable and connector for USB where
 	  only one type of plug is supported on both ends, i.e. there will not
diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 464330776cd6..05e6ed217620 100644
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
 
@@ -218,7 +281,18 @@ int typec_switch_set(struct typec_switch *sw,
 			return ret;
 	}
 
-	return 0;
+	mux = sw->mux_switch;
+	if (!mux)
+		return 0;
+
+	ret = mux_control_select(mux, sw->mux_states[orientation]);
+	if (ret)
+		return ret;
+
+	/* Keep it as it is since idle_state is MUX_IDLE_AS_IS */
+	ret = mux_control_deselect(mux);
+
+	return ret;
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

