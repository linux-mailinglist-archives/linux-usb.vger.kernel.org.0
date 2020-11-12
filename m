Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6412B1199
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 23:35:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgKLWfJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 17:35:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgKLWfJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 17:35:09 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855A6C0613D1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 14:34:53 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id r17so8198637ljg.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2020 14:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=JXWupUZCS4kOpQRUmxizQOtGxBMhjGpIiVMmRfTsRYY=;
        b=Ifh4X+mD9d6hFc9WUD3a3Kw0/xNxV4f4afULPstMMZSpsPjnQNVIo6e7si8coxOSg2
         zV5g0kXCluViphC+Hhwl3bBWcimMPR5BPCGhaomNp8Pj7mHdt73NEzLubFBd3yFqcj19
         pVdWeIE/WIO8ZfwtNpFd01l8K7F8oDPf+ZzGv3DHhab/gawP8eMfYC5GvegRXwFPATr+
         tFteH3XPk3Vamd4t6MHA8TCWzuEFljXsVvb1jq5jS/hRt4QHfgJBiaFrLYNClA6brIfL
         JWdH/DLcYDenVwrIpoj8zbOZw0RDdvkcftMv4hfwkAAUSziF4ayrEnhhEYxSU7j+5rIQ
         8cSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=JXWupUZCS4kOpQRUmxizQOtGxBMhjGpIiVMmRfTsRYY=;
        b=bZpg3vDoi7hxgjDhMM2l7UGASBBgehGVDxyxiu/QYQK4p2G0IvXXpuZ3F/yUG7ocgP
         EVNzh7i7BKAibvIj2oKnVPb4xlYT8ScCllbz4vOD9C7OfBlErykf7DDQwEID08B3vhpE
         rxRbifUrcoW6M7/YJidAt338m6/yub8yoV16P3krO049Q7OK1dQIDHJp/OFCoOJEvCJ9
         vJoABWkDYOL6h+H/BbvqmBB8etnUGvcDxTFDdY2tRb3HI2EAd06vxkhyqkfl5oRj3QWb
         70R95ci9V/xPdryenLaIQA/avYjTPMPR/pL7nqprtv8EULRz3CjoDnkSPrbCs2ijALUZ
         B1HQ==
X-Gm-Message-State: AOAM533JEaA8b5/GKa5NTkgvFPE/yNhMt5hh2mNwfVNfQ60pgQERBBUp
        zULwSPX2jPiNtwd3O5eVDwmoN9O4/m3FCA==
X-Google-Smtp-Source: ABdhPJyRTGC45an6R4UH/AGQkpH/uhYWBA/t6SQvHcdqa2aao7JAWwhV0HZTboV/2+zl/17Lc6r0vg==
X-Received: by 2002:a2e:9f55:: with SMTP id v21mr706246ljk.423.1605220492027;
        Thu, 12 Nov 2020 14:34:52 -0800 (PST)
Received: from localhost ([80.64.86.40])
        by smtp.gmail.com with ESMTPSA id w13sm1002511lfq.72.2020.11.12.14.34.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 12 Nov 2020 14:34:51 -0800 (PST)
From:   Ruslan Bilovol <ruslan.bilovol@gmail.com>
To:     perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
        gschmottlach@gmail.com
Subject: [PATCH] [RFC] alsaloop: add feedback frequency control support for UAC2 gadgets
Date:   Fri, 13 Nov 2020 00:34:42 +0200
Message-Id: <1605220482-28487-1-git-send-email-ruslan.bilovol@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support of special "PCM Feedback Frequency Hz"
UAC2 Gadget mixer control that is designed to notify
host about real sampling frequency of the gadget so
it can adjust number of samples that hosts sends to
the gadget.

This is useful if both host and gadget has its own
internal freerunning clock, so host can adjust
number of samples sent, preventing overrun/underrun
conditions.

This patch reuses logic of the "PCM Rate Shift 100000"
control used in case of in-kernel ALSA loopback
driver. The only difference is alsaloop reports not
rate shift but frequency in Hz

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
---
 alsaloop/alsaloop.h |  1 +
 alsaloop/pcmjob.c   | 35 +++++++++++++++++++++++++----------
 2 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
