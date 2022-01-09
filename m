Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59290488929
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235416AbiAIMAE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 07:00:04 -0500
Received: from cable.insite.cz ([84.242.75.189]:40143 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235400AbiAIMAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 07:00:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 8867AA1A3D407;
        Sun,  9 Jan 2022 13:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729600; bh=5GS4BMCLmtZbYhwfJukCCBnmcDwOw0TzFz75CF3nC+U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h+X2F2g02x4PTt1yQiGBRiABFRdqKkrmDkCu4tl2UyrIbyUufIA0gXO6atzdymnSD
         wT/dRxxyFnZ2ApMR4lNuS99f2hjNs1bCBCgma8GOpvvRUvcavswyK+EKNDU2F6Sce/
         TcyWAmbt9JaJ529B1fnkq2iQDJCsaN+b5f7B55jY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SviekYe2V-di; Sun,  9 Jan 2022 12:59:55 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 987EAA1A3D40B;
        Sun,  9 Jan 2022 12:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729592; bh=5GS4BMCLmtZbYhwfJukCCBnmcDwOw0TzFz75CF3nC+U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XbOAI5V3kTHE8N5XpE2hLdTlcB0psDz4wTj0Gr7QOJQExb8wkRMOGN9HcEytQAptg
         eioZdl2BUUCkxVg8+Yaikk3BlUIDCSn2cnrmttUQO2UNe2q9N4LagBvwpH4EOT6tz0
         90m6NXVgMXZHFGn9SZPCwLGreRcysTp1RIhRLzGI=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 10/11] usb: gadget: f_uac2: Add suspend callback
Date:   Sun,  9 Jan 2022 12:59:45 +0100
Message-Id: <20220109115946.392818-11-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109115946.392818-1-pavel.hofman@ivitera.com>
References: <20220109115946.392818-1-pavel.hofman@ivitera.com>
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
index 58e29cbf5d79..f55e72f55d34 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1436,6 +1436,14 @@ afunc_disable(struct usb_function *fn)
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
@@ -2107,6 +2115,7 @@ static struct usb_function *afunc_alloc(struct usb_function_instance *fi)
 	uac2->g_audio.func.set_alt = afunc_set_alt;
 	uac2->g_audio.func.get_alt = afunc_get_alt;
 	uac2->g_audio.func.disable = afunc_disable;
+	uac2->g_audio.func.suspend = afunc_suspend;
 	uac2->g_audio.func.setup = afunc_setup;
 	uac2->g_audio.func.free_func = afunc_free;
 
-- 
2.25.1

