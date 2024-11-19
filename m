Return-Path: <linux-usb+bounces-17705-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A809D1DE9
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 03:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 157D6B20C66
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 02:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494442E406;
	Tue, 19 Nov 2024 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k94sGCZ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDC93FF1
	for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731981833; cv=none; b=Poi2h/fOrONBs9UE/TJqa1mHrKFBx4WJ8ZwDwBO8dQrLdYXDuVBU0TSvqJhQoIWZzFV2Wayz2VsxSIW4T1jS5TO8ag185aIvvR5ktqDuvqV24fQMWlmA+yOB9EFtjQOsZSAHSKa8Jaf0084klaUjKVl2Mqq2U+CM7km4avpThls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731981833; c=relaxed/simple;
	bh=hMn4Hqr1bGqU8PzrIfAz5Vks9qRNHipYHIDPqOKqwAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LvTR0lxsyOe/NXvkOYL3fYTLSJ7n6urQo8koakdhHfxlyVrhLxkv8xVCWLRDogxCusqiwMLvELmpP5pYGS6gwEJ+Vx+e4s40W27lztO1jhKiYBPbalTU0nHL0X3WSgeNrhhK/HWWb9tthsjccRZAQK0XmPf6a9wt+lHCxwqNLp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k94sGCZ5; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e383bbcef9dso387847276.3
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 18:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731981831; x=1732586631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ax0dvY9oUglv+4j5DYFBVornrMHtQLVkgbG3kphnP0Q=;
        b=k94sGCZ524KweFohfPJDl360rJaeN/1chOLgLl3V07JZ6bWppEFbXepv0luGZ5demT
         xSgQ0U2UIwkGGZTP6BIcvxSRmCAbfTbuX0IQKN5waOyJ6YdyTkWvCyEWRs/HouDGRGth
         PLk56ZZRY3vyfYre1A3WONtY39QTBz18atf898w5O/miwM3gaH12i46b3EolOz9ExFwz
         wX3nDWAfGNX8w9sETIxfYgnGirqGAmK8CL7vlXsZ5I4OF+h1RyAv+5lNDBgV789wcdgp
         OlHLUwh1egIn97wizBuO9DeFU5waVLwfKINu4JTXtoToqUirDxfNxykwrVtDP5N9sqv4
         Df4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731981831; x=1732586631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ax0dvY9oUglv+4j5DYFBVornrMHtQLVkgbG3kphnP0Q=;
        b=s3+7ssXSmEfVTXjPp+bpRUHq0MiG5U/b6C3mDAflqoOIWY4NOi11C30jjDkM6nGM2S
         woNTdIfX9TY2d5TsjOzO2kPhMiEWXVnhRyNuKI+4UsyGS7QL32wnZboib5O0l4MQV+yz
         iV4wn6kIzKeNClSKCwvXKiMPAanJGU6sJxeO3q3LSiMRsZNyBVAkvSsWJZWytAEZaok7
         qXDgba0pgnG62gp8x1hMMa+JISIdHMw6X+qajW5xMDhXOeUxdIxbQS80tjk7iwGjfBuf
         C8yR0Vle5xpPMGM9rqnERT4Fcueo54ci8Bf4I14Er6mi6z0Jya37cYYqUNNVUgkJiT7z
         O/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVje9oydUeB/fy+hNyu+FTRLbNOGojf14oZirNKJPTWW3NGZEq+BM1/+QBJRoWYinglnW9Ks/DwLlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YylV85jkIhhdjmFulxVcYCibBRUpTPDphQYCo4XWrR3kbBSlxU6
	QJDbGoGWEdf7bU/K0gGzsPGTbQmlI5nt28bWvOgtRd6SH3GaNC6XZb40Il0ZsVY=
X-Google-Smtp-Source: AGHT+IGhAYQf8LRbXV79WxQOcdnXqecZV/qeeG4Kqr5dtrCtN0QOpV14krWw/eCzx1GhUKicEOO+rA==
X-Received: by 2002:a05:6902:120b:b0:e29:5540:7f85 with SMTP id 3f1490d57ef6-e3825d34f4emr11111845276.1.1731981831319;
        Mon, 18 Nov 2024 18:03:51 -0800 (PST)
Received: from x13.localdomain (syn-142-197-128-048.res.spectrum.com. [142.197.128.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-856dfe039f8sm1185748241.33.2024.11.18.18.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 18:03:49 -0800 (PST)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-usb@vger.kernel.org
Subject: [PATCH] Documentation: usb: dwc3: add missing doc for sg
Date: Mon, 18 Nov 2024 21:03:41 -0500
Message-ID: <20241119020345.30663-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates the documentation for the dwc3_request struct to
describe the purpose of the sg field. This field is a pointer to a
scatter-gather list used for managing memory buffers in DMA
operations during USB transfers.

- Add description for 'sg' in the doc block for dwc3_request

This change resolves a documentation warning related to the missing
description for this field.

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ee73789326bc..a53e6e14f27d 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -941,6 +941,7 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
+ * @sg: pointer to the sg for this request
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
  * @remaining: amount of data remaining
-- 
2.47.0


