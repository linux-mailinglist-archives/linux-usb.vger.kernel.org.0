Return-Path: <linux-usb+bounces-2801-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3306A7E8C94
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 21:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 628381C2084B
	for <lists+linux-usb@lfdr.de>; Sat, 11 Nov 2023 20:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD831DA21;
	Sat, 11 Nov 2023 20:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHyxIWmw"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF081D69C;
	Sat, 11 Nov 2023 20:27:02 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57FFDD72;
	Sat, 11 Nov 2023 12:27:00 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32ddfb38c02so1877483f8f.3;
        Sat, 11 Nov 2023 12:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699734418; x=1700339218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bDn777LjiyZ8GAUT5k/ZqELGvfKeffJjqAcHYCvV4Gc=;
        b=YHyxIWmw8PYe7Ujeoa9H8C5qs6LdLveQiYmoFNA5dYMU8GmWEuCoh6TqDY20ndqQE1
         vDKNwvOr2y4fCYaEu2u7Gy/nfJnjRjLmzb1yr5gQeEUF3oaxIe7mWP7nfINtyCVTTg5j
         n4ANESgvWgAzdy+pPAU6vtmrPVvi4kJMciAy7LhG+N4Z58uYwOyX07uQwLAlCkJzhw4t
         eaGUiCIartZYxp/fjVOzjjGRXBeUpR2m8dQx4VFcXSuC+iFo2eV/Ez2Oh64ff4yyjLzb
         0n6/rndJbZ2DFPZgMImEobUtgP+VJ/8MEFf40fKH3KRuxyTtDiQfhlGmxwC5lI6JbE0L
         Kf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699734418; x=1700339218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDn777LjiyZ8GAUT5k/ZqELGvfKeffJjqAcHYCvV4Gc=;
        b=Eu5FdYHlwUgQcET6DV+reHQmBXWn6wg4Wys7veQ8ObOylaPt4AsYXPSrcK60XbXAqp
         1b0fxs3DpXNx6d95vaBBcYnMij5aTu8Pfcpc9dsUOZVYby2CbWnmlhdPtsmjqnDg0d7B
         UT94YWTV+5W2jAI4kc65hHiZCvl6W+omN1Pea33U7I14pEtNsna7JJoYN3/YFH9rd2ID
         /4/XY3YaDK66P665w0BsMjOhplXFf7V8mC80MUD8+TZ39dWhoMNSOiNFilg2zfu5QG6O
         wMaRDjuFd7/r+N3g60PhU0fmOUSS5HCCA2Ijj4VlDPfqhYd2X+2ap7NqbraIkye+hy6/
         +Fsg==
X-Gm-Message-State: AOJu0YzHN8EhhzT+/Q8DmTjibLUjVWyJ7+7HseH91abFXttwK0SRuDRq
	phxOKPQql5J16jijf8xHPjc=
X-Google-Smtp-Source: AGHT+IH2vnHUzi9+/+7nKNqLcoZVbpuHwJPql1ivHMOtCDo0akTE+5Hwy6kdXrqNvha3OyiK/om/Iw==
X-Received: by 2002:a05:6000:118c:b0:32d:ad44:cec1 with SMTP id g12-20020a056000118c00b0032dad44cec1mr2062106wrx.3.1699734418205;
        Sat, 11 Nov 2023 12:26:58 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id h9-20020adffd49000000b0032d8eecf901sm2111432wrs.3.2023.11.11.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 12:26:57 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] USB: misc: iowarrior: remove redundant assignment to variable io_res
Date: Sat, 11 Nov 2023 20:26:56 +0000
Message-Id: <20231111202656.339103-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable io_res is being assigned a value that is never read, it is
either being re-assigned a new value that is read later or it's not used
depending on the cases in the following switch statement. The assignment
is redundant and can be removed. Cleans up clang scan build warning:

drivers/usb/misc/iowarrior.c:504:2: warning: Value stored to 'io_res'
is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/usb/misc/iowarrior.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/misc/iowarrior.c b/drivers/usb/misc/iowarrior.c
index 1e3df27bab58..6d28467ce352 100644
--- a/drivers/usb/misc/iowarrior.c
+++ b/drivers/usb/misc/iowarrior.c
@@ -501,7 +501,6 @@ static long iowarrior_ioctl(struct file *file, unsigned int cmd,
 		dev->minor, cmd, arg);
 
 	retval = 0;
-	io_res = 0;
 	switch (cmd) {
 	case IOW_WRITE:
 		if (dev->product_id == USB_DEVICE_ID_CODEMERCS_IOW24 ||
-- 
2.39.2


