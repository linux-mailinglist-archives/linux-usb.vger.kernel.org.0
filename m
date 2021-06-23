Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73DAD3B2077
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jun 2021 20:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhFWSoK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Jun 2021 14:44:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbhFWSoD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Jun 2021 14:44:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08F1C0617AF
        for <linux-usb@vger.kernel.org>; Wed, 23 Jun 2021 11:41:44 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso1917996pjb.4
        for <linux-usb@vger.kernel.org>; Wed, 23 Jun 2021 11:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skdjr/Y3oOtV+mfGs2QcPE1+zMQ2thCe6DzcXWbPwjA=;
        b=bYMCfogVS4hZnmP5fmYtdXMh1VT8VtHwn5rnQ1PoQK6jovQ2xCwPs8iNdtEA7KVyRS
         T4SKDkN+a6PDRMBIqSCKqN6tJ8Pon1PmTNGRVibGGQDSGrRbWeB+IDXvDJMbiij2mPjN
         O22LE8tOGoRTFbfEEyvG6n8XS7Z3w/dBq03kI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skdjr/Y3oOtV+mfGs2QcPE1+zMQ2thCe6DzcXWbPwjA=;
        b=X+B7ZtCCdgMpgL8PoDTlvBKysbvLR1o9RLT8fL+iPJ6JlQfKh8+6ZK9M1Y6EjduRWz
         +4R50Lm4k6m3mNqrXdLJzUEf4vZ7AFJg2kRg6NHsALmyI0vHPoneZLleVyOXpPeRQANu
         rlLHnR2AIcRr+c3xRM/GKq8OO9xqoKOHEcR0Zr6BNnLvn65mZPc9ly2P4VH7Qc/a/9B0
         TXBeInZ2FY8FtaxaKvMZzKvZ3/AHyNH8mel4yuyNOJG3dUtexk/iSrfud3T8ZrgyQVkO
         Xaxz0385FxyjDzwuDaQTgVLBGn9u9+QK+6vk5ZEQUNd3brhBZFC4+gJJnmc1mX7lJ2fL
         ASyw==
X-Gm-Message-State: AOAM533hYbqNTdFlPTgluuJzkkV7QCKOhMngtPKl4x1PkkNTJ8eoVdwT
        QQvpZCVLcBNRMdHo9FIDcGP3Mw==
X-Google-Smtp-Source: ABdhPJyV42jtwCEYcg/pFiqWWiJD6XZVKgJtjuy04xTFMxZsA3/24Fxkd4V0x2AqcyoQfeWfeHxoZQ==
X-Received: by 2002:a17:902:6b04:b029:10b:cf5c:3739 with SMTP id o4-20020a1709026b04b029010bcf5c3739mr826800plk.76.1624473704420;
        Wed, 23 Jun 2021 11:41:44 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d440:232:5e25:41f4])
        by smtp.gmail.com with UTF8SMTPSA id v6sm548541pfi.46.2021.06.23.11.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 11:41:43 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michal Simek <michal.simek@xilinx.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v13 6/7] usb: host: xhci-plat: Create platform device for onboard hubs in probe()
Date:   Wed, 23 Jun 2021 11:41:22 -0700
Message-Id: <20210623114025.v13.6.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210623184124.3504047-1-mka@chromium.org>
References: <20210623184124.3504047-1-mka@chromium.org>
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
index 2595a8f057c4..52d9b28745de 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1919,6 +1919,8 @@ struct xhci_hcd {
 	struct dentry		*debugfs_slots;
 	struct list_head	regset_list;
 
+	struct list_head	onboard_hub_devs;
+
 	void			*dbc;
 	/* platform-specific data -- must come last */
 	unsigned long		priv[] __aligned(sizeof(s64));
-- 
2.32.0.288.g62a8d224e6-goog

