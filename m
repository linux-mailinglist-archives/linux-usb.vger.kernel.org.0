Return-Path: <linux-usb+bounces-25551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D66AFBAD5
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 20:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB443B2AF7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 18:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A9C273810;
	Mon,  7 Jul 2025 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOAvDuOH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58100270ED2
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913247; cv=none; b=b9h+q5fjgTtE1eK/vSijRsk9PbbRlMlmcYhlIlPTbnQclysFRGlvIvgF5yl0K9NfyXsSwpFQ+DkrSdb1VrLL/p1Z7ULVaB8PsaaA97sUtVb8vIyqUTJDJksxijy3tqb/T918tMEDbCBt5WvRhlfz/XVO33iE9si3650O5IjqnXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913247; c=relaxed/simple;
	bh=YNGFFPC9zzW74qiewwqmxjg3sbDXhOxc1nuxGLMg4Jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ1Mk3+7HXrpBCZKDV//NZhqQZuyaHmOu8bBjqQ34DlNPgHDGSFf+aRyq19AKCKD0J3faRXHTCSRL/Rar/noGXnCAFIZRyZUQ4PPpkNZ1oOhQPvlIB3FBdPeVgE1yz0e4yVVCvu/Wz+E3rRPczd3V7jctTyMa/eqyWcInmZW1B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UOAvDuOH; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3680009e87.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751913243; x=1752518043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9os3lS8fH6kHGyK9R2m8uRATRzh2C1OPAQHL6vUS+6g=;
        b=UOAvDuOHTlTW3SP79K6ikfG58LdJjxXuhl/24IwvFx2i2XnQfL+7UU+PGEkw2T/bQ/
         uG9FWQswii2lSS3EiFXHzwzQRQkMKCiSSqhne63L5FbRxfyAkKyMoxBXjo8fvx9i7Ws0
         +ecvur4HaQGhoyfe2lNgGzozpZ2C5DkrY7ko4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751913243; x=1752518043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9os3lS8fH6kHGyK9R2m8uRATRzh2C1OPAQHL6vUS+6g=;
        b=LTz7+Z30A0eLE1OOSkDIGqM4/nv3z+BbQrO4shdLdyAdeijS4SqMrNV64nlzrdbj/g
         mMFypGjHFfGO6Kz6dm3AES09mA6T8SYT3VVe+yrsujn1SBIsgg0v5BW9nvo6eLppaG2N
         M/qa/Cx92Ou5UuOQaR9TxI/YuPLXl2CnETKIAbptjnXWzxXp0RwRvxqIPvRyJhowqHKO
         9DfSyIfMPHxNSHFYZJQn0CkZP5635PueuOSyrbG52tjCfFtkqK5hcPVqk89BaAFX+QCz
         45TnD4HSw2XuW6ueQfNJPrW58nqtePY4+SJjBJVxXxw6VArlTWCAnZrRke48hwl7d9QA
         7/IA==
X-Forwarded-Encrypted: i=1; AJvYcCUV4y0dgF8i4EFG1CusGRaZ88Adl0mCWbsWwLWrmTyIsDgWbJyq9qzGBA8iSfsoEBGCKQQQf8TPsDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk4JMBJwmrUgOBeOlkXOSuYYrXfbjqzaMpEvCzqFsZHmUQroNo
	SkkpW0CBjxHXdfRvKcUrDSmZkornOzcGWz2AfU+4hi8KgfIfbBQGY72IJahh9r8RUg==
X-Gm-Gg: ASbGncu8bT3QfOCdeGPIqn8fsREujgsiHdH9otB+WQlFJiklb1nXsYexPawSeE6mkSj
	3ogjOWy8zXx0OK0leq8yOvML+xRwrH1ms6oZFg9msDljTYerxAE5Nq50OqDdU4Mf6wwh9B+CuTK
	XJ6XXKCdsrZLqXyTNDfYTiK41AgR/z5SlQ1GfdfvmxMn8qoRr7ECG7tVcSLREgxYYTKOmgTtco0
	EbVXTF9Q8ccxs/JQucP8NPT85F/aFt7umCAAeZcPplQqzWZb/huNl4HuBnI8sgP97FzfPxg8hfI
	z7K1Ct+qQGjdcts+u8ou3tmcnwh67pzskVQtXuGdYGyARiZAW2a14Mr1DG6rByQ+MVWxFrh7Y3y
	yBoO32KgfbWQ0sfiJzWaQaqK6bOlL8+42fcmMrwlJfw==
X-Google-Smtp-Source: AGHT+IEo+zOt/AEi0FnK1sr6WXC8fbhAVvwDgLrxJE5f71HHIze0CaiIMj7O14ZqNlyCSg74rdmpIg==
X-Received: by 2002:a05:6512:3d06:b0:553:2884:5fb3 with SMTP id 2adb3069b0e04-557f75de7f0mr181222e87.12.1751913243387;
        Mon, 07 Jul 2025 11:34:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d31a6sm1417630e87.61.2025.07.07.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:34:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 07 Jul 2025 18:34:02 +0000
Subject: [PATCH v8 2/5] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-uvc-meta-v8-2-ed17f8b1218b@chromium.org>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
In-Reply-To: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..4c05e9e54683a2bf844ddf26f99d0d9713ef05de 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of this value, for V4L2_META_FMT_UVC the kernel will never
+        copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.50.0.727.gbf7dc18ff4-goog


