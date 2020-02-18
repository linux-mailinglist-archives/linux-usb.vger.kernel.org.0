Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 174EF162F9F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgBRTRV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:17:21 -0500
Received: from mga03.intel.com ([134.134.136.65]:32750 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726318AbgBRTRU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 14:17:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 11:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,457,1574150400"; 
   d="scan'208";a="315157513"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2020 11:17:19 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5B3BB73; Tue, 18 Feb 2020 21:17:18 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] usb: core: Use ACPI_SUCCESS() at appropriate places
Date:   Tue, 18 Feb 2020 21:17:17 +0200
Message-Id: <20200218191717.73512-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use ACPI_SUCCESS() to replace !ACPI_FAILURE(), this avoids additional operation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: Fix subject line FAILURE -> SUCCESS
 drivers/usb/core/usb-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 99d41dc26e08..50b2fc7fcc0e 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -187,7 +187,7 @@ usb_acpi_find_companion_for_port(struct usb_port *port_dev)
 
 	handle = adev->handle;
 	status = acpi_get_physical_device_location(handle, &pld);
-	if (!ACPI_FAILURE(status) && pld) {
+	if (ACPI_SUCCESS(status) && pld) {
 		port_dev->location = USB_ACPI_LOCATION_VALID
 			| pld->group_token << 8 | pld->group_position;
 		port_dev->connect_type = usb_acpi_get_connect_type(handle, pld);
-- 
2.25.0

