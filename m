Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E9230B5FB
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbhBBDnh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:43:37 -0500
Received: from smtprelay-out1.synopsys.com ([149.117.87.133]:36114 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229621AbhBBDne (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Feb 2021 22:43:34 -0500
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com [10.205.2.133])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 54E9FC00A7;
        Tue,  2 Feb 2021 03:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1612237354; bh=x4AiZhDJ2o2FPK5yRErfbehkRFd2jB7wsuo+utODW4o=;
        h=Date:In-Reply-To:References:From:Subject:To:From;
        b=bzKZJGModnLc7dA2jIjiSgz+N12Xmc5j2OLuWSToZoak7e4HbJkLrUpbDYr/PF3Fc
         dR9+qfdDaSMpE96fOwkYPF3nEYaogA42Auo8Pqf5TDN8MQuVSp40xi7rwD1VCprm6G
         8ht5M7qx65YnS2n+h2svZGjolLjpkATj5iZ9LXc0MhLeq5dJrt0lXB5h2Zu719eEpR
         WRiM33RosfSytkirQ4/jJAUH5ghItiBffpXiS5f09uxWU8v1EEz35y3BE7P272PHRa
         x8KBnT+MoNpEsVkqCl1CZgSt2R/zIAlAkFTrE7xRAJlp4Q4U3IvrLFYtwCh+91eiXb
         bzhWi4Msbn1rw==
Received: from te-lab16 (unknown [10.10.52.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 24A00A007C;
        Tue,  2 Feb 2021 03:42:33 +0000 (UTC)
Received: by te-lab16 (sSMTP sendmail emulation); Mon, 01 Feb 2021 19:42:33 -0800
Date:   Mon, 01 Feb 2021 19:42:33 -0800
Message-Id: <361ae7480982a89410ec8437c383d3475f25efa8.1612237179.git.Thinh.Nguyen@synopsys.com>
In-Reply-To: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
References: <cover.1612237179.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [RFC PATCH 3/8] usb: core: hub: Print speed name based on ssp rate
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

