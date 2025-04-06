Return-Path: <linux-usb+bounces-22613-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2289AA7D065
	for <lists+linux-usb@lfdr.de>; Sun,  6 Apr 2025 22:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC20B188C490
	for <lists+linux-usb@lfdr.de>; Sun,  6 Apr 2025 20:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113341B4223;
	Sun,  6 Apr 2025 20:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mi6iQWY8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53161A4F0A
	for <linux-usb@vger.kernel.org>; Sun,  6 Apr 2025 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743972059; cv=none; b=uXNMBIPdikJvSZHPVvvNparbJ/6ykXQEZDTYqUJTE+cuvTZwfr5rW8enzUGC9rdJxk+k1ntidzfOanQ9g6wTk8cCSb0VPgs1lWeS310VCf9poRbdzdzDqDYcnHA61jcvlCdIr6ilhiu2jZdFV9JIp4Qd5vsEHYsUCLrJckdO0uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743972059; c=relaxed/simple;
	bh=lVCMtD03NGUi1+3/wJh+B38jb8GdFNhjnbe4ZG93O9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kPdIyR8c5rNw+9bMPArm52gnMu46p07yYDTCdYngjA4ErhbPNXmdAdtsU93KwWwhFaygarhpsEFqhWSwiPgKdpSfGcLvCQcmCWkh6nSIu5/sjB2/POXGEmJ+y/sGqT5AatSJSpVq4zs9xxKfFoiDuqOgZUKqlR2mQk1FELFSYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mi6iQWY8; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39973c72e8cso402980f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 06 Apr 2025 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743972056; x=1744576856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qeCppP+Rln/Mksz9KnQhz7mwwvDX1H3vv1ZRST/ETI=;
        b=Mi6iQWY8q55B5rRkT1abuFZHlxllVQD1ddO1cqxeMI5PyQX9hfq8sPsEfQm0c02Kb2
         GwPoS+XG3RKpu+S+C/asg3hSWIF/rZxeQ+UxBtxiu3cxWD+lWZ4A9OAwz+/vS4MiAwgH
         YmLG5pz2KglwOvPVonPal7GTiKgNzoJi9PvEedlPYyDBrMjiHo/nHdJdTUUIn4rDqa/v
         5DOhriO0aoLehljlYYfUKS7A+RBjvsNIh7qkoCrJw/C5ueagdF/IfohzbapjE/Zq26cM
         Ww/LaokW/uQ29ZKpgOp60yUfUpXBQc3/nkkK98bPu4cAOHrdSE72+LcWhrXnXBr7sCQR
         qmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743972056; x=1744576856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qeCppP+Rln/Mksz9KnQhz7mwwvDX1H3vv1ZRST/ETI=;
        b=VilQOcW4jp5tWD/EaeWM6gaJzmESaAP1C75jCrXicwpbum2Yp6O8NuHa/EvEhuZSQv
         GNC3dT7B2F1rdF8+fpb6mO9yqsEoXi1tOFZ95pfufrELPECO/B/bU15X7sYUypqrdMdC
         AWJNFfRC2L1nzMVRJ2cEV/bKfAm7lQkoRn7OE4uokjNA7wrf0Gy/IoclZKPaqmMvXWf5
         BPgzdOoCjpuR+INoYGqpVdU8H/amscDd1NzaFJr7fCKq7hMhhZhSPJPfZoddEO406olC
         2iyyxzv6fp6QQdSbtKnLKo2L3n8g1K1Nbv2iCUkDwAFPmQET46BTS/NW+gcKcOS71gG/
         THCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8pRMwAJJHshIfXn+u8ARn5di8ZYr3kXlh6ctkAROpbCUE2lPlY57RKUEAwFdYmP6sCySW+CSRPwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbjPUqk5S6qzoyGaWXMMrApnrUA4QVtws0H9ZVYeP6weuxnr5M
	dnV/YYSoJqNJe1+Sa8rZQZF+c1BMKvrLOYl4uOnliHEt5qwZz+IKLm8H5Vy23RFNfZ+X+zaen+i
	9
X-Gm-Gg: ASbGncuNgxA1Ni7RPAtljMYA1bWlMQcGQDGFnayZya2eHGtXnRL7PCgv6+HaFMiRpvy
	XnB2cbl0C8tQrDZxI9b06c7YxEmNs4YvvSY0CP2lgVT/SWn0bF7EwJNqY0W0cZk4PVGbDbWzsD8
	O8/jgtLu/4ZoWy+9VaILIWt9oyBZih9fnVxY2xid8vGay3Aq+ztP200Z1bJLb3c+bEnasPgsvLO
	9vqDpxpGbDTU1SRT6YILpRzH8a2D1NsX097LMXvcSCmaVbbL9iCHusvxlRi710umRdf/tLZVrXH
	Fwy4jDLmzV5C4mhxbsGSLQvFaxuhGAgM157LCXCGawtu2AjDbHAGRA==
X-Google-Smtp-Source: AGHT+IFALjZG6RCT3tgEKFB/Q+s6vxmhQDm88jfmYRNHOnoIoO4cH/esD9rNMVN3x+CCKt0zFAUyCQ==
X-Received: by 2002:a05:6000:4009:b0:39c:1258:17d5 with SMTP id ffacd0b85a97d-39cba940fbemr3160203f8f.14.1743972056151;
        Sun, 06 Apr 2025 13:40:56 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0dbesm113167335e9.33.2025.04.06.13.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:40:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] usb: typec: tipd: Fix wakeup source leaks on device unbind
Date: Sun,  6 Apr 2025 22:40:51 +0200
Message-ID: <20250406204051.63446-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
References: <20250406204051.63446-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/typec/tipd/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 7ee721a877c1..dcf141ada078 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1431,7 +1431,7 @@ static int tps6598x_probe(struct i2c_client *client)
 
 	tps->wakeup = device_property_read_bool(tps->dev, "wakeup-source");
 	if (tps->wakeup && client->irq) {
-		device_init_wakeup(&client->dev, true);
+		devm_device_init_wakeup(&client->dev);
 		enable_irq_wake(client->irq);
 	}
 
-- 
2.45.2


