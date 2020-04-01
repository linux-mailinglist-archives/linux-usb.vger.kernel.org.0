Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 597E919A64F
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 09:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731981AbgDAHe7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 03:34:59 -0400
Received: from mail-lf1-f43.google.com ([209.85.167.43]:46655 "EHLO
        mail-lf1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731849AbgDAHe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 03:34:58 -0400
Received: by mail-lf1-f43.google.com with SMTP id q5so19545695lfb.13
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2020 00:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XiztrddspCRsCTb+zIBpmXKAxWtugiFMkdRqgnSChXU=;
        b=JFI760Ql3u0gP8KvAz8yTch89oEIt/HzIX7AvlrdmbcYQ8tKDvGF6SaX0O1caPu6g+
         DHncAAs9Hbgq4c0zHaDUEz8Dr1lpwxHdgEz2EUrrBAbGPiVyKXAOtfCSxFGabj2aBH6F
         EaKiWbB8197k4+aKCgFLilvMVWRkjG5+V3cVQRtiwMiMx26QwM5VaYLVl6W2M2eClQqN
         C0rTUYWcy1JzqLcMGrQWukdY/jDkEM7U+RoyBJ/02aq+PxtU/8gRxW7FpXMWkCy/ocyA
         Ekl0YnDZmTXwx6iAS23rkGkw73gBkipemPrYs3HWfS8GvBrN5alF5ncvywxU3KmxaYJG
         m59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=XiztrddspCRsCTb+zIBpmXKAxWtugiFMkdRqgnSChXU=;
        b=N6cFLj6qDbPPlq2EJkkd/fz+n1Gcn+KAQimihwxuHpH3MeP3sxIZQrpYJ5U1gOOSAe
         ZmGO4NzvXdgCwW/MgyPL2h4UV2YhcRQm3wXVbssNeoY2lvfcF25aHLithFTKBBN2wYm1
         b6CrPHFZwWzXCBPR3qr1V/rFKM+TN2y2yOWMbF3oq2mAkgUYSVb4XC/pbzw52QpYxc1k
         RPZ9uvshYvA/lQHqb/nG9smunyRaHUPHsgFJTcQVKJ8Q1UY42qT1ve8SsCeiG6xYH/vG
         1o//KnKdFfSYCdQbBt77VCAwfRE9iQtweqjZlv5tTGmjCVEOyH1Y+VpPtuGFNixHG5lz
         HB9Q==
X-Gm-Message-State: AGi0PuanNcXlxPT0vot8fz6Wdg52BDwb+AQ28UTl1a74bgApGvcQtAS1
        fpDZZPYObIOpRx0mzwD4Aio=
X-Google-Smtp-Source: APiQypJmRLYqtzvuPHfzxPBlZ9YVmTNvJ1mxg+SMW1zF4jUTEVgrijhrP+WEh42H8YI9MYi64JOzYA==
X-Received: by 2002:ac2:5f75:: with SMTP id c21mr13607857lfc.194.1585726485298;
        Wed, 01 Apr 2020 00:34:45 -0700 (PDT)
Received: from saruman.elisa-laajakaista.fi (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id g5sm939119lfj.14.2020.04.01.00.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 00:34:44 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 3/7] universal host controller interface: remove acronyms
Date:   Wed,  1 Apr 2020 10:32:45 +0300
Message-Id: <20200401073249.340400-4-balbi@kernel.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401073249.340400-1-balbi@kernel.org>
References: <20200401073249.340400-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

convert UHCI to UNIVERSAL_HOST_CONTROLLER_INTERFACE and uhci to
universal_host_controller_interface.

Signed-off-by: Felipe Balbi <balbi@kernel.org>
---
 drivers/usb/Kconfig              |   6 +-
 drivers/usb/Makefile             |   2 +-
 drivers/usb/core/hcd-pci.c       |  22 +-
 drivers/usb/core/message.c       |   2 +-
 drivers/usb/core/urb.c           |   2 +-
 drivers/usb/gadget/Kconfig       |   2 +-
 drivers/usb/host/Kconfig         |  26 +-
 drivers/usb/host/Makefile        |   2 +-
 drivers/usb/host/ehci-hcd.c      |   4 +-
 drivers/usb/host/ehci-q.c        |   2 +-
 drivers/usb/host/fotg210-hcd.c   |   6 +-
 drivers/usb/host/ohci-hcd.c      |   4 +-
 drivers/usb/host/ohci-pci.c      |   2 +-
 drivers/usb/host/ohci-pxa27x.c   |   6 +-
 drivers/usb/host/ohci.h          |   2 +-
 drivers/usb/host/pci-quirks.c    |  64 +--
 drivers/usb/host/pci-quirks.h    |   4 +-
 drivers/usb/host/uhci-debug.c    | 212 ++++-----
 drivers/usb/host/uhci-grlib.c    | 100 ++--
 drivers/usb/host/uhci-hcd.c      | 546 +++++++++++-----------
 drivers/usb/host/uhci-hcd.h      | 316 ++++++-------
 drivers/usb/host/uhci-hub.c      | 182 ++++----
 drivers/usb/host/uhci-pci.c      | 166 +++----
 drivers/usb/host/uhci-platform.c | 112 ++---
 drivers/usb/host/uhci-q.c        | 764 +++++++++++++++----------------
 drivers/usb/host/xhci-ring.c     |   2 +-
 drivers/usb/host/xhci.c          |   2 +-
 drivers/usb/misc/legousbtower.c  |   2 +-
 drivers/usb/usbip/usbip_common.h |   4 +-
 29 files changed, 1283 insertions(+), 1283 deletions(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 60e41b8f5cd0..e3919db6550a 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -20,10 +20,10 @@ config UNIVERSAL_SERIAL_BUS_EHCI_BIG_ENDIAN_MMIO
 config UNIVERSAL_SERIAL_BUS_EHCI_BIG_ENDIAN_DESC
 	bool
 
-config UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
+config UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
 	bool
 
-config UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_DESC
+config UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_DESC
 	bool
 
 menuconfig UNIVERSAL_SERIAL_BUS_SUPPORT
@@ -63,7 +63,7 @@ config UNIVERSAL_SERIAL_BUS
 	  Say Y here if your computer has a host-side UNIVERSAL_SERIAL_BUS port and you want
 	  to use UNIVERSAL_SERIAL_BUS devices.  You then need to say Y to at least one of the
 	  Host Controller Driver (HCD) options below.  Choose a UNIVERSAL_SERIAL_BUS 1.1
-	  controller, such as "UHCI HCD support" or "OPEN_HOST_CONTROLLER_INTERFACE HCD support",
+	  controller, such as "UNIVERSAL_HOST_CONTROLLER_INTERFACE HCD support" or "OPEN_HOST_CONTROLLER_INTERFACE HCD support",
 	  and "EHCI HCD (UNIVERSAL_SERIAL_BUS 2.0) support" except for older systems that
 	  do not have UNIVERSAL_SERIAL_BUS 2.0 support.  It doesn't normally hurt to select
 	  them all if you are not certain.
diff --git a/drivers/usb/Makefile b/drivers/usb/Makefile
index 3e9b5a04191f..80e22e1f8e1e 100644
--- a/drivers/usb/Makefile
+++ b/drivers/usb/Makefile
@@ -22,7 +22,7 @@ obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_PCI)		+= host/
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_EHCI_HCD)	+= host/
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_ISP116X_HCD)	+= host/
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_HCD)	+= host/
-obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_HCD)	+= host/
+obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_HCD)	+= host/
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_FHCI_HCD)	+= host/
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_XHCI_HCD)	+= host/
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_SL811_HCD)	+= host/
diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index e69eefbacab4..57cdb89a9585 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -30,13 +30,13 @@
 
 static DECLARE_RWSEM(companions_rwsem);
 
-#define CL_UHCI		PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UHCI
+#define CL_UNIVERSAL_HOST_CONTROLLER_INTERFACE		PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE
 #define CL_OPEN_HOST_CONTROLLER_INTERFACE		PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE
 #define CL_EHCI		PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_EHCI
 
