Return-Path: <linux-usb+bounces-10920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 250BA8FD4E6
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 20:03:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E981F24D12
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2024 18:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E09B195F1F;
	Wed,  5 Jun 2024 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xh8vf0dA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE7195B31
	for <linux-usb@vger.kernel.org>; Wed,  5 Jun 2024 18:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610433; cv=none; b=O9jnrrlGnKQvE4C9m39M/WC7qL4Smd/PP1MswA/m/T012lRtyiG+JF3a4Q3WT226usSTQmgpUNVke8nfVtfYIrt0QysnVYfoJuG+o3X4SxsDSMIMT6hikBdPja+ZEnKolYOqGoA3HhWQ1UrbSkEEn6OHlM9Muw4N+yjNxVmMgVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610433; c=relaxed/simple;
	bh=7YntdTNu7aMZ5zLGGRpR3JsfAB0rBOtanC3KQe4XBYY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gdJehf0c2kLwYEosKVvKC3M4s1Tv8/e0el3g5YIN8eAayg59qfvK2d4D8y9JvWNltMj3x6mnffS1CieHM5sS8qiQstj+pVAU6PbY5cm5xZ9LU7rVDkW3pM7tfX9zDapMPYtIMV1adAmmSRx/D1g4jit9nD3AVLF0UgZGziVsO08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xh8vf0dA; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-62a1e9807c0so743487b3.0
        for <linux-usb@vger.kernel.org>; Wed, 05 Jun 2024 11:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610430; x=1718215230; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=xh8vf0dA+TFlUnkkazIa6Em6KzJbbntuGamI4Gn8Wj1jFYYx5ZYFkn2tA0alpWg68u
         9jhNXfx2DxL9m7tqmgthqmC1rUSflk24zLEIHrstf3mW39EvFDR2FeelUhLsupY30DEi
         /gVZrfJA0Slzv9rEogcUVgXiY8hLFc0E46E+FUZ/X8hWU6PYTTTOsgDQPMK44rgcyi4X
         g7UTGxktSZ/IcwoGFDfvWXQYzCbWyLYks/FVJWCMOKozF5JwJ5koJWgZ7381pzPo2fKz
         JwnKZftDOTv9WkuxVVV5rBvZHglYy9BQThw/il2JbfCMaxHpHsqQPdwDUsOxRCnGKcAo
         B5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610430; x=1718215230;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GabZAVwK9FSl0VODpa0rRnhc7Hb5WIAFsUpyNY/Jkgw=;
        b=p8txXxp7Txz/AjwpYrlrJWpIjKDVyydDNfqjXqUzKFc5UsmLgJs5kmlsGuvkToMLkR
         AybFbRW3hTc3jF5qN/NXpab2trNnXzaHfJwn8IcMP4JOww5q1KWEFRcsTWY2QPMbPSi7
         XTnTYZ1nNcOuQ8qOUxL4D6KO3PF5Z/SPrt1780QfuAuyqKmyISBIe9rejCREDWwh9+FH
         7dMCeYvTLgVUDhr6hbT5hhWg1xiMpffjpHlkl8TFm1jTKqSjML20WMn2siChA5JQ1TOT
         Y7DZ9UWLyyF1QOg9hJzI5kf9Bi8wpMXlyKPxuCdlSUQFtbUyTCSi5XxO0NvO0IaKa7py
         z9QQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2hR66iauLffyR5+AeNNVApGgXWoUP0qgBXfNg+OyIxwcOHnII+lnzi0Q6u0gtmMjdHm+gEh+xyjIwTdbZCQFi5HwYNgoq/LdY
X-Gm-Message-State: AOJu0YyI1AOt9uon48rN4lBedbnxlFyHUpLjoOZT7ajSBcM0/3EX//JU
	CkN/76fHbmnsiY/3egBEkomqMspsaBE8jTFniRJXYzXxcNYdqCP0TBJ8b/gGoGqDj3oyPx6H23D
	oneDrR1IFFg==
X-Google-Smtp-Source: AGHT+IEja+GLVOpS7V2U0r8IR9Z9ZB6nAf9rPU6225JSB7wTRYk1qUU4QFIkeBtYF/8VHx1IHDowrDp0WPzcZg==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a0d:d952:0:b0:627:de82:8077 with SMTP id
 00721157ae682-62cc709af05mr798057b3.2.1717610430440; Wed, 05 Jun 2024
 11:00:30 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:51 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-8-joychakr@google.com>
Subject: [PATCH v1 07/17] misc: eeprom: at25: Change nvmem reg_read/write
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
 drivers/misc/eeprom/at25.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index 595ceb9a7126..73d60f80aea8 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -74,8 +74,8 @@ struct at25_data {
 
 #define	io_limit	PAGE_SIZE	/* bytes */
 
-static int at25_ee_read(void *priv, unsigned int offset,
-			void *val, size_t count)
+static ssize_t at25_ee_read(void *priv, unsigned int offset,
+			    void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	char *buf = val;
@@ -147,7 +147,7 @@ static int at25_ee_read(void *priv, unsigned int offset,
 
 	dev_dbg(&at25->spi->dev, "read %zu bytes at %d\n",
 		count, offset);
-	return 0;
+	return count;
 }
 
 /* Read extra registers as ID or serial number */
@@ -195,10 +195,11 @@ static struct attribute *sernum_attrs[] = {
 };
 ATTRIBUTE_GROUPS(sernum);
 
-static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
+static ssize_t at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 {
 	struct at25_data *at25 = priv;
 	size_t maxsz = spi_max_transfer_size(at25->spi);
+	size_t bytes_written = count;
 	const char *buf = val;
 	int			status = 0;
 	unsigned		buf_size;
@@ -313,7 +314,7 @@ static int at25_ee_write(void *priv, unsigned int off, void *val, size_t count)
 	mutex_unlock(&at25->lock);
 
 	kfree(bounce);
-	return status;
+	return status < 0 ? status : bytes_written;
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.45.1.467.gbab1589fc0-goog


