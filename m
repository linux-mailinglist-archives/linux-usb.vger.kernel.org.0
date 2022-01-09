Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1449488924
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235407AbiAIMAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 07:00:02 -0500
Received: from cable.insite.cz ([84.242.75.189]:40232 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235397AbiAIMAB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 07:00:01 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E4395A1A3D409;
        Sun,  9 Jan 2022 12:59:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729599; bh=6FUm1JPI6LgJn/HJ46IHCpX6m5ZUqlurVcP/Kb5W6iU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VCI4l4pa8OqPNiYTc7PkOmr7WqKdkRfmg/DiVRdhS8ethbGs+6odZkMubC1Xc+rMh
         kHGS1AV9hN3iP2DHkXYvsqBGZ7mI/EaIaqHrW1ilLw575qy5S9VrZ/Pd6JzZHVjM2F
         7bJhQVjNdRTVXKzq5jwFMPV0VOHUYRx6QOb4dSAA=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QKzbZw9Y6ClN; Sun,  9 Jan 2022 12:59:53 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id DBE7CA1A3D407;
        Sun,  9 Jan 2022 12:59:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729591; bh=6FUm1JPI6LgJn/HJ46IHCpX6m5ZUqlurVcP/Kb5W6iU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DLruUMv1Ie/kCMuQSpwVfYyjGHYfJsh/FCixcBwsDBnvYVkw+mLVh5G2CV4aDnBmR
         3CTL2loOwqgplnYPH+RXKohu8k131TXCoTFx/3OEyWOOFOUtb+FYMjkAkCsB0YSNWH
         fgsP2PBYY9snn4BWVts0qn4Blqw60IOklL6CYjkI=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 06/11] usb: gadget: f_uac2: Rename Clock Sources to fixed names
Date:   Sun,  9 Jan 2022 12:59:41 +0100
Message-Id: <20220109115946.392818-7-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109115946.392818-1-pavel.hofman@ivitera.com>
References: <20220109115946.392818-1-pavel.hofman@ivitera.com>
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
v3:
* Renamed commit message
* Corrected STR_CLKSRC_IN/OUT capitalization
---
 drivers/usb/gadget/function/f_uac2.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 089da132913c..58e29cbf5d79 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -106,14 +106,11 @@ enum {
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
+	[STR_CLKSRC_IN].s = "Input Clock",
+	[STR_CLKSRC_OUT].s = "Output Clock",
 	[STR_USB_IT].s = "USBH Out",
 	[STR_IO_IT].s = "USBD Out",
 	[STR_USB_OT].s = "USBH In",
@@ -1066,9 +1063,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	init_p_srate = uac2_opts->p_srates[0];
 	init_c_srate = uac2_opts->c_srates[0];
 
-	snprintf(clksrc_in, sizeof(clksrc_in), "%uHz", init_p_srate);
-	snprintf(clksrc_out, sizeof(clksrc_out), "%uHz", init_c_srate);
-
 	ret = usb_interface_id(cfg, fn);
 	if (ret < 0) {
 		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
-- 
2.25.1

