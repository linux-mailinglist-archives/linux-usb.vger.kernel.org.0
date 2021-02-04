Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E39030EB76
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 05:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231771AbhBDEMH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 23:12:07 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:37124 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231301AbhBDEME (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 23:12:04 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4F43CC0127;
        Thu,  4 Feb 2021 04:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612411864; bh=fXBBH0FVBztvlTNdbVT2fuh82BRp2/MEjSkH8fe5aks=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=cAv3lESqh5tIWKiPPF3Jn1I6bUBvSPwBCeHGZz68VDtuwTFPvKfjMaDNXmf3QkiJB
         YINZrq6eXUlaL7E0wjbEThJrd9wKI11G8op9WpHERFz600EBUtfnkr13++oQzMWOg2
         V2xrLX53a9t9+nQ8/4NniEPbyEaMGsYBgTj7p3nFfuZTKLqWPJ6oOuktf/ZLc4RUE8
         G9QqW9mDqxKmbxgooKSEvv78JXhGZiflWJl3Ao/HkqzmGXB1qd5uMeljmRGbIaYH96
         7crNkp2H7fIY73z90xB2JtqMsWLmsQ4KhxIqIIORzLgoS14fTj8WYMQOzoyC8aN6qG
         RMXWo1p7gs5NA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 0F35AA0099;
        Thu,  4 Feb 2021 04:11:03 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 03 Feb 2021 20:11:03 -0800
Date:   Wed, 03 Feb 2021 20:11:03 -0800
Message-Id: <f61f653a8f855a4a2b0ea13758d9361f07ae7663.1612410491.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 5/8] usb: xhci: Init root hub SSP rate
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Mathias Nyman <mathias.nyman@intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Initialize USB 3.x root hub SuperSpeed Plus rate.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/host/xhci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f232dc9c172d..7da03a1a5084 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5226,10 +5226,12 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
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

