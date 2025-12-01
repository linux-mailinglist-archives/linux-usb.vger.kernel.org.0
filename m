Return-Path: <linux-usb+bounces-31078-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E824C990EA
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 21:38:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9EC93A549C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 20:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC86287265;
	Mon,  1 Dec 2025 20:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVtTLUZS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1DF285C8D
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 20:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764621463; cv=none; b=GpdjX6P1jdO3p4XZC3tnneOl/ptw0Bck6UafL2jP7+0uopRzVatnd6IzAwu2+Pj/fV3hfk4yE4tZMwLuR+UtLlOx5DVWkZCGX/pfc/YEvmjnv7nCo/C44obbfqw1V4mPVmNLaYV5Oo7tFn+RBNmWJNx1FPw/5tvNZzm7YL3Hi3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764621463; c=relaxed/simple;
	bh=HV83Y8jNILcsVoeAeEISwDwWVyNwvsbim/+VE/epq9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pw4fmnh0UyHAwMK8CKTJ8u4o796qz6WtJZLWpaFIerUw+s0Pnb3q66oiTRLsUU+4nZsL95TEiOFqBQMVnjda2lCf5Yhrcm37jxojTcsxmGVESAHuGn7hPgXDrY+gsc8GGZt89EKdPUTgfVubV4/6kGLXAlJvQHOo6+H/lledoxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVtTLUZS; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343dfb673a8so4403012a91.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 12:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764621461; x=1765226261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMFinDzf12DskrYWTn3hquLiDv906s1+ITYvei0aZ1A=;
        b=LVtTLUZSUJDTvgC2Hgv+/8+gVPy9qkmXTM+UoyKwMXCD/BcqAL48R6CKA8kkvh9Sj/
         5wc2OFQ+UcvkWxSCkUlsJbHCszTYtFxweZJkCIwwPCpl9uXZfhaxODgL5MlMM7zvnKU/
         4JxffxF1DP6F1smTuMUPi5xZRMhREBMS7wBqD9zwxSvfALX5LQLg4ZgZ9KEKQWyZEvCR
         EjUmlvuoQHY6bvfikIPQ6blHa8W6Q9A4BlJakUKIEynN1r0GpMIFBHi8DDpDelz3QH9J
         blvkpDFLxuioNpB9Ygp9XLjqk7rljZYUWAvm+2+m4xBOU/HHKj66tzLFAROjSeWhl0xw
         7gpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764621461; x=1765226261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HMFinDzf12DskrYWTn3hquLiDv906s1+ITYvei0aZ1A=;
        b=v0zP9UPRFE7kfGXfB0itI+/jv7bb+hzDQQH7TxgZerWhSD5+OireM3t71WKN9GNBw8
         KRJS+/KDjDhMLYDksIInQtn/P8racBDXdIxg4LzJKfoIcAVssVdM6+rWwESL4tcilGNT
         cNkcV9/KlinUuNyOHa/McZA7GBDRrTZ4k4E/fQzrUh3jfgB4us39P3jtwkSQgjSdDZ0d
         5NFqYyJdkUTqv6F73vJKMF+6W5DcLEF8+ztWnuRaKkVdBM8HPpxu8VjCcyFGNgE29qt6
         YkYjQjQgdt241DhQ0Ft/TnOlm4e/0wMCS/N3zvog4/mEp5Xsf8Y8cCvJbaYuXCbWk4Q5
         W25Q==
X-Gm-Message-State: AOJu0YxiSHqLuSo+8BOethWAfLALsf4AAfQw3pWYxHbByfojHQCGg5Va
	US04n4bKFsBPTqAulrNExAkOqrTK8v6cxlo/gDOtlHwcTjepolw30SUT
X-Gm-Gg: ASbGncvZvtiB3FjeOB5HVu5LuB3lU6+6lyjY5GB61keEA1L0cDJE5ZWqaX0Dis0TVsa
	NV21FUokE6tlfkK7SrrDoNg5OtWikIAErgBs9PElWppJ+v5eZVvLNXM09Zmfrmx40iedHrtvWRu
	I+CLyd+YPLfmMtHRX9MME61n0MM7bfbE/+CmEQ7kKNqaR1dnDbckAvohE/L9sSb3TaZ4KLKNJA8
	Gh/LavYjrltU1ibWSGAopJ8bUm7G3sGbs+IkxX1iWMXIYk/BQ0K6IxuRpHNvo1XznsGp4Bw+5gr
	Rgvz5WZaRxY0D9LW+W5Q7ZmkkgY3Vew2zkH/qv70lquN+gm/KbOOJcs6Zl27EWI/8K+YNScPGCs
	+D4qwIMNGFwrPxDb0+P0CY5RGM6S3cVUj6knQezbufPHo4bdLTZQtkuTinLV/hQ7yMegpCjN6+V
	UwjaEdoHMYdK4XiIIUdz4zKf3y+WgnkzsPLlM=
X-Google-Smtp-Source: AGHT+IGy5roLh99dzfWSGIMY/TD3KRw3HUxv9eVTSnT6FUeNG1+/rruLpyAViKSztrwT/rheUxgTHw==
X-Received: by 2002:a17:90b:534e:b0:341:a9e7:e5f9 with SMTP id 98e67ed59e1d1-34733d76c4dmr34752993a91.0.1764621461476;
        Mon, 01 Dec 2025 12:37:41 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.177.250])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fb248be1sm13113892a12.3.2025.12.01.12.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:37:41 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH v2 4/6] usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
Date: Tue,  2 Dec 2025 02:07:13 +0530
Message-ID: <20251201203715.17768-5-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201203715.17768-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
 <20251201203715.17768-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'sizeof(*ptr)' instead of 'sizeof *ptr' to follow kernel coding style.
This improves readability and maintains consistency across the code.
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index e4124838e..cbf9dbf2a 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1258,7 +1258,7 @@ static int dummy_urb_enqueue(
 	unsigned long	flags;
 	int		rc;
 
-	urbp = kmalloc(sizeof *urbp, mem_flags);
+	urbp = kmalloc(sizeof(*urbp), mem_flags);
 	if (!urbp)
 		return -ENOMEM;
 	urbp->urb = urb;
@@ -2066,7 +2066,7 @@ static struct {
 static inline void
 ss_hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_SS_HUB;
 	desc->bDescLength = 12;
 	desc->wHubCharacteristics = cpu_to_le16(
@@ -2079,7 +2079,7 @@ ss_hub_descriptor(struct usb_hub_descriptor *desc)
 
 static inline void hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_HUB;
 	desc->bDescLength = 9;
 	desc->wHubCharacteristics = cpu_to_le16(
-- 
2.43.0


