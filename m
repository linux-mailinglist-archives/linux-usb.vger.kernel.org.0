Return-Path: <linux-usb+bounces-18805-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4BA9FC22A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 21:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1B86163473
	for <lists+linux-usb@lfdr.de>; Tue, 24 Dec 2024 20:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B381922C6;
	Tue, 24 Dec 2024 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyrYBHWi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1717996;
	Tue, 24 Dec 2024 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735071554; cv=none; b=GNz8trG7IxombYbnCcWPtIAwUviPWPfYInLMhX0kAgK41bN1gqIbGQ26+j/IQn9d99ahEav6OVBYNlvnW/uL6CADD6JvcjU5JAqlyfOfULTEmE4aev0AYGcWtuEMSUr5BkWxYatZDfqhehEshIryI05912nSwsYXAzg0nIeoXN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735071554; c=relaxed/simple;
	bh=TuNIVl3PXoIT50eNKZBueCyhHY6okHZaiRGLZf+kYlM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HsnbDuDR2M3EnFb+mTz9gX5zUmgT4mIAbj2UwXfUt6wE72WCUxYI8ASF0bA1UeiOHpcgLv9GUR6JVWIS2BrutbNLpyC+Z1MSEH2yisyaYPtJxVy7pcD284uACgHfTbygcPCW6qUm1EAnpzFn3OfoYaD7/nH7nyBsY66KuuNpbYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyrYBHWi; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844e55a981dso203753239f.3;
        Tue, 24 Dec 2024 12:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735071552; x=1735676352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLxiW6uttosq2tj8RPhDlF4NgCbj4+ZM2CMaAqMzkcU=;
        b=TyrYBHWiDlW73JY5RT1qVgDs3Io2i3qKFpFzRahdUh3caVWjIF4hEXVZ4xtQ6EznUw
         QLgf7PT5ZhCdhy0+gLYJxnfEJu42q8oW5wpoWqmcKPO/WMk0UU9b/Bfz3TfE7Mfmjqez
         K8ZqZZwla+zU1QJGc78WX1gOYtwLLMEE7YK4yLClWc1BEFDdDsVkNVV80JgxIlCYF08E
         LtRiDMPAArnI8WopHgqL16wrbeTlh20X5IWCS86IYVpcgbee+0w27mJV/NhTrV2/+nNW
         AR0s+FpkHCGCigG6LRhReF7Saz5iy0/J5pFQT2GnBSEGesZJq/XUT4XpwX177LuMPX5a
         GtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735071552; x=1735676352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLxiW6uttosq2tj8RPhDlF4NgCbj4+ZM2CMaAqMzkcU=;
        b=VDWDeJOartE0PlXaYPNLXAYtPuZ2X2AVn0b1SVTveH/BQ9Ll7nw6triytbem+cTXKW
         FPAnkWCUjbYe4hQX8pubDa+q5kKv/djMqWlevRWX4D6k756f4Ng/xYV+IL8NqlVvLwal
         s9EeQ9Gn/b5YdKDnicflRfm3YpN1bAUu26rvJWkzzLY80infL+lmk85aUhE+5a4+UG1v
         6RUDVy+cOVh0WJmKvrs6th5PJ0oIdEfCEVQepm43hd3MhZ6o/O3tzg0v852G/1ELZWEk
         TyyZJeQAT+h9YpQ/JL4LBgCfS14xCM5+Wvfco1jrONOR8u3JD+rr+7ldmEAM1sf2ytjW
         d4FA==
X-Forwarded-Encrypted: i=1; AJvYcCUiD9cK3eROstnCM1iEyPMad3/aL9xx1TXnAsu7zS3EOzzoZOK4UabzA4qfcFm4oejS8MDDqK1hAylNy1g=@vger.kernel.org, AJvYcCXurFIQ+ZGF0EnXhaShC9pDY7prD21cS3m8pu0Hu5lU1esT7bo4AUNDVUM/6lGi8Itnr6fOUkedhhAZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxAECLMk9/IQkyLeSFvPa+1bbEDRTvOoDS9Z1AlEygymmCKdqnE
	cFkedlLL6rMRPWQ9zZ7deByVJfE0isx52DVREvQxvBVLPbP1W/EmACg8kGa5
X-Gm-Gg: ASbGncvAM58UqOXsM8g5yK3D9Wu57qxC9fUWfnBuOwSWpMjxpBtsrwM4iAYhBNgKjzj
	qEIic+OlcBxzBSUH5LisRJDQ9w+dWxoNrqqZ5cvK8EfLuBa26zXGwKuYu0BNiOaMFGiBAjEhCHk
	oubaSp0T6Nl0moF3YjWTb4IxhYB8xq4b+i5lv7M+UfVRk1qHLinIWA6WglBVBRq8go0p8FWhLOd
	1lcf9a6bDothZOti4pbLJUhJIO/Kp/AV2k/AM25iI2KhFeMpIApfJP1pyA8MAxZCdq/
X-Google-Smtp-Source: AGHT+IGjICabh7lvLFvsvUHqqv6lPmmrIAgzZpddmkw0PFxP8ioAeEqRRfIUoqWXokfom3iheu+iyg==
X-Received: by 2002:a05:6602:1409:b0:83a:ab63:20b with SMTP id ca18e2360f4ac-8499e6070a7mr1889328739f.4.1735071551953;
        Tue, 24 Dec 2024 12:19:11 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8aae0esm273702139f.33.2024.12.24.12.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 12:19:10 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: gregkh@linuxfoundation.org
Cc: u.kleine-koenig@baylibre.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] usb: gadget: m66592-udc: Add check for clk_enable()
Date: Tue, 24 Dec 2024 15:22:17 -0500
Message-Id: <20241224202217.114436-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The APP-Miner reported the missing check.
Add check for the return value of clk_enable() to catch the potential
error.

Fixes: b4822e2317e8 ("usb: gadget: m66592-udc: Convert to use module_platform_driver()")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/usb/gadget/udc/m66592-udc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/m66592-udc.c b/drivers/usb/gadget/udc/m66592-udc.c
index a938b2af0944..bf408476a24c 100644
--- a/drivers/usb/gadget/udc/m66592-udc.c
+++ b/drivers/usb/gadget/udc/m66592-udc.c
@@ -1606,7 +1606,11 @@ static int m66592_probe(struct platform_device *pdev)
 			ret = PTR_ERR(m66592->clk);
 			goto clean_up2;
 		}
-		clk_enable(m66592->clk);
+		ret = clk_enable(m66592->clk);
+		if (ret) {
+			clk_put(m66592->clk);
+			goto clean_up2;
+		}
 	}
 
 	INIT_LIST_HEAD(&m66592->gadget.ep_list);
-- 
2.34.1


