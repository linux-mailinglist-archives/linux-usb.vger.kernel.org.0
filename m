Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D52D162A10
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 17:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgBRQJ5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 11:09:57 -0500
Received: from mga05.intel.com ([192.55.52.43]:65006 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgBRQJ5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 11:09:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 08:09:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="435893621"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 18 Feb 2020 08:09:55 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2EF3B109; Tue, 18 Feb 2020 18:09:55 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: core: Make use of acpi_evaluate_object() status
Date:   Tue, 18 Feb 2020 18:09:54 +0200
Message-Id: <20200218160954.42815-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Compiler is not happy about dangling variable:

.../core/usb-acpi.c: In function ‘usb_acpi_get_connect_type’:
.../core/usb-acpi.c:90:14: warning: variable ‘status’ set but not used [-Wunused-but-set-variable]
   90 |  acpi_status status;
      |              ^~~~~~

Make use of it by checking the status and bail out in case of error.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/usb/core/usb-acpi.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index f434a2060552..41b91f4c207d 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -86,7 +86,7 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
 {
 	enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *upc;
+	union acpi_object *upc = NULL;
 	acpi_status status;
 
 	/*
@@ -98,9 +98,11 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
 	 * no connectable, the port would be not used.
 	 */
 	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
+	if (ACPI_FAILURE(status))
+		goto out;
+
 	upc = buffer.pointer;
-	if (!upc || (upc->type != ACPI_TYPE_PACKAGE)
-		|| upc->package.count != 4) {
+	if (!upc || (upc->type != ACPI_TYPE_PACKAGE) || upc->package.count != 4) {
 		goto out;
 	}
 
-- 
2.25.0

