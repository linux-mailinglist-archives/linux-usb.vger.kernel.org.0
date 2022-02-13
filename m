Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E32B4B3B75
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236151AbiBMNFy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:05:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236154AbiBMNFx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 330565D65D
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Z6WAh0cLbaV+DuQjckj1L6hLSWsngwI8qpPCgBJQSdQ=;
        b=NJ/y++Dd0JqcQTuUPltoFLfo4RErw5U5HoscutgvYkhRlH7CO3R49vlndya3hSczWJ0Cmr
        5VOL2d+hIV8/GaxghlKONNoR1Hfe/eFZ304UneSMhDBmnca2wG8n425XV5a043LWleylG2
        QYr7KO7XJTeH5Qww7MLKNVKYvP4dweY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-186-ISpd-DuaO_q-8I_6QSDO3g-1; Sun, 13 Feb 2022 08:05:42 -0500
X-MC-Unique: ISpd-DuaO_q-8I_6QSDO3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E30A580D680;
        Sun, 13 Feb 2022 13:05:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5A87A7B9DD;
        Sun, 13 Feb 2022 13:05:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 4/9] usb: dwc3: pci: Set "linux,phy_charger_detect" property on some Bay Trail boards
Date:   Sun, 13 Feb 2022 14:05:19 +0100
Message-Id: <20220213130524.18748-5-hdegoede@redhat.com>
In-Reply-To: <20220213130524.18748-1-hdegoede@redhat.com>
References: <20220213130524.18748-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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

