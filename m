Return-Path: <linux-usb+bounces-18927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53749FF097
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 17:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2512D3A1C12
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF3D19D8BB;
	Tue, 31 Dec 2024 16:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT1WkOar"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE15413CA93;
	Tue, 31 Dec 2024 16:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735661765; cv=none; b=byUV+4lHl9NdVl553K2UjUCunxeYubAbf3eTJJj2sgRxedZNTQCjq9oNif/okekJRZCBeRK2P2KN/TZYdkR+kyngsmLsHL0P0gfCPwxRxJI19KQa1rDGkXWJvsI5M0bnj4L5sercxEXxPaMsSs+hBsxt6hLU1m3X1arrapcoSTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735661765; c=relaxed/simple;
	bh=W4kTj0T2xeb2ObhcKC4lFIIAKhkwPOB0JpHwDkfad94=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YWCJf9apdJL91TSE0r+kiqF4u/tidJzU4HbiLOKTxjCQv89+i2CeX/rLCnoes/yBEL9kA88ZtRT6m+i35/G3l0QyKRN027uOEmSSdSqnXwQ0pbtn7xlC31Sl5B9ZjX0+GCvNC6ccpTXt2aU9A+Kmjk9lGcoOjoJTFpKjHbil1y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT1WkOar; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-218c8aca5f1so166029895ad.0;
        Tue, 31 Dec 2024 08:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735661763; x=1736266563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cT8p5CykmSBP5JnKJjUZ+uruOmwa0xOEMekmu2iPXpI=;
        b=nT1WkOarBFmEHYLh/xigE8ReYzcHpjLIgAgRq1hI4m2uUdDNpc52VXGiHwAOVYVEsF
         MvzwCtPFI+W7LvmMFrG92AC++EZR1Uv0Pz0vSH9os1YBQ+VBobx+B6UEw1TOGUwcpl/Z
         UlBzwvr4Ccv2APQT0WyG4seP7mWx3lieSPhn0gh3waP1iNtQv2zSHmdADE6AlFoGLYkl
         x6dD25p/HXh6jRPM/hifNMyhFQKWAj+8qcpzCRh+lphu8hmFyy4EX5/YsmF5B7nPmSY8
         T/d/oqFa8AUMuxqBcX0iOSY7e+MRVeHiz0LJVyojU3GnzesDDTy4CTkGEUcuESDJt2mX
         tMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735661763; x=1736266563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT8p5CykmSBP5JnKJjUZ+uruOmwa0xOEMekmu2iPXpI=;
        b=XchTtmjzTzj6KJDPLtQ72MCWQm6ZljaW0Gx0Il1tG5Tvk/3CyZPMGwZdvL8Sa5yG0x
         xGnXE5a5d13LRmDCK4vCN+jxf4eUTyfEfTcgVwD106ImYRJ/u5fPvNVB23rocz4AE4Gf
         c2B3JpQiIkS0I5+z9C06059Rhwev3+AzrvIrFuUhNoQ5xZK952fh2mAUqA+f92QypjE6
         xf+hVDOxOSLtKihIZmj2+cWklXtilD11hpO+2PL0ZHLfBln/AEBmbye4TGLJireR6CSK
         TESvRIpwmD4J2w24IQXT/6tUE/bKQWuML4FGtVwX+e/zHFD0dOVGbiR1peMWqBBzd4XS
         eeAA==
X-Forwarded-Encrypted: i=1; AJvYcCVEj7g3IWsDPsWNg7rZVyzpYl+/wH0ScEm5ku7o8qUC0opjMj0N6h1PDrXAIIJf1GFhSMiK5MCYFnNw2e8=@vger.kernel.org, AJvYcCWKVfza/bDkw4FC5JQxwEqHayNHbFrDOj5T9Twq2T5FJje6g26Lp47YNoVsojBV6S1+sZtPpbALhxZQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyISuy1nIyX6GWiEdUOORW02DNtG8X6FZYaMtGmLXyzeIFdbHlv
	8vSaNGlDIfP4dFWs0iuggKk7IgMIpf4fbJUQwLW51Av+by8Woul1
X-Gm-Gg: ASbGnct2pH6rN9UmXSYEb4ym3daBDU6X4WbGzn0OkrGNgIrQMyOMBKx9inrFyqryanm
	1QlHphufO2RTRIghiax8uT9WQ4L2kUeokp5Q1GZT1qSK58Zq351FjhJAS/o/y3wzT5WEgsjdf3l
	AwhAnVzXWmBfYXPoE6hnaJuShAMl/nElbU/59tm4XbGr4Fl7APlLhX2Q0EThF9i/QSeCph0s+ml
	1P8kvyDfRH+Tk/jSuj1TPbmGACYGH11UH3CfoQ4EvmG1ddZnC0NRyOCL7TcyGqqhQ==
X-Google-Smtp-Source: AGHT+IHzuQAOG3BKFuE5/rRfAasR06E+kx8f63s+JPBGg/qqz/MviPzP8iUucJFnqsFPxdO44LCL5w==
X-Received: by 2002:a05:6a21:3a8e:b0:1e0:c6c0:1e08 with SMTP id adf61e73a8af0-1e5e04a0c87mr68107028637.25.1735661763310;
        Tue, 31 Dec 2024 08:16:03 -0800 (PST)
Received: from localhost.localdomain ([221.218.161.56])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72aad90c2e9sm21791083b3a.180.2024.12.31.08.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 08:16:02 -0800 (PST)
From: Xiong Nandi <xndchn@gmail.com>
To: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	Hongren Zheng <i@zenithal.me>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Xiong Nandi <xndchn@gmail.com>,
	linux-usb@vger.kernel.org (open list:USB OVER IP DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] usbip: Fix seqnum sign extension issue in vhci_tx_urb
Date: Wed,  1 Jan 2025 00:15:37 +0800
Message-Id: <20241231161539.20192-2-xndchn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231161539.20192-1-xndchn@gmail.com>
References: <20241231161539.20192-1-xndchn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The atomic_inc_return function returns an int, while priv->seqnum is an
unsigned long. So we must cast the result to u32 to prevent potential
sign extension and size mismatch issues.

Signed-off-by: Xiong Nandi <xndchn@gmail.com>
---
 drivers/usb/usbip/vhci_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
index b03e5021c25b..f3f260e01791 100644
--- a/drivers/usb/usbip/vhci_hcd.c
+++ b/drivers/usb/usbip/vhci_hcd.c
@@ -675,7 +675,7 @@ static void vhci_tx_urb(struct urb *urb, struct vhci_device *vdev)
 
 	spin_lock_irqsave(&vdev->priv_lock, flags);
 
-	priv->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
+	priv->seqnum = (u32)atomic_inc_return(&vhci_hcd->seqnum);
 	if (priv->seqnum == 0xffff)
 		dev_info(&urb->dev->dev, "seqnum max\n");
 
-- 
2.25.1


