Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72B40132672
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 13:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728156AbgAGMjG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 07:39:06 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51918 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728138AbgAGMjF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 07:39:05 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1ioo8T-0002Dm-Op; Tue, 07 Jan 2020 12:39:01 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-usb@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][V3] usb: ohci-da8xx: ensure error return on variable error is set
Date:   Tue,  7 Jan 2020 12:39:01 +0000
Message-Id: <20200107123901.101190-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when an error occurs when calling devm_gpiod_get_optional or
calling gpiod_to_irq it causes an uninitialized error return in variable
'error' to be returned.  Fix this by ensuring the error variable is set
from da8xx_ohci->oc_gpio and oc_irq.

Thanks to Dan Carpenter for spotting the uninitialized error in the
gpiod_to_irq failure case.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: d193abf1c913 ("usb: ohci-da8xx: add vbus and overcurrent gpios")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: fix typo and grammar in commit message
V3: fix gpiod_to_irq error case, re-write commit message

---
 drivers/usb/host/ohci-da8xx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ohci-da8xx.c b/drivers/usb/host/ohci-da8xx.c
index 38183ac438c6..1371b0c249ec 100644
--- a/drivers/usb/host/ohci-da8xx.c
+++ b/drivers/usb/host/ohci-da8xx.c
@@ -415,13 +415,17 @@ static int ohci_da8xx_probe(struct platform_device *pdev)
 	}
 
 	da8xx_ohci->oc_gpio = devm_gpiod_get_optional(dev, "oc", GPIOD_IN);
-	if (IS_ERR(da8xx_ohci->oc_gpio))
+	if (IS_ERR(da8xx_ohci->oc_gpio)) {
+		error = PTR_ERR(da8xx_ohci->oc_gpio);
 		goto err;
+	}
 
 	if (da8xx_ohci->oc_gpio) {
 		oc_irq = gpiod_to_irq(da8xx_ohci->oc_gpio);
-		if (oc_irq < 0)
+		if (oc_irq < 0) {
+			error = oc_irq;
 			goto err;
+		}
 
 		error = devm_request_threaded_irq(dev, oc_irq, NULL,
 				ohci_da8xx_oc_thread, IRQF_TRIGGER_RISING |
-- 
2.24.0