index c4aa618..9a50a42 100644
--- a/alsaloop/alsaloop.h
+++ b/alsaloop/alsaloop.h
@@ -122,6 +122,7 @@ struct loopback_handle {
 	unsigned int ctl_pollfd_count;
 	snd_ctl_elem_value_t *ctl_notify;
 	snd_ctl_elem_value_t *ctl_rate_shift;
+	snd_ctl_elem_value_t *ctl_fback_freq;
 	snd_ctl_elem_value_t *ctl_active;
 	snd_ctl_elem_value_t *ctl_format;
 	snd_ctl_elem_value_t *ctl_rate;
diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 6a9aff4..b3802a8 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1058,15 +1058,22 @@ static int set_notify(struct loopback_handle *lhandle, int enable)
 
 static int set_rate_shift(struct loopback_handle *lhandle, double pitch)
 {
-	int err;
+	int err = 0;
 
-	if (lhandle->ctl_rate_shift == NULL)
-		return 0;
-	snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
-	err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
-	if (err < 0) {
-		logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
-		return err;
+	if (lhandle->ctl_rate_shift) {
+		snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
+		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
+		if (err < 0) {
+			logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
+			return err;
+		}
+	} else if (lhandle->ctl_fback_freq) {
+		snd_ctl_elem_value_set_integer(lhandle->ctl_fback_freq, 0, lhandle->rate * (2.0 - pitch));
+		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_fback_freq);
+		if (err < 0) {
+			logit(LOG_CRIT, "Cannot set PCM Feedback Frequency element for %s: %s\n", lhandle->id, snd_strerror(err));
+			return err;
+		}
 	}
 	return 0;
 }
@@ -1195,6 +1202,7 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
 	int err;
 
 	lhandle->ctl_rate_shift = NULL;
+	lhandle->ctl_fback_freq = NULL;
 	if (lhandle->loopback->play == lhandle) {
 		if (lhandle->loopback->controls)
 			goto __events;
@@ -1204,6 +1212,8 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
 			&lhandle->ctl_notify);
 	openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
 			&lhandle->ctl_rate_shift);
+	openctl_elem(lhandle, device, subdevice, "PCM Feedback Frequency Hz",
+			&lhandle->ctl_fback_freq);
 	set_rate_shift(lhandle, 1);
 	openctl_elem(lhandle, device, subdevice, "PCM Slave Active",
 			&lhandle->ctl_active);
@@ -1289,6 +1299,9 @@ static int closeit(struct loopback_handle *lhandle)
 	if (lhandle->ctl_rate_shift)
 		snd_ctl_elem_value_free(lhandle->ctl_rate_shift);
 	lhandle->ctl_rate_shift = NULL;
+	if (lhandle->ctl_fback_freq)
+		snd_ctl_elem_value_free(lhandle->ctl_fback_freq);
+	lhandle->ctl_fback_freq = NULL;
 	if (lhandle->ctl)
 		err = snd_ctl_close(lhandle->ctl);
 	lhandle->ctl = NULL;
@@ -1334,9 +1347,11 @@ int pcmjob_init(struct loopback *loop)
 	snprintf(id, sizeof(id), "%s/%s", loop->play->id, loop->capt->id);
 	id[sizeof(id)-1] = '\0';
 	loop->id = strdup(id);
-	if (loop->sync == SYNC_TYPE_AUTO && loop->capt->ctl_rate_shift)
+	if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift ||
+			loop->capt->ctl_fback_freq))
 		loop->sync = SYNC_TYPE_CAPTRATESHIFT;
-	if (loop->sync == SYNC_TYPE_AUTO && loop->play->ctl_rate_shift)
+	if (loop->sync == SYNC_TYPE_AUTO && (loop->play->ctl_rate_shift ||
+			loop->play->ctl_fback_freq))
 		loop->sync = SYNC_TYPE_PLAYRATESHIFT;
 #ifdef USE_SAMPLERATE
 	if (loop->sync == SYNC_TYPE_AUTO && loop->src_enable)
-- 
1.9.1

