Return-Path: <linux-usb+bounces-30697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1417C6EDA7
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 487D04F8BD7
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45007368274;
	Wed, 19 Nov 2025 13:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akx/jjmI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676DB366DDA
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557757; cv=none; b=FQ8YUCkwJXWlFeSiFW9WzBXNiO50viPp1Mgbh7B8Y/k3kC7HtlmPpiGqM2Y9mgGBh4LZuK6VVeHlLKbquf/GHm60IJXW/c5E2CFyO7Zv+F976XM0Qdt6r/ew4KGkSp73PT/ROd6C68sV8ByWYKCIf8f+/q4ucIX5QuJzLqHBU1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557757; c=relaxed/simple;
	bh=BKVkqufuiS6rJUzZ9VChnre5rMNCHEX7xtpGlB1yltc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeDGiyRb3EdOxHwcX1fguM2Dh5kXXaUpaKtShfMJ5VhtUPaKcKEn2C8XmbV/K0WrxTReJUm2jUBbwPtzfH4arZrWPJBTQPhUXtn+T/LUrNIKPJ4vkKW3hD0wII+XEkRrmkbxCatdal9YSDnMoo5b5etASq3BS6H/QeKBfXd28NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akx/jjmI; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7510155b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557756; x=1764162556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06GbOV/A6LG+eZBqgimfmJrpsTDcg0URAHnZRQ8sqDY=;
        b=akx/jjmIObGt2pmwYX6DEJKuRfc6qrKUz5VroocRdYjMj7AHnNlUCyH/PdXzxiPN/g
         SC0S3yN2haOqh8qzn6ZdUOcbMG4gpFNGCg6ttFE5WnwoiAccDDfEaGjz/kUR3TSQ39ec
         nB5V8dNCJ0QU/GGU9SSoOJFCFBb3UjLYP21ACekibX8/CiNvo6d7OS0hlliMDAE3XFR9
         WSzByAbnI6psugrwb4JvkP4cHAbRnwm7RiMotfZsW8Yxf8yOXdqEOIdqq7zhy1x1ZrWa
         wV4kUTqRsWXzFHgS5FAWT+ClRfGNeoouZofWzIcwQgmV7Srt8C7ARrUNQi70PwH0p0VP
         sNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557756; x=1764162556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=06GbOV/A6LG+eZBqgimfmJrpsTDcg0URAHnZRQ8sqDY=;
        b=EyYAGs5Th8u1jzHVh0f+et0qRss9NDZ3/F2P/vi78F4aKv58DJCb522NFWXYqpfQ1r
         OZaXutv0ly5sFFgdMMcmCWBZsTeEzKL+gq2T+8+PhB2t1oNJ2DCamHAx1aZPZ52yCzEC
         NxasYF0d58yy7zs/d8k8dE7a9lIEKCAarrib0MfDjE9ECPCx11FJBFblyIG7a79JwsuD
         FNoOx0d7juebQfrc/Fz5oB9l1V2bD4ow3sIMmIBpji956G2U4tpgHqbFYABXVYRZqaeZ
         9jZIErMe4QJsY6w6TidTpgOqo8iRR+1F/aBdsQqP99IVgR/6UEL4cg22+QHmdBHdmKAX
         4x0g==
X-Gm-Message-State: AOJu0Yziv89lIeehAEoIFS+lq+vTMC1VxPDYctWTubn4mMZ0Rizj9f/U
	93rZOBh20S4f3YoHnZmpeRRwTfq/gF10A3NWSP7Mq8Z1nPevog6Eukz1
X-Gm-Gg: ASbGnct1tQhYtCBjJTTMmvX+3M19dCKbnWKslPKSfeL1b2CxPM5GNPaP6AGiPyU1KIp
	wsUOaaUaQ+Z+vw9cbbXvE/m0+0fIMEJhPCBcPYil2w9RRZvYG85LYG4ZbBHn5Fe8KZtYoKSIHtj
	MOFTu2Hx5DuvIsV6yaU+8XRESQfMLGp52pzNjXr3xv8oBkQZV+pPEJiqXSYDE5zVB4qSx+LU1r1
	uPH2UEzL+09swctoWAh67vl3+R37v06g7NVJ/Oc906gzbwGRhcYtdEdouwH70wNLry0RAUztg9Q
	QRcen8fsVp/R0a8h3Z42nQ0vV4CPGZATJI7tbBWA5bG7A2zxWyVIDm3bS/izVSKYIgfkT3Tk5Bz
	x7zCMpJHZJFEzVZEAJD9SlL1CIPXmPeUlp27unwH2a94ZJ4F8GxiZ4W7M4ptmq1IxcWLJeX9e3p
	Es88C8RPSoa0/iGqBHZjAXtp4GGIXvlC3jbZU=
X-Google-Smtp-Source: AGHT+IFqxlxMO3fSMkUnn+NerG4tlfho8+9htOLWbFEUP8jueOACUIoxEhV6KKUoeou9Auwe5Y6Epw==
X-Received: by 2002:a05:6a00:1798:b0:7b9:a3c8:8c3a with SMTP id d2e1a72fcca58-7ba39b3f426mr22579129b3a.7.1763557755625;
        Wed, 19 Nov 2025 05:09:15 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:15 -0800 (PST)
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
Subject: [PATCH 6/8] usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
Date: Wed, 19 Nov 2025 18:38:38 +0530
Message-ID: <20251119130840.14309-7-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 'sizeof(*ptr)' instead of 'sizeof *ptr' to follow kernel coding style.
This improves readability and maintains consistency across the code.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1363de6fe..1840dd822 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1273,7 +1273,7 @@ static int dummy_urb_enqueue(
 	unsigned long	flags;
 	int		rc;
 
-	urbp = kmalloc(sizeof *urbp, mem_flags);
+	urbp = kmalloc(sizeof(*urbp), mem_flags);
 	if (!urbp)
 		return -ENOMEM;
 	urbp->urb = urb;
@@ -2082,7 +2082,7 @@ static struct {
 static inline void
 ss_hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_SS_HUB;
 	desc->bDescLength = 12;
 	desc->wHubCharacteristics = cpu_to_le16(
@@ -2095,7 +2095,7 @@ ss_hub_descriptor(struct usb_hub_descriptor *desc)
 
 static inline void hub_descriptor(struct usb_hub_descriptor *desc)
 {
-	memset(desc, 0, sizeof *desc);
+	memset(desc, 0, sizeof(*desc));
 	desc->bDescriptorType = USB_DT_HUB;
 	desc->bDescLength = 9;
 	desc->wHubCharacteristics = cpu_to_le16(
-- 
2.43.0


