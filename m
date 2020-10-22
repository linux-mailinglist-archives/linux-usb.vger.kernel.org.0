Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB65F2957C0
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 07:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507855AbgJVFPw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 01:15:52 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:41736 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2444222AbgJVFPw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 01:15:52 -0400
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4CBB40181;
        Thu, 22 Oct 2020 05:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1603343752; bh=Q1ZYE6reHY0F1dz85PwR6YQ0Qz3ZFxx6l4YroKIniEs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=S5N1BnMy+Jqg/cUMkL8le1YBGDgNX5C1mYPg5paYEoUjHnVADZv7S9yDDtPGFYucZ
         MkR3Y+6imsU4SgJMKtfR+esr3AYDT53kGdN4tksm5znav8sklxSwn0FL4W2SlJVzMJ
         isxCeL2wDrV53VkXy84sU5wa5kOc57SCNm0lIys/DJ+Nx2f8eItm5iZM+3w+klTwU5
         IToq2V89JcG+HSXbjcifcO/5tkrKm1RgqDKYpMKeuOkA39ac+SK+8Hk7xbjJBw4hbt
         Cu7bV+DXUyM4O4nei1kUYl25uGNfUoUtW6sbp/1LZdD1ATYDHTGn24eJYAtK9B35mG
         7JcBoPObwHlHA==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 946ACA0099;
        Thu, 22 Oct 2020 05:15:50 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 21 Oct 2020 22:15:50 -0700
Date:   Wed, 21 Oct 2020 22:15:50 -0700
Message-Id: <8a09af680a561e8cab542fb9a39d31251fdb3983.1603343705.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <770d7a50caad241f07d656e29e89e282f727f5da.1603343705.git.Thinh.Nguyen@synopsys.com>
References: <770d7a50caad241f07d656e29e89e282f727f5da.1603343705.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 2/3] usb: dwc3: Set blocked-disconnection quirk
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enable blocked-disconnection quirk in HAPS glue driver and pass it to
the host platform device.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-haps.c | 1 +
 drivers/usb/dwc3/host.c      | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-haps.c b/drivers/usb/dwc3/dwc3-haps.c
index 55b4a901168e..a0cd0b4c5929 100644
--- a/drivers/usb/dwc3/dwc3-haps.c
+++ b/drivers/usb/dwc3/dwc3-haps.c
@@ -26,6 +26,7 @@ struct dwc3_haps {
 };
 
 static const struct property_entry initial_properties[] = {
+	PROPERTY_ENTRY_BOOL("snps,blocked-disconnection"),
 	PROPERTY_ENTRY_BOOL("snps,usb3_lpm_capable"),
 	PROPERTY_ENTRY_BOOL("snps,has-lpm-erratum"),
 	PROPERTY_ENTRY_BOOL("snps,dis_enblslpm_quirk"),
diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index e195176580de..ce512acf1de1 100644
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
@@ -95,6 +95,9 @@ int dwc3_host_init(struct dwc3 *dwc)
 	if (dwc->usb2_lpm_disable)
 		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
 
+	if (device_property_read_bool(dwc->dev, "snps,blocked-disconnection"))
+		props[prop_idx++] = PROPERTY_ENTRY_BOOL("blocked-disconnection");
+
 	/**
 	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
 	 * where Port Disable command doesn't work.
-- 
2.28.0

