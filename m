Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B19F1151EF
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 15:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbfLFOHG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 09:07:06 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40172 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfLFOHG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 09:07:06 -0500
Received: by mail-wr1-f66.google.com with SMTP id c14so7888838wrn.7;
        Fri, 06 Dec 2019 06:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6qGVGHfdM/Wp5RRvTX7w/dn6K0HWimE5nOttJ1eUSk=;
        b=mcpZUtg6092Qa5pY4jq0TT3fv6k3UagFoVoxPNMUy4Qx2JPqA79Cro60gKsgLcTW4U
         KSpQBmPCcfD8rjISG8vPPhyiLiNVpvOy1QJDJo1efQ8tR1eWcxaVvnGZTLjBROUeDB7f
         zjurhgichXf121gh39sMcl++ENXkFUhz5QN4CDvZB1RybSpu7kilEhaJU6D6G67tTjhi
         NIgdB0ffKLlbL9wGQyt9lzkVeS0wIaxlEqqbDffiEiqeLC5K+8ErnLaxlODbXcjrwkqr
         3IANL8Qo+XEb0QpB9y9tbNIMNLDMXSktsdtE9qi6whTrn9JjdzaHs+dCgX77U/aqKrRT
         KBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6qGVGHfdM/Wp5RRvTX7w/dn6K0HWimE5nOttJ1eUSk=;
        b=Pgq4qAXINduQBBatFkjZKPp6lwN07VeeSw7juXFie7xjf9F0PgHvGTCwFSbiD7ePE7
         SnqPruN4F+WASXRkGOkofYluo8joDYZCXidJwLMu1pImU+nmcqWIf5LMigGgKPJGUQ2B
         n+ScKZarKvOlHvLHxqkqL7zqNNgbUpsTy5nekOcVmx1T1wAnx4cEuJn3zZDMyCW4t4YY
         XbhvpxP6GTMWCMinPRxcJqebBVFWJUj0k1cg8prEeq38DGLYwuwZT8Q5jlneZdZs6+Q2
         ZNrAE+gleyIjglMJ5uInU2vOnGpLGypz9yN+T6YE7HFPDWCtMp0hqKBd4b69n/9IsXOW
         Lzag==
X-Gm-Message-State: APjAAAU9O4fHOFK+7c5EgAICwDPfAxaIE8krTJxP8TH/5SJCA1/yFpSz
        mB7Vz3MrzR8n4ZcOrIPr3c/3NaH+gtM=
X-Google-Smtp-Source: APXvYqxMOT9qUBfsvoexqn+Xb9cpF0Mx85XMHc5dBMzylOpDF4qcYzRi/DFxvMx1NiEbB6jWpZ83Mw==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr15820480wrs.222.1575641223565;
        Fri, 06 Dec 2019 06:07:03 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
        by smtp.gmail.com with ESMTPSA id v14sm16337035wrm.28.2019.12.06.06.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 06:07:02 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 04/10] usb: host: xhci-tegra: Use CNR as firmware ready indicator
Date:   Fri,  6 Dec 2019 15:06:47 +0100
Message-Id: <20191206140653.2085561-5-thierry.reding@gmail.com>
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
index e80fce712fd5..eda5e1d50828 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -830,10 +830,10 @@ static int tegra_xusb_request_firmware(struct tegra_xusb *tegra)
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
@@ -842,6 +842,7 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
 	int err;
 
 	header = (struct tegra_xusb_fw_header *)tegra->fw.virt;
+	op = tegra->regs + HC_LENGTH(readl(&cap->hc_capbase));
 
 	if (csb_readl(tegra, XUSB_CSB_MP_ILOAD_BASE_LO) != 0) {
 		dev_info(dev, "Firmware already loaded, Falcon state %#x\n",
@@ -911,21 +912,23 @@ static int tegra_xusb_load_firmware(struct tegra_xusb *tegra)
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

