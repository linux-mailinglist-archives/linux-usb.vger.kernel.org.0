Return-Path: <linux-usb+bounces-7991-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ECC87D014
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 16:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08EA7B23C80
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 15:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844883E48E;
	Fri, 15 Mar 2024 15:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nr67b5Y0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311D18035
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710516069; cv=none; b=StdQzBwy4fjPKyhlL4aLE+67J2MjhG29ckpALqYIeGBUMP17qM8lQg4I5Ewcrc9+cSLLBlRY05v6TyISFxDwHhst5Uk+8eblnD5NK4XyWzFi5QmkbIfgZyos5USP+SH3eM9zilgxsGc9o7j1Ew2e7R9RXER86Q8/OcXieZtsSCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710516069; c=relaxed/simple;
	bh=oQSU8jjDxqSIS8TDvT+ZEvcNLa1hjhhovpfiAu/AtGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXCadaB6T2AzJcbCtIDBQhSMYBEa5AlYYhkdAK7To1i+fUWPGDQXlhToTSW1rFMArhcvYzUEgUmnNybO/WK1Sk7XrR+dIQO5wSvFWE5sXdM9zRz3d5kTJLffQ3X/FkL9yCSFvSG8DTiEorGg9DZvuV7U4Ph7xP9V7GD3w8JqvuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nr67b5Y0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41403b203e0so3058555e9.3
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 08:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710516064; x=1711120864; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYKXoXyTZp5ci3YSNMbewaGpFg016n+QUTmPiNKutP8=;
        b=nr67b5Y00FpstdzWyaItuqUA+vzNDjKC74oTSeoDviOHdgGgzmHLGvU9D844S3caz8
         kgvzMrmwmLkLgiR1x4MkqRAdxkTzdeD+7U5OhD1j0x1l/W+KjrMTZu3RrzB59bsLbQ6h
         r0M38PMSTxoq/Lmfv7psSYUb3mkJSYmixKEsUgbLrlUOVKI1y3vc/TIq+9I4a76lLKuP
         U+PkpEagJhWDWYDBj15zvN4cdADt7XtiZam7KS3TuBRBEmo76POOMtK4AnkzZ9FG3Dig
         9EBPo9xiQBRR+wEeEZm8C+PmBdPrvrgqXODDnBCbOmJXOyEOHudKOHBXbH8V0yjRsbry
         LiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710516064; x=1711120864;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYKXoXyTZp5ci3YSNMbewaGpFg016n+QUTmPiNKutP8=;
        b=a3lj5WmmqQgwY81OPUKZ1AMgVMXFxl46noGg6rGdqOieVnTr5HDMB0ueHoUcE3BY6i
         lroBb8ZjaWMEnkOqBDAn9cye5P+m2nO3qCBi8S80PFt5I8n7WH0qtraam/VAqn/MBSnW
         qIjBILH/umUgG/z+zPJVDsOlfWZ/O0kO/lPLBFaki69r2hXHnMP2+hUkf5986sVKG1Qy
         95qfZYkZ2xvK36ZtJa3kty/fmdvyE5hrp3EYdM0RbfhAzn2rJeMJVtyenrW6k6qH7vz+
         I6EoFGkMtQkpXstE81cSaMdKoQQ9B0EbjRdIijKAKv4bYAS85tFDw/FiusyKiSiQURtA
         9Xlw==
X-Forwarded-Encrypted: i=1; AJvYcCX2JviInq0fNfHczjbH6/J5rG86zS4DGHsPxG6diQt3GGO8/pUQM1ogdWJSUNGh8xVtKCiNtqQNOzqVz9sTM/AAXlwWCAAV11Nz
X-Gm-Message-State: AOJu0YxOj7W6uJWYeSecil2RlPvapp6PurcwM9A4iaXo0pnwPVxsnrj+
	KGIE3+4PE92O4eApPsiEkTbMqyBOu7OyWUYT8K/7uy+7oJDkMpFThBDy4SX5Ifk=
X-Google-Smtp-Source: AGHT+IEcaJ72Qyr1XY7S8v6ZEeNlHEDW0NpxpQP3hzbLmJpU6iEGgDon3kkU7qm+Qmk7GrjsL7dbSg==
X-Received: by 2002:a5d:6b0d:0:b0:33e:c2ea:5e1f with SMTP id v13-20020a5d6b0d000000b0033ec2ea5e1fmr3133725wrw.0.1710516064137;
        Fri, 15 Mar 2024 08:21:04 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id dd12-20020a0560001e8c00b0033eab3520a9sm3402524wrb.43.2024.03.15.08.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 08:21:03 -0700 (PDT)
Date: Fri, 15 Mar 2024 18:21:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: usb-acpi: fix uninitialized variable in
 usb_acpi_get_connect_type()
Message-ID: <fdd4f94d-fb8c-44a0-9472-3485a567caca@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "pld" pointer is uninitialized if acpi_get_physical_device_location()
fails.  Initialize it to NULL.

Fixes: f3ac348e6e04 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/core/usb-acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/core/usb-acpi.c b/drivers/usb/core/usb-acpi.c
index f250dfc3b14d..2aeeaa389380 100644
--- a/drivers/usb/core/usb-acpi.c
+++ b/drivers/usb/core/usb-acpi.c
@@ -153,8 +153,8 @@ usb_acpi_get_connect_type(struct usb_port *port_dev, acpi_handle *handle)
 {
 	enum usb_port_connect_type connect_type = USB_PORT_CONNECT_TYPE_UNKNOWN;
 	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_pld_info *pld = NULL;
 	union acpi_object *upc = NULL;
-	struct acpi_pld_info *pld;
 	acpi_status status;
 
 	/*
-- 
2.43.0


