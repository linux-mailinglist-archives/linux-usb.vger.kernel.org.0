Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C90438C20A
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 10:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbhEUIjR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 04:39:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:62594 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232778AbhEUIjR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 May 2021 04:39:17 -0400
IronPort-SDR: 9Lc72ltXXW2q36slIVOMRw03XHD6TmWDu61vfm3/XtCvl0ERB6I+fWJ6gJk4/6B1rnP9DJTZ/d
 KJSH7KZLI2Dw==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188564604"
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208,223";a="188564604"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 01:37:53 -0700
IronPort-SDR: qgMJYNKVtOaHCK1dtgiG/0afWug4IsKXp1ouCpLf+HfRkApptGX9RJBpRFUZifRbOIC3oZwuMy
 5HbLYPtN6pIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,313,1613462400"; 
   d="scan'208,223";a="543967207"
Received: from kuha.fi.intel.com ([10.237.72.162])
  by fmsmga001.fm.intel.com with SMTP; 21 May 2021 01:37:50 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 21 May 2021 11:37:47 +0300
Date:   Fri, 21 May 2021 11:37:47 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Li Jun <jun.li@nxp.com>
Cc:     robh+dt@kernel.org, shawnguo@kernel.org,
        gregkh@linuxfoundation.org, linux@roeck-us.net,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/4] usb: typec: add typec orientation switch support via
 mux controller
Message-ID: <YKdxW8SFntFYcyv+@kuha.fi.intel.com>
References: <1621408490-23811-1-git-send-email-jun.li@nxp.com>
 <1621408490-23811-4-git-send-email-jun.li@nxp.com>
 <YKZXHG7BSSZssiBg@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="uREGkeqe8ZkjR5cd"
Content-Disposition: inline
In-Reply-To: <YKZXHG7BSSZssiBg@kuha.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


--uREGkeqe8ZkjR5cd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, May 20, 2021 at 03:33:36PM +0300, Heikki Krogerus wrote:
> Why not just do that inside fwnode_typec_switch_get() and handle the
> whole thing in drivers/usb/typec/mux.c (or in its own file if you
> prefer)?
> 
> You'll just need to register a "wrapper" Type-C switch object for the
> OF mux controller, but that should not be a problem. That way you
> don't need to export any new functions, touch this file or anything
> else.

I wrote a bit of code just to see how that would look. I'm attaching
you the hack I made. I guess something like that would not be too bad.
A wrapper is probable always a bit clumsy, but I'm not sure that in
this case it's a huge problem. Of course if there are any better
ideas, let's here them :-)


thanks,

-- 
heikki

--uREGkeqe8ZkjR5cd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-usb-typec-mux-Add-wrapper-for-OF-mux-controllers-tha.patch"

From bdd63f82788fe95e056ed85ece939e41cfb862ad Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Fri, 21 May 2021 10:42:23 +0300
Subject: [PATCH] usb: typec: mux: Add wrapper for OF mux controllers that
 handle orientation

Interim. Experiment only.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/Makefile |  1 +
 drivers/usb/typec/mux.c    | 13 +++--
 drivers/usb/typec/mux.h    | 15 ++++++
 drivers/usb/typec/of_mux.c | 97 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 122 insertions(+), 4 deletions(-)
 create mode 100644 drivers/usb/typec/of_mux.c

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index a0adb8947a301..d85231b2fe10b 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
 typec-y				:= class.o mux.o bus.o port-mapper.o
+typec-$(MULTIPLEXER)		+= of_mux.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
 obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
diff --git a/drivers/usb/typec/mux.c b/drivers/usb/typec/mux.c
index 9da22ae3006c9..282622276d97b 100644
--- a/drivers/usb/typec/mux.c
+++ b/drivers/usb/typec/mux.c
@@ -63,6 +63,9 @@ struct typec_switch *fwnode_typec_switch_get(struct fwnode_handle *fwnode)
 
 	sw = fwnode_connection_find_match(fwnode, "orientation-switch", NULL,
 					  typec_switch_match);
+	if (!sw)
+		sw = of_switch_register(fwnode);
+
 	if (!IS_ERR_OR_NULL(sw))
 		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
 
@@ -78,10 +81,12 @@ EXPORT_SYMBOL_GPL(fwnode_typec_switch_get);
  */
 void typec_switch_put(struct typec_switch *sw)
 {
-	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
-		put_device(&sw->dev);
-	}
+	if (IS_ERR_OR_NULL(sw))
+		return;
+
+	module_put(sw->dev.parent->driver->owner);
+	of_switch_unregister(sw);
+	put_device(&sw->dev);
 }
 EXPORT_SYMBOL_GPL(typec_switch_put);
 
