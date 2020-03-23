Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9690518F278
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2020 11:12:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgCWKMG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Mar 2020 06:12:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:33880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727806AbgCWKMG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Mar 2020 06:12:06 -0400
Received: from localhost.localdomain (unknown [171.76.96.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C588120769;
        Mon, 23 Mar 2020 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584958325;
        bh=I84piociRfJNReDV/bDIgkbnPd+WahbYruudzZXan2k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l6mVJ3bkj890/6IqRVv7jIt8O5NL/HwGurcvguRVeb2xzdz4gtP0aoEDRRLDu3636
         g02HeTiiTo9v1Blh3qENLskRuDOet1jOrOyj9uRhT5vTiCdImYfV2EbVJPMCXGMA5z
         D1cEDlJrmFO58nLF8C6Uw+IF04OXYGovjsiG3q68=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/5] usb: xhci: provide a debugfs hook for erasing rom
Date:   Mon, 23 Mar 2020 15:41:21 +0530
Message-Id: <20200323101121.243906-6-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323101121.243906-1-vkoul@kernel.org>
References: <20200323101121.243906-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

run "echo 1 > /sys/kernel/debug/renesas-usb/rom_erase" to erase firmware
when driver is loaded.

Subsequent init of driver shall reload the firmware

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/xhci-pci-renesas.c | 35 +++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index d43b3a76dff5..c1088b07dfa9 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019-2020 Linaro Limited */
 
 #include <linux/acpi.h>
+#include <linux/debugfs.h>
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -162,6 +163,8 @@ static int renesas_fw_verify(struct pci_dev *dev,
 	return 0;
 }
 
+static void debugfs_init(struct pci_dev *pdev);
+
 static int renesas_check_rom_state(struct pci_dev *pdev)
 {
 	u16 rom_state;
@@ -194,9 +197,11 @@ static int renesas_check_rom_state(struct pci_dev *pdev)
 		/* Check the "Result Code" Bits (6:4) and act accordingly */
 		switch (rom_state & RENESAS_ROM_STATUS_RESULT) {
 		case RENESAS_ROM_STATUS_SUCCESS:
+			debugfs_init(pdev);
 			return 0;
 
 		case RENESAS_ROM_STATUS_NO_RESULT: /* No result yet */
+			debugfs_init(pdev);
 			return 0;
 
 		case RENESAS_ROM_STATUS_ERROR: /* Error State */
@@ -450,6 +455,34 @@ static void renesas_rom_erase(struct pci_dev *pdev)
 	dev_dbg(&pdev->dev, "ROM Erase... Done success\n");
 }
 
+static int debugfs_rom_erase(void *data, u64 value)
+{
+	struct pci_dev *pdev = data;
+
+	if (value == 1) {
+		dev_dbg(&pdev->dev, "Userspace requested ROM erase\n");
+		renesas_rom_erase(pdev);
+		return 0;
+	}
+	return -EINVAL;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(rom_erase_ops, NULL, debugfs_rom_erase, "%llu\n");
+
+static struct dentry *debugfs_root;
+
+static void debugfs_init(struct pci_dev *pdev)
+{
+	debugfs_root = debugfs_create_dir("renesas_usb", NULL);
+
+	debugfs_create_file("rom_erase", 0200, debugfs_root,
+			    pdev, &rom_erase_ops);
+}
+
+static void debugfs_exit(void)
+{
+	debugfs_remove_recursive(debugfs_root);
+}
+
 static bool renesas_download_rom(struct pci_dev *pdev,
 				 const u32 *fw, size_t step)
 {
@@ -761,6 +794,8 @@ int renesas_xhci_pci_probe(struct pci_dev *dev,
 
 int renesas_xhci_pci_remove(struct pci_dev *dev)
 {
+	debugfs_exit();
+
 	if (renesas_fw_check_running(dev)) {
 		/*
 		 * bail out early, if this was a renesas device w/o FW.
-- 
2.25.1

