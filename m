Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5CA48CB92
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 20:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356704AbiALTLJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 14:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356661AbiALTLH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 14:11:07 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEE3EC02982C
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 11:11:00 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id oa15so7033568pjb.4
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 11:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQcGi+6PYdh2e7/00+1dBPTYZ2lf1jbIQG8r20v5neo=;
        b=l5Jjt2T+wxJNXK9pmrhHg4a/BvMUSohbgq7j9pUWWPa5qsSXKzbG+fkUHCu4Fkphma
         GPc/kqIseqCp1HF0owP2Z7IHY01ZLpWGAx/DMlgVRuXJLPMOe/CD22ufcdF/TuypjnHY
         GlIfs2i2Ue6tnIkNMEv91lfEqF+R7NZXb5VCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQcGi+6PYdh2e7/00+1dBPTYZ2lf1jbIQG8r20v5neo=;
        b=k5iU8ozWq7ywd6903Y+uwNWbyW70FF1KD9YsfCJ40wA/vbrGlPmsGSEPn14vj7CaZC
         VSlBScrglzbp6e1uyRheaP8F/y+w48K3Y6j54KwJy404ZGOpGCtzlzSnKSJ+Huok7vgW
         2w+x8L/dlfMcNVbJ6/9E8P9f9qWlI2NuyxTSddrf/gaA3eJkHRAs0g3PRjeyQtKdeo9y
         izSHkDac2hawWoOaGjhO49GFgZQned9aGzbS0kh3xIFAAnWZrZWoBIDcP7LSqJY8tbu9
         KG/UDkLMVIs3INv4Lq4zm9TGaM2dGMPcFUzKKadVDw1stteBhs6JKDvRokVOlgMW3Ry+
         hNHw==
X-Gm-Message-State: AOAM532bebgMZj71kkwSgdYCGU/YQMPNdDtXLwVbeaYcMMM2vshn1fvD
        RB8ihI7YoqxuZuhqo2mv1zFX5Q==
X-Google-Smtp-Source: ABdhPJxKIne1lEAJXsoSkOTRM2e0zyLGy6gyrmWxfV81wIYD1WSumFzvQ5DuGxS04S4eXSiE10eY1Q==
X-Received: by 2002:a63:474b:: with SMTP id w11mr916429pgk.618.1642014660414;
        Wed, 12 Jan 2022 11:11:00 -0800 (PST)
Received: from localhost ([2620:15c:202:201:f6eb:5b26:28c:1ca5])
        by smtp.gmail.com with UTF8SMTPSA id d17sm344757pfl.125.2022.01.12.11.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 11:11:00 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        linux-usb@vger.kernel.org, Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Li Jun <jun.li@nxp.com>, Peter Chen <peter.chen@nxp.com>,
        Sasha Levin <sashal@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v19 4/5] usb: core: hcd: Create platform devices for onboard hubs in probe()
Date:   Wed, 12 Jan 2022 11:10:47 -0800
Message-Id: <20220112111028.v19.4.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220112191048.837236-1-mka@chromium.org>
References: <20220112191048.837236-1-mka@chromium.org>
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

Changes in v19:
- none

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
2.34.1.575.g55b058a8bb-goog

