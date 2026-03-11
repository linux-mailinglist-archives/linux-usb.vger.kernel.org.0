Return-Path: <linux-usb+bounces-34589-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UImjHlWIsWnkDAAAu9opvQ
	(envelope-from <linux-usb+bounces-34589-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:20:53 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D142665B8
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 16:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DBF130379C0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 15:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872C13DEFF2;
	Wed, 11 Mar 2026 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="FK6TXYI7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF233DEFFC
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 15:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773242442; cv=none; b=sJVDtcqZosEtjGzPp7cDRhiUXGyRq9Wv7TYyuGRhyed1IQOvxXtoAYhg2Yb0rQDjdYslzdbFXxsokJPQSNLFth3fpTaAayNDTTjozdXpWP5y7cnNJd3E4VCb4JnEDgKKf0LUHgbjCi1EuM5JwGzG97sBvk3YDeoFPGjp32UNpFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773242442; c=relaxed/simple;
	bh=AfOYtrRki/qnAxr8r9Joob/FkUd7mkLtn6bIOe/oUNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tnGEpTgzdrYcc7/aNDuHuI0+X24a/HktUCSboriPemC+Esw5hs9zgpwYY4H2Mo4wznDvlBqW2B/8yrwXeJuZBNlEfUJVVala8th+W1QkXqh4mDHieeGeGiXl3eQodwmegNHpSjfGnt7bNx52xuTZp7/5s9JqPJjUxHh+wONOuTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=FK6TXYI7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-485409ab264so218485e9.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 08:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773242438; x=1773847238; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gS11Ckj4ck0pEfDttwJ19T6tFvT6Bn1Sdx15fOMayU=;
        b=FK6TXYI7JPtNB2w5HWY+swFzUnwlZTE4pKQwoHHZpWOvmkFlfi1o9us4UVWyY5mOQs
         1wX3m+DoPW7+UNFRcXeYSsSk4LjkzQlnD5FjLC/wab19E92bWz6e7konr7c0HOfSnT/Z
         hAgzGnOS9ho56moVS0J8rf5OBtzkTs9VFTNsYu8s5NLq++2gQ5aPmY2hfrKy7zs2eCVS
         oMQe8Bpta7oVA0Y2hUh4l2bMhKs6lZhCepnv2mXBhavQ/DdxTnuOhRoTvHAnGK48es7M
         7EPXLACbMMTg20+Cgr3He9xZ6KQIKAzVEsdpHUrppcQQ9atAlGSdMavHlLCIolqDLjJt
         GvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242438; x=1773847238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gS11Ckj4ck0pEfDttwJ19T6tFvT6Bn1Sdx15fOMayU=;
        b=p4eUdS7VTESWqL9yovWSjhitwpdjg4F30h+oTrFtAGZ79NaOCKmLN0FIz6QM3e8g3Z
         MdqgX7Qn4AG3MJxWB2BE6IW+YozbmUtRw0o8tDQ4h/Ow+/i3RIUifTgh6Ty9CUv9t3hd
         klZ6N8wADhHYFMM1FTBe/QpOcM1nHUEoF420aXQA0/VuzGSYHNl9ytzJnaai1EPZxiSn
         4BEHSOlIpK/5H+9CCaT5hWcs08cJgf0nIgvcxKdK+2hdjTwkJ7Eqyv2NLldvZUhH5v8O
         wqMwNRKFStQEuVaeJMoYy7my5lNvBmPN5z6w1KGSLUK23C/4+4LOUY3KDT0mi4Vz8+mi
         pTuA==
X-Forwarded-Encrypted: i=1; AJvYcCU7Pevrl5AY1rvq0B/PqzGTI5teJyC1t6VokdoTF/eSDjVGZPoXCf+/9nFAaSUCgJAx9NYK7Jpdwu0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NeyO9SFIdNWg0hUk59d2lBsXi0lfsbS1pFi3YvS6OZBjRtru
	bckJLvjwavgwzIE1R+eTI4g7+fVJTUE7q+pqDaqYTC8Q3f8B82LLHN96gQCa7RLOm2c=
X-Gm-Gg: ATEYQzwo9Vro5x5d4fFsHc6BEHk1JvXgE1uTFMq0A+qb8dBIJzc17Pj8zRmV3W+bJAw
	7sbuSoIggvR2sGhXJPxvpb2SoxEUtbcFUu8v1bXm+60KQQs8H9RoOhTicMDuIVf/d6p/9VqrGR5
	p1W5mkcjsNNB3jXY5b/tutuAYBI1ahP+ot9lJ81AROiLNIj42TY4DL2iBo2a+A/sc7qmraUTFM1
	Fg5mgzgAmUTCEMI0dAiXkRug07mvbjeqBEvkkqst8PhiqGOrSjjz4GSo99KZXnnlO8Hi2XuhCTp
	2EPlZhUjhoBf/osEjn7Qa6cxTbLADTRGDUfUfPlaWyNe4oaOyigjEszoT8Zr5jeBMqUDbh9QXc9
	g4XJKQS7atpEh0qOOqajOk6Pky53/0dhkCVnqytwGOrcy9DbERlMFn+cUFKVblj8eKBzfqlQ99e
	9ujd0cDZLhcWttFuxcLaIr6dCwGiijr4heLXYy4A6EnPFxK6bBC3s3encAAq+gyqTyXLMI64yp1
	y1Ksg==
X-Received: by 2002:a05:600c:8b72:b0:485:33b7:573d with SMTP id 5b1f17b1804b1-4854b239d6cmr46970785e9.1.1773242437992;
        Wed, 11 Mar 2026 08:20:37 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aa73dasm435519285e9.2.2026.03.11.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 08:20:37 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 11 Mar 2026 19:20:23 +0400
Subject: [PATCH 3/3] usb: misc: onboard_usb_dev: Add Corechips SL6341 USB
 2.0/3.0 hub
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-sl6341-v1-3-0a890056f054@flipper.net>
References: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
In-Reply-To: <20260311-sl6341-v1-0-0a890056f054@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2625; i=alchark@flipper.net;
 h=from:subject:message-id; bh=AfOYtrRki/qnAxr8r9Joob/FkUd7mkLtn6bIOe/oUNs=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRu7LD7Exdj21fD7NN7rDI1+ZQz4xmRsKu7XWaXLjp1/
 nWA42mGjoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKa6Io/hf2arZe8LEeVIdkZ2tnV1V3mVwpOdluTO3jdhjdjOf5//8jEytGr0PD6
 /Zfarf1nWUgHvVCwn9TYe1g+5OmuhbefE3xJODAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flipper.net,quarantine];
	R_DKIM_ALLOW(-0.20)[flipper.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[flipper.net:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34589-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alchark@flipper.net,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,flipper.net:dkim,flipper.net:email,flipper.net:mid]
X-Rspamd-Queue-Id: 26D142665B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the ID entries and platform data for the Corechips SL6341 onboard
USB 2.0/3.0 hub controller, which requires a reset pin and a power supply
for proper operation.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/usb/misc/onboard_usb_dev.c | 3 +++
 drivers/usb/misc/onboard_usb_dev.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index ba37eb99efba..6dd73f23e9be 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -565,6 +565,7 @@ static struct platform_driver onboard_dev_driver = {
 /************************** USB driver **************************/
 
 #define VENDOR_ID_BISON		0x5986
+#define VENDOR_ID_CORECHIPS	0x3431
 #define VENDOR_ID_CYPRESS	0x04b4
 #define VENDOR_ID_GENESYS	0x05e3
 #define VENDOR_ID_MICROCHIP	0x0424
@@ -649,6 +650,8 @@ static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
 
 static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */
+	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6241) }, /* SL6341 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CORECHIPS, 0x6341) }, /* SL6341 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6500) }, /* CYUSB330x 3.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6502) }, /* CYUSB330x 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6503) }, /* CYUSB33{0,1}x 2.0 HUB, Vendor Mode */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 1a1e86e60e04..8f74db0b8001 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -80,6 +80,13 @@ static const struct onboard_dev_pdata bison_intcamera_data = {
 	.is_hub = false,
 };
 
+static const struct onboard_dev_pdata corechips_sl6341_data = {
+	.reset_us = 10000,
+	.num_supplies = 2,
+	.supply_names = { "vdd1v1", "vdd3v3" },
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
@@ -159,6 +166,8 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
+	{ .compatible = "usb3431,6241", .data = &corechips_sl6341_data, },
+	{ .compatible = "usb3431,6341", .data = &corechips_sl6341_data, },
 	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },
 	{}
 };

-- 
2.52.0


