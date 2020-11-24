Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69B22C22C0
	for <lists+linux-usb@lfdr.de>; Tue, 24 Nov 2020 11:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731993AbgKXKUq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Nov 2020 05:20:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48157 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731973AbgKXKUq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Nov 2020 05:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606213244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XJZSO4gS6ZSFqEGpP9RtR1iYfhTWQ6OsvHfb8UBzoO4=;
        b=Fg6jp14kE717Ho3HidOCyhKDLGuyLUziFZWMjre0t4coReSThwct3WqCD/SC3FKUKIObR3
        c3XOUYzWh3yHx2b96laCKSgR3afCobIWwjd7SVtFJsCweCrRua/QZZeXVXb0yLAA2jsqnj
        bSvgLiW1Acso46F74Y/OquYB5O/tR7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-mDerIA7MPSG3v3WT1c47uw-1; Tue, 24 Nov 2020 05:20:43 -0500
X-MC-Unique: mDerIA7MPSG3v3WT1c47uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB7255F9C3;
        Tue, 24 Nov 2020 10:20:41 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-45.ams2.redhat.com [10.36.112.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B101F5C1A3;
        Tue, 24 Nov 2020 10:20:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2] xhci-pci: Allow host runtime PM as default for Intel Alpine Ridge LP
Date:   Tue, 24 Nov 2020 11:20:39 +0100
Message-Id: <20201124102039.11267-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The xHCI controller on Alpine Ridge LP keeps the whole Thunderbolt
controller awake if the host controller is not allowed to sleep.
This is the case even if no USB devices are connected to the host.

Add the Intel Alpine Ridge LP product-id to the list of product-ids
for which we allow runtime PM by default.

Fixes: 2815ef7fe4d4 ("xhci-pci: allow host runtime PM as default for Intel Alpine and Titan Ridge")
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
-Fixup commit msg (add missing Ridge in a few places, caps)
-Add Mika's Reviewed-by
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

