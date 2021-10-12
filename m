Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76C4B42AA0C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Oct 2021 18:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhJLQzW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Oct 2021 12:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhJLQzV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Oct 2021 12:55:21 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BDACC061570
        for <linux-usb@vger.kernel.org>; Tue, 12 Oct 2021 09:53:20 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso107264pjb.1
        for <linux-usb@vger.kernel.org>; Tue, 12 Oct 2021 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oJt2BkpBFzll+Y2+lc7pWw4u4DdDEz78ix93UAdomE=;
        b=fkcnzZrVQq+2LAKvkJbI6oW2n165bT6wRT9iuix7tUaYOsfxFZrZsK1yGwwFWqHjfR
         Isu6l+bK069wSWupO8Q2jMMG3Z0gFVE/f4vOzGfTjOthJHO8PaWn5qYAw/aWNs6u1UX1
         wQ5ci3Rewv614Xxf5WUccJ/wqUn2rBg3Gtrb6y7wBsFPymCEZ3DRCinhyLAgKGMlWc4T
         35ExncwiNvK5KER87t7DgWU9d4uNfxuKiI47pfBOjJadYWggzGmxd1lNuwWIxI0cPHmj
         EjpsR7I960xPUJO8SQNgB+rq+uC7ZRoBYpkVFofNgB5ZRV2jTezu3IO+8dWahEjDbTnA
         AKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oJt2BkpBFzll+Y2+lc7pWw4u4DdDEz78ix93UAdomE=;
        b=bJvPAn6qb7Q7VbEMsw/6vZO+Eo/VoN0X/qtLmL5/Dk4rEUWN9AfzzL+3n1oj7SXyyY
         mf23hloiCEr9AQRJ+q9/3JJN/10rZhELSNb53Vty3vXmPO1glDyMXR+4kqLl1tjfeFxU
         gQSCVbDS/q4JJTfFHOWEpd6ZB10rKt3xDv0HFlU4R18kDTegHgGa+T149x0EOzogU/V8
         Tlb5/AQ/HbulxQl7/xrc461NhciLhWV/ArVjcwkWd9p4qaAtcVQ7VBs1rBkmqGQh99qp
         I68rZJ8KWu8dXjQEDAAlYaZ63BVxNwSh87M2vH94H4FhlIhsFKJQfvH1n/ut2fh18r/e
         knSg==
X-Gm-Message-State: AOAM530TbVZ7z/gSKtp9rCQ0rFj/teFIhNRBcxB4BeAUmemEhswoFlNv
        s6MoA6mZjSrriFWsPC/ANXClp43WM/MLtH+CnzA=
X-Google-Smtp-Source: ABdhPJwbyNVU/7zJT6W57LreFMBv6j6B1qxZrzZ7Nf43HTtm/bs84LgWU78djeSurCGxXah87khKrQ==
X-Received: by 2002:a17:90a:e552:: with SMTP id ei18mr7267323pjb.239.1634057599536;
        Tue, 12 Oct 2021 09:53:19 -0700 (PDT)
Received: from lxb-server.lan ([2403:18c0:2:7e::1926:817])
        by smtp.gmail.com with ESMTPSA id b130sm109570pfb.9.2021.10.12.09.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 09:53:19 -0700 (PDT)
From:   Yunhao Tian <t123yh.xyz@gmail.com>
X-Google-Original-From: Yunhao Tian <t123yh@outlook.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        linux-usb@vger.kernel.org, Yunhao Tian <t123yh.xyz@gmail.com>
Subject: [PATCH 1/2] usb: gadget: uac: fix indentation issues in UAC files.
Date:   Wed, 13 Oct 2021 00:53:13 +0800
Message-Id: <20211012165314.338619-1-t123yh@outlook.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Yunhao Tian <t123yh.xyz@gmail.com>

Fixes: 02de698 ("usb: gadget: u_audio: add bi-directional volume and mute support")
Fixes: eaf6cbe ("usb: gadget: f_uac2: add volume and mute support")
Fixes: 0356e62 ("usb: gadget: f_uac1: add volume and mute support")

