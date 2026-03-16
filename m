Return-Path: <linux-usb+bounces-34868-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +D4IDEUIuGkWYQEAu9opvQ
	(envelope-from <linux-usb+bounces-34868-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:40:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D8129A9B1
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 14:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 370A43029452
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 13:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D376239A06D;
	Mon, 16 Mar 2026 13:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BljOqsBV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B7395279
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 13:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668090; cv=none; b=OnmMV93+6ukkQxt3p53pDJ+WchxQ0oqAagA4zK30y8qePBk5RyJaTWtDbBMUYl99SwLoVDFuQz6TjxgSMqpTPvc7yKUlnYgkok1qv02WX0Hv5Wy7b3SRuSJMGquYqdzcIBdDexHYmZoD5xFhtAm6AzpP4O7oBkv9wc3lUpc2X6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668090; c=relaxed/simple;
	bh=jpEYOCyVZpkW297dEVR+a4nlIxn5JZTHOg6mU7Iiuvs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UOmRGIf4in3qZFd6oaCDcP60ZfJsMO26T3mRtZpALMrO2CloI+Dz7WzYCkZpzUHPGp8Dl7bC5W7Ro9UKBe6nurR7a/mvknYMq392Tz4Zq7J55hpdGQxOD5EiTrVUZuG/ALbnWz5vJOmgTLQ9fKo5TLGEDNb0QkPN6D3QATgBi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BljOqsBV; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a12fbbd9d2so7053038e87.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 06:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773668086; x=1774272886; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJa+HjH4HZH7VGwUSdmdofNOBcUA6x1otGkbczV0UXQ=;
        b=BljOqsBVJmyg1t7LoD6c9497ZIR/WwuqqqAmTjghkUBO9UK6bjAnwbSbwcSkTQZ0mI
         CGcqj52ACDANyfQ+fynND5vtpNfoh9iNeUkYN19wmV6PFveEVObyqK/aasukYMU7JxiI
         xPylPcgdvDTppq5/9nxUsvy6JNvUJGzhBx6Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668086; x=1774272886;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJa+HjH4HZH7VGwUSdmdofNOBcUA6x1otGkbczV0UXQ=;
        b=DT126o0COwWOv/Z27lWKl/7PoYF907qcscuwX8Oh0EC0ttErtM6uOsK2INcVIWu9rr
         BtoztYu2bWTjB5JChCuavGwOEBSGoUySDLdOKEjMh2bNg8Cc4ZV8wR2eCTrxYkqH2ZJ2
         tntl0XrgpuAP+cl4olratJPQVJs8fSJeFwbq4tLrm3JVrZEfHmuTq1BVxI9nSlAfScra
         Py2ZkKE4c8jlc3KN3H2cSxpHdPAr0JSMbigmfkar0XiyjdEOxbCII0BBQ8oELaR86WwS
         AIYkdvGxrnHPJhex2JHLfrgBN3NrENfhasqXOSk8G00tJD+ZrMfIVqoBt8cm4aSmWVD3
         TS7w==
X-Forwarded-Encrypted: i=1; AJvYcCWubPM/rofoIhZHz3Hwz2j36uwkXkRhCG9RPzczlHWgiPG+cIkJXz1piIYMi+Bz6V1cPsTbTQPnoLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2wKLLGBHivPyGb9ll5UvC89ISD3zDWN5UR/zrysvwekXhuYK9
	sBXWh2Xi3YCVruNwWGIVZS0YlfyLRgddajPxbbT15xM/KBXWSgmtyjLooQCvdCiblw==
X-Gm-Gg: ATEYQzyn4tH/o/uuBdOacO7Y8M94uMWaasgavGhlCb2MmAQ8a7UQIMaLWKGw2yjceZJ
	9dqhU3q5n0HIrAj02r2lgKntpJT0R0IgXZS50BMRAOD3j4YGgOy5Lk7qzan7D/PJRoE7p5nDZBy
	7oPqx0yK8vzDa0iaBrXjGiTubceMArFH1XPYMdyN3zyo3VpqvGqlPEjfhiIPXNkDS2lFCfSvkC4
	WHpBnwo6og8niB27fdhTMnQCb1ApiWdDwFN75DplJ2KdN21xl4/N3K+RI4YfiJAFp7SDWe9Zo0/
	ea0Os9BAVlVCuprxTuSvRXVyn6q3thiViH75v9C9WfWSX9344uSPZi2250iRp8AMg4K8p1TzlOv
	p3+D5lSW4nPhCRwMf/V6OJKe7wAlDGz2KMI1IYzH9ApLSjTD9xFTfI7r2Jl5azQJlocKeIIhCrx
	smXWuNnayv6ZlRWSSxFOJrFx1J0LW6Ta6UnPzWfdkz3YslXTjZq7yZsmFhgvH2PAoARISTczdJh
	g==
X-Received: by 2002:a05:6512:70c:b0:5a1:33b6:2b6d with SMTP id 2adb3069b0e04-5a162705caemr3372921e87.14.1773668086104;
        Mon, 16 Mar 2026 06:34:46 -0700 (PDT)
Received: from ribalda.c.googlers.com (27.69.88.34.bc.googleusercontent.com. [34.88.69.27])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366a7fsm3481473e87.76.2026.03.16.06.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:34:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/4] media: uvcvideo: Map known XU controls
Date: Mon, 16 Mar 2026 13:34:43 +0000
Message-Id: <20260316-uvcdynctrl-v3-0-19cd4657e1f3@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPMGuGkC/23MQQ6CMBCF4auYWVvTFgnUlfcwLmg7hUmEmhYaC
 eHuFlZqXL6XfP8CEQNhhMthgYCJIvkhj+J4ANM1Q4uMbN4guSyFEBWbkrHzYMbwYJWuuSu10/o
 sIINnQEevPXa7591RHH2Y93YS2/s3kwTjrEFbcWysK2x9NV3wPU39yYcWtlKSn1p9aZk1L0rln
 Fa1Ufij13V9A4uKLnnlAAAA
