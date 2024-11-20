Return-Path: <linux-usb+bounces-17734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 256B79D3316
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 06:13:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFC521F23E38
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2024 05:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355B415625A;
	Wed, 20 Nov 2024 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBLkx6x4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69872804
	for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2024 05:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732079625; cv=none; b=Vum/SennADTl5WtQ2Qr7d3iL5IgiCPW8Is6EZhqeUgUrchO+7XmEFDTzWS2n1Qew2mLlcKOtsuAmczubSvvKbgTko0MD9M+SGDkT6DzbVnsGY6cMPqak2bnLflpcy3LygsIsWRPOgcQ0fzw0lk1O4IxJG/21IH0d+YhDgGeFnog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732079625; c=relaxed/simple;
	bh=pQ0mF+XVM33y12BXRE/Rs3oFHRWIMevcy+QuDWaheeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=epMtTKBOfSNSykksOz62nsHryNmn2dY4iGMy/+eGlknXzf8ClC1109mcRRHkLSd3K6IG2orxe4m+qH1d35Cr4qhFBsfbg+1AJarot2ic/hV+TevhpwF5Ivunqz5al5HGOtctU4Z0BiqwkM2rCXdwcOVygWmynmKaB2NAgen4nSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBLkx6x4; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso2722050b3a.3;
        Tue, 19 Nov 2024 21:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732079624; x=1732684424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LUH4KdScgsjmFmbRDrS0zdqSc2JKBowoMu0NRHLc3Zw=;
        b=MBLkx6x4nJcbthnKS2oh2D6LwyMN3lmjhoYbogcjRmpYwclnieCozZ93r4ATB1WyYd
         koQKsdbH+jA8zg04ZBvyaHIGYAOpxqP7vDyxcVZPKW/Vg1puMAJC4874uM5UGsv9RVr8
         4WjPcDHPiVZCn6AB1CtA+QBErE7ZqNEO6iZOMjU3tqYPDjs1TuKBLmF3dGenhXcK8WC/
         3pZPoiGJm6614s8iVEQdPaa6DLv6MYfVopmoHES48w5efkguIXeg9agAhnEyF/XPHUhe
         VndKelNm97JlriAubcm6BCJ40tNPSvVwWDQMZCWLLYuaH+JgNkjoP/4LPH/xtmrVEihn
         HHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732079624; x=1732684424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUH4KdScgsjmFmbRDrS0zdqSc2JKBowoMu0NRHLc3Zw=;
        b=wVno1cQw9rzbcnALSMSBLtcFP7i3aQefbNHJxcASBWWWgAB1Ze/untpfGiLPvmGPXu
         N0q/m4zHOd4Sd+q9zcQSvAfKKAxjDuYc4fmFRHXI3JWTYKHiHGsOo0dtGgrly1qkxxR3
         /GWGo8aP0lfM/k3OGPn4Mr26Ie5NPOSXWSeMaoGwR+O9m/Ljr1LtxpS4Xnzq0OwRNsgT
         3fdZIWCBWmoGpYTHB9McH2eiZ7vz5VLKd536zg8qkAgUUA1GbxbGOLUVZCE5eEDujGuH
         V1VpUi+AhEp+AA4Cl2vfrjUE/qipDK6Xk4MQNDmNplI5y5P0zXl5H5NutiNcB1JZsJBR
         qxgA==
X-Forwarded-Encrypted: i=1; AJvYcCVY/RgxF63g2uq56J3WgedcIuID9B9ga/BrO9Im8aCTpLsYhGE8hoRIvmbZynMeYsSAI4S6CRO3dCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmY6UZVzIlaEVJnTOiWOZGdStoQXbABpIIgNvFRHm4LxPbIhr
	mVZu1WKxo7XvzPMvHkUzhV9MwAV/4o9eJR5grd5aEneIbCICpC7g9QsugdMB
X-Google-Smtp-Source: AGHT+IEl+VpKz8EVPIybnRK37MhHzmnlos/eNVdJTfXWigPxyKAgKs7VQAsiFC3IYrdQHO822k2psA==
X-Received: by 2002:a05:6a00:188c:b0:71e:21c:bf1b with SMTP id d2e1a72fcca58-724becb9409mr1902235b3a.14.1732079623452;
        Tue, 19 Nov 2024 21:13:43 -0800 (PST)
Received: from sanan.sanan ([117.221.188.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724befac404sm654397b3a.148.2024.11.19.21.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 21:13:43 -0800 (PST)
From: amilsananak <amilsananak@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mailing-list-name@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	dan.scally@ideasonboard.com,
	linux-usb@vger.kernel.org,
	amilsanan <amilsananak@gmail.com>
Subject: [PATCH] add a device in uvc_driver
Date: Wed, 20 Nov 2024 10:43:27 +0530
Message-ID: <20241120051328.7613-1-amilsananak@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: amilsanan <amilsananak@gmail.com>

Signed-off-by: amilsanan <amilsananak@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index f0febdc08..1a3229ab6 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2441,6 +2441,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .driver_info		= (kernel_ulong_t)&(const struct uvc_device_info){
 		.uvc_version = 0x010a,
 	  } },
+	  { .match_flags 	= USB_DEVICE_ID_MATCH_DEVICE
+			| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor = 0x0408,
+	  .idProduct = 0x4033,
+	  .bInterfaceClass = USB_CLASS_VIDEO,
+	  .bInterfaceSubClass = 1,
+	  .bInterfaceProtocol =	UVC_PC_PROTOCOL_15,
+	  .driver_info = (kernel_ulong_t) &(const struct uvc_device_info ) 
+		{.uvc_version = 0x010a, } },
 	/* LogiLink Wireless Webcam */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
-- 
2.43.0


