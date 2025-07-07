Return-Path: <linux-usb+bounces-25537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D46AFB1A7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 12:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CE371AA1DDF
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 10:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33C6298CC7;
	Mon,  7 Jul 2025 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B9YiDcXN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B4293C4E
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 10:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885434; cv=none; b=fHD2afLvxZD8jncpOSPaZn1VL9euvo0TFDxdzgr6OP/1LFXdC71+IkR7GXMZsKa2Jzp6zGPlb1V/fAu67IFmsI8tO1yHrRLZTt04C2BuVAK5vkfCn5HMaZHh0NDejqiutq5ljP528XVmq4tRObmChGj//m4eE3kkMKF5XDZZMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885434; c=relaxed/simple;
	bh=0ejtn/WsAdu8/bRGN8lGTqyLp6aNab/l8r0UIDaJZLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0BtEXvFBO16xNgtC2/s9Dc5Ysq9BGQsYixRk6AJ6eSdgnpx6Rz3q10lsdLbdjRdvOWlmGftqvXHKb2tWAL8JY93L1LAeOALrn6Fxclc4kdoqO/WE9VfAnl+mNzRBUPoHHDxp3eeLkjmqkjPfEpEul6NUHRm6dS5cILGCLqPiFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B9YiDcXN; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so8859496a12.1
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 03:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885431; x=1752490231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=To9SF34aS4i0BpQPLo3eZUpW7msBUJxPRVHnQ22RqWQ=;
        b=B9YiDcXNxoWKZQ39S8bJna3xdCELJQ9tp/M9raXJlBYd3wwQ5ShI3E+BbfI5mz0VOe
         YmjGEXUNZvEw0fO4CjdcWanIo5prNfhuxo7+b+oESvvCcIz0HzinrGoI/HVDE/yrO/jh
         ifMS9DvsQVf4qCd4oTxWTFXApSL+5rr7E0Q9ldcksqSE9Sa2uWMc9jLmrYBAw+ixMQF8
         QhROdZoH0qbVDaGrDknEfivHpCGE67pyENGQcWmSJ207zl/HbugQHOGA634qSk03q6sN
         la4L9KnyCw7Fm4IUzKxFldiZtTmhWYAqxqNUZG04tU90Uu15sZcrg1qJ50EJPdStX/hR
         AyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885431; x=1752490231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To9SF34aS4i0BpQPLo3eZUpW7msBUJxPRVHnQ22RqWQ=;
        b=JtTLLOlENXqE2qzwdIz1SG+ig4LCgJzVoeBlCWp+a5UYb3rgXm3fKuJJx0TxzXRtqK
         ozMqYtfE6jJCeOTwYaDhlhE8ECgn6sId3fV3GSOQNeUiI1sAtfq+OFl6PCnDHu4gRcZP
         WiZvgrvSM5LIRknZF4GEGl2g0Al+ADRZPgfeVCxoXFHCTCescGt2rN+qRi8dtydpXBp2
         r9MaLm6IwchwHZj1yIMRjIvDo3upHADN0naTmorD4RKncSl9VY43rFnopWEnJ2lf6DO8
         qx62U+OsI6lBhG9NMCU9o25m8r8UL3Kgexip3C9qnxHVcuTFMhgi+WlRiBjoEC88YWci
         8mfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMGDPSpFR5qd2uwl8IFJdCSL2IFiys+Q7fPBOMirOTy/kPCPYmHz8bFJzNtuZVVNVWFdAKlyzhz1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6QtLaR2cGIpQ1nl67/cicQxD5PmSVkqZP+iu3dgHJT8fA4d8K
	5KwCcA1q68U3qxr1BRidkWOizLhfpNUQpEyz5vCYuhUVG5RKjz8joGi4yzDd6k9ju8A=
