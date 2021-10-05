Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B82CE422278
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 11:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbhJEJjb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 05:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbhJEJjb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 05:39:31 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40E4C061745
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 02:37:40 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id t16-20020a1c7710000000b003049690d882so2379298wmi.5
        for <linux-usb@vger.kernel.org>; Tue, 05 Oct 2021 02:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D/iyOPn+GPyKIUREOPU+ysL/ShmxLlTSQt9X3olpjgc=;
        b=EqZT+tUtXA0pNUdr3c2tmFMDpOBk1uLl9u1L5ob//VggOhL4PYBKQNOi5vCQcgPf70
         Ke4JtU0svXMiCC46l61X3ArJ9zqFH8TmYt/LW/IpgchgKiqhK1Ohiu7U/tx/0sT4lhik
         cmiJVn7jL7a96+bkcIb6fHgbImZtcyCPiso8UPt+3+J0JeADNk7t5n313bkBhsjp27dh
         Y1hWtPLHrBoYNY8djnoiS7sIzsk3lf7/PZdk8SZ2QzpMIk8hseMYYpoSy0778q1/xSVJ
         oY8o/siOoWLpXastvcT/A0vHd1iT8n80NiIWDJCxLf7eFNNw/GrxOhNYX9y6Fk99Jo7z
         mQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D/iyOPn+GPyKIUREOPU+ysL/ShmxLlTSQt9X3olpjgc=;
        b=YBpMSxIVqdwjiw2qSW4oenrLcjz/LvZZy+J/9jmCTK7UBfhnMtMCqq8sGARfOK0jAV
         oP2HEXs+rNTi0Ih6hVQVXGH0Xk8MhKrfNLxhggBB7yXC7AhCTNUj0CQvig6be8JZaBYL
         o4uMHgoAT2JNeS0i4EBM7g1lvVD6MqKRhJuQCSVRVzyXxbzBiVxQ2b1jCXvzwBlTQYuv
         t6ZadLEbiJ1PY4tKMGg41RUNJ3w6+umRhyb47UpZU1P3dsT5O6xkE/GizFLjbUxe9AGW
         vZ6rQGG7UirkVrkCvROPdo/nDtoqsiXfNtx9ndsLfNKVIk68S0QsavQgtvdqQOMF6MyB
         m1kA==
X-Gm-Message-State: AOAM533uQxAL3tlZVk42rVaBhI+RrKt2CNMlMYNXmaLhvnlPLrAVOtU0
        Z6HZiF/pANp0cJ0FqguJsrxhng==
X-Google-Smtp-Source: ABdhPJyhxiQJsxw0z7pICnYYcL2OfKVokd87N9pRJM/UlYOHCsGwQ8gLSqjSKJ18hSrzKV/ea0UFLA==
X-Received: by 2002:a7b:ce8c:: with SMTP id q12mr2289327wmj.14.1633426659588;
        Tue, 05 Oct 2021 02:37:39 -0700 (PDT)
Received: from jackdaw.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id h15sm9175537wrt.0.2021.10.05.02.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:37:39 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jack Pham <jackp@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [RFC PATCH 2/2] usb: gadget: u_audio: remove fb_max
Date:   Tue,  5 Oct 2021 11:37:29 +0200
Message-Id: <20211005093729.628833-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211005093729.628833-1-jbrunet@baylibre.com>
References: <1jmtnnvo2x.fsf@starbuckisacylon.baylibre.com>
 <20211005093729.628833-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Having a parameter to customize the extra packet size we would like to
reserve for the audio gadget makes no sense. The maximum size the packet
should have is actually specified by the USB Audio Format Specification.

See https://www.usb.org/sites/default/files/USB%20Audio%20v3.0_0.zip
USB Audio Format section 2.3.1.2.1

Cc: Pavel Hofman <pavel.hofman@ivitera.com>
Cc: Jack Pham <jackp@codeaurora.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 I know you guys have continued the development on the audio gadget recently
 I'm sorry I have not been able to follow it closely.
 It is possible this change require a rebase
 I'm sending it now because I think fb_max is part of the problem around
 packet size

 drivers/usb/gadget/function/f_uac2.c  |  4 ---
 drivers/usb/gadget/function/u_audio.c | 40 ++++++++++-----------------
 drivers/usb/gadget/function/u_audio.h |  9 ------
 drivers/usb/gadget/function/u_uac2.h  |  1 -
 4 files changed, 14 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index c152efa30def..381abf8adb31 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -961,7 +961,6 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->params.c_srate = uac2_opts->c_srate;
 	agdev->params.c_ssize = uac2_opts->c_ssize;
 	agdev->params.req_number = uac2_opts->req_number;
