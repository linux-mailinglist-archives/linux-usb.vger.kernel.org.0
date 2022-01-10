Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F5648927A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 08:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241400AbiAJHnc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 02:43:32 -0500
Received: from cable.insite.cz ([84.242.75.189]:58930 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241863AbiAJHjw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 02:39:52 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id E2368A1A3D401;
        Mon, 10 Jan 2022 08:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800275; bh=Azt+NgYvHftO8GMykcHOEWSYOSyRIy4YxvjOBrcevJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GQWEHnMaTcUjA/MZxCBED+gChdrpKp1s15UvC0GNbqUldVLSaWnQP8RFtsHmfzE4J
         /qPK9xVewGwUswK1ymUn/vszcvJVuzVNp5SiPS5AWEazBwIM+f3osNNhbHSicflvs5
         reWjU1Ypa5rX/m9ZHjVGxQb4BIMAk4LBtiRofbhQ=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id hQ5eFBLWKxAN; Mon, 10 Jan 2022 08:37:50 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 826D9A1A3D409;
        Mon, 10 Jan 2022 08:37:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800266; bh=Azt+NgYvHftO8GMykcHOEWSYOSyRIy4YxvjOBrcevJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N3G5K67aG1jkRxOxok70U3StB3a8baNibG5lHRA8zy5Y6D8wJgLaQKojqaEJ5KFcV
         VXtdA/5+mahjnxGhXoRxi+cQV3YbMBJ8YiFoP6ScPWycS7LDc72ovNYy+WtydaDvLk
         bUPmCYcCR1kkMByznHHh32R7x6HPjjw2fZNHifIM=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 08/10] usb: gadget: u_audio: Add suspend call
Date:   Mon, 10 Jan 2022 08:37:40 +0100
Message-Id: <20220110073742.394237-9-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110073742.394237-1-pavel.hofman@ivitera.com>
References: <20220110073742.394237-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add exported method u_audio_suspend which sets stream status to
inactive and sends notifications. The method does not free any
resources.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
v3:
* fixed commit title
* removed stopping substreams (moved to a separate patch series)
* calling set_active(false) instead of the removed set_srate(0)
* updated commit msg
---
 drivers/usb/gadget/function/u_audio.c | 9 +++++++++
 drivers/usb/gadget/function/u_audio.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index fab1bc439002..2bb569895a90 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -757,6 +757,15 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
 
+void u_audio_suspend(struct g_audio *audio_dev)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+
+	set_active(&uac->p_prm, false);
+	set_active(&uac->c_prm, false);
+}
+EXPORT_SYMBOL_GPL(u_audio_suspend);
+
 int u_audio_get_volume(struct g_audio *audio_dev, int playback, s16 *val)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 5e6ed0f31cc3..9512b8fccfaa 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -130,4 +130,6 @@ int u_audio_set_volume(struct g_audio *g_audio, int playback, s16 val);
 int u_audio_get_mute(struct g_audio *g_audio, int playback, int *val);
 int u_audio_set_mute(struct g_audio *g_audio, int playback, int val);
 
+void u_audio_suspend(struct g_audio *g_audio);
+
 #endif /* __U_AUDIO_H */
-- 
2.25.1

