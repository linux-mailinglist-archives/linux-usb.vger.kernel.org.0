Return-Path: <linux-usb+bounces-28142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38609B59051
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 10:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCBF21B274C5
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 08:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE08D2EBB9B;
	Tue, 16 Sep 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rj7qE2tp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FE52EB842
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758010906; cv=none; b=BNI6eVuZzu5eOLC5zcFL/D4OPRdI1zqAJvjx5/jyMXZA1xKKmS5beEynX3QR7fiTW0aOwDNf4fsPhjMrVIj+xVwXnqXXj/242xEOTr4CtV8X64W3cfNyPePnBaDyyGkizNYey2Y0PywQVVNvAqVNMp9dkZGqMDkflcE79wQ5G2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758010906; c=relaxed/simple;
	bh=N/7rPySAgQOu8W8dwCVj3UJzonthS9K7jZ498RsuujQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TUzgmdc8Y9CkOSRRMvW0uk1j2UvoyDiKwiQu0zScPZMWdkZPgfXQPTOUxzuePzle+wFK5FaIpBUaD+N1AmmqtMmYVRQlOWeLPS66Lmkk641cEQEeR9AUM77h0+AZOTLTeoawbQr5kzgix6lmfEPIxL6Kfke1rtWrJY67+1MwbMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rj7qE2tp; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b54b311beabso2618657a12.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 01:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758010904; x=1758615704; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EqhhgJga+nem6ZRi78lVMECZxqVyLV2vinhBZXlldyA=;
        b=rj7qE2tp7b6/+wL+PzZB+dslzPq7ZySxGt/MvIjxuGDhhOnttxZlMfysDK15H00RCa
         SzlCesBwnqpz+8Z3pT0B6aRo9G8eRa3Non1jVgQ63lnzJQS9/xQ2jnbstg9P13RyGkHu
         CPkuFq80/RXr2B3xXDbZXU6vL4VbRPEdUV0NCs5YmYnpJ8RKQbYBvd7awT5KXbYPk43O
         OPBht4VQHi3pGaq/PhAiW0JfT5h/vV3kQcVgh/aL9YjKNX4eVU8eusBFLxA89fTlnup6
         R4GS2Mvzg/JWWoDLkqzfzjkYRs4dunwFfnUt7LUZ9or4QhvW7f7wh4fAXH0PL7QMxFWn
         EjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758010904; x=1758615704;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EqhhgJga+nem6ZRi78lVMECZxqVyLV2vinhBZXlldyA=;
        b=Tl/V5SdrqsvDtoCVZwDfBE8S2HOrPWwHnYnDkbH1YJqss/BmRWojBYCZhcT+3MoSpD
         lkJJclHrfnYrBAtk9H9Sff3Dk2MGaWJIvYn5Bat12du0YblsFA3QiEWmm2+s6S+FLQo/
         6Y4LPhBr+spXKNUGZCulD0tIgY1SJGx6bzCeIMjFZwdrFZVQAYKcfC+QMp/oMnjDoyty
         oKovx87rn2q8H8BR9U2LfEk846kf0lZXaGO3c+F32rQVjpbB8pqobGDuCxDjUP1P1by1
         NM95+uwQmjYlolvLVDWnydUvAi7w5q1FEMGPfL4jbJP3FMhRUeC+plN5DdS9nZGWQn+l
         OtdA==
X-Gm-Message-State: AOJu0YzXQCaIbn5hR51dlxbl2keK/2VkeGesXK1HEJrPiZSf/tRxhd1i
	6Xxzr+zwfkHM/HZ8gKdipmhE+2XrB8MbYai2oVTaTUpLkmsFLvsa81epZwjwFcrfQQ8D+wXwqj0
	1FBskew==
X-Google-Smtp-Source: AGHT+IG85Cw5/Sxac3Ad82ihlrD1bHJAF+MbMWjVkCwp94Y+r6uFS/36rHDY7PypBjIn2FxOYjLJtROkXGc=
X-Received: from pfst40.prod.google.com ([2002:aa7:8fa8:0:b0:771:e00d:cee])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9289:b0:772:4759:e433
 with SMTP id d2e1a72fcca58-7761209bdeemr18234364b3a.2.1758010903803; Tue, 16
 Sep 2025 01:21:43 -0700 (PDT)
