Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 608DC247F42
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 09:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbgHRHRx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 03:17:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:47380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbgHRHRw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 Aug 2020 03:17:52 -0400
Received: from localhost.localdomain (unknown [122.171.38.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4165D205CB;
        Tue, 18 Aug 2020 07:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597735072;
        bh=kWDCs6LXZn2ssp8OT7cyDs/w0TvpT8raWUw8rXcIxtg=;
        h=From:To:Cc:Subject:Date:From;
        b=Z+IJKwKfMcfb8xleXJHfeTNTZKaLSWURIJbPSpaci0lnXOIL8xjJt/hOmxUNNuFiE
         BYlTVO9lGqPHhwfblp0lb0l3gN4BQhc0a9+UHMJ815seNpKyJ1t63KkvJjkqDUnmFq
         tMBWak7WmMKMr4UPt2oY4LtSgErxMPTJZHKPzdkg=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: renesas-xhci: remove version check
Date:   Tue, 18 Aug 2020 12:47:39 +0530
Message-Id: <20200818071739.789720-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some devices in wild are reporting bunch of firmware versions, so remove
the check for versions in driver

Reported by: Anastasios Vacharakis <vacharakis@gmail.com>
Reported by: Glen Journeay <journeay@gmail.com>
Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=208911
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
Changes in v3:
 - drop additional firmware versions and remove the check

Greg, this fixes regression for folks with preprogrammed controllers
please mark as stable material

 drivers/usb/host/xhci-pci-renesas.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index 59b1965ad0a3..f97ac9f52bf4 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -50,20 +50,6 @@
 #define RENESAS_RETRY	10000
 #define RENESAS_DELAY	10
 
-#define ROM_VALID_01 0x2013
-#define ROM_VALID_02 0x2026
-
-static int renesas_verify_fw_version(struct pci_dev *pdev, u32 version)
-{
-	switch (version) {
-	case ROM_VALID_01:
-	case ROM_VALID_02:
-		return 0;
-	}
-	dev_err(&pdev->dev, "FW has invalid version :%d\n", version);
-	return -EINVAL;
-}
-
 static int renesas_fw_download_image(struct pci_dev *dev,
 				     const u32 *fw, size_t step, bool rom)
 {
@@ -202,10 +188,7 @@ static int renesas_check_rom_state(struct pci_dev *pdev)
 
 	version &= RENESAS_FW_VERSION_FIELD;
 	version = version >> RENESAS_FW_VERSION_OFFSET;
-
-	err = renesas_verify_fw_version(pdev, version);
-	if (err)
-		return err;
+	dev_dbg(&pdev->dev, "Found ROM version: %x\n", version);
 
 	/*
 	 * Test if ROM is present and loaded, if so we can skip everything
-- 
2.26.2

