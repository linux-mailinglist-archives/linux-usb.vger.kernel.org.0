Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD4B127BD7
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 14:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbfLTNjm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 08:39:42 -0500
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]:44068 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727344AbfLTNjm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Dec 2019 08:39:42 -0500
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6364B40623;
        Fri, 20 Dec 2019 13:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1576849181; bh=Q73s5axtV5lb0cf4sW1Zf//9ftFd0yE1BT/yDoHt7BU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=XqFKHhptfyVVCepGTHkaiwVuxVVajxzuAqTTFLuE97/+oaJB5pRwIWryWwLhcggKo
         8HYTWOsPTBVNYguf/KQmDEC0+lmAq7zwz7+5XbTm328QX4DOVHJfOl4EF4l5pByp/c
         3SyBKE8o1vXjnVHF8u0GcGyvzYnmo1cnPQpg61kxUfFnPj6Z/OshPQvNcQ2w6T2J4e
         PTWdpLoN++q0GdLtx63MMWCgGlTqTuBd++7eWleYA5nyqJjON99P0tjj3E3Q0rIBx7
         xYjHK9mxrL0c7Q09n/mIzQQ+D+rIqCKIabOBwpprsi0SwDFjzYSG9rhCxEPHUIJlVu
         il1nmDcK5i2DQ==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.144.133.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 5A7F2A005B;
        Fri, 20 Dec 2019 13:39:38 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Fri, 20 Dec 2019 19:09:35 +0530
Date:   Fri, 20 Dec 2019 19:09:35 +0530
Message-Id: <d7d0a731c520515d0428276b9f9861d8f3b0d760.1576848504.git.joglekar@synopsys.com>
In-Reply-To: <cover.1576848504.git.joglekar@synopsys.com>
References: <cover.1576848504.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH 2/4] usb: dwc3: Add device property consolidate-trbs
To:     Felipe Balbi <balbi@kernel.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds the consolidate-trbs property to enable quirk for the
XHCI driver with Synopsys xHC. This property is enabled as initial
property for the dwc3-haps driver.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 drivers/usb/dwc3/core.c      | 2 ++
 drivers/usb/dwc3/core.h      | 2 ++
 drivers/usb/dwc3/dwc3-haps.c | 1 +
 drivers/usb/dwc3/host.c      | 3 +++
 4 files changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index f561c6c9e8a9..dc0cfcb05b52 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1296,6 +1296,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,usb3_lpm_capable");
 	dwc->usb2_lpm_disable = device_property_read_bool(dev,
 				"snps,usb2-lpm-disable");
+	dwc->consolidate_trbs = device_property_read_bool(dev,
+				"snps,consolidate-trbs");
 	device_property_read_u8(dev, "snps,rx-thr-num-pkt-prd",
 				&rx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,rx-max-burst-prd",
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 1c8b349379af..36b27ea1eb3c 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1000,6 +1000,7 @@ struct dwc3_scratchpad_array {
  *			not needed for DWC_usb31 version 1.70a-ea06 and below
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm
+ * @consolidate_trbs: set to enable the TRB consolidation
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1195,6 +1196,7 @@ struct dwc3 {
 	unsigned		dis_start_transfer_quirk:1;
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
+	unsigned		consolidate_trbs:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/dwc3-haps.c b/drivers/usb/dwc3/dwc3-haps.c
index 3cecbf169452..639ef9f01926 100644
--- a/drivers/usb/dwc3/dwc3-haps.c
+++ b/drivers/usb/dwc3/dwc3-haps.c
@@ -29,6 +29,7 @@ static const struct property_entry initial_properties[] = {
 	PROPERTY_ENTRY_BOOL("snps,usb3_lpm_capable"),
 	PROPERTY_ENTRY_BOOL("snps,has-lpm-erratum"),
 	PROPERTY_ENTRY_BOOL("snps,dis_enblslpm_quirk"),
+	PROPERTY_ENTRY_BOOL("snps,consolidate-trbs"),
 	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
 	{ },
 };
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 5567ed2cddbe..5e8db49370a3 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -93,6 +93,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++].name = "usb2-lpm-disable";
 
+	if (dwc->consolidate_trbs)
+		props[prop_idx++].name = "consolidate-trbs";
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.11.0

