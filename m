Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A00812D0A0
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfL3O0d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:33 -0500
Received: from mga06.intel.com ([134.134.136.31]:56449 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727544AbfL3O0d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233482"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:31 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 13/15] usb: typec: Provide definitions for the USB modes
Date:   Mon, 30 Dec 2019 17:26:09 +0300
Message-Id: <20191230142611.24921-14-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Defining the USB modes from the latest USB Power Delivery
Specification - USB 2.0, USB 3.2 and USB4 - as special modal
states just like the Accessory Modes.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/typec_altmode.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index fc57fd88004f..923ff3af0628 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -101,6 +101,22 @@ enum {
 	TYPEC_MODE_DEBUG,			/* Debug Accessory */
 };
 
+/*
+ * USB4 also requires that the pins on the connector are repurposed, just like
+ * Alternate Modes. USB4 mode is however not entered with the Enter Mode Command
+ * like the Alternate Modes are, but instead with a special Enter_USB Message.
+ * The Enter_USB Message can also be used for setting to connector to operate in
+ * USB 3.2 or in USB 2.0 mode instead of USB4.
+ *
+ * The Enter_USB specific "USB Modes" are also supplied here as special modal
+ * state values, just like the Accessory Modes.
+ */
+enum {
+	TYPEC_MODE_USB2 = TYPEC_MODE_DEBUG,	/* USB 2.0 mode */
+	TYPEC_MODE_USB3,			/* USB 3.2 mode */
+	TYPEC_MODE_USB4				/* USB4 mode */
+};
+
 #define TYPEC_MODAL_STATE(_state_)	((_state_) + TYPEC_STATE_MODAL)
 
 struct typec_altmode *typec_altmode_get_plug(struct typec_altmode *altmode,
-- 
2.24.1

