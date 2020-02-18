Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A138D16264F
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 13:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgBRMnA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 07:43:00 -0500
Received: from mga05.intel.com ([192.55.52.43]:49272 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgBRMm7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Feb 2020 07:42:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 04:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="228275817"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 18 Feb 2020 04:42:58 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A57B4109; Tue, 18 Feb 2020 14:42:57 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] usb: dwc3: Add ACPI support for xHCI ports
Date:   Tue, 18 Feb 2020 14:42:57 +0200
Message-Id: <20200218124257.8734-1-andriy.shevchenko@linux.intel.com>
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
 drivers/usb/dwc3/host.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index fa252870c926..86dbd012b984 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * host.c - DesignWare USB3 DRD Controller Host Glue
  *
  * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com
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

