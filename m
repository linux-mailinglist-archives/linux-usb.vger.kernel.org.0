Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8BE312D09E
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 15:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727549AbfL3O0b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 09:26:31 -0500
Received: from mga06.intel.com ([134.134.136.31]:56449 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727546AbfL3O0a (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 09:26:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 06:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224233477"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 06:26:28 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: [PATCH 11/15] usb: typec: Add definitions for the latest specification releases
Date:   Mon, 30 Dec 2019 17:26:07 +0300
Message-Id: <20191230142611.24921-12-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding definitions for USB Type-C Specification Release 1.3,
1.4 and 2.0.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 include/linux/usb/typec.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 269a76a4f9b6..44d28387ced4 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -9,6 +9,9 @@
 #define USB_TYPEC_REV_1_0	0x100 /* 1.0 */
 #define USB_TYPEC_REV_1_1	0x110 /* 1.1 */
 #define USB_TYPEC_REV_1_2	0x120 /* 1.2 */
+#define USB_TYPEC_REV_1_3	0x130 /* 1.3 */
+#define USB_TYPEC_REV_1_4	0x140 /* 1.4 */
+#define USB_TYPEC_REV_2_0	0x200 /* 2.0 */
 
 struct typec_partner;
 struct typec_cable;
-- 
2.24.1

