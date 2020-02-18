Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39FAF162918
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 16:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726771AbgBRPMX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 10:12:23 -0500
Received: from mga14.intel.com ([192.55.52.115]:21618 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726696AbgBRPMX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 10:12:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 07:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="434111794"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 18 Feb 2020 07:12:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8324D189; Tue, 18 Feb 2020 17:12:20 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] usb: dwc3: Add ACPI support for xHCI ports
Date:   Tue, 18 Feb 2020 17:12:18 +0200
Message-Id: <20200218151219.50121-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ACPI companion of the adapter has to be set for xHCI controller
code to read and attach the ports described in the ACPI table.
Use ACPI_COMPANION_SET macro to set this.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: split out kernel doc fix
 drivers/usb/dwc3/host.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index fa252870c926..95a90ea08975 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -7,6 +7,7 @@
  * Authors: Felipe Balbi <balbi@ti.com>,
  */
 
+#include <linux/acpi.h>
 #include <linux/platform_device.h>
 
 #include "core.h"
@@ -75,6 +76,7 @@ int dwc3_host_init(struct dwc3 *dwc)
 	}
 
 	xhci->dev.parent	= dwc->dev;
+	ACPI_COMPANION_SET(&xhci->dev, ACPI_COMPANION(dwc->dev));
 
 	dwc->xhci = xhci;
 
-- 
2.25.0

