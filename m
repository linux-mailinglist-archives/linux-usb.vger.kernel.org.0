Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4B81E3F50
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 12:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgE0Knw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 06:43:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:35330 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726320AbgE0Knv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 06:43:51 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E262D4095E;
        Wed, 27 May 2020 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1590576231; bh=ZRDwNcpRxjH2Zef4WlLrcZ/7QuTxowQfGggwkdDixY4=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=G6oC8fydQMeK+BWOH7MkavUuIi5CAog/UCI+y3RnopCs1QLO8Ge0SkSb2Ea9kIR9V
         hqZav63QPsmik8ZVqqJzBDx978YDVyFEAFKP5DtU3LH2kecKDDn8RF7CyJRpvBUpT+
         R6iZ5VZbTliSOu91sG9TGeRvGeYTnVdzZafe8hcc3KUFaSS0VhP66BrU93tUFjPeTm
         WcLsq2O1jrDKf2/5MXEK+b6nt+MRBTdzf7bFG2vymKJNqqZac6tNJeXHkovUT0FIe/
         2dY2A+KR5BEnWRPQFWA+vtMgVpzuR4gwPOYNEPVyrOgGKxKbHz6Cw6YjagpoiB/fha
         tZLxlyKdwzoZA==
Received: from tejas-VirtualBox (joglekar-e7480.internal.synopsys.com [10.146.20.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 74513A005B;
        Wed, 27 May 2020 10:43:47 +0000 (UTC)
Received: by tejas-VirtualBox (sSMTP sendmail emulation); Wed, 27 May 2020 16:11:45 +0530
Date:   Wed, 27 May 2020 16:11:45 +0530
Message-Id: <83eba2e9f0069f20ccc94537e3b99cbaec209441.1590415123.git.joglekar@synopsys.com>
In-Reply-To: <cover.1590415123.git.joglekar@synopsys.com>
References: <cover.1590415123.git.joglekar@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Tejas Joglekar <Tejas.Joglekar@synopsys.com>
Subject: [PATCH v3 3/4] usb: dwc3: Add device property sgl-trb-cache-size-quirk
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
 drivers/usb/dwc3/core.c      | 2 ++
 drivers/usb/dwc3/core.h      | 2 ++
 drivers/usb/dwc3/dwc3-haps.c | 1 +
 drivers/usb/dwc3/host.c      | 6 +++++-
 4 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 25c686a752b0..bc295477e1bc 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1299,6 +1299,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 				"snps,usb3_lpm_capable");
 	dwc->usb2_lpm_disable = device_property_read_bool(dev,
 				"snps,usb2-lpm-disable");
+	dwc->sgl_trb_cache_size_quirk = device_property_read_bool(dev,
+				"snps,sgl-trb-cache-size-quirk");
 	device_property_read_u8(dev, "snps,rx-thr-num-pkt-prd",
 				&rx_thr_num_pkt_prd);
 	device_property_read_u8(dev, "snps,rx-max-burst-prd",
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 013f42a2b5dc..0dca0dbf4309 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -1021,6 +1021,7 @@ struct dwc3_scratchpad_array {
  *			not needed for DWC_usb31 version 1.70a-ea06 and below
  * @usb3_lpm_capable: set if hadrware supports Link Power Management
  * @usb2_lpm_disable: set to disable usb2 lpm
+ * @sgl_trb_cache_size_quirk: set to enable the SG list consolidation
  * @disable_scramble_quirk: set if we enable the disable scramble quirk
  * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
  * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
@@ -1220,6 +1221,7 @@ struct dwc3 {
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
index bef1c1ac2067..e0089c82728e 100644
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

