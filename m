Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0640747A604
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 09:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbhLTI0E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 03:26:04 -0500
Received: from cable.insite.cz ([84.242.75.189]:47625 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234640AbhLTI0B (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 03:26:01 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C1A80A1A3D405;
        Mon, 20 Dec 2021 09:25:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988755; bh=foDRz/w+gGEj4ZWnc3EnCugl8u/3ze6aN+VG/9SZ+HQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=et5xwcvhmKNaw1Rw+gTuWOw2rGy9AeQhkpE4Sf95qNRw2CXyOCOyPDb7/cvfbppq+
         +MkBky5GJWFODR/JQvO5eAZyO3q+TSLpxbmzPnElr4jEvBQD0/umlAiREtIs4cNcKy
         2c95pT3dlczjjzPM9tKHkbURky4lq+KRZE8uayDg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7BNIyXqMVn-m; Mon, 20 Dec 2021 09:25:50 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id DA27EA1A3D40A;
        Mon, 20 Dec 2021 09:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1639988747; bh=foDRz/w+gGEj4ZWnc3EnCugl8u/3ze6aN+VG/9SZ+HQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jiKg8gHQ1g6ivxIk2NEzPDSC3RzgwfyfNhXcq9ffH5VIXEwRAvRktqffW+o/quVzi
         pwfmA1/0GQZp+5ojRFLHmCwCB14dfO59taEmLT65FwtFVlOhA8oJOLbrC3oEBIVTGl
         Bne6wMPErVlcRxQHf0fadVVDegSMQMg6pjZhjyDw=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 10/11] usb: gadget: f_uac1: Adding suspend callback
Date:   Mon, 20 Dec 2021 09:25:41 +0100
Message-Id: <20211220082542.13750-11-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220082542.13750-1-pavel.hofman@ivitera.com>
References: <20211220082542.13750-1-pavel.hofman@ivitera.com>
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

