Return-Path: <linux-usb+bounces-24871-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D75ADE521
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 10:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A8373BCBD2
	for <lists+linux-usb@lfdr.de>; Wed, 18 Jun 2025 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55FF12063E7;
	Wed, 18 Jun 2025 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b="E5WsFh7Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.wyraz.net (mail.wyraz.net [46.38.234.247])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2058E78F36
	for <linux-usb@vger.kernel.org>; Wed, 18 Jun 2025 08:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.234.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233983; cv=none; b=Duh9IMXzceHtj4Z1IYNnhf7vhYUMPRRzf62j4hgecRsRim2ibCE2my1kZbVhMQDNwA2ClEce1xlsc+SvP6ouyj/PwDlNs9mE1YzoC6Ak33OkZIXA1FSJc1GKOwutFNDqFqUrKIVpOm56tZyJLoTUqGokn6gQayCKLuLqOimCJh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233983; c=relaxed/simple;
	bh=l3pJeI8wIgdjLVHbiN/CiMZBKMlmOTw1i5wOxfmjSno=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WTKO8t2OQCoBXV69Yf/x7UVG/PoVF/dwIeE/NCrvfOwgj/hINZH3FpJXMUk5HwbtobmbQr+0EiSFrV0IGQUzco/meYyDJy4qe9/4N9bHdASYGHCgTYIqJpoaQiKuSASKWSBXPPwF0QBGmCl/K/lnXbksGZgrM0WTemt51JFbmio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de; spf=pass smtp.mailfrom=wyraz.de; dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b=E5WsFh7Y; arc=none smtp.client-ip=46.38.234.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyraz.de
Date: Wed, 18 Jun 2025 10:06:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyraz.de; s=dkim;
	t=1750233976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=sL+8kzDmpcHRBeaT3jczwV5Ixtbi0xa4/tgqcFdstpM=;
	b=E5WsFh7YUfRXNP0b2xyEZPJPNDNEk/S0LvWnTX0wVyhQNB2EZHuSCXCZPnxLlB1IBUv8Ve
	rHN7BwEcncQZwp5hK9xNtvzwsz7ot8QNPIEAGb9K+4QwGlcG41ncij3ry19EqZuX5wxXZ6
	IvK6gEdh8sJYVy5ZiO8obZNa92E/uknUKFGyNBwEMT7+3x8ErpvAu9IlGH8nTxFvi8ulht
	n0NCeE9M//XOp4W9Xp5P27oW0gCLigMjXPyeq6yfl62OujzDLyvIIptHa7EQO1atvNPQ7F
	o8ktgTUsHJIMxRqvJ+jb3M7nrdsdKqksrGYCkmHvLGTONVduWqXf/XGyP8fl9A==
Authentication-Results: mail.wyraz.net;
	auth=pass smtp.mailfrom=michael@wyraz.de
From: Michael Wyraz <michael@wyraz.de>
To: linux-usb@vger.kernel.org
Subject: [PATCH] Add Marvell ML352 to drivers/usb/serial/option.c
Message-ID: <aFJzdxe_ykNw6cP_@homebase1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Bar: --

Add the device id of the Marvell ML352 to option.c so that the
device is recognized as usb-serial device.

Signed-off-by: Michael Wyraz <michael@wyraz.de>
---
 drivers/usb/serial/option.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 5cd26dac2069..3bfdab641369 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -619,6 +619,10 @@ static void option_instat_callback(struct urb *urb);
 /* Luat Air72*U series based on UNISOC UIS8910 uses UNISOC's vendor ID */
 #define LUAT_PRODUCT_AIR720U			0x4e00
 
+/* Marvell products */
+#define MARVELL_VENDOR_ID			0x1286
+#define MARVELL_PRODUCT_ML352		0x4e3c
+
 /* Device flags */
 
 /* Highest interface number which can be used with NCTRL() and RSVD() */
@@ -2434,6 +2438,7 @@ static const struct usb_device_id option_ids[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
 	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+	{ USB_DEVICE(MARVELL_VENDOR_ID, MARVELL_PRODUCT_ML352) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),			/* TCL IK512 MBIM */
 	  .driver_info = NCTRL(1) },
 	{ USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),			/* TCL IK512 ECM */
-- 
2.49.0


