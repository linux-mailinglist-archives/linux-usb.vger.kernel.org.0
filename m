Return-Path: <linux-usb+bounces-28144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46403B59055
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 10:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2732A73BF
	for <lists+linux-usb@lfdr.de>; Tue, 16 Sep 2025 08:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBEE28B51E;
	Tue, 16 Sep 2025 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pSnccMmS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F842EC09F
	for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 08:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758010912; cv=none; b=btqGGr4aT/oiuKhR0isvmXec4npkKtxceAhTj0yeCJ2OSLml8XZx9+X9lJwtzVwawnZoemsRvYVLmVVSnvxBKb44j/Zpmgs2uYrWB33Bc0r1Ghm+pblXERunJPR7sZqD5UCJts0dSaoLspYiVqVBoA0SYLzxoiytS3ubcQQh1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758010912; c=relaxed/simple;
	bh=nzUJUBQUDY6IjnlDTIkln8mW+kfgV5L3cPxxckekh/M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YdV1Asaok9qVllnB/WYj3tJJAv2a0AJtae2NOI59Z0aDe4FvihPZFQRL/cd7GOy4XnoVuNr9dGvgzfaVEmd63s27F7Nf6xIlDutrLrp6uvLD5MSarVrCnynYxnDcbWGCeuUazH7CDXTM0MeLuI3POtddVpi2t38Of2JCDTTkfx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pSnccMmS; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--khtsai.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-25d21fddb85so73012095ad.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Sep 2025 01:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758010909; x=1758615709; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6KEyWg5U4Q05BuxI9yT5T5sEUrMlo9n5Xv8LbVudls=;
        b=pSnccMmSFgskPzC1X2TP9RAOk58y6jbkpwX551tK6OOLCz9Wd/ZP2vlP2vtc5ZrqeB
         xBiyk7NGfw0d9VggVi/a3Er488Fmag5d9hm7s5eB+jv/lRlahrV5WtM98smL1F4+cG1M
         ktojoDC6ePGYdwj4e58EH+s70C3xZR279cogbjVueRtMDlDEN/YiUDHYIZ/N6K9TASch
         /RFc0V6clD4pZBSOGqVXNNayYmXkSGWPFI0dxMk2XSaYWbQO2wieHWWPsgpRIJVX0FSP
         DP6Q8WBGEiaSOLlfB6pC8UvSy0Cc57pU42GmKeHt2BfReAVJgpK613O0uDj+8ydhHcSN
         B1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758010909; x=1758615709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6KEyWg5U4Q05BuxI9yT5T5sEUrMlo9n5Xv8LbVudls=;
        b=Ncbd1ok3JrHzo/zaGorlBoauxA2bsz9OIYdcLUdfaUmFimXrAoQDmPr+h04G9IakHE
         opnCgvUt1ZvVEl0A1Lfy4nX36SW3nIXwN69eFZb//5pvuP4d2TXGRd5cD/CV4c+2Tn/Z
         skCNbuBw8wLpR0ljD5pxLMgTOYrDATeWUUb/p15ZL+00lqd1MFJVY2BUptP/XLzrkWR9
         jH4Y5QtZyTPom8XgZoXK4WOatcpOVjB3044UiMH9hhZYOknMi4FXp0YCBZkD1TW0/O2f
         gqYM2cZOG58pueFqiQyM6de+tA1DHKmSmmuV/L6xLUyo5sO0BkyyB/MAmMtAUMRuP2mS
         atxA==
X-Gm-Message-State: AOJu0YzLtDd6aYhMqTUJ7H79rwt1ydutLRsAzF2sE0rGmuUxPaqr5UoM
	08hgNAlFf8G67ienMHi3FSKtIC2hdCJnFgAxirLp17hRetD249cfGN4Ho038zCOqp7y3CmitNi3
	58aXwhg==
