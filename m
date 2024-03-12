Return-Path: <linux-usb+bounces-7849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E2878E50
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 06:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C060B21B67
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 05:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B3083984D;
	Tue, 12 Mar 2024 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmDo2jFn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583A3FB38
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710222978; cv=none; b=Ht//DD72GffoOoEA0bXK9Xa4/KJ3J5uJg2kwlD0wsGpGsRVUTb1XrYvHJpjbNGgWlKCa2711IciDE5e8gI7BvxAuQZIUQW446+1OGDz0vT+2WvG49TxYPBToTx1aadlNF/TR5WaeicyogJGAYnzKOWww8tA7EYfg0AXEoZtNs2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710222978; c=relaxed/simple;
	bh=5RTWz3uzbMnHpZbNqSMq0dzU0ZakS0d5QH3HmuxpD30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBwhf96Zsi1wnUU1DTjioF9Si+XMAR6HAXpSotHM3XlwR3I4H7Jo1ekDCLcuhYP8HwiNTm6WPmNwyvX/Tge20Shu+Epw4lLzwtYxUM0iQHNSypOUPlpPkT4w785MUX7VruHPVmiSBHtUeTktjXjW3mEXdVSitPPEFH6r5ssF4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmDo2jFn; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-221ffba5c8bso918688fac.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Mar 2024 22:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710222976; x=1710827776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2b9ehj94EjdhIf37gyeIKW8wdt259vcVkC4Jo5u5QkE=;
        b=kmDo2jFnQIrLqemdEfn4Og3gf5ahPkZgyOIkklI9hYAefDxHYU7eQ9eSxVZ6vruZMY
         JxlnQd4VDnNUpfQ2yWK5mshLTsrmlWtajyh3uMORrIdukGlcu2wGrLtQ3+g3AZN9kmWf
         PltzIydth8Uostgmp7HzMjAa6fxNLhUt/4f7dMG3pVhj4QlvumqWZ58C4mKGoVFn0lqz
         5qiOO6klJkDWDuRJpRNccCzNKX4cUVmmGQSFWbE39BWYoeeX1y9G43zirQhb11PQYIO5
         +lAo/QnSJQUOcjlsY8Poy5JQA0Bx11++IIUVoSbFOiMd/5+0LKBtrnnHRmDrocqVxDIk
         uxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710222976; x=1710827776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2b9ehj94EjdhIf37gyeIKW8wdt259vcVkC4Jo5u5QkE=;
        b=kt173l0yNc6S0GAzbI2haPG16jcCXOsRLsMGKL3jBRRtFTBji/lV160rToZ9FPBGUZ
         u941sZqsHkH8iDoBd/0Ut0yOjSJ2Zd//hamrXTgSFHN0ouGVGdEX6uo02kPimUHFOr8X
         YOvDa4gR2aokzyTkOXVqdGYOs0iqh9l1lzY84WmRM1eJXEayseVEPYnrql50TcY+j1K2
         CIalPYlejnStFunrD7chgXTThjnOhRuEdwzWiAl4TS5LDSddhbzVmoQNXIznzfWYhVBJ
         MFR8TfxbYYRZW8pLgiJdK173eCY6e8fcpFDmenQZbE5NhDuI5TYgg15tdPlB4/sAMPXM
         VFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS8kD+3TSsxFK06yx35kAdPLzU8cEG5Ov8epGU4u6wtaNDNcI1tC5U1+tJm5GR8M7AgQvihciW5kkxtL+cezqJrgBuL+jYP9Ls
X-Gm-Message-State: AOJu0Yx3GjavrwyQaEP4dgg+JHbUBfHZzwegaDlqaBURPu9D19H2i2Nb
	5alvgEi95BNLM2TIRxzWOO5PCKxfUVLEMQcJnv5xX//7ChDFBHsT
X-Google-Smtp-Source: AGHT+IFTNUeHdXYPj8pbD7YU1afPd4KdInabkTeJfTJBkzW6hlV74ZuuqnjWeSkhkwDRPzi4i8o2Vg==
X-Received: by 2002:a05:6870:1685:b0:220:b839:4bb0 with SMTP id j5-20020a056870168500b00220b8394bb0mr9729874oae.19.1710222976671;
        Mon, 11 Mar 2024 22:56:16 -0700 (PDT)
Received: from petra.lan ([2607:fa18:9ffd::d95])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b006e65720e892sm5448898pfp.94.2024.03.11.22.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 22:56:16 -0700 (PDT)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-parport@lists.infradead.org,
	linux-usb@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	johan@kernel.org,
	daniel@gimpelevich.san-francisco.ca.us,
	hkzlabnet@gmail.com,
	reboots@g-cipher.net,
	mike@trausch.us
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 6/7] usb: misc: uss720: add support for another variant of the Belkin F5U002
Date: Mon, 11 Mar 2024 23:50:31 -0600
Message-ID: <20240312055350.205878-6-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240312055350.205878-1-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This device is a gray USB parallel port adapter with "F5U002" imprinted
on the plastic and a sticker that says both "F5U002" and "P80453-A".
It's identified in lsusb as "05ab:1001 In-System Design BAYI Printer
Class Support". It's subtly different from the other gray cable I have
that has "F5U002 Rev 2" and "P80453-B" on its sticker and device ID
050d:0002.

The uss720 driver appears to work flawlessly with this device, although
the device evidently does not support ECP.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/usb/misc/uss720.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index 15cafc7dfd22..5803919d7cc4 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -693,7 +693,7 @@ static int uss720_probe(struct usb_interface *intf,
 
 	interface = intf->cur_altsetting;
 
-	if (interface->desc.bNumEndpoints < 3) {
+	if (interface->desc.bNumEndpoints < 2) {
 		usb_put_dev(usbdev);
 		return -ENODEV;
 	}
@@ -719,7 +719,9 @@ static int uss720_probe(struct usb_interface *intf,
 
 	priv->pp = pp;
 	pp->private_data = priv;
-	pp->modes = PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_ECP | PARPORT_MODE_COMPAT;
+	pp->modes = PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_COMPAT;
+	if (interface->desc.bNumEndpoints >= 3)
+		pp->modes |= PARPORT_MODE_ECP;
 	pp->dev = &usbdev->dev;
 
 	/* set the USS720 control register to manual mode, no ECP compression, enable all ints */
@@ -774,6 +776,7 @@ static const struct usb_device_id uss720_table[] = {
 	{ USB_DEVICE(0x050d, 0x1202) }, /* Belkin F5U120-PC */
 	{ USB_DEVICE(0x0557, 0x2001) },
 	{ USB_DEVICE(0x05ab, 0x0002) }, /* Belkin F5U002 ISD-101 */
+	{ USB_DEVICE(0x05ab, 0x1001) }, /* Belkin F5U002 P80453-A */
 	{ USB_DEVICE(0x06c6, 0x0100) }, /* Infowave ISD-103 */
 	{ USB_DEVICE(0x0729, 0x1284) },
 	{ USB_DEVICE(0x1293, 0x0002) },
-- 
2.44.0


