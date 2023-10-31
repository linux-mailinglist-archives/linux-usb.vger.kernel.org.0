Return-Path: <linux-usb+bounces-2375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23D7DC50C
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 04:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8988BB20ED4
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 03:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45044568C;
	Tue, 31 Oct 2023 03:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hUMsp+3Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B65353A2
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 03:54:13 +0000 (UTC)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E8FFC
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 20:54:11 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7cfdacf8fso52771237b3.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 20:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698724450; x=1699329250; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2cP+jDgw/2kP2sqdhKr1b6gogBv0upq1OLhtOXXb4qE=;
        b=hUMsp+3QTspn4HUPM16z6tezTZjk0W3dKrjhgyZj0xhrDpWfO8quLgRh4qDfzsfXWR
         /VemPdm0axb9IIEgcy5VUBYtoCWFtj9porV94st3kEAHCpDyZHR09Y7IbKQpgk9BRyxG
         M/eKDMc18yVf3xmBUOIWsTL5e3Vm44JGb3k9yJFYyEZDiYFSrbkfU2BQ/4+0bXe8aQka
         5mzIJtTaK+XsXuc/AhQxM5nz97o2yh1El/nTcwU/mbvQvP/3MklDgFzXYIV8YJ0sAtPD
         Yw6cv2++sX9PaggHpx4A6fo8UPA4oe0CByzz8HJQkDVDa8TEOTb0BaCCu8mFyu2u5PB9
         cVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698724450; x=1699329250;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cP+jDgw/2kP2sqdhKr1b6gogBv0upq1OLhtOXXb4qE=;
        b=uEozPHykavvq0DAfwJlc+6DFK4kfvFUh1pFz1DLSrUNs5ckYCx7aVYL5plUH7PII+d
         IRLXAHHezBbwWZzCS129mtbcJ84kyb+EgItIRAPSEbgz51r4spPHzPz8aF0tIqVuwQ06
         FDUMJYzzIAcY770YcA8p8T3Dhfi4zRshG2MOyrzBG/YPqwDA9Ce2Kpj1amr2jY+a8FhP
         wm5pWiI/AeZsl+Ft2/grwc9wmp/bb5FCDhdK1F3FaEDv/35EuCUkle1DVHYOhVb/nCTF
         4Qu7jpplCDaQUQZmNM8qbASaBSjraGDFPzmYM47GflWZyeh5/G+ELGEOq6B+EZaN+juX
         g6mQ==
X-Gm-Message-State: AOJu0Yzn+3uUAa2R+NdBwhsYI6uVJi40B25yLZJfFaA8fdlYY5xGdElg
	7HI2GdZTYuZNaVNCZNKP1fjsa+VWC3e/
X-Google-Smtp-Source: AGHT+IHGg0y7OU+iyHQXVt+LK3C1hQ4yiq0V2qpg6y69gt9i7uZwJItKrRflBjP8X+XmHUqg3XuSC9o3kcoZ
X-Received: from maurora-apa.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:1184])
 (user=maurora job=sendgmr) by 2002:a5b:e83:0:b0:da0:6876:a8f4 with SMTP id
 z3-20020a5b0e83000000b00da06876a8f4mr37799ybr.2.1698724450352; Mon, 30 Oct
 2023 20:54:10 -0700 (PDT)
Date: Tue, 31 Oct 2023 03:54:02 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231031035403.661938-1-maurora@google.com>
Subject: [PATCH] usb: gadget: Support transfers from device memory
From: Manan Aurora <maurora@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Badhri Jagan Sridharan <badhri@google.com>, Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	manugautam@google.com, Manan Aurora <maurora@google.com>
Content-Type: text/plain; charset="UTF-8"

USB gadget stack only supports usb_request objects that point to buffers
located in memory. Support use cases where data is transferred from
physical addresses in device mmio regions

Added a bit "pre_mapped" to usb_request to bypass dma_map_single and
dma_map_sg for such requests

The caller must determine the dma address for the request before queuing
it

Signed-off-by: Manan Aurora <maurora@google.com>
---
 drivers/usb/gadget/udc/core.c | 4 ++--
 include/linux/usb/gadget.h    | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index ded9531f141b..236165ba08f4 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -900,7 +900,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_activate);
 int usb_gadget_map_request_by_dev(struct device *dev,
 		struct usb_request *req, int is_in)
 {
-	if (req->length == 0)
+	if (req->pre_mapped || req->length == 0)
 		return 0;
 
 	if (req->num_sgs) {
@@ -948,7 +948,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_map_request);
 void usb_gadget_unmap_request_by_dev(struct device *dev,
 		struct usb_request *req, int is_in)
 {
-	if (req->length == 0)
+	if (req->pre_mapped || req->length == 0)
 		return;
 
 	if (req->num_mapped_sgs) {
diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
index a771ccc038ac..6bc035439098 100644
--- a/include/linux/usb/gadget.h
+++ b/include/linux/usb/gadget.h
@@ -111,6 +111,7 @@ struct usb_request {
 	unsigned		zero:1;
 	unsigned		short_not_ok:1;
 	unsigned		dma_mapped:1;
+	unsigned		pre_mapped:1;
 
 	void			(*complete)(struct usb_ep *ep,
 					struct usb_request *req);
-- 
2.42.0.820.g83a721a137-goog


