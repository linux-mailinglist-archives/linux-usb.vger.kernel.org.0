Return-Path: <linux-usb+bounces-30695-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D506CC6EDEE
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EEE374FF07D
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F59336654A;
	Wed, 19 Nov 2025 13:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJDEa5oE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED535A15E
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557749; cv=none; b=TSqM4NggrgBUyyT72/LmRj0301FqtRj/IX5La1tHVVJTVUaolAHUdCx3ZiCPvKJWHEowOg+T2rmSDdtVS9wlYckIB1aTWh+/Nd1s3LoZV8QReekIRrQq7dmfubkcOrJNmMPIiMA2QBFwTVlyUCDOjGGPGgmxxp/lPnaa8ujHyO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557749; c=relaxed/simple;
	bh=1n9/lEWo+wlou68RzRk35UwfcIXZXKtYR2L3bmc6SqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BzAfM4amLF+M3E07AIt9Iu6rELNtaBQgtnVIzgaq4EY+yscdXZwtToeJ3A6P1lcQA85xWSSj/l7GUhy3zTVlBOKH9Nyka9GuCauHdYE+Amx5ZajLVtA2gZVhiRUGIXRyeg1ygzBxSLEUSCGRbOd5qFGQ9yzdAjCLFC4G4qsXTPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJDEa5oE; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso5555864b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557747; x=1764162547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wcMr6TKB52Xs6/sfp3QhKkSt8CaaPtbf58WfUe+edo=;
        b=lJDEa5oE4yJsH4gtaQLBF84Y9f2+kfMHxcbdaCnNHyWPGdaubMj8IFhi9UId919+13
         ezD9pRauXxkPPqIqMHNmYAKP4/CHWWsDDKk0KAeOoy5IVM7SsAHubHTtLAH/YT+NR8DX
         NHjcN6URyZz1QhL+VxQ1kUlAaWbWUr5RCb7o3NGmrmnABCFkSLqYgNMk3dX+0zWMcZZG
         nvHji4BIA4oSkVT+qzlTuj5lWfJ6rO/B1A1lB5CXckZkjzKAAAX/6dAF5zQvOnX8N0d9
         NXoX3wmZQAK4iJhe7BCfLnOA8Mj9R3infgQ8x651vraondPXlODGakBJ1S3jIavYHI/1
         deHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557747; x=1764162547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wcMr6TKB52Xs6/sfp3QhKkSt8CaaPtbf58WfUe+edo=;
        b=L39w6gTtuTaWWIqfEQjJ42L94BuO/8sVXDE3aY0Kt+JuheDZ2zqBtPSOZIR78IGNxj
         4wMXS+KN9uaK1gEUG0vSLgFEzfd5YGLS2IkWh3Bo/eW3URovnLrIduZ2mzVjDXf8KNx5
         9TAJnpdZ+vnBd1B/bunapXS+MFZV2d4NUuMzhVb2GeFMpZEsA3OgOztVSbG7k3r6ofTJ
         RPILuj46RNjic5FGYX+3P98QSRHSNfcAektr4xb+BgKkzMNpBnZwNTYxTJZ10cWYegeC
         LPqMcwJBnQDgqO0K5QYaXSanZ/xEN5xUBpbDTaHI+5K/lK6m5mPsAL+phNw57ECx+ajc
         bpbg==
X-Gm-Message-State: AOJu0YwIHOlj0r3Od4IK+6BEcg2txntrlL6Sx+Ib9dwViO+qPdKblVUq
	oRvevNi7r3pO9BJ6Pu0ha7E0x1Y0V5XHYHeMQeDJUZ1Xm3UYdXrWkunU
X-Gm-Gg: ASbGncuMmr/a1R0nuDUfemuhlrpfs0fUn6K7hA2MUKni+tsVSZf37eZayObRwhPn6KZ
	cbcMQkCDfm6NBrz+I0kCKXENvRyfp+PdTIMf6+ROGIk9VkfaqgM8gbz+iAdOVoetxAS+UTwbPOE
	dRw8apst3FASHUXujyVd9sIOkx65rXFxnys90SNrHbClA+bfcSoValMOEXwj8zOk9qWjuUMPW1m
	fTFDzI+DlkFPNbXLklVV3Ti81b4KGmQXEj5kppC+Mo3mcDDgIuZP7686SGHEcKSV62l0FoBMwYb
	YWuw9gBtZ8eMpHVCxhiIi7l3hCzwJR9dKRNZ9eX9WzVNzxXCRtpK2JFGTFOsHXM8HgquqcA2l++
	bJ7OJsOK9Xq3NxpkxCC8kt0wcV36u1Z7NNHapFCQaMyHrY1Ydak0bmlWxiIPh/YJURcNHmZibdQ
	CXXKv1daGT7UoAvsxXjUg+0dgnVUgAdAjD1QE=
