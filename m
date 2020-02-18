Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC18162F0A
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 19:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgBRSwL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 13:52:11 -0500
Received: from mga06.intel.com ([134.134.136.31]:19050 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726415AbgBRSwL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 13:52:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 10:52:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,457,1574150400"; 
   d="scan'208";a="224231754"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 18 Feb 2020 10:52:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BF2F273; Tue, 18 Feb 2020 20:52:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] usb: core: Make use of acpi_evaluate_object() status
Date:   Tue, 18 Feb 2020 20:52:07 +0200
Message-Id: <20200218185207.62527-1-andriy.shevchenko@linux.intel.com>
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
v2: Drop unneded {} (Sergei)
 drivers/usb/core/usb-acpi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index 9043d7242d67..99d41dc26e08 100644
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
@@ -98,11 +98,12 @@ static enum usb_port_connect_type usb_acpi_get_connect_type(acpi_handle handle,
 	 * no connectable, the port would be not used.
 	 */
 	status = acpi_evaluate_object(handle, "_UPC", NULL, &buffer);
+	if (ACPI_FAILURE(status))
+		goto out;
+
 	upc = buffer.pointer;
-	if (!upc || (upc->type != ACPI_TYPE_PACKAGE)
-		|| upc->package.count != 4) {
+	if (!upc || (upc->type != ACPI_TYPE_PACKAGE) || upc->package.count != 4)
 		goto out;
-	}
 
 	if (upc->package.elements[0].integer.value)
 		if (pld->user_visible)
-- 
2.25.0

