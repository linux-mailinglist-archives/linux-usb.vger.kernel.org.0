Return-Path: <linux-usb+bounces-27989-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96072B542B6
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 08:22:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B07480B43
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 06:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E48C2848B0;
	Fri, 12 Sep 2025 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUdUMzaV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B701DF270;
	Fri, 12 Sep 2025 06:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757658158; cv=none; b=ot88z22YaTbBEt1okxTt88xZ92LZ5H6JI70353qZEpWDS+TtRpuQHiqkz5P9ZQQ4V5HrWfN92pBn4jb5sixooUeHDoQynMYr0Rg5WxhV5kSrQCm/2/RxAPE/JQxZxNLJ8X7rtNLgDtPTDf8VGliKH51HP6+BFr5f6Hq8jfmlLqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757658158; c=relaxed/simple;
	bh=5h60QxW1rFF5CEABNOJbZqEmndmkLwdnJruvnGRfsf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lw2f6iY9n/j3KqUwOEQ+TQGAWd33JgJvEhVFAwpDZ7wvioybElyLwI22qHN8znTGs8XJpBtP3bz71HvXBOh8MFtO1WWEzD1QJA2Sk9BEODKiZeRaHOPip8++hM+XaabP23AEvMxLEviuRl9LjkSCsdlmc4crGlOEAFYEJUIgizI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUdUMzaV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC8E4C4CEF7;
	Fri, 12 Sep 2025 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757658157;
	bh=5h60QxW1rFF5CEABNOJbZqEmndmkLwdnJruvnGRfsf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qUdUMzaVrLHffwntkdHyCeQyJHDKBx0zH+1oJnMYIVV+86SQH/Aby4U4k5g6zedlM
	 aOo6ivq6qZonRUoXHQt4xnorxtLpZnvbV/PeducJ9LBtjJE/h+qsFN544CkQ+XSphE
	 9esL3gzcS0AzB/Dcs/LD0oGcjACsRaMCBeWNfe5QJgFRdNN9Anu6d97nVROQm0Cc9B
	 wgerABwTrC68ulis50jBkoXhWmZah5q3xDqTzAWuhtj30Ab9rvu0ksmhtSXR/9GsTe
	 Pc+BQm4gk8Hnxya7QOlIyXLxP93df1BaIykKn4pY/si1lWy6t5a/qJKAg+gVZwHY4X
	 iqAV2A1eTPQvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7C4CAC582;
	Fri, 12 Sep 2025 06:22:37 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>
Date: Fri, 12 Sep 2025 14:22:35 +0800
Subject: [PATCH 1/3] ALSA: usb-audio: add two-way convert between name and
 bit for QUIRK_FLAG_*
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-sound-v1-1-cc9cfd9f2d01@uniontech.com>
References: <20250912-sound-v1-0-cc9cfd9f2d01@uniontech.com>
In-Reply-To: <20250912-sound-v1-0-cc9cfd9f2d01@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>, 
 Nie Cheng <niecheng1@uniontech.com>, Zhan Jun <zhanjun@uniontech.com>, 
 Feng Yuan <fengyuan@uniontech.com>, qaqland <anguoli@uniontech.com>, 
 kernel@uniontech.com, Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757658156; l=4131;
 i=cryolitia@uniontech.com; s=20250730; h=from:subject:message-id;
 bh=3kvU7Ca3Zp23CxB+cqB+zdjQhNaXptItq/K3jXkNqt8=;
 b=qsPx1xeYuKJMjBvo8LIrL5YRvJvUe262qQZD+AAXPGubvN2zDHrAoHDy55khM5RC1qEsI/5ac
 HXnct2FqYw3DUfUmjiT0WbaW7cBSwLNI89LWzlAIRfr+K89LiktVB22
X-Developer-Key: i=cryolitia@uniontech.com; a=ed25519;
 pk=tZ+U+kQkT45GRGewbMSB4VPmvpD+KkHC/Wv3rMOn/PU=
X-Endpoint-Received: by B4 Relay for cryolitia@uniontech.com/20250730 with
 auth_id=474
X-Original-From: Cryolitia PukNgae <cryolitia@uniontech.com>
Reply-To: cryolitia@uniontech.com

From: Cryolitia PukNgae <cryolitia@uniontech.com>

Also improve debug logs for applied quirks

Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 sound/usb/quirks.c   | 84 +++++++++++++++++++++++++++++++++++++++++++++++++---
 sound/usb/quirks.h   |  4 +++
 sound/usb/usbaudio.h |  1 +
 3 files changed, 85 insertions(+), 4 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d736a4750356597bfb0f9d5ab01cdaeaac0f907c..022e5691d6797c0a17a1132b05856e816f822ab0 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2446,6 +2446,64 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 	{} /* terminator */
 };
 
