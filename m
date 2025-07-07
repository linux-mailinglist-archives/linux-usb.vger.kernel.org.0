Return-Path: <linux-usb+bounces-25538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F576AFB1A9
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 12:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95AC94A024F
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 10:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925B8299A85;
	Mon,  7 Jul 2025 10:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HZwDFYQ3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E288294A04
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885435; cv=none; b=eNMrzswnrYhnEuKLKeJdtm0XravgYJByStjHWFQchSD29lwWvX3tSn6zDhuwpnY3WW620ukPJAfUG5rmajUUxsTvBZqLohhRnQnJ7zLILuMHN+pWnREnqwe6/ji1A8uSG21jACY/YEYaQAuSPJn4EKjgnbViKn0SpW7QgA4EoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885435; c=relaxed/simple;
	bh=f6i3i5yqRzws9iEfuTWm2a3G03ei3huQGN4PJbNVgAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IwwUzRN2Uamdc0tkrhaZ6uY0RaH1Dvy7k6DlYH0CTGHeMzVbnt8QVMC140CTVGoK785/5ARZdjd+cKoI48UXVhRQsdzPaS+nXx5SOumk6RHBp4HYO6YTeRIBnxnk7U1KjnhmS5gl1rprf+tS/W1RLwBuQ+QTO4jix2UzAIamUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HZwDFYQ3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso548250166b.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885432; x=1752490232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmCQIDMl3v8IIoZAnKy/Am2NKK0HhNDDyZu+VQQ/3mU=;
        b=HZwDFYQ3y38jOH8ihcN5aMMntZ2e9QHzCLs5Ew333X7KeeHvLeDEJYAIMtf0kvm4pa
         oNekMHVMnrLBv2dvTJy9fUSN8vofHe9ft6xdLqs4C1Mn4C08RpUBawaxf+3yc2Vgs0RG
         as/x+PQdFqE7PrxA4pdM30i+rj1sALM0jNNXfgVgHx2o1ABi+msjr6WqsgoFTwIvNzQG
         RR5ItprPKF66kBQ8BjVOA3WRP3EWiT+I25Ulm2tLBiGfco8Q2lSrCEvy5eT3c3tbTnby
         ZwG0B/7IlJz1YBybI+FQPZAuQqnjkXNJ18+x/kNrKMTD1fEQ9Uw/Ozrn+2er7ZjXglrS
         QTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885432; x=1752490232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmCQIDMl3v8IIoZAnKy/Am2NKK0HhNDDyZu+VQQ/3mU=;
        b=F5LKmOX0TLt02V4SfE3QqfckWwZmIjsRKrxj9c0ldeDZ0lfQeai3HApgu+JfpGXHpH
         7vbr78WR31NXswuv4GZ/qv4CkpGU+iCQ80EbosgOGdN5cCPn1lTjaxIFjcXol/9O3uQd
         xTYeUkhlK6+Cr3ronIhh63jN+R6b3IvAaJLTAjl2S1Pg26OzlmQ1orZqm356zEzC1tYG
         6Ah7ORP8BiewB0fb3nhHkaZkSpVo9cc3MLQnVdWIBTAHmYXAX73HS9HsZinz/s37COHn
         cZrE9sOGkZq3UDGNNLmsoNyAebqjZXneYSWahZPFPhjA7HrrQaGfleJAJW3k6NNRNsQk
         uTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa0FDNGZq328CVpjilQDx9oYyEuggsr3eGHTVtDJ3AqTbtcIvxUKB2iyp6cScfCZ0t6F7WXg2s8bg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9+e3WrvM5rOwGE+Bae3VvT3FVxdo3rwfNkCCGuWC6g3PHDVa
	GPDOS0YK1uWr/TpNtmI9RGyJFUTVPlY+EqMN/3AXD7mPRO18AVkiEIWDctmI9vsYVLI=
X-Gm-Gg: ASbGncvT5TnBpc5/TPwad1BFFfG9zK41P8HoaFAxbaNlL8e8HL4eyVA6yABRWXLzZNx
	q1VU8LGWSKhO03ooEDUTs5J0vX9Vmd9bzKwTyL4ukXc3z42AZq6VhHGveDoLP7rRkPj6eZFynrz
	IAR/ciWextDGznzDW6VW8VLVTALFZv5We8ttsbgtjoOMo1ZShCE1VadQrXuOawkHy4BCeOH5Hcj
	w2R9DEdwnQFE3pcj/84f492BAaBma+wQiw0lejb8O0VU9zmYLmZjeRuRdsXUQ9AyZt3o76tOsOK
	36lA1y+nUYqLUTEup4sGYrwIHeRtApELa5j1epuWYahxGHe+BbWKas8/XfrXySyJvEP53Cu6OdR
	MbX8vHDIPOACZsKVeBNE20kbN7z5PrUSX0DphUueKfLoXbg==
X-Google-Smtp-Source: AGHT+IGav+c60s5uFQX92fVHVquRrewtlteZVCzy6shSwbVRNxJROcWW4Okroq5etS3QTlQNkZXc8A==
X-Received: by 2002:a17:907:a4c4:b0:ae4:123a:7fe3 with SMTP id a640c23a62f3a-ae4123a84f0mr721352866b.20.1751885431658;
        Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 11:50:28 +0100
Subject: [PATCH 2/3] usb: typec: tcpm/tcpci_maxim: drop CONFIG_OF
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-max77759-irq-wake-v1-2-d367f633e4bc@linaro.org>
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

The general recommendation is to not use of_match_ptr() or CONFIG_OF
ifdef.

Drop them.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index ff3604be79da73ca5acff7b5b2434c116ed12ef8..43b0ec2d12ba6d4c1cfccbfd355af3e5d9ce1385 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -563,18 +563,16 @@ static const struct i2c_device_id max_tcpci_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id max_tcpci_of_match[] = {
 	{ .compatible = "maxim,max33359", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
-#endif
 
 static struct i2c_driver max_tcpci_i2c_driver = {
 	.driver = {
 		.name = "maxtcpc",
-		.of_match_table = of_match_ptr(max_tcpci_of_match),
+		.of_match_table = max_tcpci_of_match,
 		.pm = &max_tcpci_pm_ops,
 	},
 	.probe = max_tcpci_probe,

-- 
2.50.0.727.gbf7dc18ff4-goog


