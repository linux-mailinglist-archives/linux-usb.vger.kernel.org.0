Return-Path: <linux-usb+bounces-2230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0247D88E9
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 21:29:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 689ED1C20FA2
	for <lists+linux-usb@lfdr.de>; Thu, 26 Oct 2023 19:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DECD3B2B6;
	Thu, 26 Oct 2023 19:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pG99jf2O"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A053AC35
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 19:29:06 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5129B196
	for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 12:29:05 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c9d4f08d7cso34435ad.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Oct 2023 12:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698348545; x=1698953345; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab9IO7fXt9TdvpC/uutKUevV50e6+HBvpHH0PXTYXkE=;
        b=pG99jf2OW3a6SMkjK3YfjzfWplc0D+eajN32lATcTNywDl9uCeR2R9GMsDadJixBlU
         Ai8tiZu0xPFJZQ9zJJTULb2qqJ88u5kTSg6sqRLDXXgGK0xnmj8kS9XDwNFdbkmJN134
         HW2QZ56SjY2GK+0izztiLHxtR65J8RX+dDU/JXy/QhjCgFT2r/IWS+X0SHOD5IrsHIbp
         Br/lnfgQKYEOfip6dh4f+lhHgWPdfzFrTchVX4y8PTAdTNozYKzlIyPgI+xjkxsdlyt0
         2XXR1bEfbNmm4ODZijartnYSFcf9bkXyfsfadUm6BwFwoLtFDYReSUww3m56t7EWwDkm
         3hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698348545; x=1698953345;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ab9IO7fXt9TdvpC/uutKUevV50e6+HBvpHH0PXTYXkE=;
        b=mAqQ+S90ptfeyJ8zGREtSYUfAMr1HJEawB0feg7ZxakohuQjx052lyGq3lV8uoav4d
         FHPT1W1ocX1+yY1cW/B+Pf8f54bEQLGkbIVyCUtP1JKa+JKwGxYlM3YnB+eGN9MCgq2/
         o3PQsgdoyDgU1xlIW1uzNggX9Nb/2unURrrKLpmaJIkK4KNNz8fmtH8nX5VrUHSn92Ph
         Oq1egbjihQTNVlgSwaXyeEUnETVJCVXzz/qx7GMxo1gwfoZN1nZlvckmf0o/kW3dhH7G
         L1GolhocvMr43yNHEGgB5weCa+VZFwY0KMqRbPEOQ+c5PV7j1GHl9bDjakI1DXF+eCHi
         D9JQ==
X-Gm-Message-State: AOJu0YxopQUUrpPlCUcW9i6Uu5rDYSflvIq/bOnb/KWJlR0pW8l7sjeJ
	ufk+50o1Yezw2p949P1PIvGv0w==
X-Google-Smtp-Source: AGHT+IGpZAsr0u40LmAFIBnoenyblGAdF/akNAxWhKXagRU0VCl5wBM7zbZS4N4/qh/XZdhvgEwe+w==
X-Received: by 2002:a17:902:a411:b0:1c4:1392:e4b5 with SMTP id p17-20020a170902a41100b001c41392e4b5mr44769plq.21.1698348544473;
        Thu, 26 Oct 2023 12:29:04 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:b2da:439d:a713:b670? ([2620:15c:211:201:b2da:439d:a713:b670])
        by smtp.gmail.com with ESMTPSA id o10-20020a170902d4ca00b001c736746d33sm36644plg.217.2023.10.26.12.29.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 12:29:04 -0700 (PDT)
Message-ID: <14ceb63f-1769-4025-ad90-c38112dfec79@google.com>
Date: Thu, 26 Oct 2023 12:29:02 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: laurent.pinchart@ideasonboard.com, balbi@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
From: Shuzhen Wang <shuzhenwang@google.com>
Subject: [PATCH] usb: gadget: uvc: Add missing initialization of ssp config
 descriptor
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

In case the uvc gadget is super speed plus, the corresponding config
descriptor wasn't initialized. As a result, the host will not recognize
the devices when using super speed plus connection.

This patch initializes them to super speed descriptors.

Signed-off-by: Shuzhen Wang <shuzhenwang@google.com>
---
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