Signed-off-by: Yunhao Tian <t123yh.xyz@gmail.com>
---
 drivers/usb/gadget/function/f_uac2.c  |   2 +-
 drivers/usb/gadget/function/u_audio.c | 112 +++++++++++++-------------
 drivers/usb/gadget/function/u_uac1.h  |   8 +-
 drivers/usb/gadget/function/u_uac2.h  |  10 +--
 4 files changed, 64 insertions(+), 68 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index ef55b8bb5870..11b604879c75 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -1232,7 +1232,7 @@ afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
 	agdev->params.fb_max = uac2_opts->fb_max;
 
 	if (FUOUT_EN(uac2_opts) || FUIN_EN(uac2_opts))
-    agdev->notify = afunc_notify;
+		agdev->notify = afunc_notify;
 
 	ret = g_audio_setup(agdev, "UAC2 PCM", "UAC2_Gadget");
 	if (ret)
diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index ad16163b5ff8..c5f39998c653 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -35,8 +35,8 @@ enum {
 
 /* Runtime data params for one stream */
 struct uac_rtd_params {
-	struct snd_uac_chip *uac; /* parent chip */
-	bool ep_enabled; /* if the ep is enabled */
+	struct snd_uac_chip *uac;	/* parent chip */
+	bool ep_enabled;		/* if the ep is enabled */
 
 	struct snd_pcm_substream *ss;
 
@@ -45,24 +45,23 @@ struct uac_rtd_params {
 
 	void *rbuf;
 
-	unsigned int pitch;	/* Stream pitch ratio to 1000000 */
-	unsigned int max_psize;	/* MaxPacketSize of endpoint */
+	unsigned int pitch;		/* Stream pitch ratio to 1000000 */
+	unsigned int max_psize;		/* MaxPacketSize of endpoint */
 
 	struct usb_request **reqs;
 
-	struct usb_request *req_fback; /* Feedback endpoint request */
-	bool fb_ep_enabled; /* if the ep is enabled */
+	struct usb_request *req_fback;	/* Feedback endpoint request */
+	bool fb_ep_enabled;		/* if the ep is enabled */
 
-  /* Volume/Mute controls and their state */
-  int fu_id; /* Feature Unit ID */
-  struct snd_kcontrol *snd_kctl_volume;
-  struct snd_kcontrol *snd_kctl_mute;
-  s16 volume_min, volume_max, volume_res;
-  s16 volume;
-  int mute;
-
-  spinlock_t lock; /* lock for control transfers */
+	/* Volume/Mute controls and their state */
+	int fu_id;			/* Feature Unit ID */
+	struct snd_kcontrol *snd_kctl_volume;
+	struct snd_kcontrol *snd_kctl_mute;
+	s16 volume_min, volume_max, volume_res;
+	s16 volume;
+	int mute;
 
+	spinlock_t lock;		/* lock for control transfers */
 };
 
 struct snd_uac_chip {
@@ -672,7 +671,7 @@ int u_audio_set_volume(struct g_audio *audio_dev, int playback, s16 val)
 
 	if (change)
 		snd_ctl_notify(uac->card, SNDRV_CTL_EVENT_MASK_VALUE,
-				&prm->snd_kctl_volume->id);
+			       &prm->snd_kctl_volume->id);
 
 	return 0;
 }
@@ -727,9 +726,8 @@ int u_audio_set_mute(struct g_audio *audio_dev, int playback, int val)
 }
 EXPORT_SYMBOL_GPL(u_audio_set_mute);
 
-
 static int u_audio_pitch_info(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_info *uinfo)
+			      struct snd_ctl_elem_info *uinfo)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 	struct snd_uac_chip *uac = prm->uac;
@@ -749,7 +747,7 @@ static int u_audio_pitch_info(struct snd_kcontrol *kcontrol,
 }
 
 static int u_audio_pitch_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
