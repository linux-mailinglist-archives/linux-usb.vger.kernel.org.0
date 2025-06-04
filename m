Return-Path: <linux-usb+bounces-24479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA8AACD78D
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 07:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56ED01895449
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jun 2025 05:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AA61C7005;
	Wed,  4 Jun 2025 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b="jlMVS5P6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.wyraz.net (mail.wyraz.net [46.38.234.247])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF602581
	for <linux-usb@vger.kernel.org>; Wed,  4 Jun 2025 05:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.234.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749016138; cv=none; b=XchEZBCFzgzcVsLlG2K1QGVsB34187dX5JouDo2nUmtfIsuR4xbzVP02OWXnCyetqaJObM70DdUUTtl2DjAJwgjtVy5lLOJ7S7usuODoHrlwnmvDZ3g4ZZFqAvAS0nfumEnHfbvXTNYrWPGhrdAKZDsmX+3Yw5zdpi+xJj2UBm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749016138; c=relaxed/simple;
	bh=pBGIQTcJEFbgIihUTx3GYL2HhcH9UR2MwnI45wncbXM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=JVYI2W0cGdfdlaniOSHqFrxuxi63R5NU7Phd8Fj3Q5F25VcnuurSFyYM7mOa9FBhOGwessjijQIYj4liXf4OQO4rlxJpT3AOrGpD0NF9Oftd61hCr9mE3INkenuutfAEn2U2Jzze2mrnYcSzyKMFpORb3zV62C+UpFOk5CgLU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de; spf=pass smtp.mailfrom=wyraz.de; dkim=pass (2048-bit key) header.d=wyraz.de header.i=@wyraz.de header.b=jlMVS5P6; arc=none smtp.client-ip=46.38.234.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=wyraz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyraz.de
Message-ID: <a35a3b78-89ff-496c-8e88-140927543f51@wyraz.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyraz.de; s=dkim;
	t=1749015617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9T6+mIsRnzjAQL8yy1179S56LvrlxX7GSoMUrJXEc7U=;
	b=jlMVS5P6um7pc2WLGfIs6hyccYdJ2EOrs8ApoUEEKYZlNwgUVZONafDzga1aW1piaKp5Af
	aSUE9VRP1xecumWLEOyG/zg3RuveG3az8m+YGg6xtXEP7VxbAcVOFmB7ZvuYDOBgPEzqGS
	1Q0Alx3sKWpIM3DAWu/iwtXthiS391ZUAzygQ1sMjvV8wQqaYoi3EuI7ZrL8fakGLcMPbg
	Nrr9pvE8YN3QYeZa1vjm+AbJ4/x1uwNP8hnE/P+mkq3vJPEpEhhd2uEoAW1vio0+QbVdog
	Sjuig1quaSqw9G4Sjrj3ruRqZXgJU9NqQiTYLFgGZTjR/ctXLy05mepTUv6/5g==
Authentication-Results: mail.wyraz.net;
	auth=pass smtp.mailfrom=michael@wyraz.de
Date: Wed, 4 Jun 2025 07:40:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US, de-DE
To: linux-usb@vger.kernel.org
From: Michael Wyraz <michael@wyraz.de>
Subject: [PATCH] Add Marvell ML352 to drivers/usb/serial/option.c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: ---


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
  #define LUAT_PRODUCT_AIR720U            0x4e00

+/* Marvell products */
+#define MARVELL_VENDOR_ID            0x1286
+#define MARVELL_PRODUCT_ML352        0x4e3c
+
  /* Device flags */

  /* Highest interface number which can be used with NCTRL() and RSVD() */
@@ -2434,6 +2438,7 @@ static const struct usb_device_id option_ids[] = {
      { USB_DEVICE_AND_INTERFACE_INFO(SIERRA_VENDOR_ID, 
SIERRA_PRODUCT_EM9191, 0xff, 0, 0) },
      { USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, 
TOZED_PRODUCT_LT70C, 0xff, 0, 0) },
      { USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, 
LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
+    { USB_DEVICE(MARVELL_VENDOR_ID, MARVELL_PRODUCT_ML352) },
      { USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0530, 0xff),            /* 
TCL IK512 MBIM */
        .driver_info = NCTRL(1) },
      { USB_DEVICE_INTERFACE_CLASS(0x1bbb, 0x0640, 0xff),            /* 
TCL IK512 ECM */
-- 
2.49.0



