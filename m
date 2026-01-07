Return-Path: <linux-usb+bounces-32011-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87599CFF12F
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 18:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98097315D695
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 16:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009C434DB46;
	Wed,  7 Jan 2026 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kgkIYNdE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F8834C81F;
	Wed,  7 Jan 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799545; cv=none; b=BbX2dyEZ304Nbfoq/Dxg7dROp2BWpW3YKHS7sN4QCR6Ovf8yVI11pIByxomsp6n2ZY5/x8XWe8bLqUZuJHBjIdDhWKxwnCEn46TJpzmsOa/0SUbEHBPsRMafno51PTIq3ESm589Xz7ANpCRZeqQWcmWkwFoEcZV5XctdIH2m/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799545; c=relaxed/simple;
	bh=ggmBg80JnZ2x/AW3qKzvOyx9RbkjHwdHwiy+ZrpQC+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lx2MOQS5dvT4CWw9Xeocg90GTZ+uIjSTuKa/Ueh1WhPmzwGJesJFN5GvGytA6MisaClf9bEweZvIcLOyrO/WXB/OwgPw14d2vy8KPa30uIGs44YRLcsjQXaGDfUdIU6P391C15V/dgqbTRUN9UnUZTcAo3ZKuQN6+HQU+YI575E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kgkIYNdE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A8CC4CEF1;
	Wed,  7 Jan 2026 15:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767799545;
	bh=ggmBg80JnZ2x/AW3qKzvOyx9RbkjHwdHwiy+ZrpQC+4=;
	h=From:To:Cc:Subject:Date:From;
	b=kgkIYNdEZ6paLZviuho5A9ukqrPEm9Frryu75TX7i10MALVJBcRR05yeA65jildYy
	 kugw8G/Js6oMLLzh7HD9gPGO3CRiu9SkrxXQDrXBybUyeVoU/eNtbPCVaCdwdtozSG
	 /hoQ+O05IVo2uyK0FPjtaLNsgeTcTMM8XnPEyeDI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH] USB: HCD: remove logic about which hcd is loaded
Date: Wed,  7 Jan 2026 16:25:40 +0100
Message-ID: <2026010739-diffuser-shelter-e31c@gregkh>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 168
X-Developer-Signature: v=1; a=openpgp-sha256; l=5914; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=ggmBg80JnZ2x/AW3qKzvOyx9RbkjHwdHwiy+ZrpQC+4=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlxVZ+ZXKZ+MhfwPdL/Um5XTIafImPI/5ad6zgPsL1Jl L7h63+3I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACayRIlhQb//7NKIvwkNvteu M4se1QpbI8b4mWFBj9a3ul+FBcx+Bnp1618/muzcXGkAAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

