Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFCAEE22E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbfKDOY4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:24:56 -0500
Received: from mga02.intel.com ([134.134.136.20]:3680 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728795AbfKDOY4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 09:24:56 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 06:24:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="212324058"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 06:24:53 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v4 10/18] usb: typec: hd3ss3220: Give the connector fwnode to the port device
Date:   Mon,  4 Nov 2019 17:24:27 +0300
Message-Id: <20191104142435.29960-11-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
References: <20191104142435.29960-1-heikki.krogerus@linux.intel.com>
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
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
2.24.0.rc1

