Return-Path: <linux-usb+bounces-28209-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 307EAB7E7A7
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 14:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C7FA2A108D
	for <lists+linux-usb@lfdr.de>; Wed, 17 Sep 2025 12:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A42E3328961;
	Wed, 17 Sep 2025 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vj5k+Yph"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ED731A7EE;
	Wed, 17 Sep 2025 12:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113203; cv=none; b=ZGCqPJkKT3Rog2QvLwhCH8P+/foeWflhFZ+ywdjWrtiWasIGpwlTWY+oJ4XYmNZDQSShUhIR8d9JLGDWvaDTisx7OHQsPzYpzD2Y0Bt6FXPw84kNXDgAxduqKwRud0DOUYDgvTvVHUjnrfe8ADWRiE95MQhl/Qb9PaNyS0lZMRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113203; c=relaxed/simple;
	bh=AfD1lGXGhBJ72syghpA4tAQn0Om1/q15shkj744ZzgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p4N3zksg6Tpjj0AXH6ePp6ja6B7wHcAJk8pEy4YepkCHdxnAgIoa0oIEUynurmZWbU6ATPPhU8BvFog/qOYS0nDpbznPneDruJwzKQxF3l4wdAbWkr2Pj/vVwvOO2P6fEhQU/HnWAJ92mVaYaZF0r6Ur/hN3zvWMrSkhwBXGc7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vj5k+Yph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC41CC4CEFA;
	Wed, 17 Sep 2025 12:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758113202;
	bh=AfD1lGXGhBJ72syghpA4tAQn0Om1/q15shkj744ZzgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vj5k+Yphr56sNCHBXqT9esXR9AlESbBF0wxmoy7QsOYr+HhWg+GuireDB5tlwEJY4
	 nObl5tF5MVzPih897kPwXcxjtA/q7540njJoBBcdPWf64RFijIn+qIx3Q+rk7wHXXg
	 Un99KdURDgxgMW4gyn2XhbdEqWPZBqDiKlNemjfkeLpgHJiZvJUG0Fzqb9sblSrNDZ
	 ar3UtrI12yKFS/KiyZDpRYDyhUPLWrLdJUjT7e6RvyklQjy3KQuNG/zVSoWlrV2j4x
	 77J6Qjqc4Sb6VRfsvfLr+XrGEvQ1az8l5BDPkm5jdnmY6I4iePDC28hYozcuKK5RtA
	 KmSTUc1b5UodQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B20DCAC59D;
	Wed, 17 Sep 2025 12:46:42 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay <devnull+cryolitia.uniontech.com@kernel.org>
Date: Wed, 17 Sep 2025 20:46:40 +0800
Subject: [PATCH v3 1/4] ALSA: usb-audio: add two-way convert between name
 and bit for QUIRK_FLAG_*
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-sound-v3-1-92ebe9472a0a@uniontech.com>
References: <20250917-sound-v3-0-92ebe9472a0a@uniontech.com>
In-Reply-To: <20250917-sound-v3-0-92ebe9472a0a@uniontech.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>
Cc: linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mingcong Bai <jeffbai@aosc.io>, Kexy Biscuit <kexybiscuit@aosc.io>, 
 Nie Cheng <niecheng1@uniontech.com>, Zhan Jun <zhanjun@uniontech.com>, 
 Feng Yuan <fengyuan@uniontech.com>, qaqland <anguoli@uniontech.com>, 
 kernel@uniontech.com, linux-modules@vger.kernel.org, 
 Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758113201; l=4063;
 i=cryolitia@uniontech.com; s=20250730; h=from:subject:message-id;
 bh=/BXquMWJMNiFdz+nh5s6GogPhAqR6jecE2iPTQLfG8w=;
 b=x6D1T0dnaqslqTNErkQUMW/JZzMZw/8g8eGhrt2N0pxTGEG8c0o26O5t8Ndzmhc7MF/b0gDYB
 pVQufyGHG3SC845VblraOLj0EsNrCDk3VuSfqWs2TtrWb0aHY7vqrWE
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
 sound/usb/quirks.c   | 82 +++++++++++++++++++++++++++++++++++++++++++++++++---
 sound/usb/quirks.h   |  3 ++
 sound/usb/usbaudio.h |  1 +
 3 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index d736a4750356597bfb0f9d5ab01cdaeaac0f907c..94854f352b1702b491e1bf3c8b769f7088e03976 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2446,6 +2446,62 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
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
@@ -2454,10 +2510,28 @@ void snd_usb_init_quirk_flags(struct snd_usb_audio *chip)
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
index f9bfd5ac7bab01717de3a76227482a128bf73165..bd5baf2b193a1985f3a0e52bf4a77ca741364769 100644
--- a/sound/usb/quirks.h
+++ b/sound/usb/quirks.h
@@ -50,4 +50,7 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 
 void snd_usb_init_quirk_flags(struct snd_usb_audio *chip);
 
+const char *snd_usb_quirk_flag_find_name(unsigned long flag);
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



