Return-Path: <linux-usb+bounces-15585-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302F989ACF
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 08:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5539D283992
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2024 06:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 805DD15C144;
	Mon, 30 Sep 2024 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbFEEjKs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4AB15383D
	for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2024 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727678623; cv=none; b=VD1bw9Bgr03dvCB681YkNbtCgqCwqjvWcz9FuhhbTX/Zd34tzKhwhmHpf2Et+AuF971OI8mduUFr+avVxDN/LqZeqfs/5bM6Iq8jSZczoK63sMIC+wGKH60hSiXPoxD9NApuTnfLPK47uefFv0rKO2NdnSudXxE7iBJajNhG0kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727678623; c=relaxed/simple;
	bh=W22rFMM5kbxYsbJthyJDo3+5ln33GfHyahSbuwpm1Aw=;
	h=From:Date:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aprNCzPtxx9k+cR4r/uVkKNDyVU7F8qFq7V2okrbkiFv50QNNjdEpGHHXliyeGGXPWd5R/qTlo0qDqm9VN89ZL0O37pqTDLVVujidaau4hQhBhwLVImrOdz09yMtFbxKx72f9k7747nLtHB06E4HW6HRCIWt6xMwg081GNmLOAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbFEEjKs; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-718ebb01fd2so569658b3a.2
        for <linux-usb@vger.kernel.org>; Sun, 29 Sep 2024 23:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727678620; x=1728283420; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssncNfbvoyXne2wtyTSVe+df367fyD46ctgwaaucNT4=;
        b=lbFEEjKseGf2KJz5xFYL+BYmiMyyYqclQzT7wIJEfni4oYe+gdllFxO2MsXlhMHp5/
         oEU7+2/KboKCErV8UP4otLHZZoBzAjSQ3e3Dlo9bKRxcqL9sTGRd1VSbTvbE7dIek94R
         XPhZYUfnIVCReXO7lKiSqVAaE5lK8fnYgP8T69FvcP2ZpNnq8vvAwbVJnRnUhITp43cb
         SR8e6gIIYdbP3PEa1+E/FE4cvBcH6ogEC4CeTeollavY7SfIjymMHCHuZv/qd2NzGtuL
         U8SlcGdCkfGzIjA5AT8Vs+l3oxC8KmxKgmkI7LU/J673vWpm9rUCAyW3VxeTvk1qr5JS
         7TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727678620; x=1728283420;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssncNfbvoyXne2wtyTSVe+df367fyD46ctgwaaucNT4=;
        b=OP73keEoh0L1BdYOqHSRZDVF9xANp3kJ/7DjUJ0SUm1sBtloPh3EAZnnIg7H4FdLeh
         fDWfN8krRO5ToBw8Xw7qX7lTsJ6gyjojrqGUaRZdh87Bjg9/XZ2dKLY5XVMhQiEt6x++
         PRgExvfezvwiwAJe/7yqzPR/a8hi2OkctpnwqDrYXiPVfU967u7J7r6jmfKZQGRf8uvW
         8XKtJOR+rURs9uRJ1kyCktZ4mN4jd8cVDMJQcMWihjxAlqi4OKUxgp6vz78xthmC3HyR
         93BJ4lgWdGY4ybk06RMklYALR2rm0rkIwmTYNEy19hwRxOvZqifA8etPFlSHMuuOWGpb
         QxrA==
X-Gm-Message-State: AOJu0YxTopzrBLP+6iEooDR88x0xbRyuFGILg2FHkqoI+vl0ZqZ5Bd5I
	RVARUmklVIqvk8+5dVL5a/ZS6RO5E7BtP4ChX/FYm+i+7n2gwrCHKXTnzyU9XBA=
X-Google-Smtp-Source: AGHT+IHxxAF9+YHqZO5ZJlF8a3qMRGxpgKqfsUF9hE3j9oTofWq0XgrfJRYM0eR+RwHKzNaxrBa5fw==
X-Received: by 2002:a05:6a21:328a:b0:1cf:4dae:2258 with SMTP id adf61e73a8af0-1d4fa6444d8mr7740213637.2.1727678620113;
        Sun, 29 Sep 2024 23:43:40 -0700 (PDT)
Received: from mikeseo-0-1 ([27.122.242.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db294ebdsm5722579a12.19.2024.09.29.23.43.39
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 23:43:39 -0700 (PDT)
From: "mike.seo" <mikeseohyungjin@gmail.com>
X-Google-Original-From: "mike.seo" <mike.seo@lge.com>
Date: Mon, 30 Sep 2024 15:43:37 +0900
To: linux-usb@vger.kernel.org
Subject: [PATCH] r8152: Add mac address pass-thru for lg laptops
Message-ID: <ZvpImQ_8jh5fyorl@mikeseo-0-1>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

 LG gram laptops support mac address pass-thru with usb lan adapter
rtl8153b-2 devices using Realtek USB ethernet Vendor and Product IDs.
ACPI objects of the gram laptops are safisfied to -AD.

Signed-off-by: mike.seo <mike.seo@lge.com>
---
 drivers/net/usb/r8152.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index a5612c799f5e..3d4ffc582730 100644
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
@@ -9798,6 +9800,19 @@ static bool rtl8152_supports_lenovo_macpassthru(struct usb_device *udev)
 	return 0;
 }
 
+static bool rtl8152_supports_lg_macpassthru(struct usb_device *udev)
+{
+	int product_id = le16_to_cpu(udev->descriptor.idProduct);
+	int vendor_id = le16_to_cpu(udev->descriptor.idVendor);
+	const char *board = dmi_get_system_info(DMI_BOARD_VENDOR);
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
@@ -9872,6 +9887,7 @@ static int rtl8152_probe_once(struct usb_interface *intf,
 	}
 
 	tp->lenovo_macpassthru = rtl8152_supports_lenovo_macpassthru(udev);
+	tp->lg_macpassthru = rtl8152_supports_lg_macpassthru(udev);
 
 	if (le16_to_cpu(udev->descriptor.bcdDevice) == 0x3011 && udev->serial &&
 	    (!strcmp(udev->serial, "000001000000") ||
-- 
2.43.0


