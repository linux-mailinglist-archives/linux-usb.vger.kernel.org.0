Return-Path: <linux-usb+bounces-26994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBB4B2B230
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 22:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD0411B6606D
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 20:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB6124886A;
	Mon, 18 Aug 2025 20:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S9zSFeoo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7531FAC4E
	for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 20:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548143; cv=none; b=Q8DO8rhNpIXy2/Aytv4BCT6sVkcQeu9Yym86wkGdx5T7JVxf/yn6y1pJgJMsW0/5NVMq6kS3e7y9kaWMNHhEmukwMBOksMCEkxw5aLxnyzNLEsRI4Iiq6zxPnzqw19BifiXKYntb2X11xy1JleYeJIbUoXciwB0ifAXGIy8jCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548143; c=relaxed/simple;
	bh=CaUrB4UP/dAbYK1r25EfF08W4CEvtMBYfIS5kCBy6PI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s/I0b+T4LxbCLaTgoTH71M+H9gqJ9oZceGDNuhntsDweHaMq+Pk6ggFfWm+TMLpA7aFlR6qyj0Boa23EQL/dKfIscFMYue5JQI3HUSHynDY5Ug+E3A7fadnEgxColxd+GSV/poueIp5xnaYDYQ63+MDSY5s5QcRkhgx6YMAqrmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=S9zSFeoo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55ce528a0f5so4591983e87.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Aug 2025 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548140; x=1756152940; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7ecUUREqZxH3NQXkzrG8AHXGf+HApsHSTGrw6/8F50=;
        b=S9zSFeoogljdQWelQcjANXDsyyY+48RiE+TLPqFb6qREMI9JHz/jkC29faZnEaVmVI
         KmSk5e8eJWxNfYtI7Cn2T3AzKLvRSO3G/d1Yb2kVkeQ3XdlCBc7yFvto6n0W8qeYRVwl
         e1BaZeQCT3zPFPGPFa5n+p3FMbOyWgj2lL8Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548140; x=1756152940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7ecUUREqZxH3NQXkzrG8AHXGf+HApsHSTGrw6/8F50=;
        b=vwvMWE43WWAasBETWq+9CAW8/U7uN/pmQRA6RnJXBgXtsg2tT96UBBt8JRd4Gd15JP
         w1Z6ed9fyzkxa948LuGbTWqAkG/ojC8wmRyAGWmIY27P48Nv/0VSolldD0EmaOolvYKW
         Fh+EgCTlde/qdAMxXMXowjsVUy1OkCBVglGDkJdAGasBftOmyrrMENzV+Y3wujO9xDRG
         OGMbb1kGRgopa7wZxdMlDRys9/nBveqHgAZiFqK1pMOAs7G9aKjvH7x9dzJSDi2Zp/uH
         1PXaIyOEBbA3c+HeRl3IOoa5N2rQ10JVoL8C/sNuC3V+FRnccxJZSTIrxSOdnpgmloxJ
         Awfw==
X-Forwarded-Encrypted: i=1; AJvYcCWRaGi3ISUAG58YJ2TmBdn1BUS4WtPOdtoyI92wC1qHcRa4fLCn3eJ5Rh1KeSmlJppI6if73nvmNhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTes7CydIL2A5lG3OI8NaIvzjJsmxH84TXlL4kidqZcuz5YnvU
	wYR+VMz+nTX3SUiX/SGfyBXmjo+jBFWauc0I2mzDEhfqGRdSd6cobbR40E12g2iTLA==
X-Gm-Gg: ASbGncvY6/rm0PZIL3RqBWFsKvANThE2Ync8bl4skV6HyJDYGwjzMOHhjBPG4udjREp
	VP2fOVnOfrCflHDWHO6bVygJk+8Ha66HKTjhjFMA0ThSSKYt233QOsR9iokJ5uPMX057shvclVW
	H8N2h71CYFIly8vImr60/TmEC60znyMRGI4RFPKOdB0ztTWIY9YBwwfd/C8//OFhEO3Ldb3DI1a
	Kq4ns64fqBp1SSN/sgy5bxCAy/MXluiGIX8gJNU/zixA6Cl3HPvssTCSmfa+HZeTxA+o5u817lE
	hiMycL7BBzbkxvBPVp+77OfVhN9GEBl7D+MOFKXGRaAv8A1N7ZATjD2E7KaSB65e/t6N1Ycmgeu
	erBBXb1GRie04LnOcmXCSh+8Zq3xrNUyv2gR7MtXNt5QW8bR4wdz87Vzctujh6BOyTLUVn6YKPx
	k=
X-Google-Smtp-Source: AGHT+IFb9FqH/R1wchdlDtJrBvhxMgTs/qFlhYR9eOTJJ/bU3X+4wqPPopUwbCGpty45TkWd2J9jvQ==
X-Received: by 2002:a05:6512:3b13:b0:55b:9045:ec5e with SMTP id 2adb3069b0e04-55e007651f0mr50179e87.18.1755548139615;
        Mon, 18 Aug 2025 13:15:39 -0700 (PDT)
Received: from ribalda.c.googlers.com (237.65.88.34.bc.googleusercontent.com. [34.88.65.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f3476sm1789268e87.107.2025.08.18.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 13:15:39 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 18 Aug 2025 20:15:36 +0000
Subject: [PATCH 1/4] media: uvcvideo: Fix comments in uvc_meta_detect_msxu
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-uvc-iq-switch-v1-1-f7ea5e740ddd@chromium.org>
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

The comments can be more precise. Let's fix them.

Fixes: 6cb786f040ad ("media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META")
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Link: https://lore.kernel.org/r/20250716-uvc-meta-followup-v2-1-d3c2b995af3d@chromium.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/usb/uvc/uvc_metadata.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 3b0b392895119bb6ac300fc40b89a7ea00e56b40..b0960f0553cfcb30b0036d2ad8877fafa225c6a4 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -196,7 +196,10 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	if (!data)
 		return -ENOMEM;
 
-	/* Check if the metadata is already enabled. */
+	/*
+	 * Check if the metadata is already enabled, or if the device always
+	 * returns metadata.
+	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret)
@@ -208,9 +211,11 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	}
 
 	/*
-	 * We have seen devices that require 1 to enable the metadata, others
-	 * requiring a value != 1 and others requiring a value >1. Luckily for
-	 * us, the value from GET_MAX seems to work all the time.
+	 * Set the value of MSXU_CONTROL_METADATA to the value reported by
+	 * GET_MAX to enable production of MSXU metadata. The GET_MAX request
+	 * reports the maximum size of the metadata, if its value is 0 then MSXU
+	 * metadata is not supported. For more information, see
+	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control
 	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));

-- 
2.51.0.rc1.167.g924127e9c0-goog


