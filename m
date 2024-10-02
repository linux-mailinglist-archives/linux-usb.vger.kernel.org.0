Return-Path: <linux-usb+bounces-15634-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68098CB11
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2024 04:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23D28281E2B
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2024 02:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DB22114;
	Wed,  2 Oct 2024 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QXtFMYZ9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A3B637
	for <linux-usb@vger.kernel.org>; Wed,  2 Oct 2024 02:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835010; cv=none; b=YJUdkj38tJ7SpLLwQ4Li+vFtgerncsTH5RERRhUxFqBErfEskat54/jA82b3iUh8OWw8L5gTT15W5nZYPV4W4fmycMoe5MZToxnzNyAGrg+sW45hYKLFkRpGRavBuLrAYe/QWAvYEzaOXpUxoOAqoTbGM420+Sn0XBv/E1RyQ/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835010; c=relaxed/simple;
	bh=OvYHnwddCUQbhPA/r0szlpg11Gobi5Ac115AD5+qItA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/WMdBbGFxuTFmfHHalWKCmuk2D1f2CeXjcu4+/LeSsSeby+KE36gT6KCCffLktZ/PXmGVtA6+PUhNIZmXy7Axa4Y2pWEOdRljgNKGv2/RVSwSEqvi2eWP3PLrajDOyPSCi9b2cWVflvwj1lkpUPszQh4jv8qoAuDxxQL6EbDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QXtFMYZ9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e0a4eebdcfso1195766a91.0
        for <linux-usb@vger.kernel.org>; Tue, 01 Oct 2024 19:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727835008; x=1728439808; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VzDTg7vsYBhtZ3H7s/EjAhAqzsKhPCSXsFw91bOehzg=;
        b=QXtFMYZ9hkQn7VnIfKaC6eTR0kxXloa77xTQhkIiPXDJuXO8y5AsRhEEsQcDhLgkap
         BdUhMY3IJ3KsczOxwvsgniOl8AR8zo0rj13oXCq5IV9HKt5fbA0ItSm3BLiq3dPqiJ3V
         gHv+jbC6lvukfU5VfR0vLiIYuS3nH/18VlQrBP1RfthdhxssAmQ2QXozYvo2L9QkXk1R
         neox3Q53tHEewuvRkWQ5DcUXAU/UUEE0IRJN/DcKK2r5EnHxxhtv91elCIGorXKF4UIr
         sM0e5gsj42Y5PvqME7E0kHj3acQBMp14AboekRFOcBzvbBIIS8iIxTrb8ksxP5a8aHtQ
         4eew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835008; x=1728439808;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VzDTg7vsYBhtZ3H7s/EjAhAqzsKhPCSXsFw91bOehzg=;
        b=vRcbJrYbfGCXBTm6kbL6F5bhAxYlobSioiUbKmsHVIPhUBqYD5erft+HTLvrU8sFoS
         cYAH5zLCdfMh/mKUnyXAFAIA24Iwtw1b88c/ba5GOO4YhlzCoa5q95+AARfh3RLmaNxt
         Q3Z5QYdkEc++PGU+/qoRnit0/XujvIy2AGRMxSpvF/Vk/moD+KPP47F7gC5Cg7kHmoB7
         sd/h7nKCg+kc3vS310VBw2R6MWj486gdhHvryYWkQXT3bF3wzGpb/D0cgIY0rbDX3Fno
         x1zczLrpk3l7fiCnhL1kGAapb4LFeEDgdwq1Rs1+sFsGboRtD8Ngole+gSV8X281iRUV
         fDpw==
X-Gm-Message-State: AOJu0YyKpHqUOMsoNd5s7LgfQGrf5gzPL5Pp1ITMqWmPvyOSgo56rqZL
	2cxroip71SeIMPyLPKAiSXryyCykwYRujF4eP0ty8w9A7vTaniRtMAxZ008xxMI=