X-Google-Smtp-Source: AGHT+IFpgqVfTAaZmkbRivx6m6qi5k0vr4XAZes6wYiI171aYeHdU1uRz1U4vf0NMwRIcqyrSw83RA==
X-Received: by 2002:a05:6a00:2444:b0:7b2:1fb0:6da3 with SMTP id d2e1a72fcca58-7ba3c478451mr24723715b3a.24.1763557746861;
        Wed, 19 Nov 2025 05:09:06 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:09:06 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 4/8] usb: gadget: dummy_hcd: fix block comments, blank lines and function braces
Date: Wed, 19 Nov 2025 18:38:36 +0530
Message-ID: <20251119130840.14309-5-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch updates dummy_hcd.c to follow the Linux kernel coding style:
- Align block comment asterisks properly.
- Add blank lines after variable declarations where needed.
- Remove unnecessary spaces before semicolons.
- Move opening braces of function definitions to the next line.

These changes improve readability, maintain consistency, and make the code
easier to maintain.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---
 drivers/usb/gadget/udc/dummy_hcd.c | 49 ++++++++++++++++--------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 6ad366640..d4b2dcbc4 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -151,11 +151,11 @@ static const struct {
 	EP_INFO("ep2out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep3in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep4out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	EP_INFO("ep3in-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
+ *	EP_INFO("ep4out-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
+ */
 	EP_INFO("ep5in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep6in-bulk",
@@ -163,11 +163,11 @@ static const struct {
 	EP_INFO("ep7out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep8in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep9out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	EP_INFO("ep8in-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
+ *	EP_INFO("ep9out-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
+ */
 	EP_INFO("ep10in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 	EP_INFO("ep11in-bulk",
@@ -175,11 +175,11 @@ static const struct {
 	EP_INFO("ep12out-bulk",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_BULK, USB_EP_CAPS_DIR_OUT)),
 /*
-	EP_INFO("ep13in-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
-	EP_INFO("ep14out-iso",
-		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
-*/
+ *	EP_INFO("ep13in-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_IN)),
+ *	EP_INFO("ep14out-iso",
+ *		USB_EP_CAPS(USB_EP_CAPS_TYPE_ISO, USB_EP_CAPS_DIR_OUT)),
+ */
 	EP_INFO("ep15in-int",
 		USB_EP_CAPS(USB_EP_CAPS_TYPE_INT, USB_EP_CAPS_DIR_IN)),
 
@@ -314,6 +314,7 @@ static inline struct dummy *ep_to_dummy(struct dummy_ep *ep)
 static inline struct dummy_hcd *gadget_to_dummy_hcd(struct usb_gadget *gadget)
 {
 	struct dummy *dum = container_of(gadget, struct dummy, gadget);
+
 	if (dum->gadget.speed == USB_SPEED_SUPER)
 		return dum->ss_hcd;
 	else
@@ -388,7 +389,7 @@ static void set_link_state_by_speed(struct dummy_hcd *dum_hcd)
 		} else {
 			/* device is connected and not suspended */
 			dum_hcd->port_status |= (USB_PORT_STAT_CONNECTION |
-						 USB_PORT_STAT_SPEED_5GBPS) ;
+						 USB_PORT_STAT_SPEED_5GBPS);
 			if ((dum_hcd->old_status &
 			     USB_PORT_STAT_CONNECTION) == 0)
 				dum_hcd->port_status |=
@@ -613,8 +614,8 @@ static int dummy_enable(struct usb_ep *_ep,
 	_ep->maxpacket = max;
 	if (usb_ss_max_streams(_ep->comp_desc)) {
 		if (!usb_endpoint_xfer_bulk(desc)) {
-			dev_err(udc_dev(dum), "Can't enable stream support on "
-					"non-bulk ep %s\n", _ep->name);
+			dev_err(udc_dev(dum), "Can't enable stream support on non-bulk ep %s\n",
+					_ep->name);
 			return -EINVAL;
 		}
 		ep->stream_en = 1;
@@ -1042,7 +1043,8 @@ static int dummy_udc_stop(struct usb_gadget *g)
 #undef is_enabled
 
 /* The gadget structure is stored inside the hcd structure and will be
- * released along with it. */
+ * released along with it.
+ */
 static void init_dummy_udc_hw(struct dummy *dum)
 {
 	int i;
@@ -1264,7 +1266,8 @@ static int dummy_urb_enqueue(
 	struct usb_hcd			*hcd,
 	struct urb			*urb,
 	gfp_t				mem_flags
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	struct urbp	*urbp;
 	unsigned long	flags;
@@ -1323,7 +1326,8 @@ static int dummy_urb_dequeue(struct usb_hcd *hcd, struct urb *urb, int status)
 	int		rc;
 
 	/* giveback happens automatically in timer callback,
-	 * so make sure the callback happens */
+	 * so make sure the callback happens
+	 */
 	dum_hcd = hcd_to_dummy_hcd(hcd);
 	spin_lock_irqsave(&dum_hcd->dum->lock, flags);
 
@@ -2109,7 +2113,8 @@ static int dummy_hub_control(
 	u16		wIndex,
 	char		*buf,
 	u16		wLength
-) {
+)
+{
 	struct dummy_hcd *dum_hcd;
 	int		retval = 0;
 	unsigned long	flags;
-- 
2.43.0


