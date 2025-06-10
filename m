Return-Path: <linux-usb+bounces-24654-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4480AD34CD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 13:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A76E916827A
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02EF224896;
	Tue, 10 Jun 2025 11:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HfwGoFjS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB9C1A5BB2
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 11:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554293; cv=none; b=VCHDql1Z59IJ1d37+u4aEMRtwfI68G2J4hAjCRjYKJqw94zMHsp6u4Vjp350ghFKReuqmuSnPGHHmorfguXAlRLWAWCYQ1JNIYt8C9vpEiUGX5u7SvjiduEinZUVhkxkVed14RbHOtOw7YDB7ssusKVZ1wO7YWflC+k4eaIh8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554293; c=relaxed/simple;
	bh=PM0zF5DzT7Cu7t5Rle7p8zUkEHvppzRE/c1zpFkqlI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V8lZZnuzaLTYdraSQg5DJL9Qtyc4t+9/upkGSI7D1xstshZxT83xpRyPB/Brkxv8oBkImevu0S+w00W/z/aATgQhjQmxMI9msy3/E6EriaKdT5kRHe5raENNkBjkwa4aJrh0Pnc6rhp4zGdNGpaXcyysZClDgVNCpnxsxTYISrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HfwGoFjS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-adb47e0644dso1091973066b.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 04:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749554290; x=1750159090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a3b2BnxfS/ZKr8bAvdMa5zb253LnX6qkONKFTWI64AA=;
        b=HfwGoFjSIfYBKw5jXke1sCpyUr0I84jBgoXQu00WALJdGRty2HGDeHva9zTTxh8nqf
         Mkx4nu9BSZLIdx1ulA8wv8zVBi2TxWvAveTyAv8/K7nulqeIe6dG9zxn0+UgeFZNLzca
         jmf/bgdmV/SWGfjxh4oh/rHMlPWdolyb3nilE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554290; x=1750159090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3b2BnxfS/ZKr8bAvdMa5zb253LnX6qkONKFTWI64AA=;
        b=b8AEsHnz2xkSVG7U7gT0hNjbbZ/3A4nhSSZcq8Eb213a+tkiCKhA94ee9oM3MypevQ
         +98sQ23VXrKHJiRpoY3o6FH6FyhNb1AJYgt5eaE97jn5rgN9s+akn/U8/gtgvXFjemJg
         aHoQdxXACIBdkmzSXE6RMUoedegy13Agj8/Ldt8Pi6RVh1v/3L5VZJK5g3Spg08W9uql
         fsmOj8wRPR+Yawg+kTyHK3/CN3jJylBq2/7D4emCe0I1b96VlWiXYqFQcjHu6CfEZ1kn
         8npJh2I/pZmCfQM0G1AJPOUXNbJKAsNM6AOUjyA+76eYtONxSSePY/nNQ3RJY1ovE66H
         VHFw==
X-Gm-Message-State: AOJu0YzyZhfuKW+Q7hQcLhlLP4N4R2t6oxvB/E6g72jLfnI+jUKgSLwz
	WJi+r120GJh3GpSj0GrtNNiorG1lGj3ebIyDMpWrvGLCICISogCvORZ1ugFS13/ML/FXBRxzDmN
	lg6zsYYQ=
X-Gm-Gg: ASbGncu/LY8IAK3L3REq0ed7rnngdMmXIFdk1eKp2xxyGPl2x9oYKcyq0WdsGyjYZFz
	xpXMfcV90Y2fHUkFbE62ieIhVVWVlZ5T8sH2/cYXk3Q30el0o7Ylx5uaYouND5JMMIDFUe2Qk7I
	WbUCDTGh7OVVIRfG6kAysoi8kV17aaBxvxsP6w5FJsrakzXzYRU6JON/SN6mynhM0KZZJhUPhxw
	iaxjuV8L0dTLWBhouFf2lA/ufZk0beooj2a7ySCa8xdz6Q12Yq9MrdODh4aO5n/hY8/o/sG9WoX
	FqnfS4J8FR3RNk+8wiFlwhQ/1ypYcsfPfw7mJnsW5NvWMj+5aw5TqW3lE1RmbAWjlZHZfqZ1G6V
	90r6m+l0asUGK6eHU8pxCOp4c0wuxJlKJr4XGbphKzRvd
X-Google-Smtp-Source: AGHT+IEUeFqTG7VrqDTXWeyOgxbO1okrDqsRKQORfqK9YT/jfrmzkm2FpON3MSspT/lzk0kEU/P4sg==
X-Received: by 2002:a17:907:d869:b0:ad8:8e23:86ef with SMTP id a640c23a62f3a-ade7712b1c0mr256940866b.4.1749554290095;
        Tue, 10 Jun 2025 04:18:10 -0700 (PDT)
Received: from ukaszb-ng.c.googlers.com.com (46.224.32.34.bc.googleusercontent.com. [34.32.224.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c676sm714576466b.105.2025.06.10.04.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:18:09 -0700 (PDT)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1] xhci: dbctty: disable ECHO flag by default
Date: Tue, 10 Jun 2025 11:18:02 +0000
Message-ID: <20250610111802.18742-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When /dev/ttyDBC0 device is created then by default ECHO flag
is set for the terminal device. However if data arrives from
a peer before application using /dev/ttyDBC0 applies its set
of terminal flags then the arriving data will be echoed which
might not be desired behavior.

Fixes: 4521f1613940 ("xhci: dbctty: split dbc tty driver registration and unregistration functions.")
Signed-off-by: Łukasz Bartosik <ukaszb@chromium.org>
---
 drivers/usb/host/xhci-dbgtty.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
index 60ed753c85bb..d894081d8d15 100644
--- a/drivers/usb/host/xhci-dbgtty.c
+++ b/drivers/usb/host/xhci-dbgtty.c
@@ -617,6 +617,7 @@ int dbc_tty_init(void)
 	dbc_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
 	dbc_tty_driver->subtype = SERIAL_TYPE_NORMAL;
 	dbc_tty_driver->init_termios = tty_std_termios;
+	dbc_tty_driver->init_termios.c_lflag &= ~ECHO;
 	dbc_tty_driver->init_termios.c_cflag =
 			B9600 | CS8 | CREAD | HUPCL | CLOCAL;
 	dbc_tty_driver->init_termios.c_ispeed = 9600;
-- 
2.50.0.rc0.642.g800a2b2222-goog


