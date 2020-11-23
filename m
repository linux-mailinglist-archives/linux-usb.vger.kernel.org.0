Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D25702C0CF8
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbgKWOJM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:09:12 -0500
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:60993
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730077AbgKWOJM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Nov 2020 09:09:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nb26eYQDG0h8PHA0i2qKfgdRPEVQ3eJZ6jzd3VgrGBkT48kUTdSsudWf5VkNkHvDBD7p6cNxHVRu5BJukOciNfkrisjArp6su9jF+0lgNTfmuQxVIyavKeJFIyq8OchIKeJxJjJ4QHc7szXdcLD5EwpXYMchiLK7H1Bu1zcg5mug3N+8PIk1keKXZH0VhRlaZljs5SQJl6tAJ0EXe5GChSyGS3UkyB7QNldA+kH5G0ZNKZM0bMLdfo7HWVK6gjSAXWu/T8RMtnsPsH59KNm63wJdlfR6FyuhQ7wOzsMZvgl2h4IOAlRGj40Fe51DBw+DuvXNGusRAXSNCWZEp42e6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjAeAgCr9DAzbj24obIXr3nxzSsrHHpHtmmyA/ZiAag=;
 b=ehPJ0aThu/7vfSsc+gPb6x9AH+EANfaAJYPtZBZkvcFyeYGHeFXI1PPYYvEcqHezz/7PqfmFL487igtlEQ264rcRHNBxhDL2UH4tn59R7Lrd0EetzD/jNeAlaO5lYsxCUnWQPe1UjsnRq3IcctXAXtR3Hr/lOLtH5Eeewzv/oBqKQRoE4txCfmm8CH+GEvZToXT8to59HHOv61TSy+rzuJAWgp/0esJmdAu403DDJBzLjaVwztaoLo8yzg2WeRIc8izz+mMSOZwVdV7cRbp4UbJmQF5SpeLL1Iq7+0LoPo6V06fFUSt7bZpfsayhAb0oLTLutLFXbdsJ+33lQp5Bzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjAeAgCr9DAzbj24obIXr3nxzSsrHHpHtmmyA/ZiAag=;
 b=q/psueN1bXVPN4NhPvvWnY7/UGcPqxEpQy7jUcP7xwl//FKz7l14fAPb/qTa07xS605nBIX/zCYF5ofbxlvG9XvWTdZBpXh6xd0BAX6WtkASrzMTtP7I0R81zy929Vc+L2sASj5JkXW/Ne41iA+pL1P9dyGsBmscA1kPFp6BPYw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR0402MB3760.eurprd04.prod.outlook.com (2603:10a6:803:23::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 14:09:07 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::b035:d158:c99c:57c6%7]) with mapi id 15.20.3589.028; Mon, 23 Nov 2020
 14:09:07 +0000
From:   Li Jun <jun.li@nxp.com>
To:     heikki.krogerus@linux.intel.com, robh+dt@kernel.org,
        rafael@kernel.org
