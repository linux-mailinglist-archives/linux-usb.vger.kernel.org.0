Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C1FE4B3B76
	for <lists+linux-usb@lfdr.de>; Sun, 13 Feb 2022 14:05:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236121AbiBMNFr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Feb 2022 08:05:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231652AbiBMNFr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Feb 2022 08:05:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BD9665B88E
        for <linux-usb@vger.kernel.org>; Sun, 13 Feb 2022 05:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644757540;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VTtksw/kNF8G+OAAAdw+cff6C6rBjpvCwfNWJ3xDNTA=;
        b=VOTNgD/MRpE8UP553n5zSVppGVjMuNh87rdcjQLlWTnk5Xcuuib1u17a0JvT8bWBVkVZ9x
        tl9lQeNWaDgVtv5KdZWDlvtHOIBuiBAoayLBvsop1Dh41S7+uXIIdsIFY02kcPIGot7aHI
        Gr5jBb1qSIm6aGSnwsMdwbSD0xJX8UY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-A7NOnRYcM2WKE17VA2WZYw-1; Sun, 13 Feb 2022 08:05:36 -0500
X-MC-Unique: A7NOnRYcM2WKE17VA2WZYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD09C184608A;
        Sun, 13 Feb 2022 13:05:34 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.92])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 604657B9DD;
        Sun, 13 Feb 2022 13:05:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: [PATCH v2 1/9] usb: dwc3: pci: Add "snps,dis_u2_susphy_quirk" for Intel Bay Trail
Date:   Sun, 13 Feb 2022 14:05:16 +0100
Message-Id: <20220213130524.18748-2-hdegoede@redhat.com>
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

Commit e0082698b689 ("usb: dwc3: ulpi: conditionally resume ULPI PHY")
fixed an issue where ULPI transfers would timeout if any requests where
send to the phy sometime after init, giving it enough time to auto-suspend.

Commit e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend
regression") changed the behavior to instead of clearing the
DWC3_GUSB2PHYCFG_SUSPHY bit, add an extra sleep when it is set.

But on Bay Trail devices, when phy_set_mode() gets called during init,
this leads to errors like these:
[   28.451522] tusb1210 dwc3.ulpi: error -110 writing val 0x01 to reg 0x0a
[   28.464089] tusb1210 dwc3.ulpi: error -110 writing val 0x01 to reg 0x0a

Add "snps,dis_u2_susphy_quirk" to the settings for Bay Trail devices to
fix this. This restores the old behavior for Bay Trail devices, since
previously the DWC3_GUSB2PHYCFG_SUSPHY bit would get cleared on the first
ulpi_read/_write() and then was never set again.

Fixes: e5f4ca3fce90 ("usb: dwc3: ulpi: Fix USB2.0 HS/FS/LS PHY suspend regression")
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/dwc3/dwc3-pci.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-pci.c b/drivers/usb/dwc3/dwc3-pci.c
index 7ff8fc8f79a9..022341aef400 100644
--- a/drivers/usb/dwc3/dwc3-pci.c
+++ b/drivers/usb/dwc3/dwc3-pci.c
@@ -119,6 +119,13 @@ static const struct property_entry dwc3_pci_intel_properties[] = {
 	{}
 };
 
+static const struct property_entry dwc3_pci_intel_byt_properties[] = {
+	PROPERTY_ENTRY_STRING("dr_mode", "peripheral"),
+	PROPERTY_ENTRY_BOOL("snps,dis_u2_susphy_quirk"),
+	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
+	{}
+};
+
 static const struct property_entry dwc3_pci_mrfld_properties[] = {
 	PROPERTY_ENTRY_STRING("dr_mode", "otg"),
 	PROPERTY_ENTRY_STRING("linux,extcon-name", "mrfld_bcove_pwrsrc"),
@@ -161,6 +168,10 @@ static const struct software_node dwc3_pci_intel_swnode = {
 	.properties = dwc3_pci_intel_properties,
 };
 
+static const struct software_node dwc3_pci_intel_byt_swnode = {
+	.properties = dwc3_pci_intel_byt_properties,
+};
+
 static const struct software_node dwc3_pci_intel_mrfld_swnode = {
 	.properties = dwc3_pci_mrfld_properties,
 };
@@ -344,7 +355,7 @@ static const struct pci_device_id dwc3_pci_id_table[] = {
 	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
 
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_BYT),
-	  (kernel_ulong_t) &dwc3_pci_intel_swnode, },
+	  (kernel_ulong_t) &dwc3_pci_intel_byt_swnode, },
 
 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_MRFLD),
 	  (kernel_ulong_t) &dwc3_pci_intel_mrfld_swnode, },
-- 
2.33.1

