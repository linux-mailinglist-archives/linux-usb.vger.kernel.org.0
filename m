Return-Path: <linux-usb+bounces-15272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C44DE97D78A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 17:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E4BA28450D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2024 15:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D2D017D36A;
	Fri, 20 Sep 2024 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eDlm00JC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3513F454
	for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 15:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726846522; cv=none; b=kF/zFNlAKPxWvmuGnwA7sr8kqk/ekTMKr91teW8SvMje7HBuhXEpCE5ptQPmVRxUTuqGh96Jew9G3Zea5Gf0G7x0IhH++c4c1L+sqJC6uBT/yHcSxNOKZYfvMteluKWHa6WPHUVrCKuhwDZ5qKWaG5Ov+sGKfDNY1vdzM35CI+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726846522; c=relaxed/simple;
	bh=tTvPjaXJ0SM9m+3Ph1ct+vB9T/747mnj3hb0xF+TqL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R4D1LdaEDemowva7CE5bW5/XFhvUL8cNdd9Zj24iBWk1HrLscjv1mXd8bT+ovDN4ccciALlRUGJREEwADJ1FeZ50pCDEDNJTi7ERXCQr9e+DHmlwlNg+t1WvIBfJNbf/VopRfY/m9AAJEMReU0Ngd/XVErS7b731FfI25OxaQ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eDlm00JC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3787ddbd5a2so1330130f8f.0
        for <linux-usb@vger.kernel.org>; Fri, 20 Sep 2024 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726846519; x=1727451319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n+8DczkGT1Fr+vsOlvsCO7gqNr0f4sI3Hx9k6lPQnO4=;
        b=eDlm00JCTZrdgEWZ1aXIju6m6rB0cUoZ1J+rV9iklf7a5M8GfCHKaN/a6J20/E+Vtu
         nQ5Nhk9tI19Es+HkxE9fjiED2RBSgCgKbrvDMJJKx27exSL4VefgrKGJGZnkT5kr6NXu
         w4k7S8wm8ALo2rLJa5zHUMAsn/j/j0GlLfNrC0v8X1TWZcsBnVN3tXvLifGKvVPb/DHB
         qD8ujILEDENny/lhsOIJTuuPTVf2k3uId1hDFw7XOzn0lv3+aNsPaMpF5EJRfMOIEkhB
         h67Q1ITdDQMJsAElQB59ifTlJRIF6qeGtcEBwYnpIOkv4fNJNapzOc6YO7+2K3BmvAuX
         u8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726846519; x=1727451319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+8DczkGT1Fr+vsOlvsCO7gqNr0f4sI3Hx9k6lPQnO4=;
        b=gTg2ToaikA890biidBlB/EuooL/znwHHFEkWtBJi20Biv/LHasHOzX9vCUZReqAG3M
         o/LYJ99ucFiVxu0Vtuexy/4VvnN1h35m8bpYY+4G9eK4eg1WHe07/xQTqqziWl/F3sUQ
         WiVR+JjNN/vamFzPLYsIYVJ99twBRKGeXmTfYYj5gHFQiI7CC4EdW2hT+NtA9CpKePQ+
         TfIChxOlzBGIFO7AwAySIpembrp+zmK6wfX+z1/22K/Lh4RfYp6GYhNsPGRz90z/FFib
         Kw1OdbWvaFBGo6/adKfQrihcuCJHj0EMTtyTeKpaSIVFNdE5rBC6qtG+7Kz015UslwmC
         1YeQ==
X-Gm-Message-State: AOJu0YxssrmgYH0r83k1JeC6+SOtCnkL0FWQN964bxlLek/kUczDis5n
	sL62x0/rh9f15BFAuvtr4xp6jPPx87XUrvNV446+h7C+N/kBAO3BCfoV8euxmgY=
X-Google-Smtp-Source: AGHT+IEKviZhV/mlgRQ6XDNcvPONDegkwDhfCHTcnH7tNPghAvpjFRdkLdW4+6t6WaPwgt8Qr2SpRA==
X-Received: by 2002:adf:db4b:0:b0:374:c040:b00e with SMTP id ffacd0b85a97d-37a4236e261mr1848135f8f.39.1726846518731;
        Fri, 20 Sep 2024 08:35:18 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f0600sm18112379f8f.9.2024.09.20.08.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 08:35:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Subject: [PATCH] usb: phy: isp1301:: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Fri, 20 Sep 2024 17:34:35 +0200
Message-ID: <20240920153430.503212-17-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=953; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=tTvPjaXJ0SM9m+3Ph1ct+vB9T/747mnj3hb0xF+TqL8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm7ZYZ2yuXvnQfbIajZYnTCXIQciei8zuqT1IXn V+Mcj6FNMmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZu2WGQAKCRCPgPtYfRL+ TrymB/9EhogthB5UwlOgXwNY5PVmrfT6YcLkuNucKUeohrdhIV4OvhG1D9gY296Pu9iea/qAxII DXyQIFKk/F4+v/i5y5m3PEcude9PSH1OaFfzqTc/OR9AL8TZw5icincLYim9WKI9zis6tTA3fM6 trBPPHbM6nFxd5qRyPzDr/Pnli/9qvvGo1AKjJf/bIHkC8cdUxmLtljN7mK+I1GaWlkejruWAmX WBljrLarkyBOogd6HvFVkaDnAnVoPOaD+tBqUJ58FBLwflVfib4ozCllBtFa7I/pYLpe0XEUijp plCJuzWG82GRYl0kZE3mmdV/Cu/U34YyEuf2KMno0PrpMrGo
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These drivers don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/usb/phy/phy-isp1301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/phy/phy-isp1301.c b/drivers/usb/phy/phy-isp1301.c
index 993d7525a102..f9b5c411aee4 100644
--- a/drivers/usb/phy/phy-isp1301.c
+++ b/drivers/usb/phy/phy-isp1301.c
@@ -25,7 +25,7 @@ struct isp1301 {
 #define phy_to_isp(p)		(container_of((p), struct isp1301, phy))
 
 static const struct i2c_device_id isp1301_id[] = {
-	{ "isp1301", 0 },
+	{ "isp1301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isp1301_id);

base-commit: 62f92d634458a1e308bb699986b9147a6d670457
-- 
2.45.2


