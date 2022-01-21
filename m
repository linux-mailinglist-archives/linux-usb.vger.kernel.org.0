Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCFB4496263
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 16:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381721AbiAUPx0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 10:53:26 -0500
Received: from cable.insite.cz ([84.242.75.189]:39078 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381701AbiAUPxY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 10:53:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id CA5F1A1A3D40B;
        Fri, 21 Jan 2022 16:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780402; bh=Kdv0naRxb7M8NzaoViDKR1YD2IHC8/Sx0jHEGDf47rA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eOV34ctSRGsglJxbJqkZtLtcQylrp29souqSXHXjy12VEygIQEimazOYO+0kzRUno
         vIX2YKaTJ6M7URO/iB6P6fssErSCh4kyflQagHS4ADj4idWxM4lWzny/27k0DEud/Q
         igw2xHvlmyZuyrRL9aIyJC1ohqstPn4s371ElXbY=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tMZ1dGSSn33T; Fri, 21 Jan 2022 16:53:17 +0100 (CET)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 1386FA1A3D40C;
        Fri, 21 Jan 2022 16:53:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780394; bh=Kdv0naRxb7M8NzaoViDKR1YD2IHC8/Sx0jHEGDf47rA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aYddEvDJe7GRu9PR8uTro3gb9adCYIMCISQogNHFUJ1hY+MYQpOERFpMvB1Ysq3wN
         4cSCnldlj6BL3piSsmZrYlEGIS+xOnAPMHibY98vhe1uC4kKi0RSQg4uBbAltmLveU
         SdlwVe9DenEkJWIEVyMTlp9jlwuu402ZdSQBpd6o=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 10/10] usb: gadget: f_uac1: Add suspend callback
Date:   Fri, 21 Jan 2022 16:53:08 +0100
Message-Id: <20220121155308.48794-11-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121155308.48794-1-pavel.hofman@ivitera.com>
References: <20220121155308.48794-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add suspend callback to f_uac1 function, calling corresponding method
of u_audio in order to stop the respective PCM streams and to notify
subscribed clients about the stop.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
v3: fixed commit title and msg
---
 drivers/usb/gadget/function/f_uac1.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 73df76a6fbe0..1484e5c231d3 100644
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
@@ -1691,6 +1699,7 @@ static struct usb_function *f_audio_alloc(struct usb_function_instance *fi)
 	uac1->g_audio.func.get_alt = f_audio_get_alt;
 	uac1->g_audio.func.setup = f_audio_setup;
 	uac1->g_audio.func.disable = f_audio_disable;
+	uac1->g_audio.func.suspend = f_audio_suspend;
 	uac1->g_audio.func.free_func = f_audio_free;
 
 	return &uac1->g_audio.func;
-- 
2.25.1

