Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53EE42C0E82
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 16:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389413AbgKWPLu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 10:11:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55748 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389411AbgKWPLu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 10:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606144309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LsqWP7umdoS2DWw9OeK8zXj+a59306lgFa5WjpWOyqc=;
        b=DVIuPzOSSTfmRDTSNWFjZgz2N0BhVwDd8jZBSC80BCUUkVMYursUQ83Ad//6YKy++POPts
        VDiB56ojIYss5u1MuIvTpigEpVpx3cSoN/A2NzZbaaX2zqD4Qh5Ow7j9Myx/K0uCIxSJIL
        jnZJBvXmo+KSAqXRAJGal57dhs/MUcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-M2RMHG8QMlywA9ka4yTbIQ-1; Mon, 23 Nov 2020 10:11:45 -0500
X-MC-Unique: M2RMHG8QMlywA9ka4yTbIQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 931511076023;
        Mon, 23 Nov 2020 15:11:42 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-208.ams2.redhat.com [10.36.112.208])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 75BD060864;
        Mon, 23 Nov 2020 15:11:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] xhci-pci: Allow host runtime PM as default for Intel Alpine LP
Date:   Mon, 23 Nov 2020 16:11:40 +0100
Message-Id: <20201123151140.5324-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The xhci controller on Alpine Ridge LP keeps the whole thunderbolt
controller awake if the host controller is not allowed to sleep.
This is the case even if no USB devices are connected to the host.

Add the Intel Alpine LP product-id to the list of product-ids
for which we allow runtime PM by default.

Fixes: 2815ef7fe4d4 ("xhci-pci: allow host runtime PM as default for Intel Alpine and Titan Ridge")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/host/xhci-pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index bf89172c43ca..5f94d7edeb37 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -47,6 +47,7 @@
 #define PCI_DEVICE_ID_INTEL_DNV_XHCI			0x19d0
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI	0x15b5
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI	0x15b6
+#define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_XHCI	0x15c1
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI	0x15db
 #define PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI	0x15d4
 #define PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI		0x15e9
@@ -232,6 +233,7 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
 	if (pdev->vendor == PCI_VENDOR_ID_INTEL &&
 	    (pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_2C_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_4C_XHCI ||
+	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_LP_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_2C_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_ALPINE_RIDGE_C_4C_XHCI ||
 	     pdev->device == PCI_DEVICE_ID_INTEL_TITAN_RIDGE_2C_XHCI ||
-- 
2.28.0

