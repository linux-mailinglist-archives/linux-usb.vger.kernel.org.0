Return-Path: <linux-usb+bounces-19534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E35A16905
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 10:17:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CAC13A66DF
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 09:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8661B21BA;
	Mon, 20 Jan 2025 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fW47E8gJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F501AE005
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364617; cv=none; b=RmdukdtGpJiSOMlzgHZdRyTFtty+RcDc7SlyFem7eTj/XXDpHoCpUjKodvOfkFt2dBRh0D2eOL6DloXpf/EUlii0H1DVyHTbWjGYTO1cedRaiMzn8IK1oGtigtmf6UYJ2YskYDk/M6C+RixGGLkjhp2UzyZLiZ/3JC5No83+C5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364617; c=relaxed/simple;
	bh=HA9jbb7sf9FEcEGIypHqxSqTIh49BbritadiThhm0/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bpb7P9smn+WLR0zSzNDPbkmarOYpSSKYYkAas4rba3ETQm4XO39SPtzTXf0rWd+BFmJjMtI59eI0VWF+KiixdEPwK0hgnOcM1EmQ4mb76hWZv5lZY52rK6mvsyS+pNuixNDky989sbe9rdwd9cnr5dM6IAJTuDr3lI/POBtIMnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fW47E8gJ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5439e331cceso2504926e87.1
        for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 01:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737364612; x=1737969412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GKui2+m9IAjivOenJXop0/jshpzhAnhINNH8CjefO4=;
        b=fW47E8gJrbu75xEBc8eokaJvjYzQjUPKJuuZprGEFqoheYDv3pAwR+fWvNDUDHUfoC
         FqtiVFe2gAhJgBp38Fv9nKVAWA8+UfCh98+6/UWFGgU3mTF7Y5Yvm1sxKXzAWuZaP0ot
         SdAAPKkudqmadJxfnbYwiBmGOSu7jkRNQCtF5bwHFwPasFroG75p+P6IaAP+VMkrDh7g
         9R5bzNWWHQ+kEH3wPHEIwqxdXw1j86xWX8owo4cdQwJrvgW1o/ZDd4qiid4YRl8i4Uhj
         V83XgIFKqhblGfCvG0NgHZjBk0uykGLkWwlT2HOtl/mWIYGHtOrjIGPCgSjGCbJ/WgbV
         mi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364612; x=1737969412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GKui2+m9IAjivOenJXop0/jshpzhAnhINNH8CjefO4=;
        b=QglUj7BUB2YirGOGLkzuMyg/eWZrr1/YLH88eGWLktmCpmtQ5ieW6aw9El4MPRdISv
         zszZxi2zWryD+/uNeUGK3NX4SkenzfqsP4+V6lRb3wKqnRoQNrmhkGigSXbQLd3A+WRc
         y/Gxv2/9QSvZ7qCKJzpP9WQVsP48xc7HNd7ckE0l4opeXgu9P74xzjPeKsPvLt7v1zwm
         Yf7YzpYVpsQlSgECWUnsxXV0O4L4BVfRQ0BfREBTZEtJlk9mY3/v0UI8LhfXT9qmTqoG
         hRPskSzoAmEMzcCwhG/Bj0Rbm/X93owCvtUgsBUlBghnrIpMnMGMp9KChpLfyIHP1K9h
         bZww==
X-Gm-Message-State: AOJu0YyEZauE+gOgksRaohzGMc3rc3dljzRDwiL9YfrsfzjhbTqcahX6
	appy5GY7dfH6vrDf7sE1kY8lpUFnFBMAB7C1jHcNroF8ns3VHQqFCMpYmCdbLjQ=
X-Gm-Gg: ASbGnctP30gt+EWa50gKpubbjmmjZhpW0w8aoWtAwY+zUXYp/G92XnsVxsf5ulJ1Cvc
	mtHULAL5lwv8uIU2MFBVQt2PSOqvG+L5HJjxf0PGHeQBDz5ClEmCOURziceGVpz+juJEYVNMzNF
	EVP9CoHeoMYmn14ukHJ9O/bWXWYL9qTR0FFj4EKXc1XWAo5frapp6m7OB1vT6CQ8g11F9DmUsGq
	9/nWFTr7hu4A43LAczcw9lzP+CLfbK/fwh9j6zXKxMKVu9tyHIEWvOTQL/su1+5Vtw4/aEkqm93
	3w==
