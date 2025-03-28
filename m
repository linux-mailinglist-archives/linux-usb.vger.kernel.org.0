Return-Path: <linux-usb+bounces-22288-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97348A748B2
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 11:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A1C189C54B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 10:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A69211A2B;
	Fri, 28 Mar 2025 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="liim98gH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31301DE2C3
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158991; cv=none; b=T8qJwp3/rYMJalDwrJx7dYnA24Q+VSCGeupQfRXDqRZJKiJxhBbRIw0iaMVVlIorglGUGyM8sxNTOfdJ6ul9Rgn15oDaWzTQhUKe++reLUoNGdlJrhoB3GkXXrT2VEnG9KD4WAl/i8OVFpyVuy7KK7dwU+NLVRLp/RnejglO3KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158991; c=relaxed/simple;
	bh=72hN35xKbPLsrofs2a84WCnG4Ltb4xvwlQLBAMP5uYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XvTcN1XpKUhpZ4lCi7yz2AXjb0U8oAoi5aTwUP36dyPZjMzQPYnn6xoL94VZnCLfFR1QII5lBf4ZaEx14zREjSDj9fTGXlkdIn60YUs50SprPNRfJwip0n8+IZGzF9XLPF8STslo1FyMrT8KXLOByaWXqbiI8L03eqFswfo7y4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=liim98gH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso13896255e9.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 03:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743158987; x=1743763787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VH0Cwtt/VTuuDdT3io/MJ5ajnJoFp34tHNTuBuJNQOU=;
        b=liim98gH4gL+tpMdeetqRkKaOb/whCUks5eoNW6zM9Ji1hOby7epRb288Mpu5Ic7Xy
         LD8eVOPc5iBLcyU8Y51ssggARHzXq2LjwNqXZpWwS/DSpyP7hJZKi7IyNDfu+TArgWez
         FuFaVaZQmVdsuM1u86dIgVu52DvBq/amvFE5Qp+N/yS2MDVEmogbNq2L/7rspRQTxJ0/
         n18Jb+g/0rjrXBAsM3aGKGHfdKpzY/y1fHIKJ/Q1kRQ9lXtjlI9AD93ppnfz8OY4az0X
         v98NwdfH3VjhtRPNDqfXs5FvfGyxBC+MYx1GrRjm9lXaxpxexPNUxh1GTmk6w2TtyaaI
         vmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743158987; x=1743763787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VH0Cwtt/VTuuDdT3io/MJ5ajnJoFp34tHNTuBuJNQOU=;
        b=bVpCVG38uowtf9mn+LYA02LsMB28ZlcAVW9rorLpkGA7vrFCSco/Am50Ikpmbcu+2z
         rcrEWswNY0q0nxe48TYlFXFB58CuiRDCGeWkndHj/QEDYya5gq4o+l/GwPg2A2R3PBl8
         qjguKEq/3eeGzsPWaRGzvHY64af7d6y+gPzPWCFsZ2iJx5lM24Lu2dNHJBz1aZ9e/7+U
         nnD01WXGC2ZE2y15QdUBC8lpuBJLohYXjBelDQkNeZO8AeKoXEh9hyGO4UrTd0OTIME0
         R3brDyIFULVv7seWWFAbwBPJ2fYowUCBtcMu+lzrWokD+55kDxSRThvoAiZYd9Yh92PW
         JSdw==
X-Gm-Message-State: AOJu0YyeFG3Burrz9/fCpZsroDu4YTwo8imGVtFMfHPLTITEOImVELS6
	Ea/X446yWMR3N2w31jynemdKKQRC/dSrNWoOZ6g3lCE6FZ57KLAZwbM2bVEgbAI+nwAyYUxYx6P
	/0eo=
X-Gm-Gg: ASbGncv/CpeiWxzLdoglNTes3VLu6UymG9rhHzWsBIypU2vVYYoeHqR0f4G3LD3Ycie
	g9S+YogxMVl2alV7rmAWFv8bWobJ7vMRkNHYF5/Gf45Va5Laji30s9mtSACdECizX/haROf5qFF
	hIcB5Hdv60U/Nz4ZcEi0qfW0ndl13ST/IMgSeuEQ6EB0DeMk6Udg3v/t0VdQWF7zGXIi5SPC9Tv
	N/DajJHuHZ97YzpYwhmuMxYu5a5LI/GPGfl1uiAblXCG8jC8UEL4l6wcoPyn/hfAkZnckwjqJa2
	R0VpX1eXdsXR73q72flxxyNzjf3QmuF0UAhEG5jia3Lq4zCH0vaCgdmjRXUSJKYmgH0X+1Cd
X-Google-Smtp-Source: AGHT+IHp8Quyt2xQsQT//2VK/V1cAZvb4JwTbOBC6Hl7+G6SZLVoHWk9yvPPwlmOIpGiBX4qeXqhoQ==
X-Received: by 2002:a05:600c:5103:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-43d84fbea4bmr60361565e9.15.1743158987018;
        Fri, 28 Mar 2025 03:49:47 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41c0sm2163406f8f.88.2025.03.28.03.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:49:46 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	fisaksen@baylibre.com,
	Frode Isaksen <frode@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: gadget: check that event count does not exceed event buffer length
Date: Fri, 28 Mar 2025 11:44:35 +0100
Message-ID: <20250328104930.2179123-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frode Isaksen <frode@meta.com>

The event count is read from register DWC3_GEVNTCOUNT.
There is a check for the count being zero, but not for exceeding the
event buffer length.
Check that event count does not exceed event buffer length,
avoiding an out-of-bounds access when memcpy'ing the event.
Crash log:
Unable to handle kernel paging request at virtual address ffffffc0129be000
pc : __memcpy+0x114/0x180
lr : dwc3_check_event_buf+0xec/0x348
x3 : 0000000000000030 x2 : 000000000000dfc4
x1 : ffffffc0129be000 x0 : ffffff87aad60080
Call trace:
__memcpy+0x114/0x180
dwc3_interrupt+0x24/0x34

Signed-off-by: Frode Isaksen <frode@meta.com>
Fixes: ebbb2d59398f ("usb: dwc3: gadget: use evt->cache for processing events")
Cc: stable@vger.kernel.org
---
v1 -> v2: Added Fixes and Cc tag.

This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
Also tested on T.I. AM62x board.

 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 63fef4a1a498..548e112167f3 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4564,7 +4564,7 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 
 	count = dwc3_readl(dwc->regs, DWC3_GEVNTCOUNT(0));
 	count &= DWC3_GEVNTCOUNT_MASK;
-	if (!count)
+	if (!count || count > evt->length)
 		return IRQ_NONE;
 
 	evt->count = count;
-- 
2.48.1


