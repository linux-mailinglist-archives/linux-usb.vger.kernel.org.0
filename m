Return-Path: <linux-usb+bounces-7847-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1EA878E4E
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 06:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 659F81F22839
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 05:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65123CF79;
	Tue, 12 Mar 2024 05:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF/OPg7g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266F22DF84
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 05:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222976; cv=none; b=Yrrt3yyLWtTuOOGYJWxK24A/N9YhgJqK3+bqujEZc5tP/Zi8l1bScvx1kkVHlEfEQLwBWpywb0Oy7JW2Kd3123jBiYwMy84a8catHYq+w+LKmctuFylQJhqGIOnWJdQepJosgyBHLX6hQvqQAirwtqF4EKdlX5VK7gMgQ8X2ntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222976; c=relaxed/simple;
	bh=jvySCg8KzME4AwDmlR1Ld67nFxe5EkiMe5MIIk+sHws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T+losNwY8Yx+ueOtHG5N1QSKKLc77oy24QQSz0OcqSXw4bToXUgtIHrX3Nhl1CWOWoUzhL0KhIbq4AjxodZ1FhmT9ORMHhKBgR4WoCfAKEZIoc26QqAU02Fb7TlKAKItFaqOaLOpsDqxCQg6CsmpTT+bhSlF0JMxFLZDq3IIsuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF/OPg7g; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e5c0be115aso3352194b3a.3
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 22:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222974; x=1710827774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5maZ1JX1BnhIFhkLqq8OYrtHrSjOUVxGgN6MCqRapwA=;
        b=hF/OPg7gYhhsFomq//jTc7DoAgYnajRZgucYnTUSSZg5RlvckeWG+TvNQX/y59B28a
         gtXsm9EQm/2sjoZkqZjAA+ipmA0Q592ZcneBalmrAVMUUJn+WOMNj/tJZOpMERnFkr7K
         Z7CbquUnQ4bBy9/tUYlxMsC1FpBjV7T8+6Ax9cgm9oSN0JVOoOhZ3sqkII6tOxRVig06
         /npBCRcJy49UxsDkDnKk2PfTdRKE9IXqyyE3zgLdXDBNUUfpD0GlgVfTYz8XO5q1dwyQ
         9awyHVmPA2oRSqlkMOPkti6WHvy/7t82Q7q+QaW6C9cWlYWGCkm6qQsR75J7Uy5GOUoZ
         Rj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222974; x=1710827774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5maZ1JX1BnhIFhkLqq8OYrtHrSjOUVxGgN6MCqRapwA=;
        b=E0PqD2VZL3bU0Pnnc7UmDSi9n9u/7qxRVI0wv+tv3W3tx2DErejH5q5oO0tAgL18y3
         hwXbJ1IoZN6RdOnHkMXkfrmxRur+kUEQVd2EKW33FNZEwyEGlcaHcFCERFfO2YR3bbPl
         wycFrAl1MiF2xN4/c8r73/kl9zWCdYFXtbLsqLHQH8Vtajxtu19I1CO+8HiLuUxOhcqP
         NqXnaZzUd/ZXJC73UbaDmN7IHMLgOOoTLu4NJDJsT6SRDEEIEdfbDt/2msGMu/tzXMNK
         IWwnroAnw9q+gBLsh9kRANSw3oq2fvauvpVk9TdZWcwC4TxOYpVA/Gk364hC+MTab6Dd
         ESZw==
X-Forwarded-Encrypted: i=1; AJvYcCUXeeL9GYPe0ITeLEWN8ZbdzJy8NDEznxMApvNNrM3KmU/7GmzAxVa2Lnh9WKElnz/4kqrSFEXAiAyS/maD1h7hJGgmY5S4jWR2
X-Gm-Message-State: AOJu0Yzf4+DVyx8aDCrmPpv13WVfs3Zd3NyNuMCQ5t0/Czmm0fjO8sYV
	vPWRgQkw8RkDe2rrgBfIrkvKWgJAiVZFklCmdxZBt38sdDDGbQbQ
X-Google-Smtp-Source: AGHT+IFeixIj/6ZApVN7QghFofefeV2nTX75kgv7UVu6seIP6knRYZGe+R6oGfsTbMkffLD63D8WGw==
X-Received: by 2002:a05:6a00:130e:b0:6e6:270a:9303 with SMTP id j14-20020a056a00130e00b006e6270a9303mr7983048pfu.32.1710222974446;
        Mon, 11 Mar 2024 22:56:14 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::d95])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b006e65720e892sm5448898pfp.94.2024.03.11.22.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:56:14 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 4/7] usb: misc: uss720: point pp->dev to usbdev->dev
Date: Mon, 11 Mar 2024 23:50:29 -0600
Message-ID: <20240312055350.205878-4-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312055350.205878-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This avoids a "fix this legacy no-device port driver" warning.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index fadceb7ab34d..be7d3fa4c150 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -720,6 +720,7 @@ static int uss720_probe(struct usb_interface *intf,
 	priv->pp = pp;
 	pp->private_data = priv;
 	pp->modes = PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_ECP | PARPORT_MODE_COMPAT;
+	pp->dev = &usbdev->dev;
 
 	/* set the USS720 control register to manual mode, no ECP compression, enable all ints */
 	set_1284_register(pp, 7, 0x00, GFP_KERNEL);
-- 
2.44.0


