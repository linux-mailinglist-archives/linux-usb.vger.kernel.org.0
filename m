Return-Path: <linux-usb+bounces-22437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF33A77B61
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 14:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B6B4188BB6D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Apr 2025 12:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04766203705;
	Tue,  1 Apr 2025 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="trNQnSQ4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9B5202F95
	for <linux-usb@vger.kernel.org>; Tue,  1 Apr 2025 12:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512060; cv=none; b=poUbKZucKjMn4ED6XFLQBosjejSGviCrcIQ8u0UIvL9MnFf724IQiKOQ2IR5xubnzxIbqHs444svO3cfbInBVjoMKDqcGWl5EXU/FUq/CDLJ51BAKaGOzXmgD7gT5vVwJNQQ1U5aIrbL2YGJbSR5lw1j2CXKaTxluIQKMMIrQ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512060; c=relaxed/simple;
	bh=l2PcQYbG8B/62rNOGiRk4wusyvFroUGb6d2YBZuccW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I7Bk+V+yl8lEOCMy/R/jHD055Rv7yTATRhUDK/c9GhJDuv0eDyR004QfibmR/Bs1FtdrI5WHZ2ruvnKotKiIqIqJbttEQ7TI1TCEHA0dpB85tGhrIW2ZtxnokhcdxuGW/V2Ar9IgcGmikp9B+CdWQ1tWXVg7pdKCn8mPRANElG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=trNQnSQ4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so2921579f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 01 Apr 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743512055; x=1744116855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIq2bCCkLTbVl75qgjk5SV7W2QZVt5vI8B/3mGbWOoQ=;
        b=trNQnSQ40kGaZJpWM9QFx+punNyaFS6cCaOYW0f0k6zB/tqEpznMnZUN9VeM6mKYg9
         uMZENe0DTG8StT5z3823P7GXZCQ8IglQhX9XftQoD+4usV+f9F9kRFemtCsFaXe2eEab
         H5fxEfREONJ1O5Zr26laXA5p/7O4iG8XE+70BM5SXWN+ZhlQ7hm+HEg/5uylwN64UK/j
         SDqxs5CahUBwHuH+aDUCW9RvC2SF9oU4wHg16d9ahd1o1sTezvCp6Cfw4xH+Z3cnXuyr
         42Dh/PhJywC4nmJj6yWIjKhNJP0LuEwsVh0KiwXj6JblHnMCtX+HKpsM5ysjcJrai3b2
         Gzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512055; x=1744116855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIq2bCCkLTbVl75qgjk5SV7W2QZVt5vI8B/3mGbWOoQ=;
        b=Brms3g/d+SMcNLPMNQZhlm50fc8SSuCepzs9s28mtJDc2NEAYwCOo3QTeGr/OBx5V9
         ig3HtHy6NiXMvPr2RrtBxmUezLqEfDNhMg2fRw/bj2wC4vCuMCYRV4dTJEe5/1ITGH6M
         mbfkQ8/hQTseCCzx3tB5HJKJShBY1F/7cP7J5B4lgLsh2cnFZpYSVqpmwS3jUwbWDIe3
         QwS6UjRcuXUjNWG6ZkjItRk/X3u1YJQNbcahfW8zCZy3UTuGwoT7mX86toOKDKHoM9Is
         oVzcyrNRV37yLRTOXBJ95smNrWR+R2S/wBVxQOABtKo/+j6fvOKdxRBTtuQ20Hx8dkLE
         krIw==
X-Gm-Message-State: AOJu0Yz7o9J03pmMfI6XRagrD8Kr6IByIwrY836L1BSUM56OQWKwJasp
	jqksl0fXsUNWWh2pnNL8ytQ2nchlLJJa9tLcXby6Uvbwk50upkE7up5jL3uqLnRDNy3UPo5S++c
	o8+c=
X-Gm-Gg: ASbGncvvZwA4xKatvmKdmLKMVZk59lV3VFVNOUrPX25pxCumE4xIPef5o2OU1YZROpF
	MNqO3OiVzC4tEhf3gGkJOVyogHfMY13X30oKfQhdyZ6otxhAJQNS1AK4eIkG8YFOB5NYSI2Snw7
	cZLlUn6eAQIi5VxNeTHnsfb8QEV0P1LFgV/wV7yMDEDlwtxXIXLY23rhC/HlHsFZa6TwSKv2VkB
	2E9YM3SNdeK4LcO0oWCCoopoFLyiMEboxXVIWqRwfk5O0i9qpeKh2je4RPYH6h/jgUStmVYFiXD
	gHl3eD1zErXNjW6+cKCgwpDqye07KLhrdFpMCDoXxP+P6PdUNnPhfEmqy5y+FA==
X-Google-Smtp-Source: AGHT+IEfm8jBIGS/rCkSCv4g7EEJ/qYcFumwtgYOgwdspDEMaLkkrz6eUaRLu7Yh0d7egIxV9UoOVA==
X-Received: by 2002:a5d:6d84:0:b0:391:2dea:c98d with SMTP id ffacd0b85a97d-39c120cbb15mr8544270f8f.8.1743512055189;
        Tue, 01 Apr 2025 05:54:15 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b658ab2sm14214546f8f.15.2025.04.01.05.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 05:54:14 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	krishna.kurapati@oss.qualcomm.com,
	Frode Isaksen <frode@meta.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] usb: dwc3: gadget: check that event count does not exceed event buffer length
Date: Tue,  1 Apr 2025 14:53:13 +0200
Message-ID: <20250401125350.221910-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.49.0
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
v1->v2: added error log

 drivers/usb/dwc3/gadget.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 89a4dc8ebf94..923737776d82 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -4564,6 +4564,12 @@ static irqreturn_t dwc3_check_event_buf(struct dwc3_event_buffer *evt)
 	if (!count)
 		return IRQ_NONE;
 
+	if (count > evt->length) {
+		dev_err(dwc->dev, "invalid count(%u) > evt->length(%u)\n",
+			count, evt->length);
+		return IRQ_NONE;
+	}
+
 	evt->count = count;
 	evt->flags |= DWC3_EVENT_PENDING;
 
-- 
2.49.0


