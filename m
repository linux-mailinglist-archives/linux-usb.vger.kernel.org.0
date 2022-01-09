Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E64488928
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235418AbiAIMAF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 07:00:05 -0500
Received: from cable.insite.cz ([84.242.75.189]:39832 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235410AbiAIMAD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 07:00:03 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C4DC0A1A3D406;
        Sun,  9 Jan 2022 13:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729601; bh=Kdv0naRxb7M8NzaoViDKR1YD2IHC8/Sx0jHEGDf47rA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SMkyBHAGbMKQITPJ3zvhLu3IcBv6dnfw3c86OF1oIA/hUjwcvEYyESLj+bz4fI3vH
         pGBpNeLQNw9JnzkKjsYucpc/FSLQbNKUPxZJEcXaazbhB41/ARdcspgiXjhJIJezVN
         KoV2e/8cTu7x27RnYmLghMmdzIesyCrMIh8b2+x8=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ZOP8s1SogXMX; Sun,  9 Jan 2022 12:59:55 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 08651A1A3D40C;
        Sun,  9 Jan 2022 12:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729593; bh=Kdv0naRxb7M8NzaoViDKR1YD2IHC8/Sx0jHEGDf47rA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gZo+R8PbB3Dp41El1m+X6+gPb/V8oN4EWD1i5q5/B5uwbfczoAPxkoZPJhyGgwYLA
         EYdBzYog75kex2+vgj2NykIL2VtXgzDJbQqJZbX9iXPVOrBDnTwhqTHHuEYrL9N0jE
         YdddWzpeWcYd6rv2AiryZv6Rw3Y2kaPIzDovigLc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 11/11] usb: gadget: f_uac1: Add suspend callback
Date:   Sun,  9 Jan 2022 12:59:46 +0100
Message-Id: <20220109115946.392818-12-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109115946.392818-1-pavel.hofman@ivitera.com>
References: <20220109115946.392818-1-pavel.hofman@ivitera.com>
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

