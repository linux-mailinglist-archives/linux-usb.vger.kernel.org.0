Return-Path: <linux-usb+bounces-20402-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A59A2EF32
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 15:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E24141886499
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2025 14:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1755C231A4A;
	Mon, 10 Feb 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b="AK0C4w/K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C3156F53
	for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196410; cv=none; b=PSLxnIq48p+4lIlSD2A29yJPpKZ5CjV1TU2ncI+qWPSpLc6Wkg+w/KX4qlXnmuKd3AuNVgg+BXHSLZIaO693KZRPgmHOH3yPZKihsS+pvuyv8i/GtecpqK9Rk3rQiKf0gSEEpFZrF5bHga1Wk/wd15rkUPNA3JaMjqzBDNtkKrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196410; c=relaxed/simple;
	bh=QwtX1Q7/cA1Pa3oRbNTifUxiyDaCVj+oHpJx8NlDFL8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nkE2hiviZovBuu3JxJUe2o2aOmgNY7rqQSx7qtdOxp3CPW2wnySL9FsY7yd2aIjwYf62PCs6yVkVS3D0MfDVpS6fuSdGInaiPiLy+WamyXoJ/vKLVvjrIdSUNSIXTe8rUtabhkuqamuOaXYHS+iIi3LXKqK3WE9mVS/hbpsGsFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com; spf=pass smtp.mailfrom=oscium.com; dkim=pass (2048-bit key) header.d=oscium-com.20230601.gappssmtp.com header.i=@oscium-com.20230601.gappssmtp.com header.b=AK0C4w/K; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oscium.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscium.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52031ffca74so547071e0c.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2025 06:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oscium-com.20230601.gappssmtp.com; s=20230601; t=1739196408; x=1739801208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GOxpxDY6jk5bMukjYjLqH86TdGuXgrkKanuKTTWk0JM=;
        b=AK0C4w/KEJBEQMd4q0TRwGghPtJbCffwjzSgR9U89B0edHWW69uD5TuKoWNArbpnQk
         62B3VBzZpm+9buxyaUvvmwQ94XVkv3dEeB7bkjjiOV7wXTgCDNclqD0yp8yShJVgmiG+
         ZegT9pkHcHIURhjOBigvrgYZtx9QxuZa+oUWLrZhT2yza0/wAkXJueqnLRVvqo/5PX2u
         HXGWGsIU99lXATq9NN9fHQY1163xZ1EFjixk4Fl5svnobmNxn+aF5yLTuosLN2UjNxTw
         GscJY+Z2PxNNo3ATjUxNl10fSRHkVR4nbn9EGkmCIQdXkoPUI2EFNKv48glZ2Rr2WD/m
         0B9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739196408; x=1739801208;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GOxpxDY6jk5bMukjYjLqH86TdGuXgrkKanuKTTWk0JM=;
        b=ReXzF7TMCnKBqBCYkdrVMaos7kg4O7JY8wt75dNdTQPgBDzs2lB6QC7zv5HJYhZ1FV
         aEYgw7bQ9RbYZbEyBPj2bKKwpPxkAO7h0MXEF/A4KUyvdIkZK/txksdlLK8C+6WiwMCb
         1wKOHNMe6DliwqRaBoZ08iN9irqy89Ui8AKBg6maM0eQX27bUFM89nwacRryjAptCjpL
         a+kqxjF/QUpmBUkFqvHgIVM399eBq3FsZuH1/nHbunFqTCQ/GwjkLrPHyHF/451C4ihr
         tAuDP6FyRw9QKONsZylBUPkAHpzssAXsjrob0BLTrMuintYQHd7a6V8leG2O6sUoqLJ8
         A3lw==
X-Gm-Message-State: AOJu0Yy1sQnLJU8TZSnzzpGoDFfekEJlevJ+ceO/cGkPk5sMbDAcT2gI
	45XWNcIq++oqsnGRsxmFjnjq17Z2uNEk0b8fPwDxzf4S0Igb45n501isX9tQ6x37XtliLVUiFNb
	Otb5VCa5lhrJIwnza1PRK5Hvh3PtnKEVzUR03yA==
X-Gm-Gg: ASbGncuE5VeaK8YsyF8hU2A7NCwcL0KnVbCjr2SxPVML6HGq1rsZoiT1TzbwML/jJHv
	u2WrU5bu22SK/W1orCs/LO5QfY5+eeZ9Go4mIrqjPDg4PaI8Icjes3EIgg+HWo6vC0EVyqYI=
X-Google-Smtp-Source: AGHT+IGpogM99WaNTm+jUxamHSJF7HMPuiwg1UKJqrfML2Hs+vZcAfoXP322C34Lu2/QbaBpch4YGVeEQ41Af2rWxF0=
X-Received: by 2002:a05:6122:91b:b0:518:a261:adca with SMTP id
 71dfb90a1353d-51f2e21564amr7883453e0c.8.1739196406303; Mon, 10 Feb 2025
 06:06:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Lee <matt@oscium.com>
Date: Mon, 10 Feb 2025 08:06:35 -0600
X-Gm-Features: AWEUYZmiUiHNT4tfzIFtvIC6l0yjKpXD75s9JuwObzLmeWxGohpvRFy-Dziy8DA
Message-ID: <CABrMTjfEqJhUyDKX8UvrZOFFFpaoqEM9WM7Jfso09pXYSA7jtA@mail.gmail.com>
Subject: [PATCH 2/2] USB: max3421: Fix scheduling while atomic in max3421_remove()
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, matt@oscium.com
Content-Type: text/plain; charset="UTF-8"

A bug in `max3421_remove()` caused a "scheduling while atomic" crash when
`kthread_stop()` was called while holding a spinlock.

This patch ensures that `kthread_stop()` is called outside the spinlock,
fixing the crash and improving system stability when unloading the driver.

Signed-off-by: Matt Lee <matt@oscium.com>
---
 drivers/usb/host/max3421-hcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index abcdef0..1234567 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1936,11 +1945,10 @@ max3421_remove(struct spi_device *spi)
        usb_remove_hcd(hcd);

        spin_lock_irqsave(&max3421_hcd->lock, flags);
+       spin_unlock_irqrestore(&max3421_hcd->lock, flags);

        kthread_stop(max3421_hcd->spi_thread);

-       spin_unlock_irqrestore(&max3421_hcd->lock, flags);
-
        free_irq(spi->irq, hcd);

        usb_put_hcd(hcd);
-- 
2.34.1

