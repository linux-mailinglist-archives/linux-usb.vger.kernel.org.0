Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9FE2C3F8E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 13:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbgKYMGr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 07:06:47 -0500
Received: from mga04.intel.com ([192.55.52.120]:40146 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727409AbgKYMGr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 07:06:47 -0500
IronPort-SDR: Gy7PatCaWRvi67MxNdhFNnRXoNE0UJhlzBlZcWxVL9i3LebRxbOTfHCaqumDTpB20MiHroKM7v
 p6RXOG0JBFcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="169559222"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="169559222"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 04:06:46 -0800
IronPort-SDR: xRwNVAF0d+djIWJoS1Osihqk01okjpOFKMiW5tGmWa99KvneH48osFL47RsGWIhNpd9dw/PVq7
 oxhpibDFDoDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="432936353"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2020 04:06:45 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: pd: DFP product types
Date:   Wed, 25 Nov 2020 15:06:41 +0300
Message-Id: <20201125120642.37156-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201125120642.37156-1-heikki.krogerus@linux.intel.com>
References: <20201125120642.37156-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB Power Delivery Specification R3.0 introduced separate
field for the DFP product type to the ID Header VDO.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/pd_vdo.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/usb/pd_vdo.h b/include/linux/usb/pd_vdo.h
index 68bdc4e2f5a90..04a66c2deedc1 100644
--- a/include/linux/usb/pd_vdo.h
+++ b/include/linux/usb/pd_vdo.h
@@ -103,17 +103,25 @@
  * --------------------
  * <31>     :: data capable as a USB host
  * <30>     :: data capable as a USB device
- * <29:27>  :: product type
+ * <29:27>  :: product type (UFP / Cable)
  * <26>     :: modal operation supported (1b == yes)
- * <25:16>  :: Reserved, Shall be set to zero
+ * <25:16>  :: product type (DFP)
  * <15:0>   :: USB-IF assigned VID for this cable vendor
  */
 #define IDH_PTYPE_UNDEF		0
 #define IDH_PTYPE_HUB		1
 #define IDH_PTYPE_PERIPH	2
+#define IDH_PTYPE_PSD		3
+#define IDH_PTYPE_AMA		5
+
 #define IDH_PTYPE_PCABLE	3
 #define IDH_PTYPE_ACABLE	4
-#define IDH_PTYPE_AMA		5
+
+#define IDH_PTYPE_DFP_UNDEF	0
+#define IDH_PTYPE_DFP_HUB	1
+#define IDH_PTYPE_DFP_HOST	2
+#define IDH_PTYPE_DFP_PB	3
+#define IDH_PTYPE_DFP_AMC	4
 
 #define VDO_IDH(usbh, usbd, ptype, is_modal, vid)		\
 	((usbh) << 31 | (usbd) << 30 | ((ptype) & 0x7) << 27	\
@@ -122,6 +130,7 @@
 #define PD_IDH_PTYPE(vdo)	(((vdo) >> 27) & 0x7)
 #define PD_IDH_VID(vdo)		((vdo) & 0xffff)
 #define PD_IDH_MODAL_SUPP(vdo)	((vdo) & (1 << 26))
+#define PD_IDH_DFP_PTYPE(vdo)	(((vdo) >> 23) & 0x7)
 
 /*
  * Cert Stat VDO
-- 
2.29.2

