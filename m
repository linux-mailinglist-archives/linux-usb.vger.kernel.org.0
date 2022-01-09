Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBD00488923
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233893AbiAIL76 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 06:59:58 -0500
Received: from cable.insite.cz ([84.242.75.189]:53461 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233931AbiAIL74 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 06:59:56 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 76C89A1A3D401;
        Sun,  9 Jan 2022 12:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729595; bh=MPGFCCGcjvZKbwxi1N2MzoBvur+SGxEp8yzsT+01Q4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O0OvaT+sufr1lH9bh8NTH5VSgRU57GK9TemF+Ht7Sc43BnAuwjRt9gh87mcgS6Hji
         krMi6HJf9dMThbT8WthEQSDnA2FUq9zkNfbJpu4YHX1QvLZnjOv4Da6CFz1cGu7d29
         OkzaaEIqKdh6U6LsxQNQCAJxF8v0NiZZKp44GxvI=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TOsNUPO1hmm1; Sun,  9 Jan 2022 12:59:50 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id CFA72A1A3D405;
        Sun,  9 Jan 2022 12:59:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729590; bh=MPGFCCGcjvZKbwxi1N2MzoBvur+SGxEp8yzsT+01Q4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VL+VDtPEwi9c3/s/gtSHIcgapo0JeDGfo8M6wWAupq+0BoiTvt3ZqUb6oSESvBJ7L
         93yhEYln4Dt0tHxiQdXfHP4xHOefIwt+a1lvUUzjgD4Ul8sADWGI+kJHI9LKG0XGj9
         woYKF3UMpQJaevfezIT+6x43OK4QirrSGw9rxOLY=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 04/11] usb: gadget: u_audio: Add capture/playback srate getter
Date:   Sun,  9 Jan 2022 12:59:39 +0100
Message-Id: <20220109115946.392818-5-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109115946.392818-1-pavel.hofman@ivitera.com>
References: <20220109115946.392818-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

UAC1/UAC2 functions will need to query u_audio about the currently set
srate. Add the getter functions.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
v3: new patch
---
 drivers/usb/gadget/function/u_audio.c | 28 +++++++++++++++++++++++++++
 drivers/usb/gadget/function/u_audio.h |  2 ++
 2 files changed, 30 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index dce894dcae07..283a449a9538 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -515,6 +515,20 @@ int u_audio_set_capture_srate(struct g_audio *audio_dev, int srate)
 }
 EXPORT_SYMBOL_GPL(u_audio_set_capture_srate);
 
+int u_audio_get_capture_srate(struct g_audio *audio_dev, u32 *val)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
+	unsigned long flags;
+
+	prm = &uac->c_prm;
+	spin_lock_irqsave(&prm->lock, flags);
+	*val = prm->srate;
+	spin_unlock_irqrestore(&prm->lock, flags);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(u_audio_get_capture_srate);
+
 int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate)
 {
 	struct uac_params *params = &audio_dev->params;
@@ -540,6 +554,20 @@ int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate)
 }
 EXPORT_SYMBOL_GPL(u_audio_set_playback_srate);
 
+int u_audio_get_playback_srate(struct g_audio *audio_dev, u32 *val)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+	struct uac_rtd_params *prm;
+	unsigned long flags;
+
+	prm = &uac->p_prm;
+	spin_lock_irqsave(&prm->lock, flags);
+	*val = prm->srate;
+	spin_unlock_irqrestore(&prm->lock, flags);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(u_audio_get_playback_srate);
+
 int u_audio_start_capture(struct g_audio *audio_dev)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 84579fe81b92..5e6ed0f31cc3 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -120,7 +120,9 @@ void u_audio_stop_capture(struct g_audio *g_audio);
 int u_audio_start_playback(struct g_audio *g_audio);
 void u_audio_stop_playback(struct g_audio *g_audio);
 
+int u_audio_get_capture_srate(struct g_audio *audio_dev, u32 *val);
 int u_audio_set_capture_srate(struct g_audio *audio_dev, int srate);
+int u_audio_get_playback_srate(struct g_audio *audio_dev, u32 *val);
 int u_audio_set_playback_srate(struct g_audio *audio_dev, int srate);
 
 int u_audio_get_volume(struct g_audio *g_audio, int playback, s16 *val);
-- 
2.25.1

