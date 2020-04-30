Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 532CF1BFB02
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 15:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729273AbgD3N5H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 09:57:07 -0400
Received: from mga02.intel.com ([134.134.136.20]:18821 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728068AbgD3N5A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 Apr 2020 09:57:00 -0400
IronPort-SDR: JX4pCOyjCT2qvT+vmDO18LjpBXlS3kGyz0IH+uxSSrUE6FF5137KpafFS3jIdZM89zVtmqoER+
 CWp2FNXyPsFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2020 06:57:00 -0700
IronPort-SDR: 40kyOiQdPwuTcwXgT4kw40nfwFO2WXwykGUus353VDBlAxw+/rmikldxjlRWGRDtJ/kSNSy0Lg
 ghIc2kLCOQEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; 
   d="scan'208";a="368150477"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2020 06:56:58 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org
Subject: [PATCH] usb: typec: intel_pmc_mux: Fix the property names
Date:   Thu, 30 Apr 2020 16:56:57 +0300
Message-Id: <20200430135657.45169-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The device property names for the port index number are
"usb2-port-number" and "usb3-port-number", not "usb2-port"
and "usb3-port".

Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index f5c5e0aef66f..bb23886c1768 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -298,11 +298,11 @@ static int pmc_usb_register_port(struct pmc_usb *pmc, int index,
 	struct typec_mux_desc mux_desc = { };
 	int ret;
 
-	ret = fwnode_property_read_u8(fwnode, "usb2-port", &port->usb2_port);
+	ret = fwnode_property_read_u8(fwnode, "usb2-port-number", &port->usb2_port);
 	if (ret)
 		return ret;
 
-	ret = fwnode_property_read_u8(fwnode, "usb3-port", &port->usb3_port);
+	ret = fwnode_property_read_u8(fwnode, "usb3-port-number", &port->usb3_port);
 	if (ret)
 		return ret;
 
-- 
2.26.2

