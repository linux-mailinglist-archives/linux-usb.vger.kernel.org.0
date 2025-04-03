Return-Path: <linux-usb+bounces-22516-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E6FA7A598
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 16:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2A8A3B7847
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 14:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 744A224EF7F;
	Thu,  3 Apr 2025 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MKGOCfQs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6221024EF7A
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 14:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743691314; cv=none; b=I3P98ZQdMKoYNaA1c4Qdm6m9gIR4P6YgI8ioU0KWQ/ccsvkGIYRFskJeIYGw9458HzX76lCHTVxmCPvQHp28sGveYr5z8SwrRSmHNcW6ctxGGlqMJFiZP5J0I1T8kdL3tOMdR4UqlpDqqkWbkCOeEBgzWER7TK/FqmOgFvCfQh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743691314; c=relaxed/simple;
	bh=deul/6DMD0WupcCRPEsci+NKCg6iMOZb6tLQIefJsfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kzGYnIhnLVTCsr5k7wCHYEFyqzx5stmTI3krEShRIjxu57cKCBUDUMZh+Jk6GXR/P700aKThcrNWB4O0nsR3f9DtzAx4Rsio7Ci4Rsi5Ljk8CqmPZeR2siYKnSSxZqAzudK6ZiqWg+ZDheQqndcsbFYz7hLz8fvjT60r5snGj8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MKGOCfQs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so15327015e9.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 07:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743691308; x=1744296108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qU2AENczHbFYi0vapb5qtmr112HUi8oMeHXkjdOGnTc=;
        b=MKGOCfQsjoT5DpqOikpx2fWQbC1D3QUe4+bHJyRc304R5WnMPSGfkohErSIPg0hwAZ
         qQIEBOu9wNQsJHjVZ/UvmZcFU9xe56fsUZ1TmTV8GYbr1UvkzSlQg/tcBjwAuszt+GIG
         5Pg24uLuwXYSuRGeRc0U1dbhaofIBg3+gugLjVtgbRCJ85Qffs2zoq5W+k5voJkvXmF0
         faCdORNden2C/hJAXMnXGIDhcSnmRkoPssvGi1dAgr48ysNvRPnRM/QIlvAevwtduRIA
         +dBbWUVyzzPqiJyMmfLDyInRTZ3eLmiGXANp7h6/bRMpqRHr1LxvAV9IVJUgT/wzjpru
         ugVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743691308; x=1744296108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qU2AENczHbFYi0vapb5qtmr112HUi8oMeHXkjdOGnTc=;
        b=vQdf6sH2xvvUuNyjhpIxacI7GC1p+pw09MYWgSK2kZIoSXNZt6C3E84F5EorEOxhaq
         iuclVo4Yd4KUR1w11MzW7j2GfEsN7joDEJ7J93yQy/AIACAfMTsvwJl08JJNPXtxGv5P
         03ts4HSd9O/9HlbYuakVbJ9jc3F/aw7nbPJ5sCmdkJ/+Szhrz4gxF6U/H0sSPpUPNrgL
         eD+WgsahOAnHKM8tI9Oto3BWubiZpz9eGGU/tAZpbf5R+synhO4yftq0dEWG9cHrmkGx
         EqDz/6NumQwB78vrOMMTckXK2Pj3lMqgUq/qlJToAxipUg/kM6o0fQwY4Zq6Qz3RUnSm
         Bycw==
X-Gm-Message-State: AOJu0YyIyfft8z2ZyVSjY48dxZG5G1hm9rxCzMOETWnxs5ggj2QYBWk8
	CGEgkT6xkCHZqN9zG7G2xhVfqpBEt6KoYnl2gadcLbt13rpVx3dSx+rMCzJAb9gHs+0KSlz1/7H
	mK0k=
