Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAADEE228
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 15:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbfKDOYs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 09:24:48 -0500
Received: from mga02.intel.com ([134.134.136.20]:3680 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728012AbfKDOYs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 09:24:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 06:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="212324047"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2019 06:24:46 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, Ajay Gupta <ajayg@nvidia.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v4 06/18] usb: typec: ucsi: Start using struct typec_operations
Date:   Mon,  4 Nov 2019 17:24:23 +0300
Message-Id: <20191104142435.29960-7-heikki.krogerus@linux.intel.com>
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
2.24.0.rc1