X-Google-Smtp-Source: AGHT+IEEH/FgnWLv0aT9PfwjRVxwNvtQaM8MJDE+On9W8iesY6QqZabLB6S+NCTV3aXPaI78IB13Dw==
X-Received: by 2002:a17:902:db0e:b0:20b:9822:66fe with SMTP id d9443c01a7336-20bc59a568dmr9361545ad.1.1727835008131;
        Tue, 01 Oct 2024 19:10:08 -0700 (PDT)
Received: from mikeseo-0-1 ([27.122.242.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37d8e033sm76094235ad.70.2024.10.01.19.10.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:10:07 -0700 (PDT)
Date: Wed, 2 Oct 2024 11:10:05 +0900
From: mike Seo <mikeseohyungjin@gmail.com>
To: linux-usb@vger.kernel.org
Subject: [PATCH] r8152: Add MAPT for lg laptops
Message-ID: <ZvyrfUYF8_I5df-7@mikeseo-0-1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

LG gram laptops support mac address pass-thru with its usb lan adapter
using Realtek USB ethernet Vendor and Product IDs, rtl8153b-2.
ACPI objects of the gram laptops are safisfied to -AD.
Signed-off-by: mike Seo <mikeseohyungjin@gmail.com>
---
 drivers/net/usb/r8152.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index a5612c799f5e..990e43e3def9 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -29,6 +29,7 @@
 #include <crypto/hash.h>
 #include <linux/usb/r8152.h>
 #include <net/gso.h>
+#include <linux/dmi.h>
 
 /* Information for net-next */
 #define NETNEXT_VERSION		"12"
@@ -949,6 +950,7 @@ struct r8152 {
 
 	u32 support_2500full:1;
 	u32 lenovo_macpassthru:1;
+	u32 lg_macpassthru:1;
 	u32 dell_tb_rx_agg_bug:1;
 	u16 ocp_base;
 	u16 speed;
@@ -1724,7 +1726,7 @@ static int vendor_mac_passthru_addr_read(struct r8152 *tp, struct sockaddr *sa)
 	} else {
 		/* test for -AD variant of RTL8153 */
 		ocp_data = ocp_read_word(tp, MCU_TYPE_USB, USB_MISC_0);
-		if ((ocp_data & AD_MASK) == 0x1000) {
+		if ((ocp_data & AD_MASK) == 0x1000 || tp->lg_macpassthru) {
 			/* test for MAC address pass-through bit */
 			ocp_data = ocp_read_byte(tp, MCU_TYPE_USB, EFUSE);
 			if ((ocp_data & PASS_THRU_MASK) != 1) {
@@ -9798,6 +9800,22 @@ static bool rtl8152_supports_lenovo_macpassthru(struct usb_device *udev)
 	return 0;
 }
 
+static bool rtl8152_supports_lg_macpassthru(struct usb_device *udev)
+{
+	int product_id = le16_to_cpu(udev->descriptor.idProduct);
+	int vendor_id = le16_to_cpu(udev->descriptor.idVendor);
+	const char *board = dmi_get_system_info(DMI_BOARD_VENDOR);
+
+	if (!strlen(board))
+		return 0;
+
+	if (!strncmp("LG Electronics", board, sizeof("LG Electronics"))) {
+		if (vendor_id == VENDOR_ID_REALTEK && product_id == 0x8153)
+			return 1;
+	}
+	return 0;
+}
+
 static int rtl8152_probe_once(struct usb_interface *intf,
 			      const struct usb_device_id *id, u8 version)
 {
@@ -9872,6 +9890,7 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	}
 
 	tp->lenovo_macpassthru = rtl8152_supports_lenovo_macpassthru(udev);
+	tp->lg_macpassthru = rtl8152_supports_lg_macpassthru(udev);
 
 	if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x3011 && udev->serial &&
 	    (!strcmp(udev->serial, "000001000000") ||
-- 
2.43.0