X-Gm-Gg: ASbGncsLfc+PGZP5J6ymbwViaXXipumhZOHa2blkn/L2FPPfhMP+zx9nODnbdxLfvaD
	gmCeZ8P3wTmpN6g7FYkSDJtmmZvf+RZvAS/zhxfZxMto1x+LPqX+XocOSRWU+hLlohzB8TAUZ4P
	u4mWxbIjcQF+f+BGupzMbXkznZbhZCWF/U0V1oE1B6DNAfDJ8Nu3patFp7hcgujj9byw4CysAv5
	ldy1GepkesPz36F5m6XOr5fvfS/W0euXuNDUHg8iZnheGRM5BnV5suyffVe4TYB0LLSBr6A27HS
	gDI1FpmqLt2a5fW+qdKH8P5Usyy8ROU8q17f9oXxj/UKlkeRm6jEwcOzSmFwAA==
X-Google-Smtp-Source: AGHT+IFalIoL8K4m0td9bSbzSevan9w/rCRp+a1gY9nTWSue++Cl9cZnjcr7EiL0+MdouIWg6bYH9g==
X-Received: by 2002:a5d:5f8e:0:b0:39b:32fc:c025 with SMTP id ffacd0b85a97d-39c2e5f50f4mr2892458f8f.2.1743691308511;
        Thu, 03 Apr 2025 07:41:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d975sm2006676f8f.75.2025.04.03.07.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 07:41:47 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	krishna.kurapati@oss.qualcomm.com,
	Frode Isaksen <frode@meta.com>
Subject: [PATCH v2] usb: dwc3: ep0: prevent dwc3_request from being queued twice
Date: Thu,  3 Apr 2025 16:40:35 +0200
Message-ID: <20250403144134.518383-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frode Isaksen <frode@meta.com>

Prevent dwc3_request from being queued twice, by checking
req->status.
Similar to commit b2b6d601365a ("usb: dwc3: gadget: prevent
dwc3_request from being queued twice") for non-ep0 endpoints.
Crash log:
list_add double add: new=ffffff87ab2c7950, prev=ffffff87ab2c7950,
 next=ffffff87ab485b60.
kernel BUG at lib/list_debug.c:35!
Call trace:
__list_add_valid+0x70/0xc0
__dwc3_gadget_ep0_queue+0x70/0x224
dwc3_ep0_handle_status+0x118/0x200
dwc3_ep0_inspect_setup+0x144/0x32c
dwc3_ep0_interrupt+0xac/0x340
dwc3_process_event_entry+0x90/0x724
dwc3_process_event_buf+0x7c/0x33c
dwc3_thread_interrupt+0x58/0x8c

Signed-off-by: Frode Isaksen <frode@meta.com>
---
v1 -> v2: Replace WARN with dev_warn

 drivers/usb/dwc3/ep0.c    | 6 ++++++
 drivers/usb/dwc3/gadget.c | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index 666ac432f52d..7ab102b5fda5 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -91,6 +91,12 @@ static int __dwc3_gadget_ep0_queue(struct dwc3_ep *dep,
 {
 	struct dwc3		*dwc = dep->dwc;
 
+	if (req->status < DWC3_REQUEST_STATUS_COMPLETED) {
+		dev_warn(dwc->dev, "%s: request %pK already in flight\n",
+			dep->name, &req->request);
+		return -EINVAL;
+	}
+
 	req->request.actual	= 0;
 	req->request.status	= -EINPROGRESS;
 	req->epnum		= dep->number;
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index b75b4c5ca7fc..e1eb531e192d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -3002,6 +3002,7 @@ static int __dwc3_gadget_start(struct dwc3 *dwc)
 	dwc->ep0_bounced = false;
 	dwc->link_state = DWC3_LINK_STATE_SS_DIS;
 	dwc->delayed_status = false;
+	dwc->ep0_usb_req.status = DWC3_REQUEST_STATUS_UNKNOWN;
 	dwc3_ep0_out_start(dwc);
 
 	dwc3_gadget_enable_irq(dwc);
-- 
2.49.0


