Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF8DB12D0A1
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727558AbfL3O0f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:35 -0500
Received: from mga06.intel.com ([134.134.136.31]:56449 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727554AbfL3O0e (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233485"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:33 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 14/15] usb: typec: Add member for the supported USB modes to struct typec_capability
Date:   Mon, 30 Dec 2019 17:26:10 +0300
Message-Id: <20191230142611.24921-15-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ports can inform which USB modes (USB2, USB3 and USB4)
they support with this member.

This information will be needed once we start using the new
Enter_USB message.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/typec.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 44d28387ced4..0acfbcd8bf04 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -72,6 +72,10 @@ enum typec_orientation {
 	TYPEC_ORIENTATION_REVERSE,
 };
 
+#define USB_CAPABILITY_USB2	BIT(0)
+#define USB_CAPABILITY_USB3	BIT(1)
+#define USB_CAPABILITY_USB4	BIT(2)
+
 /*
  * struct usb_pd_identity - USB Power Delivery identity data
  * @id_header: ID Header VDO
@@ -198,6 +202,7 @@ struct typec_operations {
  * @pd_revision: USB Power Delivery Specification revision if supported
  * @prefer_role: Initial role preference (DRP ports).
  * @accessory: Supported Accessory Modes
+ * @usb: Supported USB Modes
  * @fwnode: Optional fwnode of the port
  * @driver_data: Private pointer for driver specific info
  * @ops: Port operations vector
@@ -211,6 +216,7 @@ struct typec_capability {
 	u16			pd_revision; /* 0300H = "3.0" */
 	int			prefer_role;
 	enum typec_accessory	accessory[TYPEC_MAX_ACCESSORY];
+	u8			usb;
 
 	struct fwnode_handle	*fwnode;
 	void			*driver_data;
-- 
2.24.1