Date: Tue, 16 Sep 2025 16:21:34 +0800
In-Reply-To: <20250916-ready-v1-0-4997bf277548@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250916-ready-v1-0-4997bf277548@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758010894; l=6688;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=N/7rPySAgQOu8W8dwCVj3UJzonthS9K7jZ498RsuujQ=; b=c3qch1HdrAPIjLCTmXnfXgir5tbyX9bJ6SdqN3sXIbawHDzDxRndIBP3FxzliNyu9izEaw6CT
 pZiynYcaFbWBK+Zh933MfzBZq63ZpX0Ii9AVPz/2nL/7GQxqN586/62
X-Mailer: b4 0.14.2
Message-ID: <20250916-ready-v1-3-4997bf277548@google.com>
Subject: [PATCH 3/6] usb: gadget: f_ncm: Refactor bind path to use __free()
From: Kuen-Han Tsai <khtsai@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	David Brownell <dbrownell@users.sourceforge.net>, Nam Cao <namcao@linutronix.de>, 
	Zack Rusin <zack.rusin@broadcom.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Prashanth K <prashanth.k@oss.qualcomm.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, John Keeping <jkeeping@inmusicbrands.com>, 
	Roy Luo <royluo@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kuen-Han Tsai <khtsai@google.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"

After an bind/unbind cycle, the ncm->notify_req is left stale. If a
subsequent bind fails, the unified error label attempts to free this
stale request, leading to a NULL pointer dereference when accessing
ep->ops->free_request.

Refactor the error handling in the bind path to use the __free()
automatic cleanup mechanism.

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
Call trace:
 usb_ep_free_request+0x2c/0xec
 ncm_bind+0x39c/0x3dc
 usb_add_function+0xcc/0x1f0
 configfs_composite_bind+0x468/0x588
 gadget_bind_driver+0x104/0x270
 really_probe+0x190/0x374
 __driver_probe_device+0xa0/0x12c
 driver_probe_device+0x3c/0x218
 __device_attach_driver+0x14c/0x188
 bus_for_each_drv+0x10c/0x168
 __device_attach+0xfc/0x198
 device_initial_probe+0x14/0x24
 bus_probe_device+0x94/0x11c
 device_add+0x268/0x48c
 usb_add_gadget+0x198/0x28c
 dwc3_gadget_init+0x700/0x858
 __dwc3_set_mode+0x3cc/0x664
 process_scheduled_works+0x1d8/0x488
 worker_thread+0x244/0x334
 kthread+0x114/0x1bc
 ret_from_fork+0x10/0x20

Fixes: 9f6ce4240a2b ("usb: gadget: f_ncm.c added")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 78 ++++++++++++++++---------------------
 1 file changed, 33 insertions(+), 45 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 58b0dd575af32a95f8ae1fa7d9483638d37fd052..0148d60926dcf751b7c464c2922d194ef965bdfd 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -11,6 +11,7 @@
  * Copyright (C) 2008 Nokia Corporation
  */
 
+#include <linux/cleanup.h>
 #include <linux/kernel.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
@@ -20,6 +21,7 @@
 #include <linux/string_choices.h>
 
 #include <linux/usb/cdc.h>
+#include <linux/usb/gadget.h>
 
 #include "u_ether.h"
 #include "u_ether_configfs.h"
@@ -1436,18 +1438,18 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	struct usb_ep		*ep;
 	struct f_ncm_opts	*ncm_opts;
 
+	struct usb_os_desc_table	*os_desc_table __free(kfree) = NULL;
+	struct usb_request		*request __free(free_usb_request) = NULL;
+
 	if (!can_support_ecm(cdev->gadget))
 		return -EINVAL;
 
 	ncm_opts = container_of(f->fi, struct f_ncm_opts, func_inst);
 
 	if (cdev->use_os_string) {
-		f->os_desc_table = kzalloc(sizeof(*f->os_desc_table),
-					   GFP_KERNEL);
-		if (!f->os_desc_table)
+		os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);
+		if (!os_desc_table)
 			return -ENOMEM;
-		f->os_desc_n = 1;
-		f->os_desc_table[0].os_desc = &ncm_opts->ncm_os_desc;
 	}
 
 	mutex_lock(&ncm_opts->lock);
@@ -1459,16 +1461,15 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	mutex_unlock(&ncm_opts->lock);
 
 	if (status)
-		goto fail;
+		return status;
 
 	ncm_opts->bound = true;
 
 	us = usb_gstrings_attach(cdev, ncm_strings,
 				 ARRAY_SIZE(ncm_string_defs));
