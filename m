Return-Path: <linux-usb+bounces-8993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B289AB3E
	for <lists+linux-usb@lfdr.de>; Sat,  6 Apr 2024 16:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63F921C20CD3
	for <lists+linux-usb@lfdr.de>; Sat,  6 Apr 2024 14:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DC0374FF;
	Sat,  6 Apr 2024 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WSweFqd4"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724192C1A3
	for <linux-usb@vger.kernel.org>; Sat,  6 Apr 2024 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712412226; cv=none; b=UN/28Bkruoefinou8GTsjMQsQzh/usB1NtNsdBRNmFK+l3ec1MTxhWulg3Fxwt9Ol9iaUrjbzd6l2WLJljIKeQSW5w5VRGAKnhWcAWeDzpQ650zYJ8rTpxXXerxFqqvrRb71p+WVXmhi9X1x7uoHd4N6orbMs/NGJE0G75XtTUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712412226; c=relaxed/simple;
	bh=PZh8ykgxog+N8lvuKJF5MFI5vR7vs+JklJ5us8wFT4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JfzrHIZOKyuYZ4+NNgnq8YMakQPuf1LVR7b1b2YOjDiFd1KYykhYtiVniDaIRuslNraQVzjVgU+iH+1ciBIgJLvMmUyT4OWIYomtT/NM/ElNlN5qBfa3Kvi53yCxzPlpVLt2jU/oSSsgQJvkfJ8MBGoZMzC+ShmQYsYvyrpIkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WSweFqd4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712412223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H/yd4f9LuGRhlaZ5Ip0hn/4xef8qT/Kdn0lAyR8ke+0=;
	b=WSweFqd4S7XvxDtmM1ebSPrWkyxjfFwnveuK44CYkAnd5qe4DM2mvhNABtylinW9JF/o8E
	eB1/sIfEusLYSf2CsNNKmO59cjQ8lmBOLo4UAXFgk4GmKUTOhwjaBjkcsf6lsNJ80QQyZR
	fFzcqKKkeLyh8eAspNvC235/7/wZYqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-hNaY9g1YOkmfmM-ZKPNkRg-1; Sat, 06 Apr 2024 10:03:41 -0400
X-MC-Unique: hNaY9g1YOkmfmM-ZKPNkRg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDD8B805AA3;
	Sat,  6 Apr 2024 14:03:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.50])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CD66202451F;
	Sat,  6 Apr 2024 14:03:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: dwc3: pci: Don't set "linux,phy_charger_detect" property on Lenovo Yoga Tab2 1380
Date: Sat,  6 Apr 2024 16:01:27 +0200
Message-ID: <20240406140127.17885-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

The Lenovo Yoga Tablet 2 Pro 1380 model is the exception to the rule that
devices which use the Crystal Cove PMIC without using ACPI for battery and
AC power_supply class support use the USB-phy for charger detection.

Unlike the Lenovo Yoga Tablet 2 830 / 1050 models this model has an extra
LC824206XA Micro USB switch which does the charger detection.

Add a DMI quirk to not set the "linux,phy_charger_detect" property on
the 1380 model. This quirk matches on the BIOS version to differentiate
the 1380 model from the 830 and 1050 models which otherwise have
the same DMI strings.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 497deed38c0c..9ef821ca2fc7 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -8,6 +8,7 @@
  *	    Sebastian Andrzej Siewior <bigeasy@linutronix.de>
  */
 
+#include <linux/dmi.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -220,6 +221,7 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc,
 
 		if (pdev->device == PCI_DEVICE_ID_INTEL_BYT) {
 			struct gpio_desc *gpio;
+			const char *bios_ver;
 			int ret;
 
 			/* On BYT the FW does not always enable the refclock */
@@ -277,8 +279,12 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc,
 			 * detection. These can be identified by them _not_
 			 * using the standard ACPI battery and ac drivers.
 			 */
+			bios_ver = dmi_get_system_info(DMI_BIOS_VERSION);
 			if (acpi_dev_present("INT33FD", "1", 2) &&
-			    acpi_quirk_skip_acpi_ac_and_battery()) {
+			    acpi_quirk_skip_acpi_ac_and_battery() &&
+			    /* Lenovo Yoga Tablet 2 Pro 1380 uses LC824206XA instead */
+			    !(bios_ver &&
+			      strstarts(bios_ver, "BLADE_21.X64.0005.R00.1504101516"))) {
 				dev_info(&pdev->dev, "Using TUSB1211 phy for charger detection\n");
 				swnode = &dwc3_pci_intel_phy_charger_detect_swnode;
 			}
-- 
2.44.0


