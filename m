Return-Path: <linux-usb+bounces-37977-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPXiIcXbEWq0rQYAu9opvQ
	(envelope-from <linux-usb+bounces-37977-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 18:54:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 895635BFE91
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 18:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 863CA300B28E
	for <lists+linux-usb@lfdr.de>; Sat, 23 May 2026 16:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2D3324B22;
	Sat, 23 May 2026 16:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+YanwQN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36991F5825
	for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 16:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779555234; cv=none; b=BydkVhtEDY954maOABXhzFVtqdIBrUlcyxocLWJijwNBVKxEUc9rffSHIbI7UJUcwi80jo9fsHrK5VyuRaMzisEUD5nnH4YO3EVFhSrHyQaT5SIx7N2BxY/w+mvsb64zejXEEtgpsGOME0cVIYgVPhEPzu2/AiDWG20DjFu+jjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779555234; c=relaxed/simple;
	bh=DGZ1Iu78FNYWURpAerzc6calyIgHVwJu5yS0L/BzyJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVq/Utmq7ANGaCecFHf1MdsZIoe96fLyZjQuWkhI1Nx446Kh4EkF4b1tVBkBHbEPdUYglJ4qQx0+4gil277T82/V8hftkfudZuKeFiemYYHmWTxrvANuHiuWfsKUIfyyPIOuGJlUFzvwS9sDxPaDydUsgXflxSJuUyGxpa0VliE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+YanwQN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a858881ad2so10655252e87.3
        for <linux-usb@vger.kernel.org>; Sat, 23 May 2026 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779555231; x=1780160031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KNiADcE9MK3Ayde/OGmbBhB9zN35/Oo61VBdFulAcM=;
        b=C+YanwQNeFjqTjMJVHH7bjIVzHMZD1nNjB8QWt8YPRHQk1KJ665xZcgEicBVbE4oan
         iJrMtHJNkWRbjR7r2bCjJU+DfwC4bSR08+/r4UoNZ0/xkQJKktVQkAJefEq94hUcsdve
         t2ooL3OdiXJW8j1DON+c0CEnv9AkRVFBls12wqqjo3GtOLNfx7cUf5IdNjqCCxgfZjjc
         0uJLtvZ9mRXjamM94dJGpIqKRMXfoctw5/OSIJQErv5AWMD86chrbvvtwzgqqZurkrHp
         wGvzZBflWx/DUp61cmMVQF78k6IZsO384jDi3KTnQEn2ijOXjZGrchmPOiVDiTqD7x2S
         PHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779555231; x=1780160031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0KNiADcE9MK3Ayde/OGmbBhB9zN35/Oo61VBdFulAcM=;
        b=p0N4duWho51DuUVt1tdNGXIAUUshjlXG6aSFQ+hjUDGBtY3K+ikElc39DKs3LLYNfS
         WFWruhCoO3+fbrR7LM6WO5mfn2x8GbYGJbtNV4s3EhN52hfsYM4+y6lLWvFVI/wF0pYz
         +hJpYRBe1BLMIzWBW6nLg1CeaqDnv2ey09obcrMVTRc34MFj0XVnYvo57uvKkgQ46dJG
         6451NiDO8LhH1qB6hX1FUlHH5baiZ5uDeNQmBSMOuNTsM3gO3mz/PE+DHzfFiQdy6LkA
         +YG8WEt/t5ITTtNBMRFmvpA7Ga2Il04dhWQOKbBkx4bzbh+Mnaz7zjlARA8Kh6l72tPP
         WyqA==
X-Forwarded-Encrypted: i=1; AFNElJ+o/PBgFGLZeiem5brLDOPYx8sTaGV352/FlLS07Np7yzvqgXjA9L3Kq/ljgSw3WTIlhWAbga9dBJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXYIh/ssehMrM+jnj9WeD079KYkX+oWxlbcllHOOIkHp6kisn
	GFMBRWC/AuXLQyaumkwsOS7BZWsxXRCcLynTP/iMEqrtEidd3jcExW7c
X-Gm-Gg: Acq92OGlLLfRfkkqztwRFfDn+WcBXeO91vhlQ0eE50Yc5ar2Y7S/OjX0FTxtw95jcg5
	5SS1puS0C6Z9fPj1hioklSX08rO+EmBDTnw5eEk3umZlNM8kHgdrShU4GcPTxFlJZWdQoTmUU7q
	TgLy/a6HvvtoTzHdFc3l8fh0Kxh2+XG7d1/Lpcq4EiZWWlhdCxKd1bT2OQ5tdc9Ug1Z7ovgM3C1
	OmT+ZwQMUihO5v+VBbQ6O0C03rULR+qGGFA63jo6cqi+F9/N9FSKDFOl09eGgfkyDfo9CUvpAsk
	FpBp7Ak5tzb2jFp7QVxgG4RIg0iJ9NADSbQ6BHgcTDmzBDsE/a+i/fQfrH25biH8WGCb/pPwsZq
	182Bsijxa3QoPvuimjCsNrHEUfCVmO1hkKT6Yvm6IVlxV1sI5YXYqMIpfNZQ8KfhpSEa1JqnnoD
	EUxAsHx1kBSIdxZ7lK4azDEOidKgr8CHPIRhOufyK6hojUdlOtPI1snoLbTf3LTmIrB+hv8Q==
X-Received: by 2002:a05:6512:6399:20b0:5aa:2a4e:5b78 with SMTP id 2adb3069b0e04-5aa32326a7cmr1765641e87.17.1779555230628;
        Sat, 23 May 2026 09:53:50 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([193.0.150.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cf96bfsm1267717e87.77.2026.05.23.09.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 09:53:50 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] media: airspy: use vb2_video_unregister_device() on disconnect to fix NULL deref
Date: Sat, 23 May 2026 19:53:49 +0300
Message-ID: <20260523165349.286212-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <f202c8ae-554f-49de-a9d1-add337e28515@kernel.org>
References: <f202c8ae-554f-49de-a9d1-add337e28515@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37977-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url]
X-Rspamd-Queue-Id: 895635BFE91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

airspy_disconnect() clears s->udev under v4l2_lock, but
airspy_stop_streaming() unconditionally calls airspy_ctrl_msg() and
airspy_free_stream_bufs() afterwards. If a streaming user closes the
device after disconnect, stop_streaming() runs and dereferences the
NULL s->udev:

  airspy_stop_streaming()
    airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0)
      usb_sndctrlpipe(s->udev, 0)         /* NULL deref */
    airspy_free_stream_bufs(s)
      usb_free_coherent(s->udev, ...)     /* NULL deref */

