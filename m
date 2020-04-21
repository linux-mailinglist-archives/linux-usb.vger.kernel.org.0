Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98011B2331
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 11:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgDUJtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Apr 2020 05:49:04 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:51510 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726628AbgDUJtE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Apr 2020 05:49:04 -0400
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8818EC0350;
        Tue, 21 Apr 2020 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1587462543; bh=HFowMbPhmFZpI2RfUFW3cHan0oDGMyMQ+vVs81lilBA=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=CheXiLPf8P91WgNEqBLKE+xeqphsi4e2miUpPQectGQmq37q6NFrklcF3BZrelE+L
         5oCBrV/r1u79nILu/20q6VDLkP8KTYSQhqSYZE6BX1m6+Y0Nf4thBl8BY57bLOmJea
         m8SMHjiKu68jLfOnpA9OltdEw3MhfY9yLr1PlLb2OEm6PrP5+Nd6P3oDPAiqEtqu7W
         9nGPZyNi1xrga1IeiZOMehHGfml+JWZgKlhCXCgvjRfkkY0lrVFCmytjWwv2cJwJQd
         4a/nfcJOzmQSkc+TJenKQhd3r6Nb/kYKINeM3O004sZwNQmzwKqOUQOEO4B0U6e4GS
         5KS422E+njAaA==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.16.13])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 62F84A005C;
        Tue, 21 Apr 2020 09:49:00 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Tue, 21 Apr 2020 15:18:58 +0530
Date:   Tue, 21 Apr 2020 15:18:58 +0530
Message-Id: <77fb2e745a73d4fd2945e161fa3bc713f834fbc2.1587461220.git.joglekar@synopsys.com>
In-Reply-To: <cover.1587461220.git.joglekar@synopsys.com>
References: <cover.1587461220.git.joglekar@synopsys.com>
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [RFC PATCH v2 3/4] usb: dwc3: Add device property sgl-trb-cache-size-quirk
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejas Joglekar <Tejas.Joglekar@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This commit adds the sgl-trb-cache-size-quirk property to enable
quirk for the XHCI driver with Synopsys xHC. This property is
enabled as initial property for the dwc3-haps driver.

Signed-off-by: Tejas Joglekar <joglekar@synopsys.com>
---
 Changes in v2:
 - Renamed the property

 drivers/usb/dwc3/core.c      | 2 ++
 drivers/usb/dwc3/core.h      | 2 ++
 drivers/usb/dwc3/dwc3-haps.c | 1 +
 drivers/usb/dwc3/host.c      | 6 +++++-
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index ab6323b8e323..beb95f5fdce3 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1303,6 +1303,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,usb3_lpm_capable");
 	dwc->usb2_lpm_disable = device_property_read_bool(dev,
 				"snps,usb2-lpm-disable");
+	dwc->sgl_trb_cache_size_quirk = device_property_read_bool(dev,
+				"snps,sgl-trb-cache-size-quirk");
 	device_property_read_u8(dev, "snps,rx-thr-num-pkt-prd",
 				&rx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,rx-max-burst-prd",
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index bfc5c780a963..10647cbeea68 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1007,6 +1007,7 @@ struct dwc3_scratchpad_array {
  *			not needed for DWC_usb31 version 1.70a-ea06 and below
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm
+ * @sgl_trb_cache_size_quirk: set to enable the SG list consolidation
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1206,6 +1207,7 @@ struct dwc3 {
 	unsigned		dis_start_transfer_quirk:1;
 	unsigned		usb3_lpm_capable:1;
 	unsigned		usb2_lpm_disable:1;
+	unsigned		sgl_trb_cache_size_quirk:1;
 
 	unsigned		disable_scramble_quirk:1;
 	unsigned		u2exit_lfps_quirk:1;
diff --git a/drivers/usb/dwc3/dwc3-haps.c b/drivers/usb/dwc3/dwc3-haps.c
index 3cecbf169452..9311cbe5f264 100644
--- a/drivers/usb/dwc3/dwc3-haps.c
+++ b/drivers/usb/dwc3/dwc3-haps.c
@@ -29,6 +29,7 @@ static const struct property_entry initial_properties[] = {
 	PROPERTY_ENTRY_BOOL("snps,usb3_lpm_capable"),
 	PROPERTY_ENTRY_BOOL("snps,has-lpm-erratum"),
 	PROPERTY_ENTRY_BOOL("snps,dis_enblslpm_quirk"),
+	PROPERTY_ENTRY_BOOL("snps,sgl-trb-cache-size-quirk"),
 	PROPERTY_ENTRY_BOOL("linux,sysdev_is_parent"),
 	{ },
 };
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index 86dbd012b984..c1d851ff39b1 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -44,7 +44,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
 
 int dwc3_host_init(struct dwc3 *dwc)
 {
-	struct property_entry	props[4];
+	struct property_entry	props[5];
 	struct platform_device	*xhci;
 	int			ret, irq;
 	struct resource		*res;
@@ -95,6 +95,10 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
+	if (dwc->sgl_trb_cache_size_quirk)
+		props[prop_idx++] =
+			PROPERTY_ENTRY_BOOL("sgl-trb-cache-size-quirk");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.11.0

