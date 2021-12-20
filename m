Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA0E747B4D5
	for <lists+linux-usb@lfdr.de>; Mon, 20 Dec 2021 22:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhLTVLq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Dec 2021 16:11:46 -0500
Received: from cable.insite.cz ([84.242.75.189]:45513 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230368AbhLTVLp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Dec 2021 16:11:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 865FEA1A3D40F;
        Mon, 20 Dec 2021 22:11:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034703; bh=FIayO3i7Y2XcnMYAxSNxAfnmPI914JgdzjyviD40hgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h0ynDDHJxBcI0BlvhgF+oUQaOh/PVA1ezviB2KyuQGmOBZQZ+qsOeWpkL34JGAd05
         m/Wx9WTI2n/T2XRW9RFJMLHRDw35NzNmX3pr5mN4FiKIaI5z1vSps9L0/YsNK2sIyu
         GgfP8DPLGTg5g/MYJmubYD78EJGtElZUIJ6YXP6M=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BCeKtJ5HIusT; Mon, 20 Dec 2021 22:11:38 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 7E000A1A3D408;
        Mon, 20 Dec 2021 22:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1640034694; bh=FIayO3i7Y2XcnMYAxSNxAfnmPI914JgdzjyviD40hgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZYQFv2Tn7Q2rBN6DLsOozRGu4mkO7DVW7zwtC90cSP15lvGMCHlPycrSonQdHz29M
         XvcoD9tD59cDmbA4UgG/lE/FBz3ChfsmE4CCd4EHPdtb/hg0JVXI9wkS7aRGs/aMFz
         9KYBE53N0rKNy2CF0bqv4JBwSSocbfNcTEDRHR3w=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 08/11] usb: gadget: u_audio: Adding suspend call
Date:   Mon, 20 Dec 2021 22:11:27 +0100
Message-Id: <20211220211130.88590-9-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220211130.88590-1-pavel.hofman@ivitera.com>
References: <20211220211130.88590-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Adding exported method u_audio_suspend which stops capture and playback
PCM streams and notifies about zero sample rates. The method does not
free any resources.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 drivers/usb/gadget/function/u_audio.c | 11 +++++++++++
 drivers/usb/gadget/function/u_audio.h |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 9dbce51c2eb7..58e18952953b 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -734,6 +734,17 @@ void u_audio_stop_playback(struct g_audio *audio_dev)
 }
 EXPORT_SYMBOL_GPL(u_audio_stop_playback);
 
+void u_audio_suspend(struct g_audio *audio_dev)
+{
+	struct snd_uac_chip *uac = audio_dev->uac;
+
+	stop_substream(&uac->p_prm);
+	stop_substream(&uac->c_prm);
+	set_reported_srate(&uac->p_prm, 0);
+	set_reported_srate(&uac->c_prm, 0);
+}
+EXPORT_SYMBOL_GPL(u_audio_suspend);
+
 int u_audio_get_volume(struct g_audio *audio_dev, int playback, s16 *val)
 {
 	struct snd_uac_chip *uac = audio_dev->uac;
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index 76b5b8169444..74e7519d9497 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -128,4 +128,6 @@ int u_audio_set_volume(struct g_audio *g_audio, int playback, s16 val);
 int u_audio_get_mute(struct g_audio *g_audio, int playback, int *val);
 int u_audio_set_mute(struct g_audio *g_audio, int playback, int val);
 
+void u_audio_suspend(struct g_audio *g_audio);
+
 #endif /* __U_AUDIO_H */
-- 
2.25.1