It turns out that warning about which USB host controller is loaded
before another one doesn't really matter.  All that really is needed is
the PCI softdep module loading logic, which has been present in the
kernel ever since commit 05c92da0c524 ("usb: ohci/uhci - add soft
dependencies on ehci_pci")

So remove the warning messages, they are not useful, not needed, and
only confuse people.  As can be seen in the discussion at
https://lore.kernel.org/r/20251230080014.3934590-1-chenhuacai@loongson.cn

Cc: Huacai Chen <chenhuacai@loongson.cn>
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/hcd.c            | 4 ----
 drivers/usb/fotg210/fotg210-hcd.c | 6 ------
 drivers/usb/host/ehci-hcd.c       | 8 --------
 drivers/usb/host/ohci-hcd.c       | 3 ---
 drivers/usb/host/uhci-hcd.c       | 5 -----
 include/linux/usb/hcd.h           | 6 ------
 6 files changed, 32 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 24feb0de1c00..2d99a59d9f3f 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -77,10 +77,6 @@
 
 /*-------------------------------------------------------------------------*/
 
-/* Keep track of which host controller drivers are loaded */
-unsigned long usb_hcds_loaded;
-EXPORT_SYMBOL_GPL(usb_hcds_loaded);
-
 /* host controllers we manage */
 DEFINE_IDR (usb_bus_idr);
 EXPORT_SYMBOL_GPL (usb_bus_idr);
diff --git a/drivers/usb/fotg210/fotg210-hcd.c b/drivers/usb/fotg210/fotg210-hcd.c
index 64c4965a160f..fbb5d590eab6 100644
--- a/drivers/usb/fotg210/fotg210-hcd.c
+++ b/drivers/usb/fotg210/fotg210-hcd.c
@@ -5625,11 +5625,6 @@ int __init fotg210_hcd_init(void)
 	if (usb_disabled())
 		return -ENODEV;
 
-	set_bit(USB_EHCI_LOADED, &usb_hcds_loaded);
-	if (test_bit(USB_UHCI_LOADED, &usb_hcds_loaded) ||
-			test_bit(USB_OHCI_LOADED, &usb_hcds_loaded))
-		pr_warn("Warning! fotg210_hcd should always be loaded before uhci_hcd and ohci_hcd, not after\n");
-
 	pr_debug("%s: block sizes: qh %zd qtd %zd itd %zd\n",
 			hcd_name, sizeof(struct fotg210_qh),
 			sizeof(struct fotg210_qtd),
@@ -5643,5 +5638,4 @@ int __init fotg210_hcd_init(void)
 void __exit fotg210_hcd_cleanup(void)
 {
 	debugfs_remove(fotg210_debug_root);
-	clear_bit(USB_EHCI_LOADED, &usb_hcds_loaded);
 }
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 6d1d190c914d..3c46bb18c7f3 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1354,12 +1354,6 @@ static int __init ehci_hcd_init(void)
 	if (usb_disabled())
 		return -ENODEV;
 
-	set_bit(USB_EHCI_LOADED, &usb_hcds_loaded);
-	if (test_bit(USB_UHCI_LOADED, &usb_hcds_loaded) ||
-			test_bit(USB_OHCI_LOADED, &usb_hcds_loaded))
-		printk(KERN_WARNING "Warning! ehci_hcd should always be loaded"
-				" before uhci_hcd and ohci_hcd, not after\n");
-
 	pr_debug("%s: block sizes: qh %zd qtd %zd itd %zd sitd %zd\n",
 		 hcd_name,
 		 sizeof(struct ehci_qh), sizeof(struct ehci_qtd),
@@ -1390,7 +1384,6 @@ static int __init ehci_hcd_init(void)
 	debugfs_remove(ehci_debug_root);
 	ehci_debug_root = NULL;
 #endif
-	clear_bit(USB_EHCI_LOADED, &usb_hcds_loaded);
 	return retval;
 }
 module_init(ehci_hcd_init);
@@ -1404,6 +1397,5 @@ static void __exit ehci_hcd_cleanup(void)
 #ifdef CONFIG_DYNAMIC_DEBUG
 	debugfs_remove(ehci_debug_root);
 #endif
-	clear_bit(USB_EHCI_LOADED, &usb_hcds_loaded);
 }
 module_exit(ehci_hcd_cleanup);
diff --git a/drivers/usb/host/ohci-hcd.c b/drivers/usb/host/ohci-hcd.c
index 9c7f3008646e..30840922f729 100644
--- a/drivers/usb/host/ohci-hcd.c
+++ b/drivers/usb/host/ohci-hcd.c
@@ -1282,7 +1282,6 @@ static int __init ohci_hcd_mod_init(void)
 
 	pr_debug ("%s: block sizes: ed %zd td %zd\n", hcd_name,
 		sizeof (struct ed), sizeof (struct td));
-	set_bit(USB_OHCI_LOADED, &usb_hcds_loaded);
 
 	ohci_debug_root = debugfs_create_dir("ohci", usb_debug_root);
 
@@ -1332,7 +1331,6 @@ static int __init ohci_hcd_mod_init(void)
 	debugfs_remove(ohci_debug_root);
 	ohci_debug_root = NULL;
 
-	clear_bit(USB_OHCI_LOADED, &usb_hcds_loaded);
 	return retval;
 }
 module_init(ohci_hcd_mod_init);
@@ -1352,7 +1350,6 @@ static void __exit ohci_hcd_mod_exit(void)
 	ps3_ohci_driver_unregister(&PS3_SYSTEM_BUS_DRIVER);
 #endif
 	debugfs_remove(ohci_debug_root);
-	clear_bit(USB_OHCI_LOADED, &usb_hcds_loaded);
 }
 module_exit(ohci_hcd_mod_exit);
 
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index 14e6dfef16c6..8bb11109b66c 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -867,8 +867,6 @@ static int __init uhci_hcd_init(void)
 	if (usb_disabled())
 		return -ENODEV;
 
-	set_bit(USB_UHCI_LOADED, &usb_hcds_loaded);
-
 #ifdef CONFIG_DYNAMIC_DEBUG
 	errbuf = kmalloc(ERRBUF_LEN, GFP_KERNEL);
 	if (!errbuf)
@@ -912,8 +910,6 @@ static int __init uhci_hcd_init(void)
 
 errbuf_failed:
 #endif
-
-	clear_bit(USB_UHCI_LOADED, &usb_hcds_loaded);
 	return retval;
 }
 
@@ -930,7 +926,6 @@ static void __exit uhci_hcd_cleanup(void)
 #ifdef CONFIG_DYNAMIC_DEBUG
 	kfree(errbuf);
 #endif
-	clear_bit(USB_UHCI_LOADED, &usb_hcds_loaded);
 }
 
 module_init(uhci_hcd_init);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index ac95e7c89df5..181db044c4d2 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -760,12 +760,6 @@ static inline void usbmon_urb_complete(struct usb_bus *bus, struct urb *urb,
  */
 extern struct rw_semaphore ehci_cf_port_reset_rwsem;
 
-/* Keep track of which host controller drivers are loaded */
-#define USB_UHCI_LOADED		0
-#define USB_OHCI_LOADED		1
-#define USB_EHCI_LOADED		2
-extern unsigned long usb_hcds_loaded;
-
 #endif /* __KERNEL__ */
 
 #endif /* __USB_CORE_HCD_H */
-- 
2.52.0


