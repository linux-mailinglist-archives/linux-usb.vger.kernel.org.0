Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C33712D09B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfL3O00 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:26 -0500
Received: from mga06.intel.com ([134.134.136.31]:56429 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727531AbfL3O00 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:26 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233470"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:23 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 08/15] usb: pd: Add definitions for the Enter_USB message
Date:   Mon, 30 Dec 2019 17:26:04 +0300
Message-Id: <20191230142611.24921-9-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Version 2.0 of the USB Power Delivery Specification R3.0
defines a new message called Enter_USB, which is made with
USB4 in mind. Enter_USB message is in practice the same as
the Enter Mode command (used when entering alternate modes)
that just needs to be used when entering USB4 mode.

The message does also support entering USB 2.0 or USB 3.2
mode instead of USB4 mode, but it is only required with
USB4. I.e. with USB2 and USB3 Enter_USB message is optional.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/pd.h | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index 145c38e351c2..a665d7f21142 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -45,7 +45,8 @@ enum pd_data_msg_type {
 	PD_DATA_BATT_STATUS = 5,
 	PD_DATA_ALERT = 6,
 	PD_DATA_GET_COUNTRY_INFO = 7,
-	/* 8-14 Reserved */
+	PD_DATA_ENTER_USB = 8,
+	/* 9-14 Reserved */
 	PD_DATA_VENDOR_DEF = 15,
 	/* 16-31 Reserved */
 };
@@ -418,6 +419,36 @@ static inline unsigned int rdo_max_power(u32 rdo)
 	return ((rdo >> RDO_BATT_MAX_PWR_SHIFT) & RDO_PWR_MASK) * 250;
 }
 
+/* Enter_USB Data Object */
+#define EUDO_USB_MODE_MASK		GENMASK(30, 28)
+#define EUDO_USB_MODE_SHIFT		28
+#define   EUDO_USB_MODE_USB2		0
+#define   EUDO_USB_MODE_USB3		1
+#define   EUDO_USB_MODE_USB4		2
+#define EUDO_USB4_DRD			BIT(26)
+#define EUDO_USB3_DRD			BIT(25)
+#define EUDO_CABLE_SPEED_MASK		GENMASK(23, 21)
+#define EUDO_CABLE_SPEED_SHIFT		21
+#define   EUDO_CABLE_SPEED_USB2		0
+#define   EUDO_CABLE_SPEED_USB3_GEN1	1
+#define   EUDO_CABLE_SPEED_USB4_GEN2	2
+#define   EUDO_CABLE_SPEED_USB4_GEN3	3
+#define EUDO_CABLE_TYPE_MASK		GENMASK(20, 19)
+#define EUDO_CABLE_TYPE_SHIFT		19
+#define   EUDO_CABLE_TYPE_PASSIVE	0
+#define   EUDO_CABLE_TYPE_RE_TIMER	1
+#define   EUDO_CABLE_TYPE_RE_DRIVER	2
+#define   EUDO_CABLE_TYPE_OPTICAL	3
+#define EUDO_CABLE_CURRENT_MASK		GENMASK(18, 17)
+#define EUDO_CABLE_CURRENT_SHIFT	17
+#define   EUDO_CABLE_CURRENT_NOTSUPP	0
+#define   EUDO_CABLE_CURRENT_3A		2
+#define   EUDO_CABLE_CURRENT_5A		3
+#define EUDO_PCIE_SUPPORT		BIT(16)
+#define EUDO_DP_SUPPORT			BIT(15)
+#define EUDO_TBT_SUPPORT		BIT(14)
+#define EUDO_HOST_PRESENT		BIT(13)
+
 /* USB PD timers and counters */
 #define PD_T_NO_RESPONSE	5000	/* 4.5 - 5.5 seconds */
 #define PD_T_DB_DETECT		10000	/* 10 - 15 seconds */
-- 
2.24.1

