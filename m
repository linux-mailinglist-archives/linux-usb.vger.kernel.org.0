Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C215A7DEF
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 14:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbiHaMvC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 08:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiHaMuk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 08:50:40 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FF01C109
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 05:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661950238; x=1693486238;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5fhH8vnKCAtypZwk8Zv7fpUp69Uvhsb6a6bFDDPhgRo=;
  b=CNjEMIMqDhd0850Ar6nGshP9eaaRasszhHxqMD6xmcFhs0XEzqnNUsTn
   YRCEtZKrJuURw+JMeXBLExrS3ZfYGeztCGDyeedqJaDEo+I+Yyg+JXDVq
   DC0X2xmssBOlOXgqoBWq30XNkqt1KMMbs8VF0ixhbQM0vBQrar8f+Mjcm
   sYMAqr+USfZ7AFZa/yCJ12UlVhhEKdW8IGX5Bl0P8MZvQgrh4BLfEvkpL
   RhoQL0uDWCP9VTYomjvzqXsReZzrUT7px0OeLhqeerz4Tio7xpzm1X7w5
   X7qmTHMJrsGz9EJ0A6+ZIFcJzDh5pEuPKwvy1iFbT1bKH6U/lJBlb8QL3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="381734637"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="381734637"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2022 05:50:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; 
   d="scan'208";a="754412050"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2022 05:50:37 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: hcd-pci: Drop the unused id parameter from usb_hcd_pci_probe()
Date:   Wed, 31 Aug 2022 15:50:52 +0300
Message-Id: <20220831125052.71584-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Since the HC driver is now passed to the function with its
own parameter (it used to be picked from id->driver_data),
the id parameter serves no purpose.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/core/hcd-pci.c  | 7 +------
 drivers/usb/host/ehci-pci.c | 2 +-
 drivers/usb/host/ohci-pci.c | 2 +-
 drivers/usb/host/uhci-pci.c | 2 +-
 drivers/usb/host/xhci-pci.c | 2 +-
 include/linux/usb/hcd.h     | 1 -
 6 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
index 482dae72ef1cb..9b77f49b3560c 100644
--- a/drivers/usb/core/hcd-pci.c
+++ b/drivers/usb/core/hcd-pci.c
@@ -157,7 +157,6 @@ static void ehci_wait_for_companions(struct pci_dev *pdev, struct usb_hcd *hcd,
 /**
  * usb_hcd_pci_probe - initialize PCI-based HCDs
  * @dev: USB Host Controller being probed
- * @id: pci hotplug id connecting controller to HCD framework
  * @driver: USB HC driver handle
  *
  * Context: task context, might sleep
@@ -170,8 +169,7 @@ static void ehci_wait_for_companions(struct pci_dev *pdev, struct usb_hcd *hcd,
  *
  * Return: 0 if successful.
  */
-int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id,
-		      const struct hc_driver *driver)
+int usb_hcd_pci_probe(struct pci_dev *dev, const struct hc_driver *driver)
 {
 	struct usb_hcd		*hcd;
 	int			retval;
@@ -180,9 +178,6 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id,
 	if (usb_disabled())
 		return -ENODEV;
 
-	if (!id)
-		return -EINVAL;
-
 	if (!driver)
 		return -EINVAL;
 
diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
index 9937c5a7efc2d..7d8ee7244f735 100644
--- a/drivers/usb/host/ehci-pci.c
+++ b/drivers/usb/host/ehci-pci.c
@@ -382,7 +382,7 @@ static int ehci_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	if (is_bypassed_id(pdev))
 		return -ENODEV;
-	return usb_hcd_pci_probe(pdev, id, &ehci_pci_hc_driver);
+	return usb_hcd_pci_probe(pdev, &ehci_pci_hc_driver);
 }
 
 static void ehci_pci_remove(struct pci_dev *pdev)
diff --git a/drivers/usb/host/ohci-pci.c b/drivers/usb/host/ohci-pci.c
index 41efe927d8f3f..f805e946423e1 100644
--- a/drivers/usb/host/ohci-pci.c
+++ b/drivers/usb/host/ohci-pci.c
@@ -282,7 +282,7 @@ MODULE_DEVICE_TABLE (pci, pci_ids);
 
 static int ohci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	return usb_hcd_pci_probe(dev, id, &ohci_pci_hc_driver);
+	return usb_hcd_pci_probe(dev, &ohci_pci_hc_driver);
 }
 
 /* pci driver glue; this is a "new style" PCI driver module */
diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
index 9b88745d247f5..3592f757fe05d 100644
--- a/drivers/usb/host/uhci-pci.c
+++ b/drivers/usb/host/uhci-pci.c
@@ -294,7 +294,7 @@ MODULE_DEVICE_TABLE(pci, uhci_pci_ids);
 
 static int uhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
-	return usb_hcd_pci_probe(dev, id, &uhci_driver);
+	return usb_hcd_pci_probe(dev, &uhci_driver);
 }
 
 static struct pci_driver uhci_pci_driver = {
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index dce6c0ec8d340..40228a3d77a0b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -431,7 +431,7 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 * to say USB 2.0, but I'm not sure what the implications would be in
 	 * the other parts of the HCD code.
 	 */
-	retval = usb_hcd_pci_probe(dev, id, &xhci_pci_hc_driver);
+	retval = usb_hcd_pci_probe(dev, &xhci_pci_hc_driver);
 
 	if (retval)
 		goto put_runtime_pm;
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 67f8713d3fa37..78cd566ee2380 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -479,7 +479,6 @@ static inline int ehset_single_step_set_feature(struct usb_hcd *hcd, int port)
 struct pci_dev;
 struct pci_device_id;
 extern int usb_hcd_pci_probe(struct pci_dev *dev,
-			     const struct pci_device_id *id,
 			     const struct hc_driver *driver);
 extern void usb_hcd_pci_remove(struct pci_dev *dev);
 extern void usb_hcd_pci_shutdown(struct pci_dev *dev);
-- 
2.35.1

