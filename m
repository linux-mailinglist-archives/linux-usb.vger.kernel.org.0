Return-Path: <linux-usb+bounces-22301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85644A74E72
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 17:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68C1F7A1174
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 16:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3CC1DA314;
	Fri, 28 Mar 2025 16:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YuRkLrPW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6321C9B62
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178717; cv=none; b=axjK76ortJRvyyjgPXpY1z1X7mzvjV/ZJldTkB1wY8gT7VoyWAFILJ3IxN7+YFfc+pPM8Ig4GioIyTFdctqb8TyKKVkEmVFag1kDhc0Q14CdutWViFXgc8NWao+dAAQ6lmcJzFT0jsww0WRThp/pnjr/MytbPJtMcCTAk4kB/uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178717; c=relaxed/simple;
	bh=vpOZ+6Tt/Ta+FjCifw+zBv51bXxSYd6scU/aSPBcJF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhwBQ8RGdQYlqv9STsstFAkiZLdo9ppZZOEMr8i5XvivdKqHKz1vshApFZWvm7UKydNzGGzcYPCmu72yc5OsYXx5wIX1iFCUgx4lxx+CVfOe39+m7gjac5CZJoJVfqee6caIrewGviTj6Skx963/anxd+BtfUcfGvNXHmoY2KKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YuRkLrPW; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3913d45a148so1971720f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 09:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743178712; x=1743783512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLvJ8wKGlOhmmwKM34emCfuPfRCOYoMw3/to5QId6+U=;
        b=YuRkLrPWbMMz5m/vCn8TfwP/xQo+5z09y/R2DkzcTIu/XhYlHdDaQgfrak1F2TPE/L
         2Mw+HHLJQ648XzUD4oxET4FtgfC84vdTWRCjNUu3Y4aZdyDKL6er1bpzUso1fJO744RS
         kkoIVT0DqGmojY3nUguOvjxx5P6wzBtvO0AcBrtzH7WPIkqMWR7wq/SeaAA//G8RaeXy
         ru4MeaFuA7TP0TvLEjFXLaTXzIjmmuply4TGCyB7lpGydMLfmhvfAXUSEgXEuvH2bcJV
         LHpIHg2t9WsPMFzcq/doAR2Whyr2ge57KsK7farssALfoVABxytoLrpJIO7y6Cco1nPq
         VQ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743178712; x=1743783512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLvJ8wKGlOhmmwKM34emCfuPfRCOYoMw3/to5QId6+U=;
        b=geFk8UmfbGi76p47yaNFpr/QYfyJcKPsz42wefZ3GlFgSTO0JqojLjkwqgnCb8Xwcj
         vfYn3aCTf9wiyS3sjfj4Cg1Zecf3zUz2LbUNeCKlzFBK/XsqvyYzhsQFgKSdgBHkXLxh
         PwU1Jz7TN1eE5BFTm3J1EYfFbt3rtgDjt3WWBmuufpRIyHokF1gbVbEP+yX5ibpLQB8t
         zCvgJ71l1bBd1L4PyjCIFs5jMcVjo3p8ZTRwP/2IZLHfLoVCLghPxj+TXaUWtSYAOgzy
         qi/OfduKcXEGo9ffDSVnJVgSu5ZqpRoniHJFGlnISrWoQ6yk2kFvZqEoEvqidGr6PWbm
         XT7w==
X-Gm-Message-State: AOJu0Yx/1zcNdEdhLifj8Csf5PeAZTxHD4jT2RE74NfzZzqPX6q7P2+6
	fHPSrFTVK33cItW1VGm+2VhfMq1JqohcIL41RubV+25GsKNby+mrGKQccN7TQ6DkvoWEqf7uwvO
	bYno=