X-Google-Smtp-Source: AGHT+IFQoROC6DO6NsAcnx7lNpGk7R8oDG7xj1iNrSLy1+m6NH3iLLjA9tVJeTEuD+rPSe8yUuz1smsBOoY=
X-Received: from plgi5.prod.google.com ([2002:a17:902:cf05:b0:267:e3c2:182d])
 (user=khtsai job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:478d:b0:265:acc3:d312
 with SMTP id d9443c01a7336-265acc3d46bmr93071495ad.43.1758010909064; Tue, 16
 Sep 2025 01:21:49 -0700 (PDT)
Date: Tue, 16 Sep 2025 16:21:36 +0800
In-Reply-To: <20250916-ready-v1-0-4997bf277548@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250916-ready-v1-0-4997bf277548@google.com>
X-Developer-Key: i=khtsai@google.com; a=ed25519; pk=abA4Pw6dY2ZufSbSXW9mtp7xiv1AVPtgRhCFWJSEqLE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758010894; l=4610;
 i=khtsai@google.com; s=20250916; h=from:subject:message-id;
 bh=nzUJUBQUDY6IjnlDTIkln8mW+kfgV5L3cPxxckekh/M=; b=FXplXMMjNF7hhFe9P3At0BZbxF/fa0xizJlEnR67dc3Hlb3Kd/sDpeo2ok4ItCJryANkscJ+R
 9ims8ubyAQPDYyR6h2TCbWnOU3BV3ZCVOpBOFygIqtvugLG5UkK738s
X-Mailer: b4 0.14.2
Message-ID: <20250916-ready-v1-5-4997bf277548@google.com>
Subject: [PATCH 5/6] usb: gadget: f_ecm: Refactor bind path to use __free()
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

After an bind/unbind cycle, the ecm->notify_req is left stale. If a
subsequent bind fails, the unified error label attempts to free this
stale request, leading to a NULL pointer dereference when accessing
ep->ops->free_request.

Refactor the error handling in the bind path to use the __free()
automatic cleanup mechanism.

Fixes: da741b8c56d6 ("usb ethernet gadget: split CDC Ethernet function")
Cc: stable@kernel.org
Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
---
 drivers/usb/gadget/function/f_ecm.c | 48 ++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ecm.c b/drivers/usb/gadget/function/f_ecm.c
index 027226325039f0c8eaee27a339513a758c01786b..675d2bc538a45747de601b0fcf2b7b8757642214 100644
--- a/drivers/usb/gadget/function/f_ecm.c
+++ b/drivers/usb/gadget/function/f_ecm.c
@@ -8,6 +8,7 @@
 
 /* #define VERBOSE_DEBUG */
 
+#include <linux/cleanup.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -15,6 +16,8 @@
 #include <linux/etherdevice.h>
 #include <linux/string_choices.h>
 
+#include <linux/usb/gadget.h>
+
 #include "u_ether.h"
 #include "u_ether_configfs.h"
 #include "u_ecm.h"
@@ -678,6 +681,7 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 	struct usb_ep		*ep;
 
 	struct f_ecm_opts	*ecm_opts;
+	struct usb_request	*request __free(free_usb_request) = NULL;
 
 	if (!can_support_ecm(cdev->gadget))
 		return -EINVAL;
@@ -711,7 +715,7 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 	/* allocate instance-specific interface IDs */
 	status = usb_interface_id(c, f);
 	if (status < 0)
-		goto fail;
+		return status;
 	ecm->ctrl_id = status;
 	ecm_iad_descriptor.bFirstInterface = status;
 
@@ -720,24 +724,22 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 
 	status = usb_interface_id(c, f);
 	if (status < 0)
-		goto fail;
+		return status;
 	ecm->data_id = status;
 
 	ecm_data_nop_intf.bInterfaceNumber = status;
 	ecm_data_intf.bInterfaceNumber = status;
 	ecm_union_desc.bSlaveInterface0 = status;
 
-	status = -ENODEV;
-
 	/* allocate instance-specific endpoints */
 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ecm_in_desc);
 	if (!ep)
-		goto fail;
+		return -ENODEV;
 	ecm->port.in_ep = ep;
 
 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ecm_out_desc);
 	if (!ep)
-		goto fail;
+		return -ENODEV;
 	ecm->port.out_ep = ep;
 
 	/* NOTE:  a status/notification endpoint is *OPTIONAL* but we
@@ -746,20 +748,18 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 	 */
 	ep = usb_ep_autoconfig(cdev->gadget, &fs_ecm_notify_desc);
 	if (!ep)
-		goto fail;
+		return -ENODEV;
 	ecm->notify = ep;
 
-	status = -ENOMEM;
-
 	/* allocate notification request and buffer */
-	ecm->notify_req = usb_ep_alloc_request(ep, GFP_KERNEL);
-	if (!ecm->notify_req)
-		goto fail;
-	ecm->notify_req->buf = kmalloc(ECM_STATUS_BYTECOUNT, GFP_KERNEL);
-	if (!ecm->notify_req->buf)
-		goto fail;
-	ecm->notify_req->context = ecm;
-	ecm->notify_req->complete = ecm_notify_complete;
+	request = usb_ep_alloc_request(ep, GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+	request->buf = kmalloc(ECM_STATUS_BYTECOUNT, GFP_KERNEL);
+	if (!request->buf)
+		return -ENOMEM;
+	request->context = ecm;
+	request->complete = ecm_notify_complete;
 
 	/* support all relevant hardware speeds... we expect that when
 	 * hardware is dual speed, all bulk-capable endpoints work at
@@ -778,7 +778,7 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 	status = usb_assign_descriptors(f, ecm_fs_function, ecm_hs_function,
 			ecm_ss_function, ecm_ss_function);
 	if (status)
-		goto fail;
+		return status;
 
 	/* NOTE:  all that is done without knowing or caring about
 	 * the network link ... which is unavailable to this code
@@ -788,20 +788,12 @@ ecm_bind(struct usb_configuration *c, struct usb_function *f)
 	ecm->port.open = ecm_open;
 	ecm->port.close = ecm_close;
 
+	ecm->notify_req = no_free_ptr(request);
+
 	DBG(cdev, "CDC Ethernet: IN/%s OUT/%s NOTIFY/%s\n",
 			ecm->port.in_ep->name, ecm->port.out_ep->name,
 			ecm->notify->name);
 	return 0;
-
-fail:
-	if (ecm->notify_req) {
-		kfree(ecm->notify_req->buf);
-		usb_ep_free_request(ecm->notify, ecm->notify_req);
-	}
-
-	ERROR(cdev, "%s: can't bind, err %d\n", f->name, status);
-
-	return status;
 }
 
 static inline struct f_ecm_opts *to_f_ecm_opts(struct config_item *item)

-- 
2.51.0.384.g4c02a37b29-goog


