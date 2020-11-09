Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B542AB7B8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Nov 2020 13:05:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729303AbgKIMF2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 07:05:28 -0500
Received: from mga03.intel.com ([134.134.136.65]:60335 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726956AbgKIMF2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 9 Nov 2020 07:05:28 -0500
IronPort-SDR: sXDwvxZvqExsDXpM1ne7s+yXy9Z9wLcd6Qj3NZh8OQJ7A3E2N8a5nHlHfYEaSEQxKR/QFkIOEL
 OC0neCGtlISg==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="169901040"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="169901040"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 04:05:26 -0800
IronPort-SDR: 1kDXhZs0u7OIwVKtsy6RjqE4ZwYsXFC60ItyfqEgZVvM5JW6sKkrFkz+cSZMO11h2bPBruPkQO
 rI/AACVByrEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="427969644"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2020 04:05:25 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: Add typec_enter_usb() helper function
Date:   Mon,  9 Nov 2020 15:05:24 +0300
Message-Id: <20201109120524.50255-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This function configures the muxes according to the
requested USB mode in the Enter_USB Message that was
communicated with the partner.

In practice the function just fills struct typec_mux_state
for the caller by extracting the connector mode (so USB
mode) from the EUDO (Enter_USB Data Object), and then passes
that structure to typec_mux_set().

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 32 ++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 35eec707cb512..22f82e924d585 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/usb/pd.h>
 
 #include "bus.h"
 
@@ -1579,6 +1580,37 @@ int typec_set_mode(struct typec_port *port, int mode)
 }
 EXPORT_SYMBOL_GPL(typec_set_mode);
 
+/**
+ * typec_enter_usb - Set USB Mode for USB Type-C connector
+ * @port: USB Type-C connector
+ * @data: Enter_USB Message details.
+ *
+ * This function is called when Enter_USB Message is used. It configures @port
+ * muxes for the USB mode (USB 2.0, USB 3.2 or USB4).
+ */
+int typec_enter_usb(struct typec_port *port, struct enter_usb_data *data)
+{
+	struct typec_mux_state mux_state;
+
+	switch ((data->eudo & EUDO_USB_MODE_MASK) >> EUDO_USB_MODE_SHIFT) {
+	case EUDO_USB_MODE_USB4:
+		mux_state.mode = TYPEC_MODE_USB4;
+		break;
+	case EUDO_USB_MODE_USB3:
+		mux_state.mode = TYPEC_MODE_USB3;
+		break;
+	default:
+		mux_state.mode = TYPEC_MODE_USB2;
+		break;
+	}
+
+	mux_state.alt = NULL; /* Not an alt mode */
+	mux_state.data = data;
+
+	return typec_mux_set(port->mux, &mux_state);
+}
+EXPORT_SYMBOL_GPL(typec_enter_usb);
+
 /* --------------------------------------- */
 
 /**
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 6be5580459428..ee8db91737330 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -265,6 +265,7 @@ int typec_set_orientation(struct typec_port *port,
 			  enum typec_orientation orientation);
 enum typec_orientation typec_get_orientation(struct typec_port *port);
 int typec_set_mode(struct typec_port *port, int mode);
+int typec_enter_usb(struct typec_port *port, struct enter_usb_data *data);
 
 void *typec_get_drvdata(struct typec_port *port);
 
-- 
2.28.0

