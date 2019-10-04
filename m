Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B686CBE9F
	for <lists+linux-usb@lfdr.de>; Fri,  4 Oct 2019 17:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389583AbfJDPI2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Oct 2019 11:08:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:58250 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388802AbfJDPI2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Oct 2019 11:08:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Oct 2019 08:08:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; 
   d="scan'208";a="205877586"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Oct 2019 08:08:27 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org
Subject: [PATCH v2 6/7] usb: typec: ucsi: Start using struct typec_operations
Date:   Fri,  4 Oct 2019 18:08:16 +0300
Message-Id: <20191004150817.45413-7-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004150817.45413-1-heikki.krogerus@linux.intel.com>
References: <20191004150817.45413-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Supplying the operation callbacks as part of a struct
typec_operations instead of as part of struct
typec_capability during port registration.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ba288b964dc8..edd722fb88b8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -17,9 +17,6 @@
 #include "ucsi.h"
 #include "trace.h"
 
-#define to_ucsi_connector(_cap_) container_of(_cap_, struct ucsi_connector, \
-					      typec_cap)
-
 /*
  * UCSI_TIMEOUT_MS - PPM communication timeout
  *
@@ -713,10 +710,9 @@ static int ucsi_role_cmd(struct ucsi_connector *con, struct ucsi_control *ctrl)
 	return ret;
 }
 
-static int
-ucsi_dr_swap(const struct typec_capability *cap, enum typec_data_role role)
+static int ucsi_dr_swap(struct typec_port *port, enum typec_data_role role)
 {
-	struct ucsi_connector *con = to_ucsi_connector(cap);
+	struct ucsi_connector *con = typec_get_drvdata(port);
 	struct ucsi_control ctrl;
 	int ret = 0;
 
@@ -748,10 +744,9 @@ ucsi_dr_swap(const struct typec_capability *cap, enum typec_data_role role)
 	return ret < 0 ? ret : 0;
 }
 
-static int
-ucsi_pr_swap(const struct typec_capability *cap, enum typec_role role)
+static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 {
-	struct ucsi_connector *con = to_ucsi_connector(cap);
+	struct ucsi_connector *con = typec_get_drvdata(port);
 	struct ucsi_control ctrl;
 	int ret = 0;
 
@@ -788,6 +783,11 @@ ucsi_pr_swap(const struct typec_capability *cap, enum typec_role role)
 	return ret;
 }
 
+static const struct typec_operations ucsi_ops = {
+	.dr_set = ucsi_dr_swap,
+	.pr_set = ucsi_pr_swap
+};
+
 static struct fwnode_handle *ucsi_find_fwnode(struct ucsi_connector *con)
 {
 	struct fwnode_handle *fwnode;
@@ -843,8 +843,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 		*accessory = TYPEC_ACCESSORY_DEBUG;
 
 	cap->fwnode = ucsi_find_fwnode(con);
-	cap->dr_set = ucsi_dr_swap;
-	cap->pr_set = ucsi_pr_swap;
+	cap->driver_data = con;
+	cap->ops = &ucsi_ops;
 
 	/* Register the connector */
 	con->port = typec_register_port(ucsi->dev, cap);
-- 
2.23.0

