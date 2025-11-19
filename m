Return-Path: <linux-usb+bounces-30693-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9E1C6EDA1
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 523894FD1EE
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD68364051;
	Wed, 19 Nov 2025 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhoQX9ej"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B99364031
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557741; cv=none; b=oy4cr1LCLlnRe//Jkg8vlHAOOBfBv6Yjr1IJvaR+27xeZN5YA4N+nWY9RMkMxWxymtJkMrNt7IQ9HmFkZZWNQg/M+ChvuUReV52N6v1DL1sxnL1tgR1u0jpxxo8hKKnBY6JTgivz/mCI+s6xFaVWsQLbApyJlhPPdm5h67UXGjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557741; c=relaxed/simple;
	bh=HTFla0RytuoS9NHA5emWBBtLMkkNBBwOu1BiSS4pxwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPV/TZa3kX+m9wqZE7GVzJyJB56ZJ26FUmF17eVxkcxOuRoCStXpvt2LqTdVH8uK80FslhK08KX+wKJI5PiH9YbSOk9JCtoy2c7eWkCC/BLhD9fidLCOfBi3pmWgYyLN/HoFoXV0YRFrPLdJ46FJbVggE/jcHycQSDOjVwyQADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhoQX9ej; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso5096882b3a.1
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557739; x=1764162539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub7Iycd50pT3ykKqItSRTUhlcBrC3jU3CKZCM97yyEA=;
        b=JhoQX9ejzGr0vnLnLORDi/163r9JrNaGeRLsX8jbm+NDSRJQyxhW1mrDD89eO1bZsr
         QCRlsOKXQYCX2k9W4yUv8u0SWJ5SLmIc4nDM4K4pgm+eRyXQgnOC2J5FwfzCBJ6IiFTx
         D9ZHfqGgbO+n6hgHphgiOBVb6aIAxLBgNTomYHqaMnQYNC4rvYg3sMT+OkPe00+EG7xC
         THbPFLY0kMdUTNJ5T/DGQbcrNMyVSduTDCKmpjuEMhMshKqZin0ur2dg7DIXoJDgUqZj
         fUiZnxiqAIrETf17ZefhRdlFy4zra+HUsZpiQBVOP8ZVxtJBepaSeSsp5/gRKccgXiZ/
         BVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557739; x=1764162539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ub7Iycd50pT3ykKqItSRTUhlcBrC3jU3CKZCM97yyEA=;
        b=e3E/42mq4Eym4HUtONxf4SMplCTDGVe+ro3zUGbf2dFBdboN1aaIEogLy4vgnV0zRX
         NcGjNt9V4FnR/kkwHXt1j9pns3J42RfY4FwjrinccjenPQx918Lctp1JYXGm/8cd78fc
         HrjiUV5d7XNgu44qnBreJOrA5cPimIu41p87R6MXPxV7MsvFprCQyggpiCEFpT/03/we
         QkZv613gKrXnBRTLOJTHCkWtre/YVdg9kmVwqnaF4WOrG5o7NP5huCp3QkbBxB58enSn
         ANxWGZt8wCvQmU2F1EfVslFSoLTRW9nGQnGPqWk7TvQO2Y1O/kfvb7kS2Z7dDs1/Dgxt
         gBcA==
X-Gm-Message-State: AOJu0YyIrfXOaHue/E/YtUwv3kshyR9zlFM22G3acWObCzFq/YxsMfTg
	zGG+QToTaKsY5oSBerD+CEVT6d3ctqw5+AGaUu6QrzVPosl6cy1d4ENl
X-Gm-Gg: ASbGncvw6CbWhRyF69yaCl6KB8pzjMAOIVCdOfJyk5SktgvODa7O5zLLuyAmppSYNVx
	6IGoWMuQj/buNJTOKV1yn8IHbjgqJ16PbUJV5Kj+eK5hxUXcuqFBgf3k8hBpEpYxW0cyV9lGTbS
	1P4laPh3pZQvV34aKYrSsb3Tb08Gb2ROhXvdA7eTmUk14RotUzla0WOkDWucX9A6TFg8Cbt5kyq
	vbEjuTcgOtN6U5KF+NRQD2yXpWLsE6+0gqUH09bj45hcM4i7G2/gdAh8GQEiLB5Q9EiUK4R8viu
	Mqmuj944/fofVyYZL8ytET0+Q8YiNMT8dXwKsCk2O+AfmHBu8U7hv4axpDJfDLcr34ty91O1Qln
	BghXORzhqK8lOXVyXceppQ0KDd5TbIDxa3Kfgsgd/TV/CCeBF3+SoLKZjTOYYHIoCjwlxYCKvOO
	sckniRjlTaVhCm6GwGA6j0WCbx6T8NWIqQuWFyZ8T5ag6nFQ==
X-Google-Smtp-Source: AGHT+IFBSzymvZRKa7zVQvJ0Kbgj1A87hkoMlG2vAmcdFtJqayGd4VFPcDBdtVH9byZ5m9A16dz2ow==
X-Received: by 2002:a05:6a00:148a:b0:77e:8130:fda with SMTP id d2e1a72fcca58-7ba3a6c7879mr22659126b3a.13.1763557738780;
        Wed, 19 Nov 2025 05:08:58 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:08:58 -0800 (PST)
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
Subject: [PATCH 2/8] usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with octal (0444)
Date: Wed, 19 Nov 2025 18:38:34 +0530
Message-ID: <20251119130840.14309-3-clintbgeorge@gmail.com>
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

Replace existing symbolic permissions S_IRUGO (Read-only) with octal
permission 0444. This makes it much easier to read and and is consistent
with the kernel coding style.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 41b7b6907..1369b9613 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -73,11 +73,11 @@ static struct dummy_hcd_module_parameters mod_data = {
 	.is_high_speed = true,
 	.num = 1,
 };
-module_param_named(is_super_speed, mod_data.is_super_speed, bool, S_IRUGO);
+module_param_named(is_super_speed, mod_data.is_super_speed, bool, 0444);
 MODULE_PARM_DESC(is_super_speed, "true to simulate SuperSpeed connection");
-module_param_named(is_high_speed, mod_data.is_high_speed, bool, S_IRUGO);
+module_param_named(is_high_speed, mod_data.is_high_speed, bool, 0444);
 MODULE_PARM_DESC(is_high_speed, "true to simulate HighSpeed connection");
-module_param_named(num, mod_data.num, uint, S_IRUGO);
+module_param_named(num, mod_data.num, uint, 0444);
 MODULE_PARM_DESC(num, "number of emulated controllers");
 /*-------------------------------------------------------------------------*/
 
-- 
2.43.0