X-Change-ID: 20251117-uvcdynctrl-7b80f5bfbb41
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Manav Gautama <bandwidthcrunch@gmail.com>, 
 Martin Rubli <martin_rubli@logitech.com>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34868-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,logitech.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 70D8129A9B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UVC driver uses a custom ioctl `UVCIOC_CTRL_MAP` to map XU controls
into v4l2 controls. The most well know user of this feature is the
uvcdynctrl app.

This app has a set of XML files which contains the list of mappings.
Some of these mappings are standard and other ones are custom.

This series move the standard mappings to the kernel driver, so
userspace do not need to depend on external apps to use them.

While we are at it we realized that some of the mappings can be harmful
for the privacy of the user. This series introduce a mechanism to block
those mappings.

While we are at it, we complete the deprecation of the nodrop parameter.
Ideally, this patch should belong in a different series, but then we
will have conflicts... and who wants to works twice?

I have tried this series with a Logitech Webcam Pro 9000, that has been
donated by Hans de Goede (Thanks Hans!!!).

Without this patch and uvcdynctrl the device has 14 controls. (Ctrls A)

With this patch the device has 15 controls (Ctrls B):
Ctrls A
+
control 0x009a090a `Focus, Absolute' min 0 max 255 step 0 default 0 current 0

With uvcdynctrl and this patch the device has 17 controls (Ctrls C):
Ctrls B
+
control 0x0a046d71 `Disable video processing' min 0 max 1 step 1 default 0 current 0
control 0x0a046d72 `Raw bits per pixel' min 0 max 1 step 1 default 0 current 0

With uvcdynctrl and without this patch the device has 19 controls:
Ctrls C
+
control 0x0a046d05 `LED1 Mode' min 0 max 3 step 1 default 3 current 3
  0: Off
  1: On
  2: Blinking
  3: Auto (*)
control 0x0a046d06 `LED1 Frequency' min 0 max 255 step 1 default 0 current 0

BTW, Driver tested with virtme-ng. First time that I use it for uvc
development, and it works like a charm :).
virtme-run --kimg arch/x86/boot/bzImage --mods auto --show-command \
	--show-boot-console --verbose --qemu-opts -usb -device qemu-xhci \
	-device usb-host,hostbus=1,hostport=4

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3:
- s/param/module parameter/ (Thanks HdG)
- Rebase to lastest media-committers/next and remove merged patches.
- Link to v2: https://lore.kernel.org/r/20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org

Changes in v2:
- Document how to get GUIDs
- Show clear deprecation intentions to the user.
- Add new patch for the Kconfig approach (Thanks Mauro).
- Remove duplicated control in commit message, provide background and
  add documentation. (Thanks Laurent)
- Block also uvc_query_ctrl for privacy controls (Thanks Gergo Koteles)
- Link to v1: https://lore.kernel.org/r/20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org

---
Ricardo Ribalda (4):
      media: uvcvideo: Import standard controls from uvcdynctrl
      media: uvcvideo: Announce deprecation intentions for UVCIOC_CTRL_MAP
      media: uvcvideo: Introduce allow_privacy_override module parameter
      media: uvcvideo: RFC: Convert allow_privacy_override into Kconfig

 .../userspace-api/media/drivers/uvcvideo.rst       |   2 +
 drivers/media/usb/uvc/Kconfig                      |  11 ++
 drivers/media/usb/uvc/uvc_ctrl.c                   | 212 +++++++++++++++++++++
 drivers/media/usb/uvc/uvc_v4l2.c                   |  11 ++
 drivers/media/usb/uvc/uvcvideo.h                   |   1 +
 include/linux/usb/uvc.h                            |  10 +
 6 files changed, 247 insertions(+)
---
base-commit: f6390408a846aacc2171c17d88b062e202d84e86
change-id: 20251117-uvcdynctrl-7b80f5bfbb41

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


