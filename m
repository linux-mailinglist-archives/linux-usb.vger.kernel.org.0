Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6C6412D09F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbfL3O0c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:32 -0500
Received: from mga06.intel.com ([134.134.136.31]:56449 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727546AbfL3O0b (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:31 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233481"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:30 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 12/15] usb: typec: Give the mux drivers all the details regarding the port state
Date:   Mon, 30 Dec 2019 17:26:08 +0300
Message-Id: <20191230142611.24921-13-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Passing all the details that the alternate mode drivers
provide to the mux drivers during mode changes.

The mux drivers will in practice need to be able to make
decisions on their own. It is not enough that they get only
the requested port state. With the Thunderbolt 3 alternate
mode for example the mux driver will need to consider also
the capabilities of the cable before configuring the mux.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/bus.c             | 29 ++++++++++++++++++++---------
 drivers/usb/typec/class.c           |  6 +++++-
 drivers/usb/typec/mux/pi3usb30532.c |  5 +++--
 include/linux/usb/typec_mux.h       | 10 +++++++++-
 4 files changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index 76e024be2502..fab0794d1302 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -10,12 +10,23 @@
 
 #include "bus.h"
 
-static inline int typec_altmode_set_mux(struct altmode *alt, u8 state)
+static inline int
+typec_altmode_set_mux(struct altmode *alt, unsigned long conf, void *data)
 {
-	return alt->mux ? alt->mux->set(alt->mux, state) : 0;
+	struct typec_mux_state state;
+
+	if (!alt->mux)
+		return 0;
+
+	state.alt = &alt->adev;
+	state.mode = conf;
+	state.data = data;
+
+	return alt->mux->set(alt->mux, &state);
 }
 
-static int typec_altmode_set_state(struct typec_altmode *adev, int state)
+static int typec_altmode_set_state(struct typec_altmode *adev,
+				   unsigned long conf, void *data)
 {
 	bool is_port = is_typec_port(adev->dev.parent);
 	struct altmode *port_altmode;
@@ -23,11 +34,11 @@ static int typec_altmode_set_state(struct typec_altmode *adev, int state)
 
 	port_altmode = is_port ? to_altmode(adev) : to_altmode(adev)->partner;
 
-	ret = typec_altmode_set_mux(port_altmode, state);
+	ret = typec_altmode_set_mux(port_altmode, conf, data);
 	if (ret)
 		return ret;
 
-	blocking_notifier_call_chain(&port_altmode->nh, state, NULL);
+	blocking_notifier_call_chain(&port_altmode->nh, conf, NULL);
 
 	return 0;
 }
@@ -67,7 +78,7 @@ int typec_altmode_notify(struct typec_altmode *adev,
 	is_port = is_typec_port(adev->dev.parent);
 	partner = altmode->partner;
 
-	ret = typec_altmode_set_mux(is_port ? altmode : partner, (u8)conf);
+	ret = typec_altmode_set_mux(is_port ? altmode : partner, conf, data);
 	if (ret)
 		return ret;
 
@@ -107,7 +118,7 @@ int typec_altmode_enter(struct typec_altmode *adev, u32 *vdo)
 		return -EPERM;
 
 	/* Moving to USB Safe State */
-	ret = typec_altmode_set_state(adev, TYPEC_STATE_SAFE);
+	ret = typec_altmode_set_state(adev, TYPEC_STATE_SAFE, NULL);
 	if (ret)
 		return ret;
 
@@ -135,7 +146,7 @@ int typec_altmode_exit(struct typec_altmode *adev)
 		return -EOPNOTSUPP;
 
 	/* Moving to USB Safe State */
-	ret = typec_altmode_set_state(adev, TYPEC_STATE_SAFE);
+	ret = typec_altmode_set_state(adev, TYPEC_STATE_SAFE, NULL);
 	if (ret)
 		return ret;
 
@@ -388,7 +399,7 @@ static int typec_remove(struct device *dev)
 		drv->remove(to_typec_altmode(dev));
 
 	if (adev->active) {
-		WARN_ON(typec_altmode_set_state(adev, TYPEC_STATE_SAFE));
+		WARN_ON(typec_altmode_set_state(adev, TYPEC_STATE_SAFE, NULL));
 		typec_altmode_update_active(adev, false);
 	}
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index c744928d6525..70f3c5e9eb0c 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1539,7 +1539,11 @@ EXPORT_SYMBOL_GPL(typec_get_orientation);
  */
 int typec_set_mode(struct typec_port *port, int mode)
 {
-	return port->mux ? port->mux->set(port->mux, mode) : 0;
+	struct typec_mux_state state = { };
+
+	state.mode = mode;
+
+	return port->mux ? port->mux->set(port->mux, &state) : 0;
 }
 EXPORT_SYMBOL_GPL(typec_set_mode);
 
diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 5585b109095b..46457c133d2b 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -73,7 +73,8 @@ static int pi3usb30532_sw_set(struct typec_switch *sw,
 	return ret;
 }
 
-static int pi3usb30532_mux_set(struct typec_mux *mux, int state)
+static int
+pi3usb30532_mux_set(struct typec_mux *mux, struct typec_mux_state *state)
 {
 	struct pi3usb30532 *pi = typec_mux_get_drvdata(mux);
 	u8 new_conf;
@@ -82,7 +83,7 @@ static int pi3usb30532_mux_set(struct typec_mux *mux, int state)
 	mutex_lock(&pi->lock);
 	new_conf = pi->conf;
 
-	switch (state) {
+	switch (state->mode) {
 	case TYPEC_STATE_SAFE:
 		new_conf = (new_conf & PI3USB30532_CONF_SWAP) |
 			   PI3USB30532_CONF_OPEN;
diff --git a/include/linux/usb/typec_mux.h b/include/linux/usb/typec_mux.h
index 873ace5b0cf8..be7292c0be5e 100644
--- a/include/linux/usb/typec_mux.h
+++ b/include/linux/usb/typec_mux.h
@@ -8,6 +8,7 @@
 struct device;
 struct typec_mux;
 struct typec_switch;
+struct typec_altmode;
 struct fwnode_handle;
 
 typedef int (*typec_switch_set_fn_t)(struct typec_switch *sw,
@@ -29,7 +30,14 @@ void typec_switch_unregister(struct typec_switch *sw);
 void typec_switch_set_drvdata(struct typec_switch *sw, void *data);
 void *typec_switch_get_drvdata(struct typec_switch *sw);
 
-typedef int (*typec_mux_set_fn_t)(struct typec_mux *mux, int state);
+struct typec_mux_state {
+	struct typec_altmode *alt;
+	unsigned long mode;
+	void *data;
+};
+
+typedef int (*typec_mux_set_fn_t)(struct typec_mux *mux,
+				  struct typec_mux_state *state);
 
 struct typec_mux_desc {
 	struct fwnode_handle *fwnode;
-- 
2.24.1

