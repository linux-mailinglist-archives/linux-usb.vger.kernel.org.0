Return-Path: <linux-usb+bounces-30583-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1433CC66169
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 21:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8E22635FEA4
	for <lists+linux-usb@lfdr.de>; Mon, 17 Nov 2025 20:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81ABC33D6E3;
	Mon, 17 Nov 2025 20:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HYZxAWEg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D08E337690
	for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 20:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410466; cv=none; b=cEE8CIjb/2I52lrZUz1blf0nSkz1obPku+qbvHcAJo3qqA6g1VJWGryooNEwPHitoGKlRLCeAmgatytfrvvtu+Tr5Rmc/iyK8LTM1eWghOWjIpcq0XwGpTPkptBDRrVv8qIVfmsVBdabIAEHHmJ+rC3hlV9bfCixtYsLLRschOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410466; c=relaxed/simple;
	bh=lNuoYkLvd+eD46/OBdJpQ72e0YfFGIty3L9APEHHUsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuDg87MK8/S9820q8w8svcbNLijGG9Euc56n2qbm5SyG6KOn+htdCZqB+V3B99AN2AV9byP6bWRalr4XuKrAEFIGBF54z/ApBSsVDGesWXaPUnjA3xIFkKOAYGBIsMWBest3JhmC9BGZMLFWMT3VFh5HVZLwFI1LxRf7Sc4aSAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HYZxAWEg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5942bac322dso4461632e87.0
        for <linux-usb@vger.kernel.org>; Mon, 17 Nov 2025 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763410461; x=1764015261; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJ11MTmtpMbfLC31x15oun+LOtxDWcheLgXdGkh/tGo=;
        b=HYZxAWEgZ7WMoRNSOU9MWgT6li+Pi7wvVdaXS4PGcAS+AYoFG/qqIyMePAUyTzLdi+
         ZPQTch5BbsdjXMDLfqHQ9zWNzskw3+GFNWpx/otka1UwaLIdPT13fQ6R6PGk7cqp70SM
         0rgApnqQl6/c3LEAnK2jDXCSNWdrC65bPBm4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763410461; x=1764015261;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJ11MTmtpMbfLC31x15oun+LOtxDWcheLgXdGkh/tGo=;
        b=hakf+Q2dlgny9LffB7tKwiWNu5+AG/S3lR1HfGo1rDWz5tcFozH6b8kBUw1ta7qFEX
         +v/7/KdtJWKoY3mx3ESZ7QW5u/9xYdvtNwimCLsNg4aqFhlA9g8UbQgmxeMYxIUI+wfP
         EWPaYhd7yGsbo2muA3uHhYkj6oLXqV/hCgcXf8UpcX41vYoj1ZYyM1BWJWmAyoj0/nxH
         +sRGA/jaXh2+2O+fhujNu1cdcPmJIAJybc59WDtXXiAIkd4UTLJjvD7PN5ptYs3KSkEd
         KE58ZiauKRTSjOrrqc6LBirg4HPsRoyF6Q0iSx8Oz3gRltCceGcRHwDyPcmOmEjFHbQp
         g5xg==
X-Forwarded-Encrypted: i=1; AJvYcCUMUeSWz5EP3HCifVTI03aJmCLWfbQmRwPUqYOVpycW+9JmlZ+WANvkpVMnflG4ANOjT53Y66f0FC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyga/3FaEk3xNpCx8GMXpCLHtrNqJHdDoJMKT0B3GARYz5ewYN+
	HXACTTuGKolIyZ/fgTkbZjhgaDk1VBNpk5dZj4K4AxMwaiQHKbT+tAKKOxAufJJ6Zg==
X-Gm-Gg: ASbGnct6TwdjIfrbYhp8/aZlMs65I8V1fbyeS8b71mJubMKAX0BEy3swee4IgJc8bnH
	zybd1IQ7u9KmP+h0StYreVJp1F52lyMUWGDkLlb6RGs7l5uY6j3AcvjdLmjM+eZtt7fpDjMONfL
	D7LG20o0ruJvMhMncK4UXce4pRjxyExMey6o5Puia6HxGyXBlxjaZcOOL7IMtnxIN6oeBI1JKtK
	2Sa78rdvyAFfhdOynuyltlvaWIDEIxH1ISQBV0qNl509vKGBA5EVeuU+RN7bYo4V3ie+6uESB8e
	fkotvHTW9JggMhzeao8SDMMY56k9IH5HdRdf5D6XrZifst01odzmQpbmMMQxrAOMSzl264lwdde
	5F0xKtcx3bV+DlnPDzJQRfm1Wc/Ld3WgISVg/mrH2L1yVMihClz3Isuemf/rUlPlcwoSh809gpr
	d98QpJI94V3ZL64VZnXckxQk6B4bTYSpoqYHmpjuVKM18y8AvMYZZLaJNjclNFQPPbDRVSDiev
X-Google-Smtp-Source: AGHT+IH/Si6c/IRfGlQZcmYGRMYCiNBeXJ2Mujhyi1F02SW3SKnVbJIOPFSmJ7DPN02kVq+M9GRlLA==
X-Received: by 2002:a05:6512:131c:b0:594:5ec5:8fec with SMTP id 2adb3069b0e04-595841ff9f5mr3977626e87.28.1763410461174;
        Mon, 17 Nov 2025 12:14:21 -0800 (PST)