Cc:     gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, lee.jones@linaro.org,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        laurent.pinchart+renesas@ideasonboard.com,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-imx@nxp.com, peter.chen@nxp.com
Subject: [PATCH v6 5/6] usb: typec: mux: add typec switch via general mux control
Date:   Mon, 23 Nov 2020 22:01:35 +0800
Message-Id: <1606140096-1382-5-git-send-email-jun.li@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
References: <1606140096-1382-1-git-send-email-jun.li@nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR06CA0164.apcprd06.prod.outlook.com
 (2603:1096:1:1e::18) To VE1PR04MB6528.eurprd04.prod.outlook.com
 (2603:10a6:803:127::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR06CA0164.apcprd06.prod.outlook.com (2603:1096:1:1e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 14:09:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36fb68ba-b925-41c6-6a74-08d88fb95783
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3760F273E55EAB1680BAF64589FC0@VI1PR0402MB3760.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GIztky3/dNvWt6U1jDz7STeIjMXt/1l+VYskMeEzuJGR2ZE5uSeSpkSHtx9zU5MFkw6rmhMxa1xuaQL301el6FDG1mQ3LUELqrQOQGemJX0qZUom3a9/LF7H6ziQ0n0R1LAe2haMfLqm12P3s8+zY90IdGc+MmDAlNV0Hvkn7m4HC1j9/iZ6PrTr13fn7RDDls0SJYLIk4Co4qNsMqo/ZCgQoQYt8MSPwstYohaABcGXzF0FZ0UOQ7BIgcdCic8yk10gap/yOLGZyE/kui6iVJUL0psRtbcGPcPjI9SEFVellu3+J0l4Zu9AsXaXlEZziejRtpetXIlNWjLtaKaYJqGXth2LdXjTE1u4bWrpqJWTuLfFF8pAR4BLkRiSENAH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(4326008)(186003)(16526019)(83380400001)(26005)(36756003)(86362001)(69590400008)(6666004)(2906002)(66556008)(6512007)(66946007)(478600001)(7416002)(2616005)(8936002)(956004)(316002)(52116002)(66476007)(6486002)(8676002)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ISODz5JpFdNOpRdJG61AZppUeeeO9yfoNiM0EERe9cSU88V3CzIIOL0dsVXEKaOsaoQDsp4SSTAJyr7zi9SyCHUeeVHU8vQ99+VyjQ+9OuFvx2akKXEsUpgUZ1091jr1IE2N5h9EOaX4uq3Wk5LmCXny+acXjt+swZigxFY52iiJzEUyVgIG43ahXsJIdC4p4jyD2f4x/OWksqE5n/nEhIfgv4Fs16MCIFxNPJPJMU+xeWUvg5vKDDhy2lsaksk3r+SwrutKclg9ALSfF2xedmyoO9pnn/3eUChDlE5qEi4uOM4OmNDmW8nlnN3ybsifE1qwXCClE7E5MTmmkT0WkgK6YpcycrClLmOJsrHeKF+7nbhnT/why7Q5DPzKURbEFZwGGccCIfJVNrH6uyAwDh18sXhfNIdPwuYR1BKEBwuJj/PolCbVTkHTp/0Re1aubSKeYZt/xh/2ux+XVAESdoC2ipjvLVVQOoAIpfPHiQqcwuCiarO/zibHOPIuQ3BulzVuYmrXolJN/xym48hPmuFTeOi0VsLLJyKQylpLUIVzEhjr5YGORi+VlUra4zhrMwc8CLDdaV43+J/sPYkWGYdndTk5HcoYzjRUnfUtfBg3c7iEEuUvfi+kK4HNcrMNjbv/ROy79VPGwRy64vUMsNQkPEFgESuxpkaP8c3KWd2CIfF5NkedPVIGN3Jclqt2Q6xlYMwYqw0+Gz0wiJCp42cJkObI010lHX+lOKcRoC0CjybTqpTA0obw2eqlgQV5eaAZQ0deyfYY2XKJgopZ/nFQpzFCnDQEQv2fG6A39UizwVpgm/RSu/Jwq0IeuunYSYBpWfSMYcJPFoRaKeF0VtFn92+LBbDqcuV00Tnr/LJIr7Lhn1xvVZAe8OzJblMqnwCHmPySii+zjFzZE7B5BQ==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fb68ba-b925-41c6-6a74-08d88fb95783
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 14:09:07.4776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dlleas4Ri9NlaWVngehRyuIlKZ4XkofZaSUhc7Nh881bugMi+BGYdxSNmb41rmW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3760
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The general mux controller can be easily extended to support
various mux selection, this especially fits typec orientation
switch block with a dedicated driver.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
New patch for v6.

 drivers/usb/typec/bus.h       |  1 +
 drivers/usb/typec/mux.c       | 44 ++++++++++++++++++++++++++++++++++++++++---
 include/linux/usb/typec_mux.h |  7 +------
 3 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 8ba8112..235ee82 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -38,6 +38,7 @@ extern struct class typec_mux_class;
 struct typec_switch {
 	struct device dev;
 	typec_switch_set_fn_t set;
+	struct mux_control *mux_ctrl;
 };
 
 struct typec_mux {
diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 0219aa4..afc4537 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -14,6 +14,7 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/mux/consumer.h>
 
 #include "bus.h"
 
@@ -42,10 +43,8 @@ static void *typec_switch_match(struct device_connection *con, int ep,
 	if (con->id && !fwnode_is_compatible(con->fwnode, con->id) &&
 		       !fwnode_property_present(con->fwnode, con->id))
 		return NULL;
-
 	dev = class_find_device(&typec_mux_class, NULL, con->fwnode,
 				switch_fwnode_match);
-
 	return dev ? to_typec_switch(dev) : ERR_PTR(-EPROBE_DEFER);
 }
 
@@ -71,6 +70,19 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
 
+struct typec_switch *typec_switch_get(struct device *dev)
+{
+	struct mux_control *typec_mc = mux_control_get(dev->parent,
+				       "mux-typec-switch");
+	struct typec_switch *sw = fwnode_typec_switch_get(dev_fwnode(dev));
+
+	if (!IS_ERR_OR_NULL(sw) && !IS_ERR_OR_NULL(typec_mc))
+		sw->mux_ctrl = typec_mc;
+
+	return sw;
+}
+EXPORT_SYMBOL_GPL(typec_switch_get);
+
 /**
  * typec_put_switch - Release USB Type-C orientation switch
  * @sw: USB Type-C orientation switch
@@ -142,13 +154,39 @@ typec_switch_register(struct device *parent,
 }
 EXPORT_SYMBOL_GPL(typec_switch_register);
 
+static int typec_switch_mux_ctrl(struct mux_control *sw_mux,
+				enum typec_orientation orientation)
+{
+	int ret = 0;
+
+	if (!sw_mux)
+		return -EINVAL;
+
+	switch (orientation) {
+	case TYPEC_ORIENTATION_NORMAL:
+		ret = mux_control_select(sw_mux, 1);
+		break;
+	case TYPEC_ORIENTATION_REVERSE:
+		ret = mux_control_select(sw_mux, 0);
+		break;
+	case TYPEC_ORIENTATION_NONE:
+		ret = mux_control_deselect(sw_mux);
+		break;
+	}
+
+	return ret;
+}
+
 int typec_switch_set(struct typec_switch *sw,
 		     enum typec_orientation orientation)
 {
 	if (IS_ERR_OR_NULL(sw))
 		return 0;
 
-	return sw->set(sw, orientation);
+	if (sw->mux_ctrl)
+		return typec_switch_mux_ctrl(sw->mux_ctrl, orientation);
+	else
+		return sw->set(sw, orientation);
 }
 EXPORT_SYMBOL_GPL(typec_switch_set);
 
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index a9d9957..e2ea141 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -26,15 +26,10 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode);
 void typec_switch_put(struct typec_switch *sw);
 int typec_switch_set(struct typec_switch *sw,
 		     enum typec_orientation orientation);
-
-static inline struct typec_switch *typec_switch_get(struct device *dev)
-{
-	return fwnode_typec_switch_get(dev_fwnode(dev));
-}
-
 struct typec_switch *
 typec_switch_register(struct device *parent,
 		      const struct typec_switch_desc *desc);
+struct typec_switch *typec_switch_get(struct device *dev);
 void typec_switch_unregister(struct typec_switch *sw);
 
 void typec_switch_set_drvdata(struct typec_switch *sw, void *data);
-- 
2.7.4

