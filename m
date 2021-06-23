Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6843B2075
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jun 2021 20:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhFWSoH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Jun 2021 14:44:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhFWSoA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Jun 2021 14:44:00 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0DAC061787
        for <linux-usb@vger.kernel.org>; Wed, 23 Jun 2021 11:41:42 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h4so2523237pgp.5
        for <linux-usb@vger.kernel.org>; Wed, 23 Jun 2021 11:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HOYpWiLAdHQdy74tEC9zZp5epBW36dqQOP7IyFg/sOw=;
        b=AbvrXyaS2alg6Erctbf5xB5VtXA6w+4tDHPU7xhcoA72NuDpivQ2oM7kj0bV6o6Sy4
         e4OF1CYnFe/BbU6klslo1kcvwq+yH1b8FaKkb+Q4gBaErMBhQ/gLtGGeAV0QndnYCUTN
         ajuZp7CqbT1LCFLVdRtWR/cprGKmU9BePauCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HOYpWiLAdHQdy74tEC9zZp5epBW36dqQOP7IyFg/sOw=;
        b=MKPxrNabVY51HPwrofezObl9CBNLqYl7YZ46oME2bc1fucRXn++o4gpoBJp7/rGdX1
         1pIUoaSvBWRFaX9XnRfkQ1rXQ8QrgyvXQKLYioZPkg7+b5Aao7mpu+HN8N+6yBkF/sGJ
         /YFIdIQlngmrgEYsFyBtZqowRbVCH8dHwRXrC2P2VKAIca5kIOQRas2jf4HagLncuC6x
         EkEqf3WZtedyNfKcwDHg725FL8ZuiFK1kJRRMRJdYx66iqUuXdYF4yIy/Vz6c9ro2cR8
         SHrSs4/6IGueRogSkgHnZcYH5zjOEPJsLXJJ4USLkMR+9nHDfw1j6fZprNrR/0+wNTmK
         RFxw==
X-Gm-Message-State: AOAM532HVwcLxKQ0Q8XrWlj7GFpHaHbjTDHuOGcHu4mzkeivmUNe00jq
        gVGD8MoBaJijn77idAAoIBo6HA==
X-Google-Smtp-Source: ABdhPJwI0PAb0mLmmylaIJu/Xuf6C3t7DN6XJfLVE63sZvgrTXRTEcDsAKUCe8V9qIIO9ndc+Mm4Jg==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id z65-20020a6233440000b029024c735c4546mr1076906pfz.1.1624473701658;
        Wed, 23 Jun 2021 11:41:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:d440:232:5e25:41f4])
        by smtp.gmail.com with UTF8SMTPSA id u125sm536873pfu.95.2021.06.23.11.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 11:41:41 -0700 (PDT)
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
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v13 5/7] usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
Date:   Wed, 23 Jun 2021 11:41:21 -0700
Message-Id: <20210623114025.v13.5.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210623184124.3504047-1-mka@chromium.org>
References: <20210623184124.3504047-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some USB controller drivers that depend on the xhci-plat driver
specify this dependency using 'select' in Kconfig. This is not
recommended for symbols that have other dependencies as it may
lead to invalid configurations. Use 'depends on' to specify the
dependency instead of 'select'.

For DWC3 move the dependency from USB_DWC3 to USB_DWC3_HOST and
USB_DWC3_DUAL_ROLE, to make the DWC3 core selectable for
gadget-only mode when USB_XHCI_PLATFORM=n.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
With this patch no Kconfig conflicts were observed with
allmodconfig and in ~100 randconfig cycles.

Changes in v13:
- patch added to the series

 drivers/usb/cdns3/Kconfig | 2 +-
 drivers/usb/dwc3/Kconfig  | 3 ++-
 drivers/usb/host/Kconfig  | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/cdns3/Kconfig b/drivers/usb/cdns3/Kconfig
index b98ca0a1352a..07e12f786d48 100644
--- a/drivers/usb/cdns3/Kconfig
+++ b/drivers/usb/cdns3/Kconfig
@@ -1,7 +1,7 @@
 config USB_CDNS_SUPPORT
 	tristate "Cadence USB Support"
 	depends on USB_SUPPORT && (USB || USB_GADGET) && HAS_DMA
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
+	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
 	select USB_ROLE_SWITCH
 	help
 	  Say Y here if your system has a Cadence USBSS or USBSSP
diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 66b1454c4db2..29a874644518 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -3,7 +3,6 @@
 config USB_DWC3
 	tristate "DesignWare USB3 DRD Core Support"
 	depends on (USB || USB_GADGET) && HAS_DMA
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
 	select USB_ROLE_SWITCH if USB_DWC3_DUAL_ROLE
 	help
 	  Say Y or M here if your system has a Dual Role SuperSpeed
@@ -30,6 +29,7 @@ choice
 config USB_DWC3_HOST
 	bool "Host only mode"
 	depends on USB=y || USB=USB_DWC3
+	depends on USB_XHCI_PLATFORM
 	help
 	  Select this when you want to use DWC3 in host mode only,
 	  thereby the gadget feature will be regressed.
@@ -44,6 +44,7 @@ config USB_DWC3_GADGET
 config USB_DWC3_DUAL_ROLE
 	bool "Dual Role mode"
 	depends on ((USB=y || USB=USB_DWC3) && (USB_GADGET=y || USB_GADGET=USB_DWC3))
+	depends on USB_XHCI_PLATFORM
 	depends on (EXTCON=y || EXTCON=USB_DWC3)
 	help
 	  This is the default mode of working of DWC3 controller where
diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index df9428f1dc5e..518c2312ef0c 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -80,7 +80,7 @@ config USB_XHCI_MTK
 
 config USB_XHCI_MVEBU
 	tristate "xHCI support for Marvell Armada 375/38x/37xx"
-	select USB_XHCI_PLATFORM
+	depends on USB_XHCI_PLATFORM
 	depends on HAS_IOMEM
 	depends on ARCH_MVEBU || COMPILE_TEST
 	help
@@ -112,9 +112,9 @@ config USB_EHCI_BRCMSTB
 config USB_BRCMSTB
 	tristate "Broadcom STB USB support"
 	depends on (ARCH_BRCMSTB && PHY_BRCM_USB) || COMPILE_TEST
+	depends on !USB_XHCI_HCD || USB_XHCI_PLATFORM
 	select USB_OHCI_HCD_PLATFORM if USB_OHCI_HCD
 	select USB_EHCI_BRCMSTB if USB_EHCI_HCD
-	select USB_XHCI_PLATFORM if USB_XHCI_HCD
 	help
 	  Enables support for XHCI, EHCI and OHCI host controllers
 	  found in Broadcom STB SoC's.
-- 
2.32.0.288.g62a8d224e6-goog

