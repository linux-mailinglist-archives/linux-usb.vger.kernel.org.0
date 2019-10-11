Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12825D4460
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2019 17:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728090AbfJKPch (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Oct 2019 11:32:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:33457 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbfJKPch (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 11 Oct 2019 11:32:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 08:32:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="207450455"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2019 08:32:25 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v4 4/9] usb: typec: tcpm: Start using struct typec_operations
Date:   Fri, 11 Oct 2019 18:32:14 +0300
Message-Id: <20191011153219.35701-5-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
References: <20191011153219.35701-1-heikki.krogerus@linux.intel.com>
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
 drivers/usb/typec/tcpm/tcpm.c | 45 ++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5f61d9977a15..bc9edb4c013b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -390,12 +390,6 @@ static enum tcpm_state tcpm_default_state(struct tcpm_port *port)
 	return SRC_UNATTACHED;
 }
 
-static inline
-struct tcpm_port *typec_cap_to_tcpm(const struct typec_capability *cap)
-{
-	return container_of(cap, struct tcpm_port, typec_caps);
-}
-
 static bool tcpm_port_is_disconnected(struct tcpm_port *port)
 {
 	return (!port->attached && port->cc1 == TYPEC_CC_OPEN &&
@@ -3970,10 +3964,9 @@ void tcpm_pd_hard_reset(struct tcpm_port *port)
 }
 EXPORT_SYMBOL_GPL(tcpm_pd_hard_reset);
 
-static int tcpm_dr_set(const struct typec_capability *cap,
-		       enum typec_data_role data)
+static int tcpm_dr_set(struct typec_port *p, enum typec_data_role data)
 {
-	struct tcpm_port *port = typec_cap_to_tcpm(cap);
+	struct tcpm_port *port = typec_get_drvdata(p);
 	int ret;
 
 	mutex_lock(&port->swap_lock);
@@ -4038,10 +4031,9 @@ static int tcpm_dr_set(const struct typec_capability *cap,
 	return ret;
 }
 
-static int tcpm_pr_set(const struct typec_capability *cap,
-		       enum typec_role role)
+static int tcpm_pr_set(struct typec_port *p, enum typec_role role)
 {
-	struct tcpm_port *port = typec_cap_to_tcpm(cap);
+	struct tcpm_port *port = typec_get_drvdata(p);
 	int ret;
 
 	mutex_lock(&port->swap_lock);
@@ -4082,10 +4074,9 @@ static int tcpm_pr_set(const struct typec_capability *cap,
 	return ret;
 }
 
-static int tcpm_vconn_set(const struct typec_capability *cap,
-			  enum typec_role role)
+static int tcpm_vconn_set(struct typec_port *p, enum typec_role role)
 {
-	struct tcpm_port *port = typec_cap_to_tcpm(cap);
+	struct tcpm_port *port = typec_get_drvdata(p);
 	int ret;
 
 	mutex_lock(&port->swap_lock);
@@ -4122,9 +4113,9 @@ static int tcpm_vconn_set(const struct typec_capability *cap,
 	return ret;
 }
 
-static int tcpm_try_role(const struct typec_capability *cap, int role)
+static int tcpm_try_role(struct typec_port *p, int role)
 {
-	struct tcpm_port *port = typec_cap_to_tcpm(cap);
+	struct tcpm_port *port = typec_get_drvdata(p);
 	struct tcpc_dev	*tcpc = port->tcpc;
 	int ret = 0;
 
@@ -4331,10 +4322,9 @@ static void tcpm_init(struct tcpm_port *port)
 	tcpm_set_state(port, PORT_RESET, 0);
 }
 
-static int tcpm_port_type_set(const struct typec_capability *cap,
-			      enum typec_port_type type)
+static int tcpm_port_type_set(struct typec_port *p, enum typec_port_type type)
 {
-	struct tcpm_port *port = typec_cap_to_tcpm(cap);
+	struct tcpm_port *port = typec_get_drvdata(p);
 
 	mutex_lock(&port->lock);
 	if (type == port->port_type)
@@ -4359,6 +4349,14 @@ static int tcpm_port_type_set(const struct typec_capability *cap,
 	return 0;
 }
 
+static const struct typec_operations tcpm_ops = {
+	.try_role = tcpm_try_role,
+	.dr_set = tcpm_dr_set,
+	.pr_set = tcpm_pr_set,
+	.vconn_set = tcpm_vconn_set,
+	.port_type_set = tcpm_port_type_set
+};
+
 void tcpm_tcpc_reset(struct tcpm_port *port)
 {
 	mutex_lock(&port->lock);
@@ -4772,11 +4770,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	port->typec_caps.fwnode = tcpc->fwnode;
 	port->typec_caps.revision = 0x0120;	/* Type-C spec release 1.2 */
 	port->typec_caps.pd_revision = 0x0300;	/* USB-PD spec release 3.0 */
-	port->typec_caps.dr_set = tcpm_dr_set;
-	port->typec_caps.pr_set = tcpm_pr_set;
-	port->typec_caps.vconn_set = tcpm_vconn_set;
-	port->typec_caps.try_role = tcpm_try_role;
-	port->typec_caps.port_type_set = tcpm_port_type_set;
+	port->typec_caps.driver_data = port;
+	port->typec_caps.ops = &tcpm_ops;
 
 	port->partner_desc.identity = &port->partner_ident;
 	port->port_type = port->typec_caps.type;
-- 
2.23.0

