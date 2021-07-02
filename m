Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69DD43BA189
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jul 2021 15:44:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhGBNql (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jul 2021 09:46:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:49498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232524AbhGBNqk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Jul 2021 09:46:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7ADFA6142B;
        Fri,  2 Jul 2021 13:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625233448;
        bh=Yly/TIf/MZx8LTAVljg02k9Xq8sLMr72tdy7NFCAbdA=;
        h=From:To:Cc:Subject:Date:From;
        b=Qh14chdAI4iQ1d6txsYYJ7JprOLHZXwO2F1KfyB8113PBQGZoiyiIJS/gOtUlYg17
         eY2NbFbblTqAV3R6L19fb1BkzRoeeLhi6JeYfX5kSVDYfM8uvKo7krggjSSLKJrE9t
         egqOnsErEBWA/Sne7H8FrLT+OL4zgs6GReQRt+x5unxjR+W7JNHrUGctmWFGHHg9wZ
         GaKN8G4AHdkaZv2C10yxwMYWoFcaP1Lm7lkF8lQDjcBwohhcw/EIHR8xPxK8EyQG76
         TCDW0MEfL85fjsOOoIaW82BhiV2hZHQ2ZhphTnhGG/3iJ3BQL8YkG7fy2CQJNkh2+T
         HfgVGXsxz4deQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1lzJSf-0006Uw-2c; Fri, 02 Jul 2021 15:44:05 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH] USB: serial: io_edgeport: drop unused descriptor helper
Date:   Fri,  2 Jul 2021 15:43:48 +0200
Message-Id: <20210702134348.24924-1-johan@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Drop the unused (and not even compiled) string descriptor helper.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/io_edgeport.c | 33 --------------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/usb/serial/io_edgeport.c b/drivers/usb/serial/io_edgeport.c
index ea4edf5eed27..bdee78cc4a07 100644
--- a/drivers/usb/serial/io_edgeport.c
+++ b/drivers/usb/serial/io_edgeport.c
@@ -389,39 +389,6 @@ static void update_edgeport_E2PROM(struct edgeport_serial *edge_serial)
 	release_firmware(fw);
 }
 
-#if 0
-/************************************************************************
- *
- *  Get string descriptor from device
- *
- ************************************************************************/
-static int get_string_desc(struct usb_device *dev, int Id,
-				struct usb_string_descriptor **pRetDesc)
-{
-	struct usb_string_descriptor StringDesc;
-	struct usb_string_descriptor *pStringDesc;
-
-	dev_dbg(&dev->dev, "%s - USB String ID = %d\n", __func__, Id);
-
-	if (!usb_get_descriptor(dev, USB_DT_STRING, Id, &StringDesc,
-						sizeof(StringDesc)))
-		return 0;
-
-	pStringDesc = kmalloc(StringDesc.bLength, GFP_KERNEL);
-	if (!pStringDesc)
-		return -1;
-
-	if (!usb_get_descriptor(dev, USB_DT_STRING, Id, pStringDesc,
-							StringDesc.bLength)) {
-		kfree(pStringDesc);
-		return -1;
-	}
-
-	*pRetDesc = pStringDesc;
-	return 0;
-}
-#endif
-
 static void dump_product_info(struct edgeport_serial *edge_serial,
 			      struct edgeport_product_info *product_info)
 {
-- 
2.31.1

