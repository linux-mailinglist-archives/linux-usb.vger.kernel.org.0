Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5264B3CEFA1
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 01:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354391AbhGSWTU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 18:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359460AbhGSVpx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 17:45:53 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225A3C061341
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 15:21:43 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id d9-20020a17090ae289b0290172f971883bso750710pjz.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 15:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ygiFo2hvL9fwITOW1bvJ/JRrmhSWad+hSF9Ffujy0ws=;
        b=UHpa/P3SiPtNQEIJv2o2sGqnUGwOM+4YTXaeLPZb1mg5B6xBksHQ/VSSnx0clJ7Jcv
         h9+3QaIcHj3bB22SVYijM/1dQ5vqfhhXQh5hVZuczbli3+uaJ25npez/faBQTHRsGAab
         zXNr/W68ublDWxc7iE7iguTjOZKdHiEk2XJQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ygiFo2hvL9fwITOW1bvJ/JRrmhSWad+hSF9Ffujy0ws=;
        b=UVUMf4ASbuXds0YoXv13yPByyeLS0QkFwOgJgG+e2h9XPJBGf3OfAsYGTKRdSiUeN6
         sfz67OAHdtfIdeD+dLEi+mqZNM+ht+yho39luh5dVMnmQcMzLH7PATXRXQFpRa9uzHlA
         WkVHOJBB5tdV/Sms/678GMlQ48iCcVkndilF9oSXt3OLiEYQWShBnU6ryP+aW//DXpLR
         guXPo+Jf+cjdQuamWV2CZaSyeazpupUZCkoF8vYsevezZ6+DTVGl9hptUnZxaJeDRL8l
         9WyByIxYv8XsodVVZPW8lGOGfNwL7gAr6UJchSEcgNaSRaQYZNKraxsaMj78qe0T51qB
         GFjA==
X-Gm-Message-State: AOAM533LPdL7Sw/6fwUH6CjOQ6FDgyQDwCjZ70Lp0jiGlz3efEjgWT5u
        B2aYFlvAWzntWIILK0SSKfPaUQ==
X-Google-Smtp-Source: ABdhPJxBg63VfEfb6IrFnALMMUb8hfIqiTevDIploE9dUmFDVlA1alOLe3kpCtAKUi0PC97w7go7fQ==
X-Received: by 2002:a17:90a:1148:: with SMTP id d8mr27297912pje.106.1626733302742;
        Mon, 19 Jul 2021 15:21:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4d0:bf5f:b8cd:2d67])
        by smtp.gmail.com with UTF8SMTPSA id 19sm4975144pgh.6.2021.07.19.15.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jul 2021 15:21:42 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Michal Simek <michal.simek@xilinx.com>, linux-usb@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v14 4/6] usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
Date:   Mon, 19 Jul 2021 15:21:26 -0700
Message-Id: <20210719152055.v14.4.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
In-Reply-To: <20210719222128.4122837-1-mka@chromium.org>
References: <20210719222128.4122837-1-mka@chromium.org>
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

Changes in v14:
- none

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
2.32.0.402.g57bb445576-goog

