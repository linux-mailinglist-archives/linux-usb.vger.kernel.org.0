Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6469B501FE
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jun 2019 08:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbfFXGPL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jun 2019 02:15:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:53518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727318AbfFXGPK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jun 2019 02:15:10 -0400
Received: from localhost.localdomain (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 906EE2146F;
        Mon, 24 Jun 2019 06:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561356909;
        bh=HVwwUjSOfRYewg5i8Jp9AiL7VWVq9IgT9SSCehh/aRk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f6O3it0X8EQ7gvwxn2z8al1u5mfVzAoMX+wSAfJaLBFeiSjthQt+qIv7EIiu8viOH
         Sp66QjyDFcBoQiwyhWi5McLWqp+4BUaT8+BnR4060Aw46ScTdV8QR+gDp/KBGopVL4
         8Q03X/CWOarmhDo8sXvfxNM7olCOu4vwRLJa2DL8=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v3 4/4] usb: xhci: allow multiple firmware versions
Date:   Mon, 24 Jun 2019 11:41:26 +0530
Message-Id: <20190624061126.11938-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624061126.11938-1-vkoul@kernel.org>
References: <20190624061126.11938-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Allow multiple firmware file versions in table and load them in
increasing order as we find them in the file system.

Tested-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>
---
 drivers/usb/host/xhci-pci.c | 47 +++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2b80c0ce48a8..bac73f28ee0b 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -336,13 +336,20 @@ static const struct renesas_fw_entry {
 	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
 	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
 	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
+	 *
+	 *  Entry expected_version should be kept in increasing order for a
+	 *  chip, so that driver will pick first version and if that fails
+	 *  then next one will be picked
 	 */
 	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
+	{ "K2026090.mem", 0x0014, 0x03, 0x2026 },
 	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
+	{ "K2026090.mem", 0x0015, 0x02, 0x2026 },
 	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
 };
 
 MODULE_FIRMWARE("K2013080.mem");
+MODULE_FIRMWARE("K2026090.mem");
 
 static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
 {
@@ -363,6 +370,24 @@ static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
 	return NULL;
 }
 
+static const struct
+renesas_fw_entry *renesas_get_next_entry(struct pci_dev *dev,
+					 const struct renesas_fw_entry *entry)
+{
+	const struct renesas_fw_entry *next_entry;
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(renesas_fw_table); i++) {
+		next_entry = &renesas_fw_table[i];
+		if (next_entry->device == dev->device &&
+		    next_entry->revision == dev->revision &&
+		    next_entry->expected_version < entry->expected_version)
+			return next_entry;
+	}
+
+	return NULL;
+}
+
 static int renesas_fw_download_image(struct pci_dev *dev,
 				     const u32 *fw,
 				     size_t step)
@@ -705,6 +730,7 @@ struct renesas_fw_ctx {
 	struct pci_dev *pdev;
 	const struct pci_device_id *id;
 	bool resume;
+	const struct renesas_fw_entry *entry;
 };
 
 static int xhci_pci_probe(struct pci_dev *pdev,
@@ -964,13 +990,29 @@ static void renesas_fw_callback(const struct firmware *fw,
 	struct renesas_fw_ctx *ctx = context;
 	struct pci_dev *pdev = ctx->pdev;
 	struct device *parent = pdev->dev.parent;
+	const struct renesas_fw_entry *next_entry;
 	bool rom;
 	int err;
 
 	if (!fw) {
 		dev_err(&pdev->dev, "firmware failed to load\n");
-
-		goto cleanup;
+		/*
+		 * we didn't find firmware, check if we have another
+		 * entry for this device
+		 */
+		next_entry = renesas_get_next_entry(ctx->pdev, ctx->entry);
+		if (next_entry) {
+			ctx->entry = next_entry;
+			dev_dbg(&pdev->dev, "Found next entry, requesting: %s\n",
+				next_entry->firmware_name);
+			request_firmware_nowait(THIS_MODULE, 1,
+						next_entry->firmware_name,
+						&pdev->dev, GFP_KERNEL,
+						ctx, renesas_fw_callback);
+			return;
+		} else {
+			goto cleanup;
+		}
 	}
 
 	err = renesas_fw_verify(pdev, fw->data, fw->size);
@@ -1068,6 +1110,7 @@ static int renesas_fw_download_to_hw(struct pci_dev *pdev,
 	ctx->pdev = pdev;
 	ctx->resume = do_resume;
 	ctx->id = id;
+	ctx->entry = entry;
 
 	pci_dev_get(pdev);
 	err = request_firmware_nowait(THIS_MODULE, 1, entry->firmware_name,
-- 
2.20.1

