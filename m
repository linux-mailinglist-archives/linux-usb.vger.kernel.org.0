Return-Path: <linux-usb+bounces-28702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5DDBA3CFA
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 15:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4021A6231EC
	for <lists+linux-usb@lfdr.de>; Fri, 26 Sep 2025 13:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F341E2FE584;
	Fri, 26 Sep 2025 13:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mSIAMbl3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D324A049
	for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758892301; cv=none; b=S+3/LWpr9gXKTmCcS/81v7bWT2rdmI5/sXVM2KanIfYw5vwLY/gJYAxMfEJGl2LlXZbrL+d18zQMhiLsepaU71JtTUlmWXKI3ZQz5rVbV8Swqp5F8Eb6cde8CuEVUCy9vV8NjzOWv2ytiHBxx1KxaJ8TxHH5EW74ExHEeFu6uJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758892301; c=relaxed/simple;
	bh=K3KdMz7C2S+sjjhpcJ2VrrH58ALa5ic8heuJ7M4ymXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXZF6WbeMsGtjTj1ntD8x81PkhWVIxL3cJL2lGl15zLPU6vGB8qqfCgMEgYe8jv/SdqGLt+WPe+oEht9j/guv8ATvm9ZBhuPqNoLlgNsKpCUiBv+k2722IWN8XUao5rDHnzXANvkgcgWEb7EMjHfyW4R8pnld7FuGhVZkRTvbjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mSIAMbl3; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57f0aa38aadso2716132e87.2
        for <linux-usb@vger.kernel.org>; Fri, 26 Sep 2025 06:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758892295; x=1759497095; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yK5cgdjGWBYF8FS7tGEMMwrGVxWyiTSoe6v1uuSmXRU=;
        b=mSIAMbl3eTr+7VxRl3P0MNZWVUQCXmyAjlkt5xOkpMbeNLAm9uAl2J4pO453MmOiyC
         eR5BMfA+XUNGxAiTsSzXwXqHSZzFU9i+OYryqN1Jl1ZL6RtN9qcT+nxc2ooHY/hse2s3
         ulTqMpeG3GcGMWldTAcmsbyQxrV4t+Q/9ig48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758892295; x=1759497095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yK5cgdjGWBYF8FS7tGEMMwrGVxWyiTSoe6v1uuSmXRU=;
        b=ImJ0J0GXMgaBR32YQGxoSp8WVS4CtFIMurMMxOWiGeWGJ33AOhEdXcgR2PLQ+lY/jp
         lgeDnU6X8c6p8t8nLvZ0TmJxUhExV9Dh1b6946Ac03yf9tqNUqXqQew7P/gQ5BPCdZFB
         UaXSy1J6pXYuJvjWDOv3ddZvBPOaSa2F5yxHPCACDDbwKLLgfWFef9l/GP4A0GU5JJ/R
         YB5gciehpo7s/5+wrF9AsedRNBuPt9tua4gdR6vTDGUe5ulYgvxIGuX16KmKMW02B/MJ
         2tB5PaKzdt00/c8CQqAyvZ9WbJHxzm/Z/O6v5BzD64oPNoD3RSJIwzYr6m2QZq4cpOMt
         TZrw==
X-Forwarded-Encrypted: i=1; AJvYcCW8iKLAVNTkLG3NsV9qDrCi0JbhR6N0pgPpMg6GsqX2IWG5rHslxrgYJi2tuicNXB7v0GkC0XvGufs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKvLMMe+mHacGpDQP+scKwkeTJmHma5cxd0PJZLdJF6xOBTB/g
	Js9Ir88fGcHPpC7VK7EcAUPfdjbCbzaB/+wrzbwdzI8ZLWSt+boqLk3WrHIh8CwWxQ==
X-Gm-Gg: ASbGnctsKrzrFtjYksQBm/s6js8YsoLDfLKn1fKUSCGEiHranYWkBmw6LsQf+2uIkg4
	V2GR7KeKVrAypnL5BsT8UCkA1ByntSPrI42zZPifKUNYvEZNznREiyUvSJFtPXgEqXnULxuvttc
	QWz6XlLy2ZK98Q46edxzT9dwkYrfCi36ND0B0Y4m6MY7Z/3M+20W8OaoXABEGeWPNNmv/QLLo5q
	jIVQzZ/E1kLwxqY41O+raISkEil1pAn7AaXnY3tl3BTSZJaxLTEvGdQwApIlAW1WVn7UAyvVFie
	54u5trjelreiRHwvhuZV6Pm8gFq0GE5eSErJxpV5LzKah9h+Tz+OCLs4euNeKckuDnU/fRixMEA
	xC8K/WHVPrxfsbBweo3RKxtOqoEo/5qYGcprwkm96a0Nj+oK1auSy5ObzCRx19bIpJB+if1bOMG
	sRMid/jnUAVtY8
X-Google-Smtp-Source: AGHT+IGFsjXQDMDVCJ1rn/evMz3fd3PTtDOlV/BZM7pcfvKWARbqj04ku2ig/REcBSICwb5/1B/aQQ==
X-Received: by 2002:a05:6512:23a8:b0:57b:3600:8b4b with SMTP id 2adb3069b0e04-582d092964emr2268576e87.7.1758892295046;
        Fri, 26 Sep 2025 06:11:35 -0700 (PDT)
Received: from ribalda.c.googlers.com (64.153.228.35.bc.googleusercontent.com. [35.228.153.64])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58527c6b014sm123872e87.43.2025.09.26.06.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 06:11:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Sep 2025 13:11:33 +0000
Subject: [PATCH v3 09/12] media: uvcvideo: Fill ctrl->info.selector earlier
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-uvc-orientation-v3-9-6dc2fa5b4220@chromium.org>
References: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
In-Reply-To: <20250926-uvc-orientation-v3-0-6dc2fa5b4220@chromium.org>
To: Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

This is a preparation patch. A future helper will remove the selector
argument and use the information embedded in the uvc_control structure.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index aa9de84de9236540c46ee78fb8458873d503786e..98e454fcdeb2ee36d334068fd750e6203931699d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -2720,7 +2720,8 @@ static void uvc_ctrl_fixup_xu_info(struct uvc_device *dev,
  * Query control information (size and flags) for XU controls.
  */
 static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
-	const struct uvc_control *ctrl, struct uvc_control_info *info)
+				 struct uvc_control *ctrl,
+				 struct uvc_control_info *info)
 {
 	u8 *data;
 	int ret;
@@ -2733,6 +2734,9 @@ static int uvc_ctrl_fill_xu_info(struct uvc_device *dev,
 	info->index = ctrl->index;
 	info->selector = ctrl->index + 1;
 
+	/* We need to fill info.selector to get the flags and the length. */
+	ctrl->info.selector = info->selector;
+
 	/* Query and verify the control length (GET_LEN) */
 	ret = uvc_query_ctrl(dev, UVC_GET_LEN, ctrl->entity->id, dev->intfnum,
 			     info->selector, data, 2);

-- 
2.51.0.536.g15c5d4f767-goog


