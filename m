Return-Path: <linux-usb+bounces-25539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2AAFB1AC
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 12:51:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A93533B01F5
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 10:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915FF29A9C9;
	Mon,  7 Jul 2025 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo0V5/uK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4C29614F
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885436; cv=none; b=GajTErOCzDybPquLGuFXfM4Mn0dm8hshr3SHJ19U0LRXhTUL7RUnJU5xL3y4vM4z8ZTkCkz8oUKXdtJMf9IL/C1SNrXyNa+KMYRMVIpHyDw4qfko/OTKXjC6TGzOfZApsV0v3xVv6m96hTNCqO2rXKzkBjmTkqRwQfMAde2Oa34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885436; c=relaxed/simple;
	bh=0DjKBEEYRbVy4AQeYlNr37VxbcA1nPmfYINGRxp0EWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQbQa/8Lq/rVXSixEcrfsqQdwQBCsvOEDgO31SKyyY8H13NDiEsZmSuysikcUmK5JGdwJGIBV2XarpMcCjUvxm/H/6o/vkWOwVrWcf/NENMjabyoY9UO54JCsohCb6BNuJYa775xb1YdRqfEWVl+sIkcwvWzpcHfdnluo8voTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo0V5/uK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so5164070a12.2
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885433; x=1752490233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0Uhf9cokxwTL0c2ydgWGzKYaoyMWc7a0121SK5qMwA=;
        b=Qo0V5/uKxwkrRwOdKq7OurPUP3WxYLYRA9fAsn0HL2g0/qCLXYS/+8cq+C1Eiqvr89
         Lcme7YYj/zq2yiy0Sq7OlqDcbvd5HpaaDGXC5obaPPXw6AUBOm73Z2A5GkQvNxxfvyzi
         Q7+2O6AZARp8ybodC3yAg5pH7v1EV2NKjRSqCEWCeSsOXPe+uNX9HHwRI8lv84hFGL4+
         eeI9p4/SRYJlooFV9Cr3oZeYZpArQhvBhyKZZQA3B1q6LYhoPPccxznVQ/MGoect6EAJ
         it7eXo5DBofBc3RYH9dNX9PpW/NOxbSFQJxkYbZmYC9GgAS0UzYRgeerFAUERLDVm26Z
         XfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885433; x=1752490233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0Uhf9cokxwTL0c2ydgWGzKYaoyMWc7a0121SK5qMwA=;
        b=XjhwbSpHZmwleZYbsDT2Tk1pCBhVRpKW2YdLE6SsqUuEEzsB/Wa5NfvTea+IMBeG8x
         DyN7UzfmIvQH6iyf1NUVhJzsmFNIwoYjuSOYspH6G0YSmUj6xSwYVdDcfxrfz3Foim+8
         X9Nae/djWKYG3hCt02BQTFEGYToTvtAIgvpP1qi9fxC772pQOFUV2WTn0u/iVarHUPcQ
         qoy8SbSRsncCXrqbEkAz5jRh/VheHkTMc//YR3X5N13faQT36BP3HMwZcgbjhbO9KL+e
         zTJcidjcTgY5uZapxRlNNvuRDQvWmaLOutmExb1Xcdz1M+Hd8c1R2wL0IsYwMZZl2o0+
         ApfA==
X-Forwarded-Encrypted: i=1; AJvYcCXw6EskU4Wm2Q5SwwAi3I7A9UnKZtp7rXK3amjO/nCRbow5hy0KfZOKROel8vcDeMx6II53+iWGgmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLBt3L+gaUrUhA3KSMaCk+QuB7JQoihhPJCsAb5K2i+nYdDGvk
	/bVVPuYFv3GvdV7J2er2ELGyxDo9OI2pJzjnwTOfh2b2V+0VP9u9PUvoAW0R4Pdy6gA=
X-Gm-Gg: ASbGnctZ05v4qCKswLY6+xxrDEBdGagOlVdZYhQQeG/+Qp+efcUgBVNUdOyKKnqzrZl
	C/yM6IHYcC1hK4qxkNbw1oQD2ZXm9tC8fcD6rLyagLdV7kIVFORglWqrWy9Mf0/C7DL2N1dv9qO
	AJ/rBAEORIFcECW2tulNkvOFv/3b4hszwJ6//9g9FMc9sccmNmCIZPUtku7W4laCpaSLV0NwRc2
	5S2bv6Vm90Q8z+OfVR8B9jutFWNkFLSOM6rJK5VQ9h3PNEWot+utQMLTTDDQNpLVfLhDemRqhP6
	bKm6bQBXL3A+yte2ChmRs2yUrhJAE8ghfN9pCRpN4tT5AiLbFxX/V+M7VjkWO+9FLgnYiXjrEFW
	uvQK+oR6/3tilQnOCMLfZFFFXB3mAa3AZfbS91uVl2bM7NA==
X-Google-Smtp-Source: AGHT+IEnDjsO6opm22lwjQu/Rj7KamWYfLbMulTjzO/UV9wnDWne15HveaE9d9M6MYNJffXab6eCtg==
X-Received: by 2002:a17:906:6a0a:b0:ad5:a121:6ebc with SMTP id a640c23a62f3a-ae3fb98bdcbmr1157384666b.0.1751885432641;
        Mon, 07 Jul 2025 03:50:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 11:50:29 +0100
Subject: [PATCH 3/3] usb: typec: tcpm/tcpci_maxim: enable
 PROBE_PREFER_ASYNCHRONOUS
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-max77759-irq-wake-v1-3-d367f633e4bc@linaro.org>
References: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
In-Reply-To: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This driver works fine with asynchronous probe.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 43b0ec2d12ba6d4c1cfccbfd355af3e5d9ce1385..19f63865079658fb2a446dc390262d141b940e9a 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -572,6 +572,7 @@ MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
 static struct i2c_driver max_tcpci_i2c_driver = {
 	.driver = {
 		.name = "maxtcpc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = max_tcpci_of_match,
 		.pm = &max_tcpci_pm_ops,
 	},

-- 
2.50.0.727.gbf7dc18ff4-goog


