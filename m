Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F8E35A9AB
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 02:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbhDJArK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 20:47:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:39308 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235215AbhDJArJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 20:47:09 -0400
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D2138401F1;
        Sat, 10 Apr 2021 00:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1618015616; bh=RdQLhzKTixlRLwaPIZsQGBw3e8nw+wSYiVqpTUvN2zQ=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=Qvc22IvYK6rbewN4NHgnsh3e2HHybIJSWkXjMgKIfAKc8+ph9riWt/4WpmtZO5UKM
         enyWpFQ6xPikMcXB/Jxlih4guiaJdNY/ijOQfl11KWX4BOSXBRa9E5o+6d3hWkIM8/
         cYWh56ofvTY6ppNu1wNS4Ke8Vmc1lXzcijt7MUJ1pEyN9OUeNc6pZ8vUf6QoqKIPD6
         DYkvLFgRiu7eg1625Oj7Zzk53839A4h4uc6ePnnt0TmCgoiRWmIjWXApK6LQfui8or
         tZxGsVhJpmKE9chrvHefEJ3c78CCb/TxxX0TRYAkhOX5bhiSPESfT4a/5wvl6SJSsv
         6U2UgHtyMD4tw==
Received: from lab-vbox (unknown [10.205.130.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A0056A006A;
        Sat, 10 Apr 2021 00:46:53 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Fri, 09 Apr 2021 17:46:53 -0700
Date:   Fri, 09 Apr 2021 17:46:53 -0700
Message-Id: <29484f4633a2b0e19b37fe407aebe415e9214390.1618014279.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
References: <cover.1618014279.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 2/7] usb: xhci: Move xhci-plat header to common usb header
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Pawel Laszczak <pawell@cadence.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Roger Quadros <rogerq@kernel.org>,
        Peter Chen <peter.chen@kernel.org>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC3 and CDNS3 need to access the private platform structure to pass
quirks to the xhci-plat glue layer. Move xhci-plat.h to a common header
location under include/linux/usb so DWC3 and CDNS3 can properly access
them.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
Changes in v2:
- New patch for this series

 drivers/usb/cdns3/host.c                       |  2 +-
 drivers/usb/host/xhci-plat.c                   |  2 +-
 drivers/usb/host/xhci-rcar.c                   |  2 +-
 .../usb/host => include/linux/usb}/xhci-plat.h | 18 +++++++++---------
 4 files changed, 12 insertions(+), 12 deletions(-)
 rename {drivers/usb/host => include/linux/usb}/xhci-plat.h (54%)

diff --git a/drivers/usb/cdns3/host.c b/drivers/usb/cdns3/host.c
index 84dadfa726aa..02634d9762a4 100644
--- a/drivers/usb/cdns3/host.c
+++ b/drivers/usb/cdns3/host.c
@@ -14,8 +14,8 @@
 #include "drd.h"
 #include "host-export.h"
 #include <linux/usb/hcd.h>
+#include <linux/usb/xhci-plat.h>
 #include "../host/xhci.h"
-#include "../host/xhci-plat.h"
 
 #define XECP_PORT_CAP_REG	0x8000
 #define XECP_AUX_CTRL_REG1	0x8120
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9b13ce..3003fde3b430 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -19,9 +19,9 @@
 #include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/usb/of.h>
+#include <linux/usb/xhci-plat.h>
 
 #include "xhci.h"
-#include "xhci-plat.h"
 #include "xhci-mvebu.h"
 #include "xhci-rcar.h"
 
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 1bc4fe7b8c75..8d779df7b1e1 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -12,9 +12,9 @@
 #include <linux/of.h>
 #include <linux/usb/phy.h>
 #include <linux/sys_soc.h>
+#include <linux/usb/xhci-plat.h>
 
 #include "xhci.h"
-#include "xhci-plat.h"
 #include "xhci-rcar.h"
 
 /*
diff --git a/drivers/usb/host/xhci-plat.h b/include/linux/usb/xhci-plat.h
similarity index 54%
rename from drivers/usb/host/xhci-plat.h
rename to include/linux/usb/xhci-plat.h
index 561d0b7bce09..a58f1d44306d 100644
--- a/drivers/usb/host/xhci-plat.h
+++ b/include/linux/usb/xhci-plat.h
@@ -5,21 +5,21 @@
  * Copyright (C) 2015 Renesas Electronics Corporation
  */
 
-#ifndef _XHCI_PLAT_H
-#define _XHCI_PLAT_H
+#ifndef __LINUX_USB_XHCI_PLAT_H
+#define __LINUX_USB_XHCI_PLAT_H
 
-#include "xhci.h"	/* for hcd_to_xhci() */
+struct usb_hcd;
 
 struct xhci_plat_priv {
 	const char *firmware_name;
 	unsigned long long quirks;
-	int (*plat_setup)(struct usb_hcd *);
-	void (*plat_start)(struct usb_hcd *);
-	int (*init_quirk)(struct usb_hcd *);
-	int (*suspend_quirk)(struct usb_hcd *);
-	int (*resume_quirk)(struct usb_hcd *);
+	int (*plat_setup)(struct usb_hcd *hcd);
+	void (*plat_start)(struct usb_hcd *hcd);
+	int (*init_quirk)(struct usb_hcd *hcd);
+	int (*suspend_quirk)(struct usb_hcd *hcd);
+	int (*resume_quirk)(struct usb_hcd *hcd);
 };
 
 #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
 #define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
-#endif	/* _XHCI_PLAT_H */
+#endif	/* __LINUX_USB_XHCI_PLAT_H */
-- 
2.28.0

