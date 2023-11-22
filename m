Return-Path: <linux-usb+bounces-3215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9797F52E6
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 23:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59DB41C20B76
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 22:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875731D6B0;
	Wed, 22 Nov 2023 22:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HUXhGEt3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2778ED41
	for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 14:00:34 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-db084a0a2e9so290637276.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Nov 2023 14:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700690433; x=1701295233; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VwCvT/dsp9D8lLZGUBpN5q/USmNxw15gs9X4QsQc4Fw=;
        b=HUXhGEt3+RyaICITA+kxA/raWwRmc84BK8ty5mBc3fNNOW2GzaMqPO6h6rW9fn1Y3S
         SowvS6i7ASfOU3lrCeMzESaQ5US0M8fpzPyEKMQkho8Z3kYYuOcLIcBsGzq9m2QFkYhC
         5uxo5ueuWka/ZHy8xsUkGMjgRwJBnAPKWO5OmXvICbdKwMomLRsRCLjxK6+azNwh4aoO
         nMRrExoegLVwg8hh85csq5HP1T0U+Kj2PCbGg4SQ9bs5XLSu5uOPPDqet5y4YxYSoDOT
         PSEEf2Kt46AIT8iX6wTFemfcuCm5pXwFqgQEA1U3jvv+uAtbBzS2tQOYmA/yqZfjsGun
         TwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700690433; x=1701295233;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwCvT/dsp9D8lLZGUBpN5q/USmNxw15gs9X4QsQc4Fw=;
        b=ERu8VW3sncdYRprOxCJB87Tpli0bKgSi/R5bvSwYQ63jSsbA1BcRu9BvcVDQVDvCHh
         oSC+dXTb5z/zDYDQsRgzh5n64oaNk1QAgzll1SdUWvjgD0fdanJjUMpuLY5S0RHzzREY
         4lcR0WYLmZxA+gVPe3rsdvWJEVfy/Rl3PEAW4+KEpSnEs9BWnecVZfj6FEgLqyqcf+gf
         I8f4+a1AQG1urY/PFh+rGEGM47xvY9z/DT7Iay8GCIEuj1zeLGZkMTKb3ma6wq67Rif1
         WoANQ7gAuL6Fxk7bKH4AHO6azxfH12rQ7ptxGtP0SCBowFI7/gRZ3WkV7AT2h0Jl38+x
         RCOw==
X-Gm-Message-State: AOJu0YzF2KeYsf42xQE7yXFrJFwkoMwHj/8OrrwDECXupfn9/tp5XD5F
	Bx3aR9NCQosxa/tdqHfjXqBTRAjZpwU=
X-Google-Smtp-Source: AGHT+IEL/pnocvmHrn/XYSGAEzDzJqnyX/9eKAwjY8bggLVmf7lFsaiKZ+3bWBDNgqFZD6COkVyjYJ51Afg=
X-Received: from royluo-cloudtop0.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:bb8])
 (user=royluo job=sendgmr) by 2002:a25:2d1:0:b0:da3:b4ef:29fe with SMTP id
 200-20020a2502d1000000b00da3b4ef29femr100305ybc.13.1700690433222; Wed, 22 Nov
 2023 14:00:33 -0800 (PST)
Date: Wed, 22 Nov 2023 22:00:01 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
Message-ID: <20231122220001.539770-1-royluo@google.com>
Subject: [PATCH v1] USB: gadget: core: adjust uevent timing on gadget unbind
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

Signed-off-by: Roy Luo <royluo@google.com>
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


