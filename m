Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124EA489249
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 08:44:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241599AbiAJHls (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 02:41:48 -0500
Received: from cable.insite.cz ([84.242.75.189]:51020 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241193AbiAJHhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Jan 2022 02:37:55 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id C337AA1A3D400;
        Mon, 10 Jan 2022 08:37:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800270; bh=MPGFCCGcjvZKbwxi1N2MzoBvur+SGxEp8yzsT+01Q4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ovj3hTz1u8ZqcQqHfVPV1IslophNCWRvlCcfeKAdBSw+xIDK5kCszP5yoCNTYLWFm
         dsiMnZTaOzwPJONMrKQOvc+eK1n6v00OVfzgzIwpdZB7apDK0cseVkGbBIpUV4KS2Y
         7BwEEr3EhHg+9PPmK/kK5sMkFhNttRPlA64Jmx8M=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id EFlQAmqHItCJ; Mon, 10 Jan 2022 08:37:45 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id F366EA1A3D405;
        Mon, 10 Jan 2022 08:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641800265; bh=MPGFCCGcjvZKbwxi1N2MzoBvur+SGxEp8yzsT+01Q4Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oAwGEJF0EmS1LmjuZdQtd1ldCcN32YxgeRhYxG5T//VBuMqYj/lizLZYyweB1NQ6e
         +jgjePlDr/qZ01xMhor6/LPdOJIn7W+TpuCBiymzi1Cq6r6eWHdsnw8Ydm6P1t/MNu
         nzKJYXbSgfGQjMJOcYkkuAEfraqvM2RcMlpiv9ks=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 04/10] usb: gadget: u_audio: Add capture/playback srate getter
Date:   Mon, 10 Jan 2022 08:37:36 +0100
Message-Id: <20220110073742.394237-5-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220110073742.394237-1-pavel.hofman@ivitera.com>
References: <20220110073742.394237-1-pavel.hofman@ivitera.com>
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