+			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 
@@ -759,7 +757,7 @@ static int u_audio_pitch_get(struct snd_kcontrol *kcontrol,
 }
 
 static int u_audio_pitch_put(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
+			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 	struct snd_uac_chip *uac = prm->uac;
@@ -788,7 +786,7 @@ static int u_audio_pitch_put(struct snd_kcontrol *kcontrol,
 }
 
 static int u_audio_mute_info(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_info *uinfo)
+			     struct snd_ctl_elem_info *uinfo)
 {
 	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
 	uinfo->count = 1;
@@ -800,7 +798,7 @@ static int u_audio_mute_info(struct snd_kcontrol *kcontrol,
 }
 
 static int u_audio_mute_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
+			    struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 	unsigned long flags;
@@ -813,7 +811,7 @@ static int u_audio_mute_get(struct snd_kcontrol *kcontrol,
 }
 
 static int u_audio_mute_put(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
+			    struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 	struct snd_uac_chip *uac = prm->uac;
@@ -841,7 +839,7 @@ static int u_audio_mute_put(struct snd_kcontrol *kcontrol,
  * TLV callback for mixer volume controls
  */
 static int u_audio_volume_tlv(struct snd_kcontrol *kcontrol, int op_flag,
-			 unsigned int size, unsigned int __user *_tlv)
+			      unsigned int size, unsigned int __user *_tlv)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 	DECLARE_TLV_DB_MINMAX(scale, 0, 0);
@@ -859,7 +857,7 @@ static int u_audio_volume_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 }
 
 static int u_audio_volume_info(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_info *uinfo)
+			       struct snd_ctl_elem_info *uinfo)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 
@@ -867,29 +865,29 @@ static int u_audio_volume_info(struct snd_kcontrol *kcontrol,
 	uinfo->count = 1;
 	uinfo->value.integer.min = 0;
 	uinfo->value.integer.max =
-		(prm->volume_max - prm->volume_min + prm->volume_res - 1)
-		/ prm->volume_res;
+		(prm->volume_max - prm->volume_min + prm->volume_res - 1) /
+		prm->volume_res;
 	uinfo->value.integer.step = 1;
 
 	return 0;
 }
 
 static int u_audio_volume_get(struct snd_kcontrol *kcontrol,
-				   struct snd_ctl_elem_value *ucontrol)
+			      struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 	unsigned long flags;
 
 	spin_lock_irqsave(&prm->lock, flags);
 	ucontrol->value.integer.value[0] =
-			(prm->volume - prm->volume_min) / prm->volume_res;
+		(prm->volume - prm->volume_min) / prm->volume_res;
 	spin_unlock_irqrestore(&prm->lock, flags);
 
 	return 0;
 }
 
 static int u_audio_volume_put(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_value *ucontrol)
