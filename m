Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE3A336AE2
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 04:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhCKDnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 22:43:37 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:38274 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230521AbhCKDnQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 22:43:16 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BBBBD407E6;
        Thu, 11 Mar 2021 03:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1615434196; bh=yMG0plwPYMqkB9K/iO+n+LHWI6eKKulG7bxSfmWZSQY=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=MzEcp5j+mf3+pT6hGMg4sDyrgSUy8Z5iJpZRAMX4s41T+hZC3EDTYlc0+lgKr4z/j
         7vbYW1sZteifioFz7iekprSv/3oQgfuzZ15PJV+EUR8uhDhUFslCy5+vJn7elAuTkI
         w5WQGMHxcuUg365DJYzfYK8VP3ulXvqCVW4agHEG4aJKUnqWYMMKg1QR0vcXVFYzmc
         5KZf3xGYQ5INLHCEVQ8ll9BW5T6L5fZ2ctd7i75tnJ4l503ANCtPvx7GJOuQfru/4d
         u5kYY5gNL0hu+yGCy7D7KaxwFehPH6o4rDiZ33/ytQehmSUpgQQC2ulaZgrwfmCxPl
         hAk0cbmwOKrSA==
Received: from lab-vbox (unknown [10.205.137.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 903A2A00A0;
        Thu, 11 Mar 2021 03:43:15 +0000 (UTC)
Received: by lab-vbox (sSMTP sendmail emulation); Wed, 10 Mar 2021 19:43:15 -0800
Date:   Wed, 10 Mar 2021 19:43:15 -0800
Message-Id: <f1698a96d5f9dfaefb857b95e5db6135ae0c9e93.1615432770.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
References: <cover.1615432770.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v3 5/8] usb: xhci: Init root hub SSP rate
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Initialize USB 3.x root hub SuperSpeed Plus rate.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v3:
 - None
 Changes in v2:
 - None

 drivers/usb/host/xhci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 13baeda927f0..6d1c83fd40f7 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5218,10 +5218,12 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
 			hcd->self.root_hub->rx_lanes = 2;
 			hcd->self.root_hub->tx_lanes = 2;
+			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x2;
 			break;
 		case 1:
 			hcd->speed = HCD_USB31;
 			hcd->self.root_hub->speed = USB_SPEED_SUPER_PLUS;
+			hcd->self.root_hub->ssp_rate = USB_SSP_GEN_2x1;
 			break;
 		}
 		xhci_info(xhci, "Host supports USB 3.%x %sSuperSpeed\n",
-- 
2.28.0

