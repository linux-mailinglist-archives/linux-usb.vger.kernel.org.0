Return-Path: <linux-usb+bounces-30740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E02C70D70
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 20:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E9E7A345AC6
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 19:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0548D371DFB;
	Wed, 19 Nov 2025 19:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dU0UKT9e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59BB369231
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 19:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763581041; cv=none; b=P8TpD53HIwV+6bYwZQThDb6Ks+sG9bD4sjK4zeXEB82JtY5OHP93wgoelnxpSyz+3qoOHwo/47WhHZTnWEWaZqv3qfrLDqTT9KuMnlRGmslRnlRZWYuBZCVcWj1YZwoDxwrfpz+9M9LK5D/zZzsNtQIYJsRIx380noIHnDWAiuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763581041; c=relaxed/simple;
	bh=smsLWyIhFZI4LUQsucb98+3IzvKG+sVE9pphNiqEeWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o6y3j7YG9D6UuDDUGLCiOBy6J8AcujstQvvnswp7dkt3t0V3TYPpjMNyhK/oaV2iUtinjVfT29NQNNTWiR/N98fhtfynmHS9Yhpq44QtTHmsBsPq337bbnY5YrhBAMsmOooXZgej9TeYLlqz7nj36pisX/WsLYy4KDYgN4yqUg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dU0UKT9e; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59431f57bf6so24925e87.3
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 11:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763581035; x=1764185835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mhkxKxNdiC2wNdpzuN+YHorPAGBUt1TQOUtGQjnuPb4=;
        b=dU0UKT9eoCEZn4t9Z0g/7EWmLK7rsez+HGyJCWm6f67AlxFfQ+NWP+LnCr9ukH/By+
         Rc4ApSfTatVytTGAm9d2W3TJhkTaC3CxVZmy8tY8RLy1n9xZYKZrBqnBWzQz0imSo+7U
         nk/Bqg79/c5jxBCHcvqqZ5uj4tsubSKXfKfvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763581035; x=1764185835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mhkxKxNdiC2wNdpzuN+YHorPAGBUt1TQOUtGQjnuPb4=;
        b=Z7emdvh9Du07KfVVnwc9AJzielIqw+/dFitKRHndEJf69iR6MODdLEq6Zw2pkYu5g4
         FzTEZEaL2j9DAGUrR0u42XzXxTEfAr7mgub98r3ec7kdw73vz8Ep4ELPB3Q+YsCez0Iz
         9PqnuDXUBe1wKDJEdh2ObUFg48zoO5hjfGRwJyATvPrc7esJX/DsviTI1U0/vnqC54Hu
         WLO0lpHVuPg44R4irywQey1Wp0HIK9WfKPCGxS0/bq0A4ma2qal8zRSSB6SUkfwwWvQQ
         ia8hqPW91AALS7prTwdNaGWRZwbp1t5RAoRknweQCkNncGgFfXpZ/EGdV+S4z6Xe3DXf
         GNag==
X-Forwarded-Encrypted: i=1; AJvYcCW4ILFFXZn3B9X0/62tF7KZtNy1YjqCInTmjBesbFCqtQwCM52ObRJLt4Q/rnrKYPAG/zGJsNGA0e4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZXkw+NCBktrJOnbv7qO6lf/N8qb1cw94ZsXdL1w40JESKQ3JP
	T2P6UQD/N+0dFgGI4QdnlHCxc4aV3elj43EjSgYql26R8+LFuXLMbHAly4LJkrC0Uw==
