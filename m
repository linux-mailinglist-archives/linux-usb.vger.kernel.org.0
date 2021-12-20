Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE89D47B4D8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhLTVLs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:48 -0500
Received: from cable.insite.cz ([84.242.75.189]:41722 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230357AbhLTVLq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:46 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C2A3FA1A3D405;
        Mon, 20 Dec 2021 22:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034703; bh=foDRz/w+gGEj4ZWnc3EnCugl8u/3ze6aN+VG/9SZ+HQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=c+lQRzgSuHDEJHYSc74a9L1EvP1CyC84562djYpZ4J0IExQ1MsZMmn8fVD/+UwMcf
         pLAhXwCjd6f6/BI35bcxrKCTz0mQEaulXSMAxQmGVsowck/3+8cAn6ttixWdXtrPLN
         rRf9C9sJELrhTeEKzV7xqwTMfxKSuhDYzNApBCjQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gEt_g_mUPN28; Mon, 20 Dec 2021 22:11:38 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 2C34FA1A3D40A;
        Mon, 20 Dec 2021 22:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034695; bh=foDRz/w+gGEj4ZWnc3EnCugl8u/3ze6aN+VG/9SZ+HQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JLUFqZ1B+rNUtD9XnYKVzTOnFJRlu6p9/QWSo/vEwTcIuIxdMI58NHC3g0Gagvgas
         nwr/tXQIUi4SdKazE1/YtfzkrO3aXB7Mi6kFOYjjnzqbNZI2NiTIJFkin/SAcCCLRx
         BB10HHz1jGu8qLwtnH068pTKp+7ZwYlblIOx/uZc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 10/11] usb: gadget: f_uac1: Adding suspend callback
Date:   Mon, 20 Dec 2021 22:11:29 +0100
Message-Id: <20211220211130.88590-11-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding suspend callback to f_uac1 function, calling corresponding method
of u_audio in order to stop the respective PCM streams and to notify
subscribed clients about the stop.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/f_uac1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 7fd2b5580374..3eb16f1baf90 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -961,6 +961,14 @@ static void f_audio_disable(struct usb_function *f)
 		usb_ep_disable(uac1->int_ep);
 }
 
+static void
+f_audio_suspend(struct usb_function *f)
+{
+	struct f_uac1 *uac1 = func_to_uac1(f);
+
+	u_audio_suspend(&uac1->g_audio);
+}
+
 /*-------------------------------------------------------------------------*/
 static struct uac_feature_unit_descriptor *build_fu_desc(int chmask)
 {
@@ -1634,6 +1642,7 @@ static struct usb_function *f_audio_alloc(struct usb_function_instance *fi)
 	uac1->g_audio.func.get_alt = f_audio_get_alt;
 	uac1->g_audio.func.setup = f_audio_setup;
 	uac1->g_audio.func.disable = f_audio_disable;
+	uac1->g_audio.func.suspend = f_audio_suspend;
 	uac1->g_audio.func.free_func = f_audio_free;
 
 	return &uac1->g_audio.func;
-- 
2.25.1

