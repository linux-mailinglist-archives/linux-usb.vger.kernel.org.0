Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939C648927B
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 08:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242797AbiAJHnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 02:43:37 -0500
Received: from cable.insite.cz ([84.242.75.189]:42706 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241864AbiAJHjw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 02:39:52 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 13D11A1A3D403;
        Mon, 10 Jan 2022 08:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800276; bh=JDWMlpiTZbiUlav2r08a9TXgH+8MkZtOLufTWn4EFKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RqolqqhV82YeJs8NU3KmHNuLGBy0eKs7Z6ja+RtD0qWLTLaFW8b88sbuoucNYxuca
         PpTOVBKqeFiZjtgIj7I/eWsaljKa1bIAkciPKc02Opfx8jaJ+G9UCmC5LXqkkfttEf
         X/n4b5yqz5e0R9YOqEgi3eJl2wu/8s5+KSdm3Rp4=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id VxCp0LHzOskx; Mon, 10 Jan 2022 08:37:50 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id DC4C9A1A3D40A;
        Mon, 10 Jan 2022 08:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800267; bh=JDWMlpiTZbiUlav2r08a9TXgH+8MkZtOLufTWn4EFKw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czHqB8Dvc9fYZ6CRzjbjPwmDdch1xBTMMLTHV7bRDICKvtjHqq9IP4tLTC1e81Yzl
         KO4cgkJEiXlQUb6xXwnsf6Zfiiy5MzLZ7YgiywNN3VcO8NA/+UW7P5+i7mq+MW9wDB
         uENFUjd58IsSrZhTEm1jBAqDPe5JAsLz0YPFU2gc=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 09/10] usb: gadget: f_uac2: Add suspend callback
Date:   Mon, 10 Jan 2022 08:37:41 +0100
Message-Id: <20220110073742.394237-10-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110073742.394237-1-pavel.hofman@ivitera.com>
References: <20220110073742.394237-1-pavel.hofman@ivitera.com>
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
index 058a6a0b5444..6be60529cb25 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1432,6 +1432,14 @@ afunc_disable(struct usb_function *fn)
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
@@ -2103,6 +2111,7 @@ static struct usb_function *afunc_alloc(struct usb_function_instance *fi)
 	uac2->g_audio.func.set_alt = afunc_set_alt;
 	uac2->g_audio.func.get_alt = afunc_get_alt;
 	uac2->g_audio.func.disable = afunc_disable;
+	uac2->g_audio.func.suspend = afunc_suspend;
 	uac2->g_audio.func.setup = afunc_setup;
 	uac2->g_audio.func.free_func = afunc_free;
 
-- 
2.25.1