X-Google-Smtp-Source: AGHT+IEa+n48Uv8t7RWPHQjoPF7/uY9Me0OAnRXFnlzYDS/J3Z3bAwwUyNmzVAbCCcuLCA7BppNsgw==
X-Received: by 2002:a05:6512:1292:b0:540:353a:df90 with SMTP id 2adb3069b0e04-5439c27b46fmr6101201e87.43.1737364612359;
        Mon, 20 Jan 2025 01:16:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af729ccsm1223639e87.188.2025.01.20.01.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:16:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 Jan 2025 11:16:45 +0200
Subject: [PATCH v2 3/3] usb: typec: ucsi: acpi: move LG Gram quirk to
 ucsi_gram_sync_control()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-ucsi-merge-commands-v2-3-462a1ec22ecc@linaro.org>
References: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
In-Reply-To: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HA9jbb7sf9FEcEGIypHqxSqTIh49BbritadiThhm0/8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qfSI2su+Gqz+s52fYmVh9LvO5UFPbs+pmW6LpnHW/vJ
 s8PX/qwk9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATKa5l/5/Cs59voqLUp+fy
 fdev7andLbhGevMP7dbef+y1F2wOVnXoxrP5JRzg3vZSgen1K9XvWl82Nj5TWyJbHsEckzE7sy6
 fNY+pY2JwwTzvpCVPqp2PHZlkv7cgIu+OTXy3g8FDrzrWp5PnVn8NqZo6yX1+1fuFd9nP6tTdSu
 8M5006NyP8s3Rgz1+W1OmRnWl7l8RPuaCxztf62Z63LYV6V/1sY41l3Xnl5DQel1150NXf6fF/2
 6sVDSscBGNnSUmtPmT1m7HiTGq8SMb39R/+tijxHHt+cat+fnr4kYj3cXue80cs2uGuIX8ijT3e
 tOJCUoDlwR2zQovrrbftcryhYv/ifoDdU25uK0a+k49jAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It is easier to keep all command-specific quirks in a single place. Move
them to ucsi_gram_sync_control() as the code now allows us to return
modified messages data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 30 +++++++++---------------------
 1 file changed, 9 insertions(+), 21 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 8b02082201ec5b85031472563b8b8d1eea6134de..ada5d0d21ee6fb1f406b6a8b8466bc71ffdb5b46 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -99,17 +99,23 @@ static const struct ucsi_operations ucsi_acpi_ops = {
 	.async_control = ucsi_acpi_async_control
 };
 
-static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_len)
+static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
+				  void *val, size_t len)
 {
 	u16 bogus_change = UCSI_CONSTAT_POWER_LEVEL_CHANGE |
 			   UCSI_CONSTAT_PDOS_CHANGE;
 	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
 	int ret;
 
-	ret = ucsi_acpi_read_message_in(ucsi, val, val_len);
+	ret = ucsi_sync_control_common(ucsi, command, cci, val, len);
 	if (ret < 0)
 		return ret;
 
+	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_PDOS &&
+	    ua->cmd & UCSI_GET_PDOS_PARTNER_PDO(1) &&
+	    ua->cmd & UCSI_GET_PDOS_SRC_PDOS)
+		ua->check_bogus_event = true;
+
 	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_CONNECTOR_STATUS &&
 	    ua->check_bogus_event) {
 		/* Clear the bogus change */
@@ -122,28 +128,10 @@ static int ucsi_gram_read_message_in(struct ucsi *ucsi, void *val, size_t val_le
 	return ret;
 }
 
-static int ucsi_gram_sync_control(struct ucsi *ucsi, u64 command, u32 *cci,
-				  void *data, size_t size)
-{
-	struct ucsi_acpi *ua = ucsi_get_drvdata(ucsi);
-	int ret;
-
-	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
-	if (ret < 0)
-		return ret;
-
-	if (UCSI_COMMAND(ua->cmd) == UCSI_GET_PDOS &&
-	    ua->cmd & UCSI_GET_PDOS_PARTNER_PDO(1) &&
-	    ua->cmd & UCSI_GET_PDOS_SRC_PDOS)
-		ua->check_bogus_event = true;
-
-	return ret;
-}
-
 static const struct ucsi_operations ucsi_gram_ops = {
 	.read_version = ucsi_acpi_read_version,
 	.read_cci = ucsi_acpi_read_cci,
-	.read_message_in = ucsi_gram_read_message_in,
+	.read_message_in = ucsi_acpi_read_message_in,
 	.sync_control = ucsi_gram_sync_control,
 	.async_control = ucsi_acpi_async_control
 };

-- 
2.39.5


