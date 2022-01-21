Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55250496262
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 16:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381719AbiAUPxZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 10:53:25 -0500
Received: from cable.insite.cz ([84.242.75.189]:46024 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1381703AbiAUPxY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 10:53:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C4E5AA1A3D409;
        Fri, 21 Jan 2022 16:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780402; bh=Azt+NgYvHftO8GMykcHOEWSYOSyRIy4YxvjOBrcevJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JYARj3680+Feaaz+h/j2RmIWjXqZUTFgYNxwqze3o6RamPXFIM0u5gyt7twjBt+W1
         A1BnMOahq8qhUpcJXZ4vPmQTPk6Y7w5JFX5PjFjEultxqFHzAgh3AYij9l7rgTWXzt
         WIfgeOIkMvSGH5H94NVIHkIOWErnXAtKiW1f3xNw=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QXm_lpvbbUd9; Fri, 21 Jan 2022 16:53:17 +0100 (CET)
Received: from precision.insite.cz (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 4CC79A1A3D40A;
        Fri, 21 Jan 2022 16:53:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1642780393; bh=Azt+NgYvHftO8GMykcHOEWSYOSyRIy4YxvjOBrcevJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Sie+DpMWV9v8afEDjAWD0o4s3B9gIiCtvoXn98r+oLMpsgNY+Kpjr3mzOpG8JVJ/g
         mRAkR+rsCL+zq/a3md9aRng/5kdFOhF3OueXzwIYNw0NteJuuZC5b0WSMVGA/t+5ee
         xZ/bdnLWmIoe4c+yvmBG542wxodYMZTIott6rg00=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v5 08/10] usb: gadget: u_audio: Add suspend call
Date:   Fri, 21 Jan 2022 16:53:06 +0100
Message-Id: <20220121155308.48794-9-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220121155308.48794-1-pavel.hofman@ivitera.com>
References: <20220121155308.48794-1-pavel.hofman@ivitera.com>
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