X-Gm-Gg: ASbGnctrrZqKIGk4C4+bxxVaXxHpVzrU0WJHTrwqbw7VHd6xJhALPout6vpk2Vz29UE
	Eio1Z8lrtKo1k0Ci9ZnolPim2Wm6wuaPaTVrY4fMH2WTi2o/Wd4DnptsE6CwM0fniib7ErR4afW
	Drr184iGjNJiuOLMRWex7tBAARBCdoKkKjicQenVAF+FnhhBeMau1/bJPLlVLqOL0qZDgpvGcyL
	NIfGLaFBn/hzEiFHFB0G0aX7xnfPvTV2phr8FajG6TfAYNDZqOiX/qR61LirZIfLLcvGOH4aB09
	6FgOvy6CyfvjV2OBMgtIXq3UR95S0bJUCt84+4B/A1OUyKhLsNAPR0V/WVoDEoWL8fZ99hMqvp0
	r3gnWJ8sinmQ3vKA9c2tjExf9WgW8RbS+pgbEMnaqQ5qSCpgID6y8wq5qXk11rgGXFFiKrQ4bCg
	Vpaibbt7BwMzYdHfOnN2LlolURyTHeiJ/RIduT6bJaJ9Ns1rsMJlEZXSCaqtICf/clSbuuo9iL
X-Google-Smtp-Source: AGHT+IGJe3V2Yc1Ik3PSIeoKVCn2YAJLOADNcKsHyJgQGXCsFRO6F5ZJLhmJqnTvgFCXCK6GL6NZ1g==
X-Received: by 2002:a05:6512:23a6:b0:594:2f72:2f7f with SMTP id 2adb3069b0e04-5969e2b505emr37039e87.6.1763581034759;
        Wed, 19 Nov 2025 11:37:14 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969dbd15a1sm65790e87.98.2025.11.19.11.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:37:14 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 19 Nov 2025 19:37:12 +0000
Subject: [PATCH v2 3/6] media: uvcvideo: Announce deprecation intentions
 for UVCIOC_CTRL_MAP
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-uvcdynctrl-v2-3-0359ffb98c9e@chromium.org>
References: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
In-Reply-To: <20251119-uvcdynctrl-v2-0-0359ffb98c9e@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The UVCIOC_CTRL_MAP lets userspace create a mapping for a custom
control.

This mapping is usually created by the uvcdynctrl userspace utility. We
would like to get the mappings into the driver instead.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/drivers/uvcvideo.rst | 2 ++
 drivers/media/usb/uvc/uvc_v4l2.c                       | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/userspace-api/media/drivers/uvcvideo.rst b/Documentation/userspace-api/media/drivers/uvcvideo.rst
index dbb30ad389ae4d53bc734b4269ebea20ecdd7535..b09d2f8ba66ecde67f1e35fd77858a505ad44eb1 100644
--- a/Documentation/userspace-api/media/drivers/uvcvideo.rst
+++ b/Documentation/userspace-api/media/drivers/uvcvideo.rst
@@ -109,6 +109,8 @@ IOCTL reference
 UVCIOC_CTRL_MAP - Map a UVC control to a V4L2 control
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
+**This IOCTL is deprecated and will be eventually removed**
+
 Argument: struct uvc_xu_control_mapping
 
 **Description**:
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 9e4a251eca88085a1b4e0e854370015855be92ee..03c64b5698bf4331fed8437fa6e9c726a07450bd 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1044,6 +1044,8 @@ static long uvc_ioctl_default(struct file *file, void *priv, bool valid_prio,
 	switch (cmd) {
 	/* Dynamic controls. */
 	case UVCIOC_CTRL_MAP:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP ioctl will be eventually removed.\n");
 		return uvc_ioctl_xu_ctrl_map(chain, arg);
 
 	case UVCIOC_CTRL_QUERY:
@@ -1158,6 +1160,8 @@ static long uvc_v4l2_compat_ioctl32(struct file *file,
 
 	switch (cmd) {
 	case UVCIOC_CTRL_MAP32:
+		pr_warn_once("uvcvideo: " DEPRECATED
+			     "UVCIOC_CTRL_MAP32 ioctl will be eventually removed.\n");
 		ret = uvc_v4l2_get_xu_mapping(&karg.xmap, up);
 		if (ret)
 			break;

-- 
2.52.0.rc1.455.g30608eb744-goog


