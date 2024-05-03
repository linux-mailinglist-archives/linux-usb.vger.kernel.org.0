Return-Path: <linux-usb+bounces-10008-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FA88BAA85
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 12:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F8B1F22FEC
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2024 10:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1411509AB;
	Fri,  3 May 2024 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xJeamMuX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25F314F9F9
	for <linux-usb@vger.kernel.org>; Fri,  3 May 2024 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714731066; cv=none; b=TM5An7gsBHKmg+O1GWz09uv5YHbDzyGGrBvXlTg1lW1d3f0Bvb0DN9EcQKhp17mYztQq5WI7vSUOQhIzKw/NIWyXLulrXgFQheCvEhmtmpIXYi9EYr+bvi9mfON55C0z6HHf+X7jc8GxMHJ/R2hw81A/A1gwNfshIwyFnFTao/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714731066; c=relaxed/simple;
	bh=afUj7sW5z26GK7sH4Tt4sMxfNqRZcb7z+DDY2r8+ZP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoWtvOJktJeoaRcGSAkEMSUsBDW6pXSgtAUQO1fn6XYPhWClz5N4KZJ59aBzps/P6JAezhjA5ObA5hBEZP2orujRxtQ3JTyomL7OwfXV/wolWvvxR0ZSJQdcKijreH5RHO2RUh5jutEoS/xMLgWsLBbmpwwe9ZUtiVS1LlLg7Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xJeamMuX; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2dd6a7ae2dcso145959561fa.1
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2024 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714731061; x=1715335861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPxkPHRxhFuCR26CFAMNK6Mr2Qw/jbcZwAXIxe90S+8=;
        b=xJeamMuXhFf38mtFbO8t1g+vuAayuFL4GXWMKfTYr4MS9elOuM8P1HrPdPdFscAmHZ
         uoFVKYEMWVZgg6xZrPQBjD+qn0uSWzzTbtjCzAOJvWgFqEgCgb5NzUlmccx5qspHu5mA
         bTcVRruy1pteEgsmNgmH3CBzzC9ftyJq/N2VDj3Gxha7fgXQmZfnTnANO7vxUTJAX24f
         pyxJPPM6WqUu8Lbr3gQFClg+2LsXk5vMlZCl6bmQSWU4+DWd2uwvXkuB08DBa0w49gbF
         cniH6wYPf7mBtXzw/aMQagxHFS2H2AFKpjVBiRvFlDdF/ABfpcRr9Q5yK9GsiKLGGOwO
         72vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714731061; x=1715335861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPxkPHRxhFuCR26CFAMNK6Mr2Qw/jbcZwAXIxe90S+8=;
        b=JnKMJHtwodJFgJSFIRx+f4dNHOqg9A3wXQlPuWQes0IJw0yaXw+F6LvOB2d6AFbDA5
         MIt8cJbEfc3IL4nhZzcZp1RtlDi1AXcxvYfDVS6bx1H6AWrGwhJhkFopxFPZbKXZreTg
         pOYrsm3OhuTDBauBswcAmLUdEWkM+QWqWc9d2cnzCGOM+pTA3Yj7XmhGXB2X04kgx2yc
         2jNSbU1h2PE0kbXSNgOnAHfORh0FDEvSmyj3tsToDojJr0kT0x3YCkLyavKIDmX13jLg
         ENW03/NnJiw6ar7fnD0R9+hwnfZt9Nraspta2fDeUVicSe8UIgB35Y1L52nLUmn2Krk7
         7Uaw==
X-Gm-Message-State: AOJu0YwazrEM5MUBRJYLG21FIClsMIKwabLfhbhgp0OfkO8aq6DPowy6
	4SEYRtss4uDPvgRmmJtI5gWtilfOVwlattaSE+ww1nWaGjT40KiIDRFhtCd5fYcLoBXl1JCHzHc
	Yi3U=
X-Google-Smtp-Source: AGHT+IESElkd3j+Jsjl9psmiggiCxyTju0rlACEjYB9GYW6pSsCgwLArdaGy5+/ErdQsLAOQpPqLgQ==
X-Received: by 2002:a2e:a406:0:b0:2e1:9c57:195a with SMTP id p6-20020a2ea406000000b002e19c57195amr1966188ljn.32.1714731061433;
        Fri, 03 May 2024 03:11:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b00418e4cc9de7sm8832702wms.7.2024.05.03.03.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 03:11:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 03 May 2024 12:10:52 +0200
