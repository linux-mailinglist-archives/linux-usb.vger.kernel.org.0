Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E6B42AA0D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Oct 2021 18:53:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbhJLQz0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Oct 2021 12:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231352AbhJLQzZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Oct 2021 12:55:25 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F38DC061570
        for <linux-usb@vger.kernel.org>; Tue, 12 Oct 2021 09:53:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e7so14430660pgk.2
        for <linux-usb@vger.kernel.org>; Tue, 12 Oct 2021 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VUtDPxCGb6NReB4pL1kG83SCguwFN+Kn43bjpCCgk4=;
        b=IIN3v/K1DOmlBUlANIPqQ4t6FGxfzAKnoMveA3pM72i+kLBE2XYOeLvw2lkPBZQUeT
         aKVbjgPGCrELN3n/1biuwNC3NQQl926AmvJN5dji7xouiwYbrHmv+0qHEHy7Hj/xaCb4
         9ttvUPUj3N4/tb+8j23k5ZdwnTMqa2Zb1CEKwlxeV3G3wLIXpQb/qHk0FDqGndj+gIDE
         17Q7VPSGJQOJw1+2MllJcF+KswpeC1JPEOp6lokZ20LNjWw1bXbOax1ApaSS4UoRI+b2
         9JBuLRSXE7YFHXUD1+vxBFLMjTmoq4bfvGkXYfoYUjsk+Z9By7SUkUzdEurntzIWO6wp
         8DeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VUtDPxCGb6NReB4pL1kG83SCguwFN+Kn43bjpCCgk4=;
        b=Pp0VUhBhDEv0pTdVWhs5LsH3TCcg1MVJxNjLtrlSNcgaO6Tahvq+249TVVGkK59rVu
         qLYfohG/wWtVLEgyQXe0ScwzoObEJOc6KZFyCqi3UyRkeXh6A9MteZ2hbtCCP4G6ELzX
         qeAWcmwr3SigscMFOnRmyMzFnlKF8JK7psrBq180pNkz9svg0hmKTJ+t/Sp0vtyOr4ZB
         D24tpP+sGXiRZH/lYnf24CBfL7gVgsxx9OKrfHzNLVLwFCZa1LgyZzXIMz5P3bfnFvj+
         1ns9q7b7nYh2TiZoPQZt0kSvyn3dPcm7Vv/jGVEPlydjVUJk5xM7kX6CO/RqMtX0Wfjq
         kPuQ==
X-Gm-Message-State: AOAM5301Oqdnd9JXSmeQyvneGQi4AeNwa8+JRZ5Lw52iKLab+cTvAHaG
        Ec0K6gA3ZpWDPb5B+FLzW2k=
X-Google-Smtp-Source: ABdhPJzYGhySbU87peoZv+tSQYvabs0toJ2wOMkn///jJE9hfwQGa9gBAvMMYCTcXEzx1XLBLVqZqg==
X-Received: by 2002:a62:3881:0:b0:44b:6639:6c20 with SMTP id f123-20020a623881000000b0044b66396c20mr32643095pfa.78.1634057602865;
        Tue, 12 Oct 2021 09:53:22 -0700 (PDT)
Received: from lxb-server.lan ([2403:18c0:2:7e::1926:817])
        by smtp.gmail.com with ESMTPSA id b130sm109570pfb.9.2021.10.12.09.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 09:53:22 -0700 (PDT)
From:   Yunhao Tian <t123yh.xyz@gmail.com>
X-Google-Original-From: Yunhao Tian <t123yh@outlook.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, Yunhao Tian <t123yh.xyz@gmail.com>
Subject: [PATCH 2/2] usb: gadget: u_audio: remove unnecessary array declaration of snd_kcontrol_new
Date:   Wed, 13 Oct 2021 00:53:14 +0800
Message-Id: <20211012165314.338619-2-t123yh@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012165314.338619-1-t123yh@outlook.com>
References: <20211012165314.338619-1-t123yh@outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yunhao Tian <t123yh.xyz@gmail.com>

