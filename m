Return-Path: <linux-usb+bounces-2649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 724827E4CDA
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 00:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 942A61C20991
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 23:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465143035F;
	Tue,  7 Nov 2023 23:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oBTZzYS9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FD2F85E
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 23:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F8EC433C8;
	Tue,  7 Nov 2023 23:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699399429;
	bh=QQsBk4ut56v15msTI3SKjV52RZJFC+wtnyW5/V/mzR8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oBTZzYS92GLw3/ejYjRR+1w14RTA/6gyGqLW9sFR6fdF8jINDTDugzp+XnOGOCfzb
	 JeXf3b/KVctKj/5mMzqA452N8/jncMdGJeVEryh1acTu6G7lH0fz/cKdaTD3ygVTRT
	 UmK3I2Tv4U0qwQXQJdlZrMDIjttn4Nad4uymSxQsmdSdqVbTJRbsV3kpH4MDJvBJtf
	 eXhTgCgf+Mh/8ogc8NqsjtNjvAvyFKf8DiviccTulTfSnjIyyxtGo/OG9FqbVE58qi
	 IzmrZLzaFVJzU9785aX4oMFP+hVV5ktW0FB01UkbO/KNXsjOTHojOXqD2iS4lC+Obi
	 1jWOsk18XYImg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	mathias.nyman@intel.com,
	stern@rowland.harvard.edu,
	Basavaraj.Natikar@amd.com,
	linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 6.5 09/18] usb: pci-quirks: handle HAS_IOPORT dependency for AMD quirk
Date: Tue,  7 Nov 2023 18:23:04 -0500
Message-ID: <20231107232330.3776001-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107232330.3776001-1-sashal@kernel.org>
References: <20231107232330.3776001-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.5.10
Content-Transfer-Encoding: 8bit

From: Niklas Schnelle <schnelle@linux.ibm.com>

[ Upstream commit 52e24f8c0a102ac76649c6b71224fadcc82bd5da ]

In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
not being declared. In the pci-quirks case the I/O port acceses are
used in the quirks for several AMD south bridges, Add a config option
for the AMD quirks to depend on HAS_IOPORT and #ifdef the quirk code.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
Link: https://lore.kernel.org/r/20230911125653.1393895-3-schnelle@linux.ibm.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/Kconfig           | 10 ++++++++++
 drivers/usb/core/hcd-pci.c    |  3 +--
 drivers/usb/host/pci-quirks.c |  2 ++
 drivers/usb/host/pci-quirks.h | 30 ++++++++++++++++++++++--------
 include/linux/usb/hcd.h       | 17 +++++++++++++++++
 5 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index 7f33bcc315f27..abf8c6cdea9ea 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -91,6 +91,16 @@ config USB_PCI
 	  If you have such a device you may say N here and PCI related code
 	  will not be built in the USB driver.
 
+config USB_PCI_AMD
+	bool "AMD PCI USB host support"
+	depends on USB_PCI && HAS_IOPORT
+	default X86 || MACH_LOONGSON64 || PPC_PASEMI
+	help
+	  Enable workarounds for USB implementation quirks in SB600/SB700/SB800
+	  and later south bridge implementations. These are common on x86 PCs
+	  with AMD CPUs but rarely used elsewhere, with the exception of a few
+	  powerpc and mips desktop machines.
+
 if USB
 
 source "drivers/usb/core/Kconfig"
diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 990280688b254..ee3156f495338 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -206,8 +206,7 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct hc_driver *driver)
 		goto free_irq_vectors;
 	}
 
-	hcd->amd_resume_bug = (usb_hcd_amd_remote_wakeup_quirk(dev) &&
-			driver->flags & (HCD_USB11 | HCD_USB3)) ? 1 : 0;
+	hcd->amd_resume_bug = usb_hcd_amd_resume_bug(dev, driver);
 
 	if (driver->flags & HCD_MEMORY) {
 		/* EHCI, OHCI */
diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
index 5e06fad82a228..10813096d00c6 100644
--- a/drivers/usb/host/pci-quirks.c
+++ b/drivers/usb/host/pci-quirks.c
@@ -76,6 +76,7 @@
 #define USB_INTEL_USB3_PSSEN   0xD8
 #define USB_INTEL_USB3PRM      0xDC
 
+#ifdef CONFIG_USB_PCI_AMD
 /* AMD quirk use */
 #define	AB_REG_BAR_LOW		0xe0
 #define	AB_REG_BAR_HIGH		0xe1
@@ -587,6 +588,7 @@ bool usb_amd_pt_check_port(struct device *device, int port)
 	return !(value & BIT(port_shift));
 }
 EXPORT_SYMBOL_GPL(usb_amd_pt_check_port);
