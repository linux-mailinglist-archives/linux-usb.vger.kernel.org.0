Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7743EBCCF
	for <lists+linux-usb@lfdr.de>; Fri, 13 Aug 2021 21:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbhHMTxZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Aug 2021 15:53:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbhHMTxT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Aug 2021 15:53:19 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372DCC0612E7
        for <linux-usb@vger.kernel.org>; Fri, 13 Aug 2021 12:52:52 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id k2so13364301plk.13
        for <linux-usb@vger.kernel.org>; Fri, 13 Aug 2021 12:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k9Rmu3khB0kAKTqvY5KWNzvfUL1dPXP+fLP9201xmak=;
        b=av8ZrIBvUM9hRpZVFwbUKZwLn2rXRoaHSb4/HOsVGKL7qYduvlwoxVy31eMFlY2nci
         lG7Q8S9SSkYUFT4SnL56w4Dm69qWmAD0UAJ9ge/PeiX2Ie9l8KQA305+tM9dz2l3HTGO
         whRsW1NtjHNHSDHSt2CxTPksVISyHaWynR1GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k9Rmu3khB0kAKTqvY5KWNzvfUL1dPXP+fLP9201xmak=;
        b=QRggIXwZHZx8YFmj8ZXaGiLC9e2qNytW1vyHkScqkjotXwyQ8//MbVGqioNNtpZad6
         Yrt77wgc8iZMwQAJVkLKymxe+7OxaZ569vwhq/7OLST3M57RJum6YeRLvxCrSAFANCvy
         qzWwt5QrqqIDdBbUqKCE4TbWVUNvAAuyjSsn88bmkAlBUk1NUdG8/SpMOVhcdc8gVn9Y
         i2QNaELpOOfc4Ypyhfyxo4jZfZ1Z/zFLzVDIgGNoPoF6wIJWbpR93dcYOj+FGEK49uKj
         GkRodMDx15vrUBiBU1F4zAZ8euv4u2QKgnlajZ7zTEWnlLOhpO9KT4sUJhWzcUOx0Iy5
         OG0g==
X-Gm-Message-State: AOAM532Mk9XEh+NJZcXacAXXOuiMI5Z+L1ckqb/MQ7YmXUON3/O+gJX/
        bam3i8tZFS+R7DnT/hn7OugEvA==
X-Google-Smtp-Source: ABdhPJzMsWHluNheUBxKxn/mMpe02w5C5YzOslH3Qs1NIX7pgA6rpbeKz4VALiqEC017+IZBEQEDGg==
X-Received: by 2002:a17:90b:4c8e:: with SMTP id my14mr3242709pjb.234.1628884371370;
        Fri, 13 Aug 2021 12:52:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:450d:9788:a70e:42d6])
        by smtp.gmail.com with UTF8SMTPSA id x189sm3625510pfx.99.2021.08.13.12.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 12:52:51 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, Peter Chen <peter.chen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v16 6/7] usb: host: xhci-plat: Create platform device for onboard hubs in probe()
Date:   Fri, 13 Aug 2021 12:52:27 -0700
Message-Id: <20210813125146.v16.6.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210813195228.2003500-1-mka@chromium.org>
References: <20210813195228.2003500-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Call onboard_hub_create/destroy_pdevs() from  _probe()/_remove()
to create/destroy platform devices for onboard USB hubs that may
be connected to the root hub of the controller. These functions
are a NOP unless CONFIG_USB_ONBOARD_HUB=y/m.

Also add a field to struct xhci_hcd to keep track of the onboard hub
platform devices that are owned by the xHCI.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v16:
- none

Changes in v15:
- none

Changes in v14:
- none

Changes in v13:
- added comment for 'depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB'
  construct

Changes in v12:
- none

Changes in v11:
- use onboard_hub_create/destroy_pdevs() to support multiple onboard
  hubs that are connected to the same root hub
- moved field/list to keep track of platform devices from struct
  usb_hcd to struct xhci_hcd
- updated commit message

Changes in v10:
- none

Changes in v9:
- added dependency on USB_ONBOARD_HUB (or !!USB_ONBOARD_HUB) to
  USB_XHCI_PLATFORM

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- patch added to the series

 drivers/usb/host/Kconfig     | 1 +
 drivers/usb/host/xhci-plat.c | 6 ++++++
 drivers/usb/host/xhci.h      | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 518c2312ef0c..099e9615919c 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -54,6 +54,7 @@ config USB_XHCI_PCI_RENESAS
 config USB_XHCI_PLATFORM
 	tristate "Generic xHCI driver for a platform device"
 	select USB_XHCI_RCAR if ARCH_RENESAS
+	depends on USB_ONBOARD_HUB || !USB_ONBOARD_HUB # if USB_ONBOARD_HUB=m, this can't be 'y'
 	help
 	  Adds an xHCI host driver for a generic platform device, which
 	  provides a memory space and an irq.
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index c1edcc9b13ce..ee98a3671619 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/usb/onboard_hub.h>
 #include <linux/usb/phy.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
@@ -374,6 +375,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(&pdev->dev);
 
+	INIT_LIST_HEAD(&xhci->onboard_hub_devs);
+	onboard_hub_create_pdevs(hcd->self.root_hub, &xhci->onboard_hub_devs);
+
 	return 0;
 
 
@@ -420,6 +424,8 @@ static int xhci_plat_remove(struct platform_device *dev)
 	usb_remove_hcd(hcd);
 	usb_put_hcd(shared_hcd);
 
+	onboard_hub_destroy_pdevs(&xhci->onboard_hub_devs);
+
 	clk_disable_unprepare(clk);
 	clk_disable_unprepare(reg_clk);
 	usb_put_hcd(hcd);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 3c7d281672ae..5ba01d5ccab8 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1923,6 +1923,8 @@ struct xhci_hcd {
 	struct dentry		*debugfs_slots;
 	struct list_head	regset_list;
 
+	struct list_head	onboard_hub_devs;
+
 	void			*dbc;
 	/* platform-specific data -- must come last */
 	unsigned long		priv[] __aligned(sizeof(s64));
-- 
2.33.0.rc1.237.g0d66db33f3-goog