X-Gm-Gg: ASbGncsAmRZt/OV2VAc+b1hswKxO7Ebcr18hNoWwJYc/qzMCnHoKZfcpVEfM27IIh4t
	90SdYl9yGhZUzyD2qKx13g8UV+8vfEWG5Jh1mH+eVjzyko6qcqPDdteQym7sgH/Y3xULgZwD4YW
	4eLBtshHjY5U7xGlJ0nb0aAhsqZJU2a0iXXjVw8MMmr/CUzJ90VjJ0Yja50VyUXMQ8NpUiSnBYZ
	wMft74k2GpbXpMG+JQTNhX7JA8VHBXIu7YuJOIk9y6TINiYHDHgH0VsUWS7Xd4pWZurh9z7zszV
	w1eEvJnwaNaN/Dzs30ItOWToMNPcmtWbr+US9zfa8a7wJhLKZnFffSUWYsrbjk5h0GlrknzBknN
	g7omsrmNNA7eA1HvKT4h5ZezoNLCg8yfF249gNEdSSQQ8lg==
X-Google-Smtp-Source: AGHT+IHuTERPtfX9ZxhMI8bdy4IEV9JRuXfWgu6DrnqQP+XIU9KVQIJ7ZbpjMDmPQKH3cH7nuN9IQQ==
X-Received: by 2002:a17:906:c4c1:b0:ae3:6dc7:1ac3 with SMTP id a640c23a62f3a-ae3f82d647fmr955742666b.15.1751885430854;
        Mon, 07 Jul 2025 03:50:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 11:50:27 +0100
Subject: [PATCH 1/3] usb: typec: tcpm/tcpci_maxim: fix irq wake usage
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-max77759-irq-wake-v1-1-d367f633e4bc@linaro.org>
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

This driver calls enable_irq_wake() during probe() unconditionally, and
never issues the required corresponding disable_irq_wake() to disable
hardware interrupt wakeup signals.

Additionally, whether or not a device should wake-up the system is
meant to be a policy decision based on sysfs (.../power/wakeup) in the
first place.

Update the driver to use the standard approach to enable/disable IRQ
wake during the suspend/resume callbacks. This solves both issues
described above.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 46 ++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index b5a5ed40faea9cfcceef5550263968148646eb44..ff3604be79da73ca5acff7b5b2434c116ed12ef8 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -421,21 +421,6 @@ static irqreturn_t max_tcpci_isr(int irq, void *dev_id)
 	return IRQ_WAKE_THREAD;
 }
 
-static int max_tcpci_init_alert(struct max_tcpci_chip *chip, struct i2c_client *client)
-{
-	int ret;
-
-	ret = devm_request_threaded_irq(chip->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
-					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
-					chip);
-
-	if (ret < 0)
-		return ret;
-
-	enable_irq_wake(client->irq);
-	return 0;
-}
-
 static int max_tcpci_start_toggling(struct tcpci *tcpci, struct tcpci_data *tdata,
 				    enum typec_cc_status cc)
 {
@@ -532,7 +517,9 @@ static int max_tcpci_probe(struct i2c_client *client)
 
 	chip->port = tcpci_get_tcpm_port(chip->tcpci);
 
-	ret = max_tcpci_init_alert(chip, client);
+	ret = devm_request_threaded_irq(&client->dev, client->irq, max_tcpci_isr, max_tcpci_irq,
+					(IRQF_TRIGGER_LOW | IRQF_ONESHOT), dev_name(chip->dev),
+					chip);
 	if (ret < 0)
 		return dev_err_probe(&client->dev, ret,
 				     "IRQ initialization failed\n");
@@ -544,6 +531,32 @@ static int max_tcpci_probe(struct i2c_client *client)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int max_tcpci_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret = 0;
+
+	if (client->irq && device_may_wakeup(dev))
+		ret = disable_irq_wake(client->irq);
+
+	return ret;
+}
+
+static int max_tcpci_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	int ret = 0;
+
+	if (client->irq && device_may_wakeup(dev))
+		ret = enable_irq_wake(client->irq);
+
+	return ret;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(max_tcpci_pm_ops, max_tcpci_suspend, max_tcpci_resume);
+
 static const struct i2c_device_id max_tcpci_id[] = {
 	{ "maxtcpc" },
 	{ }
@@ -562,6 +575,7 @@ static struct i2c_driver max_tcpci_i2c_driver = {
 	.driver = {
 		.name = "maxtcpc",
 		.of_match_table = of_match_ptr(max_tcpci_of_match),
+		.pm = &max_tcpci_pm_ops,
 	},
 	.probe = max_tcpci_probe,
 	.id_table = max_tcpci_id,

-- 
2.50.0.727.gbf7dc18ff4-goog


