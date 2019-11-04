Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3667EE227
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfKDOYr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:24:47 -0500
Received: from mga02.intel.com ([134.134.136.20]:3680 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728012AbfKDOYr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 09:24:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 06:24:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="212324046"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 06:24:45 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 05/18] usb: typec: tps6598x: Start using struct typec_operations
Date:   Mon,  4 Nov 2019 17:24:22 +0300
Message-Id: <20191104142435.29960-6-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Supplying the operation callbacks as part of a struct
typec_operations instead of as part of struct
typec_capability during port registration. After this there
is not need to keep the capabilities stored anywhere in the
driver.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/typec/tps6598x.c | 49 +++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index a38d1409f15b..0698addd1185 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -94,7 +94,6 @@ struct tps6598x {
 	struct typec_port *port;
 	struct typec_partner *partner;
 	struct usb_pd_identity partner_identity;
-	struct typec_capability typec_cap;
 };
 
 /*
@@ -307,11 +306,10 @@ static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
 	return 0;
 }
 
-static int
-tps6598x_dr_set(const struct typec_capability *cap, enum typec_data_role role)
+static int tps6598x_dr_set(struct typec_port *port, enum typec_data_role role)
 {
-	struct tps6598x *tps = container_of(cap, struct tps6598x, typec_cap);
 	const char *cmd = (role == TYPEC_DEVICE) ? "SWUF" : "SWDF";
+	struct tps6598x *tps = typec_get_drvdata(port);
 	u32 status;
 	int ret;
 
@@ -338,11 +336,10 @@ tps6598x_dr_set(const struct typec_capability *cap, enum typec_data_role role)
 	return ret;
 }
 
-static int
-tps6598x_pr_set(const struct typec_capability *cap, enum typec_role role)
+static int tps6598x_pr_set(struct typec_port *port, enum typec_role role)
 {
-	struct tps6598x *tps = container_of(cap, struct tps6598x, typec_cap);
 	const char *cmd = (role == TYPEC_SINK) ? "SWSk" : "SWSr";
+	struct tps6598x *tps = typec_get_drvdata(port);
 	u32 status;
 	int ret;
 
@@ -369,6 +366,11 @@ tps6598x_pr_set(const struct typec_capability *cap, enum typec_role role)
 	return ret;
 }
 
+static const struct typec_operations tps6598x_ops = {
+	.dr_set = tps6598x_dr_set,
+	.pr_set = tps6598x_pr_set,
+};
+
 static irqreturn_t tps6598x_interrupt(int irq, void *data)
 {
 	struct tps6598x *tps = data;
@@ -448,6 +450,7 @@ static const struct regmap_config tps6598x_regmap_config = {
 
 static int tps6598x_probe(struct i2c_client *client)
 {
+	struct typec_capability typec_cap = { };
 	struct tps6598x *tps;
 	u32 status;
 	u32 conf;
@@ -492,40 +495,40 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
-	tps->typec_cap.revision = USB_TYPEC_REV_1_2;
-	tps->typec_cap.pd_revision = 0x200;
-	tps->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
-	tps->typec_cap.pr_set = tps6598x_pr_set;
-	tps->typec_cap.dr_set = tps6598x_dr_set;
+	typec_cap.revision = USB_TYPEC_REV_1_2;
+	typec_cap.pd_revision = 0x200;
+	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
+	typec_cap.driver_data = tps;
+	typec_cap.ops = &tps6598x_ops;
 
 	switch (TPS_SYSCONF_PORTINFO(conf)) {
 	case TPS_PORTINFO_SINK_ACCESSORY:
 	case TPS_PORTINFO_SINK:
-		tps->typec_cap.type = TYPEC_PORT_SNK;
-		tps->typec_cap.data = TYPEC_PORT_UFP;
+		typec_cap.type = TYPEC_PORT_SNK;
+		typec_cap.data = TYPEC_PORT_UFP;
 		break;
 	case TPS_PORTINFO_DRP_UFP_DRD:
 	case TPS_PORTINFO_DRP_DFP_DRD:
-		tps->typec_cap.type = TYPEC_PORT_DRP;
-		tps->typec_cap.data = TYPEC_PORT_DRD;
+		typec_cap.type = TYPEC_PORT_DRP;
+		typec_cap.data = TYPEC_PORT_DRD;
 		break;
 	case TPS_PORTINFO_DRP_UFP:
-		tps->typec_cap.type = TYPEC_PORT_DRP;
-		tps->typec_cap.data = TYPEC_PORT_UFP;
+		typec_cap.type = TYPEC_PORT_DRP;
+		typec_cap.data = TYPEC_PORT_UFP;
 		break;
 	case TPS_PORTINFO_DRP_DFP:
-		tps->typec_cap.type = TYPEC_PORT_DRP;
-		tps->typec_cap.data = TYPEC_PORT_DFP;
+		typec_cap.type = TYPEC_PORT_DRP;
+		typec_cap.data = TYPEC_PORT_DFP;
 		break;
 	case TPS_PORTINFO_SOURCE:
-		tps->typec_cap.type = TYPEC_PORT_SRC;
-		tps->typec_cap.data = TYPEC_PORT_DFP;
+		typec_cap.type = TYPEC_PORT_SRC;
+		typec_cap.data = TYPEC_PORT_DFP;
 		break;
 	default:
 		return -ENODEV;
 	}
 
-	tps->port = typec_register_port(&client->dev, &tps->typec_cap);
+	tps->port = typec_register_port(&client->dev, &typec_cap);
 	if (IS_ERR(tps->port))
 		return PTR_ERR(tps->port);
 
-- 
2.24.0.rc1

