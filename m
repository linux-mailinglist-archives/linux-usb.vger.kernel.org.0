Return-Path: <linux-usb+bounces-2268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 812F97D9699
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21B4EB20BBF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 11:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6E018AE4;
	Fri, 27 Oct 2023 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C4b4ed+E"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55CB8489
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 11:28:24 +0000 (UTC)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4CEBF
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 04:28:22 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-778a47bc09aso144899985a.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 04:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698406101; x=1699010901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=79aTCIrVJtcoBzwLf20/gJuTJbHzBwLsnf14+zcK3wI=;
        b=C4b4ed+EGP9C9xcof/uvOuZ+O3Y+c9SwoK6T8jilsL+F4Ne9TdGECiSWXJ/i3xG2m8
         J1vVc8KeWsLRisePskrL6/pTqVHKtPAvMnD9b9deOyd8aCraZ7n82SwbmnKzSD1kgsGJ
         e+t0WW08VgKDszPxiwc7nY16ubH7XnaS2NEXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698406101; x=1699010901;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79aTCIrVJtcoBzwLf20/gJuTJbHzBwLsnf14+zcK3wI=;
        b=gGCuNSr/jPsq1+NOCKcm254RiYkPsrcsdOzIx7f0QNZlhtLVNcNSZRLV6TGkMgYaap
         Wv6gguOM9DKMYFLySG13AwHor7GihdMeOQ0Lz06MPiQt0co4co4vR0PctWGHnYsTsJ98
         jbqH4QEGMxfj77nXl5IkUbPfsji2IXU+reONWqyakdVe+RZ/yVHUQ4ZryuLfK5sgfwjD
         CYMzU2zEBy5e6LvXDm7qlttkecvh9egYthw8xZy5CQuIZHiHzWyWPmIuNyKFg1QXNb4E
         x9r7jNXRVB0Lkpb1o15skriHhe0fVUuCekQQoMoBb84+qsbmQ62oNEoj4jPXabLgoBHE
         QFLg==
X-Gm-Message-State: AOJu0YytxTgiIygxW+s4bhEuPyBp4wuuIiUuigvrYwDOaZdaJRAqg4f9
	OmRUFPd0aYFz3bNJW2WDOdAvug==
X-Google-Smtp-Source: AGHT+IEmv6H40NZs1aVjFDRquDxZP2HXDhl/PlbMGXt/MC9BV/jT5ljNQAAO8Z96v7EKG9tziH0rHw==
X-Received: by 2002:a05:620a:3189:b0:76d:a110:856d with SMTP id bi9-20020a05620a318900b0076da110856dmr2437763qkb.0.1698406101594;
        Fri, 27 Oct 2023 04:28:21 -0700 (PDT)
Received: from denia.c.googlers.com (112.49.199.35.bc.googleusercontent.com. [35.199.49.112])
        by smtp.gmail.com with ESMTPSA id x19-20020ae9e913000000b007770d47c621sm450516qkf.66.2023.10.27.04.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 04:28:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 27 Oct 2023 11:28:20 +0000
Subject: [PATCH v2] usb: dwc3: set the dma max_seg_size
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231026-dwc3-v2-1-1d4fd5c3e067@chromium.org>
X-B4-Tracking: v=1; b=H4sIANOeO2UC/12NQQ6CMBBFr0JmbQ1tEYIr72FYtKXQSaA1U0EN4
 e6OLF2+l5/3N8ie0Ge4FhuQXzFjigzqVIALJo5eYM8MqlRalqoW/ctpMRjXVIOz2ioDPLUme2H
 JRBd4HJdpYvkgP+D7aN875oD5mehzXK3yZ/+qqxRS1JXmdtPIS9veXKA04zKfE43Q7fv+BaQiU
 NGwAAAA
To: Zubin Mithra <zsm@chromium.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.2

Allow devices to have dma operations beyond 4K, and avoid warnings such
as:

DMA-API: dwc3 a600000.usb: mapping sg segment longer than device claims to support [len=86016] [max=65536]

Cc: stable@vger.kernel.org
Fixes: 72246da40f37 ("usb: Introduce DesignWare USB3 DRD Driver")
Reported-by: Zubin Mithra <zsm@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Found while running 
yavta -f YUYV -s 1280x720 -c  /dev/video0

with:

CONFIG_DMA_API_DEBUG=y
---
Changes in v2:
- Add stable tag
- Link to v1: https://lore.kernel.org/r/20231026-dwc3-v1-1-643c74771599@chromium.org
---
 drivers/usb/dwc3/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 343d2570189f..65f73dd8ef47 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1918,6 +1918,8 @@ static int dwc3_probe(struct platform_device *pdev)
 
 	pm_runtime_put(dev);
 
+	dma_set_max_seg_size(dev, UINT_MAX);
+
 	return 0;
 
 err_exit_debugfs:

---
base-commit: 611da07b89fdd53f140d7b33013f255bf0ed8f34
change-id: 20231026-dwc3-fac74fcb3b2a

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


