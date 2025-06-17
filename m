Return-Path: <linux-usb+bounces-24836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C358ADD049
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 16:45:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1210A189E679
	for <lists+linux-usb@lfdr.de>; Tue, 17 Jun 2025 14:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A3662E4241;
	Tue, 17 Jun 2025 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qiveonxq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E360920B808
	for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171358; cv=none; b=guA7iItK/KvLXbEKqWDUDDfbvLw7E45HYZAXLbP0M6InmPOHY6i80x3v/VEzU/oby1ufSyoxX6cbzu1zcEPQzN/vyartZan/Sqcbm3drQDVZx/jtyeEK4+Z9THC013LaFKezrKFnxcGOjNfJyeyKtyE7LnZ64gpN1LNSMurGg94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171358; c=relaxed/simple;
	bh=bYdXHZgcVr0efBjTgUPsB8+QuqvjW8HoLU5Tp9AdihQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Is5kzsPu48uJuftoHtmcW+Gi3Y3A0mYq+aslx0Ttde8aFslO8g9RT/H0keueiPJFZhUsy5OgEnuP5D39KAZ0JVQSGVLpqvuKLH7FzBRddeugR0KUn300Cxw9PwanqG5CgaYjvvioHKsh63sbvNXXDO6ZxtycUo5yDBfSrJDUouQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qiveonxq; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5535652f42cso5780785e87.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Jun 2025 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750171354; x=1750776154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xlu3CSgyiphpvjrJ4zGRNfneVAXEwqkV8GfJcaFYtI=;
        b=QiveonxqdrRLMX9k4hobfSqIumO2vT6j/GmEvWxTx9mJCiZGY4CDiZlDhv6YMnEouM
         VJiT87HOS9rKUxmS/K3jVARBolteplWl6TwKAD8ODbeonvL1qQ9SSLgLbXBphTFS8Cs4
         hDCeus9kg9AFCpJXqkvrOcmdNIU1yRSmW4RNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171354; x=1750776154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xlu3CSgyiphpvjrJ4zGRNfneVAXEwqkV8GfJcaFYtI=;
        b=EYrmX2lSp02G0NkgkgsP/MBnv4qfGRPv/eYQH1gxR6pcs2Nyc+IN9mzYghcM+3QiYQ
         k4Xls6td0F0VIOO0lEkDJyYZcaaYa+yJCDcp1YuE0OtDtCG9rtHB39NkwRqtmn1ltWSE
         MRNK2oaSoOd2TmKsXGUQeRCO62SniTTKOvIkkWd+/BZ7cFneyiDOXMW+s7/FLts4jjcC
         uQFAtaoRudmKl3Pp6MfFjCpVe5H9mF0JZ5WJ5qcS/SO7t9lAzi31cB8ahmGmq64ByVwI
         uPVB/LYpOk1LQ1vfiq4fvLSmNl+RESWdMvI4NtGzKozmD2jN59daem4OuvYn+zaEnfYX
         d+7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxYGYmtLs0Oe4KBrYB1VWz7Zq+ih6s50Pk9w+6KC6cTT+NQuRS0bBvqSIkF4Y6yE2CO+3jhXkAG+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0aLs25d7OMcktPxQa02EhmuyYRPj9Ep1QagwdcYeGiAmpahuw
	3Pb8gU/wM0avfBtkpM0CbKSsJkm+pc/vZ6DMTS9k+gduKAkG+QG+6G8n4IMtv6w8EA==
X-Gm-Gg: ASbGncsieZ2T3CeoNWmR9OWlpAgjSbSkXNmxga2DJEF1OI9diGmbdx1PKizivkWYwXf
	s3dWanR31CvTNGzQof9dbGbdHk7v/3NcSQ0xm5z1rN/pKRcv7+VnxVPdWSJ2Y47ZKezBJxzj6hI
	WqmolxxEQpY+kZftp+1nhPHg/0IGWNj6TiX5TmYCcpdHRt4ANWB0j8qBDmXH2YTVOXgCOuvPJ8s
	6jGvro6Lpw+qzhvi1kPbaw/95m7e9OOv6UN35ITAPzDh9ivoGx1NoyQMxD+csO35gUdbnoBtfnJ
	UmSY0cBLTUPRTjUWGIQNMwNE9fHRKaLqhpR+oSFYO16kY0LNgDoCzdn6HO5cWVo1N+KEsOpvMl6
	+GycDLoEgzjthU28H3/NGSWJOP/qW7QqLLt3Amt558Q==
X-Google-Smtp-Source: AGHT+IHSNhO5TwkGdfM9rWVrhKnKMpikCyF46rs9ZtD7y07NlXl7lvAuPvpPwbsqhlOXn7g3p/KjdQ==
X-Received: by 2002:a05:6512:3e0d:b0:553:a8bb:7472 with SMTP id 2adb3069b0e04-553b6e8c40amr3461768e87.15.1750171353679;
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ae234437sm1814992e87.53.2025.06.17.07.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:33 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Jun 2025 14:42:23 +0000
Subject: [PATCH v7 2/5] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-uvc-meta-v7-2-9c50623e2286@chromium.org>
References: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
In-Reply-To: <20250617-uvc-meta-v7-0-9c50623e2286@chromium.org>
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
2.50.0.rc2.692.g299adb8693-goog


