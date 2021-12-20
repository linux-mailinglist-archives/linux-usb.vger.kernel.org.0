Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F9E47B4D9
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhLTVLt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:49 -0500
Received: from cable.insite.cz ([84.242.75.189]:33987 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230370AbhLTVLq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:46 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C35D1A1A3D407;
        Mon, 20 Dec 2021 22:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034703; bh=Zb6YZxBSNRSm20rGOOx/GOnHDVc+cQZuyDkHmzq8FeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DzjOWCO52wg8xV73N2nmkdIGPi6ijRUcyTdQ002nuOOmd1XRlFwoxIjhDYKRgjaFJ
         /e50fL7YDXFaWBROi1A3A8LXC9WhsKrwpR4zEs+1UHGpSwy6ugyJoixYusZXsVhWEj
         ymXJKHUd0lC0jZ/RwbxzqVI27NDp+PNz4JxPro/A=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id l612ALjYZXSs; Mon, 20 Dec 2021 22:11:38 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id D0679A1A3D409;
        Mon, 20 Dec 2021 22:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034695; bh=Zb6YZxBSNRSm20rGOOx/GOnHDVc+cQZuyDkHmzq8FeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QbGn3Busa/Zug6RpRz7Zq4xKiMPLcCR3QuwJVFdEv+ukL2cPaXhjeqit0xTq0i9Ca
         jO5QFI5IRoMapi02ubomuENkjlr8eldjnq7b3E0XwYbxdCV2wJ5ACCHyyJ1NohN7Zt
         P3PSISv5kL0sYaEROcMhIERblVXRrKtYo8YtslbA=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 09/11] usb: gadget: f_uac2: Adding suspend callback
Date:   Mon, 20 Dec 2021 22:11:28 +0100
Message-Id: <20211220211130.88590-10-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
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

This patch adds the suspend callback to f_uac2 function, calling
corresponding method of u_audio in order to stop the respective PCM
streams and to notify subscribed clients at cable disconnection.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index ef8e39e80523..984f757de5a4 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1430,6 +1430,14 @@ afunc_disable(struct usb_function *fn)
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
@@ -2047,6 +2055,7 @@ static struct usb_function *afunc_alloc(struct usb_function_instance *fi)
 	uac2->g_audio.func.set_alt = afunc_set_alt;
 	uac2->g_audio.func.get_alt = afunc_get_alt;
 	uac2->g_audio.func.disable = afunc_disable;
+	uac2->g_audio.func.suspend = afunc_suspend;
 	uac2->g_audio.func.setup = afunc_setup;
 	uac2->g_audio.func.free_func = afunc_free;
 
-- 
2.25.1

