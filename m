Return-Path: <linux-usb+bounces-26587-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C23B1DB18
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 17:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB9C7585575
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 15:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628C625DAEA;
	Thu,  7 Aug 2025 15:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VK9ocNyl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446FE266B52
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582107; cv=none; b=F+29Aqhx9ZFUoWZ7ql9fDOhqjXlU3KTMwvcpybWC5xiui58ZrlPTPeNaJMmUTswumR42VUBUyv4zMgbxfzZVifeutochJ3/gV5SMGjv0MVZ4aIus4s1CvIxayj/Cm2jY+HHsfZ1kz5KoKZ8BujdqvWL8yQ+09CBZNNI6tVI0klY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582107; c=relaxed/simple;
	bh=SQqxK/HCej6ZDpPKgE3mF20MElkN0tQ4FKvSHtMcEcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s4bOXUMQoIuUlatX2OR6ziSei+0zkp9nAVNMeULtk/rzGbEt0UK6sWrgDVV8li0HgGlKKe6f/NifuNk9zmr+lZKjTn4Fi9/UqRTC8RxysNTs6KfFc08pLC9fH6QJLIZuUUj9vNEG8AZWvZdPSI+uKiLiaxj9FHEznHjb5+Nx53k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VK9ocNyl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b7825e2775so1066769f8f.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Aug 2025 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754582104; x=1755186904; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxONtqpEzsy4ybhTdJqv60dbpH7hpRv1LR4+l1PPyfE=;
        b=VK9ocNylvoLr9S9lNJgu38/c0uAQXlbA1LxjW+qSghoeFw5XPtLFKvn28nISMj8OjJ
         HWYXwAdK0mhBgLuLb2/NC2+/A8+/9hfd14ALmHefQJLTjUrocAOKnrnSBJD/98r7PzVg
         4BEwf7emMvMCaTRt9/QUHEaAMHWeU31nSRWarBknfmKDu/fMHMaVroJdMl+HZsgleTbb
         deXq1PVAzb0U7Aow2MdMSy2rnzGc3imL8hzrf1uztzkRxkDqCGppaJfyOzTvmReBYZE+
         Hz0803TfF/05q+JC0h+eZIF+NNT4lSlgQGgh9IL2CjutG5i457Q17zcP69hSMWnHXx71
         DUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582104; x=1755186904;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VxONtqpEzsy4ybhTdJqv60dbpH7hpRv1LR4+l1PPyfE=;
        b=PXRS6Yeetz9KYeGGaDxLD0JXIi6+ydT+i5YL01Wnxe0tK9fD9LcC7eebumwfMiVLln
         Ru6NB1hxpGv8fq1x/G8pGmHwnpmlu4nuYDcFlxgpnJcBnv/vD0I4RTtVsifLEwJNhmao
         +pXoYuTSvY5qBF4Q+3nud64d/JvBEvGJDtxexMtp9lhe1qCbfYeJOzkhIuZarFRQWleM
         /f1F0GCZmft5bL9GRieiACdO4ovbQxe719BnFUhETCf172Kst7E1qcY7HXWRgen4u4oR
         8krt2mnbAskSMugT5Xf5rHZQDsv7ygmz/9C3RjoR3Crh647+68S/gN1MVwzQJNdXP8Tl
         0VcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKT1RXhUUKO3IBccPDsaxEt30Hs4ay5zg8StWyaopTyPytYRgrjKgwgp/gQ43wSvXHlC9NfgM/IaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFENY0+VQ93ufABjwwkfVpdyueWPa68hoJkqHOyob86hahYQ5G
	m3i1dEbvmc5aTn0srvmQQULPjvuveG9/oDo0ZXx1UQdObO4Ea+EfULsvtFriqcfeLHA=
X-Gm-Gg: ASbGncvESBjZaAVAkmDRZvnQ9TuLK40ex7TO6BvB7ExkGAztJUsqANBNcbmNs7wWjaC
	TejwZ/DnXFEaZFuwkvn9ksaIKR0VxuKJNo/O1Al4ORNBj6bYEyBjGR86WKghBeKSzLNk3iEIUcq
	BmTud9wZsW4TMLf8hincprArY8iOS8C+srsdv+BLGK552x5AkRX7sVv2mG2L5xzz3QKLLPtvA+/
	fr7U7Ow5XzVJfcz50MA0Jw8NL3PMMV18M1Llm/VBeZQA6NhbblIIuxILIjhG547cq2pywna9K9L
	P86PcudmZL5EVIoXBNGXGJnG8WW6ZKoglg9lycfO2zyLbeX22qZYGRIusG8bZrSXkBASW+1lo4Y
	yevLiGa2bZ+U201/8eNEuwZVUImI=
X-Google-Smtp-Source: AGHT+IFSsIoqsVrOVwk5VqvA/2SIH6BZKHjU96VbI5Tfhan7NUjhqokIhx4f7tecjAIif5yQbhliEw==
X-Received: by 2002:a05:6000:25c5:b0:3b8:d22d:a8ad with SMTP id ffacd0b85a97d-3b8f415a367mr7225532f8f.3.1754582104349;
        Thu, 07 Aug 2025 08:55:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458bbf91b69sm124250855e9.3.2025.08.07.08.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 08:55:03 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:55:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Mosberger-Tang <davidm@egauge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Stein <alexander.stein@mailbox.org>,
	Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: host: max3421-hcd: Fix error pointer dereference in
 probe cleanup
Message-ID: <aJTMVAPtRe5H6jug@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kthread_run() function returns error pointers so the
max3421_hcd->spi_thread pointer can be either error pointers or NULL.
Check for both before dereferencing it.

Fixes: 05dfa5c9bc37 ("usb: host: max3421-hcd: fix "spi_rd8" uses dynamic stack allocation warning")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/host/max3421-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index dcf31a592f5d..4b5f03f683f7 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1916,7 +1916,7 @@ max3421_probe(struct spi_device *spi)
 	if (hcd) {
 		kfree(max3421_hcd->tx);
 		kfree(max3421_hcd->rx);
-		if (max3421_hcd->spi_thread)
+		if (!IS_ERR_OR_NULL(max3421_hcd->spi_thread))
 			kthread_stop(max3421_hcd->spi_thread);
 		usb_put_hcd(hcd);
 	}
-- 
2.47.2


