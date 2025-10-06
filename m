Return-Path: <linux-usb+bounces-28920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0EBBF96C
	for <lists+linux-usb@lfdr.de>; Mon, 06 Oct 2025 23:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96E6E3BEA8D
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 21:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D96260580;
	Mon,  6 Oct 2025 21:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTeOMWJs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248B9184524
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759786803; cv=none; b=SHkXHyrOYL+twnkyO9itN/gzjKif75djpFdhYGmVaPw/fve0ucqqgvVxfRbqOBNvdg3HHzqKn8uReI1Coe8NiHEWzGV/gClMZ+/AcaLsY6NRwxzl+9bEN+uZtgRGji9j+Yarfc1mOLE6ICU5rJyaceLXbnjJwHl7OtQX+S7F/KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759786803; c=relaxed/simple;
	bh=3Wvd/vMbZWZTZMMIYDSAJvoPh3F9w+GMZlsKn9HJPgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gRjYQ3D5rfnvBReah+luvNjrTaNCNCbnN49xuWkdqUwfQasOE6F5jM3lg/lDdvRzp/ePZ/Yf0AEyyBHDAaT18qdvrTNNAsPsRPn/LLy2vKCxYlPEPWAGOuDr6dh9M6tARRpwBq2gr3PuQfa1Lla3IDHa5pjjdLqg07tMiKNSU/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTeOMWJs; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e37d6c21eso40337695e9.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 14:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759786800; x=1760391600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KzlPoDMpUcsXn2zGawpxVR2GYUtiTp1UfnFgW3RB7Cc=;
        b=GTeOMWJstjkUitneWm/83hiJwTkdlkTb4sUHOcQq1D3KaSn1sQZuOpX1ZOJClr4LmT
         NWQqjlTa0391bWOtkZWNdnZwdEq4ufqinE/m2W4eX/ll53mYZECegr9fTDEKlX6b8u1v
         YY6AYgs06pwDuXJSapRzC7R8iL7wAytkFNuoL6y1LLdBDGyUOaJ5t0Ou5smEYerEMell
         ehHK/fHJfSumjNfqjgcwvJrdKx3MMj/FPaMIa8cpTgZCKCJjj9SNgB2BPm+6LkfuPYR1
         Nuo10r/wqSi6Dk3KSOnFhs49TpKB4Gj1NRn/NAXV1sZuGz4LZe7kd0nwON2GR9wSry57
         xXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759786800; x=1760391600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzlPoDMpUcsXn2zGawpxVR2GYUtiTp1UfnFgW3RB7Cc=;
        b=TIJCN28MGtdlFJwu6+US5YvzOBuEodf2xwAA5bmkjJEYD0hXv7/M2tOuqaD0P6GVuu
         y48ourd4Pqlj8poMjr3DubPVcTnpZ5Yyf8zFVc7KhHsbLAeZdVrbGAC6dokS9r8NBxIZ
         BPe6CEE5Q8imc9gP/BMtCnRrIi7Zf9xL8T14S82ehmeZ/OtU0CRNRY7p12Y1gb92XfF0
         UJiXMC0TuptwYz7ggMh4T9RTHKoXlILPEGzu2NIOLuV2kkfA3RuSuLzXAexmuex4Jhnw
         V+bRJYZ8lDWKmFV4peGRNOxA5Ts7aw51F+H0MIUP7DbCI3ZzOY9WlPjJSPVWBXCOHfKa
         PDsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP7XkCXcRw1B3k6kEKS0CC07z6wOkw4LpwL0cNgbn/Za8u91JWtjak9kfULKGd9RFdnCsT9ziDzDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpecY9J8M73RsPUVYclSI1GfGx91Tj0JTiAg2OrsQ+OIXJJHpe
	nt0YofIp1II171AlzF7mZVJNjT9rh9CajjcGS7ISOcu7Jdl4n8tIkcEx
X-Gm-Gg: ASbGncuZ5lK1aIq6/Qgq2YfpRCVE/EkxtoDKgmWwRXWrJzHFgMDrWfSvXjluCyp5C8A
	gPvIYYCNtfNnGK+Rql9dIuVk9aTO76V6owOG53p/wsOXur1ehnhFSVXTarOelTVxBsnP1D4Ni4K
	FPhkM/+YU+QqYFcQHLBhLIojLX7KxoY656xBuwmfZ+c70UF7AYfTLSJin4W1w5NvQA1iue8t0HI
	aycFcliNaiy5YN0gBaI9WYM+N+KFnR+aT8rTldVqgEX5wTjYLamLcNIahDSWPnkj2isECvYQBGN
	1oJj92nXRvxW4jmaAOewLIHFiWhE9DezCOEO8YSy3KUyhPz8jt7YWlCCHsv3azXlzebtoBrSdls
	J5R+7xRy1dGHgzcR+hXxnRKELGRxbEgYEn2iUXuVM8WFcV94a5SonRHtV7QhNMk6HgV4svJYsV2
	tTcJFSriPhk5Nybw4/hN0Fava7mx2L2pAbShBD5I9cEDnc0ZdH9bMUcsNp8IKnUSbrk20B+PB35
	dGZS/El2kSCcQ+aecsaSod6pmtyt5kxn4C4THshtSzh+AthACmbTq6HSHJ2eKsULQ==
X-Google-Smtp-Source: AGHT+IHRjJ0Eb1o5PC36Ziacd7qWQekZqQC9n17d112SbWujl9VihmUt8fX0XIeWohMsI6pPazafRw==
X-Received: by 2002:a05:600c:3d87:b0:46e:206a:78cc with SMTP id 5b1f17b1804b1-46e71144748mr81632855e9.28.1759786800171;
        Mon, 06 Oct 2025 14:40:00 -0700 (PDT)
Received: from cypher.home.roving-it.com (8.7.c.b.e.9.5.3.8.d.5.c.8.c.4.a.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:a4c8:c5d8:359e:bc78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fa2d5bd52sm4349235e9.2.2025.10.06.14.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 14:39:59 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-usb@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] usb: misc: Add x86 dependency for Intel USBIO driver
Date: Mon,  6 Oct 2025 22:39:52 +0100
Message-ID: <20251006213957.15668-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel USBIO driver is x86 only, other architectures have ACPI
so add an appropriate depenecy plus compile test.

Fixes: 121a0f839dbb3 ("usb: misc: Add Intel USBIO bridge driver")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/usb/misc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index 09ac6f1c985fd..0b56b773dbdf7 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -182,6 +182,7 @@ config USB_LJCA
 config USB_USBIO
 	tristate "Intel USBIO Bridge support"
 	depends on USB && ACPI
+	depends on X86 || COMPILE_TEST
 	select AUXILIARY_BUS
 	help
 	  This adds support for Intel USBIO drivers.
-- 
2.51.0


