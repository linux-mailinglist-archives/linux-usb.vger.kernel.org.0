Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B72747B4D4
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhLTVLp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:45 -0500
Received: from cable.insite.cz ([84.242.75.189]:58896 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230348AbhLTVLp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 7CDBBA1A3D40E;
        Mon, 20 Dec 2021 22:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034703; bh=5WV1/LEF/ad9TH3t2JcjjaLGwjbTNb/Fnr9SQbHJyLo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gbas27KOflMqf4ouGXMEGIwiP4hZ0N6V50X3DMf3G0bj2d/BCLREvWr9dJMfJFzLs
         gzx0Fq5eWXzdYwyodzUvqLFekF3mG5xxojssFJQV7BaPGFAI4BLLZrVkD1CKZL/Dqm
         fTXH/1bkW0vHAYfi0ejOzDQr2YcdAs6GChb8Va7w=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id F5N4q-MiiQTM; Mon, 20 Dec 2021 22:11:38 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 78A50A1A3D405;
        Mon, 20 Dec 2021 22:11:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034693; bh=5WV1/LEF/ad9TH3t2JcjjaLGwjbTNb/Fnr9SQbHJyLo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BAo9MII0g31/Wamy9wt2jBAvPtHPIqSQdNT36IRZYefr9DDSuXAbE4PO8i6rj0RYu
         rDrk78yKOZE+uMOokJeXJHKUkLSxsryexhoAOhNJn5UOq0bpQOWIcCqbjA4+4S+4Uy
         koW/+RYtNKL2/og+93lG7jLBkiRo5Tfd9sUyXa4k=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 05/11] usb: gadget: f_uac2: Renaming Clock Sources to fixed names
Date:   Mon, 20 Dec 2021 22:11:24 +0100
Message-Id: <20211220211130.88590-6-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Julian Scheel <julian@jusst.de>

The gadget no longer supports only one frequency. Therefore USB strings
corresponding to the clock sources are renamed from specific Hz value to
general names Input clock/Output clock.

Signed-off-by: Julian Scheel <julian@jusst.de>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac2.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 74e32bb146c7..ef8e39e80523 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -105,14 +105,11 @@ enum {
 	STR_AS_IN_ALT1,
 };
 
-static char clksrc_in[8];
-static char clksrc_out[8];
-
 static struct usb_string strings_fn[] = {
 	[STR_ASSOC].s = "Source/Sink",
 	[STR_IF_CTRL].s = "Topology Control",
-	[STR_CLKSRC_IN].s = clksrc_in,
-	[STR_CLKSRC_OUT].s = clksrc_out,
+	[STR_CLKSRC_IN].s = "Input clock",
+	[STR_CLKSRC_OUT].s = "Output clock",
 	[STR_USB_IT].s = "USBH Out",
 	[STR_IO_IT].s = "USBD Out",
 	[STR_USB_OT].s = "USBH In",
@@ -1058,9 +1055,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 		*bma = cpu_to_le32(control);
 	}
 
-	snprintf(clksrc_in, sizeof(clksrc_in), "%uHz", uac2_opts->p_srate);
-	snprintf(clksrc_out, sizeof(clksrc_out), "%uHz", uac2_opts->c_srate);
-
 	ret = usb_interface_id(cfg, fn);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-- 
2.25.1

