Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BDD35918B
	for <lists+linux-usb@lfdr.de>; Fri,  9 Apr 2021 03:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhDIBmN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 21:42:13 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:45220 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232996AbhDIBmN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 21:42:13 -0400
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 31DCD4046A;
        Fri,  9 Apr 2021 01:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1617932521; bh=ANBnEYIpufAUvico5mma51pL7BJ0yKQ8beDXzaWE8O0=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=DZJEANyrTs5LieAaf/D33/VbogAR5y/B88QMd0X7sRX7wjfbaAT/w0dXTXSa7Z3Hz
         Ome+7OUXpS04jBDQIvDOueiLGG9IE/e+ii+N5YBr9gWdw/YChmjZxjZsprVt5O6jgu
         /Rkbzswkiki/9+56jVsjSd1BfEH0cApEe6NEu0VxmiOWqBaU0B4uiGM/ASSZ7Benst
         VgLrkjUJw8HR0vdNRX/p1+GA4qm3/tnp6a4prlDsQh4n/A7SPz85B326JM3mWsDDfO
         RsTil/+SJ7OO8S4k7lejivNFsoD9JyUl7Z4aComFdZHgbd20mmdbWGF+tWY5lCCsYq
         JuK+pdaBVnxWQ==
Received: from lab-vbox (unknown [10.205.144.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id A05BFA007C;
        Fri,  9 Apr 2021 01:41:59 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Thu, 08 Apr 2021 18:41:59 -0700
Date:   Thu, 08 Apr 2021 18:41:59 -0700
Message-Id: <4e1d73ed75334611578eb607bfdb5ba979abef3c.1617929509.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
References: <cover.1617929509.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 1/6] usb: xhci: Move quirks definitions to common usb header
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

DWC3 (and possibly others such as CDNS3) will need to access these xHCI
quirks' definitions to initialize their hosts. Currently, to set these
quirks, we'd need to create new DT properties matching the quirks. This
may not be necessary as the driver can check the controller IP and
version at runtime to determine which quirks are needed. Let's move
these quirks' definitions to a common header under include/linux/usb so
DWC3 can properly access them.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/host/xhci-plat.c    |  1 -
 drivers/usb/host/xhci-plat.h    | 25 -----------
 drivers/usb/host/xhci-rcar.c    |  1 -
 drivers/usb/host/xhci.h         | 53 +----------------------
 include/linux/usb/xhci-quirks.h | 77 +++++++++++++++++++++++++++++++++
 5 files changed, 78 insertions(+), 79 deletions(-)
 delete mode 100644 drivers/usb/host/xhci-plat.h
 create mode 100644 include/linux/usb/xhci-quirks.h

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9b13ce..716ef3a338db 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -21,7 +21,6 @@
 #include <linux/usb/of.h>
 
 #include "xhci.h"
-#include "xhci-plat.h"
 #include "xhci-mvebu.h"
 #include "xhci-rcar.h"
 
diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
deleted file mode 100644
index 561d0b7bce09..000000000000
--- a/drivers/usb/host/xhci-plat.h
+++ /dev/null
@@ -1,25 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * xhci-plat.h - xHCI host controller driver platform Bus Glue.
- *
- * Copyright (C) 2015 Renesas Electronics Corporation
- */
-
-#ifndef _XHCI_PLAT_H
-#define _XHCI_PLAT_H
-
-#include "xhci.h"	/* for hcd_to_xhci() */
-
-struct xhci_plat_priv {
-	const char *firmware_name;
-	unsigned long long quirks;
-	int (*plat_setup)(struct usb_hcd *);
-	void (*plat_start)(struct usb_hcd *);
-	int (*init_quirk)(struct usb_hcd *);
-	int (*suspend_quirk)(struct usb_hcd *);
-	int (*resume_quirk)(struct usb_hcd *);
-};
-
-#define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
-#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
-#endif	/* _XHCI_PLAT_H */
diff --git a/drivers/usb/host/xhci-rcar.c b/drivers/usb/host/xhci-rcar.c
index 1bc4fe7b8c75..7690bee365fd 100644
--- a/drivers/usb/host/xhci-rcar.c
+++ b/drivers/usb/host/xhci-rcar.c
@@ -14,7 +14,6 @@
 #include <linux/sys_soc.h>
 
 #include "xhci.h"
-#include "xhci-plat.h"
 #include "xhci-rcar.h"
 
 /*
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2595a8f057c4..9a4e2808668b 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -17,6 +17,7 @@
 #include <linux/kernel.h>
 #include <linux/usb/hcd.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/usb/xhci-quirks.h>
 
 /* Code sharing between pci-quirks and xhci hcd */
 #include	"xhci-ext-caps.h"
@@ -1840,58 +1841,6 @@ struct xhci_hcd {
 #define XHCI_STATE_HALTED	(1 << 1)
 #define XHCI_STATE_REMOVING	(1 << 2)
 	unsigned long long	quirks;
-#define	XHCI_LINK_TRB_QUIRK	BIT_ULL(0)
-#define XHCI_RESET_EP_QUIRK	BIT_ULL(1)
-#define XHCI_NEC_HOST		BIT_ULL(2)
-#define XHCI_AMD_PLL_FIX	BIT_ULL(3)
-#define XHCI_SPURIOUS_SUCCESS	BIT_ULL(4)
-/*
- * Certain Intel host controllers have a limit to the number of endpoint
- * contexts they can handle.  Ideally, they would signal that they can't handle
- * anymore endpoint contexts by returning a Resource Error for the Configure
- * Endpoint command, but they don't.  Instead they expect software to keep track
- * of the number of active endpoints for them, across configure endpoint
- * commands, reset device commands, disable slot commands, and address device
- * commands.
- */
-#define XHCI_EP_LIMIT_QUIRK	BIT_ULL(5)
-#define XHCI_BROKEN_MSI		BIT_ULL(6)
-#define XHCI_RESET_ON_RESUME	BIT_ULL(7)
-#define	XHCI_SW_BW_CHECKING	BIT_ULL(8)
-#define XHCI_AMD_0x96_HOST	BIT_ULL(9)
-#define XHCI_TRUST_TX_LENGTH	BIT_ULL(10)
-#define XHCI_LPM_SUPPORT	BIT_ULL(11)
-#define XHCI_INTEL_HOST		BIT_ULL(12)
-#define XHCI_SPURIOUS_REBOOT	BIT_ULL(13)
-#define XHCI_COMP_MODE_QUIRK	BIT_ULL(14)
-#define XHCI_AVOID_BEI		BIT_ULL(15)
-#define XHCI_PLAT		BIT_ULL(16)
-#define XHCI_SLOW_SUSPEND	BIT_ULL(17)
-#define XHCI_SPURIOUS_WAKEUP	BIT_ULL(18)
-/* For controllers with a broken beyond repair streams implementation */
-#define XHCI_BROKEN_STREAMS	BIT_ULL(19)
-#define XHCI_PME_STUCK_QUIRK	BIT_ULL(20)
-#define XHCI_MTK_HOST		BIT_ULL(21)
-#define XHCI_SSIC_PORT_UNUSED	BIT_ULL(22)
-#define XHCI_NO_64BIT_SUPPORT	BIT_ULL(23)
-#define XHCI_MISSING_CAS	BIT_ULL(24)
-/* For controller with a broken Port Disable implementation */
-#define XHCI_BROKEN_PORT_PED	BIT_ULL(25)
-#define XHCI_LIMIT_ENDPOINT_INTERVAL_7	BIT_ULL(26)
-#define XHCI_U2_DISABLE_WAKE	BIT_ULL(27)
-#define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	BIT_ULL(28)
-#define XHCI_HW_LPM_DISABLE	BIT_ULL(29)
-#define XHCI_SUSPEND_DELAY	BIT_ULL(30)
-#define XHCI_INTEL_USB_ROLE_SW	BIT_ULL(31)
-#define XHCI_ZERO_64B_REGS	BIT_ULL(32)
-#define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
-#define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
-#define XHCI_SNPS_BROKEN_SUSPEND    BIT_ULL(35)
-#define XHCI_RENESAS_FW_QUIRK	BIT_ULL(36)
-#define XHCI_SKIP_PHY_INIT	BIT_ULL(37)
-#define XHCI_DISABLE_SPARSE	BIT_ULL(38)
-#define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
-#define XHCI_NO_SOFT_RETRY	BIT_ULL(40)
 
 	unsigned int		num_active_eps;
 	unsigned int		limit_active_eps;
diff --git a/include/linux/usb/xhci-quirks.h b/include/linux/usb/xhci-quirks.h
new file mode 100644
index 000000000000..c2cb35c5b273
--- /dev/null
+++ b/include/linux/usb/xhci-quirks.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * This file holds the definitions of quirks found in xHCI USB hosts.
+ */
+
+#ifndef __LINUX_USB_XHCI_QUIRKS_H
+#define __LINUX_USB_XHCI_QUIRKS_H
+
+#define	XHCI_LINK_TRB_QUIRK		BIT_ULL(0)
+#define XHCI_RESET_EP_QUIRK		BIT_ULL(1)
+#define XHCI_NEC_HOST			BIT_ULL(2)
+#define XHCI_AMD_PLL_FIX		BIT_ULL(3)
+#define XHCI_SPURIOUS_SUCCESS		BIT_ULL(4)
+/*
+ * Certain Intel host controllers have a limit to the number of endpoint
+ * contexts they can handle.  Ideally, they would signal that they can't handle
+ * anymore endpoint contexts by returning a Resource Error for the Configure
+ * Endpoint command, but they don't.  Instead they expect software to keep track
+ * of the number of active endpoints for them, across configure endpoint
+ * commands, reset device commands, disable slot commands, and address device
+ * commands.
+ */
+#define XHCI_EP_LIMIT_QUIRK		BIT_ULL(5)
+#define XHCI_BROKEN_MSI			BIT_ULL(6)
+#define XHCI_RESET_ON_RESUME		BIT_ULL(7)
+#define	XHCI_SW_BW_CHECKING		BIT_ULL(8)
+#define XHCI_AMD_0x96_HOST		BIT_ULL(9)
+#define XHCI_TRUST_TX_LENGTH		BIT_ULL(10)
+#define XHCI_LPM_SUPPORT		BIT_ULL(11)
+#define XHCI_INTEL_HOST			BIT_ULL(12)
+#define XHCI_SPURIOUS_REBOOT		BIT_ULL(13)
+#define XHCI_COMP_MODE_QUIRK		BIT_ULL(14)
+#define XHCI_AVOID_BEI			BIT_ULL(15)
+#define XHCI_PLAT			BIT_ULL(16)
+#define XHCI_SLOW_SUSPEND		BIT_ULL(17)
+#define XHCI_SPURIOUS_WAKEUP		BIT_ULL(18)
+/* For controllers with a broken beyond repair streams implementation */
+#define XHCI_BROKEN_STREAMS		BIT_ULL(19)
+#define XHCI_PME_STUCK_QUIRK		BIT_ULL(20)
+#define XHCI_MTK_HOST			BIT_ULL(21)
+#define XHCI_SSIC_PORT_UNUSED		BIT_ULL(22)
+#define XHCI_NO_64BIT_SUPPORT		BIT_ULL(23)
+#define XHCI_MISSING_CAS		BIT_ULL(24)
+/* For controller with a broken Port Disable implementation */
+#define XHCI_BROKEN_PORT_PED		BIT_ULL(25)
+#define XHCI_LIMIT_ENDPOINT_INTERVAL_7	BIT_ULL(26)
+#define XHCI_U2_DISABLE_WAKE		BIT_ULL(27)
+#define XHCI_ASMEDIA_MODIFY_FLOWCONTROL	BIT_ULL(28)
+#define XHCI_HW_LPM_DISABLE		BIT_ULL(29)
+#define XHCI_SUSPEND_DELAY		BIT_ULL(30)
+#define XHCI_INTEL_USB_ROLE_SW		BIT_ULL(31)
+#define XHCI_ZERO_64B_REGS		BIT_ULL(32)
+#define XHCI_DEFAULT_PM_RUNTIME_ALLOW	BIT_ULL(33)
+#define XHCI_RESET_PLL_ON_DISCONNECT	BIT_ULL(34)
+#define XHCI_SNPS_BROKEN_SUSPEND	BIT_ULL(35)
+#define XHCI_RENESAS_FW_QUIRK		BIT_ULL(36)
+#define XHCI_SKIP_PHY_INIT		BIT_ULL(37)
+#define XHCI_DISABLE_SPARSE		BIT_ULL(38)
+#define XHCI_SG_TRB_CACHE_SIZE_QUIRK	BIT_ULL(39)
+#define XHCI_NO_SOFT_RETRY		BIT_ULL(40)
+
+struct usb_hcd;
+
+struct xhci_plat_priv {
+	const char *firmware_name;
+	unsigned long long quirks;
+	int (*plat_setup)(struct usb_hcd *hcd);
+	void (*plat_start)(struct usb_hcd *hcd);
+	int (*init_quirk)(struct usb_hcd *hcd);
+	int (*suspend_quirk)(struct usb_hcd *hcd);
+	int (*resume_quirk)(struct usb_hcd *hcd);
+};
+
+#define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
+#define xhci_to_priv(x) ((struct xhci_plat_priv *)(x)->priv)
+
+#endif /* __LINUX_USB_XHCI_QUIRKS_H */
-- 
2.28.0

