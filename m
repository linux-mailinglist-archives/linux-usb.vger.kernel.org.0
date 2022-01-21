Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088F1496261
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 16:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381717AbiAUPxY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 10:53:24 -0500
Received: from cable.insite.cz ([84.242.75.189]:47789 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381706AbiAUPxX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 10:53:23 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 57883A1A3D410;
        Fri, 21 Jan 2022 16:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780402; bh=KT+9PYcEW2PaXzj2ShUUvk7Rmsc4Ct6Xg+cgA6+QI9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gKlYf8XsxVtBns1nb2Rwrn8K52+xsCw/bZWExcMzTdCb9K9Oc8A/S9Dj/WVbJZ88I
         EW34/IHoIG8f5VdUVyO2zfFEzNDe+fq0BvweLjSQqAZ6V/jGqfansfvCq3Gg8dozRF
         srpfFZ2CbmOakcboiPOuVi0AHIQbNRh0isTPtm5I=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Srhn7axfN9jC; Fri, 21 Jan 2022 16:53:17 +0100 (CET)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id B2BD3A1A3D40B;
        Fri, 21 Jan 2022 16:53:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780393; bh=KT+9PYcEW2PaXzj2ShUUvk7Rmsc4Ct6Xg+cgA6+QI9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YoQaE95u+fP81jM58uinPP3QgPmUL44sOi3R+JpFPDSXXicW6YRXZLA0153IIWq5F
         4baWajjZof1DvJlAvnbIoBABnYoSE2zh5B+NK8bEBtWkqxcM8W54uUF81pxNTxAB6C
         8mGHevS6lIhL7MZqP848nH3SUIZFY1zS0SJFJ95M=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 09/10] usb: gadget: f_uac2: Add suspend callback
Date:   Fri, 21 Jan 2022 16:53:07 +0100
Message-Id: <20220121155308.48794-10-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121155308.48794-1-pavel.hofman@ivitera.com>
References: <20220121155308.48794-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When USB cable gets disconnected, the undergoing playback/capture
stalls, without any notification to u_audio about the change.
Experiments with a dwc2 gadget revealed that Suspend interrupt is
thrown at cable disconnection, which the gadget framework translates to
calling suspend callback of a function, if it is defined.

Add the suspend callback to f_uac2 function, calling
corresponding method of u_audio in order to stop the respective PCM
streams and to notify subscribed clients at cable disconnection.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
v3: fixed commit title and msg
---
 drivers/usb/gadget/function/f_uac2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 5ee5314780a6..3e6339439b88 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1433,6 +1433,14 @@ afunc_disable(struct usb_function *fn)
 		usb_ep_disable(uac2->int_ep);
 }
 
+static void
+afunc_suspend(struct usb_function *fn)
+{
+	struct f_uac2 *uac2 = func_to_uac2(fn);
+
+	u_audio_suspend(&uac2->g_audio);
+}
+
 static int
 in_rq_cur(struct usb_function *fn, const struct usb_ctrlrequest *cr)
 {
@@ -2104,6 +2112,7 @@ static struct usb_function *afunc_alloc(struct usb_function_instance *fi)
 	uac2->g_audio.func.set_alt = afunc_set_alt;
 	uac2->g_audio.func.get_alt = afunc_get_alt;
 	uac2->g_audio.func.disable = afunc_disable;
+	uac2->g_audio.func.suspend = afunc_suspend;
 	uac2->g_audio.func.setup = afunc_setup;
 	uac2->g_audio.func.free_func = afunc_free;
 
-- 
2.25.1

