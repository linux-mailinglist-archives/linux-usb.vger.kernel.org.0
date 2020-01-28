Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E21D014B97F
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jan 2020 15:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387670AbgA1Oc5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jan 2020 09:32:57 -0500
Received: from mga07.intel.com ([134.134.136.100]:38430 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387604AbgA1Oc4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Jan 2020 09:32:56 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 28 Jan 2020 06:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; 
   d="scan'208";a="217626888"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2020 06:29:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0DB3313F; Tue, 28 Jan 2020 16:29:56 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] MAINTAINERS: Sort entries in database for USB TYPEC
Date:   Tue, 28 Jan 2020 16:29:56 +0200
Message-Id: <20200128142956.39604-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Run parse-maintainers.pl and choose USB TYPEC records. Fix them accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e7bb6da3ea3..0608e3195bb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17407,11 +17407,14 @@ F:	drivers/usb/
 F:	include/linux/usb.h
 F:	include/linux/usb/
 
-USB TYPEC PI3USB30532 MUX DRIVER
-M:	Hans de Goede <hdegoede@redhat.com>
+USB TYPEC BUS FOR ALTERNATE MODES
+M:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-F:	drivers/usb/typec/mux/pi3usb30532.c
+F:	Documentation/ABI/testing/sysfs-bus-typec
+F:	Documentation/driver-api/usb/typec_bus.rst
+F:	drivers/usb/typec/altmodes/
+F:	include/linux/usb/typec_altmode.h
 
 USB TYPEC CLASS
 M:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
@@ -17422,14 +17425,11 @@ F:	Documentation/driver-api/usb/typec.rst
 F:	drivers/usb/typec/
 F:	include/linux/usb/typec.h
 
-USB TYPEC BUS FOR ALTERNATE MODES
-M:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
+USB TYPEC PI3USB30532 MUX DRIVER
+M:	Hans de Goede <hdegoede@redhat.com>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-typec
-F:	Documentation/driver-api/usb/typec_bus.rst
-F:	drivers/usb/typec/altmodes/
-F:	include/linux/usb/typec_altmode.h
+F:	drivers/usb/typec/mux/pi3usb30532.c
 
 USB TYPEC PORT CONTROLLER DRIVERS
 M:	Guenter Roeck <linux@roeck-us.net>
-- 
2.24.1

