Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8FD4708CA
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 19:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245386AbhLJSeR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 13:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245373AbhLJSeO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Dec 2021 13:34:14 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75120C0698C5
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 10:30:38 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id m24so8744304pgn.7
        for <linux-usb@vger.kernel.org>; Fri, 10 Dec 2021 10:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rsliOlSI5kWVSBZGWzBcHZBsveCvA+odLQNiVyQKFWU=;
        b=ZXI8CjjDtsqdikt1oDR+rlzo/1sI+GWcPozlMuXwLC9hXNvw05dKvYWkQcaOy3mwVB
         wTzU65fIxp+Uh5VIWWed6FJJU6HzI7RoMEMj3AU0D0x4YXM4ZA0oXhZ0U5YdKwUWoNdG
         5yCtxZSSeiIhH4mafe/sv8al+cFVp++5olO/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rsliOlSI5kWVSBZGWzBcHZBsveCvA+odLQNiVyQKFWU=;
        b=dIqdhhqGJesLSDgpp1Bc/UkL7ut9flhdJ5zQsNGA0NzqQiy4omRHi7oraRikXcjMwQ
         5jHEO1JJoDG/viVYiwdHMiF+Bvo1DzkElVn1KIXF/y2KnuMlSW2I49WWRjcfyN346vRo
         v8hFFNn+toHtyIPueHvGyo5wGheifdZ67mIrCH5EdlVGam+vuKI6Dr1oQbEtrTzhEL3h
         le1q5wzJu1JphXzu/Lh5STWAr7PWmS8GXRI3P86/edels6gF6vFluiD9q82pO6o9syrw
         uUvjtQVnxEP6yhzBCq3ChcLMOQI/BqHv4KCC2Vp4OH8R5T7deOKreLwY8oI+cVkfdw8c
         wq4A==
X-Gm-Message-State: AOAM533TzNi6Vhm2Eqdi6Zr7qu9OlWPtaD1l6tVfq6Wov4PfgAq/t47F
        4KhvAf9Xb+VKS6RBEgGbggxsDQ==
X-Google-Smtp-Source: ABdhPJx/bf7Vqtxo65g0M1x+co0Gj+Sf5kSRLpFS/Q+set+SjfSxH9rLFWT088LPUTPcdolhBgtslg==
X-Received: by 2002:a63:2217:: with SMTP id i23mr39466346pgi.332.1639161037565;
        Fri, 10 Dec 2021 10:30:37 -0800 (PST)
Received: from localhost ([2620:15c:202:201:d386:8bb1:aaa7:a294])
        by smtp.gmail.com with UTF8SMTPSA id t4sm4187191pfj.168.2021.12.10.10.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 10:30:37 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Peter Chen <peter.chen@kernel.org>, linux-kernel@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Roger Quadros <rogerq@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Li Jun <jun.li@nxp.com>, Peter Chen <peter.chen@nxp.com>,
        Sasha Levin <sashal@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v18 4/5] usb: core: hcd: Create platform devices for onboard hubs in probe()
Date:   Fri, 10 Dec 2021 10:30:20 -0800
Message-Id: <20211210102923.v18.4.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211210183021.3500376-1-mka@chromium.org>
References: <20211210183021.3500376-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Call onboard_hub_create/destroy_pdevs() from usb_add/remove_hcd()
for primary HCDs to create/destroy platform devices for onboard
USB hubs that may be connected to the root hub of the controller.
These functions are a NOP unless CONFIG_USB_ONBOARD_HUB=y/m.

Also add a field to struct usb_hcd to keep track of the onboard hub
platform devices that are owned by the HCD.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v18:
- none

Changes in v17:
- create the platform devices in the generic HCD code instead of
  the xhci_platform driver
- updated subject and commit message to reflect the above change
- dropped initialization of platform device list, which is now
  done in onboard_hub_create_pdevs()

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

 drivers/usb/core/hcd.c  | 6 ++++++
 include/linux/usb/hcd.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 4d326ee12c36..b8220e411e07 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -36,6 +36,7 @@
 #include <linux/phy/phy.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/usb/onboard_hub.h>
 #include <linux/usb/otg.h>
 
 #include "usb.h"
@@ -2963,6 +2964,9 @@ int usb_add_hcd(struct usb_hcd *hcd,
 	if (hcd->uses_new_polling && HCD_POLL_RH(hcd))
 		usb_hcd_poll_rh_status(hcd);
 
+	if (usb_hcd_is_primary_hcd(hcd))
+		onboard_hub_create_pdevs(hcd->self.root_hub, &hcd->onboard_hub_devs);
+
 	return retval;
 
 err_register_root_hub:
@@ -3041,6 +3045,8 @@ void usb_remove_hcd(struct usb_hcd *hcd)
 	if (usb_hcd_is_primary_hcd(hcd)) {
 		if (hcd->irq > 0)
 			free_irq(hcd->irq, hcd);
+
+		onboard_hub_destroy_pdevs(&hcd->onboard_hub_devs);
 	}
 
 	usb_deregister_bus(&hcd->self);
diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 548a028f2dab..4ebc91c09182 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -198,6 +198,7 @@ struct usb_hcd {
 	struct usb_hcd		*shared_hcd;
 	struct usb_hcd		*primary_hcd;
 
+	struct list_head	onboard_hub_devs;
 
 #define HCD_BUFFER_POOLS	4
 	struct dma_pool		*pool[HCD_BUFFER_POOLS];
-- 
2.34.1.173.g76aa8bc2d0-goog

