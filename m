Return-Path: <linux-usb+bounces-10916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175188FD4C1
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 20:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 191B31C243E4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 18:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE6F154C09;
	Wed,  5 Jun 2024 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yNqgUmHy"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB366154C02
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610418; cv=none; b=WShMzAX19dQ8JoMGJPy0vrPO79aIISSV1h7GG/vFvs+VsMC4I0WITrzKR1XFTLIHyPrtglXRwZccn8LEwi/uwfuE3EDlzOYjvxJEO9Miez4ESGqX75YqZZee9mYAy53qTmEOTcscvEDtiR/b1JZ648Mj+3nJcesqMOQ6xv7G/yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610418; c=relaxed/simple;
	bh=fPdJt4Gydxsb6XLYSRdNJ8hD/W3THq9fKXubquLZs6s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eh5+gqLBYBe1cNwK7TL78TmKXfzONMLB2V0AHIoVGDkPWqU08PctkNLrpt/Y9nG82yxpYjwmgHZSXpbFGgGb4wwJPiThDUZjR57W0vQwYvajbIOX6gb5TnHXQysXEEPPTHWkwZ10B8MaNpZZ7tFABy0p7Imcl9QUEVWciX+QqW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yNqgUmHy; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-62a0eb1c809so264907b3.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2024 11:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610414; x=1718215214; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=yNqgUmHy2UkDE3heRRb8oMaXmLeLXyM1i27wFJS/QU6flgxbWEI6TZ7da1x1XjqPQO
         VlQ19oRwmx0Yd/blYB/OvER0B5Y/49RGI6us/PAl60yjXA5+o8wOy5hEfj5ZadolRbK+
         XWIHPanx9sQPLs2/5sl8VyvI7v9OkxWCYCvKJqd4BWY60BaRMym9Ck/ROACMI/JPScoo
         WSekErhgKeJiiUPjrxf3KdbGf6pBiF0a1bGCPfBXHONpv8wSDHUMAThTTzKivKWkB3ub
         bbsqHW9iPJwiorjZWv1Xw6UL52JrjCEQWpvC3xexXC3j6MNOu7OViZQDgdh4MDbEtTMU
         WmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610414; x=1718215214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qvmsbFq1f0xb8qTUeLHIrwaOpt4YNpx3HYdX4+QrPhA=;
        b=uvSnCbQttxivPx7hOgWUkIAOl6VfJlpCwRP+G/OWcWEbd6pYWkf7591OvXsmqV18WH
         O5GQlpGa1anCWI2zgQ5W7UJudNUtbHzgrnIcyAFuaa8Y9FaX1V9FtJdIbmFhcyc5sa14
         5z2LwQo8qoAIY0U+NAVyHPynTsoyd3JdsblljEgCktiv++KLTGaRDHDwio1YTeRhI5nU
         Khxjq36Awticzp9mzdJCs+++BBux51UkVapzETIvp9HW3p7JnqPhHBxdy3HHyttHTZGa
         qfG7nIIn73lCT6A5/Pu81LTcOD3X4zEZUWsiQ7MTDOqt1cYx8I2wwEkdmESNlv/fiqDg
         FpQg==
X-Forwarded-Encrypted: i=1; AJvYcCVKL2lG+vRUav1BSY9Ppz6bITu6XrhMxH1fkkpwaLbGJp0sft6EJKQDkncRFGKeVaKcqJLoTYM4w2Ud7QHeY5aYsCZrgdGy5QVZ
X-Gm-Message-State: AOJu0YwlLFolXzs6wkWq9rCaSp1GULwZRl39H71B7euRBzutYJtazbTK
	0LJUONhn7X+NUn+iZ8DLorrxcjODc8X7FRxvOpSL07biNLMOl9tGL8VAATceIze0/kTCE5cD3dc
	TtK+/3G886w==
X-Google-Smtp-Source: AGHT+IHixjuOYQ1InGCAjmo87JHH7BxdpNaY95UBwdRBHB8eZTSP6/tJXCeai8kdlzm5GsjEUY/q6O3hk54taA==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a05:690c:6688:b0:622:cd7d:fec4 with SMTP
 id 00721157ae682-62cbb5e6bc6mr8437267b3.9.1717610413829; Wed, 05 Jun 2024
 11:00:13 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:47 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-4-joychakr@google.com>
Subject: [PATCH v1 03/17] media: i2c: video-i2c: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/media/i2c/video-i2c.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 56dbe07a1c99..2bfc221b5104 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -151,12 +151,15 @@ struct video_i2c_chip {
 	int (*hwmon_init)(struct video_i2c_data *data);
 };
 
-static int mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t mlx90640_nvram_read(void *priv, unsigned int offset, void *val,
+				   size_t bytes)
 {
 	struct video_i2c_data *data = priv;
+	int ret;
+
+	ret = regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
 
-	return regmap_bulk_read(data->regmap, MLX90640_EEPROM_START_ADDR + offset, val, bytes);
+	return ret < 0 ? ret : bytes;
 }
 
 static struct nvmem_config mlx90640_nvram_config = {
-- 
2.45.1.467.gbab1589fc0-goog


