Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2E911E7E75
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 15:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgE2NR5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 09:17:57 -0400
Received: from mga04.intel.com ([192.55.52.120]:29662 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgE2NR4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 May 2020 09:17:56 -0400
IronPort-SDR: Bc7qlJ4XDx2tbeeXge6So0FEhekXUiBOxgN+1KOFzTy8GG2XJPQLXmCunGXI/Q/xYIHO6KY2YB
 5+fIPDjkBjeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2020 06:17:56 -0700
IronPort-SDR: Ss4KJm6Yk7JprosAb+c18Y48ejuar8GUGYLOAhs3luDkFebJ6ied5ZbbgP2Hv1hSh6en1MYSSU
 r/1qlU1LmbHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; 
   d="scan'208";a="376703429"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 May 2020 06:17:54 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: mux: intel_pmc_mux: Fix DP alternate mode entry
Date:   Fri, 29 May 2020 16:17:53 +0300
Message-Id: <20200529131753.15587-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The PMC needs to be notified separately about HPD (hotplug
detected) signal being high after mode entry. There is a bit
"HPD High" in the Alternate Mode Request that the driver
already sets, but that bit is only valid when the
DisplayPort Alternate Mode is directly entered from
disconnected state.

Fixes: 5c4edcdbcd97 ("usb: typec: mux: intel: Fix DP_HPD_LVL bit field")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 962bc69a6a59e..70ddc9d6d49e4 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -148,7 +148,8 @@ pmc_usb_mux_dp_hpd(struct pmc_usb_port *port, struct typec_mux_state *state)
 	msg[0] = PMC_USB_DP_HPD;
 	msg[0] |= port->usb3_port << PMC_USB_MSG_USB3_PORT_SHIFT;
 
-	msg[1] = PMC_USB_DP_HPD_IRQ;
+	if (data->status & DP_STATUS_IRQ_HPD)
+		msg[1] = PMC_USB_DP_HPD_IRQ;
 
 	if (data->status & DP_STATUS_HPD_STATE)
 		msg[1] |= PMC_USB_DP_HPD_LVL;
@@ -161,6 +162,7 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 {
 	struct typec_displayport_data *data = state->data;
 	struct altmode_req req = { };
+	int ret;
 
 	if (data->status & DP_STATUS_IRQ_HPD)
 		return pmc_usb_mux_dp_hpd(port, state);
@@ -181,7 +183,14 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 	if (data->status & DP_STATUS_HPD_STATE)
 		req.mode_data |= PMC_USB_ALTMODE_HPD_HIGH;
 
-	return pmc_usb_command(port, (void *)&req, sizeof(req));
+	ret = pmc_usb_command(port, (void *)&req, sizeof(req));
+	if (ret)
+		return ret;
+
+	if (data->status & DP_STATUS_HPD_STATE)
+		return pmc_usb_mux_dp_hpd(port, state);
+
+	return 0;
 }
 
 static int
-- 
2.26.2