+			      struct snd_ctl_elem_value *ucontrol)
 {
 	struct uac_rtd_params *prm = snd_kcontrol_chip(kcontrol);
 	struct snd_uac_chip *uac = prm->uac;
@@ -918,14 +916,14 @@ static int u_audio_volume_put(struct snd_kcontrol *kcontrol,
 
 
 static struct snd_kcontrol_new u_audio_controls[]  = {
-  [UAC_FBACK_CTRL] {
-    .iface =        SNDRV_CTL_ELEM_IFACE_PCM,
-    .name =         "Capture Pitch 1000000",
-    .info =         u_audio_pitch_info,
-    .get =          u_audio_pitch_get,
-    .put =          u_audio_pitch_put,
-  },
-  [UAC_MUTE_CTRL] {
+	[UAC_FBACK_CTRL] {
+		.iface =        SNDRV_CTL_ELEM_IFACE_PCM,
+		.name =         "Capture Pitch 1000000",
+		.info =         u_audio_pitch_info,
+		.get =          u_audio_pitch_get,
+		.put =          u_audio_pitch_put,
+	},
+	[UAC_MUTE_CTRL] {
 		.iface =	SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name =		"", /* will be filled later */
 		.info =		u_audio_mute_info,
@@ -942,7 +940,7 @@ static struct snd_kcontrol_new u_audio_controls[]  = {
 };
 
 int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
-					const char *card_name)
+		  const char *card_name)
 {
 	struct snd_uac_chip *uac;
 	struct snd_card *card;
@@ -968,20 +966,19 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	if (c_chmask) {
 		struct uac_rtd_params *prm = &uac->c_prm;
 
-    spin_lock_init(&prm->lock);
-    uac->c_prm.uac = uac;
+		spin_lock_init(&prm->lock);
+		uac->c_prm.uac = uac;
 		prm->max_psize = g_audio->out_ep_maxpsize;
 
 		prm->reqs = kcalloc(params->req_number,
-				    sizeof(struct usb_request *),
-				    GFP_KERNEL);
+				    sizeof(struct usb_request *), GFP_KERNEL);
 		if (!prm->reqs) {
 			err = -ENOMEM;
 			goto fail;
 		}
 
-		prm->rbuf = kcalloc(params->req_number, prm->max_psize,
-				GFP_KERNEL);
+		prm->rbuf =
+			kcalloc(params->req_number, prm->max_psize, GFP_KERNEL);
 		if (!prm->rbuf) {
 			prm->max_psize = 0;
 			err = -ENOMEM;
@@ -997,15 +994,14 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		prm->max_psize = g_audio->in_ep_maxpsize;
 
 		prm->reqs = kcalloc(params->req_number,
-				    sizeof(struct usb_request *),
-				    GFP_KERNEL);
+				    sizeof(struct usb_request *), GFP_KERNEL);
 		if (!prm->reqs) {
 			err = -ENOMEM;
 			goto fail;
 		}
 
-		prm->rbuf = kcalloc(params->req_number, prm->max_psize,
-				GFP_KERNEL);
+		prm->rbuf =
+			kcalloc(params->req_number, prm->max_psize, GFP_KERNEL);
 		if (!prm->rbuf) {
 			prm->max_psize = 0;
 			err = -ENOMEM;
@@ -1025,8 +1021,8 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 	 * Create first PCM device
 	 * Create a substream only for non-zero channel streams
 	 */
-	err = snd_pcm_new(uac->card, pcm_name, 0,
-			       p_chmask ? 1 : 0, c_chmask ? 1 : 0, &pcm);
+	err = snd_pcm_new(uac->card, pcm_name, 0, p_chmask ? 1 : 0,
+			  c_chmask ? 1 : 0, &pcm);
 	if (err < 0)
 		goto snd_fail;
 
@@ -1084,8 +1080,8 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		prm->fu_id = fu->id;
 
 		if (fu->mute_present) {
-			snprintf(ctrl_name, sizeof(ctrl_name),
-					"PCM %s Switch", direction);
+			snprintf(ctrl_name, sizeof(ctrl_name), "PCM %s Switch",
+				 direction);
 
 			u_audio_controls[UAC_MUTE_CTRL].name = ctrl_name;
 
@@ -1107,8 +1103,8 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		}
 
 		if (fu->volume_present) {
-			snprintf(ctrl_name, sizeof(ctrl_name),
-					"PCM %s Volume", direction);
+			snprintf(ctrl_name, sizeof(ctrl_name), "PCM %s Volume",
+				 direction);
 
 			u_audio_controls[UAC_VOLUME_CTRL].name = ctrl_name;
 
@@ -1122,10 +1118,10 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 			kctl->id.device = pcm->device;
 			kctl->id.subdevice = i;
 
-
 			kctl->tlv.c = u_audio_volume_tlv;
-			kctl->vd[0].access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ |
-					SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
+			kctl->vd[0].access |=
+				SNDRV_CTL_ELEM_ACCESS_TLV_READ |
+				SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK;
 
 			err = snd_ctl_add(card, kctl);
 			if (err < 0)
diff --git a/drivers/usb/gadget/function/u_uac1.h b/drivers/usb/gadget/function/u_uac1.h
index 589fae861141..6a06594033fe 100644
--- a/drivers/usb/gadget/function/u_uac1.h
+++ b/drivers/usb/gadget/function/u_uac1.h
@@ -36,14 +36,14 @@ struct f_uac1_opts {
 	int				p_srate;
 	int				p_ssize;
 
-	bool			p_mute_present;
-	bool			p_volume_present;
+	bool				p_mute_present;
+	bool				p_volume_present;
 	s16				p_volume_min;
 	s16				p_volume_max;
 	s16				p_volume_res;
 
-	bool			c_mute_present;
-	bool			c_volume_present;
+	bool				c_mute_present;
+	bool				c_volume_present;
 	s16				c_volume_min;
 	s16				c_volume_max;
 	s16				c_volume_res;
diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/function/u_uac2.h
index a73b35774c44..10aa6a8ed9fd 100644
--- a/drivers/usb/gadget/function/u_uac2.h
+++ b/drivers/usb/gadget/function/u_uac2.h
@@ -43,21 +43,21 @@ struct f_uac2_opts {
 	int				c_ssize;
 	int				c_sync;
 
-	bool			p_mute_present;
-	bool			p_volume_present;
+	bool				p_mute_present;
+	bool				p_volume_present;
 	s16				p_volume_min;
 	s16				p_volume_max;
 	s16				p_volume_res;
 
-	bool			c_mute_present;
-	bool			c_volume_present;
+	bool				c_mute_present;
+	bool				c_volume_present;
 	s16				c_volume_min;
 	s16				c_volume_max;
 	s16				c_volume_res;
 
 	int				req_number;
 	int				fb_max;
-	bool			bound;
+	bool				bound;
 
 	struct mutex			lock;
 	int				refcnt;
-- 
2.25.1

