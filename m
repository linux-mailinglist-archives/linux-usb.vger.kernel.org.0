Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A57DF1151F1
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfLFOHH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46599 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfLFOHH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so7816107wrl.13;
        Fri, 06 Dec 2019 06:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KiJRkyyJVEnwG3KmEZJWFAXbe3W+laaKaUqZ5aE7QB0=;
        b=KYIkiL5JxdLQp9QTamcoDSNJbgmYTLZIoA08JRhkgN5t3Zc6+pLBchpRrdVPA6+kIB
         kiEpPRScW8rtqu0pF+8fgblpft02xS1XlzgqynnsykoRHErubTJnkrKrqUbBlqU1sQei
         WJ7R3HVMCdwvuQl0V/GJu4jKbzuiN55katmvlfqAYMjyrpQnoR5N+Jwo0QTwEBhLmmNN
         wHHARAG6GcEvndk2UGglmCkq/mwys3VthbZEv0T+1mPK6bt/sDmKY4xqFGfz6PAHC0zE
         BJo+jp8yygO/R8JOZip+upTy0k2SGU746O5HGcmDE6WNQUZb30r84har/lwNrIGohOTN
         dOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KiJRkyyJVEnwG3KmEZJWFAXbe3W+laaKaUqZ5aE7QB0=;
        b=Mo3HgLkXyjInyEsLXkgOs0gEyFxzMU8yC8n46nulWxZ6OT7eAvxUUeqwzbfoIQO7IA
         Qmlqv8iO2dRtx485Th5fq09df6JII74FGVZLeZEKQjxMGp4alPsgSeq9XcnzrfOK88e/
         k3gT3VhBsa3S6ktQKuik/V137KwM2K7Xk8uE9QBwN4P4mPHWIdvVVaruUUwVKBcml2MS
         vAdPRAQE0RdFURVw5yYE9lrwqtIbvs6X3bcXqMhuaVcp7iqvxFMiWUR6kKoRmyBKyd63
         yQRV2msnV0FKDEGEGXQZ62/Lrn93LdR3+L6q6TQV8h7+xLPMx40LQ4wxMqj4qgYyDP0q
         vQMg==
X-Gm-Message-State: APjAAAUXSS+9XfaBvoiWpnx71cU1cPLVI4VrzJlTKBE5Euu6k79lNk0V
        a/of9cgpwVpwlJ3FS64c16g=
X-Google-Smtp-Source: APXvYqyZnbhPZQEcTr7rYKRh6Y/ozEEyUlOhUnXVKEGS4j0NMNjXkHirHqtBaqmKorQyn0+U1APnUw==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr16122216wrv.77.1575641225698;
        Fri, 06 Dec 2019 06:07:05 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id x7sm16092808wrq.41.2019.12.06.06.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 05/10] usb: host: xhci-tegra: Extract firmware enable helper
Date:   Fri,  6 Dec 2019 15:06:48 +0100
Message-Id: <20191206140653.2085561-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191206140653.2085561-1-thierry.reding@gmail.com>
References: <20191206140653.2085561-1-thierry.reding@gmail.com>
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
index eda5e1d50828..499104c05668 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -993,11 +993,37 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
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
@@ -1277,21 +1303,12 @@ static int tegra_xusb_probe(struct platform_device *pdev)
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

