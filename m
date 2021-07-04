Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6DA3BAACE
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jul 2021 03:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhGDBeE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Jul 2021 21:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhGDBeC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Jul 2021 21:34:02 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F1FC061762
        for <linux-usb@vger.kernel.org>; Sat,  3 Jul 2021 18:31:28 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id u8-20020a7bcb080000b02901e44e9caa2aso8873281wmj.4
        for <linux-usb@vger.kernel.org>; Sat, 03 Jul 2021 18:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EMD8qfF1dzvm6y6ijOX74BiBQ0mTKe538HfIYXSpB48=;
        b=z1NOuv63K6os5DFYjSOiLakriNjE+iyW/5Y5PvHWxyvsSrHDaenXPSVKYgDxu5MgGi
         3PSqatwIbKY8mbdFI2XZhEkqRbK26lGnwkyjGBxCkO/6G5VzzoBLhYb+LfMLtfs1iYSr
         MwcaBuB2KApZvFUPNxWwEikVx95pZot3Picw2DSUbiCNOfTe0E0w/VFUgbT5SIlcbWPx
         8D3yZcP910ZWa5+Wyh6z7/3XkCZeSdxWUYBwQ/O7hnKv9WZsXR71CRcXGJGdnfaYwJkh
         ZBzXaz1Jrt97nTscVIIvhnijuL9rkeImbeeqDuTEFEjR8jIGrXslmFDxnFTxqO3HGHvB
         cHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EMD8qfF1dzvm6y6ijOX74BiBQ0mTKe538HfIYXSpB48=;
        b=WcoFKtcPqQDR7t3vJrqsTMfCaR8PBBSlbHH6jVcBJ34EF5LMptZHtyx4vEOwwB784S
         zjf0lv+o9CdxBYJuzwqUSxHIeMaCFuWcwgzjBdbgYm6wCwpnRScWchKvEMPlzsIoMsQW
         mr1EgyJArJ9gK5TibIyTQ53+g/7p4y/YofcsRrsDcnjHinp9FydYiIvokBMs/VUiqrVX
         tu7ropUADGmBfZEiEW2TzalYVgI1JITckWSO7u0bwzCiCmEGg1onDV4Dr3kKkRL4oXTS
         4GVo7ueoI/oWTSPuIXePOVuaU8LUI6E/zKTHamrd2MmK9DuXWIgMmC6IIQt7qN2FcKcp
         iNUA==
X-Gm-Message-State: AOAM532YeGL+RRyQEz8P+T2W/rsKYCeyWbVxfAsIalMBN54ul8N41szj
        yLAj4sbx11o6lHcHTAunk9f+LA==
X-Google-Smtp-Source: ABdhPJzf9TGFqMhmFx969Ur1YGeDQWkM4WrAACQTYbb+YF8vrKY3EopbzJeX0vk4yjvRB/TZTFtUIA==
X-Received: by 2002:a05:600c:14c6:: with SMTP id i6mr7346634wmh.169.1625362286780;
        Sat, 03 Jul 2021 18:31:26 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l16sm18026717wmj.47.2021.07.03.18.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 18:31:26 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 2/3] usb: dwc3: Add role switch relay support
Date:   Sun,  4 Jul 2021 02:33:13 +0100
Message-Id: <20210704013314.200951-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add the ability to relay a role switch message from the core to the parent
device of the controller.

This is useful for the qcom-dwc3 wrapper which wants to receive role-switch
notifications in order to waggle internal SoC UTMI signals.

Having the core trigger the parent wrapper has the advantage of keeping the
connector mechanism agnostic from dwc3 wrapper code and means that any
other wrapper implementation on any other SoC or architecture need not
write custom code to find various types of Type-C role switch mechanisms.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/core.h |  2 ++
 drivers/usb/dwc3/drd.c  | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index dccdf13b5f9e..974104cc16f7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -993,6 +993,7 @@ struct dwc3_scratchpad_array {
  *		- USBPHY_INTERFACE_MODE_UTMI
  *		- USBPHY_INTERFACE_MODE_UTMIW
  * @role_sw: usb_role_switch handle
+ * @role_sw_relay: usb_role_switch relay handle
  * @role_switch_default_mode: default operation mode of controller while
  *			usb role is USB_ROLE_NONE.
  * @usb_psy: pointer to power supply interface.
@@ -1136,6 +1137,7 @@ struct dwc3 {
 	struct notifier_block	edev_nb;
 	enum usb_phy_interface	hsphy_mode;
 	struct usb_role_switch	*role_sw;
+	struct usb_role_switch	*role_sw_relay;
 	enum usb_dr_mode	role_switch_default_mode;
 
 	struct power_supply	*usb_psy;
diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 8fcbac10510c..74293861bd8f 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -507,6 +507,9 @@ static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
 	}
 
 	dwc3_set_mode(dwc, mode);
+	if (dwc->role_sw_relay)
+		usb_role_switch_set_role(dwc->role_sw_relay, role);
+
 	return 0;
 }
 
@@ -563,6 +566,10 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
 
+	dwc->role_sw_relay = usb_role_switch_get(dwc->dev);
+	if (IS_ERR(dwc->role_sw_relay))
+		return PTR_ERR(dwc->role_sw_relay);
+
 	dwc3_set_mode(dwc, mode);
 	return 0;
 }
@@ -630,6 +637,9 @@ void dwc3_drd_exit(struct dwc3 *dwc)
 {
 	unsigned long flags;
 
+	if (dwc->role_sw_relay)
+		usb_role_switch_put(dwc->role_sw_relay);
+
 	if (dwc->role_sw)
 		usb_role_switch_unregister(dwc->role_sw);
 
-- 
2.30.1

