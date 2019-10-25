Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67BFDE458F
	for <lists+linux-usb@lfdr.de>; Fri, 25 Oct 2019 10:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437888AbfJYIXr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Oct 2019 04:23:47 -0400
Received: from mga07.intel.com ([134.134.136.100]:36083 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437884AbfJYIXq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 25 Oct 2019 04:23:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Oct 2019 01:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; 
   d="scan'208";a="210332118"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 01:23:44 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 10/18] usb: typec: hd3ss3220: Give the connector fwnode to the port device
Date:   Fri, 25 Oct 2019 11:23:16 +0300
Message-Id: <20191025082324.75731-11-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
References: <20191025082324.75731-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The driver already finds the node in order to get reference
to the USB role switch.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Tested-by: Biju Das <biju.das@bp.renesas.com>
---
 drivers/usb/typec/hd3ss3220.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index db09fa0d85f2..323dfa8160ab 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -178,15 +178,17 @@ static int hd3ss3220_probe(struct i2c_client *client,
 		return -ENODEV;
 
 	hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
-	fwnode_handle_put(connector);
-	if (IS_ERR(hd3ss3220->role_sw))
-		return PTR_ERR(hd3ss3220->role_sw);
+	if (IS_ERR(hd3ss3220->role_sw)) {
+		ret = PTR_ERR(hd3ss3220->role_sw);
+		goto err_put_fwnode;
+	}
 
 	typec_cap.prefer_role = TYPEC_NO_PREFERRED_ROLE;
 	typec_cap.driver_data = hd3ss3220;
 	typec_cap.type = TYPEC_PORT_DRP;
 	typec_cap.data = TYPEC_PORT_DRD;
 	typec_cap.ops = &hd3ss3220_ops;
+	typec_cap.fwnode = connector;
 
 	hd3ss3220->port = typec_register_port(&client->dev, &typec_cap);
 	if (IS_ERR(hd3ss3220->port)) {
@@ -220,6 +222,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
 	if (ret < 0)
 		goto err_unreg_port;
 
+	fwnode_handle_put(connector);
+
 	dev_info(&client->dev, "probed revision=0x%x\n", ret);
 
 	return 0;
@@ -227,6 +231,8 @@ static int hd3ss3220_probe(struct i2c_client *client,
 	typec_unregister_port(hd3ss3220->port);
 err_put_role:
 	usb_role_switch_put(hd3ss3220->role_sw);
+err_put_fwnode:
+	fwnode_handle_put(connector);
 
 	return ret;
 }
-- 
2.23.0

