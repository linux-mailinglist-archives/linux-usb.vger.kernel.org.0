Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 600F7388830
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 09:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240290AbhESHdT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 03:33:19 -0400
Received: from mail-eopbgr140081.outbound.protection.outlook.com ([40.107.14.81]:32741
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240198AbhESHdS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 03:33:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtKa4ACr3JlWkFrEbHWfDtNXDYcbOA0nqPAz/V8jVQxCn19xFAG5u5Qn6ZkFSg4gXqUTtf7ZIV4tJVMPqJr6AP/FALL1OWpr4z9ISMi+Ety28Nn2/B0QntAaIxhKLZBmrJ5r8TNyrMU5AEMmtK2gk2kMNMGmVRiOR6uIPOf7gCqtpuoqU+SRKXwtSykZHyM+Zbgj92bJDfY17+QfY8LfULrz6rCyfSDZIDPK+1LcSdWccGPckSQCSXj/fLuHXMrmm3C16w7YHINQ3V2oCRleCehbUuJQvPUFvsvMi9EQSjkt3Aq30/HcUkvMHyY8DrhzxVk2268zerzFX027tJVo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGer17KI8S9a70ziwy2IG8bCagDvvn8KrUZqRRS+874=;
 b=g0bswPVitkbeIMjERQyWGFTFTvl6zbdeTaZs5acHbqzELaKbTLX2ZAMdV+YVnXnm7fP7VmJNU+GAImHhk9etcC9aZqpe20+aWRdv+ulWKvfCYeapVudp+bIcClP8nggUSXkvPYA2XzKPAO27Qt3htSUp1zXrVDmTS9UC53APiIJZ9YfxiaRvCjvdhDMWQqDtO8ch6CHdPK2qpf6I/pI6KbcFZqupjiyAEhW5bdEwgJf48s8wkbxV5jiU6/uZNpEg5UzUynVn/O5J9UbFoFGyKb/0JUzuo4xL1CPm0iZRYQGCOPO7qbUaBVR6lUZef7XA0itwqFUqbpUdDK/kOD0I9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGer17KI8S9a70ziwy2IG8bCagDvvn8KrUZqRRS+874=;
 b=BbTPCBzsV6p8++lvm9uwqyDOXnIjgWgFKspbU7++Zp8DrUSSQ9noxK/htcDtomlovqYZXtIATPevDomvPYYd4KM7FO0UgTVTFZ7gKNgoy/PJ3KkW1iHGmLQNQUvExm5wg6UxHa18y4XV9y8zTe6bX6niMWi+F9j52LWLIEyuZfA=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB6237.eurprd04.prod.outlook.com (2603:10a6:803:f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Wed, 19 May
 2021 07:31:53 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 07:31:53 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        shawnguo@kernel.org
Cc:     gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] usb: typec: add typec orientation switch support via mux controller
Date:   Wed, 19 May 2021 15:14:49 +0800
Message-Id: <1621408490-23811-4-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0142.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::22) To VI1PR04MB5935.eurprd04.prod.outlook.com
 (2603:10a6:803:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0142.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4129.32 via Frontend Transport; Wed, 19 May 2021 07:31:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec68ce15-635f-474a-29d3-08d91a982c80
X-MS-TrafficTypeDiagnostic: VI1PR04MB6237:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB623756A20DA3A7D4628D66DB892B9@VI1PR04MB6237.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFhM2GXOHGpopPvoa/Rb1Y1KeaDJzJ0++CNFRRjaoZV7mGAXtMyMb1QR4Dtt5M34NxW2IYKcuvE3VdVWr+vVt/gn2tjTJWmCTosoAInxS0c5+/2d/8XI1bopE4FLnpdTiV2ZZHBeLyIjlyEXmryv7kXmxttxY6SzwssZws0H73mFQhcRuBZfkepGjq2bqu3G59v6KUJE0hbL9KyuhVq5gGzmIMCDsHv+cNhbWjmppGZ+n+yCPYb45Rd0JrNmN/xwrVnQCrgbBFa9LY4otPrmNzl3iySYk5ccvhAUpHuq0i6c/0/x1uvt8oxM+y8f+a3SoRY/87hwZ0HGfWlzQ0hf/avkcIQYgGs38wd2VnOBbwOa5kYpmQi1+km6qYdWS76HPvO1Kfm6gR2/1c2J6fFFbU/VkPOciqr3vyvHxHb4SjD6cS9xOKIHzOyunwu4g0slx6IPZm821f30M+TaIv6a2yAjig6EfhNpplbZkbxeLXV0oKf4Mqfh4xUxbTmyH8HbcZxfQOHnzhRBSFj40mCC169YQ+PpngVk3vjdF1rPbalyD3PXn+WxJAYXnLywBJZPE7T/0OmjmbX4EVQaZr/kLmPI8B0yKfE/Kk4mWrD0Lp5luaFpXcBx9oTY062qTFt9z4FcnnhVyrABZ4gYb4y42dQIaE8qKs2biEnPwYa/lM4RZmqJ5qczA83wKNEpbR6d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(83380400001)(86362001)(478600001)(36756003)(4326008)(2906002)(52116002)(6486002)(26005)(38350700002)(6506007)(38100700002)(16526019)(186003)(8936002)(316002)(66946007)(66476007)(5660300002)(66556008)(6512007)(2616005)(8676002)(956004)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UjOPlDe3geReTHtcfBGYAiL8zz7hHP2G0FAeqWFHFI0PSJTDYH/UGlPA0NGx?=
 =?us-ascii?Q?9IwPPg9V66UgyoernBSKn21U2Ph9mWmK/Ped0oT6wB3a52LcnfkJNNc4jfDv?=
 =?us-ascii?Q?KaiEFvZdcqVdMJPNVW9FGvOvQZmBeojOvo7OcrkD3hmfpY2I6kV6ufH3XtMu?=
 =?us-ascii?Q?Aij0G5N4v2cOcfuJ8VKYYRjt0pPFbCkg6r6unoc4QsqL9UL6qSsMu9LVPLwy?=
 =?us-ascii?Q?I4E/FWsaqOKcnqHex9MyvaDFDPIzWUIDtnZRTw2cPq6fl2LoB1ylwwOnKVxd?=
 =?us-ascii?Q?UjtZWetpNlF/zy1a3/gZXWXcEQvQk1QJO8ih5LtXt+BFCh+RQalWikdPaZrn?=
 =?us-ascii?Q?Xfaj8ERoUC46XmNomTcskP5ZJeecXjE9aTywbxEMVd7A6H3kLtVnX5Ia1ACz?=
 =?us-ascii?Q?/8oVTxQpfBnk1iEckr+3pA8Xsj0mpo+s+3rw/R4qTxMuVs4XKoI2v4s0FeEz?=
 =?us-ascii?Q?ks7kaugHa/h0F3XUG34PJtJwXZ+/sTx3KXPOQo0v1fMbDnPXRl+Y1dIhE6J4?=
 =?us-ascii?Q?D+RggfXmGlIOehwQtZrTBWHDI/6plEqaJ2jxzp+0q3Vyw4VUogkeI6bIAHfT?=
 =?us-ascii?Q?1lbYiwn2ldtothkQlziUa5YSFmk7I+7SV5AA6ks+0Mv+xIdsu+HZ4si1c2Lq?=
 =?us-ascii?Q?/79ps72GkMTwtJ4Y39UWFsBeCPdLS6qDflnByrlB+k861ZiInsc4ZxWpFEJf?=
 =?us-ascii?Q?6lPvPHLaazd92UB10E3KzVSD9Y3cBJTfTvfjejXWOgi2Z6s2IJTJfviMdi19?=
 =?us-ascii?Q?wGvEHr4Y+EU5SX18+fE2UhGyilcUQpTbu9PfcWBjw4vLi5cFvKxyN30mw6tv?=
 =?us-ascii?Q?AQZvamaFOAtpWpkshw76CXbaTo8z3rGfrTobPlBeYWxKeQ0qMeZYiUziNWOC?=
 =?us-ascii?Q?NuCHr95Dn9IqYRmZxuuQbhmYVo7r7mknpcR7MBSHUH2VG9gvGXM6xVSbVjyt?=
 =?us-ascii?Q?54YaDIatiExnEktce+xhKW+q1hs+cWk4Y8AYdG+tt8NrXEejEm1v+So4T0Gt?=
 =?us-ascii?Q?rhd3onq49yHt3cIlsWESCfDQEoQ7J5V8SO+huUZmEccDQYXulQl/pVEM6Mjj?=
 =?us-ascii?Q?pwNuQ3dIBUzVG5NDnmIQwiPIrlhwSoYAdBABZdzQKyEssgitT4HiQBknfe3I?=
 =?us-ascii?Q?WLIcG+1XuwPbNiwsFdwNXtw7LnGbiQesGJ0VCgH5inAiRovpGUyTNPkQA1Gh?=
 =?us-ascii?Q?3ghhUi4CE/GHcbqtrmrGQFSnofAd0LTg0M3asXjcTnSERJmk2X6XqDfr3GBr?=
 =?us-ascii?Q?VOTe6GhGXt48iMzulP/yPoobMG2djlhlKs1qOB+8ETiKdO7ZMxw9sqJ8+X24?=
 =?us-ascii?Q?MigMEJef8YCotClsbS99wN5F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec68ce15-635f-474a-29d3-08d91a982c80
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 07:31:53.5832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1bdaOn92+4ZLkfpXQZ5GeJJg0Qiz/vFnd7MskPt+LEZzhB6h5vRThpz20WZN6Ip
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6237
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some dedicated mux block can use existing mux controller as a
mux provider, typec port as a consumer to select channel for
orientation switch, this can be an alternate way to current
typec_switch interface.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/typec/class.c     | 26 +++++++++++++++++++++++++-
 drivers/usb/typec/class.h     |  2 ++
 drivers/usb/typec/mux.c       | 34 ++++++++++++++++++++++++++++++++++
 include/linux/usb/typec_mux.h |  4 ++++
 4 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index a29bf2c32233..1bb0275e6204 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1601,6 +1601,7 @@ static void typec_release(struct device *dev)
 	ida_simple_remove(&typec_index_ida, port->id);
 	ida_destroy(&port->mode_ids);
 	typec_switch_put(port->sw);
+	typec_mux_control_switch_put(port->mux_control_switch);
 	typec_mux_put(port->mux);
 	kfree(port->cap);
 	kfree(port);
@@ -1816,6 +1817,13 @@ int typec_set_orientation(struct typec_port *port,
 	if (ret)
 		return ret;
 
+	if (!port->sw) {
+		ret = typec_mux_control_switch_set(port->mux_control_switch,
+				port->mux_control_switch_states[orientation]);
+		if (ret)
+			return ret;
+	}
+
 	port->orientation = orientation;
 	sysfs_notify(&port->dev.kobj, NULL, "orientation");
 	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
@@ -1991,7 +1999,7 @@ struct typec_port *typec_register_port(struct device *parent,
 				       const struct typec_capability *cap)
 {
 	struct typec_port *port;
-	int ret;
+	int ret = 0;
 	int id;
 
 	port = kzalloc(sizeof(*port), GFP_KERNEL);
@@ -2068,6 +2076,22 @@ struct typec_port *typec_register_port(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	if (!port->sw) {
+		/* Try to get typec switch via general mux controller */
+		port->mux_control_switch = typec_mux_control_switch_get(&port->dev);
+		if (IS_ERR(port->mux_control_switch))
+			ret = PTR_ERR(port->mux_control_switch);
+		else if (port->mux_control_switch)
+			ret = device_property_read_u32_array(&port->dev,
+					"mux-control-switch-states",
+					port->mux_control_switch_states,
+					3);
+		if (ret) {
+			put_device(&port->dev);
+			return ERR_PTR(ret);
+		}
+	}
+
 	port->mux = typec_mux_get(&port->dev, NULL);
 	if (IS_ERR(port->mux)) {
 		ret = PTR_ERR(port->mux);
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index aef03eb7e152..15dad2621c83 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -50,6 +50,8 @@ struct typec_port {
 
 	enum typec_orientation		orientation;
 	struct typec_switch		*sw;
+	struct mux_control		*mux_control_switch;
+	int				mux_control_switch_states[3];
 	struct typec_mux		*mux;
 
 	const struct typec_capability	*cap;
diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 9da22ae3006c..6c5c4f07286d 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -11,6 +11,7 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/mux/consumer.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 
@@ -176,6 +177,39 @@ void *typec_switch_get_drvdata(struct typec_switch *sw)
 }
 EXPORT_SYMBOL_GPL(typec_switch_get_drvdata);
 
+struct mux_control *typec_mux_control_switch_get(struct device *dev)
+{
+	if (!device_property_present(dev, "mux-control-names"))
+		return NULL;
+
+	return mux_control_get(dev, "typec-orientation-switch");
+}
+EXPORT_SYMBOL_GPL(typec_mux_control_switch_get);
+
+int typec_mux_control_switch_set(struct mux_control *mc_sw, int state)
+{
+	int ret;
+
+	if (!mc_sw)
+		return 0;
+
+	ret = mux_control_deselect(mc_sw);
+	if (ret)
+		return ret;
+
+	return mux_control_select(mc_sw, state);
+}
+EXPORT_SYMBOL_GPL(typec_mux_control_switch_set);
+
+void typec_mux_control_switch_put(struct mux_control *mc_sw)
+{
+	if (!mc_sw)
+		return;
+
+	return mux_control_put(mc_sw);
+}
+EXPORT_SYMBOL_GPL(typec_mux_control_switch_put);
+
 /* ------------------------------------------------------------------------- */
 
 static int mux_fwnode_match(struct device *dev, const void *fwnode)
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index a9d9957933dc..e0933e205b80 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -27,6 +27,10 @@ void typec_switch_put(struct typec_switch *sw);
 int typec_switch_set(struct typec_switch *sw,
 		     enum typec_orientation orientation);
 
+struct mux_control *typec_mux_control_switch_get(struct device *dev);
+int typec_mux_control_switch_set(struct mux_control *mc_sw, int state);
+void typec_mux_control_switch_put(struct mux_control *mc_sw);
+
 static inline struct typec_switch *typec_switch_get(struct device *dev)
 {
 	return fwnode_typec_switch_get(dev_fwnode(dev));
-- 
2.25.1

