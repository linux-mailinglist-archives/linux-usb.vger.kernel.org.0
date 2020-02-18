Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 334D916300E
	for <lists+linux-usb@lfdr.de>; Tue, 18 Feb 2020 20:33:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgBRTdW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Feb 2020 14:33:22 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41707 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726481AbgBRTdU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Feb 2020 14:33:20 -0500
Received: by mail-wr1-f66.google.com with SMTP id c9so25420559wrw.8
        for <linux-usb@vger.kernel.org>; Tue, 18 Feb 2020 11:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FhP33f76rG+2Qj5CzOw/Y5VWMBQgpWuzrnyIzrFTRug=;
        b=rxlXAX64TS/KCHzcquPeVDjrlKmhePjl7Da7rcF8lconyP93SOoeZRkpAzD8fKtmwN
         GyZ52w3D8vQQhcN0UUHGGogGIQCSCsYLLhHmeUAbg5p0Zi1Qe3hj+pxbxKIkp0WTEgti
         wG6PFqRUclRWAZQOQOFkcEm4BxOBBPj7tMZV63K1ptJfpRV6x2VWltJmPpPVgH7cPiRR
         x4UFbSTU64A9kFo4Be1Caj3s2qyIctoiCWCsBNZBuemmG2DOnqTlMNeLNYbRviohmz31
         SUrXmmqVSlasXdBJbXfR+6bKA2L/2Fe2/3siHfd886mRj4AtRBGDMaayfe+49fq18sBZ
         rarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FhP33f76rG+2Qj5CzOw/Y5VWMBQgpWuzrnyIzrFTRug=;
        b=dptV/i9J1c6bD6oA4H6+SwVGDpLRWx5otwfPUP0FNYg7e/gJUh9bY3uKrnhtkrhwqQ
         e/sYp2ldNsmtJRKF1bod9GdFn6U33sFSWgP5zhb7Hp2k37uEuJCjdV+nY8F1j9a/eS4X
         KGlDsed7cSf+1mjRqjHRbln3LuwoG9vk52MRYT7zFBq3bBLHKvoqBekKB6+ngkn0KsQL
         qKPbIsLPLQY17gBKTpq+pBnj8UpSIM6AadVx/kmkxncKrDQaTiV8kzlqxRTxO9qQrZHK
         6h0V8AjklhixkjCgiz/+Kdy266RAxypFk98TIhTffSR1jRYvEOg+lDo7JvlI9yo+PNVH
         t2rw==
X-Gm-Message-State: APjAAAVH+e2JTr+J7xYw71eM67+BxrqLzLf4DOACI+Z3ol41oGru1GUi
        pSu8F7UF/KkYBiiahfJZL43PxA==
X-Google-Smtp-Source: APXvYqxhujNKLgxfrSjYnJS/zwBxDj7zsb/kp7GsJVcV6m1WCw9TcjWQNQ1Ew3Vn+k2gChJtTAvicA==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr32416868wrm.219.1582054397663;
        Tue, 18 Feb 2020 11:33:17 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id k16sm7649266wru.0.2020.02.18.11.33.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 18 Feb 2020 11:33:17 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, b-liu@ti.com, balbi@kernel.org,
        gregkh@linuxfoundation.org, ludovic.desroches@microchip.com,
        mathias.nyman@intel.com, nicolas.ferre@microchip.com,
        slemieux.tyco@gmail.com, stern@rowland.harvard.edu, vz@mleia.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 03/20] usb: gadget: udc: amd5536udc_pci: remove useless cast for driver.name
Date:   Tue, 18 Feb 2020 19:32:46 +0000
Message-Id: <1582054383-35760-4-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
References: <1582054383-35760-1-git-send-email-clabbe@baylibre.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

pci_driver name is const char pointer, so it not useful to cast
name (which is already const char).

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/usb/gadget/udc/amd5536udc_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/amd5536udc_pci.c b/drivers/usb/gadget/udc/amd5536udc_pci.c
index bfd1c9e80a1f..80685e4306f3 100644
--- a/drivers/usb/gadget/udc/amd5536udc_pci.c
+++ b/drivers/usb/gadget/udc/amd5536udc_pci.c
@@ -202,7 +202,7 @@ MODULE_DEVICE_TABLE(pci, pci_id);
 
 /* PCI functions */
 static struct pci_driver udc_pci_driver = {
-	.name =		(char *) name,
+	.name =		name,
 	.id_table =	pci_id,
 	.probe =	udc_pci_probe,
 	.remove =	udc_pci_remove,
-- 
2.24.1

