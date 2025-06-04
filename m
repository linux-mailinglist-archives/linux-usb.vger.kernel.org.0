Return-Path: <linux-usb+bounces-24494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6ABACDDA8
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 14:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07EA93A5FAB
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 12:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C994528F925;
	Wed,  4 Jun 2025 12:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vwhzcscz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644FC28EA51
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 12:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749039369; cv=none; b=P7HFQ+5tnX0aKGGX84geZLr2hOuJ0fVuwSEh9RI2j3uX6gVzzR1hutXYn/NGPxAuqLLgseLKsT26RJdtXjtphrrq51Ch7MsVqMM5kEjkGQd7DlqbMAsy4VTDmUZNQ7R6LhV+IOCbErqR44OseCVM4+zjjvPgs02tdwi2hyXde2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749039369; c=relaxed/simple;
	bh=R9poar0IHwcvjb7X94DIxPbqfZnQbM35tbbAXoVZYLU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6H4Dxix4xEiLxR+ZG2tdh8hvkRHz6+EgRzXR6axVg/ljZ4AfABCqc7+P6r7MNgiJfuCDEoywqxf0HoFIKEp5LayrUqCn5NIa9epaNAaccUi/AyqVXR2Cr7C1JoNc13PWGjUEVNVu4/coC63eaJSb+vwxkfbnWmxLQ9c3Kej95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vwhzcscz; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so8940958e87.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Jun 2025 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749039365; x=1749644165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U65dM4LWKHoC7xW4BA72z8M8lPtxis+hazmUzV/TgxQ=;
        b=VwhzcscznEi8l5eb9HAbb9nZZHVFk4PLxSHZ9FRj2276NlAmZm2eh+1kin53N0wQWR
         ofixgFEZeSMUls7eB/6jRB8duaVLT5hQM3ZKM928w8WCmzuQdS6sePdC1FmULqA7c5km
         ZluFNFVRGJCc1wD4rx4vDV6a54n+6VY096nuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749039365; x=1749644165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U65dM4LWKHoC7xW4BA72z8M8lPtxis+hazmUzV/TgxQ=;
        b=Gtb0XRHOot8BCtdX0dsOuAs20R0gIhoAZU3Nsv+I/xm8JGN8Vy12P8tBJNlEfog6M8
         Ffi1si7EA4N06uzvtSYhWWkpBobYG/isZx3GRtZApTJ0v2+DjmJXAOWrEHjP1sHWM4bD
         tU384m9lWQltQDNPx5lSCEloUHj/xSL+BW5uv+uC5JtnSPtZJfu74SJ7LCXNv/HOtVw3
         aZ6xBXqHg6T82n+pHBFz606jMi0tnzEEWHeqeamVR/uh4ovplNlx+HdFWaAEl/EcjXA5
         8qkwIZGtsTHbKaLwNlVK4iuPHt6h2/2MOyZsQUtft+szBoLF8PI/uvT4jbKs1ocMOA22
         hSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg66Zc292T2034L7APPDINqtsdVm1RTofLsJCqtZAgk/TsFqWAs7YGPE/ew4P3gXyQ4R5IAZWmwsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YztD0gM2M3KWsgdHi4z2+bkjA3vefPIRiimHFymnuUBZ8aemnMB
	fytPZ4A2vD4EDdcpoTRTjIcfzLsPQl2VrvN7vEO6j8oQSt6Gygb8fAVyVNbjcg4jXg==
X-Gm-Gg: ASbGnctzcH8dybUj8vsOeFeNEW0Pf/CVG/cCXjO/0Phqt11F5KoErgHT55kAz5S3DlR
	8tKNhBEznoKGySXZQTdc6lx74qixCivcM5qyFvC/aeulh2/L099qpsNz2og+NJCCK3vFzhol6a4
	9Z18V6GfoTaPJeciJ/Vkgn6VV1HDTEyzGTyRDbyjBXJEzCLG6e10Bm6SAQgMLIPPEUxTOFLbVyE
	PZomVqjq0xdQu4ZTdeCwercX7oqCv4TdJ5uEjSaaZ5lTIStMvWAXk+omn6QZakOJ0IkptyM1+BE
	TJdPang5dGip+0gR9s/b3GjEEgP8H+6XgJJqJCnKsQ2QpvIWeSYBwjQFuyoqNRs1siXonLCwYoU
	uuLgLQgGGD0WB4/sWKMZTO/skEF5KHiIJRtMN
X-Google-Smtp-Source: AGHT+IGBrBRDYdNS9IdYcZYK7RO2DqQLHlV/qfBzNERuIj/o5XcOQ3QVU/1bYU8eKuGEsinUybydhQ==
X-Received: by 2002:a05:6512:3d9e:b0:553:2e42:fffb with SMTP id 2adb3069b0e04-55356bfb72cmr664186e87.33.1749039365318;
        Wed, 04 Jun 2025 05:16:05 -0700 (PDT)
Received: from ribalda.c.googlers.com (90.52.88.34.bc.googleusercontent.com. [34.88.52.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a12ecsm2289134e87.90.2025.06.04.05.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 05:16:04 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 04 Jun 2025 12:16:03 +0000
Subject: [PATCH v6 2/4] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-uvc-meta-v6-2-7141d48c322c@chromium.org>
References: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
In-Reply-To: <20250604-uvc-meta-v6-0-7141d48c322c@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>, 
 Hans de Goede <hansg@kernel.org>
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
2.50.0.rc0.604.gd4ff7b7c86-goog