-	if (IS_ERR(us)) {
-		status = PTR_ERR(us);
-		goto fail;
-	}
+	if (IS_ERR(us))
+		return PTR_ERR(us);
+
 	ncm_control_intf.iInterface = us[STRING_CTRL_IDX].id;
 	ncm_data_nop_intf.iInterface = us[STRING_DATA_IDX].id;
 	ncm_data_intf.iInterface = us[STRING_DATA_IDX].id;
@@ -1478,20 +1479,16 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	/* allocate instance-specific interface IDs */
 	status = usb_interface_id(c, f);
 	if (status < 0)
-		goto fail;
+		return status;
 	ncm->ctrl_id = status;
 	ncm_iad_desc.bFirstInterface = status;
 
 	ncm_control_intf.bInterfaceNumber = status;
 	ncm_union_desc.bMasterInterface0 = status;
 
-	if (cdev->use_os_string)
-		f->os_desc_table[0].if_id =
-			ncm_iad_desc.bFirstInterface;
-
 	status = usb_interface_id(c, f);
 	if (status < 0)
-		goto fail;
+		return status;
 	ncm->data_id = status;
 
 	ncm_data_nop_intf.bInterfaceNumber = status;
@@ -1500,35 +1497,31 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 
 	ecm_desc.wMaxSegmentSize = cpu_to_le16(ncm_opts->max_segment_size);
 
-	status = -ENODEV;
-
 	/* allocate instance-specific endpoints */
 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_in_desc);
 	if (!ep)
-		goto fail;
+		return -ENODEV;
 	ncm->port.in_ep = ep;
 
 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_out_desc);
 	if (!ep)
-		goto fail;
+		return -ENODEV;
 	ncm->port.out_ep = ep;
 
 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ncm_notify_desc);
 	if (!ep)
-		goto fail;
+		return -ENODEV;
 	ncm->notify = ep;
 
-	status = -ENOMEM;
-
 	/* allocate notification request and buffer */
-	ncm->notify_req = usb_ep_alloc_request(ep, GFP_KERNEL);
-	if (!ncm->notify_req)
-		goto fail;
-	ncm->notify_req->buf = kmalloc(NCM_STATUS_BYTECOUNT, GFP_KERNEL);
-	if (!ncm->notify_req->buf)
-		goto fail;
-	ncm->notify_req->context = ncm;
-	ncm->notify_req->complete = ncm_notify_complete;
+	request = usb_ep_alloc_request(ep, GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+	request->buf = kmalloc(NCM_STATUS_BYTECOUNT, GFP_KERNEL);
+	if (!request->buf)
+		return -ENOMEM;
+	request->context = ncm;
+	request->complete = ncm_notify_complete;
 
 	/*
 	 * support all relevant hardware speeds... we expect that when
@@ -1548,7 +1541,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 	status = usb_assign_descriptors(f, ncm_fs_function, ncm_hs_function,
 			ncm_ss_function, ncm_ss_function);
 	if (status)
-		goto fail;
+		return status;
 
 	/*
 	 * NOTE:  all that is done without knowing or caring about
@@ -1561,23 +1554,18 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 
 	hrtimer_setup(&ncm->task_timer, ncm_tx_timeout, CLOCK_MONOTONIC, HRTIMER_MODE_REL_SOFT);
 
+	if (cdev->use_os_string) {
+		os_desc_table[0].os_desc = &ncm_opts->ncm_os_desc;
+		os_desc_table[0].if_id = ncm_iad_desc.bFirstInterface;
+		f->os_desc_table = no_free_ptr(os_desc_table);
+		f->os_desc_n = 1;
+	}
+	ncm->notify_req = no_free_ptr(request);
+
 	DBG(cdev, "CDC Network: IN/%s OUT/%s NOTIFY/%s\n",
 			ncm->port.in_ep->name, ncm->port.out_ep->name,
 			ncm->notify->name);
 	return 0;
-
-fail:
-	kfree(f->os_desc_table);
-	f->os_desc_n = 0;
-
-	if (ncm->notify_req) {
-		kfree(ncm->notify_req->buf);
-		usb_ep_free_request(ncm->notify, ncm->notify_req);
-	}
-
-	ERROR(cdev, "%s: can't bind, err %d\n", f->name, status);
-
-	return status;
 }
 
 static inline struct f_ncm_opts *to_f_ncm_opts(struct config_item *item)

-- 
2.51.0.384.g4c02a37b29-goog


