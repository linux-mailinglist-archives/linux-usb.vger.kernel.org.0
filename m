Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07B7925FF70
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 18:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730430AbgIGQb6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 12:31:58 -0400
Received: from mga09.intel.com ([134.134.136.24]:34574 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729811AbgIGOWF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:22:05 -0400
IronPort-SDR: 7SnCGsY8ygDcgEJR9WmA++8oudIbezDrWnkVWs1b2mk1EqAbuCOYl25x27Q/ni/Gri/ZKJW3z7
 4QHq77l1pSqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="158987053"
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="158987053"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 07:22:01 -0700
IronPort-SDR: KjwBIvDadpSfVWan+1F4N9iKaJL4bmpavJOC7S0SshGxa/9bgjwjk5FWaLfYUaPaiSMyAfrxDS
 U1hbBrTAxL7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="406850924"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2020 07:21:57 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: intel_pmc_mux: Do not configure SBU and HSL Orientation in Alternate modes
Date:   Mon,  7 Sep 2020 17:21:52 +0300
Message-Id: <20200907142152.35678-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200907142152.35678-1-heikki.krogerus@linux.intel.com>
References: <20200907142152.35678-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Utkarsh Patel <utkarsh.h.patel@intel.com>

According to the PMC Type C Subsystem (TCSS) Mux programming guide rev
0.7, bits 4 and 5 are reserved in Alternate modes.
SBU Orientation and HSL Orientation needs to be configured only during
initial cable detection in USB connect flow based on device property of
"sbu-orientation" and "hsl-orientation".
Configuring these reserved bits in the Alternate modes may result in delay
in display link training or some unexpected behaviour.
So do not configure them while issuing Alternate Mode requests.

Fixes: ff4a30d5e243 ("usb: typec: mux: intel_pmc_mux: Support for static SBU/HSL orientation")
Signed-off-by: Utkarsh Patel <utkarsh.h.patel@intel.com>
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 802d443b367c6..3bc08847fb7f0 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -61,8 +61,6 @@ enum {
 
 #define PMC_USB_ALTMODE_ORI_SHIFT	1
 #define PMC_USB_ALTMODE_UFP_SHIFT	3
-#define PMC_USB_ALTMODE_ORI_AUX_SHIFT	4
-#define PMC_USB_ALTMODE_ORI_HSL_SHIFT	5
 
 /* DP specific Mode Data bits */
 #define PMC_USB_ALTMODE_DP_MODE_SHIFT	8
@@ -178,9 +176,6 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 	req.mode_data = (port->orientation - 1) << PMC_USB_ALTMODE_ORI_SHIFT;
 	req.mode_data |= (port->role - 1) << PMC_USB_ALTMODE_UFP_SHIFT;
 
-	req.mode_data |= sbu_orientation(port) << PMC_USB_ALTMODE_ORI_AUX_SHIFT;
-	req.mode_data |= hsl_orientation(port) << PMC_USB_ALTMODE_ORI_HSL_SHIFT;
-
 	req.mode_data |= (state->mode - TYPEC_STATE_MODAL) <<
 			 PMC_USB_ALTMODE_DP_MODE_SHIFT;
 
@@ -208,9 +203,6 @@ pmc_usb_mux_tbt(struct pmc_usb_port *port, struct typec_mux_state *state)
 	req.mode_data = (port->orientation - 1) << PMC_USB_ALTMODE_ORI_SHIFT;
 	req.mode_data |= (port->role - 1) << PMC_USB_ALTMODE_UFP_SHIFT;
 
-	req.mode_data |= sbu_orientation(port) << PMC_USB_ALTMODE_ORI_AUX_SHIFT;
-	req.mode_data |= hsl_orientation(port) << PMC_USB_ALTMODE_ORI_HSL_SHIFT;
-
 	if (TBT_ADAPTER(data->device_mode) == TBT_ADAPTER_TBT3)
 		req.mode_data |= PMC_USB_ALTMODE_TBT_TYPE;
 
-- 
2.28.0

