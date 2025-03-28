Return-Path: <linux-usb+bounces-22280-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDAA745C3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 09:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 547777A7FC9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 08:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674EC21323F;
	Fri, 28 Mar 2025 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="w6+Ll/ZR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294FF14375D
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152185; cv=none; b=CTN4iokpS3kqbsJedXO62mFmp35ws44TmrUyFRdUr/TJGWLxquTEJ08ZYKZTWOg7mW/NL5bhXt9fIYk/Bj0DObpFGYLdOlaPaHngKeCiyuI3WeABF3vlnkRiaF3BU9cCY7qYwSaCR2U6UI1ikKpgSp+++Dzsi6eZ5hsKC3/lM2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152185; c=relaxed/simple;
	bh=lo/s7kP0LWbaBN7kB2F2Ps1rhG6eCVa8wmyM9lHjSRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mJapDMhQRQYdPoWJi/kDgpBFpctkBnLudAzg+7ec9y+DmpuQt25om1JgdWWrVtLYnPyll/5YP0c03AxWDSxg82+9pWPi4u94jTyTyL2GDJiVqh9/1CLJR4JU/9NDFInLLT6iVr1TwmrdHcjAQx39DgA+v9J9qbIn9fn3+PXpHu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=w6+Ll/ZR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso13115055e9.0
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 01:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743152180; x=1743756980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7doriRpniCsEUzcCdohshQNnWmn/Qc8WrWi2JyiWBmg=;
        b=w6+Ll/ZRU++bUBEmwuUhnD7R0N8pgih8coQh4V+YMhmXaoDS/QUdFU37zdYm52Hu00
         czD0IYFQSi0IkL7F23DVKrE3MjtuTGXdaOeOB6HuKQXHfRH2x+nxgxoCVRjNsJ5PrNti
         OVXVmgzRaIRyGg1w+fU3u2p9dGIjE3pRE8aFoE+Ou6M3pVtdrX+ItcdEvnnZtRKdyV73
         uD2CSbTRRWZl/NyaFH7rBuEhKEClm1Sh51gYr2one1GO7PY3f94HkR9P6X4VmNHlD5zf
         ptvMJTxKYMJCmmpN5yoD3IjOIqn6rtbzYCxAVUTWilt8JYmTMoDK1NXZae4LTZYs9aEv
         cz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743152180; x=1743756980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7doriRpniCsEUzcCdohshQNnWmn/Qc8WrWi2JyiWBmg=;
        b=t7+edLXxa7fVJuXGBMxK7GHj+CnQE0J6GsY4V0EgArqMklJrd7g0oEKb9eoi4DKzR9
         +evVnbQn+bcrfDhRQRsGbtWjsUXiQXWZ9lRML5LhedM4Qz4Zko+BZfStNSo7uwhCMTD8
         8xzr2kF0souxkNDuHVzw7NcQv20il4tya/1a5ZFB6wYuGqUaGlNwX2iPTt6Ck4ZPOR3m
         g9ddXO6+QEs3q6DlGcpkE4c22EiELzj2xnVy5N6OMXq3Qi41E7sGYgI/kjNjEx03o/vn
         Z4nLPHbyC/3oRwIliQdyuMo5tT8E1bAFpSySG+nSnxlyi37VOkY1IjfaiAlZMXXK3+Y0
         XYxQ==
X-Gm-Message-State: AOJu0Yz4LxMB0LEyA0+lQ29XWkt553LBxyXCenuelaIdiKefhKS+KIhh
	pVEQ7XkLQF+d8oqQXr8Zime+b/1s7zdAevlnu/qWbSusrR5dnjyaGP3PzZswLe1JL8ap28odHkA
	OcwE=
X-Gm-Gg: ASbGncudFjPL3osC4wVM5qtN763gJhHG8eO08D3UEWzv60gbyjUkMpVW9ijhW+vm5NU
	hDd7XNmW0KyD8zI88VhbI0uYMSrXFzjnx9MQ0XkWZz+UkmiFSzHXxOKt11oDLwb4ew9Rvl0jR7U
	9D/J5yW2eoXrHcg0ho48siaHmDfI+zpZF2n8CGPdML9U3HvXovQ+C+nOKJoEvdc8sea3+lL+LKz
	IT5kqnNToqeHkwgFssKQIcMO9+nFTf3MDJXDthZQCPNNkPSprOnAQoyiqNEFT147B4rjXoNIQ3R
	+ThRR8fTcnwI1f6PTbYtFKVjQJIjR0l626QdS0Oiu4I88/31gA1uBdCujzi0+Q==
X-Google-Smtp-Source: AGHT+IGOC2oovfPaGextgL/nLdI++VE+zzRrVOVMGl+qTN3GzTHzCnHLSIOn6To+WNbR20IwUG8DYw==
X-Received: by 2002:a05:600c:190b:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-43d84f9a6f7mr56815505e9.8.1743152180181;
        Fri, 28 Mar 2025 01:56:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90000a09sm20203335e9.35.2025.03.28.01.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 01:56:19 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	fisaksen@baylibre.com,
	Frode Isaksen <frode@meta.com>
Subject: [PATCH] usb: dwc3: gadget: check that event count does not exceed event buffer length
Date: Fri, 28 Mar 2025 09:55:25 +0100
Message-ID: <20250328085603.2156517-1-fisaksen@baylibre.com>
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
---
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


