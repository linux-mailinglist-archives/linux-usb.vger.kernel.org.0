Return-Path: <linux-usb+bounces-31773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C945FCDF163
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 23:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14F22300A1F6
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 22:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BF527587D;
	Fri, 26 Dec 2025 22:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WEJErnLq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BA7640E
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 22:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766788270; cv=none; b=E53qOHmyTZmP5l27O9QbL0FLxhDPKfQBuGUmrirrPcLP1/SaHa0QI57CIW0/7ZyjaYIHhf9NG1d6awD9+hlwdUzV1+Mq6ZqMqzefZhfgmYKPgZWB/cla4c9TEdnCQbhGpzZu9s+QGLkO/l/OXNKUd/Jd8WQSjzhaUSAgDhUcQQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766788270; c=relaxed/simple;
	bh=K/7eMZxfEHX7vo68xSNfuDo9aAU6+thzgJeaK/X+ydU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sx6SRZ+JSCvH37o+YNhAQEx9BLDFJjdjLY465PnNLXX1/L++CkByiQGW5pea9F+O/PxxFBLv+DIiOcF/ea/pTN/YdiyHMF5VDus0lYHil+1lr3p1EFXXHHkEMNNyawc0gy0o7wZ+A1rrm1Qc6A+cCgDg7bNz0d//b2YxB/h1hWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WEJErnLq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47774d3536dso59314435e9.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 14:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766788267; x=1767393067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYhKsfmKyRLGYUKXgcmzYEyxmyTNayWLcnyCustFjdM=;
        b=WEJErnLqyLPLqPMyIZ7UPv/lwvZn37gIHEaFxObx3xuOWs243E1lPkwdsh0pu3ymIi
         WXrphFA6Lcp6SAEGr3/7aEeDj5WVYteyWIMlShiC96Y3uqfWr3bPJcV7CSyIYt4qjyf6
         8wou7caQc2LmxctvfJx4JKgAN7EKYyEYolIPgDwOtBM7g9+LrVZ2zPwS+RQwH94sHcfa
         Jehfpdk/vIIrs4NjxzMtnvB3mZuAuvHwnr5IpQfbAYdSEBiH2HZ2Oj37HqDBdCC+OtIa
         hkzFsuP+HaWY0YrHT5LvNxHcP8bl51JJVYT+b6r3MW3R9e7Z6wr+vnCg4qZ0kFZvK4bP
         Vv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766788267; x=1767393067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kYhKsfmKyRLGYUKXgcmzYEyxmyTNayWLcnyCustFjdM=;
        b=eOia4Pd9J0eOzj5lFoWgopTGbmVUAFigjs0VPYqIMLtmUEnS4+jiNmI2DkiqKTPTTE
         6dlzN2afk2xaTgGQCqGM5/jhlFRW4TBf6inznl4s1ROfzp8COejToxf1PRfiJo6/gM7a
         wcxjyYQx2ZpABPzjKgDH7R7nzwhPI0Ix585x+VcI7a+gpmiGlmTVtGQfqezUa5pRONt3
         gTPjYWKEgzqcq71xTFC+CIiYWdotSH79RHHVE5eznXmfdK7KLpAHWGJSumRoSNrpATtY
         XA2Opr7o/SrCpqo3gn0Ut8v/Hael93q4+M5N8LZfx5SCCHooeLWBgxJp2l2BYfV33ZvM
         jGhw==
X-Forwarded-Encrypted: i=1; AJvYcCWNaFlux+H2R/7QE027VNYUvs4p2jWyNg6HZN/LHGXW2u4zsJeKVeRTcEvFk9YAIN+YE4rxfn4O4Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn0oOcq9wBvGIsLdPM70EP0mMSHpBV7U22kKBKNkAv9eoMY2fT
	OmeF3PLkkk9c0jjN/i6/Ysv/pYT4kblCz2HYCuQUmqFQk16yNhL22LgD
X-Gm-Gg: AY/fxX5dp8CLLRX4WsPYJdumxWSsrpM9c65WrbN6BKNf0jOTt2HkGneURMiLxQad0vY
	USKKJzgfO45fSYElEI0NK9B1yx6Ga4q8RXEDEYI5JNndzbOC85fEbNVO0mDGbRatl+YqVp+Kvj6
	5wSnrJ6qtNPw/NUnPq+OJ/WKZZ88GE2GdUYQweTfTEO92zoIqD/UG1k6o+Rc/KXUHL9EFYXfSnH
	Rb7+WUpMQQYAnwYx5rylYDU9E0Ug5l2Q34zE4sZPGYxDlUjs47dkj8uuAyDrF/Qx431L65kg+tx
	lB7dMK6/2yRa7fS2/Fak5Ny+GHRAxRu9Qo43GubJFTewLQrCpnsMxHSJV3XhUCL/f/eiMRJ189s
	E2xkVxVkkFWbJYPeRW3s5OGhVHlovQLbgruTN9MQsciZd+Ffol/5yLpp7ylYmJu+g1qiP31m/iK
	U3zMQ2JJv0uHD3ep7sC/FCp8nPTyfDfwH77Nbnr0qZNe7UvioNNbDUPz/iaaGNlxCJC/km6dtKo
	5k=
X-Google-Smtp-Source: AGHT+IFmWQXNK1wv9MJYHyLPbTQxbcB6DPrsAA4CF1+BS18uTfC/1R7KEvt0pZ4fv6hdU4QEgS7g0g==
X-Received: by 2002:a05:600c:4746:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47d18be144fmr236909205e9.14.1766788266604;
        Fri, 26 Dec 2025 14:31:06 -0800 (PST)
Received: from ivan-laptop.. (cpc92320-cmbg19-2-0-cust3144.5-4.cable.virginm.net. [82.13.76.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3a2b419sm190017475e9.1.2025.12.26.14.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:31:06 -0800 (PST)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pooja.katiyar@intel.com
Subject: [PATCH] usb: ucsi: Fix null pointer dereference in ucsi_sync_control_common
Date: Fri, 26 Dec 2025 22:30:53 +0000
Message-ID: <20251226223054.5565-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before 'ucsi_acknowledge' calls 'ucsi_sync_control_common', it sets
'message_in_size' to 0. However, if 'ucsi_register_device_pdos' was
called after 'message_in_size' was set to 0, but before

  if (!ret && ucsi->message_in_size > 0 && *cci & ...)

condition is evaluated, 'ucsi_sync_control_common' ends up dereferencing
'cci' which points to NULL. This is precisely what I'm observing on my
Framework 16 laptop on the latest mainline kernel build.

I don't see any synchronization primitives used to protect 'ucsi', so
I presume just checking that 'cci' is not null here should fix the
problem. It seems like prior to commit 3e082978c331 ("usb: typec: ucsi: Update UCSI structure to have message in and message out fields"),
'data' argument was checked in this condition, and it was always set to
NULL from 'ucsi_acknowledge'. Thus, this problem did not exist.

Fixes: 3e082978c331 ("usb: typec: ucsi: Update UCSI structure to have message in and message out fields")
Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 9b3df776137a..7d1f2a702d90 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -98,7 +98,7 @@ int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci)
 		ret = ucsi->ops->read_cci(ucsi, cci);
 
 	if (!ret && ucsi->message_in_size > 0 &&
-	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
+	    cci && (*cci & UCSI_CCI_COMMAND_COMPLETE))
 		ret = ucsi->ops->read_message_in(ucsi, ucsi->message_in,
 						 ucsi->message_in_size);
 
-- 
2.43.0