-	agdev->params.fb_max = uac2_opts->fb_max;
 	ret = g_audio_setup(agdev, "UAC2 PCM", "UAC2_Gadget");
 	if (ret)
 		goto err_free_descs;
@@ -1334,7 +1333,6 @@ UAC2_ATTRIBUTE(c_srate);
 UAC2_ATTRIBUTE_SYNC(c_sync);
 UAC2_ATTRIBUTE(c_ssize);
 UAC2_ATTRIBUTE(req_number);
-UAC2_ATTRIBUTE(fb_max);
 
 static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_p_chmask,
@@ -1345,7 +1343,6 @@ static struct configfs_attribute *f_uac2_attrs[] = {
 	&f_uac2_opts_attr_c_ssize,
 	&f_uac2_opts_attr_c_sync,
 	&f_uac2_opts_attr_req_number,
-	&f_uac2_opts_attr_fb_max,
 	NULL,
 };
 
@@ -1385,7 +1382,6 @@ static struct usb_function_instance *afunc_alloc_inst(void)
 	opts->c_ssize = UAC2_DEF_CSSIZE;
 	opts->c_sync = UAC2_DEF_CSYNC;
 	opts->req_number = UAC2_DEF_REQ_NUM;
-	opts->fb_max = UAC2_DEF_FB_MAX;
 	return &opts->func_inst;
 }
 
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 9e5c950612d0..63def8467e9c 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -607,19 +607,20 @@ EXPORT_SYMBOL_GPL(u_audio_stop_playback);
 static int u_audio_pitch_info(struct snd_kcontrol *kcontrol,
 				   struct snd_ctl_elem_info *uinfo)
 {
-	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
-	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
-	unsigned int pitch_min, pitch_max;
-
-	pitch_min = (1000 - FBACK_SLOW_MAX) * 1000;
-	pitch_max = (1000 + params->fb_max) * 1000;
-
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
 	uinfo->count = 1;
-	uinfo->value.integer.min = pitch_min;
-	uinfo->value.integer.max = pitch_max;
+
+	/*
+	 * TODO: +/- 25% is rough.
+	 * The host constrained by the small and large SIP size so it
+	 * will likely cape before that
+	 *
+	 * On the start of a capture, we should be able to calculate
+	 * the minimum and maximum pitch based on the small and large
+	 * SIP size (See USB Audio Format 3.0 - section 2.3.1.2.1)
+	 */
+	uinfo->value.integer.min = 750000;
+	uinfo->value.integer.max = 1250000;
 	uinfo->value.integer.step = 1;
 	return 0;
 }
@@ -638,29 +639,16 @@ static int u_audio_pitch_put(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
-	struct snd_uac_chip *uac = prm->uac;
-	struct g_audio *audio_dev = uac->audio_dev;
-	struct uac_params *params = &audio_dev->params;
 	unsigned int val;
-	unsigned int pitch_min, pitch_max;
-	int change = 0;
-
-	pitch_min = (1000 - FBACK_SLOW_MAX) * 1000;
-	pitch_max = (1000 + params->fb_max) * 1000;
 
 	val = ucontrol->value.integer.value[0];
 
-	if (val < pitch_min)
-		val = pitch_min;
-	if (val > pitch_max)
-		val = pitch_max;
-
 	if (prm->pitch != val) {
 		prm->pitch = val;
-		change = 1;
+		return 1;
 	}
 
-	return change;
+	return 0;
 }
 
 static const struct snd_kcontrol_new u_audio_controls[]  = {
diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/function/u_audio.h
index a218cdf771fe..53e6baf55cbf 100644
--- a/drivers/usb/gadget/function/u_audio.h
+++ b/drivers/usb/gadget/function/u_audio.h
@@ -11,14 +11,6 @@
 
 #include <linux/usb/composite.h>
 
-/*
- * Same maximum frequency deviation on the slower side as in
- * sound/usb/endpoint.c. Value is expressed in per-mil deviation.
- * The maximum deviation on the faster side will be provided as
- * parameter, as it impacts the endpoint required bandwidth.
- */
-#define FBACK_SLOW_MAX	250
-
 struct uac_params {
 	/* playback */
 	int p_chmask;	/* channel mask */
@@ -31,7 +23,6 @@ struct uac_params {
 	int c_ssize;	/* sample size */
 
 	int req_number; /* number of preallocated requests */
-	int fb_max;	/* upper frequency drift feedback limit per-mil */
 };
 
 struct g_audio {
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index 179d3ef6a195..9e9c3c5bb1c8 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -35,7 +35,6 @@ struct f_uac2_opts {
 	int				c_ssize;
 	int				c_sync;
 	int				req_number;
-	int				fb_max;
 	bool				bound;
 
 	struct mutex			lock;
-- 
2.33.0

