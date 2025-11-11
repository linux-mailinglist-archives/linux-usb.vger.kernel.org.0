Return-Path: <linux-usb+bounces-30386-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4762C4C279
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 08:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93ED44ED281
	for <lists+linux-usb@lfdr.de>; Tue, 11 Nov 2025 07:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50993332ECC;
	Tue, 11 Nov 2025 07:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8o45t4R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C448313E15
	for <linux-usb@vger.kernel.org>; Tue, 11 Nov 2025 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762847025; cv=none; b=anMuI7roGVBwn1WeG79wfvOCFdXG1juPeoENhERNOQJo0Hpkz315e6WPs5vYxe0FWq+l1hz1STAIYSEBbIijyhnRc2m7rD3zbxVg1cHwXkywGph/fHX/SI9ce1vaIrg1ZauJBlungRG3hpGVPFBFeuwxsVED6XE0YV6vZITAPtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762847025; c=relaxed/simple;
	bh=hGu+GzN+iPOCwdycByBZkRXiL6hZVXSrjCx1H7RoOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Efh+1mPmCiY5F1uhqPkWBZ1pSV7J40aeEpLItRW7bhvvCJ+1W9G/s2ukKqsxL2GuDZfUsjdBF3EYuCa9m9bRw17M1Q6Xo/4MtQ5QB/4r2zcZTwYMLPDH3SeXp8TvgydiKBDULMYqmPfnCHblSl1TwSDPu/zexr38lIAu6YJVtsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8o45t4R; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1888961b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 23:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762847024; x=1763451824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCLsaMhIhuFhIpbv/6Ugxb6YPVSoVgU518WhOc0TN0M=;
        b=C8o45t4R8X/j3JVDvFIsTsCerU3/X997xy1pjZXWPfu+qhbjyoi+uYFGbY5J2BMDMi
         ydanYgqPchkwRp1O9b6Oc5Q95NlgIImmZ567NsxU7Rgd1EmkFAmmeFCsqSjWwhufL1nn
         d7XGKhyQKljcU5eOF2fF5Tyai8GdlAntFDX3pGXuoNK5OcRYY7dzHAO8AcERH+GX9Gfq
         1tD9gt7kZgFwNlEak+sI8dEllto5hVBCrU5r7opAwJl3y2Uh4N5zQxRSWZNbumNFQwRn
         UyAltlOn5LSrzwJbFh9totjIJSZkWhnogK4dkMeROSt0EMc8cSA3dvSZImz0KgFhfyBA
         QRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762847024; x=1763451824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCLsaMhIhuFhIpbv/6Ugxb6YPVSoVgU518WhOc0TN0M=;
        b=Fs9KIcWABq/uhKTpqpgfP+V5odiNLa48IuE4QD4T3GN9W3YAx1E1fprr4EWxi/yEmk
         TEzpp3Hd2qGljbhM3YEZq5kcQialn5RBFDHj/FeVkcOnO46qhLkgzUlWwACGW4duLSzz
         9wVj8poj2bF2yItzIbq1SRZYQyhpF8UwKdjnFRmsR1NTiSSj4ufhy5AK0brU+vOdA/KV
         D6/cjElcXjs5n2bfJj/5i4Yb3kk2bO9WBR8qr1QNA4ItYmiQROrqNm4tpQNAVC3r86sU
         KX/YE6oxneoechsy0dHo44G8QOM+I1Vn9ZmSzx7qHdzEgHBH5UJeujKUZ4sWhkXZib8k
         3Frg==
X-Forwarded-Encrypted: i=1; AJvYcCVZDZasvmgQWGF6VjpksVK1XHy3zZ+j5NIedcY59m39SwmoqWNBwPnAxRXfStCuOIt4ZmhX7HBuChs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZeNHN/aeq1xfvCwQ3MGgYSUKNkIRPHtlbb6MYH62x+xQ5ObUB
	FC4bwJPLGU0IdlEqhLC8PeR2X1nyzOIJghoGLFMoeCgZlaGx4kjkabLg
X-Gm-Gg: ASbGncspgWTi7GznxUWV6tSPephkO7kSrqllyE9PU++h+gTut7rn9EnIfGHBdAW3zwu
	UIA0kyKqwodeAhYSDNFtcVvJdGPu3rGiTMhwhGYCGg+kYjHNn562U+KwkQUAgfQwkpDSFD/t7yJ
	3E3nK0l7ZJ6DfcC7uYAKMlHnXcw0HrtxIRM2h8+Dp/xNCMS2ssqNAzo4h0XrxViKswQtsumTYsM
	xhcB8cN73XfDMFGrduH9DZfaga7Oiega6nSvV+vokvv7sXNOAs/PeBHwFr7gd2w7tG+CD4t5Rz5
	4aH+8GNRskvDPStjcjGXZkxFqpYhQr08T0Ksu15p/9b2EKLit5LAk+ttIXf99CYDhm3p6J/4fXm
	4eRYuZMo9u4Op3dFJtK4Kt9xfnAgDwQnam3ngpW2o8oWzbajaN/v0GYXq67l83BZfAJyWlEV52m
	WhspS+THyiispMKJldYNeklIxnZxcc8JeHazrFMG/L0ZY=
X-Google-Smtp-Source: AGHT+IHnUqWbN87MfdnfCGZe3Siga0PrKlesE1NEYJJvVLUvhC1pGxgwxVLeIsjtogtg1QbMwZPCCg==
X-Received: by 2002:a17:90b:2709:b0:340:be4d:8980 with SMTP id 98e67ed59e1d1-3436cb89ab8mr12431413a91.14.1762847023674;
        Mon, 10 Nov 2025 23:43:43 -0800 (PST)
Received: from lugathe ([2804:13c:46ac:1000:f491:d00a:e2fb:e67c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c31d86esm13779436a91.8.2025.11.10.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 23:43:43 -0800 (PST)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: linuxhid@cosmicgizmosystems.com
Cc: bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxsound@cosmicgizmosystems.com,
	lugathe2@gmail.com,
	michal.pecio@gmail.com,
	stern@rowland.harvard.edu
Subject: [PATCH] The Edifier QR30 USB speaker, identified as: Jieli Technology EDIFIER Hal0 2.0 SE 2d99:a101, reports a HID interface that needs HID_QUIRK_ALWAYS_POLL to ensure it does not crash when changing the RGB brightness with the physical knob.
Date: Tue, 11 Nov 2025 04:42:05 -0300
Message-ID: <20251111074205.1533558-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
References: <c6d506f7-f13b-4d57-a522-a2ccd09e7a1f@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a new vendor and product ID entry in hid-ids.h and register
the corresponding device in hid-quirks.c with the required quirk.

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..ece1bea0faa5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -734,6 +734,9 @@
 #define USB_VENDOR_ID_JESS2		0x0f30
 #define USB_DEVICE_ID_JESS2_COLOR_RUMBLE_PAD 0x0111
 
+#define USB_VENDOR_ID_JIELI_TECHNOLOGY		0x2d99
+#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */
+
 #define USB_VENDOR_ID_KBGEAR		0x084e
 #define USB_DEVICE_ID_KBGEAR_JAMSTUDIO	0x1001
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bcd4bccf1a7c..d104f4829d93 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -110,6 +110,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_JIELI_TECHNOLOGY, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },
-- 
2.51.2


