Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D518162AAA
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 17:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgBRQcU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 11:32:20 -0500
Received: from mga09.intel.com ([134.134.136.24]:51676 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726605AbgBRQcU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 11:32:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 08:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="258606182"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 18 Feb 2020 08:32:18 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A8071109; Tue, 18 Feb 2020 18:32:17 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: core: Use ACPI_FAILURE at appropriate places
Date:   Tue, 18 Feb 2020 18:32:17 +0200
Message-Id: <20200218163217.53690-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use ACPI_SUCCESS() to replace !ACPI_FAILURE(), this avoids !! operation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/core/usb-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 41b91f4c207d..9b31d658ab14 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -188,7 +188,7 @@ usb_acpi_find_companion_for_port(struct usb_port *port_dev)
 
 	handle = adev->handle;
 	status = acpi_get_physical_device_location(handle, &pld);
-	if (!ACPI_FAILURE(status) && pld) {
+	if (ACPI_SUCCESS(status) && pld) {
 		port_dev->location = USB_ACPI_LOCATION_VALID
 			| pld->group_token << 8 | pld->group_position;
 		port_dev->connect_type = usb_acpi_get_connect_type(handle, pld);
-- 
2.25.0

