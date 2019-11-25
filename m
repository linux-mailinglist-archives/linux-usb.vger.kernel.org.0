Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E81BB108DF3
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727691AbfKYMc0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:26 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39801 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727568AbfKYMc0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:26 -0500
Received: by mail-wm1-f66.google.com with SMTP id t26so15759915wmi.4;
        Mon, 25 Nov 2019 04:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/oaAKLiGa4/IhwzkurA0aDtjDQ0oFXesoS/Wwe9dmU=;
        b=CPCHripaJVxNHral/TWl+v+wVGmwC5ZwyR3Tlkob6MY9B7l54845CCqH/H8aSdypN+
         BvR8cvpzlElbmXYIoMUf4dwfnEsa4RwvSvWI5QgYaPaCaSncFRMHZaTMUS3Sim0FLJ6P
         nd7YVCecpa6XP8g6gSRhH3q2pUQJP3sqMRnjBFx7DCrlLHXyGvXiS6S32+T+3Ata8CrQ
         +ULG1cmKHpnLfk3srbcx4cbkg2sJv/66TJP6LSSMBsSayFaDhw/nOI4F0HxqFo0G9VOn
         vXNWBWEsP37V+gdytoolhqLKB4oTfGDhirgWEUsH5TabmbU87jEaZELE8c8T+DhdLSda
         3VPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/oaAKLiGa4/IhwzkurA0aDtjDQ0oFXesoS/Wwe9dmU=;
        b=YjYF3EumwK05skYavxTXTnLlx1NcwVQ+DzlxxDkTErGstbBf+6Imn9pQy9YgL8+PHM
         1iIXV4T+eel76HkIQpmBbkvwrwI9mv8lnpAyOvNbEKBeM9VHSivN9u4bSKiNrJgBuZb9
         xKaKxxSQiqQHioOHSinXpa1fdcquGbh10RjxYqfDJtmYrEIdaaYGtP8RfoJy4EdBilPG
         4AwhlaRnZN8eoXd0KtIN9ZfAB5RZWEBKre/HfMmfqgny+bvohHkPi30cv9gKc8RWCrBi
         LfcrFCltmD68UaN5/kHfaFeAcu4GlA3MhDa5BCzg5ZCRjIXQVznC1nuyb6eLnQ4hwe6a
         5CTA==
X-Gm-Message-State: APjAAAWQ0kuDVs2jnB3No2jIPrJUsLfbMXo9qui/xJGdKl/g6LfS0Gl/
        ciNMs2dCTZCPjS99akT3ASheTV6SWcU=
X-Google-Smtp-Source: APXvYqwvdiKPUcRJUbV3tmawWig/VSQYQmkSpUd4rJTwChx0TZS/SRbHg4p1uD5KJhmkS+0z6l0uwA==
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr26509411wmc.123.1574685142579;
        Mon, 25 Nov 2019 04:32:22 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id c15sm10255382wrx.78.2019.11.25.04.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:21 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 05/10] usb: host: xhci-tegra: Extract firmware enable helper
Date:   Mon, 25 Nov 2019 13:32:05 +0100
Message-Id: <20191125123210.1564323-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125123210.1564323-1-thierry.reding@gmail.com>
References: <20191125123210.1564323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Extract a helper that enables message generation from the firmware. This
removes clutter from tegra_xusb_probe() and will also come in useful for
subsequent patches that introduce suspend/resume support.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 41 +++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 85642806fa2a..4244367d3573 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -997,11 +997,37 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
 	return 0;
 }
 
-static int tegra_xusb_probe(struct platform_device *pdev)
+static int __tegra_xusb_enable_firmware_messages(struct tegra_xusb *tegra)
 {
 	struct tegra_xusb_mbox_msg msg;
-	struct resource *regs;
+	int err;
+
+	/* Enable firmware messages from controller. */
+	msg.cmd = MBOX_CMD_MSG_ENABLED;
+	msg.data = 0;
+
+	err = tegra_xusb_mbox_send(tegra, &msg);
+	if (err < 0)
+		dev_err(tegra->dev, "failed to enable messages: %d\n", err);
+
+	return err;
+}
+
+static int tegra_xusb_enable_firmware_messages(struct tegra_xusb *tegra)
+{
+	int err;
+
+	mutex_lock(&tegra->lock);
+	err = __tegra_xusb_enable_firmware_messages(tegra);
+	mutex_unlock(&tegra->lock);
+
+	return err;
+}
+
+static int tegra_xusb_probe(struct platform_device *pdev)
+{
 	struct tegra_xusb *tegra;
+	struct resource *regs;
 	struct xhci_hcd *xhci;
 	unsigned int i, j, k;
 	struct phy *phy;
@@ -1281,21 +1307,12 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		goto put_usb3;
 	}
 
-	mutex_lock(&tegra->lock);
-
-	/* Enable firmware messages from controller. */
-	msg.cmd = MBOX_CMD_MSG_ENABLED;
-	msg.data = 0;
-
-	err = tegra_xusb_mbox_send(tegra, &msg);
+	err = tegra_xusb_enable_firmware_messages(tegra);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to enable messages: %d\n", err);
-		mutex_unlock(&tegra->lock);
 		goto remove_usb3;
 	}
 
-	mutex_unlock(&tegra->lock);
-
 	err = devm_request_threaded_irq(&pdev->dev, tegra->mbox_irq,
 					tegra_xusb_mbox_irq,
 					tegra_xusb_mbox_thread, 0,
-- 
2.23.0

