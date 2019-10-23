Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0954E1E5A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2019 16:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404610AbfJWOjy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Oct 2019 10:39:54 -0400
Received: from mga12.intel.com ([192.55.52.136]:39183 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390265AbfJWOjx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 23 Oct 2019 10:39:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 07:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="209934356"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2019 07:39:51 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 07/18] usb: typec: hd3ss3220: Start using struct typec_operations
Date:   Wed, 23 Oct 2019 17:39:28 +0300
Message-Id: <20191023143939.39668-8-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
References: <20191023143939.39668-1-heikki.krogerus@linux.intel.com>
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
 drivers/usb/typec/hd3ss3220.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 8afaf5768a17..db09fa0d85f2 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -37,7 +37,6 @@ struct hd3ss3220 {
 	struct regmap *regmap;
 	struct usb_role_switch	*role_sw;
 	struct typec_port *port;
-	struct typec_capability typec_cap;
 };
 
 static int hd3ss3220_set_source_pref(struct hd3ss3220 *hd3ss3220, int src_pref)
@@ -73,11 +72,9 @@ static enum usb_role hd3ss3220_get_attached_state(struct hd3ss3220 *hd3ss3220)
 	return attached_state;
 }
 
-static int hd3ss3220_dr_set(const struct typec_capability *cap,
-			    enum typec_data_role role)
+static int hd3ss3220_dr_set(struct typec_port *port, enum typec_data_role role)
 {
-	struct hd3ss3220 *hd3ss3220 = container_of(cap, struct hd3ss3220,
-						   typec_cap);
+	struct hd3ss3220 *hd3ss3220 = typec_get_drvdata(port);
 	enum usb_role role_val;
 	int pref, ret = 0;
 
@@ -98,6 +95,10 @@ static int hd3ss3220_dr_set(const struct typec_capability *cap,
 	return ret;
 }
 
+static const struct typec_operations hd3ss3220_ops = {
+	.dr_set = hd3ss3220_dr_set
+};
+
 static void hd3ss3220_set_role(struct hd3ss3220 *hd3ss3220)
 {
 	enum usb_role role_state = hd3ss3220_get_attached_state(hd3ss3220);
@@ -152,6 +153,7 @@ static const struct regmap_config config = {
 static int hd3ss3220_probe(struct i2c_client *client,
 		const struct i2c_device_id *id)
 {
+	struct typec_capability typec_cap = { };
 	struct hd3ss3220 *hd3ss3220;
 	struct fwnode_handle *connector;
 	int ret;
@@ -180,13 +182,13 @@ static int hd3ss3220_probe(struct i2c_client *client,
 	if (IS_ERR(hd3ss3220->role_sw))
 		return PTR_ERR(hd3ss3220->role_sw);
 
-	hd3ss3220->typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
-	hd3ss3220->typec_cap.dr_set = hd3ss3220_dr_set;
-	hd3ss3220->typec_cap.type = TYPEC_PORT_DRP;
-	hd3ss3220->typec_cap.data = TYPEC_PORT_DRD;
+	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
+	typec_cap.driver_data = hd3ss3220;
+	typec_cap.type = TYPEC_PORT_DRP;
+	typec_cap.data = TYPEC_PORT_DRD;
+	typec_cap.ops = &hd3ss3220_ops;
 
-	hd3ss3220->port = typec_register_port(&client->dev,
-					      &hd3ss3220->typec_cap);
+	hd3ss3220->port = typec_register_port(&client->dev, &typec_cap);
 	if (IS_ERR(hd3ss3220->port)) {
 		ret = PTR_ERR(hd3ss3220->port);
 		goto err_put_role;
-- 
2.23.0

