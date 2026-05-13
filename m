Return-Path: <linux-usb+bounces-37361-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OC8LM5wLBGoWCwIAu9opvQ
	(envelope-from <linux-usb+bounces-37361-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 07:26:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A40452D862
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 07:26:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E74403058823
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 05:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEFB3A5445;
	Wed, 13 May 2026 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLwY1zB3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F833A48E3
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 05:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778649985; cv=none; b=jE7tJEOVBuN3JS3dMOlPeuPMYayV0GKJqB626wxKXq0RjK9QL0Ja7mZFMiDIYoMSOpdYwSke+wiaoT7sw/9jJ3g+E7p/rHCA1rptmmLhhpDEc14bFumPOnDKBMV9iJfAUhcNsQ7xHpIZM6qkrOf4nmZcs5QMfwpLGjTi0sf1Hto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778649985; c=relaxed/simple;
	bh=0h6TEAz0bXh3QxqRR5NEOAou4uU85YPhh8lLus2WFTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMYl9v1IlPWYXEZfmYLGe7VCk5S8WcA8IuuSVm73IGte9A51GXclXb7ZDSI0NlG3kQ4niy9bFyPVH2iA5vxx1Ogd6IALrvpMuqnyjN6SDoVLT5ZWwGHvlwtl0AO2+F+NrFwYLvD1s2xNgtX4BCMplam7hWV37JnnaICuoUye9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLwY1zB3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488d2079582so66050215e9.2
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 22:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778649982; x=1779254782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=426SbMLkPYdeGvdzy70ZIE65WsPyaPVfmpdak1PcYqM=;
        b=eLwY1zB3kScY/Xn75epXhqUPYTGikeSvtoZQrsu2X+RBKc/UAtAjDLqf2nbb1Ev8mt
         vvtIY+6YhqoZP26pcgX6PoEPfjGstUSkCvnWGb9+Lup9C+ozsTPRZQeLj2LK7sxw/96H
         KxsZbcOh1+mf/wHY+OjSKMk6UQrt2kyernWIF3cE1C39y8dKqep1vI1+NKel4gOqjDVi
         sFAgKJGLRL952RhrfTtwlYc7Kkk+hwm+145lL4G0GHeFqbrRP1+VEdtIAr9ivRutjFle
         0LaJTqLu/yxUSY6QRbr+DHsV2oqwX+CEmFWqq3XBntf7bLqrL6hG/LzJJPFjKDbJJjy4
         hqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778649982; x=1779254782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=426SbMLkPYdeGvdzy70ZIE65WsPyaPVfmpdak1PcYqM=;
        b=U2/znjT11n1Vp/z+nLWYhc2/9kxGbTQIBKKN87d43lBVAlR9UXr823zh/KEt6qq16K
         yFvH4M0QkiyZZHSIlUNiZhJecx0Tuq3G0a7CQCby9ZhiMtn1m3SzkaDb70yw0jr7biPq
         s5RrkfdpVRqQG7JR+CwA0FUakpri4qGc2dW9YjgOwD6A5eT4TEW4NtRznDMlgbAA9k6K
         diEoIEhvN4IchMYUnOMC7bzZEtwS/pQMufX30m8azk5a+fo3H0OcHidcaGcUoI7ZXqAg
         HDWpxuSgQ+3UaOrsuNiMNUzS+swFtEZzvXOe4wPIL4/Fo7VWsicm+YZLubYqV+mh/bOk
         8bmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ld9KAocm1MbDaVrhU41+rbr7hSjfewA+n8H6kPhcV0Cqov4M8MqUyYNtU6n9EVa4iVDSAkPO13RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH7J60qRNAOILRTAH0g4ZRB/M0ASSg6pwagcX9k94Yq0Gqst0b
	EVGjqY9Pmk0kh4Wdf1jVJVpHJzaWm0pIc+GJOKqBjBLEi3ZO7jfXjNNj
X-Gm-Gg: Acq92OGdWhRXe5RJA4/i0fR+p0ewXVSeaYyDsVKAT35CVWq/W5PM7Kjz3Gv29ezL7SQ
	iHkg5JovVBYSThZAH+THmSXBiIGAsw//l+gLj+joU+CFsa6v5yOkqrCe4rO8+5TINUvzib/PjCo
	Q0Zo606cyJRVrHUNGcfXdZcuq4gPDXePNDIomIH3b9+WkYTa7T3DTWEu0soqh87u8LVI7YG+9eC
	mltQc4LXLg8Ba/G0fzc2OHxgIauvaEUZlaqHhxZmh1AdK0a/n2bLx8Kg1T2wThG1zTqyihDUJjM
	JPXZik+8lJIaCrJK0k574ylbBNh8pMamODfcjNf/wp9e3cx8IDg7E1uLzwxZILTom9HuCwrHwY0
	2AdzXtkIIjujc4J+hrzksCPrdr+3IlEN26NTntZ0dsp5mt1ZnmmVWYCZEETrpMjNb42uRd+m+7j
	DRFHbgydX3NX3gbDCsre2EBcfsKurO5ZuZbItR2cE5SRLB0M9BniWMyq1h
X-Received: by 2002:a05:600c:458a:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-48fcea00708mr12819255e9.27.1778649982055;
        Tue, 12 May 2026 22:26:22 -0700 (PDT)
Received: from va-HP-Pavilion-Desktop-595-p0xxx.mshome.net ([31.7.57.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm50775435e9.11.2026.05.12.22.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:26:21 -0700 (PDT)
From: Valery Borovsky <vebohr@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Valery Borovsky <vebohr@gmail.com>
Subject: [PATCH] media: airspy: Guard stop_streaming() against disconnected device
Date: Wed, 13 May 2026 08:26:17 +0300
Message-ID: <20260513052617.140688-1-vebohr@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7A40452D862
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-37361-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vebohr@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sashiko.dev:url]
X-Rspamd-Action: no action

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

Mirror the precedent set by sibling SDR drivers msi2500 and pwc, which
already guard their hardware teardown block with an "if (udev)" check.
The queued-buffer drain via airspy_cleanup_queued_bufs() must still
run unconditionally so vb2 sees its buffers returned.

Issue identified by automated review of the INV-003 series at
https://sashiko.dev/

Fixes: 634fe5033951 ("[media] airspy: AirSpy SDR driver")
Cc: stable@vger.kernel.org
Signed-off-by: Valery Borovsky <vebohr@gmail.com>
---
 drivers/media/usb/airspy/airspy.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/media/usb/airspy/airspy.c b/drivers/media/usb/airspy/airspy.c
index 8f6b721ba107..50db02d35213 100644
--- a/drivers/media/usb/airspy/airspy.c
+++ b/drivers/media/usb/airspy/airspy.c
@@ -584,12 +584,14 @@ static void airspy_stop_streaming(struct vb2_queue *vq)
 
 	mutex_lock(&s->v4l2_lock);
 
-	/* stop hardware streaming */
-	airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
+	if (s->udev) {
+		/* stop hardware streaming */
+		airspy_ctrl_msg(s, CMD_RECEIVER_MODE, 0, 0, NULL, 0);
 
-	airspy_kill_urbs(s);
-	airspy_free_urbs(s);
-	airspy_free_stream_bufs(s);
+		airspy_kill_urbs(s);
+		airspy_free_urbs(s);
+		airspy_free_stream_bufs(s);
+	}
 
 	airspy_cleanup_queued_bufs(s);
 
-- 
2.51.0


