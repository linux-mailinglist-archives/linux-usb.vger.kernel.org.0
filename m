Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22752489257
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 08:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241708AbiAJHmD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 02:42:03 -0500
Received: from cable.insite.cz ([84.242.75.189]:58797 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241868AbiAJHjy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 02:39:54 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 1F756A1A3D40F;
        Mon, 10 Jan 2022 08:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800276; bh=Kdv0naRxb7M8NzaoViDKR1YD2IHC8/Sx0jHEGDf47rA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AAZWfvwQUbDF6PHMCMWsQcMGgf5GivGF+K3uN/vT4rX+eJCYJby050AUKz4KD7Cob
         wWTf8kcZigRP+FysDJ12Dqmz2MlNl5PVC5eL3tfCcd/FMwOBVZScLXrfKm4Dcnq+Md
         StkFlaLReld8oNv+YZYHlHqxfIBgTlsk/B4/6Jzg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id i0A-wUwWBcyd; Mon, 10 Jan 2022 08:37:51 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 3FFA2A1A3D40B;
        Mon, 10 Jan 2022 08:37:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800267; bh=Kdv0naRxb7M8NzaoViDKR1YD2IHC8/Sx0jHEGDf47rA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C2ScJyxlLz2B+J9pMgmbl8WM3m6ezk343WBFiNaQdeYa2AvTsH8ErrjF9LYRjFde0
         FjAywLe9v4m0nXlJzFMbOF77oawLEY8fZoZqf4yRhRB0N76zXz3N6QkgwnokYo8Cwf
         uf/QSHli96wXs4xcxgscn5yygadNVkj2T0zCW6eU=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 10/10] usb: gadget: f_uac1: Add suspend callback
Date:   Mon, 10 Jan 2022 08:37:42 +0100
Message-Id: <20220110073742.394237-11-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110073742.394237-1-pavel.hofman@ivitera.com>
References: <20220110073742.394237-1-pavel.hofman@ivitera.com>
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

