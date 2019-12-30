Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4FC512D09D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfL3O0a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:30 -0500
Received: from mga06.intel.com ([134.134.136.31]:56429 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727534AbfL3O03 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:29 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233472"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:25 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 09/15] usb: pd: Add definition for DFP and UFP1 VDOs
Date:   Mon, 30 Dec 2019 17:26:05 +0300
Message-Id: <20191230142611.24921-10-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The latest version of the USB Power Delivery Specification
R3.0 added UFP and DFP product types for the Discover
Identity message. Both types can be used for example for
checking the USB capability of the partner, which means the
USB modes (USB 2.0, USB 3.0 and USB4) that the partner
device supports.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/pd_vdo.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index 781f4e98dd23..35b8e15efaa0 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -139,6 +139,38 @@
 #define VDO_PRODUCT(pid, bcd)	(((pid) & 0xffff) << 16 | ((bcd) & 0xffff))
 #define PD_PRODUCT_PID(vdo)	(((vdo) >> 16) & 0xffff)
 
+/*
+ * UFP VDO1
+ * --------
+ * <31:29> :: UFP VDO version
+ * <28>    :: Reserved
+ * <27:24> :: Device capability
+ * <23:6>  :: Reserved
+ * <5:3>   :: Alternate modes
+ * <2:0>   :: USB highest speed
+ */
+#define PD_VDO1_UFP_DEVCAP(vdo)	(((vdo) & GENMASK(27, 24)) >> 24)
+
+#define DEV_USB2_CAPABLE	BIT(0)
+#define DEV_USB2_BILLBOARD	BIT(1)
+#define DEV_USB3_CAPABLE	BIT(2)
+#define DEV_USB4_CAPABLE	BIT(3)
+
+/*
+ * DFP VDO
+ * --------
+ * <31:29> :: DFP VDO version
+ * <28:27> :: Reserved
+ * <26:24> :: Host capability
+ * <23:5>  :: Reserved
+ * <4:0>   :: Port number
+ */
+#define PD_VDO_DFP_HOSTCAP(vdo)	(((vdo) & GENMASK(26, 24)) >> 24)
+
+#define HOST_USB2_CAPABLE	BIT(0)
+#define HOST_USB3_CAPABLE	BIT(1)
+#define HOST_USB4_CAPABLE	BIT(2)
+
 /*
  * Cable VDO
  * ---------
-- 
2.24.1

