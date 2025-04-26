Return-Path: <linux-usb+bounces-23497-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73355A9DCE1
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 21:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C79A9465AF1
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 19:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061BD25E441;
	Sat, 26 Apr 2025 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ewa5wyuD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB90D188CB1
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694766; cv=none; b=nCR/jIEo7f7EdvEgj0B87RexO6qAfnbxgJXn4Vc/VLQbU4LqmtY+ONO71g3QM7U4GsyYLOtneupdQU3wWCFleZQ423WlYnOaQPg3/hOCWsrOlgZbPktsgiAzUvjJ1qntUFxhBhKeoVA87wmSgE0IA4nRTBQBAZFJvuuZ17gc3FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694766; c=relaxed/simple;
	bh=/Oy0cVo8ZGqNgPvqQv9Au1VlnxQmZ+dCpaWbvTyEDvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F8zHUPnDdUTB+RePuDVDaBbZmQmbH/vUEyIG5XSCCQRKmYLbL3e9VcF1/bUjAc+g8S8VC7bY/ma0WQS+Bv7zGhQF7d29T6BOqkTWKk1SN7f7QWhmnjMPtJqyAV3FVMhf27tNwBdhDpyP1Rjaj+LZW51H94/lte2ds/KcFsbiSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ewa5wyuD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2296893f8f.2
        for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745694763; x=1746299563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huEBJRGLgZCnBnmVfXIkkQtVQaLqyV+YozVcB9C9+Kc=;
        b=Ewa5wyuD8J7GlF4OPHYfALt30fV7Qh5oYpMFr8RsVr7lMFz469B+a6eJbwer6thnRv
         2M95LsiAXstoVmnlJW5ll6fUdBMPeKaPyHKR30ftrCNkx6P5Ptk6s6pAQidt1rQj2mnP
         FGLUboloewzcLRbjRASf7QlBvNJ3xKgn3Lw7aYUipEJ3fzbdUV0FqBaGO3f2B1OJl4WD
         umZrwOpfJY+wv1tFdiFBDVQzSa0iG2X3Gzop51F96k1NwY233x5XVLyD1syU4Dxlf0v7
         EGUe2Gm8cob8udwveWVkezSEwXVIpIpAS0G1eIzRM9Uex+LlPLgd42wk4/o+S8NcxwIF
         GU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745694763; x=1746299563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huEBJRGLgZCnBnmVfXIkkQtVQaLqyV+YozVcB9C9+Kc=;
        b=gffeV5T+uinbtbFzUnnFFeV9wFBdYGWmUeb7Ak6KWZJE56VLleIAp7VWCTrB+l25ds
         75k9jWzR8TcsoygA4kO/UjruiQArIdjlnfuG2z/GXpXqa9q3fWd2rYiZC3MsFAOYBXiF
         9IzePk+KBO1YQArAEYMUhveZ6FbubOT2HzeGdYPd3almF6gCyh6yoCfq9FUFGn5ltyX7
         1nDJMlgx6QLPRo7QNAw6FC1mCCD79I6KeOvp7EWXK60uAaVKKHofX5/m/f8X0aQ6//8p
         XZexdz13PXkw0LQLeF9mzVTqE2kFqftUajUDSW22Sv66nOv0pYAgjXbfIPw2Q4mkjhV7
         bTSg==
X-Forwarded-Encrypted: i=1; AJvYcCVdlOQjJMa7hI4XOiCXC3zwrS8ykgPiXCuhcsyNW10j4vYLyRlU/07xYTLFLCvZUCB6xzG4gOKVoMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw1nWrxTtcqNmi3ZuErc+I4+USIIQ5G3mVnOdZiRvgLPugUUSP
	n5SXyXrBmHJQ0DShWh860VTvmu7qls8SsKeQpKTkdZRhcyqKSFd0
X-Gm-Gg: ASbGnctE2symBEKTiuallWalDwITZsFPGBszu9ry/jKgTrHGmscGqfEI1/EpKWZaOaX
	ehFFspHryQ3mGU3DTEtYxOZUXEspcgiaSF7Wyklb42UT/Aw4JasLbQGz6g5gvNETOv9+KjQIo53
	N1leN4GD8BIxC/iU6QPWFU7w1w/DYt22JZxMQ0+KP+E+RDQ+gKOG3DP+YKxwKk2yPLc0JPC0tEB
	pAIoE+IhlHNgQR+qC1Hf0vwXk6T7p19eZaQY7RkLLIpCFspsTjPS4dG6PqhUZcItTCqnKjfiTMY
	dbyh0HTvR9OT6kXa/P9gN9V0E1+Dg4fz1oAX09mFmkQ6v26V6LuGu1flpevpk3hwHUv7eYXEpwB
	h
X-Google-Smtp-Source: AGHT+IGLRmqtOMWKjZgW3ScXn5D3uwAYE6xBJIEbebjoMdNPmhTReieLDwPKvIZ6MrPly+klNc7bRA==
X-Received: by 2002:a05:6000:1acf:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-3a07aa66ea4mr2582756f8f.8.1745694763067;
        Sat, 26 Apr 2025 12:12:43 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8da58sm6473285f8f.15.2025.04.26.12.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 12:12:42 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: guido.kiener@rohde-schwarz.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3] usb: usbtmc: Fix erroneous generic_read ioctl return
Date: Sat, 26 Apr 2025 21:12:22 +0200
Message-ID: <20250426191222.13727-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426191222.13727-1-dpenkler@gmail.com>
References: <20250426191222.13727-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wait_event_interruptible_timeout returns a long
The return value was being assigned to an int causing an integer overflow
when the remaining jiffies > INT_MAX which resulted in random error
returns.

Use a long return value, converting to the int ioctl return only on error.

Fixes: bb99794a4792 ("usb: usbtmc: Add ioctl for vendor specific read")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/usb/class/usbtmc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
index b3ca89b0dab7..025a7aa795e3 100644
--- a/drivers/usb/class/usbtmc.c
+++ b/drivers/usb/class/usbtmc.c
@@ -833,6 +833,7 @@ static ssize_t usbtmc_generic_read(struct usbtmc_file_data *file_data,
 	unsigned long expire;
 	int bufcount = 1;
 	int again = 0;
+	long wait_rv;
 
 	/* mutex already locked */
 
@@ -945,19 +946,24 @@ static ssize_t usbtmc_generic_read(struct usbtmc_file_data *file_data,
 		if (!(flags & USBTMC_FLAG_ASYNC)) {
 			dev_dbg(dev, "%s: before wait time %lu\n",
 				__func__, expire);
-			retval = wait_event_interruptible_timeout(
+			wait_rv = wait_event_interruptible_timeout(
 				file_data->wait_bulk_in,
 				usbtmc_do_transfer(file_data),
 				expire);
 
-			dev_dbg(dev, "%s: wait returned %d\n",
-				__func__, retval);
+			dev_dbg(dev, "%s: wait returned %ld\n",
+				__func__, wait_rv);
+
+			if (wait_rv < 0) {
+				retval = wait_rv;
+				goto error;
+			}
 
-			if (retval <= 0) {
-				if (retval == 0)
-					retval = -ETIMEDOUT;
+			if (wait_rv == 0) {
+				retval = -ETIMEDOUT;
 				goto error;
 			}
+
 		}
 
 		urb = usb_get_from_anchor(&file_data->in_anchor);
-- 
2.49.0


