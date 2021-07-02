Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E954F3B9C0F
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jul 2021 07:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbhGBFuc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jul 2021 01:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbhGBFub (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jul 2021 01:50:31 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A418C061762
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 22:47:59 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id t15-20020a05622a180fb029024f88c5e9b0so4918312qtc.17
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=wdon6WR16eVk/mXealjFOSo3Z4uiXRlZx0g446VrFWw=;
        b=fDu9N97ymY57BM+0wJqs9uTTgOPDZjR/iNU0x95In9zv46MlUsokrbdZ5al/uzdLUr
         M2umhfSwOg7sabn+6ep81QZx9ryvQAG+CTVcIuYTGhXD/hckq7dV1hr6OQGTL33+W2tV
         WRLTMhb4QmKUWk0ZjWznj5GEn8QkevQ/f4AwCxBzeLoQM5b/Ya6G9jUq23dhR3sjqRri
         72ohNfCxTln6gBhprE7V0msZ+o6pVAn59p4vywKjjV6DozZt3/bUxXbc1vY8Oz00b0AR
         91iERJ7GEH2E4L5P84At1jTEJkGgpjYIxwFWE4iRH0KEzHlY8T9ngnxNWmbsXWJqRlvZ
         2qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=wdon6WR16eVk/mXealjFOSo3Z4uiXRlZx0g446VrFWw=;
        b=VK2RyWM8AbXsMddC9/W7/yy5fsn0T2c4exo8Afw/p3cWZgSYEXfE5kt1IdFoinaLfp
         KmzZ60UtW0GNQQW1FqdYtIp7qb8P9fd0cff4h7dAz7kvtNRHa2VWBa+kOZfGbcU9voPA
         5yX87088RXm6Fc4Vx+/W+1Jv7xrgv1Uh54PRGe53UOOixGEOZGK9/1hlBMYczmcQmO1e
         1dRrX0VUpMQAR6SdM7KySiRtk7QRld76KhP3xAHAJfGTTfkCxfwBh2DTX2TrAY/wEhAQ
         P1q8HfBwL/49XAo6gSA1cQ5qqUpd8bhI/CHkHen8fVW39ODuM0VuzyG446sx6V0L/Wii
         ExEw==
X-Gm-Message-State: AOAM5335GeLCfySz55f9jcYiuhFQ+QcdffPxQaq+AR2I0X9iXZ9a6l48
        oQObS/mGev/tPyLwSjkbuuUciuLaKxST
X-Google-Smtp-Source: ABdhPJwls7dt2TFSw3P9uW4DpbRemJGgWLXcEiTKmODlVLFIf9gFpDYGRxiAqxTDRY//O+oDHZCUfK5iOlLa
X-Received: from gthelen2.svl.corp.google.com ([2620:15c:2cd:202:81c6:dd12:da9f:dd72])
 (user=gthelen job=sendgmr) by 2002:a0c:b450:: with SMTP id
 e16mr3511217qvf.25.1625204878247; Thu, 01 Jul 2021 22:47:58 -0700 (PDT)
Date:   Thu,  1 Jul 2021 22:47:54 -0700
Message-Id: <20210702054754.2056918-1-gthelen@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] usb: xhci: avoid renesas_usb_fw.mem when it's unusable
From:   Greg Thelen <gthelen@google.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit a66d21d7dba8 ("usb: xhci: Add support for Renesas controller with
memory") added renesas_usb_fw.mem firmware reference to xhci-pci.  Thus
modinfo indicates xhci-pci.ko has "firmware: renesas_usb_fw.mem".  But
the firmware is only actually used with CONFIG_USB_XHCI_PCI_RENESAS.  An
unusable firmware reference can trigger safety checkers which look for
drivers with unmet firmware dependencies.

Avoid referring to renesas_usb_fw.mem in circumstances when it cannot be
loaded (when CONFIG_USB_XHCI_PCI_RENESAS isn't set).

Signed-off-by: Greg Thelen <gthelen@google.com>
---
 drivers/usb/host/xhci-pci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 18c2bbddf080..cb148da7a789 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -618,8 +618,10 @@ static void xhci_pci_shutdown(struct usb_hcd *hcd)
 /*-------------------------------------------------------------------------*/
 
 static const struct xhci_driver_data reneses_data = {
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
 	.quirks  = XHCI_RENESAS_FW_QUIRK,
 	.firmware = "renesas_usb_fw.mem",
+#endif
 };
 
 /* PCI driver selection metadata; PCI hotplugging uses this */
@@ -636,7 +638,13 @@ static const struct pci_device_id pci_ids[] = {
 	{ /* end: all zeroes */ }
 };
 MODULE_DEVICE_TABLE(pci, pci_ids);
+/*
+ * Without CONFIG_USB_XHCI_PCI_RENESAS renesas_xhci_check_request_fw() won't
+ * load firmware, so don't encumber the xhci-pci driver with it.
+ */
+#if IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS)
 MODULE_FIRMWARE("renesas_usb_fw.mem");
+#endif
 
 /* pci driver glue; this is a "new style" PCI driver module */
 static struct pci_driver xhci_pci_driver = {
-- 
2.32.0.93.g670b81a890-goog