The airspy driver uses vb2_fop_release() in its file_operations, so
replace video_unregister_device(&s->vdev) with
vb2_video_unregister_device(&s->vdev) and move it before clearing
s->udev. vb2_video_unregister_device() releases the vb2 queue, which
synchronously runs airspy_stop_streaming() if streaming is active, so
the URBs, coherent DMA stream buffers and the hardware stop control
message all execute while s->udev is still valid.

vb2_video_unregister_device() locks vdev->queue->lock (vb_queue_lock)
internally, and stop_streaming() locks v4l2_lock, so the previous outer
mutex_lock(&s->vb_queue_lock) / mutex_lock(&s->v4l2_lock) pair around
the unregister sequence would self-deadlock and has been removed. A
short v4l2_lock critical section around s->udev = NULL remains so any
ioctl path that still holds the file descriptor sees coherent state.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
Cc: stable@vger.kernel.org
Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
Changes since v1
(https://lore.kernel.org/linux-media/20260513052617.140688-1-vebohr@gmail.com/):
- Rewritten per Hans Verkuil's review
  (https://lore.kernel.org/linux-media/f202c8ae-554f-49de-a9d1-add337e28515@kernel.org/):
  fix the root cause in airspy_disconnect() by replacing
  video_unregister_device() with vb2_video_unregister_device() and
  moving it before clearing s->udev, instead of guarding the hardware
  teardown in airspy_stop_streaming() with "if (s->udev)".
  vb2_video_unregister_device() releases the queue, which synchronously
  calls stop_streaming() while s->udev is still valid, so the guard is
  no longer needed; airspy_stop_streaming() is unchanged.
- Dropped the outer mutex_lock(&s->vb_queue_lock) /
  mutex_lock(&s->v4l2_lock) around the unregister sequence:
  vb2_video_unregister_device() acquires vb_queue_lock internally and
  stop_streaming() acquires v4l2_lock, so holding either of those
  while calling the unregister helper self-deadlocks.
- Rebased on media-committers/next.

 drivers/media/usb/airspy/airspy.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 57edb42463e8..358a66ab8e48 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -464,14 +464,21 @@ static void airspy_disconnect(struct usb_interface *intf)
 
 	dev_dbg(s->dev, "\n");
 
-	mutex_lock(&s->vb_queue_lock);
+	/*
+	 * vb2_video_unregister_device() releases the vb2 queue, which
+	 * triggers airspy_stop_streaming() if streaming is active.
+	 * stop_streaming() dereferences s->udev via airspy_ctrl_msg() and
+	 * airspy_free_stream_bufs(), so it must run before s->udev is
+	 * cleared. vb2_video_unregister_device() locks vb_queue_lock
+	 * internally and stop_streaming() locks v4l2_lock, so neither may
+	 * be held by the caller.
+	 */
+	v4l2_device_disconnect(&s->v4l2_dev);
+	vb2_video_unregister_device(&s->vdev);
+
 	mutex_lock(&s->v4l2_lock);
-	/* No need to keep the urbs around after disconnection */
 	s->udev = NULL;
-	v4l2_device_disconnect(&s->v4l2_dev);
-	video_unregister_device(&s->vdev);
 	mutex_unlock(&s->v4l2_lock);
-	mutex_unlock(&s->vb_queue_lock);
 
 	v4l2_device_put(&s->v4l2_dev);
 }
-- 
2.51.0