X-Gm-Gg: ASbGnctxorqWCrTTiDWq2OnsQmMtuWca3wc3cavS9AR5RUp9v4+8PqMRoBxBUqvd0rG
	WWTl+rnV6ijg0nFNJPRh59nAFX2fSs8w0lS0qf9ohRAPXYNrMobkqAgwYV7A6gt31WIO/G6RnA5
	eBXzy4CL+2aCw04qqMHbawWMcF+YHdwLDdKkCVxnHA4+0hqVKeBwIXQLISE/lDBToRDvAVlgzqM
	dMg7pGzLzyK2MK5lNtZCmK1Jfly7oZIJAyRIthowZEfZyJ7YWFXswLfM5cudRDzRjvfU7IFQoz2
	HRT3irkjd4kWQiJ2aAMUPpL+SeHhehMblwtT9QzEKbYQUZj8hI6q7yO4wSHnGg==
X-Google-Smtp-Source: AGHT+IHMgHtwa9lJ1XHIbz2GOW/JrtsJEO4HNTlLBDlwAPSJ8RdD3tVnrcsvwawKjj6d9LvRttKCZA==
X-Received: by 2002:a5d:47ac:0:b0:38d:d371:e04d with SMTP id ffacd0b85a97d-39ad175c0cfmr7141440f8f.34.1743178711751;
        Fri, 28 Mar 2025 09:18:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:355:6b90:e24f:43ff:fee6:750f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8314bbf1sm73698975e9.38.2025.03.28.09.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 09:18:31 -0700 (PDT)
From: Frode Isaksen <fisaksen@baylibre.com>
To: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	fisaksen@baylibre.com,
	Frode Isaksen <frode@meta.com>
Subject: [PATCH] usb: gadget: f_fs: Invalidate io_data when USB request is dequeued or completed
Date: Fri, 28 Mar 2025 17:17:15 +0100
Message-ID: <20250328161823.2240125-1-fisaksen@baylibre.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Frode Isaksen <frode@meta.com>

Invalidate io_data by setting context to NULL when USB request is
dequeued or completed, and check for NULL io_data in epfile_io_complete().
The invalidation of io_data in req->context is done when exiting
epfile_io(), since then io_data will become invalid as it is allocated
on the stack.
The epfile_io_complete() may be called after ffs_epfile_io() returns
in case the wait_for_completion_interruptible() is interrupted.
This fixes a use-after-free error with the following call stack:

Unable to handle kernel paging request at virtual address ffffffc02f7bbcc0
pc : ffs_epfile_io_complete+0x30/0x48
lr : usb_gadget_giveback_request+0x30/0xf8
Call trace:
ffs_epfile_io_complete+0x30/0x48
usb_gadget_giveback_request+0x30/0xf8
dwc3_remove_requests+0x264/0x2e8
dwc3_gadget_pullup+0x1d0/0x250
kretprobe_trampoline+0x0/0xc4
usb_gadget_remove_driver+0x40/0xf4
usb_gadget_unregister_driver+0xdc/0x178
unregister_gadget_item+0x40/0x6c
ffs_closed+0xd4/0x10c
ffs_data_clear+0x2c/0xf0
ffs_data_closed+0x178/0x1ec
ffs_ep0_release+0x24/0x38
__fput+0xe8/0x27c

Signed-off-by: Frode Isaksen <frode@meta.com>
---
This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
Also tested on T.I. AM62x board.

 drivers/usb/gadget/function/f_fs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2dea9e42a0f8..f1be0a5c0bd0 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -738,6 +738,9 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
 {
 	struct ffs_io_data *io_data = req->context;
 
+	if (WARN_ON(io_data == NULL))
+		return;
+
 	if (req->status)
 		io_data->status = req->status;
 	else
@@ -1126,6 +1129,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			spin_lock_irq(&epfile->ffs->eps_lock);
 			if (epfile->ep != ep) {
 				ret = -ESHUTDOWN;
+				req->context = NULL;
 				goto error_lock;
 			}
 			/*
@@ -1140,6 +1144,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			interrupted = io_data->status < 0;
 		}
 
+		req->context = NULL;
 		if (interrupted)
 			ret = -EINTR;
 		else if (io_data->read && io_data->status > 0)
-- 
2.48.1


