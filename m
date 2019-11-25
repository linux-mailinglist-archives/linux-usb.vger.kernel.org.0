Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78F1A108DF2
	for <lists+linux-usb@lfdr.de>; Mon, 25 Nov 2019 13:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfKYMcW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Nov 2019 07:32:22 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44360 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbfKYMcW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Nov 2019 07:32:22 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so17767878wrn.11;
        Mon, 25 Nov 2019 04:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l3/Z1fhi0sT4mnf9G+kfrVr9ykZvAJKB2VFXTX41fH4=;
        b=Z0xoiP6vKJLT3wjGE2vIUh8hI6OzXfOl++d0fPX8V5vic4QI5C5lsb3Wg4Vu3xMTyW
         GpArEu3FYNaziu/Uw+hEvVGGzvqQQ6/aGodHzJdKLeyMEZZSfPf4fznpzVi35W4MIHqM
         BkBammKBUXixBceuCVFbuzBUrMK6dxF6gJYpj2tzjGEhj3eeVAz7tZ+wBuluus1+vsp8
         daG2KoTqXTitsPRAkEuPSI17SUZ/xFds+a+e+Orp88qDWlACYex5geDD11b+a10j1+uN
         exrf/gWdlhZBxCz9PjuMe5hcO/o57Bvzos6VzN4ioOUufJMFD70qhyPN0/AY2O9VSwdZ
         9C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l3/Z1fhi0sT4mnf9G+kfrVr9ykZvAJKB2VFXTX41fH4=;
        b=UC+QyglScPZ2rjcd+yS93VYLQhKKMzEbvxpMYQDnyuikGWqQ/m5/qkXM9IsG2U1c4E
         ZyenSbtG+dstKD8jn3fxXjjQ0CvVFNWRMLbcSnzlEc6Fi7rCeFqHEs2C7WIelQ9yoL0P
         9jVBgF/bTb5ElIsMD/g9lFhwuBc5xT0wxaBpYCnGmsc2XXunWccCxgiJmEUbzJb9rASZ
         DvblXl0pkfnGMB+w/7zxMpvhJvmN2WRbkqOkERhEr0zQxsMzj+qpD2Fe3V4o9IFl1EAa
         9beb0TaDDJILurARdv4O8mp4K8zi2+C87EjyPoC1NTWF84VBfjym+/1e7dOUGe9Sb9OE
         xW3A==
X-Gm-Message-State: APjAAAVXc8mDfTsWPK/wYi2ZtTad7PM0zO/Ll+DYSa9kRj3SgWt8mw8R
        Yq/dctnHoivMzp8LCstDqAg=
X-Google-Smtp-Source: APXvYqzQKPLYO9K/1bejokPpxq1E5pmB7z+1za15mWrySqAaV1k1t/q/7t0mfVX3KNjJNp213ykvjQ==
X-Received: by 2002:a5d:4983:: with SMTP id r3mr14731858wrq.134.1574685140280;
        Mon, 25 Nov 2019 04:32:20 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id t14sm10026180wrw.87.2019.11.25.04.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 04:32:19 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 04/10] usb: host: xhci-tegra: Use CNR as firmware ready indicator
Date:   Mon, 25 Nov 2019 13:32:04 +0100
Message-Id: <20191125123210.1564323-5-thierry.reding@gmail.com>
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

The Falcon CPU state is a suboptimal indicator for firmware readiness,
since the Falcon can be in a running state if the firmware is handling
port state changes or running other tasks. Instead, the driver should
check the STS_CNR bit to determine whether or not the firmware has been
successfully loaded and is ready for XHCI operation.

Based on work by JC Kuo <jckuo@nvidia.com>.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index d15fd16168ae..85642806fa2a 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -829,10 +829,10 @@ static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
 static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 {
 	unsigned int code_tag_blocks, code_size_blocks, code_blocks;
+	struct xhci_cap_regs __iomem *cap = tegra->regs;
 	struct tegra_xusb_fw_header *header;
-	struct xhci_cap_regs __iomem *cap;
-	struct xhci_op_regs __iomem *op;
 	struct device *dev = tegra->dev;
+	struct xhci_op_regs __iomem *op;
 	unsigned long timeout;
 	time64_t timestamp;
 	struct tm time;
@@ -840,6 +840,7 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	u32 value;
 
 	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
+	op = tegra->regs + HC_LENGTH(readl(&cap->hc_capbase));
 
 	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) != 0) {
 		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
@@ -915,21 +916,23 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	csb_writel(tegra, le32_to_cpu(header->boot_codetag),
 		   XUSB_FALC_BOOTVEC);
 
-	/* Boot Falcon CPU and wait for it to enter the STOPPED (idle) state. */
-	timeout = jiffies + msecs_to_jiffies(5);
-
+	/* Boot Falcon CPU and wait for USBSTS_CNR to get cleared. */
 	csb_writel(tegra, CPUCTL_STARTCPU, XUSB_FALC_CPUCTL);
 
-	while (time_before(jiffies, timeout)) {
-		if (csb_readl(tegra, XUSB_FALC_CPUCTL) == CPUCTL_STATE_STOPPED)
+	timeout = jiffies + msecs_to_jiffies(200);
+
+	do {
+		value = readl(&op->status);
+		if ((value & STS_CNR) == 0)
 			break;
 
-		usleep_range(100, 200);
-	}
+		usleep_range(1000, 2000);
+	} while (time_is_after_jiffies(timeout));
 
-	if (csb_readl(tegra, XUSB_FALC_CPUCTL) != CPUCTL_STATE_STOPPED) {
-		dev_err(dev, "Falcon failed to start, state: %#x\n",
-			csb_readl(tegra, XUSB_FALC_CPUCTL));
+	value = readl(&op->status);
+	if (value & STS_CNR) {
+		value = csb_readl(tegra, XUSB_FALC_CPUCTL);
+		dev_err(dev, "XHCI controller not read: %#010x\n", value);
 		return -EIO;
 	}
 
-- 
2.23.0

