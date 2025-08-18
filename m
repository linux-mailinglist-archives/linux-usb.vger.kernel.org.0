Return-Path: <linux-usb+bounces-26996-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89453B2B235
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 22:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C4E31BA008A
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 20:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9CD274FFE;
	Mon, 18 Aug 2025 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MJwKW3nC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC7224240
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 20:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548144; cv=none; b=lV/l7EmyoxRwLpODy+ytPGreIyU01w7IBqXuSfeMVQerE7efkeJePC0kWsaoaVqmJrZWrYiLX23wW/yovP9nu+GdTe2aSRFYK+P8FQm93MweEoGfIWLdcd3UcZG75tCC+8zjS1yLtudpI+ZgtdenbmUbqJ2E1giCea19UeI/YHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548144; c=relaxed/simple;
	bh=2p2FtkZ4Lnr9IlWB9wAFHpMJBW9ofPI2RfNGv3X02BE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XMtKJ9NGSHNr9vjaCeWYAH+pIbRoOEpITBikH6rh/Q5soLxgX1usEHzJWEMT9wjgLAIFWjtXgDjlsIprsYBF2mDwil0VdkViwib+vOxRep3M35Lc9YsH85pFBiUb4osbDHfp1qbKRbvdrtcu3AW6ty0n7XdbZ7aAVYlbDrdChTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MJwKW3nC; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55ce5268cb8so4361807e87.2
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548141; x=1756152941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLzqZRdyOLv8EDpzaUnt0Q4MFdVvX6ZyIG6yl0VPoqc=;
        b=MJwKW3nC5WAQCeoA87IfFmIEnX1LOg7Un3ZpZuJ/K49fBFHJGf8S5DChYqONTSOnlY
         hDJTmPwfUpw3ACmF0ztuB+ExZ/RpWxj5bwrELwNwuar3O2awYAYPCQ0LI8lVOl3fHJf5
         5mQAQRdX1uo+hbCNP0mJa0FCeRSbxo8TaVoCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548141; x=1756152941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLzqZRdyOLv8EDpzaUnt0Q4MFdVvX6ZyIG6yl0VPoqc=;
        b=YMd7jKyYz7DqfTjXPzZgsscS+wt33TcCSC6oKLh+csQKNcbHklXfrn1mNDjC+lO0S4
         2iiMINR6IYqgFUINZfhR/R0lmyhTRWydYeZ2c6RMmNyw1eLzqZLYe9avKDqMjDCDIKXz
         czOU9QVOg2uqFljJ/pzeaL1xrqEXPTP0WRIfqv6xd6ua7eGOUOVy2V/rLF2xrwfIT/qH
         UxAE/e0QHuudTIfu+Rf/cgiN8GihK3UxLTFDtyxRSoAL+2u9sPObiOYPSwT0wUM5ET1e
         BRFF2Z5nOTbuNjGbI0MOmYj2CVg8EsIgKrGWRqA2B4Hgud7FIEOURpbSsK/k1YMQmfsq
         D8/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqQiGygpb89nQv1XQI2x4aKkobIALb061Em03vNnDbf+j5Nv9AMkt+k+1eobh4dRgxstw1hUf6Qog=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxofH683mugKDr8anVtU4L5b7zMVWkPtXffM30Sumj9SnV+dt
	FC0m615fYPJqYjZNGVdKmEP8wi+xuBjr3AnCyuNXSy4FdL0CwzFG7fhYadOJs/U1Cw==
X-Gm-Gg: ASbGnct4mOlxDXS1onHUQFjWFn5wXKi7PGsIGV0p7qH4ysP9L0jmqV8HWnXXtbt2JHs
	ASqGbT10dCM0dsrh22jblZGuF2QIGOir1gldplBeRuBzMrdDci3fHLqZ4e8WLD9AZBRT/0m8gQ/
	eciiELGKLqdNzaiTC/93mU3VLESSqrspE3GdTk7bKMe5nvx4DoNbAPNWUC3GA3TfiUB3FSCukNh
	IQmLRC+ZJiDfi93x1bW1RycDp3pwnFr7rqb3+I5i1pJN7NntnLapbmxnv/m9G1HxifBcCtSmQ3I
	1TscPLqeZG/OXeXe3KNp4pbY7O+iLKyti+qu4y+AxOTr/iyT+goq+0xFGYAxStvJRle8AiS2S6U
	ChCjSfSxykJeMi9FFaA2E5d46uQKvgJdYiSWOi7Hq5v+5fvtL7tn1e46yn9pC/iT4EQsh5fKKPU
	s=
X-Google-Smtp-Source: AGHT+IHomcZrlLRv3tAqMDJkW/VO0hvBuw4jaQNof58elMwk6nl++cYJMU4IoI47742CxSR4XiYzsg==
X-Received: by 2002:a05:6512:2348:b0:55c:e752:e9c5 with SMTP id 2adb3069b0e04-55e007512d8mr55584e87.7.1755548141083;
        Mon, 18 Aug 2025 13:15:41 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3476sm1789268e87.107.2025.08.18.13.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:15:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Aug 2025 20:15:38 +0000
Subject: [PATCH 3/4] media: uvcvideo: Run uvc_ctrl_init_ctrl for all
 controls
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-uvc-iq-switch-v1-3-f7ea5e740ddd@chromium.org>
References: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
In-Reply-To: <20250818-uvc-iq-switch-v1-0-f7ea5e740ddd@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The function uvc_ctrl_init_ctrl() is called for every control for every
entity, but it exits early if the entity is a extension unit. The comment
claims that this is done to avoid querying XU controls during probe.

We only query a control if its entity GUIDs and index matches the
uvc_ctrls list. There are only controls for the following GUIDs:
UVC_GUID_UVC_PROCESSING, UVC_GUID_UVC_CAMERA and
UVC_GUID_EXT_GPIO_CONTROLLER.

In other words, XU controls will not be queried even without this
condition.

In future patches we want to add ChromeOS XU controls that need to the
initialized. We will make sure that all cameras with ChromeOS XU can
be queried at probe time.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index efe609d7087752cb2ef516eef0fce12acd13e747..ff975f96e1325532e2299047c07de5d1b9cf09db 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -3181,15 +3181,6 @@ static void uvc_ctrl_init_ctrl(struct uvc_video_chain *chain,
 {
 	unsigned int i;
 
-	/*
-	 * XU controls initialization requires querying the device for control
-	 * information. As some buggy UVC devices will crash when queried
-	 * repeatedly in a tight loop, delay XU controls initialization until
-	 * first use.
-	 */
-	if (UVC_ENTITY_TYPE(ctrl->entity) == UVC_VC_EXTENSION_UNIT)
-		return;
-
 	for (i = 0; i < ARRAY_SIZE(uvc_ctrls); ++i) {
 		const struct uvc_control_info *info = &uvc_ctrls[i];
 

-- 
2.51.0.rc1.167.g924127e9c0-goog


