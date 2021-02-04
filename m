Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD3530EB74
	for <lists+linux-usb@lfdr.de>; Thu,  4 Feb 2021 05:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbhBDELw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 Feb 2021 23:11:52 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:43664 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231499AbhBDELv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 Feb 2021 23:11:51 -0500
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F1CB40871;
        Thu,  4 Feb 2021 04:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612411851; bh=AD9hgEk+PcQQoc0KnNzGzI+2X7CeXR3b0ecWqglm19E=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=W8bpAXPP+A4G9CLmETwou+Rk1siGJuL8aaaaUvy3jCye2TG34SV4qAfvhCqgJ3fvu
         VXg18SC1TbSom7f5FeACc5kvjrOJzw+g+52JVASKib5/5TL1t52c9s0QnFUJ8uEpyZ
         81DuQYcMikYBUztRIhNKPjLo2KsBc6/HqCusMohBQ1BSAF9FPsM1eqNgtJDnFXdRBn
         2+Kz4ckC4vYeT+OMOLveffsVKh6tH6Uaz8zcg+cx7faYqyBUSpcD484d78kelZcZqY
         iCG8ux1+QWeAF8IGcxTcasQ0S0c7ZDrzvqZNe7LShDsJ27KIbHG4LDgcdyv6+Jq954
         1E1BSOvNnXAUA==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 28B91A0099;
        Thu,  4 Feb 2021 04:10:48 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Wed, 03 Feb 2021 20:10:48 -0800
Date:   Wed, 03 Feb 2021 20:10:48 -0800
Message-Id: <d7049743924adf82f93ddfe403a5ebb9ac06e49b.1612410491.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612410491.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH v2 3/8] usb: core: hub: Print speed name based on ssp rate
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Hardik Gajjar <hgajjar@de.adit-jv.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Oliver Neukum <oneukum@suse.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Check for usb_device->ssp_rate to print the SuperSpeed Plus signaling
rate generation and lane count.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 Changes in v2:
 - None

 drivers/usb/core/hub.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 823470607d58..6dc4e7385e75 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -4830,9 +4830,13 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
 						"%s SuperSpeed%s%s USB device number %d using %s\n",
 						(udev->config) ? "reset" : "new",
 					 (udev->speed == USB_SPEED_SUPER_PLUS) ?
-							"Plus Gen 2" : " Gen 1",
-					 (udev->rx_lanes == 2 && udev->tx_lanes == 2) ?
-							"x2" : "",
+							" Plus" : "",
+					 (udev->ssp_rate == USB_SSP_GEN_2x2) ?
+							" gen2x2" :
+					 (udev->ssp_rate == USB_SSP_GEN_2x1) ?
+							" gen2x1" :
+					 (udev->ssp_rate == USB_SSP_GEN_1x2) ?
+							" gen1x2" : "",
 					 devnum, driver_name);
 			}
 
-- 
2.28.0

