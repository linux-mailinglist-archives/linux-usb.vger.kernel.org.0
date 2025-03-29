Return-Path: <linux-usb+bounces-22308-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A1A753B9
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 01:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2444118919A2
	for <lists+linux-usb@lfdr.de>; Sat, 29 Mar 2025 00:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556995258;
	Sat, 29 Mar 2025 00:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNBbOGo3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED3279C0
	for <linux-usb@vger.kernel.org>; Sat, 29 Mar 2025 00:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743208171; cv=none; b=n87FFc92ziX4WpX6hsx4ab6DCAujMMm9sNsgR4PpmyCm0gYvH37MfX5bi/afKzT3R0MsZiZHcAbEUzamy/T59ejzYWntzS18BkBzczSPuTWBCUkWrsmC8QebrrgxwExlxuVOw+/+mO6kqZopDn2pjzp3FBfEy2n6hPszHfLvozA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743208171; c=relaxed/simple;
	bh=autW8zPawvHdyE1k+hrkSSpl4keY7WQEp2voLp0F63A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=flrjFcJzVwOz/cw3PrFwvIj5glCL744QZEhiVcE4ECool/ly3QMKTJCTyyjwGBUbw1Zdh9Zz7EeXhjYcTmoAvJlbGmeZWoJ6Mb/vSrVYU4xlQNJeBIUeZrHsCDORX8f39G5LfdTU9+Q23Mbgf5n0zBbMwqJ2UfdKojmQLfk+/Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNBbOGo3; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-303a66af07eso3937330a91.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 17:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743208159; x=1743812959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYXL/IJoE9Di2fp4ccVQCgQpgTyRfUoS3TC43hdzJJQ=;
        b=ZNBbOGo3s9ufpFqe+SR8WiLFWLjBIDLoBFqHvtRAKyDqsbK8EJ31dL1qlhkboraQiq
         jYrzi/0DO+rTmRN+CoZxaYpW7RfPExX6YEnZL7beD9Rzj800mkTzIQx/F6REzV4VZ+Py
         AHb/E6isT9G2OlYudvo/n200poemvx4/ykgZoTdlMFYg4C8y6HwUi3aIvrHCWpxx/xuN
         IXjqIxHX7lxOz8Fa9UsdX64R/8IGLOw/EwzD1izvG3L894pnTlbEmgSCnIuhf12JalfW
         ADDBKKIzyNiB0zjGc1n4dws6BRHtEvup+yNIGjTKEAmNX1zX4Ohj0h27C0G3nKHJvuoC
         XbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743208159; x=1743812959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYXL/IJoE9Di2fp4ccVQCgQpgTyRfUoS3TC43hdzJJQ=;
        b=jmB30oAISVFpPKx9RpbO6bicsqdK8lwUOvvRGiJxz+Of4ifSbI4ivbDQLMW6jP7yuJ
         lFXF3VLJng5YgxczfBlFpWE0IIvU15cE4nfm5NcDFlza0IS1GIIL02t8Q1qKvU+LGfZC
         UCL6z47k5QRAcGF+Uiw7n7+mRRSyTFWtiTIzTYH5ozk5WzHJ3Gpl8QWuQ36kXzrfC71f
         Q3oOBeg3Cd5zmX5Ax9XA5Rz077qrV9MquPZWhgR972LvL6uduToAPRB+WxSe1dWutmgg
         CNkDNqEu2/ZlK66glZgXUizaY1MeFpzC0mLYoGKROujtP0G8ffPDBCbfn6fiSrF2I7cx
         vM6Q==
X-Gm-Message-State: AOJu0Yxbbnd1ADeqEeHRkFIuYu724BfLQrpg6rEHYUf2IizWMU5krXXg
	Ugk922s2UsUiyEvaKyoTmhNjeUqDJNwrMWLHSt2gR95mlQpp8i1CyTDRFGHe
X-Gm-Gg: ASbGncunTJvbcG5mOgZZLeQ886HSKJJgcuJRBWvpaTA188xvXmOHWiuSaf17KgPI9Nc
	C+fkBypOJR7GXA+khgspAT297wuOvnhinRGMo7snsba117xSTKvFJaO1uicEcNC8X5CYs4ZZgc0
	gaP7/rUCWJ+KYWk9rOCDOeSUyxXgoCPTdRVa4HUePEV2z4M7YKXkVSJlxxBkSNAFY2bUdWLmqeS
	jjALpd4GU20sziAwhRfpAhBrwehcePQ+SAeonvDDIIEt8jIsyNIGxlUlITw56GR9EAtNKrqkuLY
	S+EJceKQHqg4awznw4wllbPdZ/qRxqQdGvPXItW0flBPeyK2/2oHZta/q2uX19+PxgIxbQ==
X-Google-Smtp-Source: AGHT+IFA2z+X2uC61UN1KJifyXv9jI8e3ROzSjHTCWF6TbJpXqQnAeo9E5gok3I3WbstaxxTgqoAHg==
X-Received: by 2002:a17:90b:134d:b0:2fa:e9b:33b8 with SMTP id 98e67ed59e1d1-305320afaadmr1854600a91.18.1743208159280;
        Fri, 28 Mar 2025 17:29:19 -0700 (PDT)
Received: from henry.localdomain ([36.112.187.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30516d3e535sm2541627a91.1.2025.03.28.17.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 17:29:18 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: linux-usb@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org
Cc: gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] Subject: [PATCH] usb: gadget: aspeed: Add NULL check in the ast_vhub_init_dev
Date: Sat, 29 Mar 2025 08:29:11 +0800
Message-Id: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function ast_vhub_init_dev.

A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.

Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual hub")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/usb/gadget/udc/aspeed-vhub/dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/aspeed-vhub/dev.c b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
index 573109ca5b79..1709a58299a5 100644
--- a/drivers/usb/gadget/udc/aspeed-vhub/dev.c
+++ b/drivers/usb/gadget/udc/aspeed-vhub/dev.c
@@ -545,9 +545,11 @@ int ast_vhub_init_dev(struct ast_vhub *vhub, unsigned int idx)
 	struct device *parent = &vhub->pdev->dev;
 	int rc;
 
+	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx + 1);
+	if (!d->name)
+		return -ENOMEM;
 	d->vhub = vhub;
 	d->index = idx;
-	d->name = devm_kasprintf(parent, GFP_KERNEL, "port%d", idx+1);
 	d->regs = vhub->regs + 0x100 + 0x10 * idx;
 
 	ast_vhub_init_ep0(vhub, &d->ep0, d);
-- 
2.34.1