diff --git a/drivers/usb/typec/mux.h b/drivers/usb/typec/mux.h
index 4fd9426ee44f6..c99caab766313 100644
--- a/drivers/usb/typec/mux.h
+++ b/drivers/usb/typec/mux.h
@@ -5,8 +5,11 @@
 
 #include <linux/usb/typec_mux.h>
 
+struct of_switch;
+
 struct typec_switch {
 	struct device dev;
+	struct of_switch *osw;
 	typec_switch_set_fn_t set;
 };
 
@@ -18,4 +21,16 @@ struct typec_mux {
 #define to_typec_switch(_dev_) container_of(_dev_, struct typec_switch, dev)
 #define to_typec_mux(_dev_) container_of(_dev_, struct typec_mux, dev)
 
+#ifdef CONFIG_MULTIPLEXER
+struct typec_switch *of_switch_register(struct fwnode_handle *fwnode);
+void of_switch_unregister(struct typec_switch *sw);
+#else
+static inline struct typec_switch *of_switch_register(struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
+
+static inline void of_switch_unregister(struct typec_switch *sw) { }
+#endif /* MULTIPLEXER */
+
 #endif /* __USB_TYPEC_MUX__ */
diff --git a/drivers/usb/typec/of_mux.c b/drivers/usb/typec/of_mux.c
new file mode 100644
index 0000000000000..48686a92331d7
--- /dev/null
+++ b/drivers/usb/typec/of_mux.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Wrapper for mux controllers handling orientation
+ *
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+#include <linux/device.h>
+#include <linux/slab.h>
+#include <linux/of.h>
+#include <linux/mux/consumer.h>
+#include <linux/usb/typec_mux.h>
+
+#include "mux.h"
+
+struct of_switch {
+	struct mux_control *mc;
+	unsigned int state[3];
+};
+
+static int of_switch_set(struct typec_switch *sw, enum typec_orientation orientation)
+{
+	int ret;
+
+	/* Checking has the switch been unregistered - just not released yet */
+	if (!sw->osw)
+		return -ENODEV;
+
+	ret = mux_control_deselect(sw->osw->mc);
+	if (ret)
+		return ret;
+
+	return mux_control_select(sw->osw->mc, sw->osw->state[orientation]);
+}
+
+struct typec_switch *of_switch_register(struct fwnode_handle *fwnode)
+{
+	struct typec_switch_desc desc;
+	struct typec_switch *sw;
+	struct mux_control *mc;
+	unsigned int state[3];
+	struct of_switch *osw;
+	int ret;
+
+	if (!fwnode_property_present(fwnode, "mux-control-names"))
+		return NULL;
+
+	ret = fwnode_property_read_u32_array(fwnode, "mux-control-switch-states",
+					     state, 3);
+	if (ret)
+		return ERR_PTR(ret);
+
+	desc.fwnode = fwnode;
+	desc.set = of_switch_set;
+	desc.name = fwnode_get_name(fwnode);
+	desc.drvdata = NULL;
+
+	sw = typec_switch_register(NULL, &desc);
+	if (IS_ERR(sw))
+		return sw;
+
+	sw->dev.of_node = to_of_node(fwnode);
+
+	mc = mux_control_get(&sw->dev, "typec-orientation-switch");
+	if (IS_ERR_OR_NULL(mc)) {
+		typec_switch_unregister(sw);
+		if (IS_ERR(mc))
+			return ERR_CAST(mc);
+		return ERR_PTR(-ENODEV);
+	}
+
+	osw = kzalloc(sizeof(osw), GFP_KERNEL);
+	if (!osw) {
+		typec_switch_unregister(sw);
+		mux_control_put(mc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	memcpy(osw->state, state, sizeof(unsigned int) * 3);
+	osw->mc = mc;
+	sw->osw = osw;
+
+	return sw;
+}
+
+void of_switch_unregister(struct typec_switch *sw)
+{
+	struct of_switch *osw = sw->osw;
+
+	if (!osw)
+		return;
+
+	sw->osw = NULL;
+	typec_switch_unregister(sw);
+	mux_control_put(osw->mc);
+	kfree(osw);
+}
-- 
2.30.2


--uREGkeqe8ZkjR5cd--