+static const char *const snd_usb_audio_quirk_flag_names[] = {
+	"get_sample_rate",
+	"share_media_device",
+	"align_transfer",
+	"tx_length",
+	"playback_first",
+	"skip_clock_selector",
+	"ignore_clock_source",
+	"itf_usb_dsd_dac",
+	"ctl_msg_delay",
+	"ctl_msg_delay_1m",
+	"ctl_msg_delay_5m",
+	"iface_delay",
+	"validate_rates",
+	"disable_autosuspend",
+	"ignore_ctl_error",
+	"dsd_raw",
+	"set_iface_first",
+	"generic_implicit_fb",
+	"skip_implicit_fb",
+	"iface_skip_close",
+	"force_iface_reset",
+	"fixed_rate",
+	"mic_res_16",
+	"mic_res_384",
+	"mixer_playback_min_mute",
+	"mixer_capture_min_mute",
+	NULL
+};
+
+const char *snd_usb_quirk_flag_find_name(unsigned long index)
+{
+	unsigned long size = BYTES_TO_BITS(sizeof(unsigned int));
+
+	if (index >= ARRAY_SIZE(snd_usb_audio_quirk_flag_names))
+		return NULL;
+
+	return snd_usb_audio_quirk_flag_names[index];
+}
+
+u32 snd_usb_quirk_flags_from_name(char *name)
+{
+	u32 flag = 0;
+	u32 i;
+
+	if (!name || !*name)
+		return 0;
+
+	for (i = 0; snd_usb_audio_quirk_flag_names[i]; i++) {
+		if (strcmp(name, snd_usb_audio_quirk_flag_names[i]) == 0) {
+			flag = (1U << i);
+			break;
+		}
+	}
+
+	return flag;
+}
+
 void snd_usb_init_quirk_flags(struct snd_usb_audio *chip)
 {
 	const struct usb_audio_quirk_flags_table *p;
@@ -2454,10 +2512,28 @@ void snd_usb_init_quirk_flags(struct snd_usb_audio *chip)
 		if (chip->usb_id == p->id ||
 		    (!USB_ID_PRODUCT(p->id) &&
 		     USB_ID_VENDOR(chip->usb_id) == USB_ID_VENDOR(p->id))) {
-			usb_audio_dbg(chip,
-				      "Set quirk_flags 0x%x for device %04x:%04x\n",
-				      p->flags, USB_ID_VENDOR(chip->usb_id),
-				      USB_ID_PRODUCT(chip->usb_id));
+			unsigned long flags = p->flags;
+			unsigned long bit;
+
+			for_each_set_bit(bit, &flags,
+					 BYTES_TO_BITS(sizeof(p->flags))) {
+				const char *name =
+					snd_usb_audio_quirk_flag_names[bit];
+
+				if (name)
+					usb_audio_dbg(chip,
+						      "Set quirk flag %s for device %04x:%04x\n",
+						      name,
+						      USB_ID_VENDOR(chip->usb_id),
+						      USB_ID_PRODUCT(chip->usb_id));
+				else
+					usb_audio_warn(chip,
+						       "Set unknown quirk flag 0x%lx for device %04x:%04x\n",
+						       bit,
+						       USB_ID_VENDOR(chip->usb_id),
+						       USB_ID_PRODUCT(chip->usb_id));
+			}
+
 			chip->quirk_flags |= p->flags;
 			return;
 		}
diff --git a/sound/usb/quirks.h b/sound/usb/quirks.h
index f9bfd5ac7bab01717de3a76227482a128bf73165..749d493eb532c071ee40cf4b2840bb4902ab4681 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -50,4 +50,8 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 
 void snd_usb_init_quirk_flags(struct snd_usb_audio *chip);
 
+const char *snd_usb_quirk_flag_find_name(unsigned long flag);
+
+u32 snd_usb_quirk_flags_from_name(char *name);
+
 #endif /* __USBAUDIO_QUIRKS_H */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 30b5102e3caed01eeb86d0075c41338104c58950..0a22cb4a02344b2dcf4009c560a759f2da25ca67 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -252,5 +252,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_MIC_RES_384		(1U << 23)
 #define QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE	(1U << 24)
 #define QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE	(1U << 25)
+/* Please also edit snd_usb_audio_quirk_flag_names */
 
 #endif /* __USBAUDIO_H */

-- 
2.51.0