Subject: [PATCH v2 1/2] USB: serial: store owner from modules with
 usb_serial_register_drivers()
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-module-owner-usb-serial-v2-1-7887769dbeff@linaro.org>
References: <20240503-module-owner-usb-serial-v2-0-7887769dbeff@linaro.org>
In-Reply-To: <20240503-module-owner-usb-serial-v2-0-7887769dbeff@linaro.org>
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3535;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=afUj7sW5z26GK7sH4Tt4sMxfNqRZcb7z+DDY2r8+ZP8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmNLgwfD1BYEGF6WUf0a2vsGNUwtg3lUg5BHdQM
 jJR9MtJg3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjS4MAAKCRDBN2bmhouD
 17L9D/0Y1DEe1LkC4K/4Z3Qqfnyyr4qdNHfyyHmZBLqDDGaNalhhgb8G9b4I6aZH5zzhnSHTO9H
 MKaBkm67CyDoMqvy3Z0aV6EYRjE2xoDNcoI3vw7IBbtqzgxPjsZhktsdTV4P0kuFjkejOAV5H41
 1zCTXxyr/Rt6wiG2ifbdPMh/FDKpP6ScURiPJanOQQcjjkclrq5Y+FMA0woshcvnnTqqVunJKZk
 +R2ZeaBPdC4iFM4gll3CkaQP8O6fiZuNfaQIjCxnk0GiwiXX8QTz/AK+JbfVTDZl6bXxd01LwUR
 WH5qNdaBi3VLAgAp8xjTS9E+oGbEs6bjrn+BgmdwUkiJwfBK5zwuYJqXAMA5hkmIDbYzwTxlFLU
 lC/OvMxpzmEcHzIKy0iHiViOJaSRXPnaSVyvKdYZhEyDhTn0tdcejEDb8Cgynh+3PHS+erTd99Y
 tQALB2JxNkFRWD9eEL3iE3LelN9189ZyhmQCu0GKIFpGcKUAwH5tp/1D/sl9kKPwC2pGaGLPok2
 TW1UyBruY9eJbO5qX79+jxMNbQYB2XweVL7DzIGeG+VVamTjSZ9Z0xa78XfTkyFMKaQcVdwV3r+
 NpjGo3iq7sjQ66WOSg4fZzX8Qq6C1JYT0EzdfQ9gxZ6Ge3/khg6c7Nus4m+OuRScGw10wM3pChy
 tIbKZdFe74VDGBQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Modules registering driver with usb_serial_register_drivers() might
forget to set .owner field.  The field is used by some of other kernel
parts for reference counting (try_module_get()), so it is expected that
drivers will set it.

Solve the problem by moving this task away from the drivers to the core
USB serial code, just like we did for platform_driver in
commit 9447057eaff8 ("platform_device: use a macro instead of
platform_driver_register").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/serial/usb-serial.c | 12 +++++++-----
 include/linux/usb/serial.h      |  7 +++++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index f1e91eb7f8a4..df6a2ae0bf42 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -1459,17 +1459,18 @@ static void usb_serial_deregister(struct usb_serial_driver *device)
 }
 
 /**
- * usb_serial_register_drivers - register drivers for a usb-serial module
+ * __usb_serial_register_drivers - register drivers for a usb-serial module
  * @serial_drivers: NULL-terminated array of pointers to drivers to be registered
+ * @owner: owning module
  * @name: name of the usb_driver for this set of @serial_drivers
  * @id_table: list of all devices this @serial_drivers set binds to
  *
  * Registers all the drivers in the @serial_drivers array, and dynamically
  * creates a struct usb_driver with the name @name and id_table of @id_table.
  */
-int usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[],
-				const char *name,
-				const struct usb_device_id *id_table)
+int __usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[],
+				  struct module *owner, const char *name,
+				  const struct usb_device_id *id_table)
 {
 	int rc;
 	struct usb_driver *udriver;
@@ -1514,6 +1515,7 @@ int usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[]
 
 	for (sd = serial_drivers; *sd; ++sd) {
 		(*sd)->usb_driver = udriver;
+		(*sd)->driver.owner = owner;
 		rc = usb_serial_register(*sd);
 		if (rc)
 			goto err_deregister_drivers;
@@ -1532,7 +1534,7 @@ int usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[]
 	kfree(udriver);
 	return rc;
 }
-EXPORT_SYMBOL_GPL(usb_serial_register_drivers);
+EXPORT_SYMBOL_GPL(__usb_serial_register_drivers);
 
 /**
  * usb_serial_deregister_drivers - deregister drivers for a usb-serial module
diff --git a/include/linux/usb/serial.h b/include/linux/usb/serial.h
index 1a0a4dc87980..75b2b763f1ba 100644
--- a/include/linux/usb/serial.h
+++ b/include/linux/usb/serial.h
@@ -311,8 +311,11 @@ struct usb_serial_driver {
 #define to_usb_serial_driver(d) \
 	container_of(d, struct usb_serial_driver, driver)
 
-int usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[],
-		const char *name, const struct usb_device_id *id_table);
+#define usb_serial_register_drivers(serial_drivers, name, id_table) \
+	__usb_serial_register_drivers(serial_drivers, THIS_MODULE, name, id_table)
+int __usb_serial_register_drivers(struct usb_serial_driver *const serial_drivers[],
+				  struct module *owner, const char *name,
+				  const struct usb_device_id *id_table);
 void usb_serial_deregister_drivers(struct usb_serial_driver *const serial_drivers[]);
 void usb_serial_port_softint(struct usb_serial_port *port);
 

-- 
2.43.0


