Return-Path: <linux-usb+bounces-26993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6BB2B228
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 22:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 564E268426D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 20:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2013C224B0D;
	Mon, 18 Aug 2025 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SsjrAwXa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB883451AA
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 20:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548142; cv=none; b=FPyxz1yF2TsbG00PvxHxsLzjR6urf1fxRhtD0b82yM7ntZs93sKT4KRGwp0X8CQeEkHpIDBjEB73Dr+6UR9PzXxPRU1WVDxKATR/4nehCJxMThNkzXJFV6DgMMKVStdTZRAKBKFAXveciIp3iSyppeYanF7SszLnEoj6j2Grdi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548142; c=relaxed/simple;
	bh=AJRr1pmfwAFojoj8scQGayhsSG5RjYydyI+9N43dH0Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=U5pmCZitIHAFkM2UH1CG9QccfxW5mO8a9xht0VerUeULt6kTf68pogzxWPofGUwvlYtzE1nij86WC/9//O3mC6zk9BnD+M1BaX78g8uOCkiaQm3XIys42wKtmwuHKhL3IY+yPJ2PpSl2zyUeYWAA1DuY8cmroSBWpTfqNVw7q1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SsjrAwXa; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce521f77bso4609324e87.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 13:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548139; x=1756152939; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pQTw4pj+T7PRPBakG+ijRSJnANn71d9h/koPyWygvM=;
        b=SsjrAwXa++UN5sfgF7L+n7fEi/mYt3bHoIwaoMx1QhR0Fm3OR8xtG47tkdxLcbSxQl
         9T6J3sP5zcecSVfYEeNnVLJChEcPmVOKLZAOKio1VKDJJafbQNPSatSRf6zfMH2GHXmM
         0p8zm2FEJXarFZHGe5tcddKDktc37fZtq8/ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548139; x=1756152939;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pQTw4pj+T7PRPBakG+ijRSJnANn71d9h/koPyWygvM=;
        b=nMXJ/e2+3jMrJk1zYVlLFV6IIPnvIX/addvmB6glsU7rA3t43A+/9MlhwWS29XalpG
         yVAqN5GIyzuEn8Zw6ytM1oam7jOvlFRh1aOWCQFQDUD4+wmHWAcxaDTurxNn5lhPCOYK
         tP9YETYSAAEC6mzzNHHUXr7hVlx5mJqaWV6PxkA/ZkhnqyWxrH0QB1eQ2u2DWpRQWl6h
         egR/856/HDDZVJHUxzL9QUUSAF9SDERsp0VKHcEeuK7D3QhGZfdc60KEZsZ5uVEeliuO
         fNyLzBstfvrEjnk6ppfW4UFGfxogmHRJuxQNx0h+uABpwOwiWbJPAUP4pYAlhE1PjFgQ
         TZ5A==
X-Forwarded-Encrypted: i=1; AJvYcCW0mhHJLO8q79ZM2wZc8MAtConYSAANzGEMDi5SII8k9MlmUHjFryvIojhLRiCTSQGcD9oqVuPbiQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDSQd9pDY1haL9yEHvWZemAbMm4iM7YTzhT7/kaRLsYVUJriKl
	kiHCMckfT0m96IyvfYwQUxSpl/ZrFSkuEosY6N6OjyOS3PCvrsT/RH/YTIDMvMl3Zw==
X-Gm-Gg: ASbGncvdLsohodEqIXmRNxIhkNE5EIr+Gh+s8B10ONKdgzPERlu+M1G4fATqPBta4qo
	rq/8JVUr1RFYUz/saDbbHtY3lYdvDvLMe7cD5lrif/gAC2tOVjjhqPz+hbrtMuVyYYDFflqU7oK
	rgYR7DWCAdCvsxUMteZAcM9d+vGhHZMjr3j/5gAWT5w2rYoMM3LFfvE/JuRS+tFLBjg5gHaih1D
	YHGIJEG32NoNZrPI7srP5pIfz4eUduLjmNCL9SSvkYLAezEehh81J3IZ7hjENZ8IVOx6vadzjF1
	NGlfD0jw+OU3KW/2b3v3PurPSzkU0K8sponlmDI+4QSLw4xNkA7QpCc+5buJ3cY+Cf3JSPsSO5y
	FspsXefmEoFtqJMZMtoVe0eKyd6MTTjiCZMCej5mkM9+63M/ZSd82u19eIpuQRlz1hUJbdvkxV6
	U=
X-Google-Smtp-Source: AGHT+IG3TFzShY6yfe6XJmMNX+zhm5pE0AhCdI1YMtdo5PB/hPLK1e4o0t2sgzIesjN97Glq5qiZsg==
X-Received: by 2002:a05:6512:ea5:b0:55b:9647:8e64 with SMTP id 2adb3069b0e04-55e0082d2ebmr42174e87.36.1755548139043;
        Mon, 18 Aug 2025 13:15:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3476sm1789268e87.107.2025.08.18.13.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:15:38 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/4] media: uvcvideo: Add support for
 UVC_CROSXU_CONTROL_IQ_PROFILE
Date: Mon, 18 Aug 2025 20:15:35 +0000
Message-Id: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOeJo2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0Nj3dKyZN3MQt3i8syS5AxdY/M0EzNDM1PzNEtTJaCegqLUtMwKsHn
 RsbW1AAQehqRfAAAA
X-Change-ID: 20250813-uvc-iq-switch-37f461657f95
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Add support for switching the IQ profile of a ChromeOS camera.

This patchset depends on 2 patches in uvc/for-next:
- media: uvcvideo: Fix comments in uvc_meta_detect_msxu
- media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Laurent Pinchart (1):
      media: uvcvideo: Move MSXU_CONTROL_METADATA definition to header

Ricardo Ribalda (3):
      media: uvcvideo: Fix comments in uvc_meta_detect_msxu
      media: uvcvideo: Run uvc_ctrl_init_ctrl for all controls
      media: uvcvideo: Support UVC_CROSXU_CONTROL_IQ_PROFILE

 drivers/media/usb/uvc/uvc_ctrl.c     | 41 ++++++++++++++++++++++++++++--------
 drivers/media/usb/uvc/uvc_metadata.c | 22 +++++++++++--------
 include/linux/usb/uvc.h              | 22 +++++++++++++++++++
 3 files changed, 67 insertions(+), 18 deletions(-)
---
base-commit: 078f1a7eb48eef9b3cb78bcd2254356f3a332358
change-id: 20250813-uvc-iq-switch-37f461657f95

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