-static inline int is_open_host_controller_interface_or_uhci(struct pci_dev *pdev)
+static inline int is_open_host_controller_interface_or_universal_host_controller_interface(struct pci_dev *pdev)
 {
-	return pdev->class == CL_OPEN_HOST_CONTROLLER_INTERFACE || pdev->class == CL_UHCI;
+	return pdev->class == CL_OPEN_HOST_CONTROLLER_INTERFACE || pdev->class == CL_UNIVERSAL_HOST_CONTROLLER_INTERFACE;
 }
 
 typedef void (*companion_fn)(struct pci_dev *pdev, struct universal_serial_bus_hcd *hcd,
@@ -62,10 +62,10 @@ static void for_each_companion(struct pci_dev *pdev, struct universal_serial_bus
 			continue;
 
 		/*
-		 * Companion device should be either UHCI,OPEN_HOST_CONTROLLER_INTERFACE or EHCI host
+		 * Companion device should be either UNIVERSAL_HOST_CONTROLLER_INTERFACE,OPEN_HOST_CONTROLLER_INTERFACE or EHCI host
 		 * controller, otherwise skip.
 		 */
-		if (companion->class != CL_UHCI && companion->class != CL_OPEN_HOST_CONTROLLER_INTERFACE &&
+		if (companion->class != CL_UNIVERSAL_HOST_CONTROLLER_INTERFACE && companion->class != CL_OPEN_HOST_CONTROLLER_INTERFACE &&
 				companion->class != CL_EHCI)
 			continue;
 
@@ -87,7 +87,7 @@ static void ehci_pre_add(struct pci_dev *pdev, struct universal_serial_bus_hcd *
 {
 	struct universal_serial_bus_device *udev;
 
-	if (is_open_host_controller_interface_or_uhci(companion)) {
+	if (is_open_host_controller_interface_or_universal_host_controller_interface(companion)) {
 		udev = companion_hcd->self.root_hub;
 		universal_serial_bus_lock_device(udev);
 		universal_serial_bus_set_configuration(udev, 0);
@@ -104,7 +104,7 @@ static void ehci_post_add(struct pci_dev *pdev, struct universal_serial_bus_hcd
 {
 	struct universal_serial_bus_device *udev;
 
-	if (is_open_host_controller_interface_or_uhci(companion)) {
+	if (is_open_host_controller_interface_or_universal_host_controller_interface(companion)) {
 		if (dev_get_drvdata(&pdev->dev)) {	/* Succeeded */
 			dev_dbg(&pdev->dev, "HS companion for %s\n",
 					dev_name(&companion->dev));
@@ -123,7 +123,7 @@ static void ehci_post_add(struct pci_dev *pdev, struct universal_serial_bus_hcd
 static void non_ehci_add(struct pci_dev *pdev, struct universal_serial_bus_hcd *hcd,
 		struct pci_dev *companion, struct universal_serial_bus_hcd *companion_hcd)
 {
-	if (is_open_host_controller_interface_or_uhci(pdev) && companion->class == CL_EHCI) {
+	if (is_open_host_controller_interface_or_universal_host_controller_interface(pdev) && companion->class == CL_EHCI) {
 		dev_dbg(&pdev->dev, "FS/LS companion for %s\n",
 				dev_name(&companion->dev));
 		hcd->self.hs_companion = &companion_hcd->self;
@@ -134,7 +134,7 @@ static void non_ehci_add(struct pci_dev *pdev, struct universal_serial_bus_hcd *
 static void ehci_remove(struct pci_dev *pdev, struct universal_serial_bus_hcd *hcd,
 		struct pci_dev *companion, struct universal_serial_bus_hcd *companion_hcd)
 {
-	if (is_open_host_controller_interface_or_uhci(companion))
+	if (is_open_host_controller_interface_or_universal_host_controller_interface(companion))
 		companion_hcd->self.hs_companion = NULL;
 }
 
@@ -144,7 +144,7 @@ static void ehci_remove(struct pci_dev *pdev, struct universal_serial_bus_hcd *h
 static void ehci_wait_for_companions(struct pci_dev *pdev, struct universal_serial_bus_hcd *hcd,
 		struct pci_dev *companion, struct universal_serial_bus_hcd *companion_hcd)
 {
-	if (is_open_host_controller_interface_or_uhci(companion))
+	if (is_open_host_controller_interface_or_universal_host_controller_interface(companion))
 		device_pm_wait_for_dev(&pdev->dev, &companion->dev);
 }
 
@@ -231,7 +231,7 @@ int universal_serial_bus_hcd_pci_probe(struct pci_dev *dev, const struct pci_dev
 		}
 
 	} else {
-		/* UHCI */
+		/* UNIVERSAL_HOST_CONTROLLER_INTERFACE */
 		int	region;
 
 		for (region = 0; region < PCI_STD_NUM_BARS; region++) {
diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index de993606021d..17fa5beffe53 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -539,7 +539,7 @@ void universal_serial_bus_sg_wait(struct universal_serial_bus_sg_request *io)
 
 			/* no error? continue immediately.
 			 *
-			 * NOTE: to work better with UHCI (4K I/O buffer may
+			 * NOTE: to work better with UNIVERSAL_HOST_CONTROLLER_INTERFACE (4K I/O buffer may
 			 * need 3K of TDs) it may be good to limit how many
 			 * URBs are queued at once; N milliseconds?
 			 */
diff --git a/drivers/usb/core/urb.c b/drivers/usb/core/urb.c
index 76bcaa03652e..a3e71126217d 100644
--- a/drivers/usb/core/urb.c
+++ b/drivers/usb/core/urb.c
@@ -507,7 +507,7 @@ int universal_serial_bus_submit_urb(struct urb *urb, gfp_t mem_flags)
 	 * a power of two (so HCDs don't need to).
 	 *
 	 * FIXME want bus->{intr,iso}_sched_horizon values here.  Each HC
-	 * supports different values... this uses EHCI/UHCI defaults (and
+	 * supports different values... this uses EHCI/UNIVERSAL_HOST_CONTROLLER_INTERFACE defaults (and
 	 * EHCI can use smaller non-default values).
 	 */
 	switch (xfertype) {
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 23e8dd962ad7..dd1b3398a2cd 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -29,7 +29,7 @@ menuconfig UNIVERSAL_SERIAL_BUS_GADGET
 	   talking to it.  Peripheral controllers are often discrete silicon,
 	   or are integrated with the CPU in a microcontroller.  The more
 	   familiar host side controllers have names like "EHCI", "OPEN_HOST_CONTROLLER_INTERFACE",
-	   or "UHCI", and are usually integrated into southbridges on PC
+	   or "UNIVERSAL_HOST_CONTROLLER_INTERFACE", and are usually integrated into southbridges on PC
 	   motherboards.
 
 	   Enable this configuration option if you want to run Linux inside
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 455efd568916..51928f932c27 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -107,11 +107,11 @@ config UNIVERSAL_SERIAL_BUS_EHCI_HCD
 	  configure this Host Controller Driver.
 
 	  EHCI controllers are packaged with "companion" host controllers (OPEN_HOST_CONTROLLER_INTERFACE
-	  or UHCI) to handle UNIVERSAL_SERIAL_BUS 1.1 devices connected to root hub ports.  Ports
+	  or UNIVERSAL_HOST_CONTROLLER_INTERFACE) to handle UNIVERSAL_SERIAL_BUS 1.1 devices connected to root hub ports.  Ports
 	  will connect to EHCI if the device is high speed, otherwise they
 	  connect to a companion controller.  If you configure EHCI, you should
 	  probably configure the OPEN_HOST_CONTROLLER_INTERFACE (for NEC and some other vendors) UNIVERSAL_SERIAL_BUS Host
-	  Controller Driver or UHCI (for Via motherboards) Host Controller
+	  Controller Driver or UNIVERSAL_HOST_CONTROLLER_INTERFACE (for Via motherboards) Host Controller
 	  Driver too.
 
 	  You may want to read <file:Documentation/universal_serial_bus/ehci.rst>.
@@ -124,7 +124,7 @@ config UNIVERSAL_SERIAL_BUS_EHCI_ROOT_HUB_TT
 	depends on UNIVERSAL_SERIAL_BUS_EHCI_HCD
 	---help---
 	  Some EHCI chips have vendor-specific extensions to integrate
-	  transaction translators, so that no OPEN_HOST_CONTROLLER_INTERFACE or UHCI companion
+	  transaction translators, so that no OPEN_HOST_CONTROLLER_INTERFACE or UNIVERSAL_HOST_CONTROLLER_INTERFACE companion
 	  controller is needed.  It's safe to say "y" even if your
 	  controller doesn't support this feature.
 
@@ -388,12 +388,12 @@ config UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_HCD
 	---help---
 	  The Open Host Controller Interface (OPEN_HOST_CONTROLLER_INTERFACE) is a standard for accessing
 	  UNIVERSAL_SERIAL_BUS 1.1 host controller hardware.  It does more in hardware than Intel's
-	  UHCI specification.  If your UNIVERSAL_SERIAL_BUS host controller follows the OPEN_HOST_CONTROLLER_INTERFACE spec,
+	  UNIVERSAL_HOST_CONTROLLER_INTERFACE specification.  If your UNIVERSAL_SERIAL_BUS host controller follows the OPEN_HOST_CONTROLLER_INTERFACE spec,
 	  say Y.  On most non-x86 systems, and on x86 hardware that's not using a
 	  UNIVERSAL_SERIAL_BUS controller from Intel or VIA, this is appropriate.  If your host
 	  controller doesn't use PCI, this is probably appropriate.  For a PCI
 	  based system where you're not sure, the "lspci -v" entry will list the
-	  right "prog-if" for your UNIVERSAL_SERIAL_BUS controller(s):  EHCI, OPEN_HOST_CONTROLLER_INTERFACE, or UHCI.
+	  right "prog-if" for your UNIVERSAL_SERIAL_BUS controller(s):  EHCI, OPEN_HOST_CONTROLLER_INTERFACE, or UNIVERSAL_HOST_CONTROLLER_INTERFACE.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called open_host_controller_interface-hcd.
@@ -583,9 +583,9 @@ config UNIVERSAL_SERIAL_BUS_OCTEON_OPEN_HOST_CONTROLLER_INTERFACE
 
 endif # UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_HCD
 
-config UNIVERSAL_SERIAL_BUS_UHCI_HCD
-	tristate "UHCI HCD (most Intel and VIA) support"
-	depends on UNIVERSAL_SERIAL_BUS_PCI || UNIVERSAL_SERIAL_BUS_UHCI_SUPPORT_NON_PCI_HC
+config UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_HCD
+	tristate "UNIVERSAL_HOST_CONTROLLER_INTERFACE HCD (most Intel and VIA) support"
+	depends on UNIVERSAL_SERIAL_BUS_PCI || UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_SUPPORT_NON_PCI_HC
 	---help---
 	  The Universal Host Controller Interface is a standard by Intel for
 	  accessing the UNIVERSAL_SERIAL_BUS hardware in the PC (which is also called the UNIVERSAL_SERIAL_BUS
@@ -598,17 +598,17 @@ config UNIVERSAL_SERIAL_BUS_UHCI_HCD
 	  If unsure, say Y.
 
 	  To compile this driver as a module, choose M here: the
-	  module will be called uhci-hcd.
+	  module will be called universal_host_controller_interface-hcd.
 
-config UNIVERSAL_SERIAL_BUS_UHCI_SUPPORT_NON_PCI_HC
+config UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_SUPPORT_NON_PCI_HC
 	bool
-	default y if (SPARC_LEON || UNIVERSAL_SERIAL_BUS_UHCI_PLATFORM)
+	default y if (SPARC_LEON || UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_PLATFORM)
 
-config UNIVERSAL_SERIAL_BUS_UHCI_PLATFORM
+config UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_PLATFORM
 	bool
 	default y if (ARCH_VT8500 || ARCH_ASPEED)
 
-config UNIVERSAL_SERIAL_BUS_UHCI_ASPEED
+config UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_ASPEED
 	bool
 	default y if ARCH_ASPEED
 
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index 7719d3ece3e8..38f1d0f2193c 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -67,7 +67,7 @@ obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_HCD_LPC32XX)	+=
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_HCD_PXA27X)	+= open_host_controller_interface-pxa27x.o
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_HCD_DAVINCI)	+= open_host_controller_interface-da8xx.o
 
-obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_HCD)	+= uhci-hcd.o
+obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_HCD)	+= universal_host_controller_interface-hcd.o
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_FHCI_HCD)	+= fhci.o
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_XHCI_HCD)	+= xhci-hcd.o
 obj-$(CONFIG_UNIVERSAL_SERIAL_BUS_XHCI_PCI)	+= xhci-pci.o
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 8a9111d7fe04..51069cefd9cf 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1295,10 +1295,10 @@ static int __init ehci_hcd_init(void)
 
 	printk(KERN_INFO "%s: " DRIVER_DESC "\n", hcd_name);
 	set_bit(UNIVERSAL_SERIAL_BUS_EHCI_LOADED, &universal_serial_bus_hcds_loaded);
-	if (test_bit(UNIVERSAL_SERIAL_BUS_UHCI_LOADED, &universal_serial_bus_hcds_loaded) ||
+	if (test_bit(UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_LOADED, &universal_serial_bus_hcds_loaded) ||
 			test_bit(UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_LOADED, &universal_serial_bus_hcds_loaded))
 		printk(KERN_WARNING "Warning! ehci_hcd should always be loaded"
-				" before uhci_hcd and open_host_controller_interface_hcd, not after\n");
+				" before universal_host_controller_interface_hcd and open_host_controller_interface_hcd, not after\n");
 
 	pr_debug("%s: block sizes: qh %zd qtd %zd itd %zd sitd %zd\n",
 		 hcd_name,
diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
index 5b340d1771b4..244dbeb76875 100644
--- a/drivers/usb/host/ehci-q.c
+++ b/drivers/usb/host/ehci-q.c
@@ -19,7 +19,7 @@
  * interrupts) needs careful scheduling.  Performance improvements can be
  * an ongoing challenge.  That's in "ehci-sched.c".
  *
- * UNIVERSAL_SERIAL_BUS 1.1 devices are handled (a) by "companion" OPEN_HOST_CONTROLLER_INTERFACE or UHCI root hubs,
+ * UNIVERSAL_SERIAL_BUS 1.1 devices are handled (a) by "companion" OPEN_HOST_CONTROLLER_INTERFACE or UNIVERSAL_HOST_CONTROLLER_INTERFACE root hubs,
  * or otherwise through transaction translators (TTs) in UNIVERSAL_SERIAL_BUS 2.0 hubs using
  * (b) special fields in qh entries or (c) split iso entries.  TTs will
  * buffer low/full speed data so the host collects it at high speed.
diff --git a/drivers/usb/host/fotg210-hcd.c b/drivers/usb/host/fotg210-hcd.c
index 99b4ebe166ba..6d0b84341207 100644
--- a/drivers/usb/host/fotg210-hcd.c
+++ b/drivers/usb/host/fotg210-hcd.c
@@ -1985,7 +1985,7 @@ static int fotg210_mem_init(struct fotg210_hcd *fotg210, gfp_t flags)
  * interrupts) needs careful scheduling.  Performance improvements can be
  * an ongoing challenge.  That's in "ehci-sched.c".
  *
- * UNIVERSAL_SERIAL_BUS 1.1 devices are handled (a) by "companion" OPEN_HOST_CONTROLLER_INTERFACE or UHCI root hubs,
+ * UNIVERSAL_SERIAL_BUS 1.1 devices are handled (a) by "companion" OPEN_HOST_CONTROLLER_INTERFACE or UNIVERSAL_HOST_CONTROLLER_INTERFACE root hubs,
  * or otherwise through transaction translators (TTs) in UNIVERSAL_SERIAL_BUS 2.0 hubs using
  * (b) special fields in qh entries or (c) split iso entries.  TTs will
  * buffer low/full speed data so the host collects it at high speed.
@@ -5704,9 +5704,9 @@ static int __init fotg210_hcd_init(void)
 
 	pr_info("%s: " DRIVER_DESC "\n", hcd_name);
 	set_bit(UNIVERSAL_SERIAL_BUS_EHCI_LOADED, &universal_serial_bus_hcds_loaded);
-	if (test_bit(UNIVERSAL_SERIAL_BUS_UHCI_LOADED, &universal_serial_bus_hcds_loaded) ||
+	if (test_bit(UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_LOADED, &universal_serial_bus_hcds_loaded) ||
 			test_bit(UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE_LOADED, &universal_serial_bus_hcds_loaded))
-		pr_warn("Warning! fotg210_hcd should always be loaded before uhci_hcd and open_host_controller_interface_hcd, not after\n");
+		pr_warn("Warning! fotg210_hcd should always be loaded before universal_host_controller_interface_hcd and open_host_controller_interface_hcd, not after\n");
 
 	pr_debug("%s: block sizes: qh %zd qtd %zd itd %zd\n",
 			hcd_name, sizeof(struct fotg210_qh),
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 58c3b7fc6211..c378f10819f3 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -8,14 +8,14 @@
  * (C) Copyright 2000-2004 David Brownell <dbrownell@users.sourceforge.net>
  *
  * [ Initialisation is based on Linus'  ]
- * [ uhci code and gregs open_host_controller_interface fragments ]
+ * [ universal_host_controller_interface code and gregs open_host_controller_interface fragments ]
  * [ (C) Copyright 1999 Linus Torvalds  ]
  * [ (C) Copyright 1999 Gregory P. Smith]
  *
  *
  * OPEN_HOST_CONTROLLER_INTERFACE is the main "non-Intel/VIA" standard for UNIVERSAL_SERIAL_BUS 1.1 host controller
  * interfaces (though some non-x86 Intel chips use it).  It supports
- * smarter hardware than UHCI.  A download link for the spec available
+ * smarter hardware than UNIVERSAL_HOST_CONTROLLER_INTERFACE.  A download link for the spec available
  * through the http://www.universal_serial_bus.org website.
  *
  * This file is licenced under the GPL.
diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index 02d15c41ed80..98893d70cc26 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -6,7 +6,7 @@
  * (C) Copyright 2000-2002 David Brownell <dbrownell@users.sourceforge.net>
  *
  * [ Initialisation is based on Linus'  ]
- * [ uhci code and gregs open_host_controller_interface fragments ]
+ * [ universal_host_controller_interface code and gregs open_host_controller_interface fragments ]
  * [ (C) Copyright 1999 Linus Torvalds  ]
  * [ (C) Copyright 1999 Gregory P. Smith]
  *
diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 057ca584d8d2..892676fe6846 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -49,9 +49,9 @@
 #define UHCREV		(0x0000) /* UHC HCI Spec Revision */
 #define UHCHCON		(0x0004) /* UHC Host Control Register */
 #define UHCCOMS		(0x0008) /* UHC Command Status Register */
-#define UHCINTS		(0x000C) /* UHC Interrupt Status Register */
-#define UHCINTE		(0x0010) /* UHC Interrupt Enable */
-#define UHCINTD		(0x0014) /* UHC Interrupt Disable */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACENTS		(0x000C) /* UHC Interrupt Status Register */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACENTE		(0x0010) /* UHC Interrupt Enable */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACENTD		(0x0014) /* UHC Interrupt Disable */
 #define UHCHCCA		(0x0018) /* UHC Host Controller Comm. Area */
 #define UHCPCED		(0x001C) /* UHC Period Current Endpt Descr */
 #define UHCCHED		(0x0020) /* UHC Control Head Endpt Descr */
diff --git a/drivers/usb/host/ohci.h b/drivers/usb/host/ohci.h
index ad4034056330..c36dd887fc5d 100644
--- a/drivers/usb/host/ohci.h
+++ b/drivers/usb/host/ohci.h
@@ -21,7 +21,7 @@ typedef __u16 __bitwise __hc16;
  * See OPEN_HOST_CONTROLLER_INTERFACE spec, section 4.2
  *
  * This is a "Queue Head" for those transfers, which is why
- * both EHCI and UHCI call similar structures a "QH".
+ * both EHCI and UNIVERSAL_HOST_CONTROLLER_INTERFACE call similar structures a "QH".
  */
 struct ed {
 	/* first fields are hardware-specified */
diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index efd03cf52aa4..4a4494f18b03 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -20,16 +20,16 @@
 #include "xhci-ext-caps.h"
 
 
-#define UHCI_UNIVERSAL_SERIAL_BUSLEGSUP		0xc0		/* legacy support */
-#define UHCI_UNIVERSAL_SERIAL_BUSCMD		0		/* command register */
-#define UHCI_UNIVERSAL_SERIAL_BUSINTR		4		/* interrupt register */
-#define UHCI_UNIVERSAL_SERIAL_BUSLEGSUP_RWC	0x8f00		/* the R/WC bits */
-#define UHCI_UNIVERSAL_SERIAL_BUSLEGSUP_RO	0x5040		/* R/O and reserved bits */
-#define UHCI_UNIVERSAL_SERIAL_BUSCMD_RUN		0x0001		/* RUN/STOP bit */
-#define UHCI_UNIVERSAL_SERIAL_BUSCMD_HCRESET	0x0002		/* Host Controller reset */
-#define UHCI_UNIVERSAL_SERIAL_BUSCMD_EGSM	0x0008		/* Global Suspend Mode */
-#define UHCI_UNIVERSAL_SERIAL_BUSCMD_CONFIGURE	0x0040		/* Config Flag */
-#define UHCI_UNIVERSAL_SERIAL_BUSINTR_RESUME	0x0002		/* Resume interrupt enable */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP		0xc0		/* legacy support */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD		0		/* command register */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSINTR		4		/* interrupt register */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP_RWC	0x8f00		/* the R/WC bits */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP_RO	0x5040		/* R/O and reserved bits */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_RUN		0x0001		/* RUN/STOP bit */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_HCRESET	0x0002		/* Host Controller reset */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_EGSM	0x0008		/* Global Suspend Mode */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_CONFIGURE	0x0040		/* Config Flag */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSINTR_RESUME	0x0002		/* Resume interrupt enable */
 
 #define OPEN_HOST_CONTROLLER_INTERFACE_CONTROL		0x04
 #define OPEN_HOST_CONTROLLER_INTERFACE_CMDSTATUS		0x08
@@ -634,31 +634,31 @@ EXPORT_SYMBOL_GPL(universal_serial_bus_amd_pt_check_port);
  * Make sure the controller is completely inactive, unable to
  * generate interrupts or do DMA.
  */
-void uhci_reset_hc(struct pci_dev *pdev, unsigned long base)
+void universal_host_controller_interface_reset_hc(struct pci_dev *pdev, unsigned long base)
 {
 	/* Turn off PIRQ enable and SMI enable.  (This also turns off the
 	 * BIOS's UNIVERSAL_SERIAL_BUS Legacy Support.)  Turn off all the R/WC bits too.
 	 */
-	pci_write_config_word(pdev, UHCI_UNIVERSAL_SERIAL_BUSLEGSUP, UHCI_UNIVERSAL_SERIAL_BUSLEGSUP_RWC);
+	pci_write_config_word(pdev, UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP, UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP_RWC);
 
 	/* Reset the HC - this will force us to get a
 	 * new notification of any already connected
 	 * ports due to the virtual disconnect that it
 	 * implies.
 	 */
-	outw(UHCI_UNIVERSAL_SERIAL_BUSCMD_HCRESET, base + UHCI_UNIVERSAL_SERIAL_BUSCMD);
+	outw(UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_HCRESET, base + UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD);
 	mb();
 	udelay(5);
-	if (inw(base + UHCI_UNIVERSAL_SERIAL_BUSCMD) & UHCI_UNIVERSAL_SERIAL_BUSCMD_HCRESET)
+	if (inw(base + UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD) & UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_HCRESET)
 		dev_warn(&pdev->dev, "HCRESET not completed yet!\n");
 
 	/* Just to be safe, disable interrupt requests and
 	 * make sure the controller is stopped.
 	 */
-	outw(0, base + UHCI_UNIVERSAL_SERIAL_BUSINTR);
-	outw(0, base + UHCI_UNIVERSAL_SERIAL_BUSCMD);
+	outw(0, base + UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSINTR);
+	outw(0, base + UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD);
 }
-EXPORT_SYMBOL_GPL(uhci_reset_hc);
+EXPORT_SYMBOL_GPL(universal_host_controller_interface_reset_hc);
 
 /*
  * Initialize a controller that was newly discovered or has just been
@@ -666,7 +666,7 @@ EXPORT_SYMBOL_GPL(uhci_reset_hc);
  *
  * Returns: 1 if the controller was reset, 0 otherwise.
  */
-int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base)
+int universal_host_controller_interface_check_and_reset_hc(struct pci_dev *pdev, unsigned long base)
 {
 	u16 legsup;
 	unsigned int cmd, intr;
@@ -681,23 +681,23 @@ int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base)
 	 *
 	 * If any of these conditions are violated we do a complete reset.
 	 */
-	pci_read_config_word(pdev, UHCI_UNIVERSAL_SERIAL_BUSLEGSUP, &legsup);
-	if (legsup & ~(UHCI_UNIVERSAL_SERIAL_BUSLEGSUP_RO | UHCI_UNIVERSAL_SERIAL_BUSLEGSUP_RWC)) {
+	pci_read_config_word(pdev, UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP, &legsup);
+	if (legsup & ~(UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP_RO | UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSLEGSUP_RWC)) {
 		dev_dbg(&pdev->dev, "%s: legsup = 0x%04x\n",
 				__func__, legsup);
 		goto reset_needed;
 	}
 
-	cmd = inw(base + UHCI_UNIVERSAL_SERIAL_BUSCMD);
-	if ((cmd & UHCI_UNIVERSAL_SERIAL_BUSCMD_RUN) || !(cmd & UHCI_UNIVERSAL_SERIAL_BUSCMD_CONFIGURE) ||
-			!(cmd & UHCI_UNIVERSAL_SERIAL_BUSCMD_EGSM)) {
+	cmd = inw(base + UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD);
+	if ((cmd & UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_RUN) || !(cmd & UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_CONFIGURE) ||
+			!(cmd & UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSCMD_EGSM)) {
 		dev_dbg(&pdev->dev, "%s: cmd = 0x%04x\n",
 				__func__, cmd);
 		goto reset_needed;
 	}
 
-	intr = inw(base + UHCI_UNIVERSAL_SERIAL_BUSINTR);
-	if (intr & (~UHCI_UNIVERSAL_SERIAL_BUSINTR_RESUME)) {
+	intr = inw(base + UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSINTR);
+	if (intr & (~UNIVERSAL_HOST_CONTROLLER_INTERFACE_UNIVERSAL_SERIAL_BUSINTR_RESUME)) {
 		dev_dbg(&pdev->dev, "%s: intr = 0x%04x\n",
 				__func__, intr);
 		goto reset_needed;
@@ -706,10 +706,10 @@ int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base)
 
 reset_needed:
 	dev_dbg(&pdev->dev, "Performing full reset\n");
-	uhci_reset_hc(pdev, base);
+	universal_host_controller_interface_reset_hc(pdev, base);
 	return 1;
 }
-EXPORT_SYMBOL_GPL(uhci_check_and_reset_hc);
+EXPORT_SYMBOL_GPL(universal_host_controller_interface_check_and_reset_hc);
 
 static inline int io_type_enabled(struct pci_dev *pdev, unsigned int mask)
 {
@@ -720,7 +720,7 @@ static inline int io_type_enabled(struct pci_dev *pdev, unsigned int mask)
 #define pio_enabled(dev) io_type_enabled(dev, PCI_COMMAND_IO)
 #define mmio_enabled(dev) io_type_enabled(dev, PCI_COMMAND_MEMORY)
 
-static void quirk_universal_serial_bus_handoff_uhci(struct pci_dev *pdev)
+static void quirk_universal_serial_bus_handoff_universal_host_controller_interface(struct pci_dev *pdev)
 {
 	unsigned long base = 0;
 	int i;
@@ -735,7 +735,7 @@ static void quirk_universal_serial_bus_handoff_uhci(struct pci_dev *pdev)
 		}
 
 	if (base)
-		uhci_check_and_reset_hc(pdev, base);
+		universal_host_controller_interface_check_and_reset_hc(pdev, base);
 }
 
 static int mmio_resource_enabled(struct pci_dev *pdev, int idx)
@@ -1248,7 +1248,7 @@ static void quirk_universal_serial_bus_early_handoff(struct pci_dev *pdev)
 	 */
 	if (pdev->vendor == 0x184e)	/* vendor Netlogic */
 		return;
-	if (pdev->class != PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UHCI &&
+	if (pdev->class != PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE &&
 			pdev->class != PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE &&
 			pdev->class != PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_EHCI &&
 			pdev->class != PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_XHCI)
@@ -1259,8 +1259,8 @@ static void quirk_universal_serial_bus_early_handoff(struct pci_dev *pdev)
 			 "Can't enable PCI device, BIOS handoff failed.\n");
 		return;
 	}
-	if (pdev->class == PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UHCI)
-		quirk_universal_serial_bus_handoff_uhci(pdev);
+	if (pdev->class == PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE)
+		quirk_universal_serial_bus_handoff_universal_host_controller_interface(pdev);
 	else if (pdev->class == PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_OPEN_HOST_CONTROLLER_INTERFACE)
 		quirk_universal_serial_bus_handoff_open_host_controller_interface(pdev);
 	else if (pdev->class == PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_EHCI)
diff --git a/drivers/usb/host/pci-quirks.h b/drivers/usb/host/pci-quirks.h
index 468497334f15..31c6b0aef6d6 100644
--- a/drivers/usb/host/pci-quirks.h
+++ b/drivers/usb/host/pci-quirks.h
@@ -3,8 +3,8 @@
 #define __LINUX_UNIVERSAL_SERIAL_BUS_PCI_QUIRKS_H
 
 #ifdef CONFIG_UNIVERSAL_SERIAL_BUS_PCI
-void uhci_reset_hc(struct pci_dev *pdev, unsigned long base);
-int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base);
+void universal_host_controller_interface_reset_hc(struct pci_dev *pdev, unsigned long base);
+int universal_host_controller_interface_check_and_reset_hc(struct pci_dev *pdev, unsigned long base);
 int universal_serial_bus_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev);
 bool universal_serial_bus_amd_hang_symptom_quirk(void);
 bool universal_serial_bus_amd_prefetch_quirk(void);
diff --git a/drivers/usb/host/uhci-debug.c b/drivers/usb/host/uhci-debug.c
index ecc48b8c7c7a..6eaa57ee401f 100644
--- a/drivers/usb/host/uhci-debug.c
+++ b/drivers/usb/host/uhci-debug.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * UHCI-specific debugging code. Invaluable when something
+ * UNIVERSAL_HOST_CONTROLLER_INTERFACE-specific debugging code. Invaluable when something
  * goes wrong, but don't get in my face.
  *
  * Kernel visible pointers are surrounded in []s and bus
@@ -15,11 +15,11 @@
 #include <linux/debugfs.h>
 #include <asm/io.h>
 
-#include "uhci-hcd.h"
+#include "universal_host_controller_interface-hcd.h"
 
 #define EXTRA_SPACE	1024
 
-static struct dentry *uhci_debugfs_root;
+static struct dentry *universal_host_controller_interface_debugfs_root;
 
 #ifdef CONFIG_DYNAMIC_DEBUG
 
@@ -40,16 +40,16 @@ static void lprintk(char *buf)
 	}
 }
 
-static int uhci_show_td(struct uhci_hcd *uhci, struct uhci_td *td, char *buf,
+static int universal_host_controller_interface_show_td(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_td *td, char *buf,
 			int len, int space)
 {
 	char *out = buf;
 	char *spid;
 	u32 status, token;
 
-	status = td_status(uhci, td);
+	status = td_status(universal_host_controller_interface, td);
 	out += sprintf(out, "%*s[%p] link (%08x) ", space, "", td,
-		hc32_to_cpu(uhci, td->link));
+		hc32_to_cpu(universal_host_controller_interface, td->link));
 	out += sprintf(out, "e%d %s%s%s%s%s%s%s%s%s%sLength=%x ",
 		((status >> 27) & 3),
 		(status & TD_CTRL_SPD) ?      "SPD " : "",
@@ -66,8 +66,8 @@ static int uhci_show_td(struct uhci_hcd *uhci, struct uhci_td *td, char *buf,
 	if (out - buf > len)
 		goto done;
 
-	token = td_token(uhci, td);
-	switch (uhci_packetid(token)) {
+	token = td_token(universal_host_controller_interface, td);
+	switch (universal_host_controller_interface_packetid(token)) {
 		case UNIVERSAL_SERIAL_BUS_PID_SETUP:
 			spid = "SETUP";
 			break;
@@ -89,7 +89,7 @@ static int uhci_show_td(struct uhci_hcd *uhci, struct uhci_td *td, char *buf,
 		(token >> 8) & 127,
 		(token & 0xff),
 		spid);
-	out += sprintf(out, "(buf=%08x)\n", hc32_to_cpu(uhci, td->buffer));
+	out += sprintf(out, "(buf=%08x)\n", hc32_to_cpu(universal_host_controller_interface, td->buffer));
 
 done:
 	if (out - buf > len)
@@ -97,11 +97,11 @@ static int uhci_show_td(struct uhci_hcd *uhci, struct uhci_td *td, char *buf,
 	return out - buf;
 }
 
-static int uhci_show_urbp(struct uhci_hcd *uhci, struct urb_priv *urbp,
+static int universal_host_controller_interface_show_urbp(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb_priv *urbp,
 			char *buf, int len, int space)
 {
 	char *out = buf;
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 	int i, nactive, ninactive;
 	char *ptype;
 
@@ -140,12 +140,12 @@ static int uhci_show_urbp(struct uhci_hcd *uhci, struct urb_priv *urbp,
 		if (urbp->qh->type != UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC &&
 				(++i <= 10 || debug > 2)) {
 			out += sprintf(out, "%*s%d: ", space + 2, "", i);
-			out += uhci_show_td(uhci, td, out,
+			out += universal_host_controller_interface_show_td(universal_host_controller_interface, td, out,
 					len - (out - buf), 0);
 			if (out - buf > len)
 				goto tail;
 		} else {
-			if (td_status(uhci, td) & TD_CTRL_ACTIVE)
+			if (td_status(universal_host_controller_interface, td) & TD_CTRL_ACTIVE)
 				++nactive;
 			else
 				++ninactive;
@@ -162,8 +162,8 @@ static int uhci_show_urbp(struct uhci_hcd *uhci, struct urb_priv *urbp,
 	return out - buf;
 }
 
-static int uhci_show_qh(struct uhci_hcd *uhci,
-		struct uhci_qh *qh, char *buf, int len, int space)
+static int universal_host_controller_interface_show_qh(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
+		struct universal_host_controller_interface_qh *qh, char *buf, int len, int space)
 {
 	char *out = buf;
 	int i, nurbs;
@@ -180,8 +180,8 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 
 	out += sprintf(out, "%*s[%p] %s QH link (%08x) element (%08x)\n",
 			space, "", qh, qtype,
-			hc32_to_cpu(uhci, qh->link),
-			hc32_to_cpu(uhci, element));
+			hc32_to_cpu(universal_host_controller_interface, qh->link),
+			hc32_to_cpu(universal_host_controller_interface, element));
 	if (qh->type == UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC)
 		out += sprintf(out,
 				"%*s    period %d phase %d load %d us, frame %x desc [%p]\n",
@@ -193,16 +193,16 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 	if (out - buf > len)
 		goto done;
 
-	if (element & UHCI_PTR_QH(uhci))
+	if (element & UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_QH(universal_host_controller_interface))
 		out += sprintf(out, "%*s  Element points to QH (bug?)\n", space, "");
 
-	if (element & UHCI_PTR_DEPTH(uhci))
+	if (element & UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_DEPTH(universal_host_controller_interface))
 		out += sprintf(out, "%*s  Depth traverse\n", space, "");
 
-	if (element & cpu_to_hc32(uhci, 8))
+	if (element & cpu_to_hc32(universal_host_controller_interface, 8))
 		out += sprintf(out, "%*s  Bit 3 set (bug?)\n", space, "");
 
-	if (!(element & ~(UHCI_PTR_QH(uhci) | UHCI_PTR_DEPTH(uhci))))
+	if (!(element & ~(UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_QH(universal_host_controller_interface) | UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_DEPTH(universal_host_controller_interface))))
 		out += sprintf(out, "%*s  Element is NULL (bug?)\n", space, "");
 
 	if (out - buf > len)
@@ -210,8 +210,8 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 
 	if (list_empty(&qh->queue)) {
 		out += sprintf(out, "%*s  queue is empty\n", space, "");
-		if (qh == uhci->skel_async_qh) {
-			out += uhci_show_td(uhci, uhci->term_td, out,
+		if (qh == universal_host_controller_interface->skel_async_qh) {
+			out += universal_host_controller_interface_show_td(universal_host_controller_interface, universal_host_controller_interface->term_td, out,
 					len - (out - buf), 0);
 			if (out - buf > len)
 				goto tail;
@@ -219,16 +219,16 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 	} else {
 		struct urb_priv *urbp = list_entry(qh->queue.next,
 				struct urb_priv, node);
-		struct uhci_td *td = list_entry(urbp->td_list.next,
-				struct uhci_td, list);
+		struct universal_host_controller_interface_td *td = list_entry(urbp->td_list.next,
+				struct universal_host_controller_interface_td, list);
 
-		if (element != LINK_TO_TD(uhci, td))
+		if (element != LINK_TO_TD(universal_host_controller_interface, td))
 			out += sprintf(out, "%*s Element != First TD\n",
 					space, "");
 		i = nurbs = 0;
 		list_for_each_entry(urbp, &qh->queue, node) {
 			if (++i <= 10) {
-				out += uhci_show_urbp(uhci, urbp, out,
+				out += universal_host_controller_interface_show_urbp(universal_host_controller_interface, urbp, out,
 						len - (out - buf), space + 2);
 				if (out - buf > len)
 					goto tail;
@@ -246,7 +246,7 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 
 	if (qh->dummy_td) {
 		out += sprintf(out, "%*s  Dummy TD\n", space, "");
-		out += uhci_show_td(uhci, qh->dummy_td, out,
+		out += universal_host_controller_interface_show_td(universal_host_controller_interface, qh->dummy_td, out,
 				len - (out - buf), 0);
 		if (out - buf > len)
 			goto tail;
@@ -259,7 +259,7 @@ static int uhci_show_qh(struct uhci_hcd *uhci,
 	return out - buf;
 }
 
-static int uhci_show_sc(int port, unsigned short status, char *buf)
+static int universal_host_controller_interface_show_sc(int port, unsigned short status, char *buf)
 {
 	return sprintf(buf, "  stat%d     =     %04x  %s%s%s%s%s%s%s%s%s%s\n",
 		port,
@@ -276,33 +276,33 @@ static int uhci_show_sc(int port, unsigned short status, char *buf)
 		(status & UNIVERSAL_SERIAL_BUSPORTSC_CCS) ?	" Connected" : "");
 }
 
-static int uhci_show_root_hub_state(struct uhci_hcd *uhci, char *buf)
+static int universal_host_controller_interface_show_root_hub_state(struct universal_host_controller_interface_hcd *universal_host_controller_interface, char *buf)
 {
 	char *rh_state;
 
-	switch (uhci->rh_state) {
-	    case UHCI_RH_RESET:
+	switch (universal_host_controller_interface->rh_state) {
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RESET:
 		rh_state = "reset";		break;
-	    case UHCI_RH_SUSPENDED:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDED:
 		rh_state = "suspended";		break;
-	    case UHCI_RH_AUTO_STOPPED:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_AUTO_STOPPED:
 		rh_state = "auto-stopped";	break;
-	    case UHCI_RH_RESUMING:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RESUMING:
 		rh_state = "resuming";		break;
-	    case UHCI_RH_SUSPENDING:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDING:
 		rh_state = "suspending";	break;
-	    case UHCI_RH_RUNNING:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING:
 		rh_state = "running";		break;
-	    case UHCI_RH_RUNNING_NODEVS:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING_NODEVS:
 		rh_state = "running, no devs";	break;
 	    default:
 		rh_state = "?";			break;
 	}
 	return sprintf(buf, "Root-hub state: %s   FSBR: %d\n",
-			rh_state, uhci->fsbr_is_on);
+			rh_state, universal_host_controller_interface->fsbr_is_on);
 }
 
-static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
+static int universal_host_controller_interface_show_status(struct universal_host_controller_interface_hcd *universal_host_controller_interface, char *buf, int len)
 {
 	char *out = buf;
 	unsigned short universal_serial_buscmd, universal_serial_busstat, universal_serial_busint, universal_serial_busfrnum;
@@ -311,14 +311,14 @@ static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
 	unsigned short portsc1, portsc2;
 
 
-	universal_serial_buscmd    = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSCMD);
-	universal_serial_busstat   = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSSTS);
-	universal_serial_busint    = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSINTR);
-	universal_serial_busfrnum  = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSFRNUM);
-	flbaseadd = uhci_readl(uhci, UNIVERSAL_SERIAL_BUSFLBASEADD);
-	sof       = uhci_readb(uhci, UNIVERSAL_SERIAL_BUSSOF);
-	portsc1   = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSPORTSC1);
-	portsc2   = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSPORTSC2);
+	universal_serial_buscmd    = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD);
+	universal_serial_busstat   = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSSTS);
+	universal_serial_busint    = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSINTR);
+	universal_serial_busfrnum  = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSFRNUM);
+	flbaseadd = universal_host_controller_interface_readl(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSFLBASEADD);
+	sof       = universal_host_controller_interface_readb(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSSOF);
+	portsc1   = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSPORTSC1);
+	portsc2   = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSPORTSC2);
 
 	out += sprintf(out, "  universal_serial_buscmd    =     %04x   %s%s%s%s%s%s%s%s\n",
 		universal_serial_buscmd,
@@ -352,18 +352,18 @@ static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
 	if (out - buf > len)
 		goto done;
 
-	out += uhci_show_sc(1, portsc1, out);
+	out += universal_host_controller_interface_show_sc(1, portsc1, out);
 	if (out - buf > len)
 		goto done;
 
-	out += uhci_show_sc(2, portsc2, out);
+	out += universal_host_controller_interface_show_sc(2, portsc2, out);
 	if (out - buf > len)
 		goto done;
 
 	out += sprintf(out,
 			"Most recent frame: %x (%d)   Last ISO frame: %x (%d)\n",
-			uhci->frame_number, uhci->frame_number & 1023,
-			uhci->last_iso_frame, uhci->last_iso_frame & 1023);
+			universal_host_controller_interface->frame_number, universal_host_controller_interface->frame_number & 1023,
+			universal_host_controller_interface->last_iso_frame, universal_host_controller_interface->last_iso_frame & 1023);
 
 done:
 	if (out - buf > len)
@@ -371,12 +371,12 @@ static int uhci_show_status(struct uhci_hcd *uhci, char *buf, int len)
 	return out - buf;
 }
 
-static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
+static int universal_host_controller_interface_sprint_schedule(struct universal_host_controller_interface_hcd *universal_host_controller_interface, char *buf, int len)
 {
 	char *out = buf;
 	int i, j;
-	struct uhci_qh *qh;
-	struct uhci_td *td;
+	struct universal_host_controller_interface_qh *qh;
+	struct universal_host_controller_interface_td *td;
 	struct list_head *tmp, *head;
 	int nframes, nerrs;
 	__hc32 link;
@@ -387,53 +387,53 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 		"int8", "int4", "int2", "async", "term"
 	};
 
-	out += uhci_show_root_hub_state(uhci, out);
+	out += universal_host_controller_interface_show_root_hub_state(universal_host_controller_interface, out);
 	if (out - buf > len)
 		goto done;
 	out += sprintf(out, "HC status\n");
-	out += uhci_show_status(uhci, out, len - (out - buf));
+	out += universal_host_controller_interface_show_status(universal_host_controller_interface, out, len - (out - buf));
 	if (out - buf > len)
 		goto tail;
 
 	out += sprintf(out, "Periodic load table\n");
 	for (i = 0; i < MAX_PHASE; ++i) {
-		out += sprintf(out, "\t%d", uhci->load[i]);
+		out += sprintf(out, "\t%d", universal_host_controller_interface->load[i]);
 		if (i % 8 == 7)
 			*out++ = '\n';
 	}
 	out += sprintf(out, "Total: %d, #INT: %d, #ISO: %d\n",
-			uhci->total_load,
-			uhci_to_hcd(uhci)->self.bandwidth_int_reqs,
-			uhci_to_hcd(uhci)->self.bandwidth_isoc_reqs);
+			universal_host_controller_interface->total_load,
+			universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_int_reqs,
+			universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_isoc_reqs);
 	if (debug <= 1)
 		goto tail;
 
 	out += sprintf(out, "Frame List\n");
 	nframes = 10;
 	nerrs = 0;
-	for (i = 0; i < UHCI_NUMFRAMES; ++i) {
+	for (i = 0; i < UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES; ++i) {
 		__hc32 qh_dma;
 
 		if (out - buf > len)
 			goto done;
 		j = 0;
-		td = uhci->frame_cpu[i];
-		link = uhci->frame[i];
+		td = universal_host_controller_interface->frame_cpu[i];
+		link = universal_host_controller_interface->frame[i];
 		if (!td)
 			goto check_link;
 
 		if (nframes > 0) {
 			out += sprintf(out, "- Frame %d -> (%08x)\n",
-					i, hc32_to_cpu(uhci, link));
+					i, hc32_to_cpu(universal_host_controller_interface, link));
 			j = 1;
 		}
 
 		head = &td->fl_list;
 		tmp = head;
 		do {
-			td = list_entry(tmp, struct uhci_td, fl_list);
+			td = list_entry(tmp, struct universal_host_controller_interface_td, fl_list);
 			tmp = tmp->next;
-			if (link != LINK_TO_TD(uhci, td)) {
+			if (link != LINK_TO_TD(universal_host_controller_interface, td)) {
 				if (nframes > 0) {
 					out += sprintf(out,
 						"    link does not match list entry!\n");
@@ -443,7 +443,7 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 					++nerrs;
 			}
 			if (nframes > 0) {
-				out += uhci_show_td(uhci, td, out,
+				out += universal_host_controller_interface_show_td(universal_host_controller_interface, td, out,
 						len - (out - buf), 4);
 				if (out - buf > len)
 					goto tail;
@@ -452,18 +452,18 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 		} while (tmp != head);
 
 check_link:
-		qh_dma = uhci_frame_skel_link(uhci, i);
+		qh_dma = universal_host_controller_interface_frame_skel_link(universal_host_controller_interface, i);
 		if (link != qh_dma) {
 			if (nframes > 0) {
 				if (!j) {
 					out += sprintf(out,
 						"- Frame %d -> (%08x)\n",
-						i, hc32_to_cpu(uhci, link));
+						i, hc32_to_cpu(universal_host_controller_interface, link));
 					j = 1;
 				}
 				out += sprintf(out,
 					"   link does not match QH (%08x)!\n",
-					hc32_to_cpu(uhci, qh_dma));
+					hc32_to_cpu(universal_host_controller_interface, qh_dma));
 				if (out - buf > len)
 					goto done;
 			} else
@@ -480,18 +480,18 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 		goto done;
 
 	fsbr_link = 0;
-	for (i = 0; i < UHCI_NUM_SKELQH; ++i) {
+	for (i = 0; i < UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUM_SKELQH; ++i) {
 		int cnt = 0;
 
-		qh = uhci->skelqh[i];
+		qh = universal_host_controller_interface->skelqh[i];
 		out += sprintf(out, "- skel_%s_qh\n", qh_names[i]);
-		out += uhci_show_qh(uhci, qh, out, len - (out - buf), 4);
+		out += universal_host_controller_interface_show_qh(universal_host_controller_interface, qh, out, len - (out - buf), 4);
 		if (out - buf > len)
 			goto tail;
 
 		/* Last QH is the Terminating QH, it's different */
 		if (i == SKEL_TERM) {
-			if (qh_element(qh) != LINK_TO_TD(uhci, uhci->term_td)) {
+			if (qh_element(qh) != LINK_TO_TD(universal_host_controller_interface, universal_host_controller_interface->term_td)) {
 				out += sprintf(out,
 					"    skel_term_qh element is not set to term_td!\n");
 				if (out - buf > len)
@@ -499,7 +499,7 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 			}
 			link = fsbr_link;
 			if (!link)
-				link = LINK_TO_QH(uhci, uhci->skel_term_qh);
+				link = LINK_TO_QH(universal_host_controller_interface, universal_host_controller_interface->skel_term_qh);
 			goto check_qh_link;
 		}
 
@@ -507,29 +507,29 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 		tmp = head->next;
 
 		while (tmp != head) {
-			qh = list_entry(tmp, struct uhci_qh, node);
+			qh = list_entry(tmp, struct universal_host_controller_interface_qh, node);
 			tmp = tmp->next;
 			if (++cnt <= 10) {
-				out += uhci_show_qh(uhci, qh, out,
+				out += universal_host_controller_interface_show_qh(universal_host_controller_interface, qh, out,
 						len - (out - buf), 4);
 				if (out - buf > len)
 					goto tail;
 			}
 			if (!fsbr_link && qh->skel >= SKEL_FSBR)
-				fsbr_link = LINK_TO_QH(uhci, qh);
+				fsbr_link = LINK_TO_QH(universal_host_controller_interface, qh);
 		}
 		if ((cnt -= 10) > 0)
 			out += sprintf(out, "    Skipped %d QHs\n", cnt);
 
-		link = UHCI_PTR_TERM(uhci);
+		link = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
 		if (i <= SKEL_ISO)
 			;
 		else if (i < SKEL_ASYNC)
-			link = LINK_TO_QH(uhci, uhci->skel_async_qh);
-		else if (!uhci->fsbr_is_on)
+			link = LINK_TO_QH(universal_host_controller_interface, universal_host_controller_interface->skel_async_qh);
+		else if (!universal_host_controller_interface->fsbr_is_on)
 			;
 		else
-			link = LINK_TO_QH(uhci, uhci->skel_term_qh);
+			link = LINK_TO_QH(universal_host_controller_interface, universal_host_controller_interface->skel_term_qh);
 check_qh_link:
 		if (qh->link != link)
 			out += sprintf(out,
@@ -550,15 +550,15 @@ static int uhci_sprint_schedule(struct uhci_hcd *uhci, char *buf, int len)
 
 #define MAX_OUTPUT	(64 * 1024)
 
-struct uhci_debug {
+struct universal_host_controller_interface_debug {
 	int size;
 	char *data;
 };
 
-static int uhci_debug_open(struct inode *inode, struct file *file)
+static int universal_host_controller_interface_debug_open(struct inode *inode, struct file *file)
 {
-	struct uhci_hcd *uhci = inode->i_private;
-	struct uhci_debug *up;
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = inode->i_private;
+	struct universal_host_controller_interface_debug *up;
 	unsigned long flags;
 
 	up = kmalloc(sizeof(*up), GFP_KERNEL);
@@ -572,33 +572,33 @@ static int uhci_debug_open(struct inode *inode, struct file *file)
 	}
 
 	up->size = 0;
-	spin_lock_irqsave(&uhci->lock, flags);
-	if (uhci->is_initialized)
-		up->size = uhci_sprint_schedule(uhci, up->data,
+	spin_lock_irqsave(&universal_host_controller_interface->lock, flags);
+	if (universal_host_controller_interface->is_initialized)
+		up->size = universal_host_controller_interface_sprint_schedule(universal_host_controller_interface, up->data,
 					MAX_OUTPUT - EXTRA_SPACE);
-	spin_unlock_irqrestore(&uhci->lock, flags);
+	spin_unlock_irqrestore(&universal_host_controller_interface->lock, flags);
 
 	file->private_data = up;
 
 	return 0;
 }
 
-static loff_t uhci_debug_lseek(struct file *file, loff_t off, int whence)
+static loff_t universal_host_controller_interface_debug_lseek(struct file *file, loff_t off, int whence)
 {
-	struct uhci_debug *up = file->private_data;
+	struct universal_host_controller_interface_debug *up = file->private_data;
 	return no_seek_end_llseek_size(file, off, whence, up->size);
 }
 
-static ssize_t uhci_debug_read(struct file *file, char __user *buf,
+static ssize_t universal_host_controller_interface_debug_read(struct file *file, char __user *buf,
 				size_t nbytes, loff_t *ppos)
 {
-	struct uhci_debug *up = file->private_data;
+	struct universal_host_controller_interface_debug *up = file->private_data;
 	return simple_read_from_buffer(buf, nbytes, ppos, up->data, up->size);
 }
 
-static int uhci_debug_release(struct inode *inode, struct file *file)
+static int universal_host_controller_interface_debug_release(struct inode *inode, struct file *file)
 {
-	struct uhci_debug *up = file->private_data;
+	struct universal_host_controller_interface_debug *up = file->private_data;
 
 	kfree(up->data);
 	kfree(up);
@@ -606,14 +606,14 @@ static int uhci_debug_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static const struct file_operations uhci_debug_operations = {
+static const struct file_operations universal_host_controller_interface_debug_operations = {
 	.owner =	THIS_MODULE,
-	.open =		uhci_debug_open,
-	.llseek =	uhci_debug_lseek,
-	.read =		uhci_debug_read,
-	.release =	uhci_debug_release,
+	.open =		universal_host_controller_interface_debug_open,
+	.llseek =	universal_host_controller_interface_debug_lseek,
+	.read =		universal_host_controller_interface_debug_read,
+	.release =	universal_host_controller_interface_debug_release,
 };
-#define UHCI_DEBUG_OPS
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_DEBUG_OPS
 
 #endif	/* CONFIG_DEBUG_FS */
 
@@ -622,13 +622,13 @@ static const struct file_operations uhci_debug_operations = {
 static inline void lprintk(char *buf)
 {}
 
-static inline int uhci_show_qh(struct uhci_hcd *uhci,
-		struct uhci_qh *qh, char *buf, int len, int space)
+static inline int universal_host_controller_interface_show_qh(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
+		struct universal_host_controller_interface_qh *qh, char *buf, int len, int space)
 {
 	return 0;
 }
 
-static inline int uhci_sprint_schedule(struct uhci_hcd *uhci,
+static inline int universal_host_controller_interface_sprint_schedule(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
 		char *buf, int len)
 {
 	return 0;
diff --git a/drivers/usb/host/uhci-grlib.c b/drivers/usb/host/uhci-grlib.c
index 96004111b26f..b59d1f9e1584 100644
--- a/drivers/usb/host/uhci-grlib.c
+++ b/drivers/usb/host/uhci-grlib.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * UHCI HCD (Host Controller Driver) for GRLIB GRUNIVERSAL_SERIAL_BUSHC
+ * UNIVERSAL_HOST_CONTROLLER_INTERFACE HCD (Host Controller Driver) for GRLIB GRUNIVERSAL_SERIAL_BUSHC
  *
  * Copyright (c) 2011 Jan Andersson <jan@gaisler.com>
  *
- * This file is based on UHCI PCI HCD:
+ * This file is based on UNIVERSAL_HOST_CONTROLLER_INTERFACE PCI HCD:
  * (C) Copyright 1999 Linus Torvalds
  * (C) Copyright 1999-2002 Johannes Erdfelt, johannes@erdfelt.com
  * (C) Copyright 1999 Randy Dunlap
@@ -23,75 +23,75 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 
-static int uhci_grlib_init(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_grlib_init(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
 	/*
 	 * Probe to determine the endianness of the controller.
 	 * We know that bit 7 of the PORTSC1 register is always set
-	 * and bit 15 is always clear.  If uhci_readw() yields a value
+	 * and bit 15 is always clear.  If universal_host_controller_interface_readw() yields a value
 	 * with bit 7 (0x80) turned on then the current little-endian
 	 * setting is correct.  Otherwise we assume the value was
 	 * byte-swapped; hence the register interface and presumably
 	 * also the descriptors are big-endian.
 	 */
-	if (!(uhci_readw(uhci, UNIVERSAL_SERIAL_BUSPORTSC1) & 0x80)) {
-		uhci->big_endian_mmio = 1;
-		uhci->big_endian_desc = 1;
+	if (!(universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSPORTSC1) & 0x80)) {
+		universal_host_controller_interface->big_endian_mmio = 1;
+		universal_host_controller_interface->big_endian_desc = 1;
 	}
 
-	uhci->rh_numports = uhci_count_ports(hcd);
+	universal_host_controller_interface->rh_numports = universal_host_controller_interface_count_ports(hcd);
 
 	/* Set up pointers to to generic functions */
-	uhci->reset_hc = uhci_generic_reset_hc;
-	uhci->check_and_reset_hc = uhci_generic_check_and_reset_hc;
+	universal_host_controller_interface->reset_hc = universal_host_controller_interface_generic_reset_hc;
+	universal_host_controller_interface->check_and_reset_hc = universal_host_controller_interface_generic_check_and_reset_hc;
 	/* No special actions need to be taken for the functions below */
-	uhci->configure_hc = NULL;
-	uhci->resume_detect_interrupts_are_broken = NULL;
-	uhci->global_suspend_mode_is_broken = NULL;
+	universal_host_controller_interface->configure_hc = NULL;
+	universal_host_controller_interface->resume_detect_interrupts_are_broken = NULL;
+	universal_host_controller_interface->global_suspend_mode_is_broken = NULL;
 
 	/* Reset if the controller isn't already safely quiescent. */
-	check_and_reset_hc(uhci);
+	check_and_reset_hc(universal_host_controller_interface);
 	return 0;
 }
 
-static const struct hc_driver uhci_grlib_hc_driver = {
+static const struct hc_driver universal_host_controller_interface_grlib_hc_driver = {
 	.description =		hcd_name,
-	.product_desc =		"GRLIB GRUNIVERSAL_SERIAL_BUSHC UHCI Host Controller",
-	.hcd_priv_size =	sizeof(struct uhci_hcd),
+	.product_desc =		"GRLIB GRUNIVERSAL_SERIAL_BUSHC UNIVERSAL_HOST_CONTROLLER_INTERFACE Host Controller",
+	.hcd_priv_size =	sizeof(struct universal_host_controller_interface_hcd),
 
 	/* Generic hardware linkage */
-	.irq =			uhci_irq,
+	.irq =			universal_host_controller_interface_irq,
 	.flags =		HCD_MEMORY | HCD_DMA | HCD_UNIVERSAL_SERIAL_BUS11,
 
 	/* Basic lifecycle operations */
-	.reset =		uhci_grlib_init,
-	.start =		uhci_start,
+	.reset =		universal_host_controller_interface_grlib_init,
+	.start =		universal_host_controller_interface_start,
 #ifdef CONFIG_PM
 	.pci_suspend =		NULL,
 	.pci_resume =		NULL,
-	.bus_suspend =		uhci_rh_suspend,
-	.bus_resume =		uhci_rh_resume,
+	.bus_suspend =		universal_host_controller_interface_rh_suspend,
+	.bus_resume =		universal_host_controller_interface_rh_resume,
 #endif
-	.stop =			uhci_stop,
+	.stop =			universal_host_controller_interface_stop,
 
-	.urb_enqueue =		uhci_urb_enqueue,
-	.urb_dequeue =		uhci_urb_dequeue,
+	.urb_enqueue =		universal_host_controller_interface_urb_enqueue,
+	.urb_dequeue =		universal_host_controller_interface_urb_dequeue,
 
-	.endpoint_disable =	uhci_hcd_endpoint_disable,
-	.get_frame_number =	uhci_hcd_get_frame_number,
+	.endpoint_disable =	universal_host_controller_interface_hcd_endpoint_disable,
+	.get_frame_number =	universal_host_controller_interface_hcd_get_frame_number,
 
-	.hub_status_data =	uhci_hub_status_data,
-	.hub_control =		uhci_hub_control,
+	.hub_status_data =	universal_host_controller_interface_hub_status_data,
+	.hub_control =		universal_host_controller_interface_hub_control,
 };
 
 
-static int uhci_hcd_grlib_probe(struct platform_device *op)
+static int universal_host_controller_interface_hcd_grlib_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
 	struct universal_serial_bus_hcd *hcd;
-	struct uhci_hcd	*uhci = NULL;
+	struct universal_host_controller_interface_hcd	*universal_host_controller_interface = NULL;
 	struct resource res;
 	int irq;
 	int rv;
@@ -99,7 +99,7 @@ static int uhci_hcd_grlib_probe(struct platform_device *op)
 	if (universal_serial_bus_disabled())
 		return -ENODEV;
 
-	dev_dbg(&op->dev, "initializing GRUNIVERSAL_SERIAL_BUSHC UHCI UNIVERSAL_SERIAL_BUS Controller\n");
+	dev_dbg(&op->dev, "initializing GRUNIVERSAL_SERIAL_BUSHC UNIVERSAL_HOST_CONTROLLER_INTERFACE UNIVERSAL_SERIAL_BUS Controller\n");
 
 	rv = of_address_to_resource(dn, 0, &res);
 	if (rv)
@@ -107,8 +107,8 @@ static int uhci_hcd_grlib_probe(struct platform_device *op)
 
 	/* universal_serial_bus_create_hcd requires dma_mask != NULL */
 	op->dev.dma_mask = &op->dev.coherent_dma_mask;
-	hcd = universal_serial_bus_create_hcd(&uhci_grlib_hc_driver, &op->dev,
-			"GRUNIVERSAL_SERIAL_BUSHC UHCI UNIVERSAL_SERIAL_BUS");
+	hcd = universal_serial_bus_create_hcd(&universal_host_controller_interface_grlib_hc_driver, &op->dev,
+			"GRUNIVERSAL_SERIAL_BUSHC UNIVERSAL_HOST_CONTROLLER_INTERFACE UNIVERSAL_SERIAL_BUS");
 	if (!hcd)
 		return -ENOMEM;
 
@@ -128,9 +128,9 @@ static int uhci_hcd_grlib_probe(struct platform_device *op)
 		goto err_irq;
 	}
 
-	uhci = hcd_to_uhci(hcd);
+	universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
-	uhci->regs = hcd->regs;
+	universal_host_controller_interface->regs = hcd->regs;
 
 	rv = universal_serial_bus_add_hcd(hcd, irq, 0);
 	if (rv)
@@ -147,11 +147,11 @@ static int uhci_hcd_grlib_probe(struct platform_device *op)
 	return rv;
 }
 
-static int uhci_hcd_grlib_remove(struct platform_device *op)
+static int universal_host_controller_interface_hcd_grlib_remove(struct platform_device *op)
 {
 	struct universal_serial_bus_hcd *hcd = platform_get_drvdata(op);
 
-	dev_dbg(&op->dev, "stopping GRLIB GRUNIVERSAL_SERIAL_BUSHC UHCI UNIVERSAL_SERIAL_BUS Controller\n");
+	dev_dbg(&op->dev, "stopping GRLIB GRUNIVERSAL_SERIAL_BUSHC UNIVERSAL_HOST_CONTROLLER_INTERFACE UNIVERSAL_SERIAL_BUS Controller\n");
 
 	universal_serial_bus_remove_hcd(hcd);
 
@@ -168,27 +168,27 @@ static int uhci_hcd_grlib_remove(struct platform_device *op)
  * This routine may be called in a damaged or failing kernel.  Hence we
  * do not acquire the spinlock before shutting down the controller.
  */
-static void uhci_hcd_grlib_shutdown(struct platform_device *op)
+static void universal_host_controller_interface_hcd_grlib_shutdown(struct platform_device *op)
 {
 	struct universal_serial_bus_hcd *hcd = platform_get_drvdata(op);
 
-	uhci_hc_died(hcd_to_uhci(hcd));
+	universal_host_controller_interface_hc_died(hcd_to_universal_host_controller_interface(hcd));
 }
 
-static const struct of_device_id uhci_hcd_grlib_of_match[] = {
-	{ .name = "GAISLER_UHCI", },
+static const struct of_device_id universal_host_controller_interface_hcd_grlib_of_match[] = {
+	{ .name = "GAISLER_UNIVERSAL_HOST_CONTROLLER_INTERFACE", },
 	{ .name = "01_027", },
 	{},
 };
-MODULE_DEVICE_TABLE(of, uhci_hcd_grlib_of_match);
+MODULE_DEVICE_TABLE(of, universal_host_controller_interface_hcd_grlib_of_match);
 
 
-static struct platform_driver uhci_grlib_driver = {
-	.probe		= uhci_hcd_grlib_probe,
-	.remove		= uhci_hcd_grlib_remove,
-	.shutdown	= uhci_hcd_grlib_shutdown,
+static struct platform_driver universal_host_controller_interface_grlib_driver = {
+	.probe		= universal_host_controller_interface_hcd_grlib_probe,
+	.remove		= universal_host_controller_interface_hcd_grlib_remove,
+	.shutdown	= universal_host_controller_interface_hcd_grlib_shutdown,
 	.driver = {
-		.name = "grlib-uhci",
-		.of_match_table = uhci_hcd_grlib_of_match,
+		.name = "grlib-universal_host_controller_interface",
+		.of_match_table = universal_host_controller_interface_hcd_grlib_of_match,
 	},
 };
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index 46370ded47f7..30298ef9f198 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -47,7 +47,7 @@
 #include <asm/io.h>
 #include <asm/irq.h>
 
-#include "uhci-hcd.h"
+#include "universal_host_controller_interface-hcd.h"
 
 /*
  * Version Information
@@ -67,7 +67,7 @@ MODULE_PARM_DESC(ignore_oc, "ignore hardware overcurrent indications");
  * debug = 0, no debugging messages
  * debug = 1, dump failed URBs except for stalls
  * debug = 2, dump all failed URBs (including stalls)
- *            show all queues in /sys/kernel/debug/uhci/[pci_addr]
+ *            show all queues in /sys/kernel/debug/universal_host_controller_interface/[pci_addr]
  * debug = 3, show all TDs in URBs when dumping
  */
 #ifdef CONFIG_DYNAMIC_DEBUG
@@ -87,16 +87,16 @@ static char *errbuf;
 
 #define ERRBUF_LEN    (32 * 1024)
 
-static struct kmem_cache *uhci_up_cachep;	/* urb_priv */
+static struct kmem_cache *universal_host_controller_interface_up_cachep;	/* urb_priv */
 
-static void suspend_rh(struct uhci_hcd *uhci, enum uhci_rh_state new_state);
-static void wakeup_rh(struct uhci_hcd *uhci);
-static void uhci_get_current_frame_number(struct uhci_hcd *uhci);
+static void suspend_rh(struct universal_host_controller_interface_hcd *universal_host_controller_interface, enum universal_host_controller_interface_rh_state new_state);
+static void wakeup_rh(struct universal_host_controller_interface_hcd *universal_host_controller_interface);
+static void universal_host_controller_interface_get_current_frame_number(struct universal_host_controller_interface_hcd *universal_host_controller_interface);
 
 /*
  * Calculate the link pointer DMA value for the first Skeleton QH in a frame.
  */
-static __hc32 uhci_frame_skel_link(struct uhci_hcd *uhci, int frame)
+static __hc32 universal_host_controller_interface_frame_skel_link(struct universal_host_controller_interface_hcd *universal_host_controller_interface, int frame)
 {
 	int skelnum;
 
@@ -113,22 +113,22 @@ static __hc32 uhci_frame_skel_link(struct uhci_hcd *uhci, int frame)
 	 * 2,6,10,... => ffs = 1 => use period-4 QH = skelqh[7], etc.
 	 * ffs >= 7 => not on any high-period queue, so use
 	 *	period-1 QH = skelqh[9].
-	 * Add in UHCI_NUMFRAMES to insure at least one bit is set.
+	 * Add in UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES to insure at least one bit is set.
 	 */
-	skelnum = 8 - (int) __ffs(frame | UHCI_NUMFRAMES);
+	skelnum = 8 - (int) __ffs(frame | UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES);
 	if (skelnum <= 1)
 		skelnum = 9;
-	return LINK_TO_QH(uhci, uhci->skelqh[skelnum]);
+	return LINK_TO_QH(universal_host_controller_interface, universal_host_controller_interface->skelqh[skelnum]);
 }
 
-#include "uhci-debug.c"
-#include "uhci-q.c"
-#include "uhci-hub.c"
+#include "universal_host_controller_interface-debug.c"
+#include "universal_host_controller_interface-q.c"
+#include "universal_host_controller_interface-hub.c"
 
 /*
  * Finish up a host controller reset and update the recorded state.
  */
-static void finish_reset(struct uhci_hcd *uhci)
+static void finish_reset(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	int port;
 
@@ -136,28 +136,28 @@ static void finish_reset(struct uhci_hcd *uhci)
 	 * bits in the port status and control registers.
 	 * We have to clear them by hand.
 	 */
-	for (port = 0; port < uhci->rh_numports; ++port)
-		uhci_writew(uhci, 0, UNIVERSAL_SERIAL_BUSPORTSC1 + (port * 2));
+	for (port = 0; port < universal_host_controller_interface->rh_numports; ++port)
+		universal_host_controller_interface_writew(universal_host_controller_interface, 0, UNIVERSAL_SERIAL_BUSPORTSC1 + (port * 2));
 
-	uhci->port_c_suspend = uhci->resuming_ports = 0;
-	uhci->rh_state = UHCI_RH_RESET;
-	uhci->is_stopped = UHCI_IS_STOPPED;
-	clear_bit(HCD_FLAG_POLL_RH, &uhci_to_hcd(uhci)->flags);
+	universal_host_controller_interface->port_c_suspend = universal_host_controller_interface->resuming_ports = 0;
+	universal_host_controller_interface->rh_state = UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RESET;
+	universal_host_controller_interface->is_stopped = UNIVERSAL_HOST_CONTROLLER_INTERFACE_IS_STOPPED;
+	clear_bit(HCD_FLAG_POLL_RH, &universal_host_controller_interface_to_hcd(universal_host_controller_interface)->flags);
 }
 
 /*
  * Last rites for a defunct/nonfunctional controller
  * or one we don't want to use any more.
  */
-static void uhci_hc_died(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_hc_died(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	uhci_get_current_frame_number(uhci);
-	uhci->reset_hc(uhci);
-	finish_reset(uhci);
-	uhci->dead = 1;
+	universal_host_controller_interface_get_current_frame_number(universal_host_controller_interface);
+	universal_host_controller_interface->reset_hc(universal_host_controller_interface);
+	finish_reset(universal_host_controller_interface);
+	universal_host_controller_interface->dead = 1;
 
 	/* The current frame may already be partway finished */
-	++uhci->frame_number;
+	++universal_host_controller_interface->frame_number;
 }
 
 /*
@@ -165,41 +165,41 @@ static void uhci_hc_died(struct uhci_hcd *uhci)
  * or otherwise been reset while it was suspended.  In none of these cases
  * can we be sure of its previous state.
  */
-static void check_and_reset_hc(struct uhci_hcd *uhci)
+static void check_and_reset_hc(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	if (uhci->check_and_reset_hc(uhci))
-		finish_reset(uhci);
+	if (universal_host_controller_interface->check_and_reset_hc(universal_host_controller_interface))
+		finish_reset(universal_host_controller_interface);
 }
 
-#if defined(CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_SUPPORT_NON_PCI_HC)
+#if defined(CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_SUPPORT_NON_PCI_HC)
 /*
  * The two functions below are generic reset functions that are used on systems
  * that do not have keyboard and mouse legacy support. We assume that we are
- * running on such a system if CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_SUPPORT_NON_PCI_HC is defined.
+ * running on such a system if CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_SUPPORT_NON_PCI_HC is defined.
  */
 
 /*
  * Make sure the controller is completely inactive, unable to
  * generate interrupts or do DMA.
  */
-static void uhci_generic_reset_hc(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_generic_reset_hc(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	/* Reset the HC - this will force us to get a
 	 * new notification of any already connected
 	 * ports due to the virtual disconnect that it
 	 * implies.
 	 */
-	uhci_writew(uhci, UNIVERSAL_SERIAL_BUSCMD_HCRESET, UNIVERSAL_SERIAL_BUSCMD);
+	universal_host_controller_interface_writew(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD_HCRESET, UNIVERSAL_SERIAL_BUSCMD);
 	mb();
 	udelay(5);
-	if (uhci_readw(uhci, UNIVERSAL_SERIAL_BUSCMD) & UNIVERSAL_SERIAL_BUSCMD_HCRESET)
-		dev_warn(uhci_dev(uhci), "HCRESET not completed yet!\n");
+	if (universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD) & UNIVERSAL_SERIAL_BUSCMD_HCRESET)
+		dev_warn(universal_host_controller_interface_dev(universal_host_controller_interface), "HCRESET not completed yet!\n");
 
 	/* Just to be safe, disable interrupt requests and
 	 * make sure the controller is stopped.
 	 */
-	uhci_writew(uhci, 0, UNIVERSAL_SERIAL_BUSINTR);
-	uhci_writew(uhci, 0, UNIVERSAL_SERIAL_BUSCMD);
+	universal_host_controller_interface_writew(universal_host_controller_interface, 0, UNIVERSAL_SERIAL_BUSINTR);
+	universal_host_controller_interface_writew(universal_host_controller_interface, 0, UNIVERSAL_SERIAL_BUSCMD);
 }
 
 /*
@@ -208,7 +208,7 @@ static void uhci_generic_reset_hc(struct uhci_hcd *uhci)
  *
  * Returns: 1 if the controller was reset, 0 otherwise.
  */
-static int uhci_generic_check_and_reset_hc(struct uhci_hcd *uhci)
+static int universal_host_controller_interface_generic_check_and_reset_hc(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	unsigned int cmd, intr;
 
@@ -222,49 +222,49 @@ static int uhci_generic_check_and_reset_hc(struct uhci_hcd *uhci)
 	 * If any of these conditions are violated we do a complete reset.
 	 */
 
-	cmd = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSCMD);
+	cmd = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD);
 	if ((cmd & UNIVERSAL_SERIAL_BUSCMD_RS) || !(cmd & UNIVERSAL_SERIAL_BUSCMD_CF) || !(cmd & UNIVERSAL_SERIAL_BUSCMD_EGSM)) {
-		dev_dbg(uhci_dev(uhci), "%s: cmd = 0x%04x\n",
+		dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "%s: cmd = 0x%04x\n",
 				__func__, cmd);
 		goto reset_needed;
 	}
 
-	intr = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSINTR);
+	intr = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSINTR);
 	if (intr & (~UNIVERSAL_SERIAL_BUSINTR_RESUME)) {
-		dev_dbg(uhci_dev(uhci), "%s: intr = 0x%04x\n",
+		dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "%s: intr = 0x%04x\n",
 				__func__, intr);
 		goto reset_needed;
 	}
 	return 0;
 
 reset_needed:
-	dev_dbg(uhci_dev(uhci), "Performing full reset\n");
-	uhci_generic_reset_hc(uhci);
+	dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "Performing full reset\n");
+	universal_host_controller_interface_generic_reset_hc(universal_host_controller_interface);
 	return 1;
 }
-#endif /* CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_SUPPORT_NON_PCI_HC */
+#endif /* CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_SUPPORT_NON_PCI_HC */
 
 /*
  * Store the basic register settings needed by the controller.
  */
-static void configure_hc(struct uhci_hcd *uhci)
+static void configure_hc(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	/* Set the frame length to the default: 1 ms exactly */
-	uhci_writeb(uhci, UNIVERSAL_SERIAL_BUSSOF_DEFAULT, UNIVERSAL_SERIAL_BUSSOF);
+	universal_host_controller_interface_writeb(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSSOF_DEFAULT, UNIVERSAL_SERIAL_BUSSOF);
 
 	/* Store the frame list base address */
-	uhci_writel(uhci, uhci->frame_dma_handle, UNIVERSAL_SERIAL_BUSFLBASEADD);
+	universal_host_controller_interface_writel(universal_host_controller_interface, universal_host_controller_interface->frame_dma_handle, UNIVERSAL_SERIAL_BUSFLBASEADD);
 
 	/* Set the current frame number */
-	uhci_writew(uhci, uhci->frame_number & UHCI_MAX_SOF_NUMBER,
+	universal_host_controller_interface_writew(universal_host_controller_interface, universal_host_controller_interface->frame_number & UNIVERSAL_HOST_CONTROLLER_INTERFACE_MAX_SOF_NUMBER,
 			UNIVERSAL_SERIAL_BUSFRNUM);
 
 	/* perform any arch/bus specific configuration */
-	if (uhci->configure_hc)
-		uhci->configure_hc(uhci);
+	if (universal_host_controller_interface->configure_hc)
+		universal_host_controller_interface->configure_hc(universal_host_controller_interface);
 }
 
-static int resume_detect_interrupts_are_broken(struct uhci_hcd *uhci)
+static int resume_detect_interrupts_are_broken(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	/*
 	 * If we have to ignore overcurrent events then almost by definition
@@ -272,28 +272,28 @@ static int resume_detect_interrupts_are_broken(struct uhci_hcd *uhci)
 	 *
 	 * Those interrupts also don't seem to work on ASpeed SoCs.
 	 */
-	if (ignore_oc || uhci_is_aspeed(uhci))
+	if (ignore_oc || universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
 		return 1;
 
-	return uhci->resume_detect_interrupts_are_broken ?
-		uhci->resume_detect_interrupts_are_broken(uhci) : 0;
+	return universal_host_controller_interface->resume_detect_interrupts_are_broken ?
+		universal_host_controller_interface->resume_detect_interrupts_are_broken(universal_host_controller_interface) : 0;
 }
 
-static int global_suspend_mode_is_broken(struct uhci_hcd *uhci)
+static int global_suspend_mode_is_broken(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	return uhci->global_suspend_mode_is_broken ?
-		uhci->global_suspend_mode_is_broken(uhci) : 0;
+	return universal_host_controller_interface->global_suspend_mode_is_broken ?
+		universal_host_controller_interface->global_suspend_mode_is_broken(universal_host_controller_interface) : 0;
 }
 
-static void suspend_rh(struct uhci_hcd *uhci, enum uhci_rh_state new_state)
-__releases(uhci->lock)
-__acquires(uhci->lock)
+static void suspend_rh(struct universal_host_controller_interface_hcd *universal_host_controller_interface, enum universal_host_controller_interface_rh_state new_state)
+__releases(universal_host_controller_interface->lock)
+__acquires(universal_host_controller_interface->lock)
 {
 	int auto_stop;
 	int int_enable, egsm_enable, wakeup_enable;
-	struct universal_serial_bus_device *rhdev = uhci_to_hcd(uhci)->self.root_hub;
+	struct universal_serial_bus_device *rhdev = universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.root_hub;
 
-	auto_stop = (new_state == UHCI_RH_AUTO_STOPPED);
+	auto_stop = (new_state == UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_AUTO_STOPPED);
 	dev_dbg(&rhdev->dev, "%s%s\n", __func__,
 			(auto_stop ? " (auto-stop)" : ""));
 
@@ -326,7 +326,7 @@ __acquires(uhci->lock)
 #endif
 
 	/*
-	 * UHCI doesn't distinguish between wakeup requests from downstream
+	 * UNIVERSAL_HOST_CONTROLLER_INTERFACE doesn't distinguish between wakeup requests from downstream
 	 * devices and local connect/disconnect events.  There's no way to
 	 * enable one without the other; both are controlled by EGSM.  Thus
 	 * if wakeups are disallowed then EGSM must be turned off -- in which
@@ -340,13 +340,13 @@ __acquires(uhci->lock)
 	 * the RD status bit will never get set.  Without RD, the controller
 	 * won't generate interrupts to tell the system about wakeup events.
 	 */
-	if (!wakeup_enable || global_suspend_mode_is_broken(uhci) ||
-			resume_detect_interrupts_are_broken(uhci))
+	if (!wakeup_enable || global_suspend_mode_is_broken(universal_host_controller_interface) ||
+			resume_detect_interrupts_are_broken(universal_host_controller_interface))
 		egsm_enable = int_enable = 0;
 
-	uhci->RD_enable = !!int_enable;
-	uhci_writew(uhci, int_enable, UNIVERSAL_SERIAL_BUSINTR);
-	uhci_writew(uhci, egsm_enable | UNIVERSAL_SERIAL_BUSCMD_CF, UNIVERSAL_SERIAL_BUSCMD);
+	universal_host_controller_interface->RD_enable = !!int_enable;
+	universal_host_controller_interface_writew(universal_host_controller_interface, int_enable, UNIVERSAL_SERIAL_BUSINTR);
+	universal_host_controller_interface_writew(universal_host_controller_interface, egsm_enable | UNIVERSAL_SERIAL_BUSCMD_CF, UNIVERSAL_SERIAL_BUSCMD);
 	mb();
 	udelay(5);
 
@@ -355,21 +355,21 @@ __acquires(uhci->lock)
 	 * controller should stop after a few microseconds.  Otherwise
 	 * we will give the controller one frame to stop.
 	 */
-	if (!auto_stop && !(uhci_readw(uhci, UNIVERSAL_SERIAL_BUSSTS) & UNIVERSAL_SERIAL_BUSSTS_HCH)) {
-		uhci->rh_state = UHCI_RH_SUSPENDING;
-		spin_unlock_irq(&uhci->lock);
+	if (!auto_stop && !(universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSSTS) & UNIVERSAL_SERIAL_BUSSTS_HCH)) {
+		universal_host_controller_interface->rh_state = UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDING;
+		spin_unlock_irq(&universal_host_controller_interface->lock);
 		msleep(1);
-		spin_lock_irq(&uhci->lock);
-		if (uhci->dead)
+		spin_lock_irq(&universal_host_controller_interface->lock);
+		if (universal_host_controller_interface->dead)
 			return;
 	}
-	if (!(uhci_readw(uhci, UNIVERSAL_SERIAL_BUSSTS) & UNIVERSAL_SERIAL_BUSSTS_HCH))
-		dev_warn(uhci_dev(uhci), "Controller not stopped yet!\n");
+	if (!(universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSSTS) & UNIVERSAL_SERIAL_BUSSTS_HCH))
+		dev_warn(universal_host_controller_interface_dev(universal_host_controller_interface), "Controller not stopped yet!\n");
 
-	uhci_get_current_frame_number(uhci);
+	universal_host_controller_interface_get_current_frame_number(universal_host_controller_interface);
 
-	uhci->rh_state = new_state;
-	uhci->is_stopped = UHCI_IS_STOPPED;
+	universal_host_controller_interface->rh_state = new_state;
+	universal_host_controller_interface->is_stopped = UNIVERSAL_HOST_CONTROLLER_INTERFACE_IS_STOPPED;
 
 	/*
 	 * If remote wakeup is enabled but either EGSM or RD interrupts
@@ -377,113 +377,113 @@ __acquires(uhci->lock)
 	 * occurs.  Thus the suspended root hub needs to be polled.
 	 */
 	if (wakeup_enable && (!int_enable || !egsm_enable))
-		set_bit(HCD_FLAG_POLL_RH, &uhci_to_hcd(uhci)->flags);
+		set_bit(HCD_FLAG_POLL_RH, &universal_host_controller_interface_to_hcd(universal_host_controller_interface)->flags);
 	else
-		clear_bit(HCD_FLAG_POLL_RH, &uhci_to_hcd(uhci)->flags);
+		clear_bit(HCD_FLAG_POLL_RH, &universal_host_controller_interface_to_hcd(universal_host_controller_interface)->flags);
 
-	uhci_scan_schedule(uhci);
-	uhci_fsbr_off(uhci);
+	universal_host_controller_interface_scan_schedule(universal_host_controller_interface);
+	universal_host_controller_interface_fsbr_off(universal_host_controller_interface);
 }
 
-static void start_rh(struct uhci_hcd *uhci)
+static void start_rh(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	uhci->is_stopped = 0;
+	universal_host_controller_interface->is_stopped = 0;
 
 	/*
 	 * Clear stale status bits on Aspeed as we get a stale HCH
 	 * which causes problems later on
 	 */
-	if (uhci_is_aspeed(uhci))
-		uhci_writew(uhci, uhci_readw(uhci, UNIVERSAL_SERIAL_BUSSTS), UNIVERSAL_SERIAL_BUSSTS);
+	if (universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
+		universal_host_controller_interface_writew(universal_host_controller_interface, universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSSTS), UNIVERSAL_SERIAL_BUSSTS);
 
 	/* Mark it configured and running with a 64-byte max packet.
 	 * All interrupts are enabled, even though RESUME won't do anything.
 	 */
-	uhci_writew(uhci, UNIVERSAL_SERIAL_BUSCMD_RS | UNIVERSAL_SERIAL_BUSCMD_CF | UNIVERSAL_SERIAL_BUSCMD_MAXP, UNIVERSAL_SERIAL_BUSCMD);
-	uhci_writew(uhci, UNIVERSAL_SERIAL_BUSINTR_TIMEOUT | UNIVERSAL_SERIAL_BUSINTR_RESUME |
+	universal_host_controller_interface_writew(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD_RS | UNIVERSAL_SERIAL_BUSCMD_CF | UNIVERSAL_SERIAL_BUSCMD_MAXP, UNIVERSAL_SERIAL_BUSCMD);
+	universal_host_controller_interface_writew(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSINTR_TIMEOUT | UNIVERSAL_SERIAL_BUSINTR_RESUME |
 		UNIVERSAL_SERIAL_BUSINTR_IOC | UNIVERSAL_SERIAL_BUSINTR_SP, UNIVERSAL_SERIAL_BUSINTR);
 	mb();
-	uhci->rh_state = UHCI_RH_RUNNING;
-	set_bit(HCD_FLAG_POLL_RH, &uhci_to_hcd(uhci)->flags);
+	universal_host_controller_interface->rh_state = UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING;
+	set_bit(HCD_FLAG_POLL_RH, &universal_host_controller_interface_to_hcd(universal_host_controller_interface)->flags);
 }
 
-static void wakeup_rh(struct uhci_hcd *uhci)
-__releases(uhci->lock)
-__acquires(uhci->lock)
+static void wakeup_rh(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
+__releases(universal_host_controller_interface->lock)
+__acquires(universal_host_controller_interface->lock)
 {
-	dev_dbg(&uhci_to_hcd(uhci)->self.root_hub->dev,
+	dev_dbg(&universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.root_hub->dev,
 			"%s%s\n", __func__,
-			uhci->rh_state == UHCI_RH_AUTO_STOPPED ?
+			universal_host_controller_interface->rh_state == UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_AUTO_STOPPED ?
 				" (auto-start)" : "");
 
 	/* If we are auto-stopped then no devices are attached so there's
 	 * no need for wakeup signals.  Otherwise we send Global Resume
 	 * for 20 ms.
 	 */
-	if (uhci->rh_state == UHCI_RH_SUSPENDED) {
+	if (universal_host_controller_interface->rh_state == UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDED) {
 		unsigned egsm;
 
 		/* Keep EGSM on if it was set before */
-		egsm = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSCMD) & UNIVERSAL_SERIAL_BUSCMD_EGSM;
-		uhci->rh_state = UHCI_RH_RESUMING;
-		uhci_writew(uhci, UNIVERSAL_SERIAL_BUSCMD_FGR | UNIVERSAL_SERIAL_BUSCMD_CF | egsm, UNIVERSAL_SERIAL_BUSCMD);
-		spin_unlock_irq(&uhci->lock);
+		egsm = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD) & UNIVERSAL_SERIAL_BUSCMD_EGSM;
+		universal_host_controller_interface->rh_state = UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RESUMING;
+		universal_host_controller_interface_writew(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD_FGR | UNIVERSAL_SERIAL_BUSCMD_CF | egsm, UNIVERSAL_SERIAL_BUSCMD);
+		spin_unlock_irq(&universal_host_controller_interface->lock);
 		msleep(20);
-		spin_lock_irq(&uhci->lock);
-		if (uhci->dead)
+		spin_lock_irq(&universal_host_controller_interface->lock);
+		if (universal_host_controller_interface->dead)
 			return;
 
 		/* End Global Resume and wait for EOP to be sent */
-		uhci_writew(uhci, UNIVERSAL_SERIAL_BUSCMD_CF, UNIVERSAL_SERIAL_BUSCMD);
+		universal_host_controller_interface_writew(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD_CF, UNIVERSAL_SERIAL_BUSCMD);
 		mb();
 		udelay(4);
-		if (uhci_readw(uhci, UNIVERSAL_SERIAL_BUSCMD) & UNIVERSAL_SERIAL_BUSCMD_FGR)
-			dev_warn(uhci_dev(uhci), "FGR not stopped yet!\n");
+		if (universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSCMD) & UNIVERSAL_SERIAL_BUSCMD_FGR)
+			dev_warn(universal_host_controller_interface_dev(universal_host_controller_interface), "FGR not stopped yet!\n");
 	}
 
-	start_rh(uhci);
+	start_rh(universal_host_controller_interface);
 
 	/* Restart root hub polling */
-	mod_timer(&uhci_to_hcd(uhci)->rh_timer, jiffies);
+	mod_timer(&universal_host_controller_interface_to_hcd(universal_host_controller_interface)->rh_timer, jiffies);
 }
 
-static irqreturn_t uhci_irq(struct universal_serial_bus_hcd *hcd)
+static irqreturn_t universal_host_controller_interface_irq(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	unsigned short status;
 
 	/*
 	 * Read the interrupt status, and write it back to clear the
-	 * interrupt cause.  Contrary to the UHCI specification, the
+	 * interrupt cause.  Contrary to the UNIVERSAL_HOST_CONTROLLER_INTERFACE specification, the
 	 * "HC Halted" status bit is persistent: it is RO, not R/WC.
 	 */
-	status = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSSTS);
+	status = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSSTS);
 	if (!(status & ~UNIVERSAL_SERIAL_BUSSTS_HCH))	/* shared interrupt, not mine */
 		return IRQ_NONE;
-	uhci_writew(uhci, status, UNIVERSAL_SERIAL_BUSSTS);		/* Clear it */
+	universal_host_controller_interface_writew(universal_host_controller_interface, status, UNIVERSAL_SERIAL_BUSSTS);		/* Clear it */
 
-	spin_lock(&uhci->lock);
-	if (unlikely(!uhci->is_initialized))	/* not yet configured */
+	spin_lock(&universal_host_controller_interface->lock);
+	if (unlikely(!universal_host_controller_interface->is_initialized))	/* not yet configured */
 		goto done;
 
 	if (status & ~(UNIVERSAL_SERIAL_BUSSTS_UNIVERSAL_SERIAL_BUSINT | UNIVERSAL_SERIAL_BUSSTS_ERROR | UNIVERSAL_SERIAL_BUSSTS_RD)) {
 		if (status & UNIVERSAL_SERIAL_BUSSTS_HSE)
-			dev_err(uhci_dev(uhci),
+			dev_err(universal_host_controller_interface_dev(universal_host_controller_interface),
 				"host system error, PCI problems?\n");
 		if (status & UNIVERSAL_SERIAL_BUSSTS_HCPE)
-			dev_err(uhci_dev(uhci),
+			dev_err(universal_host_controller_interface_dev(universal_host_controller_interface),
 				"host controller process error, something bad happened!\n");
 		if (status & UNIVERSAL_SERIAL_BUSSTS_HCH) {
-			if (uhci->rh_state >= UHCI_RH_RUNNING) {
-				dev_err(uhci_dev(uhci),
+			if (universal_host_controller_interface->rh_state >= UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING) {
+				dev_err(universal_host_controller_interface_dev(universal_host_controller_interface),
 					"host controller halted, very bad!\n");
 				if (debug > 1 && errbuf) {
 					/* Print the schedule for debugging */
-					uhci_sprint_schedule(uhci, errbuf,
+					universal_host_controller_interface_sprint_schedule(universal_host_controller_interface, errbuf,
 						ERRBUF_LEN - EXTRA_SPACE);
 					lprintk(errbuf);
 				}
-				uhci_hc_died(uhci);
+				universal_host_controller_interface_hc_died(universal_host_controller_interface);
 				universal_serial_bus_hc_died(hcd);
 
 				/* Force a callback in case there are
@@ -494,64 +494,64 @@ static irqreturn_t uhci_irq(struct universal_serial_bus_hcd *hcd)
 	}
 
 	if (status & UNIVERSAL_SERIAL_BUSSTS_RD) {
-		spin_unlock(&uhci->lock);
+		spin_unlock(&universal_host_controller_interface->lock);
 		universal_serial_bus_hcd_poll_rh_status(hcd);
 	} else {
-		uhci_scan_schedule(uhci);
+		universal_host_controller_interface_scan_schedule(universal_host_controller_interface);
  done:
-		spin_unlock(&uhci->lock);
+		spin_unlock(&universal_host_controller_interface->lock);
 	}
 
 	return IRQ_HANDLED;
 }
 
 /*
- * Store the current frame number in uhci->frame_number if the controller
+ * Store the current frame number in universal_host_controller_interface->frame_number if the controller
  * is running.  Expand from 11 bits (of which we use only 10) to a
  * full-sized integer.
  *
  * Like many other parts of the driver, this code relies on being polled
  * more than once per second as long as the controller is running.
  */
-static void uhci_get_current_frame_number(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_get_current_frame_number(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	if (!uhci->is_stopped) {
+	if (!universal_host_controller_interface->is_stopped) {
 		unsigned delta;
 
-		delta = (uhci_readw(uhci, UNIVERSAL_SERIAL_BUSFRNUM) - uhci->frame_number) &
-				(UHCI_NUMFRAMES - 1);
-		uhci->frame_number += delta;
+		delta = (universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSFRNUM) - universal_host_controller_interface->frame_number) &
+				(UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES - 1);
+		universal_host_controller_interface->frame_number += delta;
 	}
 }
 
 /*
  * De-allocate all resources
  */
-static void release_uhci(struct uhci_hcd *uhci)
+static void release_universal_host_controller_interface(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	int i;
 
 
-	spin_lock_irq(&uhci->lock);
-	uhci->is_initialized = 0;
-	spin_unlock_irq(&uhci->lock);
+	spin_lock_irq(&universal_host_controller_interface->lock);
+	universal_host_controller_interface->is_initialized = 0;
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 
-	debugfs_remove(uhci->dentry);
+	debugfs_remove(universal_host_controller_interface->dentry);
 
-	for (i = 0; i < UHCI_NUM_SKELQH; i++)
-		uhci_free_qh(uhci, uhci->skelqh[i]);
+	for (i = 0; i < UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUM_SKELQH; i++)
+		universal_host_controller_interface_free_qh(universal_host_controller_interface, universal_host_controller_interface->skelqh[i]);
 
-	uhci_free_td(uhci, uhci->term_td);
+	universal_host_controller_interface_free_td(universal_host_controller_interface, universal_host_controller_interface->term_td);
 
-	dma_pool_destroy(uhci->qh_pool);
+	dma_pool_destroy(universal_host_controller_interface->qh_pool);
 
-	dma_pool_destroy(uhci->td_pool);
+	dma_pool_destroy(universal_host_controller_interface->td_pool);
 
-	kfree(uhci->frame_cpu);
+	kfree(universal_host_controller_interface->frame_cpu);
 
-	dma_free_coherent(uhci_dev(uhci),
-			UHCI_NUMFRAMES * sizeof(*uhci->frame),
-			uhci->frame, uhci->frame_dma_handle);
+	dma_free_coherent(universal_host_controller_interface_dev(universal_host_controller_interface),
+			UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES * sizeof(*universal_host_controller_interface->frame),
+			universal_host_controller_interface->frame, universal_host_controller_interface->frame_dma_handle);
 }
 
 /*
@@ -572,9 +572,9 @@ static void release_uhci(struct uhci_hcd *uhci)
  *    which contains no members, loops back to itself, and is present
  *    only when FSBR is on and there are no full-speed control or bulk QHs.
  */
-static int uhci_start(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_start(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	int retval = -EBUSY;
 	int i;
 	struct dentry __maybe_unused *dentry;
@@ -584,56 +584,56 @@ static int uhci_start(struct universal_serial_bus_hcd *hcd)
 	if (!hcd->localmem_pool)
 		hcd->self.sg_tablesize = ~0;
 
-	spin_lock_init(&uhci->lock);
-	timer_setup(&uhci->fsbr_timer, uhci_fsbr_timeout, 0);
-	INIT_LIST_HEAD(&uhci->idle_qh_list);
-	init_waitqueue_head(&uhci->waitqh);
+	spin_lock_init(&universal_host_controller_interface->lock);
+	timer_setup(&universal_host_controller_interface->fsbr_timer, universal_host_controller_interface_fsbr_timeout, 0);
+	INIT_LIST_HEAD(&universal_host_controller_interface->idle_qh_list);
+	init_waitqueue_head(&universal_host_controller_interface->waitqh);
 
-#ifdef UHCI_DEBUG_OPS
-	uhci->dentry = debugfs_create_file(hcd->self.bus_name,
+#ifdef UNIVERSAL_HOST_CONTROLLER_INTERFACE_DEBUG_OPS
+	universal_host_controller_interface->dentry = debugfs_create_file(hcd->self.bus_name,
 					   S_IFREG|S_IRUGO|S_IWUSR,
-					   uhci_debugfs_root, uhci,
-					   &uhci_debug_operations);
+					   universal_host_controller_interface_debugfs_root, universal_host_controller_interface,
+					   &universal_host_controller_interface_debug_operations);
 #endif
 
-	uhci->frame = dma_alloc_coherent(uhci_dev(uhci),
-					 UHCI_NUMFRAMES * sizeof(*uhci->frame),
-					 &uhci->frame_dma_handle, GFP_KERNEL);
-	if (!uhci->frame) {
-		dev_err(uhci_dev(uhci),
+	universal_host_controller_interface->frame = dma_alloc_coherent(universal_host_controller_interface_dev(universal_host_controller_interface),
+					 UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES * sizeof(*universal_host_controller_interface->frame),
+					 &universal_host_controller_interface->frame_dma_handle, GFP_KERNEL);
+	if (!universal_host_controller_interface->frame) {
+		dev_err(universal_host_controller_interface_dev(universal_host_controller_interface),
 			"unable to allocate consistent memory for frame list\n");
 		goto err_alloc_frame;
 	}
 
-	uhci->frame_cpu = kcalloc(UHCI_NUMFRAMES, sizeof(*uhci->frame_cpu),
+	universal_host_controller_interface->frame_cpu = kcalloc(UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES, sizeof(*universal_host_controller_interface->frame_cpu),
 			GFP_KERNEL);
-	if (!uhci->frame_cpu)
+	if (!universal_host_controller_interface->frame_cpu)
 		goto err_alloc_frame_cpu;
 
-	uhci->td_pool = dma_pool_create("uhci_td", uhci_dev(uhci),
-			sizeof(struct uhci_td), 16, 0);
-	if (!uhci->td_pool) {
-		dev_err(uhci_dev(uhci), "unable to create td dma_pool\n");
+	universal_host_controller_interface->td_pool = dma_pool_create("universal_host_controller_interface_td", universal_host_controller_interface_dev(universal_host_controller_interface),
+			sizeof(struct universal_host_controller_interface_td), 16, 0);
+	if (!universal_host_controller_interface->td_pool) {
+		dev_err(universal_host_controller_interface_dev(universal_host_controller_interface), "unable to create td dma_pool\n");
 		goto err_create_td_pool;
 	}
 
-	uhci->qh_pool = dma_pool_create("uhci_qh", uhci_dev(uhci),
-			sizeof(struct uhci_qh), 16, 0);
-	if (!uhci->qh_pool) {
-		dev_err(uhci_dev(uhci), "unable to create qh dma_pool\n");
+	universal_host_controller_interface->qh_pool = dma_pool_create("universal_host_controller_interface_qh", universal_host_controller_interface_dev(universal_host_controller_interface),
+			sizeof(struct universal_host_controller_interface_qh), 16, 0);
+	if (!universal_host_controller_interface->qh_pool) {
+		dev_err(universal_host_controller_interface_dev(universal_host_controller_interface), "unable to create qh dma_pool\n");
 		goto err_create_qh_pool;
 	}
 
-	uhci->term_td = uhci_alloc_td(uhci);
-	if (!uhci->term_td) {
-		dev_err(uhci_dev(uhci), "unable to allocate terminating TD\n");
+	universal_host_controller_interface->term_td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
+	if (!universal_host_controller_interface->term_td) {
+		dev_err(universal_host_controller_interface_dev(universal_host_controller_interface), "unable to allocate terminating TD\n");
 		goto err_alloc_term_td;
 	}
 
-	for (i = 0; i < UHCI_NUM_SKELQH; i++) {
-		uhci->skelqh[i] = uhci_alloc_qh(uhci, NULL, NULL);
-		if (!uhci->skelqh[i]) {
-			dev_err(uhci_dev(uhci), "unable to allocate QH\n");
+	for (i = 0; i < UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUM_SKELQH; i++) {
+		universal_host_controller_interface->skelqh[i] = universal_host_controller_interface_alloc_qh(universal_host_controller_interface, NULL, NULL);
+		if (!universal_host_controller_interface->skelqh[i]) {
+			dev_err(universal_host_controller_interface_dev(universal_host_controller_interface), "unable to allocate QH\n");
 			goto err_alloc_skelqh;
 		}
 	}
@@ -642,25 +642,25 @@ static int uhci_start(struct universal_serial_bus_hcd *hcd)
 	 * 8 Interrupt queues; link all higher int queues to int1 = async
 	 */
 	for (i = SKEL_ISO + 1; i < SKEL_ASYNC; ++i)
-		uhci->skelqh[i]->link = LINK_TO_QH(uhci, uhci->skel_async_qh);
-	uhci->skel_async_qh->link = UHCI_PTR_TERM(uhci);
-	uhci->skel_term_qh->link = LINK_TO_QH(uhci, uhci->skel_term_qh);
+		universal_host_controller_interface->skelqh[i]->link = LINK_TO_QH(universal_host_controller_interface, universal_host_controller_interface->skel_async_qh);
+	universal_host_controller_interface->skel_async_qh->link = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
+	universal_host_controller_interface->skel_term_qh->link = LINK_TO_QH(universal_host_controller_interface, universal_host_controller_interface->skel_term_qh);
 
 	/* This dummy TD is to work around a bug in Intel PIIX controllers */
-	uhci_fill_td(uhci, uhci->term_td, 0, uhci_explen(0) |
+	universal_host_controller_interface_fill_td(universal_host_controller_interface, universal_host_controller_interface->term_td, 0, universal_host_controller_interface_explen(0) |
 			(0x7f << TD_TOKEN_DEVADDR_SHIFT) | UNIVERSAL_SERIAL_BUS_PID_IN, 0);
-	uhci->term_td->link = UHCI_PTR_TERM(uhci);
-	uhci->skel_async_qh->element = uhci->skel_term_qh->element =
-		LINK_TO_TD(uhci, uhci->term_td);
+	universal_host_controller_interface->term_td->link = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
+	universal_host_controller_interface->skel_async_qh->element = universal_host_controller_interface->skel_term_qh->element =
+		LINK_TO_TD(universal_host_controller_interface, universal_host_controller_interface->term_td);
 
 	/*
 	 * Fill the frame list: make all entries point to the proper
 	 * interrupt queue.
 	 */
-	for (i = 0; i < UHCI_NUMFRAMES; i++) {
+	for (i = 0; i < UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES; i++) {
 
 		/* Only place we don't use the frame list routines */
-		uhci->frame[i] = uhci_frame_skel_link(uhci, i);
+		universal_host_controller_interface->frame[i] = universal_host_controller_interface_frame_skel_link(universal_host_controller_interface, i);
 	}
 
 	/*
@@ -669,69 +669,69 @@ static int uhci_start(struct universal_serial_bus_hcd *hcd)
 	 */
 	mb();
 
-	spin_lock_irq(&uhci->lock);
-	configure_hc(uhci);
-	uhci->is_initialized = 1;
-	start_rh(uhci);
-	spin_unlock_irq(&uhci->lock);
+	spin_lock_irq(&universal_host_controller_interface->lock);
+	configure_hc(universal_host_controller_interface);
+	universal_host_controller_interface->is_initialized = 1;
+	start_rh(universal_host_controller_interface);
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 	return 0;
 
 /*
  * error exits:
  */
 err_alloc_skelqh:
-	for (i = 0; i < UHCI_NUM_SKELQH; i++) {
-		if (uhci->skelqh[i])
-			uhci_free_qh(uhci, uhci->skelqh[i]);
+	for (i = 0; i < UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUM_SKELQH; i++) {
+		if (universal_host_controller_interface->skelqh[i])
+			universal_host_controller_interface_free_qh(universal_host_controller_interface, universal_host_controller_interface->skelqh[i]);
 	}
 
-	uhci_free_td(uhci, uhci->term_td);
+	universal_host_controller_interface_free_td(universal_host_controller_interface, universal_host_controller_interface->term_td);
 
 err_alloc_term_td:
-	dma_pool_destroy(uhci->qh_pool);
+	dma_pool_destroy(universal_host_controller_interface->qh_pool);
 
 err_create_qh_pool:
-	dma_pool_destroy(uhci->td_pool);
+	dma_pool_destroy(universal_host_controller_interface->td_pool);
 
 err_create_td_pool:
-	kfree(uhci->frame_cpu);
+	kfree(universal_host_controller_interface->frame_cpu);
 
 err_alloc_frame_cpu:
-	dma_free_coherent(uhci_dev(uhci),
-			UHCI_NUMFRAMES * sizeof(*uhci->frame),
-			uhci->frame, uhci->frame_dma_handle);
+	dma_free_coherent(universal_host_controller_interface_dev(universal_host_controller_interface),
+			UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES * sizeof(*universal_host_controller_interface->frame),
+			universal_host_controller_interface->frame, universal_host_controller_interface->frame_dma_handle);
 
 err_alloc_frame:
-	debugfs_remove(uhci->dentry);
+	debugfs_remove(universal_host_controller_interface->dentry);
 
 	return retval;
 }
 
-static void uhci_stop(struct universal_serial_bus_hcd *hcd)
+static void universal_host_controller_interface_stop(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
-	spin_lock_irq(&uhci->lock);
-	if (HCD_HW_ACCESSIBLE(hcd) && !uhci->dead)
-		uhci_hc_died(uhci);
-	uhci_scan_schedule(uhci);
-	spin_unlock_irq(&uhci->lock);
+	spin_lock_irq(&universal_host_controller_interface->lock);
+	if (HCD_HW_ACCESSIBLE(hcd) && !universal_host_controller_interface->dead)
+		universal_host_controller_interface_hc_died(universal_host_controller_interface);
+	universal_host_controller_interface_scan_schedule(universal_host_controller_interface);
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 	synchronize_irq(hcd->irq);
 
-	del_timer_sync(&uhci->fsbr_timer);
-	release_uhci(uhci);
+	del_timer_sync(&universal_host_controller_interface->fsbr_timer);
+	release_universal_host_controller_interface(universal_host_controller_interface);
 }
 
 #ifdef CONFIG_PM
-static int uhci_rh_suspend(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_rh_suspend(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	int rc = 0;
 
-	spin_lock_irq(&uhci->lock);
+	spin_lock_irq(&universal_host_controller_interface->lock);
 	if (!HCD_HW_ACCESSIBLE(hcd))
 		rc = -ESHUTDOWN;
-	else if (uhci->dead)
+	else if (universal_host_controller_interface->dead)
 		;		/* Dead controllers tell no tales */
 
 	/* Once the controller is stopped, port resumes that are already
@@ -740,82 +740,82 @@ static int uhci_rh_suspend(struct universal_serial_bus_hcd *hcd)
 	 * remote wakeup, we must fail the suspend.
 	 */
 	else if (hcd->self.root_hub->do_remote_wakeup &&
-			uhci->resuming_ports) {
-		dev_dbg(uhci_dev(uhci),
+			universal_host_controller_interface->resuming_ports) {
+		dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface),
 			"suspend failed because a port is resuming\n");
 		rc = -EBUSY;
 	} else
-		suspend_rh(uhci, UHCI_RH_SUSPENDED);
-	spin_unlock_irq(&uhci->lock);
+		suspend_rh(universal_host_controller_interface, UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDED);
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 	return rc;
 }
 
-static int uhci_rh_resume(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_rh_resume(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	int rc = 0;
 
-	spin_lock_irq(&uhci->lock);
+	spin_lock_irq(&universal_host_controller_interface->lock);
 	if (!HCD_HW_ACCESSIBLE(hcd))
 		rc = -ESHUTDOWN;
-	else if (!uhci->dead)
-		wakeup_rh(uhci);
-	spin_unlock_irq(&uhci->lock);
+	else if (!universal_host_controller_interface->dead)
+		wakeup_rh(universal_host_controller_interface);
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 	return rc;
 }
 
 #endif
 
 /* Wait until a particular device/endpoint's QH is idle, and free it */
-static void uhci_hcd_endpoint_disable(struct universal_serial_bus_hcd *hcd,
+static void universal_host_controller_interface_hcd_endpoint_disable(struct universal_serial_bus_hcd *hcd,
 		struct universal_serial_bus_host_endpoint *hep)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
-	struct uhci_qh *qh;
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
+	struct universal_host_controller_interface_qh *qh;
 
-	spin_lock_irq(&uhci->lock);
-	qh = (struct uhci_qh *) hep->hcpriv;
+	spin_lock_irq(&universal_host_controller_interface->lock);
+	qh = (struct universal_host_controller_interface_qh *) hep->hcpriv;
 	if (qh == NULL)
 		goto done;
 
 	while (qh->state != QH_STATE_IDLE) {
-		++uhci->num_waiting;
-		spin_unlock_irq(&uhci->lock);
-		wait_event_interruptible(uhci->waitqh,
+		++universal_host_controller_interface->num_waiting;
+		spin_unlock_irq(&universal_host_controller_interface->lock);
+		wait_event_interruptible(universal_host_controller_interface->waitqh,
 				qh->state == QH_STATE_IDLE);
-		spin_lock_irq(&uhci->lock);
-		--uhci->num_waiting;
+		spin_lock_irq(&universal_host_controller_interface->lock);
+		--universal_host_controller_interface->num_waiting;
 	}
 
-	uhci_free_qh(uhci, qh);
+	universal_host_controller_interface_free_qh(universal_host_controller_interface, qh);
 done:
-	spin_unlock_irq(&uhci->lock);
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 }
 
-static int uhci_hcd_get_frame_number(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_hcd_get_frame_number(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	unsigned frame_number;
 	unsigned delta;
 
 	/* Minimize latency by avoiding the spinlock */
-	frame_number = uhci->frame_number;
+	frame_number = universal_host_controller_interface->frame_number;
 	barrier();
-	delta = (uhci_readw(uhci, UNIVERSAL_SERIAL_BUSFRNUM) - frame_number) &
-			(UHCI_NUMFRAMES - 1);
+	delta = (universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSFRNUM) - frame_number) &
+			(UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES - 1);
 	return frame_number + delta;
 }
 
 /* Determines number of ports on controller */
-static int uhci_count_ports(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_count_ports(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	unsigned io_size = (unsigned) hcd->rsrc_len;
 	int port;
 
-	/* The UHCI spec says devices must have 2 ports, and goes on to say
+	/* The UNIVERSAL_HOST_CONTROLLER_INTERFACE spec says devices must have 2 ports, and goes on to say
 	 * they may have more but gives no way to determine how many there
-	 * are.  However according to the UHCI spec, Bit 7 of the port
+	 * are.  However according to the UNIVERSAL_HOST_CONTROLLER_INTERFACE spec, Bit 7 of the port
 	 * status and control register is always set to 1.  So we try to
 	 * use this to our advantage.  Another common failure mode when
 	 * a nonexistent register is addressed is to return all ones, so
@@ -824,16 +824,16 @@ static int uhci_count_ports(struct universal_serial_bus_hcd *hcd)
 	for (port = 0; port < (io_size - UNIVERSAL_SERIAL_BUSPORTSC1) / 2; port++) {
 		unsigned int portstatus;
 
-		portstatus = uhci_readw(uhci, UNIVERSAL_SERIAL_BUSPORTSC1 + (port * 2));
+		portstatus = universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSPORTSC1 + (port * 2));
 		if (!(portstatus & 0x0080) || portstatus == 0xffff)
 			break;
 	}
 	if (debug)
-		dev_info(uhci_dev(uhci), "detected %d ports\n", port);
+		dev_info(universal_host_controller_interface_dev(universal_host_controller_interface), "detected %d ports\n", port);
 
 	/* Anything greater than 7 is weird so we'll ignore it. */
-	if (port > UHCI_RH_MAXCHILD) {
-		dev_info(uhci_dev(uhci),
+	if (port > UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_MAXCHILD) {
+		dev_info(universal_host_controller_interface_dev(universal_host_controller_interface),
 			"port count misdetected? forcing to 2 ports\n");
 		port = 2;
 	}
@@ -841,48 +841,48 @@ static int uhci_count_ports(struct universal_serial_bus_hcd *hcd)
 	return port;
 }
 
-static const char hcd_name[] = "uhci_hcd";
+static const char hcd_name[] = "universal_host_controller_interface_hcd";
 
 #ifdef CONFIG_UNIVERSAL_SERIAL_BUS_PCI
-#include "uhci-pci.c"
-#define	PCI_DRIVER		uhci_pci_driver
+#include "universal_host_controller_interface-pci.c"
+#define	PCI_DRIVER		universal_host_controller_interface_pci_driver
 #endif
 
 #ifdef CONFIG_SPARC_LEON
-#include "uhci-grlib.c"
-#define PLATFORM_DRIVER		uhci_grlib_driver
+#include "universal_host_controller_interface-grlib.c"
+#define PLATFORM_DRIVER		universal_host_controller_interface_grlib_driver
 #endif
 
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_PLATFORM
-#include "uhci-platform.c"
-#define PLATFORM_DRIVER		uhci_platform_driver
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_PLATFORM
+#include "universal_host_controller_interface-platform.c"
+#define PLATFORM_DRIVER		universal_host_controller_interface_platform_driver
 #endif
 
 #if !defined(PCI_DRIVER) && !defined(PLATFORM_DRIVER)
-#error "missing bus glue for uhci-hcd"
+#error "missing bus glue for universal_host_controller_interface-hcd"
 #endif
 
-static int __init uhci_hcd_init(void)
+static int __init universal_host_controller_interface_hcd_init(void)
 {
 	int retval = -ENOMEM;
 
 	if (universal_serial_bus_disabled())
 		return -ENODEV;
 
-	printk(KERN_INFO "uhci_hcd: " DRIVER_DESC "%s\n",
+	printk(KERN_INFO "universal_host_controller_interface_hcd: " DRIVER_DESC "%s\n",
 			ignore_oc ? ", overcurrent ignored" : "");
-	set_bit(UNIVERSAL_SERIAL_BUS_UHCI_LOADED, &universal_serial_bus_hcds_loaded);
+	set_bit(UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_LOADED, &universal_serial_bus_hcds_loaded);
 
 #ifdef CONFIG_DYNAMIC_DEBUG
 	errbuf = kmalloc(ERRBUF_LEN, GFP_KERNEL);
 	if (!errbuf)
 		goto errbuf_failed;
-	uhci_debugfs_root = debugfs_create_dir("uhci", universal_serial_bus_debug_root);
+	universal_host_controller_interface_debugfs_root = debugfs_create_dir("universal_host_controller_interface", universal_serial_bus_debug_root);
 #endif
 
-	uhci_up_cachep = kmem_cache_create("uhci_urb_priv",
+	universal_host_controller_interface_up_cachep = kmem_cache_create("universal_host_controller_interface_urb_priv",
 		sizeof(struct urb_priv), 0, 0, NULL);
-	if (!uhci_up_cachep)
+	if (!universal_host_controller_interface_up_cachep)
 		goto up_failed;
 
 #ifdef PLATFORM_DRIVER
@@ -906,22 +906,22 @@ static int __init uhci_hcd_init(void)
 	platform_driver_unregister(&PLATFORM_DRIVER);
 clean0:
 #endif
-	kmem_cache_destroy(uhci_up_cachep);
+	kmem_cache_destroy(universal_host_controller_interface_up_cachep);
 
 up_failed:
 #if defined(DEBUG) || defined(CONFIG_DYNAMIC_DEBUG)
-	debugfs_remove(uhci_debugfs_root);
+	debugfs_remove(universal_host_controller_interface_debugfs_root);
 
 	kfree(errbuf);
 
 errbuf_failed:
 #endif
 
-	clear_bit(UNIVERSAL_SERIAL_BUS_UHCI_LOADED, &universal_serial_bus_hcds_loaded);
+	clear_bit(UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_LOADED, &universal_serial_bus_hcds_loaded);
 	return retval;
 }
 
-static void __exit uhci_hcd_cleanup(void) 
+static void __exit universal_host_controller_interface_hcd_cleanup(void) 
 {
 #ifdef PLATFORM_DRIVER
 	platform_driver_unregister(&PLATFORM_DRIVER);
@@ -929,16 +929,16 @@ static void __exit uhci_hcd_cleanup(void)
 #ifdef PCI_DRIVER
 	pci_unregister_driver(&PCI_DRIVER);
 #endif
-	kmem_cache_destroy(uhci_up_cachep);
-	debugfs_remove(uhci_debugfs_root);
+	kmem_cache_destroy(universal_host_controller_interface_up_cachep);
+	debugfs_remove(universal_host_controller_interface_debugfs_root);
 #ifdef CONFIG_DYNAMIC_DEBUG
 	kfree(errbuf);
 #endif
-	clear_bit(UNIVERSAL_SERIAL_BUS_UHCI_LOADED, &universal_serial_bus_hcds_loaded);
+	clear_bit(UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_LOADED, &universal_serial_bus_hcds_loaded);
 }
 
-module_init(uhci_hcd_init);
-module_exit(uhci_hcd_cleanup);
+module_init(universal_host_controller_interface_hcd_init);
+module_exit(universal_host_controller_interface_hcd_cleanup);
 
 MODULE_AUTHOR(DRIVER_AUTHOR);
 MODULE_DESCRIPTION(DRIVER_DESC);
diff --git a/drivers/usb/host/uhci-hcd.h b/drivers/usb/host/uhci-hcd.h
index e3f118a17f27..3baadc510b6e 100644
--- a/drivers/usb/host/uhci-hcd.h
+++ b/drivers/usb/host/uhci-hcd.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __LINUX_UHCI_HCD_H
-#define __LINUX_UHCI_HCD_H
+#ifndef __LINUX_UNIVERSAL_HOST_CONTROLLER_INTERFACE_HCD_H
+#define __LINUX_UNIVERSAL_HOST_CONTROLLER_INTERFACE_HCD_H
 
 #include <linux/list.h>
 #include <linux/universal_serial_bus.h>
@@ -63,7 +63,7 @@
 #define   UNIVERSAL_SERIAL_BUSPORTSC_RES1	0x0080	/* reserved, always 1 */
 #define   UNIVERSAL_SERIAL_BUSPORTSC_LSDA	0x0100	/* Low Speed Device Attached */
 #define   UNIVERSAL_SERIAL_BUSPORTSC_PR		0x0200	/* Port Reset */
-/* OC and OCC from Intel 430TX and later (not UHCI 1.1d spec) */
+/* OC and OCC from Intel 430TX and later (not UNIVERSAL_HOST_CONTROLLER_INTERFACE 1.1d spec) */
 #define   UNIVERSAL_SERIAL_BUSPORTSC_OC		0x0400	/* Over Current condition */
 #define   UNIVERSAL_SERIAL_BUSPORTSC_OCC		0x0800	/* Over Current Change R/WC */
 #define   UNIVERSAL_SERIAL_BUSPORTSC_SUSP	0x1000	/* Suspend */
@@ -82,14 +82,14 @@
 #define   UNIVERSAL_SERIAL_BUSPORT1EN		0x01
 #define   UNIVERSAL_SERIAL_BUSPORT2EN		0x02
 
-#define UHCI_PTR_BITS(uhci)	cpu_to_hc32((uhci), 0x000F)
-#define UHCI_PTR_TERM(uhci)	cpu_to_hc32((uhci), 0x0001)
-#define UHCI_PTR_QH(uhci)	cpu_to_hc32((uhci), 0x0002)
-#define UHCI_PTR_DEPTH(uhci)	cpu_to_hc32((uhci), 0x0004)
-#define UHCI_PTR_BREADTH(uhci)	cpu_to_hc32((uhci), 0x0000)
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_BITS(universal_host_controller_interface)	cpu_to_hc32((universal_host_controller_interface), 0x000F)
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface)	cpu_to_hc32((universal_host_controller_interface), 0x0001)
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_QH(universal_host_controller_interface)	cpu_to_hc32((universal_host_controller_interface), 0x0002)
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_DEPTH(universal_host_controller_interface)	cpu_to_hc32((universal_host_controller_interface), 0x0004)
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_BREADTH(universal_host_controller_interface)	cpu_to_hc32((universal_host_controller_interface), 0x0000)
 
-#define UHCI_NUMFRAMES		1024	/* in the frame list [array] */
-#define UHCI_MAX_SOF_NUMBER	2047	/* in an SOF packet */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES		1024	/* in the frame list [array] */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_MAX_SOF_NUMBER	2047	/* in an SOF packet */
 #define CAN_SCHEDULE_FRAMES	1000	/* how far in the future frames
 					 * can be scheduled */
 #define MAX_PHASE		32	/* Periodic scheduling length */
@@ -104,13 +104,13 @@
 
 /*
  * __hc32 and __hc16 are "Host Controller" types, they may be equivalent to
- * __leXX (normally) or __beXX (given UHCI_BIG_ENDIAN_DESC), depending on
+ * __leXX (normally) or __beXX (given UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_DESC), depending on
  * the host controller implementation.
  *
  * To facilitate the strongest possible byte-order checking from "sparse"
  * and so on, we use __leXX unless that's not practical.
  */
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_DESC
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_DESC
 typedef __u32 __bitwise __hc32;
 typedef __u16 __bitwise __hc16;
 #else
@@ -126,11 +126,11 @@ typedef __u16 __bitwise __hc16;
  * One role of a QH is to hold a queue of TDs for some endpoint.  One QH goes
  * with each endpoint, and qh->element (updated by the HC) is either:
  *   - the next unprocessed TD in the endpoint's queue, or
- *   - UHCI_PTR_TERM (when there's no more traffic for this endpoint).
+ *   - UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM (when there's no more traffic for this endpoint).
  *
  * The other role of a QH is to serve as a "skeleton" framelist entry, so we
  * can easily splice a QH for some endpoint into the schedule at the right
- * place.  Then qh->element is UHCI_PTR_TERM.
+ * place.  Then qh->element is UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM.
  *
  * In the schedule, qh->link maintains a list of QHs seen by the HC:
  *     skel1 --> ep1-qh --> ep2-qh --> ... --> skel2 --> ...
@@ -148,7 +148,7 @@ typedef __u16 __bitwise __hc16;
 					 * still be using it */
 #define QH_STATE_ACTIVE		3	/* QH is on the schedule */
 
-struct uhci_qh {
+struct universal_host_controller_interface_qh {
 	/* Hardware fields */
 	__hc32 link;			/* Next QH in the schedule */
 	__hc32 element;			/* Queue element (TD) pointer */
@@ -160,8 +160,8 @@ struct uhci_qh {
 	struct universal_serial_bus_host_endpoint *hep;	/* Endpoint information */
 	struct universal_serial_bus_device *udev;
 	struct list_head queue;		/* Queue of urbps for this QH */
-	struct uhci_td *dummy_td;	/* Dummy TD to end the queue */
-	struct uhci_td *post_td;	/* Last TD completed */
+	struct universal_host_controller_interface_td *dummy_td;	/* Dummy TD to end the queue */
+	struct universal_host_controller_interface_td *post_td;	/* Last TD completed */
 
 	struct universal_serial_bus_iso_packet_descriptor *iso_packet_desc;
 					/* Next urb->iso_frame_desc entry */
@@ -190,8 +190,8 @@ struct uhci_qh {
  */
 #define qh_element(qh)		READ_ONCE((qh)->element)
 
-#define LINK_TO_QH(uhci, qh)	(UHCI_PTR_QH((uhci)) | \
-				cpu_to_hc32((uhci), (qh)->dma_handle))
+#define LINK_TO_QH(universal_host_controller_interface, qh)	(UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_QH((universal_host_controller_interface)) | \
+				cpu_to_hc32((universal_host_controller_interface), (qh)->dma_handle))
 
 
 /*
@@ -216,15 +216,15 @@ struct uhci_qh {
 #define TD_CTRL_BITSTUFF	(1 << 17)	/* Bit Stuff Error */
 #define TD_CTRL_ACTLEN_MASK	0x7FF	/* actual length, encoded as n - 1 */
 
-#define uhci_maxerr(err)		((err) << TD_CTRL_C_ERR_SHIFT)
-#define uhci_status_bits(ctrl_sts)	((ctrl_sts) & 0xF60000)
-#define uhci_actual_length(ctrl_sts)	(((ctrl_sts) + 1) & \
+#define universal_host_controller_interface_maxerr(err)		((err) << TD_CTRL_C_ERR_SHIFT)
+#define universal_host_controller_interface_status_bits(ctrl_sts)	((ctrl_sts) & 0xF60000)
+#define universal_host_controller_interface_actual_length(ctrl_sts)	(((ctrl_sts) + 1) & \
 			TD_CTRL_ACTLEN_MASK)	/* 1-based */
 
 /*
  * for TD <info>: (a.k.a. Token)
  */
-#define td_token(uhci, td)	hc32_to_cpu((uhci), (td)->token)
+#define td_token(universal_host_controller_interface, td)	hc32_to_cpu((universal_host_controller_interface), (td)->token)
 #define TD_TOKEN_DEVADDR_SHIFT	8
 #define TD_TOKEN_TOGGLE_SHIFT	19
 #define TD_TOKEN_TOGGLE		(1 << 19)
@@ -232,18 +232,18 @@ struct uhci_qh {
 #define TD_TOKEN_EXPLEN_MASK	0x7FF	/* expected length, encoded as n-1 */
 #define TD_TOKEN_PID_MASK	0xFF
 
-#define uhci_explen(len)	((((len) - 1) & TD_TOKEN_EXPLEN_MASK) << \
+#define universal_host_controller_interface_explen(len)	((((len) - 1) & TD_TOKEN_EXPLEN_MASK) << \
 					TD_TOKEN_EXPLEN_SHIFT)
 
-#define uhci_expected_length(token) ((((token) >> TD_TOKEN_EXPLEN_SHIFT) + \
+#define universal_host_controller_interface_expected_length(token) ((((token) >> TD_TOKEN_EXPLEN_SHIFT) + \
 					1) & TD_TOKEN_EXPLEN_MASK)
-#define uhci_toggle(token)	(((token) >> TD_TOKEN_TOGGLE_SHIFT) & 1)
-#define uhci_endpoint(token)	(((token) >> 15) & 0xf)
-#define uhci_devaddr(token)	(((token) >> TD_TOKEN_DEVADDR_SHIFT) & 0x7f)
-#define uhci_devep(token)	(((token) >> TD_TOKEN_DEVADDR_SHIFT) & 0x7ff)
-#define uhci_packetid(token)	((token) & TD_TOKEN_PID_MASK)
-#define uhci_packetout(token)	(uhci_packetid(token) != UNIVERSAL_SERIAL_BUS_PID_IN)
-#define uhci_packetin(token)	(uhci_packetid(token) == UNIVERSAL_SERIAL_BUS_PID_IN)
+#define universal_host_controller_interface_toggle(token)	(((token) >> TD_TOKEN_TOGGLE_SHIFT) & 1)
+#define universal_host_controller_interface_endpoint(token)	(((token) >> 15) & 0xf)
+#define universal_host_controller_interface_devaddr(token)	(((token) >> TD_TOKEN_DEVADDR_SHIFT) & 0x7f)
+#define universal_host_controller_interface_devep(token)	(((token) >> TD_TOKEN_DEVADDR_SHIFT) & 0x7ff)
+#define universal_host_controller_interface_packetid(token)	((token) & TD_TOKEN_PID_MASK)
+#define universal_host_controller_interface_packetout(token)	(universal_host_controller_interface_packetid(token) != UNIVERSAL_SERIAL_BUS_PID_IN)
+#define universal_host_controller_interface_packetin(token)	(universal_host_controller_interface_packetid(token) == UNIVERSAL_SERIAL_BUS_PID_IN)
 
 /*
  * The documentation says "4 words for hardware, 4 words for software".
@@ -255,7 +255,7 @@ struct uhci_qh {
  * td->link points to either another TD (not necessarily for the same urb or
  * even the same endpoint), or nothing (PTR_TERM), or a QH.
  */
-struct uhci_td {
+struct universal_host_controller_interface_td {
 	/* Hardware fields */
 	__hc32 link;
 	__hc32 status;
@@ -275,10 +275,10 @@ struct uhci_td {
  * We need a special accessor for the control/status word because it is
  * subject to asynchronous updates by the controller.
  */
-#define td_status(uhci, td)		hc32_to_cpu((uhci), \
+#define td_status(universal_host_controller_interface, td)		hc32_to_cpu((universal_host_controller_interface), \
 						READ_ONCE((td)->status))
 
-#define LINK_TO_TD(uhci, td)		(cpu_to_hc32((uhci), (td)->dma_handle))
+#define LINK_TO_TD(universal_host_controller_interface, td)		(cpu_to_hc32((universal_host_controller_interface), (td)->dma_handle))
 
 
 /*
@@ -286,7 +286,7 @@ struct uhci_td {
  */
 
 /*
- * The UHCI driver uses QHs with Interrupt, Control and Bulk URBs for
+ * The UNIVERSAL_HOST_CONTROLLER_INTERFACE driver uses QHs with Interrupt, Control and Bulk URBs for
  * automatic queuing. To make it easy to insert entries into the schedule,
  * we have a skeleton of QHs for each predefined Interrupt latency.
  * Asynchronous QHs (low-speed control, full-speed control, and bulk)
@@ -316,7 +316,7 @@ struct uhci_td {
  * on the schedule.  Isochronous TDs go on the schedule before the
  * the skeleton QHs.  The hardware accesses them directly rather than
  * through their QH, which is used only for bookkeeping purposes.
- * While the UHCI spec doesn't forbid the use of QHs for Isochronous,
+ * While the UNIVERSAL_HOST_CONTROLLER_INTERFACE spec doesn't forbid the use of QHs for Isochronous,
  * it doesn't use them either.  And the spec says that queues never
  * advance on an error completion status, which makes them totally
  * unsuitable for Isochronous transfers.
@@ -326,7 +326,7 @@ struct uhci_td {
  * appears on the schedule.
  */
 
-#define UHCI_NUM_SKELQH		11
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUM_SKELQH		11
 #define SKEL_UNLINK		0
 #define skel_unlink_qh		skelqh[SKEL_UNLINK]
 #define SKEL_ISO		1
@@ -345,7 +345,7 @@ struct uhci_td {
 #define SKEL_BULK		22
 
 /*
- *	The UHCI controller and root hub
+ *	The UNIVERSAL_HOST_CONTROLLER_INTERFACE controller and root hub
  */
 
 /*
@@ -358,29 +358,29 @@ struct uhci_td {
  * (Note that the AUTO_STOPPED state won't be necessary once the hub
  * driver learns to autosuspend.)
  */
-enum uhci_rh_state {
+enum universal_host_controller_interface_rh_state {
 	/* In the following states the HC must be halted.
 	 * These two must come first. */
-	UHCI_RH_RESET,
-	UHCI_RH_SUSPENDED,
+	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RESET,
+	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDED,
 
-	UHCI_RH_AUTO_STOPPED,
-	UHCI_RH_RESUMING,
+	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_AUTO_STOPPED,
+	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RESUMING,
 
 	/* In this state the HC changes from running to halted,
 	 * so it can legally appear either way. */
-	UHCI_RH_SUSPENDING,
+	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDING,
 
 	/* In the following states it's an error if the HC is halted.
 	 * These two must come last. */
-	UHCI_RH_RUNNING,		/* The normal state */
-	UHCI_RH_RUNNING_NODEVS,		/* Running with no devices attached */
+	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING,		/* The normal state */
+	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING_NODEVS,		/* Running with no devices attached */
 };
 
 /*
- * The full UHCI controller information:
+ * The full UNIVERSAL_HOST_CONTROLLER_INTERFACE controller information:
  */
-struct uhci_hcd {
+struct universal_host_controller_interface_hcd {
 
 	/* debugfs */
 	struct dentry *dentry;
@@ -394,9 +394,9 @@ struct uhci_hcd {
 	struct dma_pool *qh_pool;
 	struct dma_pool *td_pool;
 
-	struct uhci_td *term_td;	/* Terminating TD, see UHCI bug */
-	struct uhci_qh *skelqh[UHCI_NUM_SKELQH];	/* Skeleton QHs */
-	struct uhci_qh *next_qh;	/* Next QH to scan */
+	struct universal_host_controller_interface_td *term_td;	/* Terminating TD, see UNIVERSAL_HOST_CONTROLLER_INTERFACE bug */
+	struct universal_host_controller_interface_qh *skelqh[UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUM_SKELQH];	/* Skeleton QHs */
+	struct universal_host_controller_interface_qh *next_qh;	/* Next QH to scan */
 
 	spinlock_t lock;
 
@@ -404,12 +404,12 @@ struct uhci_hcd {
 	__hc32 *frame;
 	void **frame_cpu;		/* CPU's frame list */
 
-	enum uhci_rh_state rh_state;
+	enum universal_host_controller_interface_rh_state rh_state;
 	unsigned long auto_stop_time;		/* When to AUTO_STOP */
 
 	unsigned int frame_number;		/* As of last check */
 	unsigned int is_stopped;
-#define UHCI_IS_STOPPED		9999		/* Larger than a frame # */
+#define UNIVERSAL_HOST_CONTROLLER_INTERFACE_IS_STOPPED		9999		/* Larger than a frame # */
 	unsigned int last_iso_frame;		/* Frame of last scan */
 	unsigned int cur_iso_frame;		/* Frame for current scan */
 
@@ -451,30 +451,30 @@ struct uhci_hcd {
 	struct clk *clk;			/* (optional) clock source */
 
 	/* Reset host controller */
-	void	(*reset_hc) (struct uhci_hcd *uhci);
-	int	(*check_and_reset_hc) (struct uhci_hcd *uhci);
+	void	(*reset_hc) (struct universal_host_controller_interface_hcd *universal_host_controller_interface);
+	int	(*check_and_reset_hc) (struct universal_host_controller_interface_hcd *universal_host_controller_interface);
 	/* configure_hc should perform arch specific settings, if needed */
-	void	(*configure_hc) (struct uhci_hcd *uhci);
+	void	(*configure_hc) (struct universal_host_controller_interface_hcd *universal_host_controller_interface);
 	/* Check for broken resume detect interrupts */
-	int	(*resume_detect_interrupts_are_broken) (struct uhci_hcd *uhci);
+	int	(*resume_detect_interrupts_are_broken) (struct universal_host_controller_interface_hcd *universal_host_controller_interface);
 	/* Check for broken global suspend */
-	int	(*global_suspend_mode_is_broken) (struct uhci_hcd *uhci);
+	int	(*global_suspend_mode_is_broken) (struct universal_host_controller_interface_hcd *universal_host_controller_interface);
 };
 
-/* Convert between a universal_serial_bus_hcd pointer and the corresponding uhci_hcd */
-static inline struct uhci_hcd *hcd_to_uhci(struct universal_serial_bus_hcd *hcd)
+/* Convert between a universal_serial_bus_hcd pointer and the corresponding universal_host_controller_interface_hcd */
+static inline struct universal_host_controller_interface_hcd *hcd_to_universal_host_controller_interface(struct universal_serial_bus_hcd *hcd)
 {
-	return (struct uhci_hcd *) (hcd->hcd_priv);
+	return (struct universal_host_controller_interface_hcd *) (hcd->hcd_priv);
 }
-static inline struct universal_serial_bus_hcd *uhci_to_hcd(struct uhci_hcd *uhci)
+static inline struct universal_serial_bus_hcd *universal_host_controller_interface_to_hcd(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	return container_of((void *) uhci, struct universal_serial_bus_hcd, hcd_priv);
+	return container_of((void *) universal_host_controller_interface, struct universal_serial_bus_hcd, hcd_priv);
 }
 
-#define uhci_dev(u)	(uhci_to_hcd(u)->self.controller)
+#define universal_host_controller_interface_dev(u)	(universal_host_controller_interface_to_hcd(u)->self.controller)
 
 /* Utility macro for comparing frame numbers */
-#define uhci_frame_before_eq(f1, f2)	(0 <= (int) ((f2) - (f1)))
+#define universal_host_controller_interface_frame_before_eq(f1, f2)	(0 <= (int) ((f2) - (f1)))
 
 
 /*
@@ -485,7 +485,7 @@ struct urb_priv {
 
 	struct urb *urb;
 
-	struct uhci_qh *qh;		/* QH for this URB */
+	struct universal_host_controller_interface_qh *qh;		/* QH for this URB */
 	struct list_head td_list;
 
 	unsigned fsbr:1;		/* URB wants FSBR */
@@ -495,12 +495,12 @@ struct urb_priv {
 /* Some special IDs */
 
 #define PCI_VENDOR_ID_GENESYS		0x17a0
-#define PCI_DEVICE_ID_GL880S_UHCI	0x8083
+#define PCI_DEVICE_ID_GL880S_UNIVERSAL_HOST_CONTROLLER_INTERFACE	0x8083
 
 /* Aspeed SoC needs some quirks */
-static inline bool uhci_is_aspeed(const struct uhci_hcd *uhci)
+static inline bool universal_host_controller_interface_is_aspeed(const struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	return IS_ENABLED(CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_ASPEED) && uhci->is_aspeed;
+	return IS_ENABLED(CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_ASPEED) && universal_host_controller_interface->is_aspeed;
 }
 
 /*
@@ -509,56 +509,56 @@ static inline bool uhci_is_aspeed(const struct uhci_hcd *uhci)
  * we use memory mapped registers.
  */
 
-#ifndef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_SUPPORT_NON_PCI_HC
+#ifndef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_SUPPORT_NON_PCI_HC
 /* Support PCI only */
-static inline u32 uhci_readl(const struct uhci_hcd *uhci, int reg)
+static inline u32 universal_host_controller_interface_readl(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, int reg)
 {
-	return inl(uhci->io_addr + reg);
+	return inl(universal_host_controller_interface->io_addr + reg);
 }
 
-static inline void uhci_writel(const struct uhci_hcd *uhci, u32 val, int reg)
+static inline void universal_host_controller_interface_writel(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, u32 val, int reg)
 {
-	outl(val, uhci->io_addr + reg);
+	outl(val, universal_host_controller_interface->io_addr + reg);
 }
 
-static inline u16 uhci_readw(const struct uhci_hcd *uhci, int reg)
+static inline u16 universal_host_controller_interface_readw(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, int reg)
 {
-	return inw(uhci->io_addr + reg);
+	return inw(universal_host_controller_interface->io_addr + reg);
 }
 
-static inline void uhci_writew(const struct uhci_hcd *uhci, u16 val, int reg)
+static inline void universal_host_controller_interface_writew(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, u16 val, int reg)
 {
-	outw(val, uhci->io_addr + reg);
+	outw(val, universal_host_controller_interface->io_addr + reg);
 }
 
-static inline u8 uhci_readb(const struct uhci_hcd *uhci, int reg)
+static inline u8 universal_host_controller_interface_readb(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, int reg)
 {
-	return inb(uhci->io_addr + reg);
+	return inb(universal_host_controller_interface->io_addr + reg);
 }
 
-static inline void uhci_writeb(const struct uhci_hcd *uhci, u8 val, int reg)
+static inline void universal_host_controller_interface_writeb(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, u8 val, int reg)
 {
-	outb(val, uhci->io_addr + reg);
+	outb(val, universal_host_controller_interface->io_addr + reg);
 }
 
 #else
 /* Support non-PCI host controllers */
 #ifdef CONFIG_UNIVERSAL_SERIAL_BUS_PCI
 /* Support PCI and non-PCI host controllers */
-#define uhci_has_pci_registers(u)	((u)->io_addr != 0)
+#define universal_host_controller_interface_has_pci_registers(u)	((u)->io_addr != 0)
 #else
 /* Support non-PCI host controllers only */
-#define uhci_has_pci_registers(u)	0
+#define universal_host_controller_interface_has_pci_registers(u)	0
 #endif
 
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
 /* Support (non-PCI) big endian host controllers */
-#define uhci_big_endian_mmio(u)		((u)->big_endian_mmio)
+#define universal_host_controller_interface_big_endian_mmio(u)		((u)->big_endian_mmio)
 #else
-#define uhci_big_endian_mmio(u)		0
+#define universal_host_controller_interface_big_endian_mmio(u)		0
 #endif
 
-static inline int uhci_aspeed_reg(unsigned int reg)
+static inline int universal_host_controller_interface_aspeed_reg(unsigned int reg)
 {
 	switch (reg) {
 	case UNIVERSAL_SERIAL_BUSCMD:
@@ -582,131 +582,131 @@ static inline int uhci_aspeed_reg(unsigned int reg)
 	case UNIVERSAL_SERIAL_BUSPORTSC4:
 		return 0x94;
 	default:
-		pr_warn("UHCI: Unsupported register 0x%02x on Aspeed\n", reg);
+		pr_warn("UNIVERSAL_HOST_CONTROLLER_INTERFACE: Unsupported register 0x%02x on Aspeed\n", reg);
 		/* Return an unimplemented register */
 		return 0x10;
 	}
 }
 
-static inline u32 uhci_readl(const struct uhci_hcd *uhci, int reg)
+static inline u32 universal_host_controller_interface_readl(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, int reg)
 {
-	if (uhci_has_pci_registers(uhci))
-		return inl(uhci->io_addr + reg);
-	else if (uhci_is_aspeed(uhci))
-		return readl(uhci->regs + uhci_aspeed_reg(reg));
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
-	else if (uhci_big_endian_mmio(uhci))
-		return readl_be(uhci->regs + reg);
+	if (universal_host_controller_interface_has_pci_registers(universal_host_controller_interface))
+		return inl(universal_host_controller_interface->io_addr + reg);
+	else if (universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
+		return readl(universal_host_controller_interface->regs + universal_host_controller_interface_aspeed_reg(reg));
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
+	else if (universal_host_controller_interface_big_endian_mmio(universal_host_controller_interface))
+		return readl_be(universal_host_controller_interface->regs + reg);
 #endif
 	else
-		return readl(uhci->regs + reg);
+		return readl(universal_host_controller_interface->regs + reg);
 }
 
-static inline void uhci_writel(const struct uhci_hcd *uhci, u32 val, int reg)
+static inline void universal_host_controller_interface_writel(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, u32 val, int reg)
 {
-	if (uhci_has_pci_registers(uhci))
-		outl(val, uhci->io_addr + reg);
-	else if (uhci_is_aspeed(uhci))
-		writel(val, uhci->regs + uhci_aspeed_reg(reg));
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
-	else if (uhci_big_endian_mmio(uhci))
-		writel_be(val, uhci->regs + reg);
+	if (universal_host_controller_interface_has_pci_registers(universal_host_controller_interface))
+		outl(val, universal_host_controller_interface->io_addr + reg);
+	else if (universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
+		writel(val, universal_host_controller_interface->regs + universal_host_controller_interface_aspeed_reg(reg));
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
+	else if (universal_host_controller_interface_big_endian_mmio(universal_host_controller_interface))
+		writel_be(val, universal_host_controller_interface->regs + reg);
 #endif
 	else
-		writel(val, uhci->regs + reg);
+		writel(val, universal_host_controller_interface->regs + reg);
 }
 
-static inline u16 uhci_readw(const struct uhci_hcd *uhci, int reg)
+static inline u16 universal_host_controller_interface_readw(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, int reg)
 {
-	if (uhci_has_pci_registers(uhci))
-		return inw(uhci->io_addr + reg);
-	else if (uhci_is_aspeed(uhci))
-		return readl(uhci->regs + uhci_aspeed_reg(reg));
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
-	else if (uhci_big_endian_mmio(uhci))
-		return readw_be(uhci->regs + reg);
+	if (universal_host_controller_interface_has_pci_registers(universal_host_controller_interface))
+		return inw(universal_host_controller_interface->io_addr + reg);
+	else if (universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
+		return readl(universal_host_controller_interface->regs + universal_host_controller_interface_aspeed_reg(reg));
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
+	else if (universal_host_controller_interface_big_endian_mmio(universal_host_controller_interface))
+		return readw_be(universal_host_controller_interface->regs + reg);
 #endif
 	else
-		return readw(uhci->regs + reg);
+		return readw(universal_host_controller_interface->regs + reg);
 }
 
-static inline void uhci_writew(const struct uhci_hcd *uhci, u16 val, int reg)
+static inline void universal_host_controller_interface_writew(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, u16 val, int reg)
 {
-	if (uhci_has_pci_registers(uhci))
-		outw(val, uhci->io_addr + reg);
-	else if (uhci_is_aspeed(uhci))
-		writel(val, uhci->regs + uhci_aspeed_reg(reg));
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
-	else if (uhci_big_endian_mmio(uhci))
-		writew_be(val, uhci->regs + reg);
+	if (universal_host_controller_interface_has_pci_registers(universal_host_controller_interface))
+		outw(val, universal_host_controller_interface->io_addr + reg);
+	else if (universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
+		writel(val, universal_host_controller_interface->regs + universal_host_controller_interface_aspeed_reg(reg));
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
+	else if (universal_host_controller_interface_big_endian_mmio(universal_host_controller_interface))
+		writew_be(val, universal_host_controller_interface->regs + reg);
 #endif
 	else
-		writew(val, uhci->regs + reg);
+		writew(val, universal_host_controller_interface->regs + reg);
 }
 
-static inline u8 uhci_readb(const struct uhci_hcd *uhci, int reg)
+static inline u8 universal_host_controller_interface_readb(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, int reg)
 {
-	if (uhci_has_pci_registers(uhci))
-		return inb(uhci->io_addr + reg);
-	else if (uhci_is_aspeed(uhci))
-		return readl(uhci->regs + uhci_aspeed_reg(reg));
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
-	else if (uhci_big_endian_mmio(uhci))
-		return readb_be(uhci->regs + reg);
+	if (universal_host_controller_interface_has_pci_registers(universal_host_controller_interface))
+		return inb(universal_host_controller_interface->io_addr + reg);
+	else if (universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
+		return readl(universal_host_controller_interface->regs + universal_host_controller_interface_aspeed_reg(reg));
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
+	else if (universal_host_controller_interface_big_endian_mmio(universal_host_controller_interface))
+		return readb_be(universal_host_controller_interface->regs + reg);
 #endif
 	else
-		return readb(uhci->regs + reg);
+		return readb(universal_host_controller_interface->regs + reg);
 }
 
-static inline void uhci_writeb(const struct uhci_hcd *uhci, u8 val, int reg)
+static inline void universal_host_controller_interface_writeb(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, u8 val, int reg)
 {
-	if (uhci_has_pci_registers(uhci))
-		outb(val, uhci->io_addr + reg);
-	else if (uhci_is_aspeed(uhci))
-		writel(val, uhci->regs + uhci_aspeed_reg(reg));
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_MMIO
-	else if (uhci_big_endian_mmio(uhci))
-		writeb_be(val, uhci->regs + reg);
+	if (universal_host_controller_interface_has_pci_registers(universal_host_controller_interface))
+		outb(val, universal_host_controller_interface->io_addr + reg);
+	else if (universal_host_controller_interface_is_aspeed(universal_host_controller_interface))
+		writel(val, universal_host_controller_interface->regs + universal_host_controller_interface_aspeed_reg(reg));
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_MMIO
+	else if (universal_host_controller_interface_big_endian_mmio(universal_host_controller_interface))
+		writeb_be(val, universal_host_controller_interface->regs + reg);
 #endif
 	else
-		writeb(val, uhci->regs + reg);
+		writeb(val, universal_host_controller_interface->regs + reg);
 }
-#endif /* CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_SUPPORT_NON_PCI_HC */
+#endif /* CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_SUPPORT_NON_PCI_HC */
 
 /*
  * The GRLIB GRUNIVERSAL_SERIAL_BUSHC controller can use big endian format for its descriptors.
  *
- * UHCI controllers accessed through PCI work normally (little-endian
+ * UNIVERSAL_HOST_CONTROLLER_INTERFACE controllers accessed through PCI work normally (little-endian
  * everywhere), so we don't bother supporting a BE-only mode.
  */
-#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UHCI_BIG_ENDIAN_DESC
-#define uhci_big_endian_desc(u)		((u)->big_endian_desc)
+#ifdef CONFIG_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE_BIG_ENDIAN_DESC
+#define universal_host_controller_interface_big_endian_desc(u)		((u)->big_endian_desc)
 
-/* cpu to uhci */
-static inline __hc32 cpu_to_hc32(const struct uhci_hcd *uhci, const u32 x)
+/* cpu to universal_host_controller_interface */
+static inline __hc32 cpu_to_hc32(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, const u32 x)
 {
-	return uhci_big_endian_desc(uhci)
+	return universal_host_controller_interface_big_endian_desc(universal_host_controller_interface)
 		? (__force __hc32)cpu_to_be32(x)
 		: (__force __hc32)cpu_to_le32(x);
 }
 
-/* uhci to cpu */
-static inline u32 hc32_to_cpu(const struct uhci_hcd *uhci, const __hc32 x)
+/* universal_host_controller_interface to cpu */
+static inline u32 hc32_to_cpu(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, const __hc32 x)
 {
-	return uhci_big_endian_desc(uhci)
+	return universal_host_controller_interface_big_endian_desc(universal_host_controller_interface)
 		? be32_to_cpu((__force __be32)x)
 		: le32_to_cpu((__force __le32)x);
 }
 
 #else
-/* cpu to uhci */
-static inline __hc32 cpu_to_hc32(const struct uhci_hcd *uhci, const u32 x)
+/* cpu to universal_host_controller_interface */
+static inline __hc32 cpu_to_hc32(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, const u32 x)
 {
 	return cpu_to_le32(x);
 }
 
-/* uhci to cpu */
-static inline u32 hc32_to_cpu(const struct uhci_hcd *uhci, const __hc32 x)
+/* universal_host_controller_interface to cpu */
+static inline u32 hc32_to_cpu(const struct universal_host_controller_interface_hcd *universal_host_controller_interface, const __hc32 x)
 {
 	return le32_to_cpu(x);
 }
diff --git a/drivers/usb/host/uhci-hub.c b/drivers/usb/host/uhci-hub.c
index 6133ff275bdd..b00776154d42 100644
--- a/drivers/usb/host/uhci-hub.c
+++ b/drivers/usb/host/uhci-hub.c
@@ -27,7 +27,7 @@ static const __u8 root_hub_hub_des[] =
 	0xff			/*  __u8  PortPwrCtrlMask; *** 7 ports max */
 };
 
-#define	UHCI_RH_MAXCHILD	7
+#define	UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_MAXCHILD	7
 
 /* must write as zeroes */
 #define WZ_BITS		(UNIVERSAL_SERIAL_BUSPORTSC_RES2 | UNIVERSAL_SERIAL_BUSPORTSC_RES3 | UNIVERSAL_SERIAL_BUSPORTSC_RES4)
@@ -41,20 +41,20 @@ static const __u8 root_hub_hub_des[] =
 /* A port that either is connected or has a changed-bit set will prevent
  * us from AUTO_STOPPING.
  */
-static int any_ports_active(struct uhci_hcd *uhci)
+static int any_ports_active(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	int port;
 
-	for (port = 0; port < uhci->rh_numports; ++port) {
-		if ((uhci_readw(uhci, UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) &
+	for (port = 0; port < universal_host_controller_interface->rh_numports; ++port) {
+		if ((universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) &
 				(UNIVERSAL_SERIAL_BUSPORTSC_CCS | RWC_BITS)) ||
-				test_bit(port, &uhci->port_c_suspend))
+				test_bit(port, &universal_host_controller_interface->port_c_suspend))
 			return 1;
 	}
 	return 0;
 }
 
-static inline int get_hub_status_data(struct uhci_hcd *uhci, char *buf)
+static inline int get_hub_status_data(struct universal_host_controller_interface_hcd *universal_host_controller_interface, char *buf)
 {
 	int port;
 	int mask = RWC_BITS;
@@ -69,40 +69,40 @@ static inline int get_hub_status_data(struct uhci_hcd *uhci, char *buf)
 		mask &= ~UNIVERSAL_SERIAL_BUSPORTSC_OCC;
 
 	*buf = 0;
-	for (port = 0; port < uhci->rh_numports; ++port) {
-		if ((uhci_readw(uhci, UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) & mask) ||
-				test_bit(port, &uhci->port_c_suspend))
+	for (port = 0; port < universal_host_controller_interface->rh_numports; ++port) {
+		if ((universal_host_controller_interface_readw(universal_host_controller_interface, UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) & mask) ||
+				test_bit(port, &universal_host_controller_interface->port_c_suspend))
 			*buf |= (1 << (port + 1));
 	}
 	return !!*buf;
 }
 
 #define CLR_RH_PORTSTAT(x) \
-	status = uhci_readw(uhci, port_addr);	\
+	status = universal_host_controller_interface_readw(universal_host_controller_interface, port_addr);	\
 	status &= ~(RWC_BITS|WZ_BITS); \
 	status &= ~(x); \
 	status |= RWC_BITS & (x); \
-	uhci_writew(uhci, status, port_addr)
+	universal_host_controller_interface_writew(universal_host_controller_interface, status, port_addr)
 
 #define SET_RH_PORTSTAT(x) \
-	status = uhci_readw(uhci, port_addr);	\
+	status = universal_host_controller_interface_readw(universal_host_controller_interface, port_addr);	\
 	status |= (x); \
 	status &= ~(RWC_BITS|WZ_BITS); \
-	uhci_writew(uhci, status, port_addr)
+	universal_host_controller_interface_writew(universal_host_controller_interface, status, port_addr)
 
-/* UHCI controllers don't automatically stop resume signalling after 20 msec,
+/* UNIVERSAL_HOST_CONTROLLER_INTERFACE controllers don't automatically stop resume signalling after 20 msec,
  * so we have to poll and check timeouts in order to take care of it.
  */
-static void uhci_finish_suspend(struct uhci_hcd *uhci, int port,
+static void universal_host_controller_interface_finish_suspend(struct universal_host_controller_interface_hcd *universal_host_controller_interface, int port,
 		unsigned long port_addr)
 {
 	int status;
 	int i;
 
-	if (uhci_readw(uhci, port_addr) & SUSPEND_BITS) {
+	if (universal_host_controller_interface_readw(universal_host_controller_interface, port_addr) & SUSPEND_BITS) {
 		CLR_RH_PORTSTAT(SUSPEND_BITS);
-		if (test_bit(port, &uhci->resuming_ports))
-			set_bit(port, &uhci->port_c_suspend);
+		if (test_bit(port, &universal_host_controller_interface->resuming_ports))
+			set_bit(port, &universal_host_controller_interface->port_c_suspend);
 
 		/* The controller won't actually turn off the RD bit until
 		 * it has had a chance to send a low-speed EOP sequence,
@@ -110,48 +110,48 @@ static void uhci_finish_suspend(struct uhci_hcd *uhci, int port,
 		 * Experiments show that some controllers take longer, so
 		 * we'll poll for completion. */
 		for (i = 0; i < 10; ++i) {
-			if (!(uhci_readw(uhci, port_addr) & SUSPEND_BITS))
+			if (!(universal_host_controller_interface_readw(universal_host_controller_interface, port_addr) & SUSPEND_BITS))
 				break;
 			udelay(1);
 		}
 	}
-	clear_bit(port, &uhci->resuming_ports);
-	universal_serial_bus_hcd_end_port_resume(&uhci_to_hcd(uhci)->self, port);
+	clear_bit(port, &universal_host_controller_interface->resuming_ports);
+	universal_serial_bus_hcd_end_port_resume(&universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self, port);
 }
 
-/* Wait for the UHCI controller in HP's iLO2 server management chip.
+/* Wait for the UNIVERSAL_HOST_CONTROLLER_INTERFACE controller in HP's iLO2 server management chip.
  * It can take up to 250 us to finish a reset and set the CSC bit.
  */
-static void wait_for_HP(struct uhci_hcd *uhci, unsigned long port_addr)
+static void wait_for_HP(struct universal_host_controller_interface_hcd *universal_host_controller_interface, unsigned long port_addr)
 {
 	int i;
 
 	for (i = 10; i < 250; i += 10) {
-		if (uhci_readw(uhci, port_addr) & UNIVERSAL_SERIAL_BUSPORTSC_CSC)
+		if (universal_host_controller_interface_readw(universal_host_controller_interface, port_addr) & UNIVERSAL_SERIAL_BUSPORTSC_CSC)
 			return;
 		udelay(10);
 	}
 	/* Log a warning? */
 }
 
-static void uhci_check_ports(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_check_ports(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	unsigned int port;
 	unsigned long port_addr;
 	int status;
 
-	for (port = 0; port < uhci->rh_numports; ++port) {
+	for (port = 0; port < universal_host_controller_interface->rh_numports; ++port) {
 		port_addr = UNIVERSAL_SERIAL_BUSPORTSC1 + 2 * port;
-		status = uhci_readw(uhci, port_addr);
+		status = universal_host_controller_interface_readw(universal_host_controller_interface, port_addr);
 		if (unlikely(status & UNIVERSAL_SERIAL_BUSPORTSC_PR)) {
-			if (time_after_eq(jiffies, uhci->ports_timeout)) {
+			if (time_after_eq(jiffies, universal_host_controller_interface->ports_timeout)) {
 				CLR_RH_PORTSTAT(UNIVERSAL_SERIAL_BUSPORTSC_PR);
 				udelay(10);
 
 				/* HP's server management chip requires
 				 * a longer delay. */
-				if (uhci->wait_for_hp)
-					wait_for_HP(uhci, port_addr);
+				if (universal_host_controller_interface->wait_for_hp)
+					wait_for_HP(universal_host_controller_interface, port_addr);
 
 				/* If the port was enabled before, turning
 				 * reset on caused a port enable change.
@@ -162,72 +162,72 @@ static void uhci_check_ports(struct uhci_hcd *uhci)
 			}
 		}
 		if (unlikely(status & UNIVERSAL_SERIAL_BUSPORTSC_RD)) {
-			if (!test_bit(port, &uhci->resuming_ports)) {
+			if (!test_bit(port, &universal_host_controller_interface->resuming_ports)) {
 
 				/* Port received a wakeup request */
-				set_bit(port, &uhci->resuming_ports);
-				uhci->ports_timeout = jiffies +
+				set_bit(port, &universal_host_controller_interface->resuming_ports);
+				universal_host_controller_interface->ports_timeout = jiffies +
 					msecs_to_jiffies(UNIVERSAL_SERIAL_BUS_RESUME_TIMEOUT);
 				universal_serial_bus_hcd_start_port_resume(
-						&uhci_to_hcd(uhci)->self, port);
+						&universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self, port);
 
 				/* Make sure we see the port again
 				 * after the resuming period is over. */
-				mod_timer(&uhci_to_hcd(uhci)->rh_timer,
-						uhci->ports_timeout);
+				mod_timer(&universal_host_controller_interface_to_hcd(universal_host_controller_interface)->rh_timer,
+						universal_host_controller_interface->ports_timeout);
 			} else if (time_after_eq(jiffies,
-						uhci->ports_timeout)) {
-				uhci_finish_suspend(uhci, port, port_addr);
+						universal_host_controller_interface->ports_timeout)) {
+				universal_host_controller_interface_finish_suspend(universal_host_controller_interface, port, port_addr);
 			}
 		}
 	}
 }
 
-static int uhci_hub_status_data(struct universal_serial_bus_hcd *hcd, char *buf)
+static int universal_host_controller_interface_hub_status_data(struct universal_serial_bus_hcd *hcd, char *buf)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	unsigned long flags;
 	int status = 0;
 
-	spin_lock_irqsave(&uhci->lock, flags);
+	spin_lock_irqsave(&universal_host_controller_interface->lock, flags);
 
-	uhci_scan_schedule(uhci);
-	if (!HCD_HW_ACCESSIBLE(hcd) || uhci->dead)
+	universal_host_controller_interface_scan_schedule(universal_host_controller_interface);
+	if (!HCD_HW_ACCESSIBLE(hcd) || universal_host_controller_interface->dead)
 		goto done;
-	uhci_check_ports(uhci);
+	universal_host_controller_interface_check_ports(universal_host_controller_interface);
 
-	status = get_hub_status_data(uhci, buf);
+	status = get_hub_status_data(universal_host_controller_interface, buf);
 
-	switch (uhci->rh_state) {
-	    case UHCI_RH_SUSPENDED:
+	switch (universal_host_controller_interface->rh_state) {
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_SUSPENDED:
 		/* if port change, ask to be resumed */
-		if (status || uhci->resuming_ports) {
+		if (status || universal_host_controller_interface->resuming_ports) {
 			status = 1;
 			universal_serial_bus_hcd_resume_root_hub(hcd);
 		}
 		break;
 
-	    case UHCI_RH_AUTO_STOPPED:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_AUTO_STOPPED:
 		/* if port change, auto start */
 		if (status)
-			wakeup_rh(uhci);
+			wakeup_rh(universal_host_controller_interface);
 		break;
 
-	    case UHCI_RH_RUNNING:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING:
 		/* are any devices attached? */
-		if (!any_ports_active(uhci)) {
-			uhci->rh_state = UHCI_RH_RUNNING_NODEVS;
-			uhci->auto_stop_time = jiffies + HZ;
+		if (!any_ports_active(universal_host_controller_interface)) {
+			universal_host_controller_interface->rh_state = UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING_NODEVS;
+			universal_host_controller_interface->auto_stop_time = jiffies + HZ;
 		}
 		break;
 
-	    case UHCI_RH_RUNNING_NODEVS:
+	    case UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING_NODEVS:
 		/* auto-stop if nothing connected for 1 second */
-		if (any_ports_active(uhci))
-			uhci->rh_state = UHCI_RH_RUNNING;
-		else if (time_after_eq(jiffies, uhci->auto_stop_time) &&
-				!uhci->wait_for_hp)
-			suspend_rh(uhci, UHCI_RH_AUTO_STOPPED);
+		if (any_ports_active(universal_host_controller_interface))
+			universal_host_controller_interface->rh_state = UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RUNNING;
+		else if (time_after_eq(jiffies, universal_host_controller_interface->auto_stop_time) &&
+				!universal_host_controller_interface->wait_for_hp)
+			suspend_rh(universal_host_controller_interface, UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_AUTO_STOPPED);
 		break;
 
 	    default:
@@ -235,25 +235,25 @@ static int uhci_hub_status_data(struct universal_serial_bus_hcd *hcd, char *buf)
 	}
 
 done:
-	spin_unlock_irqrestore(&uhci->lock, flags);
+	spin_unlock_irqrestore(&universal_host_controller_interface->lock, flags);
 	return status;
 }
 
 /* size of returned buffer is part of UNIVERSAL_SERIAL_BUS spec */
-static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u16 wValue,
+static int universal_host_controller_interface_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u16 wValue,
 			u16 wIndex, char *buf, u16 wLength)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	int status, lstatus, retval = 0;
 	unsigned int port = wIndex - 1;
 	unsigned long port_addr = UNIVERSAL_SERIAL_BUSPORTSC1 + 2 * port;
 	u16 wPortChange, wPortStatus;
 	unsigned long flags;
 
-	if (!HCD_HW_ACCESSIBLE(hcd) || uhci->dead)
+	if (!HCD_HW_ACCESSIBLE(hcd) || universal_host_controller_interface->dead)
 		return -ETIMEDOUT;
 
-	spin_lock_irqsave(&uhci->lock, flags);
+	spin_lock_irqsave(&universal_host_controller_interface->lock, flags);
 	switch (typeReq) {
 
 	case GetHubStatus:
@@ -261,20 +261,20 @@ static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u
 		retval = 4; /* hub power */
 		break;
 	case GetPortStatus:
-		if (port >= uhci->rh_numports)
+		if (port >= universal_host_controller_interface->rh_numports)
 			goto err;
 
-		uhci_check_ports(uhci);
-		status = uhci_readw(uhci, port_addr);
+		universal_host_controller_interface_check_ports(universal_host_controller_interface);
+		status = universal_host_controller_interface_readw(universal_host_controller_interface, port_addr);
 
 		/* Intel controllers report the OverCurrent bit active on.
 		 * VIA controllers report it active off, so we'll adjust the
-		 * bit value.  (It's not standardized in the UHCI spec.)
+		 * bit value.  (It's not standardized in the UNIVERSAL_HOST_CONTROLLER_INTERFACE spec.)
 		 */
-		if (uhci->oc_low)
+		if (universal_host_controller_interface->oc_low)
 			status ^= UNIVERSAL_SERIAL_BUSPORTSC_OC;
 
-		/* UHCI doesn't support C_RESET (always false) */
+		/* UNIVERSAL_HOST_CONTROLLER_INTERFACE doesn't support C_RESET (always false) */
 		wPortChange = lstatus = 0;
 		if (status & UNIVERSAL_SERIAL_BUSPORTSC_CSC)
 			wPortChange |= UNIVERSAL_SERIAL_BUS_PORT_STAT_C_CONNECTION;
@@ -283,14 +283,14 @@ static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u
 		if ((status & UNIVERSAL_SERIAL_BUSPORTSC_OCC) && !ignore_oc)
 			wPortChange |= UNIVERSAL_SERIAL_BUS_PORT_STAT_C_OVERCURRENT;
 
-		if (test_bit(port, &uhci->port_c_suspend)) {
+		if (test_bit(port, &universal_host_controller_interface->port_c_suspend)) {
 			wPortChange |= UNIVERSAL_SERIAL_BUS_PORT_STAT_C_SUSPEND;
 			lstatus |= 1;
 		}
-		if (test_bit(port, &uhci->resuming_ports))
+		if (test_bit(port, &universal_host_controller_interface->resuming_ports))
 			lstatus |= 4;
 
-		/* UHCI has no power switching (always on) */
+		/* UNIVERSAL_HOST_CONTROLLER_INTERFACE has no power switching (always on) */
 		wPortStatus = UNIVERSAL_SERIAL_BUS_PORT_STAT_POWER;
 		if (status & UNIVERSAL_SERIAL_BUSPORTSC_CCS)
 			wPortStatus |= UNIVERSAL_SERIAL_BUS_PORT_STAT_CONNECTION;
@@ -307,7 +307,7 @@ static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u
 			wPortStatus |= UNIVERSAL_SERIAL_BUS_PORT_STAT_LOW_SPEED;
 
 		if (wPortChange)
-			dev_dbg(uhci_dev(uhci), "port %d portsc %04x,%02x\n",
+			dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "port %d portsc %04x,%02x\n",
 					wIndex, status, lstatus);
 
 		*(__le16 *)buf = cpu_to_le16(wPortStatus);
@@ -325,7 +325,7 @@ static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u
 		}
 		break;
 	case SetPortFeature:
-		if (port >= uhci->rh_numports)
+		if (port >= universal_host_controller_interface->rh_numports)
 			goto err;
 
 		switch (wValue) {
@@ -336,21 +336,21 @@ static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u
 			SET_RH_PORTSTAT(UNIVERSAL_SERIAL_BUSPORTSC_PR);
 
 			/* Reset terminates Resume signalling */
-			uhci_finish_suspend(uhci, port, port_addr);
+			universal_host_controller_interface_finish_suspend(universal_host_controller_interface, port, port_addr);
 
 			/* UNIVERSAL_SERIAL_BUS v2.0 7.1.7.5 */
-			uhci->ports_timeout = jiffies +
+			universal_host_controller_interface->ports_timeout = jiffies +
 				msecs_to_jiffies(UNIVERSAL_SERIAL_BUS_RESUME_TIMEOUT);
 			break;
 		case UNIVERSAL_SERIAL_BUS_PORT_FEAT_POWER:
-			/* UHCI has no power switching */
+			/* UNIVERSAL_HOST_CONTROLLER_INTERFACE has no power switching */
 			break;
 		default:
 			goto err;
 		}
 		break;
 	case ClearPortFeature:
-		if (port >= uhci->rh_numports)
+		if (port >= universal_host_controller_interface->rh_numports)
 			goto err;
 
 		switch (wValue) {
@@ -358,39 +358,39 @@ static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u
 			CLR_RH_PORTSTAT(UNIVERSAL_SERIAL_BUSPORTSC_PE);
 
 			/* Disable terminates Resume signalling */
-			uhci_finish_suspend(uhci, port, port_addr);
+			universal_host_controller_interface_finish_suspend(universal_host_controller_interface, port, port_addr);
 			break;
 		case UNIVERSAL_SERIAL_BUS_PORT_FEAT_C_ENABLE:
 			CLR_RH_PORTSTAT(UNIVERSAL_SERIAL_BUSPORTSC_PEC);
 			break;
 		case UNIVERSAL_SERIAL_BUS_PORT_FEAT_SUSPEND:
-			if (!(uhci_readw(uhci, port_addr) & UNIVERSAL_SERIAL_BUSPORTSC_SUSP)) {
+			if (!(universal_host_controller_interface_readw(universal_host_controller_interface, port_addr) & UNIVERSAL_SERIAL_BUSPORTSC_SUSP)) {
 
 				/* Make certain the port isn't suspended */
-				uhci_finish_suspend(uhci, port, port_addr);
+				universal_host_controller_interface_finish_suspend(universal_host_controller_interface, port, port_addr);
 			} else if (!test_and_set_bit(port,
-						&uhci->resuming_ports)) {
+						&universal_host_controller_interface->resuming_ports)) {
 				SET_RH_PORTSTAT(UNIVERSAL_SERIAL_BUSPORTSC_RD);
 
 				/* The controller won't allow RD to be set
 				 * if the port is disabled.  When this happens
 				 * just skip the Resume signalling.
 				 */
-				if (!(uhci_readw(uhci, port_addr) &
+				if (!(universal_host_controller_interface_readw(universal_host_controller_interface, port_addr) &
 						UNIVERSAL_SERIAL_BUSPORTSC_RD))
-					uhci_finish_suspend(uhci, port,
+					universal_host_controller_interface_finish_suspend(universal_host_controller_interface, port,
 							port_addr);
 				else
 					/* UNIVERSAL_SERIAL_BUS v2.0 7.1.7.7 */
-					uhci->ports_timeout = jiffies +
+					universal_host_controller_interface->ports_timeout = jiffies +
 						msecs_to_jiffies(20);
 			}
 			break;
 		case UNIVERSAL_SERIAL_BUS_PORT_FEAT_C_SUSPEND:
-			clear_bit(port, &uhci->port_c_suspend);
+			clear_bit(port, &universal_host_controller_interface->port_c_suspend);
 			break;
 		case UNIVERSAL_SERIAL_BUS_PORT_FEAT_POWER:
-			/* UHCI has no power switching */
+			/* UNIVERSAL_HOST_CONTROLLER_INTERFACE has no power switching */
 			goto err;
 		case UNIVERSAL_SERIAL_BUS_PORT_FEAT_C_CONNECTION:
 			CLR_RH_PORTSTAT(UNIVERSAL_SERIAL_BUSPORTSC_CSC);
@@ -409,13 +409,13 @@ static int uhci_hub_control(struct universal_serial_bus_hcd *hcd, u16 typeReq, u
 		retval = min_t(unsigned int, sizeof(root_hub_hub_des), wLength);
 		memcpy(buf, root_hub_hub_des, retval);
 		if (retval > 2)
-			buf[2] = uhci->rh_numports;
+			buf[2] = universal_host_controller_interface->rh_numports;
 		break;
 	default:
 err:
 		retval = -EPIPE;
 	}
-	spin_unlock_irqrestore(&uhci->lock, flags);
+	spin_unlock_irqrestore(&universal_host_controller_interface->lock, flags);
 
 	return retval;
 }
diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
index a58c49364cac..b6999a5abe04 100644
--- a/drivers/usb/host/uhci-pci.c
+++ b/drivers/usb/host/uhci-pci.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * UHCI HCD (Host Controller Driver) PCI Bus Glue.
+ * UNIVERSAL_HOST_CONTROLLER_INTERFACE HCD (Host Controller Driver) PCI Bus Glue.
  *
- * Extracted from uhci-hcd.c:
+ * Extracted from universal_host_controller_interface-hcd.c:
  * Maintainer: Alan Stern <stern@rowland.harvard.edu>
  *
  * (C) Copyright 1999 Linus Torvalds
@@ -24,9 +24,9 @@
  * Make sure the controller is completely inactive, unable to
  * generate interrupts or do DMA.
  */
-static void uhci_pci_reset_hc(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_pci_reset_hc(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	uhci_reset_hc(to_pci_dev(uhci_dev(uhci)), uhci->io_addr);
+	universal_host_controller_interface_reset_hc(to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface)), universal_host_controller_interface->io_addr);
 }
 
 /*
@@ -35,19 +35,19 @@ static void uhci_pci_reset_hc(struct uhci_hcd *uhci)
  *
  * Returns: 1 if the controller was reset, 0 otherwise.
  */
-static int uhci_pci_check_and_reset_hc(struct uhci_hcd *uhci)
+static int universal_host_controller_interface_pci_check_and_reset_hc(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	return uhci_check_and_reset_hc(to_pci_dev(uhci_dev(uhci)),
-				uhci->io_addr);
+	return universal_host_controller_interface_check_and_reset_hc(to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface)),
+				universal_host_controller_interface->io_addr);
 }
 
 /*
  * Store the basic register settings needed by the controller.
- * This function is called at the end of configure_hc in uhci-hcd.c.
+ * This function is called at the end of configure_hc in universal_host_controller_interface-hcd.c.
  */
-static void uhci_pci_configure_hc(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_pci_configure_hc(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	struct pci_dev *pdev = to_pci_dev(uhci_dev(uhci));
+	struct pci_dev *pdev = to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface));
 
 	/* Enable PIRQ */
 	pci_write_config_word(pdev, UNIVERSAL_SERIAL_BUSLEGSUP, UNIVERSAL_SERIAL_BUSLEGSUP_DEFAULT);
@@ -57,11 +57,11 @@ static void uhci_pci_configure_hc(struct uhci_hcd *uhci)
 		pci_write_config_byte(pdev, UNIVERSAL_SERIAL_BUSRES_INTEL, 0);
 }
 
-static int uhci_pci_resume_detect_interrupts_are_broken(struct uhci_hcd *uhci)
+static int universal_host_controller_interface_pci_resume_detect_interrupts_are_broken(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	int port;
 
-	switch (to_pci_dev(uhci_dev(uhci))->vendor) {
+	switch (to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface))->vendor) {
 	default:
 		break;
 
@@ -79,8 +79,8 @@ static int uhci_pci_resume_detect_interrupts_are_broken(struct uhci_hcd *uhci)
 		 * To prevent problems, we will not enable resume-detect
 		 * interrupts if any ports are OC.
 		 */
-		for (port = 0; port < uhci->rh_numports; ++port) {
-			if (inw(uhci->io_addr + UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) &
+		for (port = 0; port < universal_host_controller_interface->rh_numports; ++port) {
+			if (inw(universal_host_controller_interface->io_addr + UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) &
 					UNIVERSAL_SERIAL_BUSPORTSC_OC)
 				return 1;
 		}
@@ -89,7 +89,7 @@ static int uhci_pci_resume_detect_interrupts_are_broken(struct uhci_hcd *uhci)
 	return 0;
 }
 
-static int uhci_pci_global_suspend_mode_is_broken(struct uhci_hcd *uhci)
+static int universal_host_controller_interface_pci_global_suspend_mode_is_broken(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	int port;
 	const char *sys_info;
@@ -101,8 +101,8 @@ static int uhci_pci_global_suspend_mode_is_broken(struct uhci_hcd *uhci)
 	 */
 	sys_info = dmi_get_system_info(DMI_BOARD_NAME);
 	if (sys_info && !strcmp(sys_info, bad_Asus_board)) {
-		for (port = 0; port < uhci->rh_numports; ++port) {
-			if (inw(uhci->io_addr + UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) &
+		for (port = 0; port < universal_host_controller_interface->rh_numports; ++port) {
+			if (inw(universal_host_controller_interface->io_addr + UNIVERSAL_SERIAL_BUSPORTSC1 + port * 2) &
 					UNIVERSAL_SERIAL_BUSPORTSC_CCS)
 				return 1;
 		}
@@ -111,43 +111,43 @@ static int uhci_pci_global_suspend_mode_is_broken(struct uhci_hcd *uhci)
 	return 0;
 }
 
-static int uhci_pci_init(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_pci_init(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
-	uhci->io_addr = (unsigned long) hcd->rsrc_start;
+	universal_host_controller_interface->io_addr = (unsigned long) hcd->rsrc_start;
 
-	uhci->rh_numports = uhci_count_ports(hcd);
+	universal_host_controller_interface->rh_numports = universal_host_controller_interface_count_ports(hcd);
 
 	/* Intel controllers report the OverCurrent bit active on.
 	 * VIA controllers report it active off, so we'll adjust the
-	 * bit value.  (It's not standardized in the UHCI spec.)
+	 * bit value.  (It's not standardized in the UNIVERSAL_HOST_CONTROLLER_INTERFACE spec.)
 	 */
-	if (to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_VIA)
-		uhci->oc_low = 1;
+	if (to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface))->vendor == PCI_VENDOR_ID_VIA)
+		universal_host_controller_interface->oc_low = 1;
 
 	/* HP's server management chip requires a longer port reset delay. */
-	if (to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_HP)
-		uhci->wait_for_hp = 1;
+	if (to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface))->vendor == PCI_VENDOR_ID_HP)
+		universal_host_controller_interface->wait_for_hp = 1;
 
 	/* Intel controllers use non-PME wakeup signalling */
-	if (to_pci_dev(uhci_dev(uhci))->vendor == PCI_VENDOR_ID_INTEL)
-		device_set_wakeup_capable(uhci_dev(uhci), true);
+	if (to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface))->vendor == PCI_VENDOR_ID_INTEL)
+		device_set_wakeup_capable(universal_host_controller_interface_dev(universal_host_controller_interface), true);
 
 	/* Set up pointers to PCI-specific functions */
-	uhci->reset_hc = uhci_pci_reset_hc;
-	uhci->check_and_reset_hc = uhci_pci_check_and_reset_hc;
-	uhci->configure_hc = uhci_pci_configure_hc;
-	uhci->resume_detect_interrupts_are_broken =
-		uhci_pci_resume_detect_interrupts_are_broken;
-	uhci->global_suspend_mode_is_broken =
-		uhci_pci_global_suspend_mode_is_broken;
+	universal_host_controller_interface->reset_hc = universal_host_controller_interface_pci_reset_hc;
+	universal_host_controller_interface->check_and_reset_hc = universal_host_controller_interface_pci_check_and_reset_hc;
+	universal_host_controller_interface->configure_hc = universal_host_controller_interface_pci_configure_hc;
+	universal_host_controller_interface->resume_detect_interrupts_are_broken =
+		universal_host_controller_interface_pci_resume_detect_interrupts_are_broken;
+	universal_host_controller_interface->global_suspend_mode_is_broken =
+		universal_host_controller_interface_pci_global_suspend_mode_is_broken;
 
 
 	/* Kick BIOS off this hardware and reset if the controller
 	 * isn't already safely quiescent.
 	 */
-	check_and_reset_hc(uhci);
+	check_and_reset_hc(universal_host_controller_interface);
 	return 0;
 }
 
@@ -158,27 +158,27 @@ static int uhci_pci_init(struct universal_serial_bus_hcd *hcd)
  * This routine may be called in a damaged or failing kernel.  Hence we
  * do not acquire the spinlock before shutting down the controller.
  */
-static void uhci_shutdown(struct pci_dev *pdev)
+static void universal_host_controller_interface_shutdown(struct pci_dev *pdev)
 {
 	struct universal_serial_bus_hcd *hcd = pci_get_drvdata(pdev);
 
-	uhci_hc_died(hcd_to_uhci(hcd));
+	universal_host_controller_interface_hc_died(hcd_to_universal_host_controller_interface(hcd));
 }
 
 #ifdef CONFIG_PM
 
-static int uhci_pci_resume(struct universal_serial_bus_hcd *hcd, bool hibernated);
+static int universal_host_controller_interface_pci_resume(struct universal_serial_bus_hcd *hcd, bool hibernated);
 
-static int uhci_pci_suspend(struct universal_serial_bus_hcd *hcd, bool do_wakeup)
+static int universal_host_controller_interface_pci_suspend(struct universal_serial_bus_hcd *hcd, bool do_wakeup)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
-	struct pci_dev *pdev = to_pci_dev(uhci_dev(uhci));
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
+	struct pci_dev *pdev = to_pci_dev(universal_host_controller_interface_dev(universal_host_controller_interface));
 	int rc = 0;
 
-	dev_dbg(uhci_dev(uhci), "%s\n", __func__);
+	dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "%s\n", __func__);
 
-	spin_lock_irq(&uhci->lock);
-	if (!HCD_HW_ACCESSIBLE(hcd) || uhci->dead)
+	spin_lock_irq(&universal_host_controller_interface->lock);
+	if (!HCD_HW_ACCESSIBLE(hcd) || universal_host_controller_interface->dead)
 		goto done_okay;		/* Already suspended or dead */
 
 	/* All PCI host controllers are required to disable IRQ generation
@@ -196,55 +196,55 @@ static int uhci_pci_suspend(struct universal_serial_bus_hcd *hcd, bool do_wakeup
 
 done_okay:
 	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	spin_unlock_irq(&uhci->lock);
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 
 	synchronize_irq(hcd->irq);
 
 	/* Check for race with a wakeup request */
 	if (do_wakeup && HCD_WAKEUP_PENDING(hcd)) {
-		uhci_pci_resume(hcd, false);
+		universal_host_controller_interface_pci_resume(hcd, false);
 		rc = -EBUSY;
 	}
 	return rc;
 }
 
-static int uhci_pci_resume(struct universal_serial_bus_hcd *hcd, bool hibernated)
+static int universal_host_controller_interface_pci_resume(struct universal_serial_bus_hcd *hcd, bool hibernated)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
-	dev_dbg(uhci_dev(uhci), "%s\n", __func__);
+	dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "%s\n", __func__);
 
 	/* Since we aren't in D3 any more, it's safe to set this flag
 	 * even if the controller was dead.
 	 */
 	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
 
-	spin_lock_irq(&uhci->lock);
+	spin_lock_irq(&universal_host_controller_interface->lock);
 
 	/* Make sure resume from hibernation re-enumerates everything */
 	if (hibernated) {
-		uhci->reset_hc(uhci);
-		finish_reset(uhci);
+		universal_host_controller_interface->reset_hc(universal_host_controller_interface);
+		finish_reset(universal_host_controller_interface);
 	}
 
 	/* The firmware may have changed the controller settings during
 	 * a system wakeup.  Check it and reconfigure to avoid problems.
 	 */
 	else {
-		check_and_reset_hc(uhci);
+		check_and_reset_hc(universal_host_controller_interface);
 	}
-	configure_hc(uhci);
+	configure_hc(universal_host_controller_interface);
 
 	/* Tell the core if the controller had to be reset */
-	if (uhci->rh_state == UHCI_RH_RESET)
+	if (universal_host_controller_interface->rh_state == UNIVERSAL_HOST_CONTROLLER_INTERFACE_RH_RESET)
 		universal_serial_bus_root_hub_lost_power(hcd->self.root_hub);
 
-	spin_unlock_irq(&uhci->lock);
+	spin_unlock_irq(&universal_host_controller_interface->lock);
 
 	/* If interrupts don't work and remote wakeup is enabled then
 	 * the suspended root hub needs to be polled.
 	 */
-	if (!uhci->RD_enable && hcd->self.root_hub->do_remote_wakeup)
+	if (!universal_host_controller_interface->RD_enable && hcd->self.root_hub->do_remote_wakeup)
 		set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
 
 	/* Does the root hub have a port wakeup pending? */
@@ -254,52 +254,52 @@ static int uhci_pci_resume(struct universal_serial_bus_hcd *hcd, bool hibernated
 
 #endif
 
-static const struct hc_driver uhci_driver = {
+static const struct hc_driver universal_host_controller_interface_driver = {
 	.description =		hcd_name,
-	.product_desc =		"UHCI Host Controller",
-	.hcd_priv_size =	sizeof(struct uhci_hcd),
+	.product_desc =		"UNIVERSAL_HOST_CONTROLLER_INTERFACE Host Controller",
+	.hcd_priv_size =	sizeof(struct universal_host_controller_interface_hcd),
 
 	/* Generic hardware linkage */
-	.irq =			uhci_irq,
+	.irq =			universal_host_controller_interface_irq,
 	.flags =		HCD_DMA | HCD_UNIVERSAL_SERIAL_BUS11,
 
 	/* Basic lifecycle operations */
-	.reset =		uhci_pci_init,
-	.start =		uhci_start,
+	.reset =		universal_host_controller_interface_pci_init,
+	.start =		universal_host_controller_interface_start,
 #ifdef CONFIG_PM
-	.pci_suspend =		uhci_pci_suspend,
-	.pci_resume =		uhci_pci_resume,
-	.bus_suspend =		uhci_rh_suspend,
-	.bus_resume =		uhci_rh_resume,
+	.pci_suspend =		universal_host_controller_interface_pci_suspend,
+	.pci_resume =		universal_host_controller_interface_pci_resume,
+	.bus_suspend =		universal_host_controller_interface_rh_suspend,
+	.bus_resume =		universal_host_controller_interface_rh_resume,
 #endif
-	.stop =			uhci_stop,
+	.stop =			universal_host_controller_interface_stop,
 
-	.urb_enqueue =		uhci_urb_enqueue,
-	.urb_dequeue =		uhci_urb_dequeue,
+	.urb_enqueue =		universal_host_controller_interface_urb_enqueue,
+	.urb_dequeue =		universal_host_controller_interface_urb_dequeue,
 
-	.endpoint_disable =	uhci_hcd_endpoint_disable,
-	.get_frame_number =	uhci_hcd_get_frame_number,
+	.endpoint_disable =	universal_host_controller_interface_hcd_endpoint_disable,
+	.get_frame_number =	universal_host_controller_interface_hcd_get_frame_number,
 
-	.hub_status_data =	uhci_hub_status_data,
-	.hub_control =		uhci_hub_control,
+	.hub_status_data =	universal_host_controller_interface_hub_status_data,
+	.hub_control =		universal_host_controller_interface_hub_control,
 };
 
-static const struct pci_device_id uhci_pci_ids[] = { {
-	/* handle any UNIVERSAL_SERIAL_BUS UHCI controller */
-	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UHCI, ~0),
-	.driver_data =	(unsigned long) &uhci_driver,
+static const struct pci_device_id universal_host_controller_interface_pci_ids[] = { {
+	/* handle any UNIVERSAL_SERIAL_BUS UNIVERSAL_HOST_CONTROLLER_INTERFACE controller */
+	PCI_DEVICE_CLASS(PCI_CLASS_SERIAL_UNIVERSAL_SERIAL_BUS_UNIVERSAL_HOST_CONTROLLER_INTERFACE, ~0),
+	.driver_data =	(unsigned long) &universal_host_controller_interface_driver,
 	}, { /* end: all zeroes */ }
 };
 
-MODULE_DEVICE_TABLE(pci, uhci_pci_ids);
+MODULE_DEVICE_TABLE(pci, universal_host_controller_interface_pci_ids);
 
-static struct pci_driver uhci_pci_driver = {
+static struct pci_driver universal_host_controller_interface_pci_driver = {
 	.name =		(char *)hcd_name,
-	.id_table =	uhci_pci_ids,
+	.id_table =	universal_host_controller_interface_pci_ids,
 
 	.probe =	universal_serial_bus_hcd_pci_probe,
 	.remove =	universal_serial_bus_hcd_pci_remove,
-	.shutdown =	uhci_shutdown,
+	.shutdown =	universal_host_controller_interface_shutdown,
 
 #ifdef CONFIG_PM
 	.driver =	{
diff --git a/drivers/usb/host/uhci-platform.c b/drivers/usb/host/uhci-platform.c
index 22b6bdd59f0b..95eb1234dbf1 100644
--- a/drivers/usb/host/uhci-platform.c
+++ b/drivers/usb/host/uhci-platform.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Generic UHCI HCD (Host Controller Driver) for Platform Devices
+ * Generic UNIVERSAL_HOST_CONTROLLER_INTERFACE HCD (Host Controller Driver) for Platform Devices
  *
  * Copyright (c) 2011 Tony Prisk <linux@prisktech.co.nz>
  *
- * This file is based on uhci-grlib.c
+ * This file is based on universal_host_controller_interface-grlib.c
  * (C) Copyright 2004-2007 Alan Stern, stern@rowland.harvard.edu
  */
 
@@ -12,63 +12,63 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 
-static int uhci_platform_init(struct universal_serial_bus_hcd *hcd)
+static int universal_host_controller_interface_platform_init(struct universal_serial_bus_hcd *hcd)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
 	/* Probe number of ports if not already provided by DT */
-	if (!uhci->rh_numports)
-		uhci->rh_numports = uhci_count_ports(hcd);
+	if (!universal_host_controller_interface->rh_numports)
+		universal_host_controller_interface->rh_numports = universal_host_controller_interface_count_ports(hcd);
 
 	/* Set up pointers to to generic functions */
-	uhci->reset_hc = uhci_generic_reset_hc;
-	uhci->check_and_reset_hc = uhci_generic_check_and_reset_hc;
+	universal_host_controller_interface->reset_hc = universal_host_controller_interface_generic_reset_hc;
+	universal_host_controller_interface->check_and_reset_hc = universal_host_controller_interface_generic_check_and_reset_hc;
 
 	/* No special actions need to be taken for the functions below */
-	uhci->configure_hc = NULL;
-	uhci->resume_detect_interrupts_are_broken = NULL;
-	uhci->global_suspend_mode_is_broken = NULL;
+	universal_host_controller_interface->configure_hc = NULL;
+	universal_host_controller_interface->resume_detect_interrupts_are_broken = NULL;
+	universal_host_controller_interface->global_suspend_mode_is_broken = NULL;
 
 	/* Reset if the controller isn't already safely quiescent. */
-	check_and_reset_hc(uhci);
+	check_and_reset_hc(universal_host_controller_interface);
 	return 0;
 }
 
-static const struct hc_driver uhci_platform_hc_driver = {
+static const struct hc_driver universal_host_controller_interface_platform_hc_driver = {
 	.description =		hcd_name,
-	.product_desc =		"Generic UHCI Host Controller",
-	.hcd_priv_size =	sizeof(struct uhci_hcd),
+	.product_desc =		"Generic UNIVERSAL_HOST_CONTROLLER_INTERFACE Host Controller",
+	.hcd_priv_size =	sizeof(struct universal_host_controller_interface_hcd),
 
 	/* Generic hardware linkage */
-	.irq =			uhci_irq,
+	.irq =			universal_host_controller_interface_irq,
 	.flags =		HCD_MEMORY | HCD_DMA | HCD_UNIVERSAL_SERIAL_BUS11,
 
 	/* Basic lifecycle operations */
-	.reset =		uhci_platform_init,
-	.start =		uhci_start,
+	.reset =		universal_host_controller_interface_platform_init,
+	.start =		universal_host_controller_interface_start,
 #ifdef CONFIG_PM
 	.pci_suspend =		NULL,
 	.pci_resume =		NULL,
-	.bus_suspend =		uhci_rh_suspend,
-	.bus_resume =		uhci_rh_resume,
+	.bus_suspend =		universal_host_controller_interface_rh_suspend,
+	.bus_resume =		universal_host_controller_interface_rh_resume,
 #endif
-	.stop =			uhci_stop,
+	.stop =			universal_host_controller_interface_stop,
 
-	.urb_enqueue =		uhci_urb_enqueue,
-	.urb_dequeue =		uhci_urb_dequeue,
+	.urb_enqueue =		universal_host_controller_interface_urb_enqueue,
+	.urb_dequeue =		universal_host_controller_interface_urb_dequeue,
 
-	.endpoint_disable =	uhci_hcd_endpoint_disable,
-	.get_frame_number =	uhci_hcd_get_frame_number,
+	.endpoint_disable =	universal_host_controller_interface_hcd_endpoint_disable,
+	.get_frame_number =	universal_host_controller_interface_hcd_get_frame_number,
 
-	.hub_status_data =	uhci_hub_status_data,
-	.hub_control =		uhci_hub_control,
+	.hub_status_data =	universal_host_controller_interface_hub_status_data,
+	.hub_control =		universal_host_controller_interface_hub_control,
 };
 
-static int uhci_hcd_platform_probe(struct platform_device *pdev)
+static int universal_host_controller_interface_hcd_platform_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct universal_serial_bus_hcd *hcd;
-	struct uhci_hcd	*uhci;
+	struct universal_host_controller_interface_hcd	*universal_host_controller_interface;
 	struct resource *res;
 	int ret;
 
@@ -84,12 +84,12 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	hcd = universal_serial_bus_create_hcd(&uhci_platform_hc_driver, &pdev->dev,
+	hcd = universal_serial_bus_create_hcd(&universal_host_controller_interface_platform_hc_driver, &pdev->dev,
 			pdev->name);
 	if (!hcd)
 		return -ENOMEM;
 
-	uhci = hcd_to_uhci(hcd);
+	universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
@@ -100,33 +100,33 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
 
-	uhci->regs = hcd->regs;
+	universal_host_controller_interface->regs = hcd->regs;
 
 	/* Grab some things from the device-tree */
 	if (np) {
 		u32 num_ports;
 
 		if (of_property_read_u32(np, "#ports", &num_ports) == 0) {
-			uhci->rh_numports = num_ports;
+			universal_host_controller_interface->rh_numports = num_ports;
 			dev_info(&pdev->dev,
 				"Detected %d ports from device-tree\n",
 				num_ports);
 		}
-		if (of_device_is_compatible(np, "aspeed,ast2400-uhci") ||
-		    of_device_is_compatible(np, "aspeed,ast2500-uhci")) {
-			uhci->is_aspeed = 1;
+		if (of_device_is_compatible(np, "aspeed,ast2400-universal_host_controller_interface") ||
+		    of_device_is_compatible(np, "aspeed,ast2500-universal_host_controller_interface")) {
+			universal_host_controller_interface->is_aspeed = 1;
 			dev_info(&pdev->dev,
 				 "Enabled Aspeed implementation workarounds\n");
 		}
 	}
 
 	/* Get and enable clock if any specified */
-	uhci->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(uhci->clk)) {
-		ret = PTR_ERR(uhci->clk);
+	universal_host_controller_interface->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(universal_host_controller_interface->clk)) {
+		ret = PTR_ERR(universal_host_controller_interface->clk);
 		goto err_rmr;
 	}
-	ret = clk_prepare_enable(uhci->clk);
+	ret = clk_prepare_enable(universal_host_controller_interface->clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Error couldn't enable clock (%d)\n", ret);
 		goto err_rmr;
@@ -140,19 +140,19 @@ static int uhci_hcd_platform_probe(struct platform_device *pdev)
 	return 0;
 
 err_clk:
-	clk_disable_unprepare(uhci->clk);
+	clk_disable_unprepare(universal_host_controller_interface->clk);
 err_rmr:
 	universal_serial_bus_put_hcd(hcd);
 
 	return ret;
 }
 
-static int uhci_hcd_platform_remove(struct platform_device *pdev)
+static int universal_host_controller_interface_hcd_platform_remove(struct platform_device *pdev)
 {
 	struct universal_serial_bus_hcd *hcd = platform_get_drvdata(pdev);
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 
-	clk_disable_unprepare(uhci->clk);
+	clk_disable_unprepare(universal_host_controller_interface->clk);
 	universal_serial_bus_remove_hcd(hcd);
 	universal_serial_bus_put_hcd(hcd);
 
@@ -166,26 +166,26 @@ static int uhci_hcd_platform_remove(struct platform_device *pdev)
  * This routine may be called in a damaged or failing kernel.  Hence we
  * do not acquire the spinlock before shutting down the controller.
  */
-static void uhci_hcd_platform_shutdown(struct platform_device *op)
+static void universal_host_controller_interface_hcd_platform_shutdown(struct platform_device *op)
 {
 	struct universal_serial_bus_hcd *hcd = platform_get_drvdata(op);
 
-	uhci_hc_died(hcd_to_uhci(hcd));
+	universal_host_controller_interface_hc_died(hcd_to_universal_host_controller_interface(hcd));
 }
 
-static const struct of_device_id platform_uhci_ids[] = {
-	{ .compatible = "generic-uhci", },
-	{ .compatible = "platform-uhci", },
+static const struct of_device_id platform_universal_host_controller_interface_ids[] = {
+	{ .compatible = "generic-universal_host_controller_interface", },
+	{ .compatible = "platform-universal_host_controller_interface", },
 	{}
 };
-MODULE_DEVICE_TABLE(of, platform_uhci_ids);
+MODULE_DEVICE_TABLE(of, platform_universal_host_controller_interface_ids);
 
-static struct platform_driver uhci_platform_driver = {
-	.probe		= uhci_hcd_platform_probe,
-	.remove		= uhci_hcd_platform_remove,
-	.shutdown	= uhci_hcd_platform_shutdown,
+static struct platform_driver universal_host_controller_interface_platform_driver = {
+	.probe		= universal_host_controller_interface_hcd_platform_probe,
+	.remove		= universal_host_controller_interface_hcd_platform_remove,
+	.shutdown	= universal_host_controller_interface_hcd_platform_shutdown,
 	.driver = {
-		.name = "platform-uhci",
-		.of_match_table = platform_uhci_ids,
+		.name = "platform-universal_host_controller_interface",
+		.of_match_table = platform_universal_host_controller_interface_ids,
 	},
 };
diff --git a/drivers/usb/host/uhci-q.c b/drivers/usb/host/uhci-q.c
index 48ea2668a480..50711b544503 100644
--- a/drivers/usb/host/uhci-q.c
+++ b/drivers/usb/host/uhci-q.c
@@ -26,16 +26,16 @@
  * games with the FSBR code to make sure we get the correct order in all
  * the cases. I don't think it's worth the effort
  */
-static void uhci_set_next_interrupt(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_set_next_interrupt(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	if (uhci->is_stopped)
-		mod_timer(&uhci_to_hcd(uhci)->rh_timer, jiffies);
-	uhci->term_td->status |= cpu_to_hc32(uhci, TD_CTRL_IOC);
+	if (universal_host_controller_interface->is_stopped)
+		mod_timer(&universal_host_controller_interface_to_hcd(universal_host_controller_interface)->rh_timer, jiffies);
+	universal_host_controller_interface->term_td->status |= cpu_to_hc32(universal_host_controller_interface, TD_CTRL_IOC);
 }
 
-static inline void uhci_clear_next_interrupt(struct uhci_hcd *uhci)
+static inline void universal_host_controller_interface_clear_next_interrupt(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	uhci->term_td->status &= ~cpu_to_hc32(uhci, TD_CTRL_IOC);
+	universal_host_controller_interface->term_td->status &= ~cpu_to_hc32(universal_host_controller_interface, TD_CTRL_IOC);
 }
 
 
@@ -44,71 +44,71 @@ static inline void uhci_clear_next_interrupt(struct uhci_hcd *uhci)
  * We turn on FSBR whenever a queue that wants it is advancing,
  * and leave it on for a short time thereafter.
  */
-static void uhci_fsbr_on(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_fsbr_on(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	struct uhci_qh *lqh;
+	struct universal_host_controller_interface_qh *lqh;
 
 	/* The terminating skeleton QH always points back to the first
 	 * FSBR QH.  Make the last async QH point to the terminating
 	 * skeleton QH. */
-	uhci->fsbr_is_on = 1;
-	lqh = list_entry(uhci->skel_async_qh->node.prev,
-			struct uhci_qh, node);
-	lqh->link = LINK_TO_QH(uhci, uhci->skel_term_qh);
+	universal_host_controller_interface->fsbr_is_on = 1;
+	lqh = list_entry(universal_host_controller_interface->skel_async_qh->node.prev,
+			struct universal_host_controller_interface_qh, node);
+	lqh->link = LINK_TO_QH(universal_host_controller_interface, universal_host_controller_interface->skel_term_qh);
 }
 
-static void uhci_fsbr_off(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_fsbr_off(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
-	struct uhci_qh *lqh;
+	struct universal_host_controller_interface_qh *lqh;
 
 	/* Remove the link from the last async QH to the terminating
 	 * skeleton QH. */
-	uhci->fsbr_is_on = 0;
-	lqh = list_entry(uhci->skel_async_qh->node.prev,
-			struct uhci_qh, node);
-	lqh->link = UHCI_PTR_TERM(uhci);
+	universal_host_controller_interface->fsbr_is_on = 0;
+	lqh = list_entry(universal_host_controller_interface->skel_async_qh->node.prev,
+			struct universal_host_controller_interface_qh, node);
+	lqh->link = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
 }
 
-static void uhci_add_fsbr(struct uhci_hcd *uhci, struct urb *urb)
+static void universal_host_controller_interface_add_fsbr(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb)
 {
 	struct urb_priv *urbp = urb->hcpriv;
 
 	urbp->fsbr = 1;
 }
 
-static void uhci_urbp_wants_fsbr(struct uhci_hcd *uhci, struct urb_priv *urbp)
+static void universal_host_controller_interface_urbp_wants_fsbr(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb_priv *urbp)
 {
 	if (urbp->fsbr) {
-		uhci->fsbr_is_wanted = 1;
-		if (!uhci->fsbr_is_on)
-			uhci_fsbr_on(uhci);
-		else if (uhci->fsbr_expiring) {
-			uhci->fsbr_expiring = 0;
-			del_timer(&uhci->fsbr_timer);
+		universal_host_controller_interface->fsbr_is_wanted = 1;
+		if (!universal_host_controller_interface->fsbr_is_on)
+			universal_host_controller_interface_fsbr_on(universal_host_controller_interface);
+		else if (universal_host_controller_interface->fsbr_expiring) {
+			universal_host_controller_interface->fsbr_expiring = 0;
+			del_timer(&universal_host_controller_interface->fsbr_timer);
 		}
 	}
 }
 
-static void uhci_fsbr_timeout(struct timer_list *t)
+static void universal_host_controller_interface_fsbr_timeout(struct timer_list *t)
 {
-	struct uhci_hcd *uhci = from_timer(uhci, t, fsbr_timer);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = from_timer(universal_host_controller_interface, t, fsbr_timer);
 	unsigned long flags;
 
-	spin_lock_irqsave(&uhci->lock, flags);
-	if (uhci->fsbr_expiring) {
-		uhci->fsbr_expiring = 0;
-		uhci_fsbr_off(uhci);
+	spin_lock_irqsave(&universal_host_controller_interface->lock, flags);
+	if (universal_host_controller_interface->fsbr_expiring) {
+		universal_host_controller_interface->fsbr_expiring = 0;
+		universal_host_controller_interface_fsbr_off(universal_host_controller_interface);
 	}
-	spin_unlock_irqrestore(&uhci->lock, flags);
+	spin_unlock_irqrestore(&universal_host_controller_interface->lock, flags);
 }
 
 
-static struct uhci_td *uhci_alloc_td(struct uhci_hcd *uhci)
+static struct universal_host_controller_interface_td *universal_host_controller_interface_alloc_td(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	dma_addr_t dma_handle;
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 
-	td = dma_pool_alloc(uhci->td_pool, GFP_ATOMIC, &dma_handle);
+	td = dma_pool_alloc(universal_host_controller_interface->td_pool, GFP_ATOMIC, &dma_handle);
 	if (!td)
 		return NULL;
 
@@ -121,30 +121,30 @@ static struct uhci_td *uhci_alloc_td(struct uhci_hcd *uhci)
 	return td;
 }
 
-static void uhci_free_td(struct uhci_hcd *uhci, struct uhci_td *td)
+static void universal_host_controller_interface_free_td(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_td *td)
 {
 	if (!list_empty(&td->list))
-		dev_WARN(uhci_dev(uhci), "td %p still in list!\n", td);
+		dev_WARN(universal_host_controller_interface_dev(universal_host_controller_interface), "td %p still in list!\n", td);
 	if (!list_empty(&td->fl_list))
-		dev_WARN(uhci_dev(uhci), "td %p still in fl_list!\n", td);
+		dev_WARN(universal_host_controller_interface_dev(universal_host_controller_interface), "td %p still in fl_list!\n", td);
 
-	dma_pool_free(uhci->td_pool, td, td->dma_handle);
+	dma_pool_free(universal_host_controller_interface->td_pool, td, td->dma_handle);
 }
 
-static inline void uhci_fill_td(struct uhci_hcd *uhci, struct uhci_td *td,
+static inline void universal_host_controller_interface_fill_td(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_td *td,
 		u32 status, u32 token, u32 buffer)
 {
-	td->status = cpu_to_hc32(uhci, status);
-	td->token = cpu_to_hc32(uhci, token);
-	td->buffer = cpu_to_hc32(uhci, buffer);
+	td->status = cpu_to_hc32(universal_host_controller_interface, status);
+	td->token = cpu_to_hc32(universal_host_controller_interface, token);
+	td->buffer = cpu_to_hc32(universal_host_controller_interface, buffer);
 }
 
-static void uhci_add_td_to_urbp(struct uhci_td *td, struct urb_priv *urbp)
+static void universal_host_controller_interface_add_td_to_urbp(struct universal_host_controller_interface_td *td, struct urb_priv *urbp)
 {
 	list_add_tail(&td->list, &urbp->td_list);
 }
 
-static void uhci_remove_td_from_urbp(struct uhci_td *td)
+static void universal_host_controller_interface_remove_td_from_urbp(struct universal_host_controller_interface_td *td)
 {
 	list_del_init(&td->list);
 }
@@ -152,35 +152,35 @@ static void uhci_remove_td_from_urbp(struct uhci_td *td)
 /*
  * We insert Isochronous URBs directly into the frame list at the beginning
  */
-static inline void uhci_insert_td_in_frame_list(struct uhci_hcd *uhci,
-		struct uhci_td *td, unsigned framenum)
+static inline void universal_host_controller_interface_insert_td_in_frame_list(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
+		struct universal_host_controller_interface_td *td, unsigned framenum)
 {
-	framenum &= (UHCI_NUMFRAMES - 1);
+	framenum &= (UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES - 1);
 
 	td->frame = framenum;
 
 	/* Is there a TD already mapped there? */
-	if (uhci->frame_cpu[framenum]) {
-		struct uhci_td *ftd, *ltd;
+	if (universal_host_controller_interface->frame_cpu[framenum]) {
+		struct universal_host_controller_interface_td *ftd, *ltd;
 
-		ftd = uhci->frame_cpu[framenum];
-		ltd = list_entry(ftd->fl_list.prev, struct uhci_td, fl_list);
+		ftd = universal_host_controller_interface->frame_cpu[framenum];
+		ltd = list_entry(ftd->fl_list.prev, struct universal_host_controller_interface_td, fl_list);
 
 		list_add_tail(&td->fl_list, &ftd->fl_list);
 
 		td->link = ltd->link;
 		wmb();
-		ltd->link = LINK_TO_TD(uhci, td);
+		ltd->link = LINK_TO_TD(universal_host_controller_interface, td);
 	} else {
-		td->link = uhci->frame[framenum];
+		td->link = universal_host_controller_interface->frame[framenum];
 		wmb();
-		uhci->frame[framenum] = LINK_TO_TD(uhci, td);
-		uhci->frame_cpu[framenum] = td;
+		universal_host_controller_interface->frame[framenum] = LINK_TO_TD(universal_host_controller_interface, td);
+		universal_host_controller_interface->frame_cpu[framenum] = td;
 	}
 }
 
-static inline void uhci_remove_td_from_frame_list(struct uhci_hcd *uhci,
-		struct uhci_td *td)
+static inline void universal_host_controller_interface_remove_td_from_frame_list(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
+		struct universal_host_controller_interface_td *td)
 {
 	/* If it's not inserted, don't remove it */
 	if (td->frame == -1) {
@@ -188,23 +188,23 @@ static inline void uhci_remove_td_from_frame_list(struct uhci_hcd *uhci,
 		return;
 	}
 
-	if (uhci->frame_cpu[td->frame] == td) {
+	if (universal_host_controller_interface->frame_cpu[td->frame] == td) {
 		if (list_empty(&td->fl_list)) {
-			uhci->frame[td->frame] = td->link;
-			uhci->frame_cpu[td->frame] = NULL;
+			universal_host_controller_interface->frame[td->frame] = td->link;
+			universal_host_controller_interface->frame_cpu[td->frame] = NULL;
 		} else {
-			struct uhci_td *ntd;
+			struct universal_host_controller_interface_td *ntd;
 
 			ntd = list_entry(td->fl_list.next,
-					 struct uhci_td,
+					 struct universal_host_controller_interface_td,
 					 fl_list);
-			uhci->frame[td->frame] = LINK_TO_TD(uhci, ntd);
-			uhci->frame_cpu[td->frame] = ntd;
+			universal_host_controller_interface->frame[td->frame] = LINK_TO_TD(universal_host_controller_interface, ntd);
+			universal_host_controller_interface->frame_cpu[td->frame] = ntd;
 		}
 	} else {
-		struct uhci_td *ptd;
+		struct universal_host_controller_interface_td *ptd;
 
-		ptd = list_entry(td->fl_list.prev, struct uhci_td, fl_list);
+		ptd = list_entry(td->fl_list.prev, struct universal_host_controller_interface_td, fl_list);
 		ptd->link = td->link;
 	}
 
@@ -212,18 +212,18 @@ static inline void uhci_remove_td_from_frame_list(struct uhci_hcd *uhci,
 	td->frame = -1;
 }
 
-static inline void uhci_remove_tds_from_frame(struct uhci_hcd *uhci,
+static inline void universal_host_controller_interface_remove_tds_from_frame(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
 		unsigned int framenum)
 {
-	struct uhci_td *ftd, *ltd;
+	struct universal_host_controller_interface_td *ftd, *ltd;
 
-	framenum &= (UHCI_NUMFRAMES - 1);
+	framenum &= (UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES - 1);
 
-	ftd = uhci->frame_cpu[framenum];
+	ftd = universal_host_controller_interface->frame_cpu[framenum];
 	if (ftd) {
-		ltd = list_entry(ftd->fl_list.prev, struct uhci_td, fl_list);
-		uhci->frame[framenum] = ltd->link;
-		uhci->frame_cpu[framenum] = NULL;
+		ltd = list_entry(ftd->fl_list.prev, struct universal_host_controller_interface_td, fl_list);
+		universal_host_controller_interface->frame[framenum] = ltd->link;
+		universal_host_controller_interface->frame_cpu[framenum] = NULL;
 
 		while (!list_empty(&ftd->fl_list))
 			list_del_init(ftd->fl_list.prev);
@@ -233,29 +233,29 @@ static inline void uhci_remove_tds_from_frame(struct uhci_hcd *uhci,
 /*
  * Remove all the TDs for an Isochronous URB from the frame list
  */
-static void uhci_unlink_isochronous_tds(struct uhci_hcd *uhci, struct urb *urb)
+static void universal_host_controller_interface_unlink_isochronous_tds(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb)
 {
 	struct urb_priv *urbp = (struct urb_priv *) urb->hcpriv;
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 
 	list_for_each_entry(td, &urbp->td_list, list)
-		uhci_remove_td_from_frame_list(uhci, td);
+		universal_host_controller_interface_remove_td_from_frame_list(universal_host_controller_interface, td);
 }
 
-static struct uhci_qh *uhci_alloc_qh(struct uhci_hcd *uhci,
+static struct universal_host_controller_interface_qh *universal_host_controller_interface_alloc_qh(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
 		struct universal_serial_bus_device *udev, struct universal_serial_bus_host_endpoint *hep)
 {
 	dma_addr_t dma_handle;
-	struct uhci_qh *qh;
+	struct universal_host_controller_interface_qh *qh;
 
-	qh = dma_pool_zalloc(uhci->qh_pool, GFP_ATOMIC, &dma_handle);
+	qh = dma_pool_zalloc(universal_host_controller_interface->qh_pool, GFP_ATOMIC, &dma_handle);
 	if (!qh)
 		return NULL;
 
 	qh->dma_handle = dma_handle;
 
-	qh->element = UHCI_PTR_TERM(uhci);
-	qh->link = UHCI_PTR_TERM(uhci);
+	qh->element = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
+	qh->link = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
 
 	INIT_LIST_HEAD(&qh->queue);
 	INIT_LIST_HEAD(&qh->node);
@@ -263,9 +263,9 @@ static struct uhci_qh *uhci_alloc_qh(struct uhci_hcd *uhci,
 	if (udev) {		/* Normal QH */
 		qh->type = universal_serial_bus_endpoint_type(&hep->desc);
 		if (qh->type != UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC) {
-			qh->dummy_td = uhci_alloc_td(uhci);
+			qh->dummy_td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 			if (!qh->dummy_td) {
-				dma_pool_free(uhci->qh_pool, qh, dma_handle);
+				dma_pool_free(universal_host_controller_interface->qh_pool, qh, dma_handle);
 				return NULL;
 			}
 		}
@@ -289,19 +289,19 @@ static struct uhci_qh *uhci_alloc_qh(struct uhci_hcd *uhci,
 	return qh;
 }
 
-static void uhci_free_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void universal_host_controller_interface_free_qh(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	WARN_ON(qh->state != QH_STATE_IDLE && qh->udev);
 	if (!list_empty(&qh->queue))
-		dev_WARN(uhci_dev(uhci), "qh %p list not empty!\n", qh);
+		dev_WARN(universal_host_controller_interface_dev(universal_host_controller_interface), "qh %p list not empty!\n", qh);
 
 	list_del(&qh->node);
 	if (qh->udev) {
 		qh->hep->hcpriv = NULL;
 		if (qh->dummy_td)
-			uhci_free_td(uhci, qh->dummy_td);
+			universal_host_controller_interface_free_td(universal_host_controller_interface, qh->dummy_td);
 	}
-	dma_pool_free(uhci->qh_pool, qh, qh->dma_handle);
+	dma_pool_free(universal_host_controller_interface->qh_pool, qh, qh->dma_handle);
 }
 
 /*
@@ -311,19 +311,19 @@ static void uhci_free_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
  *
  * Returns 0 if the URB should not yet be given back, 1 otherwise.
  */
-static int uhci_cleanup_queue(struct uhci_hcd *uhci, struct uhci_qh *qh,
+static int universal_host_controller_interface_cleanup_queue(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh,
 		struct urb *urb)
 {
 	struct urb_priv *urbp = urb->hcpriv;
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 	int ret = 1;
 
 	/* Isochronous pipes don't use toggles and their TD link pointers
-	 * get adjusted during uhci_urb_dequeue().  But since their queues
+	 * get adjusted during universal_host_controller_interface_urb_dequeue().  But since their queues
 	 * cannot truly be stopped, we have to watch out for dequeues
 	 * occurring after the nominal unlink frame. */
 	if (qh->type == UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC) {
-		ret = (uhci->frame_number + uhci->is_stopped !=
+		ret = (universal_host_controller_interface->frame_number + universal_host_controller_interface->is_stopped !=
 				qh->unlink_frame);
 		goto done;
 	}
@@ -333,23 +333,23 @@ static int uhci_cleanup_queue(struct uhci_hcd *uhci, struct uhci_qh *qh,
 	 * to be saved since this URB can't be executing yet. */
 	if (qh->queue.next != &urbp->node) {
 		struct urb_priv *purbp;
-		struct uhci_td *ptd;
+		struct universal_host_controller_interface_td *ptd;
 
 		purbp = list_entry(urbp->node.prev, struct urb_priv, node);
 		WARN_ON(list_empty(&purbp->td_list));
-		ptd = list_entry(purbp->td_list.prev, struct uhci_td,
+		ptd = list_entry(purbp->td_list.prev, struct universal_host_controller_interface_td,
 				list);
-		td = list_entry(urbp->td_list.prev, struct uhci_td,
+		td = list_entry(urbp->td_list.prev, struct universal_host_controller_interface_td,
 				list);
 		ptd->link = td->link;
 		goto done;
 	}
 
-	/* If the QH element pointer is UHCI_PTR_TERM then then currently
+	/* If the QH element pointer is UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM then then currently
 	 * executing URB has already been unlinked, so this one isn't it. */
-	if (qh_element(qh) == UHCI_PTR_TERM(uhci))
+	if (qh_element(qh) == UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface))
 		goto done;
-	qh->element = UHCI_PTR_TERM(uhci);
+	qh->element = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
 
 	/* Control pipes don't have to worry about toggles */
 	if (qh->type == UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_CONTROL)
@@ -357,9 +357,9 @@ static int uhci_cleanup_queue(struct uhci_hcd *uhci, struct uhci_qh *qh,
 
 	/* Save the next toggle value */
 	WARN_ON(list_empty(&urbp->td_list));
-	td = list_entry(urbp->td_list.next, struct uhci_td, list);
+	td = list_entry(urbp->td_list.next, struct universal_host_controller_interface_td, list);
 	qh->needs_fixup = 1;
-	qh->initial_toggle = uhci_toggle(td_token(uhci, td));
+	qh->initial_toggle = universal_host_controller_interface_toggle(td_token(universal_host_controller_interface, td));
 
 done:
 	return ret;
@@ -369,11 +369,11 @@ static int uhci_cleanup_queue(struct uhci_hcd *uhci, struct uhci_qh *qh,
  * Fix up the data toggles for URBs in a queue, when one of them
  * terminates early (short transfer, error, or dequeued).
  */
-static void uhci_fixup_toggles(struct uhci_hcd *uhci, struct uhci_qh *qh,
+static void universal_host_controller_interface_fixup_toggles(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh,
 			int skip_first)
 {
 	struct urb_priv *urbp = NULL;
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 	unsigned int toggle = qh->initial_toggle;
 	unsigned int pipe;
 
@@ -384,7 +384,7 @@ static void uhci_fixup_toggles(struct uhci_hcd *uhci, struct uhci_qh *qh,
 
 	/* When starting with the first URB, if the QH element pointer is
 	 * still valid then we know the URB's toggles are okay. */
-	else if (qh_element(qh) != UHCI_PTR_TERM(uhci))
+	else if (qh_element(qh) != UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface))
 		toggle = 2;
 
 	/* Fix up the toggle for the URBs in the queue.  Normally this
@@ -395,16 +395,16 @@ static void uhci_fixup_toggles(struct uhci_hcd *uhci, struct uhci_qh *qh,
 
 		/* If the first TD has the right toggle value, we don't
 		 * need to change any toggles in this URB */
-		td = list_entry(urbp->td_list.next, struct uhci_td, list);
-		if (toggle > 1 || uhci_toggle(td_token(uhci, td)) == toggle) {
-			td = list_entry(urbp->td_list.prev, struct uhci_td,
+		td = list_entry(urbp->td_list.next, struct universal_host_controller_interface_td, list);
+		if (toggle > 1 || universal_host_controller_interface_toggle(td_token(universal_host_controller_interface, td)) == toggle) {
+			td = list_entry(urbp->td_list.prev, struct universal_host_controller_interface_td,
 					list);
-			toggle = uhci_toggle(td_token(uhci, td)) ^ 1;
+			toggle = universal_host_controller_interface_toggle(td_token(universal_host_controller_interface, td)) ^ 1;
 
 		/* Otherwise all the toggles in the URB have to be switched */
 		} else {
 			list_for_each_entry(td, &urbp->td_list, list) {
-				td->token ^= cpu_to_hc32(uhci,
+				td->token ^= cpu_to_hc32(universal_host_controller_interface,
 							TD_TOKEN_TOGGLE);
 				toggle ^= 1;
 			}
@@ -421,9 +421,9 @@ static void uhci_fixup_toggles(struct uhci_hcd *uhci, struct uhci_qh *qh,
 /*
  * Link an Isochronous QH into its skeleton's list
  */
-static inline void link_iso(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static inline void link_iso(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
-	list_add_tail(&qh->node, &uhci->skel_iso_qh->node);
+	list_add_tail(&qh->node, &universal_host_controller_interface->skel_iso_qh->node);
 
 	/* Isochronous QHs aren't linked by the hardware */
 }
@@ -432,31 +432,31 @@ static inline void link_iso(struct uhci_hcd *uhci, struct uhci_qh *qh)
  * Link a high-period interrupt QH into the schedule at the end of its
  * skeleton's list
  */
-static void link_interrupt(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void link_interrupt(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
-	struct uhci_qh *pqh;
+	struct universal_host_controller_interface_qh *pqh;
 
-	list_add_tail(&qh->node, &uhci->skelqh[qh->skel]->node);
+	list_add_tail(&qh->node, &universal_host_controller_interface->skelqh[qh->skel]->node);
 
-	pqh = list_entry(qh->node.prev, struct uhci_qh, node);
+	pqh = list_entry(qh->node.prev, struct universal_host_controller_interface_qh, node);
 	qh->link = pqh->link;
 	wmb();
-	pqh->link = LINK_TO_QH(uhci, qh);
+	pqh->link = LINK_TO_QH(universal_host_controller_interface, qh);
 }
 
 /*
  * Link a period-1 interrupt or async QH into the schedule at the
  * correct spot in the async skeleton's list, and update the FSBR link
  */
-static void link_async(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void link_async(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
-	struct uhci_qh *pqh;
+	struct universal_host_controller_interface_qh *pqh;
 	__hc32 link_to_new_qh;
 
 	/* Find the predecessor QH for our new one and insert it in the list.
 	 * The list of QHs is expected to be short, so linear search won't
 	 * take too long. */
-	list_for_each_entry_reverse(pqh, &uhci->skel_async_qh->node, node) {
+	list_for_each_entry_reverse(pqh, &universal_host_controller_interface->skel_async_qh->node, node) {
 		if (pqh->skel <= qh->skel)
 			break;
 	}
@@ -465,31 +465,31 @@ static void link_async(struct uhci_hcd *uhci, struct uhci_qh *qh)
 	/* Link it into the schedule */
 	qh->link = pqh->link;
 	wmb();
-	link_to_new_qh = LINK_TO_QH(uhci, qh);
+	link_to_new_qh = LINK_TO_QH(universal_host_controller_interface, qh);
 	pqh->link = link_to_new_qh;
 
 	/* If this is now the first FSBR QH, link the terminating skeleton
 	 * QH to it. */
 	if (pqh->skel < SKEL_FSBR && qh->skel >= SKEL_FSBR)
-		uhci->skel_term_qh->link = link_to_new_qh;
+		universal_host_controller_interface->skel_term_qh->link = link_to_new_qh;
 }
 
 /*
  * Put a QH on the schedule in both hardware and software
  */
-static void uhci_activate_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void universal_host_controller_interface_activate_qh(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	WARN_ON(list_empty(&qh->queue));
 
 	/* Set the element pointer if it isn't set already.
 	 * This isn't needed for Isochronous queues, but it doesn't hurt. */
-	if (qh_element(qh) == UHCI_PTR_TERM(uhci)) {
+	if (qh_element(qh) == UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface)) {
 		struct urb_priv *urbp = list_entry(qh->queue.next,
 				struct urb_priv, node);
-		struct uhci_td *td = list_entry(urbp->td_list.next,
-				struct uhci_td, list);
+		struct universal_host_controller_interface_td *td = list_entry(urbp->td_list.next,
+				struct universal_host_controller_interface_td, list);
 
-		qh->element = LINK_TO_TD(uhci, td);
+		qh->element = LINK_TO_TD(universal_host_controller_interface, td);
 	}
 
 	/* Treat the queue as if it has just advanced */
@@ -502,27 +502,27 @@ static void uhci_activate_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
 
 	/* Move the QH from its old list to the correct spot in the appropriate
 	 * skeleton's list */
-	if (qh == uhci->next_qh)
-		uhci->next_qh = list_entry(qh->node.next, struct uhci_qh,
+	if (qh == universal_host_controller_interface->next_qh)
+		universal_host_controller_interface->next_qh = list_entry(qh->node.next, struct universal_host_controller_interface_qh,
 				node);
 	list_del(&qh->node);
 
 	if (qh->skel == SKEL_ISO)
-		link_iso(uhci, qh);
+		link_iso(universal_host_controller_interface, qh);
 	else if (qh->skel < SKEL_ASYNC)
-		link_interrupt(uhci, qh);
+		link_interrupt(universal_host_controller_interface, qh);
 	else
-		link_async(uhci, qh);
+		link_async(universal_host_controller_interface, qh);
 }
 
 /*
  * Unlink a high-period interrupt QH from the schedule
  */
-static void unlink_interrupt(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void unlink_interrupt(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
-	struct uhci_qh *pqh;
+	struct universal_host_controller_interface_qh *pqh;
 
-	pqh = list_entry(qh->node.prev, struct uhci_qh, node);
+	pqh = list_entry(qh->node.prev, struct universal_host_controller_interface_qh, node);
 	pqh->link = qh->link;
 	mb();
 }
@@ -530,25 +530,25 @@ static void unlink_interrupt(struct uhci_hcd *uhci, struct uhci_qh *qh)
 /*
  * Unlink a period-1 interrupt or async QH from the schedule
  */
-static void unlink_async(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void unlink_async(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
-	struct uhci_qh *pqh;
+	struct universal_host_controller_interface_qh *pqh;
 	__hc32 link_to_next_qh = qh->link;
 
-	pqh = list_entry(qh->node.prev, struct uhci_qh, node);
+	pqh = list_entry(qh->node.prev, struct universal_host_controller_interface_qh, node);
 	pqh->link = link_to_next_qh;
 
 	/* If this was the old first FSBR QH, link the terminating skeleton
 	 * QH to the next (new first FSBR) QH. */
 	if (pqh->skel < SKEL_FSBR && qh->skel >= SKEL_FSBR)
-		uhci->skel_term_qh->link = link_to_next_qh;
+		universal_host_controller_interface->skel_term_qh->link = link_to_next_qh;
 	mb();
 }
 
 /*
  * Take a QH off the hardware schedule
  */
-static void uhci_unlink_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void universal_host_controller_interface_unlink_qh(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	if (qh->state == QH_STATE_UNLINKING)
 		return;
@@ -559,22 +559,22 @@ static void uhci_unlink_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
 	if (qh->skel == SKEL_ISO)
 		;
 	else if (qh->skel < SKEL_ASYNC)
-		unlink_interrupt(uhci, qh);
+		unlink_interrupt(universal_host_controller_interface, qh);
 	else
-		unlink_async(uhci, qh);
+		unlink_async(universal_host_controller_interface, qh);
 
-	uhci_get_current_frame_number(uhci);
-	qh->unlink_frame = uhci->frame_number;
+	universal_host_controller_interface_get_current_frame_number(universal_host_controller_interface);
+	qh->unlink_frame = universal_host_controller_interface->frame_number;
 
 	/* Force an interrupt so we know when the QH is fully unlinked */
-	if (list_empty(&uhci->skel_unlink_qh->node) || uhci->is_stopped)
-		uhci_set_next_interrupt(uhci);
+	if (list_empty(&universal_host_controller_interface->skel_unlink_qh->node) || universal_host_controller_interface->is_stopped)
+		universal_host_controller_interface_set_next_interrupt(universal_host_controller_interface);
 
 	/* Move the QH from its old list to the end of the unlinking list */
-	if (qh == uhci->next_qh)
-		uhci->next_qh = list_entry(qh->node.next, struct uhci_qh,
+	if (qh == universal_host_controller_interface->next_qh)
+		universal_host_controller_interface->next_qh = list_entry(qh->node.next, struct universal_host_controller_interface_qh,
 				node);
-	list_move_tail(&qh->node, &uhci->skel_unlink_qh->node);
+	list_move_tail(&qh->node, &universal_host_controller_interface->skel_unlink_qh->node);
 }
 
 /*
@@ -583,36 +583,36 @@ static void uhci_unlink_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
  * list) for more than one frame, or when an error occurs while adding
  * the first URB onto a new QH.
  */
-static void uhci_make_qh_idle(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void universal_host_controller_interface_make_qh_idle(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	WARN_ON(qh->state == QH_STATE_ACTIVE);
 
-	if (qh == uhci->next_qh)
-		uhci->next_qh = list_entry(qh->node.next, struct uhci_qh,
+	if (qh == universal_host_controller_interface->next_qh)
+		universal_host_controller_interface->next_qh = list_entry(qh->node.next, struct universal_host_controller_interface_qh,
 				node);
-	list_move(&qh->node, &uhci->idle_qh_list);
+	list_move(&qh->node, &universal_host_controller_interface->idle_qh_list);
 	qh->state = QH_STATE_IDLE;
 
 	/* Now that the QH is idle, its post_td isn't being used */
 	if (qh->post_td) {
-		uhci_free_td(uhci, qh->post_td);
+		universal_host_controller_interface_free_td(universal_host_controller_interface, qh->post_td);
 		qh->post_td = NULL;
 	}
 
 	/* If anyone is waiting for a QH to become idle, wake them up */
-	if (uhci->num_waiting)
-		wake_up_all(&uhci->waitqh);
+	if (universal_host_controller_interface->num_waiting)
+		wake_up_all(&universal_host_controller_interface->waitqh);
 }
 
 /*
  * Find the highest existing bandwidth load for a given phase and period.
  */
-static int uhci_highest_load(struct uhci_hcd *uhci, int phase, int period)
+static int universal_host_controller_interface_highest_load(struct universal_host_controller_interface_hcd *universal_host_controller_interface, int phase, int period)
 {
-	int highest_load = uhci->load[phase];
+	int highest_load = universal_host_controller_interface->load[phase];
 
 	for (phase += period; phase < MAX_PHASE; phase += period)
-		highest_load = max_t(int, highest_load, uhci->load[phase]);
+		highest_load = max_t(int, highest_load, universal_host_controller_interface->load[phase]);
 	return highest_load;
 }
 
@@ -620,22 +620,22 @@ static int uhci_highest_load(struct uhci_hcd *uhci, int phase, int period)
  * Set qh->phase to the optimal phase for a periodic transfer and
  * check whether the bandwidth requirement is acceptable.
  */
-static int uhci_check_bandwidth(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static int universal_host_controller_interface_check_bandwidth(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	int minimax_load;
 
 	/* Find the optimal phase (unless it is already set) and get
 	 * its load value. */
 	if (qh->phase >= 0)
-		minimax_load = uhci_highest_load(uhci, qh->phase, qh->period);
+		minimax_load = universal_host_controller_interface_highest_load(universal_host_controller_interface, qh->phase, qh->period);
 	else {
 		int phase, load;
 		int max_phase = min_t(int, MAX_PHASE, qh->period);
 
 		qh->phase = 0;
-		minimax_load = uhci_highest_load(uhci, qh->phase, qh->period);
+		minimax_load = universal_host_controller_interface_highest_load(universal_host_controller_interface, qh->phase, qh->period);
 		for (phase = 1; phase < max_phase; ++phase) {
-			load = uhci_highest_load(uhci, phase, qh->period);
+			load = universal_host_controller_interface_highest_load(universal_host_controller_interface, phase, qh->period);
 			if (load < minimax_load) {
 				minimax_load = load;
 				qh->phase = phase;
@@ -645,7 +645,7 @@ static int uhci_check_bandwidth(struct uhci_hcd *uhci, struct uhci_qh *qh)
 
 	/* Maximum allowable periodic bandwidth is 90%, or 900 us per frame */
 	if (minimax_load + qh->load > 900) {
-		dev_dbg(uhci_dev(uhci), "bandwidth allocation failed: "
+		dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "bandwidth allocation failed: "
 				"period %d, phase %d, %d + %d us\n",
 				qh->period, qh->phase, minimax_load, qh->load);
 		return -ENOSPC;
@@ -656,30 +656,30 @@ static int uhci_check_bandwidth(struct uhci_hcd *uhci, struct uhci_qh *qh)
 /*
  * Reserve a periodic QH's bandwidth in the schedule
  */
-static void uhci_reserve_bandwidth(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void universal_host_controller_interface_reserve_bandwidth(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	int i;
 	int load = qh->load;
 	char *p = "??";
 
 	for (i = qh->phase; i < MAX_PHASE; i += qh->period) {
-		uhci->load[i] += load;
-		uhci->total_load += load;
+		universal_host_controller_interface->load[i] += load;
+		universal_host_controller_interface->total_load += load;
 	}
-	uhci_to_hcd(uhci)->self.bandwidth_allocated =
-			uhci->total_load / MAX_PHASE;
+	universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_allocated =
+			universal_host_controller_interface->total_load / MAX_PHASE;
 	switch (qh->type) {
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_INT:
-		++uhci_to_hcd(uhci)->self.bandwidth_int_reqs;
+		++universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_int_reqs;
 		p = "INT";
 		break;
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC:
-		++uhci_to_hcd(uhci)->self.bandwidth_isoc_reqs;
+		++universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_isoc_reqs;
 		p = "ISO";
 		break;
 	}
 	qh->bandwidth_reserved = 1;
-	dev_dbg(uhci_dev(uhci),
+	dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface),
 			"%s dev %d ep%02x-%s, period %d, phase %d, %d us\n",
 			"reserve", qh->udev->devnum,
 			qh->hep->desc.bEndpointAddress, p,
@@ -689,42 +689,42 @@ static void uhci_reserve_bandwidth(struct uhci_hcd *uhci, struct uhci_qh *qh)
 /*
  * Release a periodic QH's bandwidth reservation
  */
-static void uhci_release_bandwidth(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void universal_host_controller_interface_release_bandwidth(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	int i;
 	int load = qh->load;
 	char *p = "??";
 
 	for (i = qh->phase; i < MAX_PHASE; i += qh->period) {
-		uhci->load[i] -= load;
-		uhci->total_load -= load;
+		universal_host_controller_interface->load[i] -= load;
+		universal_host_controller_interface->total_load -= load;
 	}
-	uhci_to_hcd(uhci)->self.bandwidth_allocated =
-			uhci->total_load / MAX_PHASE;
+	universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_allocated =
+			universal_host_controller_interface->total_load / MAX_PHASE;
 	switch (qh->type) {
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_INT:
-		--uhci_to_hcd(uhci)->self.bandwidth_int_reqs;
+		--universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_int_reqs;
 		p = "INT";
 		break;
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC:
-		--uhci_to_hcd(uhci)->self.bandwidth_isoc_reqs;
+		--universal_host_controller_interface_to_hcd(universal_host_controller_interface)->self.bandwidth_isoc_reqs;
 		p = "ISO";
 		break;
 	}
 	qh->bandwidth_reserved = 0;
-	dev_dbg(uhci_dev(uhci),
+	dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface),
 			"%s dev %d ep%02x-%s, period %d, phase %d, %d us\n",
 			"release", qh->udev->devnum,
 			qh->hep->desc.bEndpointAddress, p,
 			qh->period, qh->phase, load);
 }
 
-static inline struct urb_priv *uhci_alloc_urb_priv(struct uhci_hcd *uhci,
+static inline struct urb_priv *universal_host_controller_interface_alloc_urb_priv(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
 		struct urb *urb)
 {
 	struct urb_priv *urbp;
 
-	urbp = kmem_cache_zalloc(uhci_up_cachep, GFP_ATOMIC);
+	urbp = kmem_cache_zalloc(universal_host_controller_interface_up_cachep, GFP_ATOMIC);
 	if (!urbp)
 		return NULL;
 
@@ -737,32 +737,32 @@ static inline struct urb_priv *uhci_alloc_urb_priv(struct uhci_hcd *uhci,
 	return urbp;
 }
 
-static void uhci_free_urb_priv(struct uhci_hcd *uhci,
+static void universal_host_controller_interface_free_urb_priv(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
 		struct urb_priv *urbp)
 {
-	struct uhci_td *td, *tmp;
+	struct universal_host_controller_interface_td *td, *tmp;
 
 	if (!list_empty(&urbp->node))
-		dev_WARN(uhci_dev(uhci), "urb %p still on QH's list!\n",
+		dev_WARN(universal_host_controller_interface_dev(universal_host_controller_interface), "urb %p still on QH's list!\n",
 				urbp->urb);
 
 	list_for_each_entry_safe(td, tmp, &urbp->td_list, list) {
-		uhci_remove_td_from_urbp(td);
-		uhci_free_td(uhci, td);
+		universal_host_controller_interface_remove_td_from_urbp(td);
+		universal_host_controller_interface_free_td(universal_host_controller_interface, td);
 	}
 
-	kmem_cache_free(uhci_up_cachep, urbp);
+	kmem_cache_free(universal_host_controller_interface_up_cachep, urbp);
 }
 
 /*
  * Map status to standard result codes
  *
- * <status> is (td_status(uhci, td) & 0xF60000), a.k.a.
- * uhci_status_bits(td_status(uhci, td)).
+ * <status> is (td_status(universal_host_controller_interface, td) & 0xF60000), a.k.a.
+ * universal_host_controller_interface_status_bits(td_status(universal_host_controller_interface, td)).
  * Note: <status> does not include the TD_CTRL_NAK bit.
  * <dir_out> is True for output TDs and False for input TDs.
  */
-static int uhci_map_status(int status, int dir_out)
+static int universal_host_controller_interface_map_status(int status, int dir_out)
 {
 	if (!status)
 		return 0;
@@ -786,10 +786,10 @@ static int uhci_map_status(int status, int dir_out)
 /*
  * Control transfers
  */
-static int uhci_submit_control(struct uhci_hcd *uhci, struct urb *urb,
-		struct uhci_qh *qh)
+static int universal_host_controller_interface_submit_control(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb,
+		struct universal_host_controller_interface_qh *qh)
 {
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 	unsigned long destination, status;
 	int maxsze = universal_serial_bus_endpoint_maxp(&qh->hep->desc);
 	int len = urb->transfer_buffer_length;
@@ -802,7 +802,7 @@ static int uhci_submit_control(struct uhci_hcd *uhci, struct urb *urb,
 	destination = (urb->pipe & PIPE_DEVEP_MASK) | UNIVERSAL_SERIAL_BUS_PID_SETUP;
 
 	/* 3 errors, dummy TD remains inactive */
-	status = uhci_maxerr(3);
+	status = universal_host_controller_interface_maxerr(3);
 	if (urb->dev->speed == UNIVERSAL_SERIAL_BUS_SPEED_LOW)
 		status |= TD_CTRL_LS;
 
@@ -810,8 +810,8 @@ static int uhci_submit_control(struct uhci_hcd *uhci, struct urb *urb,
 	 * Build the TD for the control request setup packet
 	 */
 	td = qh->dummy_td;
-	uhci_add_td_to_urbp(td, urbp);
-	uhci_fill_td(uhci, td, status, destination | uhci_explen(8),
+	universal_host_controller_interface_add_td_to_urbp(td, urbp);
+	universal_host_controller_interface_fill_td(universal_host_controller_interface, td, status, destination | universal_host_controller_interface_explen(8),
 			urb->setup_dma);
 	plink = &td->link;
 	status |= TD_CTRL_ACTIVE;
@@ -841,17 +841,17 @@ static int uhci_submit_control(struct uhci_hcd *uhci, struct urb *urb,
 			status &= ~TD_CTRL_SPD;
 		}
 
-		td = uhci_alloc_td(uhci);
+		td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 		if (!td)
 			goto nomem;
-		*plink = LINK_TO_TD(uhci, td);
+		*plink = LINK_TO_TD(universal_host_controller_interface, td);
 
 		/* Alternate Data0/1 (start with Data1) */
 		destination ^= TD_TOKEN_TOGGLE;
 
-		uhci_add_td_to_urbp(td, urbp);
-		uhci_fill_td(uhci, td, status,
-			destination | uhci_explen(pktsze), data);
+		universal_host_controller_interface_add_td_to_urbp(td, urbp);
+		universal_host_controller_interface_fill_td(universal_host_controller_interface, td, status,
+			destination | universal_host_controller_interface_explen(pktsze), data);
 		plink = &td->link;
 
 		data += pktsze;
@@ -861,31 +861,31 @@ static int uhci_submit_control(struct uhci_hcd *uhci, struct urb *urb,
 	/*
 	 * Build the final TD for control status
 	 */
-	td = uhci_alloc_td(uhci);
+	td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 	if (!td)
 		goto nomem;
-	*plink = LINK_TO_TD(uhci, td);
+	*plink = LINK_TO_TD(universal_host_controller_interface, td);
 
 	/* Change direction for the status transaction */
 	destination ^= (UNIVERSAL_SERIAL_BUS_PID_IN ^ UNIVERSAL_SERIAL_BUS_PID_OUT);
 	destination |= TD_TOKEN_TOGGLE;		/* End in Data1 */
 
-	uhci_add_td_to_urbp(td, urbp);
-	uhci_fill_td(uhci, td, status | TD_CTRL_IOC,
-			destination | uhci_explen(0), 0);
+	universal_host_controller_interface_add_td_to_urbp(td, urbp);
+	universal_host_controller_interface_fill_td(universal_host_controller_interface, td, status | TD_CTRL_IOC,
+			destination | universal_host_controller_interface_explen(0), 0);
 	plink = &td->link;
 
 	/*
 	 * Build the new dummy TD and activate the old one
 	 */
-	td = uhci_alloc_td(uhci);
+	td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 	if (!td)
 		goto nomem;
-	*plink = LINK_TO_TD(uhci, td);
+	*plink = LINK_TO_TD(universal_host_controller_interface, td);
 
-	uhci_fill_td(uhci, td, 0, UNIVERSAL_SERIAL_BUS_PID_OUT | uhci_explen(0), 0);
+	universal_host_controller_interface_fill_td(universal_host_controller_interface, td, 0, UNIVERSAL_SERIAL_BUS_PID_OUT | universal_host_controller_interface_explen(0), 0);
 	wmb();
-	qh->dummy_td->status |= cpu_to_hc32(uhci, TD_CTRL_ACTIVE);
+	qh->dummy_td->status |= cpu_to_hc32(universal_host_controller_interface, TD_CTRL_ACTIVE);
 	qh->dummy_td = td;
 
 	/* Low-speed transfers get a different queue, and won't hog the bus.
@@ -897,7 +897,7 @@ static int uhci_submit_control(struct uhci_hcd *uhci, struct urb *urb,
 		skel = SKEL_LS_CONTROL;
 	else {
 		skel = SKEL_FS_CONTROL;
-		uhci_add_fsbr(uhci, urb);
+		universal_host_controller_interface_add_fsbr(universal_host_controller_interface, urb);
 	}
 	if (qh->state != QH_STATE_ACTIVE)
 		qh->skel = skel;
@@ -905,17 +905,17 @@ static int uhci_submit_control(struct uhci_hcd *uhci, struct urb *urb,
 
 nomem:
 	/* Remove the dummy TD from the td_list so it doesn't get freed */
-	uhci_remove_td_from_urbp(qh->dummy_td);
+	universal_host_controller_interface_remove_td_from_urbp(qh->dummy_td);
 	return -ENOMEM;
 }
 
 /*
  * Common submit for bulk and interrupt
  */
-static int uhci_submit_common(struct uhci_hcd *uhci, struct urb *urb,
-		struct uhci_qh *qh)
+static int universal_host_controller_interface_submit_common(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb,
+		struct universal_host_controller_interface_qh *qh)
 {
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 	unsigned long destination, status;
 	int maxsze = universal_serial_bus_endpoint_maxp(&qh->hep->desc);
 	int len = urb->transfer_buffer_length;
@@ -936,7 +936,7 @@ static int uhci_submit_common(struct uhci_hcd *uhci, struct urb *urb,
 			 universal_serial_bus_pipeout(urb->pipe));
 
 	/* 3 errors, dummy TD remains inactive */
-	status = uhci_maxerr(3);
+	status = universal_host_controller_interface_maxerr(3);
 	if (urb->dev->speed == UNIVERSAL_SERIAL_BUS_SPEED_LOW)
 		status |= TD_CTRL_LS;
 	if (universal_serial_bus_pipein(urb->pipe))
@@ -971,14 +971,14 @@ static int uhci_submit_common(struct uhci_hcd *uhci, struct urb *urb,
 		}
 
 		if (plink) {
-			td = uhci_alloc_td(uhci);
+			td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 			if (!td)
 				goto nomem;
-			*plink = LINK_TO_TD(uhci, td);
+			*plink = LINK_TO_TD(universal_host_controller_interface, td);
 		}
-		uhci_add_td_to_urbp(td, urbp);
-		uhci_fill_td(uhci, td, status,
-				destination | uhci_explen(pktsze) |
+		universal_host_controller_interface_add_td_to_urbp(td, urbp);
+		universal_host_controller_interface_fill_td(universal_host_controller_interface, td, status,
+				destination | universal_host_controller_interface_explen(pktsze) |
 					(toggle << TD_TOKEN_TOGGLE_SHIFT),
 				data);
 		plink = &td->link;
@@ -1007,14 +1007,14 @@ static int uhci_submit_common(struct uhci_hcd *uhci, struct urb *urb,
 	if ((urb->transfer_flags & URB_ZERO_PACKET) &&
 			universal_serial_bus_pipeout(urb->pipe) && len == 0 &&
 			urb->transfer_buffer_length > 0) {
-		td = uhci_alloc_td(uhci);
+		td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 		if (!td)
 			goto nomem;
-		*plink = LINK_TO_TD(uhci, td);
+		*plink = LINK_TO_TD(universal_host_controller_interface, td);
 
-		uhci_add_td_to_urbp(td, urbp);
-		uhci_fill_td(uhci, td, status,
-				destination | uhci_explen(0) |
+		universal_host_controller_interface_add_td_to_urbp(td, urbp);
+		universal_host_controller_interface_fill_td(universal_host_controller_interface, td, status,
+				destination | universal_host_controller_interface_explen(0) |
 					(toggle << TD_TOKEN_TOGGLE_SHIFT),
 				data);
 		plink = &td->link;
@@ -1028,19 +1028,19 @@ static int uhci_submit_common(struct uhci_hcd *uhci, struct urb *urb,
 	 * fast side but not enough to justify delaying an interrupt
 	 * more than 2 or 3 URBs, so we will ignore the URB_NO_INTERRUPT
 	 * flag setting. */
-	td->status |= cpu_to_hc32(uhci, TD_CTRL_IOC);
+	td->status |= cpu_to_hc32(universal_host_controller_interface, TD_CTRL_IOC);
 
 	/*
 	 * Build the new dummy TD and activate the old one
 	 */
-	td = uhci_alloc_td(uhci);
+	td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 	if (!td)
 		goto nomem;
-	*plink = LINK_TO_TD(uhci, td);
+	*plink = LINK_TO_TD(universal_host_controller_interface, td);
 
-	uhci_fill_td(uhci, td, 0, UNIVERSAL_SERIAL_BUS_PID_OUT | uhci_explen(0), 0);
+	universal_host_controller_interface_fill_td(universal_host_controller_interface, td, 0, UNIVERSAL_SERIAL_BUS_PID_OUT | universal_host_controller_interface_explen(0), 0);
 	wmb();
-	qh->dummy_td->status |= cpu_to_hc32(uhci, TD_CTRL_ACTIVE);
+	qh->dummy_td->status |= cpu_to_hc32(universal_host_controller_interface, TD_CTRL_ACTIVE);
 	qh->dummy_td = td;
 
 	universal_serial_bus_settoggle(urb->dev, universal_serial_bus_pipeendpoint(urb->pipe),
@@ -1049,12 +1049,12 @@ static int uhci_submit_common(struct uhci_hcd *uhci, struct urb *urb,
 
 nomem:
 	/* Remove the dummy TD from the td_list so it doesn't get freed */
-	uhci_remove_td_from_urbp(qh->dummy_td);
+	universal_host_controller_interface_remove_td_from_urbp(qh->dummy_td);
 	return -ENOMEM;
 }
 
-static int uhci_submit_bulk(struct uhci_hcd *uhci, struct urb *urb,
-		struct uhci_qh *qh)
+static int universal_host_controller_interface_submit_bulk(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb,
+		struct universal_host_controller_interface_qh *qh)
 {
 	int ret;
 
@@ -1064,14 +1064,14 @@ static int uhci_submit_bulk(struct uhci_hcd *uhci, struct urb *urb,
 
 	if (qh->state != QH_STATE_ACTIVE)
 		qh->skel = SKEL_BULK;
-	ret = uhci_submit_common(uhci, urb, qh);
+	ret = universal_host_controller_interface_submit_common(universal_host_controller_interface, urb, qh);
 	if (ret == 0)
-		uhci_add_fsbr(uhci, urb);
+		universal_host_controller_interface_add_fsbr(universal_host_controller_interface, urb);
 	return ret;
 }
 
-static int uhci_submit_interrupt(struct uhci_hcd *uhci, struct urb *urb,
-		struct uhci_qh *qh)
+static int universal_host_controller_interface_submit_interrupt(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb,
+		struct universal_host_controller_interface_qh *qh)
 {
 	int ret;
 
@@ -1100,18 +1100,18 @@ static int uhci_submit_interrupt(struct uhci_hcd *uhci, struct urb *urb,
 			 * of the QH lists.
 			 */
 			qh->phase = (qh->period / 2) & (MAX_PHASE - 1);
-			ret = uhci_check_bandwidth(uhci, qh);
+			ret = universal_host_controller_interface_check_bandwidth(universal_host_controller_interface, qh);
 		} while (ret != 0 && --exponent >= 0);
 		if (ret)
 			return ret;
 	} else if (qh->period > urb->interval)
 		return -EINVAL;		/* Can't decrease the period */
 
-	ret = uhci_submit_common(uhci, urb, qh);
+	ret = universal_host_controller_interface_submit_common(universal_host_controller_interface, urb, qh);
 	if (ret == 0) {
 		urb->interval = qh->period;
 		if (!qh->bandwidth_reserved)
-			uhci_reserve_bandwidth(uhci, qh);
+			universal_host_controller_interface_reserve_bandwidth(universal_host_controller_interface, qh);
 	}
 	return ret;
 }
@@ -1119,21 +1119,21 @@ static int uhci_submit_interrupt(struct uhci_hcd *uhci, struct urb *urb,
 /*
  * Fix up the data structures following a short transfer
  */
-static int uhci_fixup_short_transfer(struct uhci_hcd *uhci,
-		struct uhci_qh *qh, struct urb_priv *urbp)
+static int universal_host_controller_interface_fixup_short_transfer(struct universal_host_controller_interface_hcd *universal_host_controller_interface,
+		struct universal_host_controller_interface_qh *qh, struct urb_priv *urbp)
 {
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 	struct list_head *tmp;
 	int ret;
 
-	td = list_entry(urbp->td_list.prev, struct uhci_td, list);
+	td = list_entry(urbp->td_list.prev, struct universal_host_controller_interface_td, list);
 	if (qh->type == UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_CONTROL) {
 
 		/* When a control transfer is short, we have to restart
 		 * the queue at the status stage transaction, which is
 		 * the last TD. */
 		WARN_ON(list_empty(&urbp->td_list));
-		qh->element = LINK_TO_TD(uhci, td);
+		qh->element = LINK_TO_TD(universal_host_controller_interface, td);
 		tmp = td->list.prev;
 		ret = -EINPROGRESS;
 
@@ -1143,8 +1143,8 @@ static int uhci_fixup_short_transfer(struct uhci_hcd *uhci,
 		 * fix up the toggles of the following URBs on the queue
 		 * before restarting the queue at the next URB. */
 		qh->initial_toggle =
-			uhci_toggle(td_token(uhci, qh->post_td)) ^ 1;
-		uhci_fixup_toggles(uhci, qh, 1);
+			universal_host_controller_interface_toggle(td_token(universal_host_controller_interface, qh->post_td)) ^ 1;
+		universal_host_controller_interface_fixup_toggles(universal_host_controller_interface, qh, 1);
 
 		if (list_empty(&urbp->td_list))
 			td = qh->post_td;
@@ -1155,11 +1155,11 @@ static int uhci_fixup_short_transfer(struct uhci_hcd *uhci,
 
 	/* Remove all the TDs we skipped over, from tmp back to the start */
 	while (tmp != &urbp->td_list) {
-		td = list_entry(tmp, struct uhci_td, list);
+		td = list_entry(tmp, struct universal_host_controller_interface_td, list);
 		tmp = tmp->prev;
 
-		uhci_remove_td_from_urbp(td);
-		uhci_free_td(uhci, td);
+		universal_host_controller_interface_remove_td_from_urbp(td);
+		universal_host_controller_interface_free_td(universal_host_controller_interface, td);
 	}
 	return ret;
 }
@@ -1167,11 +1167,11 @@ static int uhci_fixup_short_transfer(struct uhci_hcd *uhci,
 /*
  * Common result for control, bulk, and interrupt
  */
-static int uhci_result_common(struct uhci_hcd *uhci, struct urb *urb)
+static int universal_host_controller_interface_result_common(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb)
 {
 	struct urb_priv *urbp = urb->hcpriv;
-	struct uhci_qh *qh = urbp->qh;
-	struct uhci_td *td, *tmp;
+	struct universal_host_controller_interface_qh *qh = urbp->qh;
+	struct universal_host_controller_interface_td *td, *tmp;
 	unsigned status;
 	int ret = 0;
 
@@ -1179,17 +1179,17 @@ static int uhci_result_common(struct uhci_hcd *uhci, struct urb *urb)
 		unsigned int ctrlstat;
 		int len;
 
-		ctrlstat = td_status(uhci, td);
-		status = uhci_status_bits(ctrlstat);
+		ctrlstat = td_status(universal_host_controller_interface, td);
+		status = universal_host_controller_interface_status_bits(ctrlstat);
 		if (status & TD_CTRL_ACTIVE)
 			return -EINPROGRESS;
 
-		len = uhci_actual_length(ctrlstat);
+		len = universal_host_controller_interface_actual_length(ctrlstat);
 		urb->actual_length += len;
 
 		if (status) {
-			ret = uhci_map_status(status,
-					uhci_packetout(td_token(uhci, td)));
+			ret = universal_host_controller_interface_map_status(status,
+					universal_host_controller_interface_packetout(td_token(universal_host_controller_interface, td)));
 			if ((debug == 1 && ret != -EPIPE) || debug > 1) {
 				/* Some debugging code */
 				dev_dbg(&urb->dev->dev,
@@ -1198,14 +1198,14 @@ static int uhci_result_common(struct uhci_hcd *uhci, struct urb *urb)
 
 				if (debug > 1 && errbuf) {
 					/* Print the chain for debugging */
-					uhci_show_qh(uhci, urbp->qh, errbuf,
+					universal_host_controller_interface_show_qh(universal_host_controller_interface, urbp->qh, errbuf,
 						ERRBUF_LEN - EXTRA_SPACE, 0);
 					lprintk(errbuf);
 				}
 			}
 
 		/* Did we receive a short packet? */
-		} else if (len < uhci_expected_length(td_token(uhci, td))) {
+		} else if (len < universal_host_controller_interface_expected_length(td_token(universal_host_controller_interface, td))) {
 
 			/* For control transfers, go to the status TD if
 			 * this isn't already the last data TD */
@@ -1223,9 +1223,9 @@ static int uhci_result_common(struct uhci_hcd *uhci, struct urb *urb)
 				ret = 1;
 		}
 
-		uhci_remove_td_from_urbp(td);
+		universal_host_controller_interface_remove_td_from_urbp(td);
 		if (qh->post_td)
-			uhci_free_td(uhci, qh->post_td);
+			universal_host_controller_interface_free_td(universal_host_controller_interface, qh->post_td);
 		qh->post_td = td;
 
 		if (ret != 0)
@@ -1237,46 +1237,46 @@ static int uhci_result_common(struct uhci_hcd *uhci, struct urb *urb)
 	if (ret < 0) {
 		/* Note that the queue has stopped and save
 		 * the next toggle value */
-		qh->element = UHCI_PTR_TERM(uhci);
+		qh->element = UNIVERSAL_HOST_CONTROLLER_INTERFACE_PTR_TERM(universal_host_controller_interface);
 		qh->is_stopped = 1;
 		qh->needs_fixup = (qh->type != UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_CONTROL);
-		qh->initial_toggle = uhci_toggle(td_token(uhci, td)) ^
+		qh->initial_toggle = universal_host_controller_interface_toggle(td_token(universal_host_controller_interface, td)) ^
 				(ret == -EREMOTEIO);
 
 	} else		/* Short packet received */
-		ret = uhci_fixup_short_transfer(uhci, qh, urbp);
+		ret = universal_host_controller_interface_fixup_short_transfer(universal_host_controller_interface, qh, urbp);
 	return ret;
 }
 
 /*
  * Isochronous transfers
  */
-static int uhci_submit_isochronous(struct uhci_hcd *uhci, struct urb *urb,
-		struct uhci_qh *qh)
+static int universal_host_controller_interface_submit_isochronous(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb,
+		struct universal_host_controller_interface_qh *qh)
 {
-	struct uhci_td *td = NULL;	/* Since urb->number_of_packets > 0 */
+	struct universal_host_controller_interface_td *td = NULL;	/* Since urb->number_of_packets > 0 */
 	int i;
 	unsigned frame, next;
 	unsigned long destination, status;
 	struct urb_priv *urbp = (struct urb_priv *) urb->hcpriv;
 
 	/* Values must not be too big (could overflow below) */
-	if (urb->interval >= UHCI_NUMFRAMES ||
-			urb->number_of_packets >= UHCI_NUMFRAMES)
+	if (urb->interval >= UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES ||
+			urb->number_of_packets >= UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES)
 		return -EFBIG;
 
-	uhci_get_current_frame_number(uhci);
+	universal_host_controller_interface_get_current_frame_number(universal_host_controller_interface);
 
 	/* Check the period and figure out the starting frame number */
 	if (!qh->bandwidth_reserved) {
 		qh->period = urb->interval;
 		qh->phase = -1;		/* Find the best phase */
-		i = uhci_check_bandwidth(uhci, qh);
+		i = universal_host_controller_interface_check_bandwidth(universal_host_controller_interface, qh);
 		if (i)
 			return i;
 
 		/* Allow a little time to allocate the TDs */
-		next = uhci->frame_number + 10;
+		next = universal_host_controller_interface->frame_number + 10;
 		frame = qh->phase;
 
 		/* Round up to the first available slot */
@@ -1286,7 +1286,7 @@ static int uhci_submit_isochronous(struct uhci_hcd *uhci, struct urb *urb,
 		return -EINVAL;		/* Can't change the period */
 
 	} else {
-		next = uhci->frame_number + 1;
+		next = universal_host_controller_interface->frame_number + 1;
 
 		/* Find the next unused frame */
 		if (list_empty(&qh->queue)) {
@@ -1302,7 +1302,7 @@ static int uhci_submit_isochronous(struct uhci_hcd *uhci, struct urb *urb,
 		}
 
 		/* Fell behind? */
-		if (!uhci_frame_before_eq(next, frame)) {
+		if (!universal_host_controller_interface_frame_before_eq(next, frame)) {
 
 			/* UNIVERSAL_SERIAL_BUS_ISO_ASAP: Round up to the first available slot */
 			if (urb->transfer_flags & URB_ISO_ASAP)
@@ -1313,10 +1313,10 @@ static int uhci_submit_isochronous(struct uhci_hcd *uhci, struct urb *urb,
 			 * Not ASAP: Use the next slot in the stream,
 			 * no matter what.
 			 */
-			else if (!uhci_frame_before_eq(next,
+			else if (!universal_host_controller_interface_frame_before_eq(next,
 					frame + (urb->number_of_packets - 1) *
 						qh->period))
-				dev_dbg(uhci_dev(uhci), "iso underrun %p (%u+%u < %u)\n",
+				dev_dbg(universal_host_controller_interface_dev(universal_host_controller_interface), "iso underrun %p (%u+%u < %u)\n",
 						urb, frame,
 						(urb->number_of_packets - 1) *
 							qh->period,
@@ -1325,7 +1325,7 @@ static int uhci_submit_isochronous(struct uhci_hcd *uhci, struct urb *urb,
 	}
 
 	/* Make sure we won't have to go too far into the future */
-	if (uhci_frame_before_eq(uhci->last_iso_frame + UHCI_NUMFRAMES,
+	if (universal_host_controller_interface_frame_before_eq(universal_host_controller_interface->last_iso_frame + UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUMFRAMES,
 			frame + urb->number_of_packets * urb->interval))
 		return -EFBIG;
 	urb->start_frame = frame;
@@ -1334,24 +1334,24 @@ static int uhci_submit_isochronous(struct uhci_hcd *uhci, struct urb *urb,
 	destination = (urb->pipe & PIPE_DEVEP_MASK) | universal_serial_bus_packetid(urb->pipe);
 
 	for (i = 0; i < urb->number_of_packets; i++) {
-		td = uhci_alloc_td(uhci);
+		td = universal_host_controller_interface_alloc_td(universal_host_controller_interface);
 		if (!td)
 			return -ENOMEM;
 
-		uhci_add_td_to_urbp(td, urbp);
-		uhci_fill_td(uhci, td, status, destination |
-				uhci_explen(urb->iso_frame_desc[i].length),
+		universal_host_controller_interface_add_td_to_urbp(td, urbp);
+		universal_host_controller_interface_fill_td(universal_host_controller_interface, td, status, destination |
+				universal_host_controller_interface_explen(urb->iso_frame_desc[i].length),
 				urb->transfer_dma +
 					urb->iso_frame_desc[i].offset);
 	}
 
 	/* Set the interrupt-on-completion flag on the last packet. */
-	td->status |= cpu_to_hc32(uhci, TD_CTRL_IOC);
+	td->status |= cpu_to_hc32(universal_host_controller_interface, TD_CTRL_IOC);
 
 	/* Add the TDs to the frame list */
 	frame = urb->start_frame;
 	list_for_each_entry(td, &urbp->td_list, list) {
-		uhci_insert_td_in_frame_list(uhci, td, frame);
+		universal_host_controller_interface_insert_td_in_frame_list(universal_host_controller_interface, td, frame);
 		frame += qh->period;
 	}
 
@@ -1362,33 +1362,33 @@ static int uhci_submit_isochronous(struct uhci_hcd *uhci, struct urb *urb,
 
 	qh->skel = SKEL_ISO;
 	if (!qh->bandwidth_reserved)
-		uhci_reserve_bandwidth(uhci, qh);
+		universal_host_controller_interface_reserve_bandwidth(universal_host_controller_interface, qh);
 	return 0;
 }
 
-static int uhci_result_isochronous(struct uhci_hcd *uhci, struct urb *urb)
+static int universal_host_controller_interface_result_isochronous(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct urb *urb)
 {
-	struct uhci_td *td, *tmp;
+	struct universal_host_controller_interface_td *td, *tmp;
 	struct urb_priv *urbp = urb->hcpriv;
-	struct uhci_qh *qh = urbp->qh;
+	struct universal_host_controller_interface_qh *qh = urbp->qh;
 
 	list_for_each_entry_safe(td, tmp, &urbp->td_list, list) {
 		unsigned int ctrlstat;
 		int status;
 		int actlength;
 
-		if (uhci_frame_before_eq(uhci->cur_iso_frame, qh->iso_frame))
+		if (universal_host_controller_interface_frame_before_eq(universal_host_controller_interface->cur_iso_frame, qh->iso_frame))
 			return -EINPROGRESS;
 
-		uhci_remove_tds_from_frame(uhci, qh->iso_frame);
+		universal_host_controller_interface_remove_tds_from_frame(universal_host_controller_interface, qh->iso_frame);
 
-		ctrlstat = td_status(uhci, td);
+		ctrlstat = td_status(universal_host_controller_interface, td);
 		if (ctrlstat & TD_CTRL_ACTIVE) {
 			status = -EXDEV;	/* TD was added too late? */
 		} else {
-			status = uhci_map_status(uhci_status_bits(ctrlstat),
+			status = universal_host_controller_interface_map_status(universal_host_controller_interface_status_bits(ctrlstat),
 					universal_serial_bus_pipeout(urb->pipe));
-			actlength = uhci_actual_length(ctrlstat);
+			actlength = universal_host_controller_interface_actual_length(ctrlstat);
 
 			urb->actual_length += actlength;
 			qh->iso_packet_desc->actual_length = actlength;
@@ -1397,38 +1397,38 @@ static int uhci_result_isochronous(struct uhci_hcd *uhci, struct urb *urb)
 		if (status)
 			urb->error_count++;
 
-		uhci_remove_td_from_urbp(td);
-		uhci_free_td(uhci, td);
+		universal_host_controller_interface_remove_td_from_urbp(td);
+		universal_host_controller_interface_free_td(universal_host_controller_interface, td);
 		qh->iso_frame += qh->period;
 		++qh->iso_packet_desc;
 	}
 	return 0;
 }
 
-static int uhci_urb_enqueue(struct universal_serial_bus_hcd *hcd,
+static int universal_host_controller_interface_urb_enqueue(struct universal_serial_bus_hcd *hcd,
 		struct urb *urb, gfp_t mem_flags)
 {
 	int ret;
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	unsigned long flags;
 	struct urb_priv *urbp;
-	struct uhci_qh *qh;
+	struct universal_host_controller_interface_qh *qh;
 
-	spin_lock_irqsave(&uhci->lock, flags);
+	spin_lock_irqsave(&universal_host_controller_interface->lock, flags);
 
 	ret = universal_serial_bus_hcd_link_urb_to_ep(hcd, urb);
 	if (ret)
 		goto done_not_linked;
 
 	ret = -ENOMEM;
-	urbp = uhci_alloc_urb_priv(uhci, urb);
+	urbp = universal_host_controller_interface_alloc_urb_priv(universal_host_controller_interface, urb);
 	if (!urbp)
 		goto done;
 
 	if (urb->ep->hcpriv)
 		qh = urb->ep->hcpriv;
 	else {
-		qh = uhci_alloc_qh(uhci, urb->dev, urb->ep);
+		qh = universal_host_controller_interface_alloc_qh(universal_host_controller_interface, urb->dev, urb->ep);
 		if (!qh)
 			goto err_no_qh;
 	}
@@ -1436,17 +1436,17 @@ static int uhci_urb_enqueue(struct universal_serial_bus_hcd *hcd,
 
 	switch (qh->type) {
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_CONTROL:
-		ret = uhci_submit_control(uhci, urb, qh);
+		ret = universal_host_controller_interface_submit_control(universal_host_controller_interface, urb, qh);
 		break;
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_BULK:
-		ret = uhci_submit_bulk(uhci, urb, qh);
+		ret = universal_host_controller_interface_submit_bulk(universal_host_controller_interface, urb, qh);
 		break;
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_INT:
-		ret = uhci_submit_interrupt(uhci, urb, qh);
+		ret = universal_host_controller_interface_submit_interrupt(universal_host_controller_interface, urb, qh);
 		break;
 	case UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC:
 		urb->error_count = 0;
-		ret = uhci_submit_isochronous(uhci, urb, qh);
+		ret = universal_host_controller_interface_submit_isochronous(universal_host_controller_interface, urb, qh);
 		break;
 	}
 	if (ret != 0)
@@ -1460,32 +1460,32 @@ static int uhci_urb_enqueue(struct universal_serial_bus_hcd *hcd,
 	 * become idle, so we can activate it right away.  But only if the
 	 * queue isn't stopped. */
 	if (qh->queue.next == &urbp->node && !qh->is_stopped) {
-		uhci_activate_qh(uhci, qh);
-		uhci_urbp_wants_fsbr(uhci, urbp);
+		universal_host_controller_interface_activate_qh(universal_host_controller_interface, qh);
+		universal_host_controller_interface_urbp_wants_fsbr(universal_host_controller_interface, urbp);
 	}
 	goto done;
 
 err_submit_failed:
 	if (qh->state == QH_STATE_IDLE)
-		uhci_make_qh_idle(uhci, qh);	/* Reclaim unused QH */
+		universal_host_controller_interface_make_qh_idle(universal_host_controller_interface, qh);	/* Reclaim unused QH */
 err_no_qh:
-	uhci_free_urb_priv(uhci, urbp);
+	universal_host_controller_interface_free_urb_priv(universal_host_controller_interface, urbp);
 done:
 	if (ret)
 		universal_serial_bus_hcd_unlink_urb_from_ep(hcd, urb);
 done_not_linked:
-	spin_unlock_irqrestore(&uhci->lock, flags);
+	spin_unlock_irqrestore(&universal_host_controller_interface->lock, flags);
 	return ret;
 }
 
-static int uhci_urb_dequeue(struct universal_serial_bus_hcd *hcd, struct urb *urb, int status)
+static int universal_host_controller_interface_urb_dequeue(struct universal_serial_bus_hcd *hcd, struct urb *urb, int status)
 {
-	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
+	struct universal_host_controller_interface_hcd *universal_host_controller_interface = hcd_to_universal_host_controller_interface(hcd);
 	unsigned long flags;
-	struct uhci_qh *qh;
+	struct universal_host_controller_interface_qh *qh;
 	int rc;
 
-	spin_lock_irqsave(&uhci->lock, flags);
+	spin_lock_irqsave(&universal_host_controller_interface->lock, flags);
 	rc = universal_serial_bus_hcd_check_unlink_urb(hcd, urb, status);
 	if (rc)
 		goto done;
@@ -1494,29 +1494,29 @@ static int uhci_urb_dequeue(struct universal_serial_bus_hcd *hcd, struct urb *ur
 
 	/* Remove Isochronous TDs from the frame list ASAP */
 	if (qh->type == UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC) {
-		uhci_unlink_isochronous_tds(uhci, urb);
+		universal_host_controller_interface_unlink_isochronous_tds(universal_host_controller_interface, urb);
 		mb();
 
 		/* If the URB has already started, update the QH unlink time */
-		uhci_get_current_frame_number(uhci);
-		if (uhci_frame_before_eq(urb->start_frame, uhci->frame_number))
-			qh->unlink_frame = uhci->frame_number;
+		universal_host_controller_interface_get_current_frame_number(universal_host_controller_interface);
+		if (universal_host_controller_interface_frame_before_eq(urb->start_frame, universal_host_controller_interface->frame_number))
+			qh->unlink_frame = universal_host_controller_interface->frame_number;
 	}
 
-	uhci_unlink_qh(uhci, qh);
+	universal_host_controller_interface_unlink_qh(universal_host_controller_interface, qh);
 
 done:
-	spin_unlock_irqrestore(&uhci->lock, flags);
+	spin_unlock_irqrestore(&universal_host_controller_interface->lock, flags);
 	return rc;
 }
 
 /*
  * Finish unlinking an URB and give it back
  */
-static void uhci_giveback_urb(struct uhci_hcd *uhci, struct uhci_qh *qh,
+static void universal_host_controller_interface_giveback_urb(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh,
 		struct urb *urb, int status)
-__releases(uhci->lock)
-__acquires(uhci->lock)
+__releases(universal_host_controller_interface->lock)
+__acquires(universal_host_controller_interface->lock)
 {
 	struct urb_priv *urbp = (struct urb_priv *) urb->hcpriv;
 
@@ -1549,19 +1549,19 @@ __acquires(uhci->lock)
 		qh->needs_fixup = 0;
 	}
 
-	uhci_free_urb_priv(uhci, urbp);
-	universal_serial_bus_hcd_unlink_urb_from_ep(uhci_to_hcd(uhci), urb);
+	universal_host_controller_interface_free_urb_priv(universal_host_controller_interface, urbp);
+	universal_serial_bus_hcd_unlink_urb_from_ep(universal_host_controller_interface_to_hcd(universal_host_controller_interface), urb);
 
-	spin_unlock(&uhci->lock);
-	universal_serial_bus_hcd_giveback_urb(uhci_to_hcd(uhci), urb, status);
-	spin_lock(&uhci->lock);
+	spin_unlock(&universal_host_controller_interface->lock);
+	universal_serial_bus_hcd_giveback_urb(universal_host_controller_interface_to_hcd(universal_host_controller_interface), urb, status);
+	spin_lock(&universal_host_controller_interface->lock);
 
 	/* If the queue is now empty, we can unlink the QH and give up its
 	 * reserved bandwidth. */
 	if (list_empty(&qh->queue)) {
-		uhci_unlink_qh(uhci, qh);
+		universal_host_controller_interface_unlink_qh(universal_host_controller_interface, qh);
 		if (qh->bandwidth_reserved)
-			uhci_release_bandwidth(uhci, qh);
+			universal_host_controller_interface_release_bandwidth(universal_host_controller_interface, qh);
 	}
 }
 
@@ -1570,9 +1570,9 @@ __acquires(uhci->lock)
  */
 #define QH_FINISHED_UNLINKING(qh)			\
 		(qh->state == QH_STATE_UNLINKING &&	\
-		uhci->frame_number + uhci->is_stopped != qh->unlink_frame)
+		universal_host_controller_interface->frame_number + universal_host_controller_interface->is_stopped != qh->unlink_frame)
 
-static void uhci_scan_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static void universal_host_controller_interface_scan_qh(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	struct urb_priv *urbp;
 	struct urb *urb;
@@ -1583,9 +1583,9 @@ static void uhci_scan_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
 		urb = urbp->urb;
 
 		if (qh->type == UNIVERSAL_SERIAL_BUS_ENDPOINT_XFER_ISOC)
-			status = uhci_result_isochronous(uhci, urb);
+			status = universal_host_controller_interface_result_isochronous(universal_host_controller_interface, urb);
 		else
-			status = uhci_result_common(uhci, urb);
+			status = universal_host_controller_interface_result_common(universal_host_controller_interface, urb);
 		if (status == -EINPROGRESS)
 			break;
 
@@ -1598,7 +1598,7 @@ static void uhci_scan_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
 				return;
 		}
 
-		uhci_giveback_urb(uhci, qh, urb, status);
+		universal_host_controller_interface_giveback_urb(universal_host_controller_interface, qh, urb, status);
 		if (status < 0)
 			break;
 	}
@@ -1619,11 +1619,11 @@ static void uhci_scan_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
 			/* Fix up the TD links and save the toggles for
 			 * non-Isochronous queues.  For Isochronous queues,
 			 * test for too-recent dequeues. */
-			if (!uhci_cleanup_queue(uhci, qh, urb)) {
+			if (!universal_host_controller_interface_cleanup_queue(universal_host_controller_interface, qh, urb)) {
 				qh->is_stopped = 0;
 				return;
 			}
-			uhci_giveback_urb(uhci, qh, urb, 0);
+			universal_host_controller_interface_giveback_urb(universal_host_controller_interface, qh, urb, 0);
 			goto restart;
 		}
 	}
@@ -1633,26 +1633,26 @@ static void uhci_scan_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
 	 * queue, the QH can now be re-activated. */
 	if (!list_empty(&qh->queue)) {
 		if (qh->needs_fixup)
-			uhci_fixup_toggles(uhci, qh, 0);
+			universal_host_controller_interface_fixup_toggles(universal_host_controller_interface, qh, 0);
 
 		/* If the first URB on the queue wants FSBR but its time
 		 * limit has expired, set the next TD to interrupt on
 		 * completion before reactivating the QH. */
 		urbp = list_entry(qh->queue.next, struct urb_priv, node);
 		if (urbp->fsbr && qh->wait_expired) {
-			struct uhci_td *td = list_entry(urbp->td_list.next,
-					struct uhci_td, list);
+			struct universal_host_controller_interface_td *td = list_entry(urbp->td_list.next,
+					struct universal_host_controller_interface_td, list);
 
-			td->status |= cpu_to_hc32(uhci, TD_CTRL_IOC);
+			td->status |= cpu_to_hc32(universal_host_controller_interface, TD_CTRL_IOC);
 		}
 
-		uhci_activate_qh(uhci, qh);
+		universal_host_controller_interface_activate_qh(universal_host_controller_interface, qh);
 	}
 
 	/* The queue is empty.  The QH can become idle if it is fully
 	 * unlinked. */
 	else if (QH_FINISHED_UNLINKING(qh))
-		uhci_make_qh_idle(uhci, qh);
+		universal_host_controller_interface_make_qh_idle(universal_host_controller_interface, qh);
 }
 
 /*
@@ -1665,10 +1665,10 @@ static void uhci_scan_qh(struct uhci_hcd *uhci, struct uhci_qh *qh)
  * stuck on the inactive completed TD.  We detect such cases and advance
  * the element pointer by hand.
  */
-static int uhci_advance_check(struct uhci_hcd *uhci, struct uhci_qh *qh)
+static int universal_host_controller_interface_advance_check(struct universal_host_controller_interface_hcd *universal_host_controller_interface, struct universal_host_controller_interface_qh *qh)
 {
 	struct urb_priv *urbp = NULL;
-	struct uhci_td *td;
+	struct universal_host_controller_interface_td *td;
 	int ret = 1;
 	unsigned status;
 
@@ -1689,8 +1689,8 @@ static int uhci_advance_check(struct uhci_hcd *uhci, struct uhci_qh *qh)
 
 	} else {
 		urbp = list_entry(qh->queue.next, struct urb_priv, node);
-		td = list_entry(urbp->td_list.next, struct uhci_td, list);
-		status = td_status(uhci, td);
+		td = list_entry(urbp->td_list.next, struct universal_host_controller_interface_td, list);
+		status = td_status(universal_host_controller_interface, td);
 		if (!(status & TD_CTRL_ACTIVE)) {
 
 			/* We're okay, the queue has advanced */
@@ -1698,7 +1698,7 @@ static int uhci_advance_check(struct uhci_hcd *uhci, struct uhci_qh *qh)
 			qh->advance_jiffies = jiffies;
 			goto done;
 		}
-		ret = uhci->is_stopped;
+		ret = universal_host_controller_interface->is_stopped;
 	}
 
 	/* The queue hasn't advanced; check for timeout */
@@ -1709,7 +1709,7 @@ static int uhci_advance_check(struct uhci_hcd *uhci, struct uhci_qh *qh)
 
 		/* Detect the Intel bug and work around it */
 		if (qh->post_td && qh_element(qh) ==
-			LINK_TO_TD(uhci, qh->post_td)) {
+			LINK_TO_TD(universal_host_controller_interface, qh->post_td)) {
 			qh->element = qh->post_td->link;
 			qh->advance_jiffies = jiffies;
 			ret = 1;
@@ -1723,12 +1723,12 @@ static int uhci_advance_check(struct uhci_hcd *uhci, struct uhci_qh *qh)
 		 * completion.  That way we'll know as soon as the queue
 		 * starts moving again. */
 		if (urbp && urbp->fsbr && !(status & TD_CTRL_IOC))
-			uhci_unlink_qh(uhci, qh);
+			universal_host_controller_interface_unlink_qh(universal_host_controller_interface, qh);
 
 	} else {
 		/* Unmoving but not-yet-expired queues keep FSBR alive */
 		if (urbp)
-			uhci_urbp_wants_fsbr(uhci, urbp);
+			universal_host_controller_interface_urbp_wants_fsbr(universal_host_controller_interface, urbp);
 	}
 
 done:
@@ -1738,56 +1738,56 @@ static int uhci_advance_check(struct uhci_hcd *uhci, struct uhci_qh *qh)
 /*
  * Process events in the schedule, but only in one thread at a time
  */
-static void uhci_scan_schedule(struct uhci_hcd *uhci)
+static void universal_host_controller_interface_scan_schedule(struct universal_host_controller_interface_hcd *universal_host_controller_interface)
 {
 	int i;
-	struct uhci_qh *qh;
+	struct universal_host_controller_interface_qh *qh;
 
 	/* Don't allow re-entrant calls */
-	if (uhci->scan_in_progress) {
-		uhci->need_rescan = 1;
+	if (universal_host_controller_interface->scan_in_progress) {
+		universal_host_controller_interface->need_rescan = 1;
 		return;
 	}
-	uhci->scan_in_progress = 1;
+	universal_host_controller_interface->scan_in_progress = 1;
 rescan:
-	uhci->need_rescan = 0;
-	uhci->fsbr_is_wanted = 0;
+	universal_host_controller_interface->need_rescan = 0;
+	universal_host_controller_interface->fsbr_is_wanted = 0;
 
-	uhci_clear_next_interrupt(uhci);
-	uhci_get_current_frame_number(uhci);
-	uhci->cur_iso_frame = uhci->frame_number;
+	universal_host_controller_interface_clear_next_interrupt(universal_host_controller_interface);
+	universal_host_controller_interface_get_current_frame_number(universal_host_controller_interface);
+	universal_host_controller_interface->cur_iso_frame = universal_host_controller_interface->frame_number;
 
 	/* Go through all the QH queues and process the URBs in each one */
-	for (i = 0; i < UHCI_NUM_SKELQH - 1; ++i) {
-		uhci->next_qh = list_entry(uhci->skelqh[i]->node.next,
-				struct uhci_qh, node);
-		while ((qh = uhci->next_qh) != uhci->skelqh[i]) {
-			uhci->next_qh = list_entry(qh->node.next,
-					struct uhci_qh, node);
-
-			if (uhci_advance_check(uhci, qh)) {
-				uhci_scan_qh(uhci, qh);
+	for (i = 0; i < UNIVERSAL_HOST_CONTROLLER_INTERFACE_NUM_SKELQH - 1; ++i) {
+		universal_host_controller_interface->next_qh = list_entry(universal_host_controller_interface->skelqh[i]->node.next,
+				struct universal_host_controller_interface_qh, node);
+		while ((qh = universal_host_controller_interface->next_qh) != universal_host_controller_interface->skelqh[i]) {
+			universal_host_controller_interface->next_qh = list_entry(qh->node.next,
+					struct universal_host_controller_interface_qh, node);
+
+			if (universal_host_controller_interface_advance_check(universal_host_controller_interface, qh)) {
+				universal_host_controller_interface_scan_qh(universal_host_controller_interface, qh);
 				if (qh->state == QH_STATE_ACTIVE) {
-					uhci_urbp_wants_fsbr(uhci,
+					universal_host_controller_interface_urbp_wants_fsbr(universal_host_controller_interface,
 	list_entry(qh->queue.next, struct urb_priv, node));
 				}
 			}
 		}
 	}
 
-	uhci->last_iso_frame = uhci->cur_iso_frame;
-	if (uhci->need_rescan)
+	universal_host_controller_interface->last_iso_frame = universal_host_controller_interface->cur_iso_frame;
+	if (universal_host_controller_interface->need_rescan)
 		goto rescan;
-	uhci->scan_in_progress = 0;
+	universal_host_controller_interface->scan_in_progress = 0;
 
-	if (uhci->fsbr_is_on && !uhci->fsbr_is_wanted &&
-			!uhci->fsbr_expiring) {
-		uhci->fsbr_expiring = 1;
-		mod_timer(&uhci->fsbr_timer, jiffies + FSBR_OFF_DELAY);
+	if (universal_host_controller_interface->fsbr_is_on && !universal_host_controller_interface->fsbr_is_wanted &&
+			!universal_host_controller_interface->fsbr_expiring) {
+		universal_host_controller_interface->fsbr_expiring = 1;
+		mod_timer(&universal_host_controller_interface->fsbr_timer, jiffies + FSBR_OFF_DELAY);
 	}
 
-	if (list_empty(&uhci->skel_unlink_qh->node))
-		uhci_clear_next_interrupt(uhci);
+	if (list_empty(&universal_host_controller_interface->skel_unlink_qh->node))
+		universal_host_controller_interface_clear_next_interrupt(universal_host_controller_interface);
 	else
-		uhci_set_next_interrupt(uhci);
+		universal_host_controller_interface_set_next_interrupt(universal_host_controller_interface);
 }
diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ba01b8214cf0..83d2c2d7e6a7 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1934,7 +1934,7 @@ static int xhci_td_cleanup(struct xhci_hcd *xhci, struct xhci_td *td,
 				 urb, urb->actual_length,
 				 urb->transfer_buffer_length, *status);
 
-		/* set isoc urb status to 0 just as EHCI, UHCI, and OPEN_HOST_CONTROLLER_INTERFACE */
+		/* set isoc urb status to 0 just as EHCI, UNIVERSAL_HOST_CONTROLLER_INTERFACE, and OPEN_HOST_CONTROLLER_INTERFACE */
 		if (universal_serial_bus_pipetype(urb->pipe) == PIPE_ISOCHRONOUS)
 			*status = 0;
 		xhci_giveback_urb_in_irq(xhci, td, *status);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index c9c0879a959d..c095cfb09f81 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5143,7 +5143,7 @@ int xhci_gen_setup(struct universal_serial_bus_hcd *hcd, xhci_get_quirks_t get_q
 		hcd->self.root_hub->speed = UNIVERSAL_SERIAL_BUS_SPEED_HIGH;
 		/*
 		 * UNIVERSAL_SERIAL_BUS 2.0 roothub under xHCI has an integrated TT,
-		 * (rate matching hub) as opposed to having an OPEN_HOST_CONTROLLER_INTERFACE/UHCI
+		 * (rate matching hub) as opposed to having an OPEN_HOST_CONTROLLER_INTERFACE/UNIVERSAL_HOST_CONTROLLER_INTERFACE
 		 * companion controller.
 		 */
 		hcd->has_tt = 1;
diff --git a/drivers/usb/misc/legousbtower.c b/drivers/usb/misc/legousbtower.c
index b2764603149b..1c3b4d2a4900 100644
--- a/drivers/usb/misc/legousbtower.c
+++ b/drivers/usb/misc/legousbtower.c
@@ -22,7 +22,7 @@
  *   - set IR mode by default (by oversight 0.4 set VLL mode)
  * 2002-01-11 - 0.5? pcchan
  *   - make read buffer reusable and work around bytes_to_write issue between
- *     uhci and leguniversal_serial_bustower
+ *     universal_host_controller_interface and leguniversal_serial_bustower
  * 2002-09-23 - 0.52 david (david@csse.uwa.edu.au)
  *   - imported into lejos project
  *   - changed wake_up to wake_up_interruptible
diff --git a/drivers/usb/usbip/usbip_common.h b/drivers/usb/usbip/usbip_common.h
index 72b3e70dc163..b2f1c4b87c49 100644
--- a/drivers/usb/usbip/usbip_common.h
+++ b/drivers/usb/usbip/usbip_common.h
@@ -123,8 +123,8 @@ extern struct device_attribute dev_attr_universal_serial_busip_debug;
 
 /*
  * Arbitrary limit for the maximum number of isochronous packets in an URB,
- * compare for example the uhci_submit_isochronous function in
- * drivers/universal_serial_bus/host/uhci-q.c
+ * compare for example the universal_host_controller_interface_submit_isochronous function in
+ * drivers/universal_serial_bus/host/universal_host_controller_interface-q.c
  */
 #define UNIVERSAL_SERIAL_BUSIP_MAX_ISO_PACKETS 1024
 
-- 
2.26.0