Currently, an array is used to contain all snd_kcontrol_new objects
of the audio gadget. This is unnecessary and possibly prone to an
(unlikely happen) race condition between the assignment of name
and call of snd_ctl_new1 if two audio gadget is being set up simutaneously.
This patch removes the global snd_kcontrol_new array and initialize
individual snd_kcontrol_new object when it's being used.

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 drivers/usb/gadget/function/u_audio.c | 65 +++++++++++----------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index c5f39998c653..1f4226d75dd8 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -27,12 +27,6 @@
 #define PRD_SIZE_MAX	PAGE_SIZE
 #define MIN_PERIODS	4
 
-enum {
-	UAC_FBACK_CTRL,
-	UAC_MUTE_CTRL,
-	UAC_VOLUME_CTRL,
-};
-
 /* Runtime data params for one stream */
 struct uac_rtd_params {
 	struct snd_uac_chip *uac;	/* parent chip */
@@ -914,31 +908,6 @@ static int u_audio_volume_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-
-static struct snd_kcontrol_new u_audio_controls[]  = {
-	[UAC_FBACK_CTRL] {
-		.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
-		.name =         "Capture Pitch 1000000",
-		.info =         u_audio_pitch_info,
-		.get =          u_audio_pitch_get,
-		.put =          u_audio_pitch_put,
-	},
-	[UAC_MUTE_CTRL] {
-		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name =		"", /* will be filled later */
-		.info =		u_audio_mute_info,
-		.get =		u_audio_mute_get,
-		.put =		u_audio_mute_put,
-	},
-	[UAC_VOLUME_CTRL] {
-		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
-		.name =		"", /* will be filled later */
-		.info =		u_audio_volume_info,
-		.get =		u_audio_volume_get,
-		.put =		u_audio_volume_put,
-	},
-};
-
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		  const char *card_name)
 {
@@ -946,6 +915,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	struct snd_card *card;
 	struct snd_pcm *pcm;
 	struct snd_kcontrol *kctl;
+	struct snd_kcontrol_new kctl_new;
 	struct uac_params *params;
 	int p_chmask, c_chmask;
 	int i, err;
@@ -1043,8 +1013,14 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		strscpy(card->mixername, card_name, sizeof(card->driver));
 
 	if (c_chmask && g_audio->in_ep_fback) {
-		kctl = snd_ctl_new1(&u_audio_controls[UAC_FBACK_CTRL],
-				    &uac->c_prm);
+		kctl_new = (struct snd_kcontrol_new) {
+			.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+			.name =         "Capture Pitch 1000000",
+			.info =         u_audio_pitch_info,
+			.get =          u_audio_pitch_get,
+			.put =          u_audio_pitch_put,
+		};
+		kctl = snd_ctl_new1(&kctl_new, &uac->c_prm);
 		if (!kctl) {
 			err = -ENOMEM;
 			goto snd_fail;
@@ -1083,9 +1059,14 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			snprintf(ctrl_name, sizeof(ctrl_name), "PCM %s Switch",
 				 direction);
 
-			u_audio_controls[UAC_MUTE_CTRL].name = ctrl_name;
-
-			kctl = snd_ctl_new1(&u_audio_controls[UAC_MUTE_CTRL],
+			kctl_new = (struct snd_kcontrol_new) {
+				.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
+				.name =		ctrl_name,
+				.info =		u_audio_mute_info,
+				.get =		u_audio_mute_get,
+				.put =		u_audio_mute_put,
+			},
+			kctl = snd_ctl_new1(&kctl_new,
 					    prm);
 			if (!kctl) {
 				err = -ENOMEM;
@@ -1106,10 +1087,14 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			snprintf(ctrl_name, sizeof(ctrl_name), "PCM %s Volume",
 				 direction);
 
-			u_audio_controls[UAC_VOLUME_CTRL].name = ctrl_name;
-
-			kctl = snd_ctl_new1(&u_audio_controls[UAC_VOLUME_CTRL],
-					    prm);
+			kctl_new = (struct snd_kcontrol_new) {
+				.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
+				.name =		ctrl_name,
+				.info =		u_audio_volume_info,
+				.get =		u_audio_volume_get,
+				.put =		u_audio_volume_put,
+			};
+			kctl = snd_ctl_new1(&kctl_new, prm);
 			if (!kctl) {
 				err = -ENOMEM;
 				goto snd_fail;
-- 
2.25.1