Received: from ribalda.c.googlers.com (80.38.88.34.bc.googleusercontent.com. [34.88.38.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm3413302e87.59.2025.11.17.12.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 12:14:20 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 17 Nov 2025 20:14:19 +0000
Subject: [PATCH 4/4] media: uvcvideo: Introduce allow_privacy_override
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-uvcdynctrl-v1-4-aed70eadf3d8@chromium.org>
References: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
In-Reply-To: <20251117-uvcdynctrl-v1-0-aed70eadf3d8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Some camera modules have XU controls that can configure the behaviour of
the privacy LED.

Block mapping of those controls, unless the module is configured with
a new parameter: allow_privacy_override.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c |  5 +++++
 drivers/media/usb/uvc/uvc_v4l2.c   | 32 ++++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 include/linux/usb/uvc.h            |  4 ++++
 4 files changed, 42 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 71563d8f4bcf581694ccd4b665ff52b629caa0b6..d50c501121e6f774dfd6cfdb859279e0860d06a5 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -35,6 +35,7 @@ unsigned int uvc_hw_timestamps_param;
 static unsigned int uvc_quirks_param = -1;
 unsigned int uvc_dbg_param;
 unsigned int uvc_timeout_param = UVC_CTRL_STREAMING_TIMEOUT;
+bool uvc_allow_privacy_override_param;
 
 static struct usb_driver uvc_driver;
 
@@ -2473,6 +2474,10 @@ module_param_named(trace, uvc_dbg_param, uint, 0644);
 MODULE_PARM_DESC(trace, "Trace level bitmask");
 module_param_named(timeout, uvc_timeout_param, uint, 0644);
 MODULE_PARM_DESC(timeout, "Streaming control requests timeout");
+module_param_named(allow_privacy_override, uvc_allow_privacy_override_param,
+		   bool, 0644);
+MODULE_PARM_DESC(allow_privacy_override,
+		 "Allow UVCIOC_CTRL_MAP ioctl map privacy related control");
 
 /* ------------------------------------------------------------------------
  * Driver initialization and cleanup
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 03c64b5698bf4331fed8437fa6e9c726a07450bd..e067b8f38500299fe6acc7e3b9770f7374748823 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -18,6 +18,7 @@
 #include <linux/mm.h>
 #include <linux/wait.h>
 #include <linux/atomic.h>
+#include <linux/usb/uvc.h>
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
@@ -121,6 +122,32 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
 /* ------------------------------------------------------------------------
  * UVC ioctls
  */
+
+static bool uvc_is_privacy_mapping(struct uvc_xu_control_mapping *xmap)
+{
+	struct mapping {
+		u8 entity[16];
+		u8 selector;
+	} privacy_mappings[] = {
+		{
+			.entity = UVC_GUID_LOGITECH_USER_HW_CONTROL_V1,
+			.selector = 1,
+		},
+		{
+			.entity = UVC_GUID_LOGITECH_PERIPHERAL,
+			.selector = 9,
+		},
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(privacy_mappings); i++)
+		if (!memcmp(xmap->entity, privacy_mappings[i].entity, 16) &&
+		    xmap->selector == privacy_mappings[i].selector)
+			return true;
+
+	return false;
+}
+
 static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 				 struct uvc_xu_control_mapping *xmap)
 {
@@ -133,6 +160,11 @@ static int uvc_ioctl_xu_ctrl_map(struct uvc_video_chain *chain,
 		return -EINVAL;
 	}
 
+	if (uvc_is_privacy_mapping(xmap) && !uvc_allow_privacy_override_param) {
+		pr_warn_once("uvcvideo: Privacy related controls can only be mapped if param allow_privacy_override is true\n");
+		return -EINVAL;
+	}
+
 	map = kzalloc(sizeof(*map), GFP_KERNEL);
 	if (map == NULL)
 		return -ENOMEM;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 9a86d7f1f6ea022dace87614030bf0fde0d260f0..1895e4fe45e9c0246b7f0613dd2bc51f60b78759 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -662,6 +662,7 @@ extern unsigned int uvc_clock_param;
 extern unsigned int uvc_dbg_param;
 extern unsigned int uvc_timeout_param;
 extern unsigned int uvc_hw_timestamps_param;
+extern bool uvc_allow_privacy_override_param;
 
 #define uvc_dbg(_dev, flag, fmt, ...)					\
 do {									\
diff --git a/include/linux/usb/uvc.h b/include/linux/usb/uvc.h
index b939a01da11466747249c64c72a3ea40cd364a59..f2d6cf52427ce9c0a62a80ca3629c6e350fa02c8 100644
--- a/include/linux/usb/uvc.h
+++ b/include/linux/usb/uvc.h
@@ -41,6 +41,10 @@
 #define UVC_GUID_LOGITECH_PERIPHERAL \
 	{0x21, 0x2d, 0xe5, 0xff, 0x30, 0x80, 0x2c, 0x4e, \
 	 0x82, 0xd9, 0xf5, 0x87, 0xd0, 0x05, 0x40, 0xbd }
+#define UVC_GUID_LOGITECH_USER_HW_CONTROL_V1 \
+	{0x82, 0x06, 0x61, 0x63, 0x70, 0x50, 0xab, 0x49, \
+	 0xb8, 0xcc, 0xb3, 0x85, 0x5e, 0x8d, 0x22, 0x1f }
+
 
 /* https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#222-extension-unit-controls */
 #define UVC_MSXU_CONTROL_FOCUS			0x01

-- 
2.52.0.rc1.455.g30608eb744-goog


