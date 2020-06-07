Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F001F0CF0
	for <lists+linux-usb@lfdr.de>; Sun,  7 Jun 2020 18:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgFGQYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Jun 2020 12:24:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:49836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgFGQYX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 7 Jun 2020 12:24:23 -0400
Received: from localhost.localdomain (unknown [157.51.228.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 642D42067B;
        Sun,  7 Jun 2020 16:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591547063;
        bh=fFoDKeB402RPaZ30lWRnaWtGGIGIaStgUveP8+V815U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YWNlZmoxDenF24Xvqgxo0uTUV28Ocb+71oZ/6eCX2hAVh9Sk3epHLXrKEQWAFYacu
         x9d7VBL62l0fGD1pMWfy6Jza0bMGx1xRGOjRIhPAQJ7lnq8fHUim6bgYwsD6W2EqLK
         +z+esVgpuQ6d7s0MCWxybNdKCRB7SItq34GtG8cU=
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     johan@kernel.org, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        patong.mxl@gmail.com, linus.walleij@linaro.org,
        mchehab+huawei@kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Subject: [RESEND PATCH v4 3/3] usb: cdc-acm: Ignore Exar XR21V141X when serial driver is built
Date:   Sun,  7 Jun 2020 21:53:50 +0530
Message-Id: <20200607162350.21297-4-mani@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200607162350.21297-1-mani@kernel.org>
References: <20200607162350.21297-1-mani@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The RTS/CTS line discipline for this device doesn't follow
the standard. So, in order to properly support TX, a separate
driver is needed.

Ensure that cdc_acm will ignore it during probe time, if the
Kernel is built with support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/usb/class/cdc-acm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 84d6f7df09a4..30e20d06d044 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1864,6 +1864,12 @@ static const struct usb_device_id acm_ids[] = {
 	},
 #endif
 
+#if IS_ENABLED(CONFIG_USB_SERIAL_XR)
+	{ USB_DEVICE(0x04e2, 0x1410),   /* Ignore XR21V141X USB to Serial converter */
+	.driver_info = IGNORE_DEVICE,
+	},
+#endif
+
 	/*Samsung phone in firmware update mode */
 	{ USB_DEVICE(0x04e8, 0x685d),
 	.driver_info = IGNORE_DEVICE,
-- 
2.17.1

