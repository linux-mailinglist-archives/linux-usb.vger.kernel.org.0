Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF6C54AAA3F
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 17:45:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380488AbiBEQpw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Feb 2022 11:45:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26191 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380490AbiBEQpv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Feb 2022 11:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644079551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z6WAh0cLbaV+DuQjckj1L6hLSWsngwI8qpPCgBJQSdQ=;
        b=RI871zp5coDeIHz/Hzf6qWoaBh1EEQVdFfVNplEtR+oDGro8RtYS0YkteymkzSwNDsY0Ek
        CgbM0xX4NorUFPszS2bG4CUlrtnjUiEBga0qtUHshjNUyQdL/Oo7vRd7DrrMhwxjsVFgAq
        eziBIVqOvJ2ijSJduwumF7YQEgxKKHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-z0SFdiSiOoC51j3gkU8DLg-1; Sat, 05 Feb 2022 11:45:50 -0500
X-MC-Unique: z0SFdiSiOoC51j3gkU8DLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF782100C660;
        Sat,  5 Feb 2022 16:45:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC5062B4D2;
        Sat,  5 Feb 2022 16:45:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
Subject: [PATCH 4/9] usb: dwc3: pci: Set "linux,phy_charger_detect" property on some Bay Trail boards
Date:   Sat,  5 Feb 2022 17:45:30 +0100
Message-Id: <20220205164535.179231-5-hdegoede@redhat.com>
In-Reply-To: <20220205164535.179231-1-hdegoede@redhat.com>
References: <20220205164535.179231-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Some Android x86 tablets with a Bay Trail (BYT) SoC and a Crystal Cove
PMIC, which does not support charger-detection, rely on the TUSB1211 phy
for charger-detection.

Windows tablets with the same SoC + PMIC often use an extra chip for
charger-detection like the FSA831A. But since on Android tablets
the designers already need to add a TUSB1211 phy to support device/gadget
mode the phy is used to do charger-detection instead.

These Android x86 tablets can be identified by the unique combination of
a Bay Trail SoC (already checked for by PCI-ids) + a Crystal Cove PMIC +
not using the standard ACPI battery and ac drivers. Where as on Windows
tablets the standard ACPI battery and ac drivers will be used on BYT
boards with a Crystal Cove PMIC.

Set a special kernel-internal (so not part of the dt-bindings)
"linux,phy_charger_detect" property on these boards, which tells the
tusb1210 driver to enable charger-detection.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 40a3a1b114e9..8deccf0aa5e7 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -126,6 +126,14 @@ static const struct property_entry dwc3_pci_intel_byt_properties[] = {
 	{}
 };
 
+static const struct property_entry dwc3_pci_intel_phy_charger_detect_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "peripheral"),
+	PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),
+	PROPERTY_ENTRY_BOOL("linux,phy_charger_detect"),
+	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
+	{}
+};
+
 static const struct property_entry dwc3_pci_mrfld_properties[] = {
 	PROPERTY_ENTRY_STRING("dr_mode", "otg"),
 	PROPERTY_ENTRY_STRING("linux,extcon-name", "mrfld_bcove_pwrsrc"),
@@ -172,6 +180,10 @@ static const struct software_node dwc3_pci_intel_byt_swnode = {
 	.properties = dwc3_pci_intel_byt_properties,
 };
 
+static const struct software_node dwc3_pci_intel_phy_charger_detect_swnode = {
+	.properties = dwc3_pci_intel_phy_charger_detect_properties,
+};
+
 static const struct software_node dwc3_pci_intel_mrfld_swnode = {
 	.properties = dwc3_pci_mrfld_properties,
 };
@@ -239,6 +251,18 @@ static int dwc3_pci_quirks(struct dwc3_pci *dwc,
 				gpiod_put(gpio);
 				usleep_range(10000, 11000);
 			}
+
+			/*
+			 * Some Android tablets with a Crystal Cove PMIC
+			 * (INT33FD), rely on the TUSB1211 phy for charger
+			 * detection. These can be identified by them _not_
+			 * using the standard ACPI battery and ac drivers.
+			 */
+			if (acpi_dev_present("INT33FD", "1", 2) &&
+			    acpi_quirk_skip_acpi_ac_and_battery()) {
+				dev_info(&pdev->dev, "Using TUSB1211 phy for charger detection\n");
+				swnode = &dwc3_pci_intel_phy_charger_detect_swnode;
+			}
 		}
 	}
 
-- 
2.33.1