+#endif /* CONFIG_USB_PCI_AMD */
 
 static int usb_asmedia_wait_write(struct pci_dev *pdev)
 {
diff --git a/drivers/usb/host/pci-quirks.h b/drivers/usb/host/pci-quirks.h
index cde2263a9d2e4..a5230b0b9e913 100644
--- a/drivers/usb/host/pci-quirks.h
+++ b/drivers/usb/host/pci-quirks.h
@@ -2,7 +2,7 @@
 #ifndef __LINUX_USB_PCI_QUIRKS_H
 #define __LINUX_USB_PCI_QUIRKS_H
 
-#ifdef CONFIG_USB_PCI
+#ifdef CONFIG_USB_PCI_AMD
 int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev);
 bool usb_amd_hang_symptom_quirk(void);
 bool usb_amd_prefetch_quirk(void);
@@ -12,23 +12,37 @@ void usb_amd_quirk_pll_disable(void);
 void usb_amd_quirk_pll_enable(void);
 void sb800_prefetch(struct device *dev, int on);
 bool usb_amd_pt_check_port(struct device *device, int port);
-
-void uhci_reset_hc(struct pci_dev *pdev, unsigned long base);
-int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base);
-void usb_asmedia_modifyflowcontrol(struct pci_dev *pdev);
-void usb_enable_intel_xhci_ports(struct pci_dev *xhci_pdev);
-void usb_disable_xhci_ports(struct pci_dev *xhci_pdev);
 #else
-struct pci_dev;
+static inline bool usb_amd_hang_symptom_quirk(void)
+{
+	return false;
+};
+static inline bool usb_amd_prefetch_quirk(void)
+{
+	return false;
+}
 static inline void usb_amd_quirk_pll_disable(void) {}
 static inline void usb_amd_quirk_pll_enable(void) {}
 static inline void usb_amd_dev_put(void) {}
+static inline bool usb_amd_quirk_pll_check(void)
+{
+	return false;
+}
 static inline void sb800_prefetch(struct device *dev, int on) {}
 static inline bool usb_amd_pt_check_port(struct device *device, int port)
 {
 	return false;
 }
+#endif /* CONFIG_USB_PCI_AMD */
 
+#ifdef CONFIG_USB_PCI
+void uhci_reset_hc(struct pci_dev *pdev, unsigned long base);
+int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base);
+void usb_asmedia_modifyflowcontrol(struct pci_dev *pdev);
+void usb_enable_intel_xhci_ports(struct pci_dev *xhci_pdev);
+void usb_disable_xhci_ports(struct pci_dev *xhci_pdev);
+#else
+struct pci_dev;
 static inline void usb_asmedia_modifyflowcontrol(struct pci_dev *pdev) {}
 static inline void usb_disable_xhci_ports(struct pci_dev *xhci_pdev) {}
 #endif  /* CONFIG_USB_PCI */
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 4e9623e8492b3..e1d6fc7e6932f 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -486,8 +486,25 @@ extern int usb_hcd_pci_probe(struct pci_dev *dev,
 extern void usb_hcd_pci_remove(struct pci_dev *dev);
 extern void usb_hcd_pci_shutdown(struct pci_dev *dev);
 
+#ifdef CONFIG_USB_PCI_AMD
 extern int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *dev);
 
+static inline bool usb_hcd_amd_resume_bug(struct pci_dev *dev,
+					  const struct hc_driver *driver)
+{
+	if (!usb_hcd_amd_remote_wakeup_quirk(dev))
+		return false;
+	if (driver->flags & (HCD_USB11 | HCD_USB3))
+		return true;
+	return false;
+}
+#else /* CONFIG_USB_PCI_AMD */
+static inline bool usb_hcd_amd_resume_bug(struct pci_dev *dev,
+					  const struct hc_driver *driver)
+{
+	return false;
+}
+#endif
 extern const struct dev_pm_ops usb_hcd_pci_pm_ops;
 #endif /* CONFIG_USB_PCI */
 
-- 
2.42.0


