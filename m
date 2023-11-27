Return-Path: <linux-usb+bounces-3384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 322377FACED
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 23:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A20E4B2136E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Nov 2023 22:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D50B46557;
	Mon, 27 Nov 2023 22:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dSBw1aIJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FCC1AA
	for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 14:00:50 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5cc7d051e38so63849677b3.3
        for <linux-usb@vger.kernel.org>; Mon, 27 Nov 2023 14:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701122450; x=1701727250; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fTNvGVxIFnvSGPtP4qlnkK9J/w0WE03mzYNhzIBqHiA=;
        b=dSBw1aIJkIfaJ45FqI7HnpDSRyNOXMy52Pf5+BqIOj047Y/euEW8PM0r1Q+at212K/
         IMdqZaeV6/mjfaaOOOOOxqmqGm0s4QUlq1nUUhlGvnjQSatTRndJH5gN0c7MxfdHKvid
         1X1JAs9gvxCVCDPesw6UtRLK5GuaGrXScawU9eACEX35Zjt9fZQRAdugc8oBDY0Gg89I
         o8c0eWFALe79laCS9N/GzEeNzbs1bN2l8/srTz6iE6R7TGcqvHZsaZYNIbOqv1StxeJL
         /nykYmPQ8aGKiInIeFCCM8zOY4W4Q4wYzkJG6hzakNcaVyRoTqnorNvgQ6/KzcOh0sUx
         z5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701122450; x=1701727250;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTNvGVxIFnvSGPtP4qlnkK9J/w0WE03mzYNhzIBqHiA=;
        b=AS6Xg8qm7izfs0nZtlCiPCkwklqX3o7/qURJkbw0fB7W4WjwkXcFR9KKfb4O1+AFjg
         6Omdjo53zTP7dIPySC6QfmrfcI5IFL9JAcQgmUILzgilq9aBFElIfNePtEGcxcQ0DXgs
         Ic83CdrxdW1SQqpbfC5bMasVd2frMZhl05n9yxsMswkhf516tyCP28fChhEX+6pXT9J/
         KsKD+dmGTwxXuFpToBhR0MyuW3s3aPk75ovEfsQ7Kjra2YkdLmtbgvHZp7ymhR79Z4Lw
         nkwj08jdk0s0aIZRjCUtouvfwuQkAHPuEI750HoRP20oyBDk7pX+hehEDSKl+jH3zkWB
         syTg==
X-Gm-Message-State: AOJu0YzTZrr+16/8+Veor9EqyG94+QaGeae3R/Mkq+9FZv9CzPgnkivl
	+6uotfk3WD6pSkap+azapcdrtz671dU=
X-Google-Smtp-Source: AGHT+IFp2Pz+pOp/aFYeFRUmrMvmR3U8j8U5gIjALYCSDa+RLFWYAHmdFK9ITbZLy1xqGIaSxJpqICqdkPw=
X-Received: from royluo-cloudtop0.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:bb8])
 (user=royluo job=sendgmr) by 2002:a05:690c:470e:b0:5cb:d80c:3d34 with SMTP id
 gz14-20020a05690c470e00b005cbd80c3d34mr263835ywb.8.1701122450148; Mon, 27 Nov
 2023 14:00:50 -0800 (PST)
Date: Mon, 27 Nov 2023 22:00:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231127220047.2199234-1-royluo@google.com>
Subject: [PATCH v2] USB: gadget: core: adjust uevent timing on gadget unbind
From: Roy Luo <royluo@google.com>
To: royluo@google.com, gregkh@linuxfoundation.org, stern@rowland.harvard.edu, 
	badhri@google.com, quic_kriskura@quicinc.com, francesco.dolcini@toradex.com, 
	quic_eserrao@quicinc.com, ivan.orlov0322@gmail.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The KOBJ_CHANGE uevent is sent before gadget unbind is actually
executed, resulting in inaccurate uevent emitted at incorrect timing
(the uevent would have USB_UDC_DRIVER variable set while it would
soon be removed).
Move the KOBJ_CHANGE uevent to the end of the unbind function so that
uevent is sent only after the change has been made.

Fixes: 2ccea03a8f7e ("usb: gadget: introduce UDC Class")
Signed-off-by: Roy Luo <royluo@google.com>
---
Changes since v1: add Fixes tag
---
 drivers/usb/gadget/udc/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index ded9531f141b..d59f94464b87 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1646,8 +1646,6 @@ static void gadget_unbind_driver(struct device *dev)
 
 	dev_dbg(&udc->dev, "unbinding gadget driver [%s]\n", driver->function);
 
-	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
-
 	udc->allow_connect = false;
 	cancel_work_sync(&udc->vbus_work);
 	mutex_lock(&udc->connect_lock);
@@ -1667,6 +1665,8 @@ static void gadget_unbind_driver(struct device *dev)
 	driver->is_bound = false;
 	udc->driver = NULL;
 	mutex_unlock(&udc_lock);
+
+	kobject_uevent(&udc->dev.kobj, KOBJ_CHANGE);
 }
 
 /* ------------------------------------------------------------------------- */

base-commit: 9b6de136b5f0158c60844f85286a593cb70fb364
-- 
2.43.0.rc1.413.gea7ed67945-goog


