Return-Path: <linux-usb+bounces-18916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B69839FF04E
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D6F816208C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586C019DF4C;
	Tue, 31 Dec 2024 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMOMSE0D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C4A14375C;
	Tue, 31 Dec 2024 15:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660061; cv=none; b=gc1ZLEfubF+abgn5Wqup5Sy0RLw0dPdGTi25s/7CXvYslOma7i1mvoYAHK0y5UZ8eoachAxW2wGlrRwJhes+ZgTZEkcopPmxqXu5S+D1lfHoxltzJMU6RgOc9OxKe2eB9Pm0EEp5LEaRLJG0gFEBuJCPDrwpgqHOxwg1CGctaFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660061; c=relaxed/simple;
	bh=eym8vWrp0YSLA8gK3wUKIgM2ZMuV3+Np7Jdh6F3rDdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X0XEsbLWAcytnVehIySfrx47JAOGJexJ2oiR3bPH04DvOF4h+C7jQTA47VAm+zQppjVADcZf7AFTjSSIFRrezSJmkJ9wv+kS5E7RKcWu7Ov1HkAQ+E9kd5qydXWh2duy0DIncomTRFdnNQDPkPQ/kLZGAayopRFajYahGLH8yOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMOMSE0D; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54019dfd772so1665407e87.0;
        Tue, 31 Dec 2024 07:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660058; x=1736264858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xi9/tyl/eMDRqlY9iqLZTwxadrODXpgnAtwglkYl1Dg=;
        b=gMOMSE0DeChMc2ZtB38r/1CapACvD14q8ECFxUYmJefMThmJ3WcUCwjRi4msn7rjwv
         bBuVS1opCvudFNLCfGc3w85UJfAxJqGxeRHT/iGfPpnWhLZ6hwkCVsWva7pKqTc/HxQc
         aFYh2EICYd5LCNML09kHOBVvR1uP09ZwYVCHXUrQWvtFKjuaOJSiTPehzFXGjLVerGaS
         OQKdeDOuh+xKeUvWgP7DZFI13aCqlVdgTlNw+LmlMOhvtk8QFf6akK6sci29aZY32pdk
         GSJUarhsLtNuB+SPysJb0aKRpwpSrkc4T1a//mjfKMkQm2a25Sx/0YsUlmf/P+mPJ99w
         r4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660058; x=1736264858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xi9/tyl/eMDRqlY9iqLZTwxadrODXpgnAtwglkYl1Dg=;
        b=e4RgRahjBJwUEPI+6NIp0ERnT1gRo9sXsQne8yC6GruTKRSzZzMpLZZ69FmN/PXK5O
         bxaQgzJz6mO2C50xZcKiq3UZ/vMbOyN5eXGj90KJwUrM+bBCBBiFCiArOu3k1Hw7YFNx
         mgcQ99pqMQtopcs42e+fdKd0l6+PelFu+nX/rXGe57Vsoz5qMQluR7ziix/r8JnFFAqd
         kV/D2H4BZBOnPpQ8AkIr05899MzmmtJMORqe7eu6GW3+pawCWTFPC8puwZFRZ9l6w641
         XCHEaTIyk4V6g7tkJp73PXtNOIdGk3P7Fmz37hRj/CU2IOnM1+ZULuKKHIjsY5kSky9T
         pzBw==
X-Forwarded-Encrypted: i=1; AJvYcCXTvRhDKJhSZ1oh8I8nhYsWDgUbnZ05Yd8RAX0wj/EMI/zJNZ2SV/vwJ6CF6DhQtSV8IT0O9mfwRPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDWVoRIJASE/6zHMs38/AytKrTmiNW2aPj8M2/w9tv8PX6OAKW
	/32GX11hvHfnOyQcHvRbc5EfCh6nNWj60rFGpI6wIZpaD7p99qZ4
X-Gm-Gg: ASbGncuBbf+JFOF0TqfUVbk6WeO5/KtiLeuObM8PvzMvcABXDVr7V/l/J4B/H/ABr7F
	12h+zqI+Tldci1EjdkpYIPo1f2cw99B5OBsJZX4FfLNfeRqQBPcyRfAL8hd4I9jprzYfhoBIAfz
	J6cksc5qeUK3XM93KmCA9PMLHGBfoTrF+yWJKn2tQEpjRjvPnb3v1fTn9sqMxfEfkD30j5TJY+G
	07JImQBS0GXzgu3yjF5vIxTZkTjC0RYzQ2HGombw6CjVw1e+sYGrL7PcB9TNUouSK8jSaHTEyig
	kU7TtFkVwN0auIkT2MLXq1GnYDY=
X-Google-Smtp-Source: AGHT+IGt+3vabpsGnBMsG8BS1/I5jLDbKWSqQC8qIbYutOI2z8hR1mb2Es9QT0d9bygOUGOqJYdHCA==
X-Received: by 2002:a05:6512:1242:b0:540:c349:a80e with SMTP id 2adb3069b0e04-5422955ff22mr3919770e87.10.1735660058127;
        Tue, 31 Dec 2024 07:47:38 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:37 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 01/10] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Tue, 31 Dec 2024 16:47:22 +0100
Message-ID: <20241231154731.1719919-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux defines 0 length as infinite in its force feedback API
while USB PID defines NULL (0xffff). Most PID devices do not expect a
0-length effect and can't interpret it as infinite. This change fixes
Force Feedback for most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..1b5d3db62c09 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -301,7 +301,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	// Convert infinite lenght from Linux API (0)
+	// to PID standard (NULL) if needed
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? 0xffff : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.47.1


