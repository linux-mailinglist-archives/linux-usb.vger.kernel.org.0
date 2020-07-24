Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 519EC22D023
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jul 2020 23:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGXVBK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jul 2020 17:01:10 -0400
Received: from smtprelay-out1.synopsys.com ([149.117.73.133]:48688 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726784AbgGXVBK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jul 2020 17:01:10 -0400
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E65E4011D;
        Fri, 24 Jul 2020 21:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1595624470; bh=JApdtHAUnRW8M7TIBKQuwZNMW3sxIbUVJ6+60lDw/ow=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=T1BWFzbJpicEL4LIc72bcuNHDhmg3ZZf6iKGvwcwM3sZtAzQEF45EgYXmUpATJF9E
         GssPxiWcY7oKuj7dqjnYrgcYPkI9ADneYA6zW5TQnLMXspqboGHCvZL1YJkGfrV5aU
         42r94Do1NcvLFuClZx3q945cEyOw5+DzvMgm+Gi1dDnzBqhulq991aC0Q03KD8bSzY
         0SUrZBkW6r2ZMsVFXEl42Q1uhT8dz2RSpIp7/XeMGoEem+IN12ZmjkhtyhTfoReIS1
         xbwKwVuprPUpF/N87O9o/PIxR6T01EKxrU3GjvvsNFyPR2So3Vw+IvtpwmrXmGCad3
         RYqKCqi9N99ow==
Received: from te-lab16 (nanobot.internal.synopsys.com [10.10.186.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 391D4A006F;
        Fri, 24 Jul 2020 21:01:09 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Fri, 24 Jul 2020 14:01:09 -0700
Date:   Fri, 24 Jul 2020 14:01:09 -0700
Message-Id: <7406cacb1286b19337e206ebed9e2562accdb9ad.1595624103.git.thinhn@synopsys.com>
In-Reply-To: <cover.1595624103.git.thinhn@synopsys.com>
References: <cover.1595624103.git.thinhn@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH 2/2] usb: dwc3: core: Print warning on unsupported speed
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The user may have more information to override the HW parameter to
specify the maximum_speed. However, if the user specifies a
maximum_speed that the controller doesn't support, print out a warning.

Signed-off-by: Thinh Nguyen <thinhn@synopsys.com>
---
 drivers/usb/dwc3/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 7f6f5567b118..b2ea96d2db04 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1400,8 +1400,17 @@ static void dwc3_check_params(struct dwc3 *dwc)
 	case USB_SPEED_LOW:
 	case USB_SPEED_FULL:
 	case USB_SPEED_HIGH:
+		break;
 	case USB_SPEED_SUPER:
+		if (hwparam_gen == DWC3_GHWPARAMS3_SSPHY_IFC_DIS)
+			dev_warn(dev, "UDC doesn't support Gen 1\n");
+		break;
 	case USB_SPEED_SUPER_PLUS:
+		if ((DWC3_IP_IS(DWC32) &&
+		     hwparam_gen == DWC3_GHWPARAMS3_SSPHY_IFC_DIS) ||
+		    (!DWC3_IP_IS(DWC32) &&
+		     hwparam_gen != DWC3_GHWPARAMS3_SSPHY_IFC_GEN2))
+			dev_warn(dev, "UDC doesn't support SSP\n");
 		break;
 	default:
 		dev_err(dev, "invalid maximum_speed parameter %d\n",
-- 
2.11.0

