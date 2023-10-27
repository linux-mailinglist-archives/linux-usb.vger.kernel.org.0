Return-Path: <linux-usb+bounces-2299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4ED7DA091
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 20:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585A21C210B7
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 18:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28643C07C;
	Fri, 27 Oct 2023 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z5ILT5hv"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0C03CD01
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 18:34:53 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2694E1A1
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 11:34:52 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d9bc6447193so1963406276.3
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 11:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698431691; x=1699036491; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2KQL5mvly38v1BFhse+1fz0BAqnm18zxyTLFh/7tsk=;
        b=Z5ILT5hvKkDIHkefyZ7DIbBIF4l+w7ELSsLPK5m/QuyaiH5Aw4BbDIsLkqFnnFA3TB
         4Fv/axwSRpcfIKikQYYzcPYcM5mhIGd7cT8dvN18RQjgxCIHQxeQXDxfw5ih6bFTvI1a
         dp8lsS19F67GlMSvqFtbIU+owE7wY/WB6rmv+WG/LosTg3PLLncwFyKk98j6HU1toKRX
         yh9ZGH06yCf2KOkXRcK/WFCXc88PdlO3vua+PPrukDveeKhed+rs1ARycDwM5HnLdmEJ
         lbyBWXBoH5jtUlzy6JMj1QJ62nVcto3fPQy5btlPoY2DMdfpIpDxiWWXkaAhbyUy07/p
         bHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698431691; x=1699036491;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2KQL5mvly38v1BFhse+1fz0BAqnm18zxyTLFh/7tsk=;
        b=DBnhBk9PAfo0Rr2Ho7YmxcGPJo0WAJlL1fXA9Tunua6tR//0oAglG6Mnqh2lp1wF4X
         wThBXuVTDVzBAjrlOVRj5GtV/16A5xOUYIWM84r1sS8+To1W9McN4o1lbLCe4nwhIoBh
         G/d/FyoT4lsDW0l8+JD8OFUE28cBRSF6lMYQo1CWJTazBqw++ev2WMFQkneGUBiOdBlV
         2UD9VlPfnPpxOB+6E9fx85M24vigDyG7pHubdGJX4OTWapkVcHaoZlXY4Hu3geF8Busk
         k/A9vMC1vF3l53Nl185XSAb9b8lRkTkbjlKkwsbZb/6KaJKvlxPBMlbbDYQnYAfbws27
         1pKA==
X-Gm-Message-State: AOJu0YwbHGRNVTOcB/IIp3ufAtyvCuBwGUV53ljC3SeqDoXbK7lARTNi
	ttDEVQ4my8eYI4zcmzAgSZJ37ujHSPsP8JDxGw==
X-Google-Smtp-Source: AGHT+IHO7TfvuhqtaNPamSWCx8oIFoDkAauEh146HYvDhEqkkJsUEpXQ/mGMMdFvo6VFXYCnA+3y2HxsYhlkjW1YXQ==
X-Received: from shuzhenwang.mtv.corp.google.com ([2620:15c:211:201:c5e7:1675:d0d:2a4c])
 (user=shuzhenwang job=sendgmr) by 2002:a05:6902:565:b0:da0:c979:fd70 with
 SMTP id a5-20020a056902056500b00da0c979fd70mr70535ybt.9.1698431691381; Fri,
 27 Oct 2023 11:34:51 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:34:40 -0700
In-Reply-To: <14ceb63f-1769-4025-ad90-c38112dfec79@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <14ceb63f-1769-4025-ad90-c38112dfec79@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027183440.1994315-1-shuzhenwang@google.com>
Subject: [PATCH v2] usb: gadget: uvc: Add missing initialization of ssp config descriptor
From: Shuzhen Wang <shuzhenwang@google.com>
To: shuzhenwang@google.com, gregkh@linuxfoundation.org
Cc: balbi@kernel.org, laurent.pinchart@ideasonboard.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In case the uvc gadget is super speed plus, the corresponding config
descriptor wasn't initialized. As a result, the host will not recognize
the devices when using super speed plus connection.

This patch initializes them to super speed descriptors.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Shuzhen Wang <shuzhenwang@google.com>
---
 v2: fix patch formatting

 drivers/usb/gadget/function/f_uvc.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
index faa398109431..786379f1b7b7 100644
--- a/drivers/usb/gadget/function/f_uvc.c
+++ b/drivers/usb/gadget/function/f_uvc.c
@@ -516,6 +516,7 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 	void *mem;
 
 	switch (speed) {
+	case USB_SPEED_SUPER_PLUS:
 	case USB_SPEED_SUPER:
 		uvc_control_desc = uvc->desc.ss_control;
 		uvc_streaming_cls = uvc->desc.ss_streaming;
@@ -564,7 +565,8 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 		bytes += uvc_interrupt_ep.bLength + uvc_interrupt_cs_ep.bLength;
 		n_desc += 2;
 
-		if (speed == USB_SPEED_SUPER) {
+		if (speed == USB_SPEED_SUPER ||
+		    speed == USB_SPEED_SUPER_PLUS) {
 			bytes += uvc_ss_interrupt_comp.bLength;
 			n_desc += 1;
 		}
@@ -619,7 +621,8 @@ uvc_copy_descriptors(struct uvc_device *uvc, enum usb_device_speed speed)
 
 	if (uvc->enable_interrupt_ep) {
 		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_ep);
-		if (speed == USB_SPEED_SUPER)
+		if (speed == USB_SPEED_SUPER ||
+		    speed == USB_SPEED_SUPER_PLUS)
 			UVC_COPY_DESCRIPTOR(mem, dst, &uvc_ss_interrupt_comp);
 
 		UVC_COPY_DESCRIPTOR(mem, dst, &uvc_interrupt_cs_ep);
@@ -795,6 +798,13 @@ uvc_function_bind(struct usb_configuration *c, struct usb_function *f)
 		goto error;
 	}
 
+	f->ssp_descriptors = uvc_copy_descriptors(uvc, USB_SPEED_SUPER_PLUS);
+	if (IS_ERR(f->ssp_descriptors)) {
+		ret = PTR_ERR(f->ssp_descriptors);
+		f->ssp_descriptors = NULL;
+		goto error;
+	}
+
 	/* Preallocate control endpoint request. */
 	uvc->control_req = usb_ep_alloc_request(cdev->gadget->ep0, GFP_KERNEL);
 	uvc->control_buf = kmalloc(UVC_MAX_REQUEST_SIZE, GFP_KERNEL);
-- 
2.42.0.820.g83a721a137-goog


