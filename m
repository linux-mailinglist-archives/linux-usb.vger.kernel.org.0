Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B293647A603
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhLTI0D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:26:03 -0500
Received: from cable.insite.cz ([84.242.75.189]:46549 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234342AbhLTI0A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 03:26:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id A3BC7A1A3D403;
        Mon, 20 Dec 2021 09:25:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988755; bh=Zb6YZxBSNRSm20rGOOx/GOnHDVc+cQZuyDkHmzq8FeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qgJkyn9wsU/scZR67ztUuyBbqBdTOB4RTGiAG85mMswPFmagcFCJ+dK20lx0R7oTY
         F2aAEFkdZozn/as+zgLwNVGw/0LOOdIw6f5zLB/aLOf2gL8GjEZn2hPUHny/SrpEkR
         +xyqQZpm6/cBEq8NzUqN3Of9RAe41a2A7zJdkykc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id HD1sluq2Bp-3; Mon, 20 Dec 2021 09:25:50 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 8AEFAA1A3D409;
        Mon, 20 Dec 2021 09:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988746; bh=Zb6YZxBSNRSm20rGOOx/GOnHDVc+cQZuyDkHmzq8FeY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZsFgYwZssNwqOWQxxz4+FLEgdyBklfbv5pcf+4DLZr9jcUbslFpdbHZ7VVTvs5dLh
         exIZS23vbxI7D5hIe+3dbaUE+IHJveEpKxvpIfKD9An5+EMCvtpFN4H5aVZgn8aCRG
         80xKMfx0ihbNb3Wbz13VcXh5BtSa8zygISUzOt/k=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 09/11] usb: gadget: f_uac2: Adding suspend callback
Date:   Mon, 20 Dec 2021 09:25:40 +0100
Message-Id: <20211220082542.13750-10-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220082542.13750-1-pavel.hofman@ivitera.com>
References: <20211220082542.13750-1-pavel.hofman@ivitera.com>
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

