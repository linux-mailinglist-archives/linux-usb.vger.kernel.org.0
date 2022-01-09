Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091D548892B
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jan 2022 13:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbiAIMAF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jan 2022 07:00:05 -0500
Received: from cable.insite.cz ([84.242.75.189]:47444 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235408AbiAIMAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jan 2022 07:00:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 48C1FA1A3D410;
        Sun,  9 Jan 2022 13:00:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729600; bh=Azt+NgYvHftO8GMykcHOEWSYOSyRIy4YxvjOBrcevJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VgEAHW3K8l/aTAHTxOguNv+tQEzGqRHDawDVQg6zbTKIlIOHpgdVWGmao4LEcTiVW
         X/vig/6z2gW1cFtin5NTuxTo8/kHzidSiojSPoYxtuSIDwbGZPOqBQ8KGOK9ogcQJA
         0jcnf9lLPF6CiVOmXpdcwBorL/+Ul7d4IYAdXIxg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dQpLTOHPFLRJ; Sun,  9 Jan 2022 12:59:54 +0100 (CET)
Received: from precision.doma (dustin.pilsfree.net [81.201.58.138])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 3833DA1A3D40A;
        Sun,  9 Jan 2022 12:59:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1641729592; bh=Azt+NgYvHftO8GMykcHOEWSYOSyRIy4YxvjOBrcevJY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dCT7KxRiZoOPxDxWHkqYrhY/IcDMFvzOvb8EC9BQ39xoUG2c78nP/ROduu+K58uxy
         7JwhjFF2JTAZK6nQhhNrZPZW9WFhVtY/kERPEuQWFkoAp912e50P798M/UMxyzGMFb
         CZu5tBRoMnMy6XHw8FkrgGeyzT+5AdglTGAfZ/6Q=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Julian Scheel <julian@jusst.de>,
        John Keeping <john@metanate.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 09/11] usb: gadget: u_audio: Add suspend call
Date:   Sun,  9 Jan 2022 12:59:44 +0100
Message-Id: <20220109115946.392818-10-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109115946.392818-1-pavel.hofman@ivitera.com>
References: <20220109115946.392818-1-pavel.hofman@ivitera.com>
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

