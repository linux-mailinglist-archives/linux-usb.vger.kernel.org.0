Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D33B21CCE38
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2020 23:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgEJVjm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 May 2020 17:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726955AbgEJVjl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 May 2020 17:39:41 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC98C061A0C
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 14:39:41 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id r22so2024303pga.12
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iANHJ7e8F5rDDMVEjkVBLCo69M1YwvfzRbabUbcHS0=;
        b=KWUJzpjb8WH9ULV3vl9koElUYI7lAPqQklNc9+B5rhLu1VpuK4IJw6cmnSXeqEnSv3
         zhgs5jwJ2TAJqjE8UGd5rvJaFlHPvr2ZIoUCBSC/HMuXMQDDe9TgmmzZO/aSu8FKzpIg
         KYykPqbQDAyERQRSKplXsZtz7OiX7RF5IJP6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3iANHJ7e8F5rDDMVEjkVBLCo69M1YwvfzRbabUbcHS0=;
        b=amz6z3HAYZ/xHm4EYe0FHwzBQJrDgs9NdThknjE913ZQrq/A/+yNNFEGsyae0sJ4CI
         UUa+w0KIBtEX6u792l+pBfvxCEoEtZe0EYFOAW/6ye1iCM6ls0K9Fz0H3FDLtGooWLHQ
         7fF3333iTmjJQgXObSxMNX3A6mcszuAZFnTWvIQpii806LNzpOsUGbmnvUaXXYZ0dG8R
         RU80w5yc8g9Ury5dxz+Ya7JZLngXOdHrXEDMF2I+uKVw7Jj7orkrTvu7bvYcJBASlTZy
         OBO5my5oll1GpxELeT3sZkOegFVjZLr8ARJnE+s5R1lsdOBcLEzRJmfn2nd5pZeDm2WI
         5tbg==
X-Gm-Message-State: AGi0PuZkPgn4SNYc09wsx6l3d2JPvUMloEDJsCVTl8UBTlLEpUzMMPuB
        4qZy/GooPgmORNky4UuLndkmsA==
X-Google-Smtp-Source: APiQypJJVDX5qnULq73bi9k/KREKzStiDcOJ9/EvkpsbfF7ziV55GHM9UIoV9qrUL8dmKXrJ8x6e6g==
X-Received: by 2002:a63:742:: with SMTP id 63mr11894197pgh.33.1589146781125;
        Sun, 10 May 2020 14:39:41 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id c1sm7463314pfo.152.2020.05.10.14.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 14:39:40 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Subject: [PATCH v2] usb: typec: mux: intel: Fix DP_HPD_LVL bit field
Date:   Sun, 10 May 2020 14:39:30 -0700
Message-Id: <20200510213934.146631-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to the PMC Type C Subsystem (TCSS) Mux programming guide rev
0.6, the PMC HPD request LVL bit field is bit 4.
Fix the definition here to match the programming guide.

Since this bit field is changing, explicitly define a field for the
HPD_HIGH mode data bit.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
Reviewed-by: Benson Leung <bleung@chromium.org>
---

Changes in v2:
- Fixed bit error in commit message.

 drivers/usb/typec/mux/intel_pmc_mux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 67c5139cfa0d..15074aec94eb 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -63,6 +63,7 @@ enum {
 #define PMC_USB_ALTMODE_DP_MODE_SHIFT	8
 
 /* TBT specific Mode Data bits */
+#define PMC_USB_ALTMODE_HPD_HIGH	BIT(14)
 #define PMC_USB_ALTMODE_TBT_TYPE	BIT(17)
 #define PMC_USB_ALTMODE_CABLE_TYPE	BIT(18)
 #define PMC_USB_ALTMODE_ACTIVE_LINK	BIT(20)
@@ -75,7 +76,7 @@ enum {
 
 /* Display HPD Request bits */
 #define PMC_USB_DP_HPD_IRQ		BIT(5)
-#define PMC_USB_DP_HPD_LVL		BIT(6)
+#define PMC_USB_DP_HPD_LVL		BIT(4)
 
 struct pmc_usb;
 
@@ -158,8 +159,7 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 			 PMC_USB_ALTMODE_DP_MODE_SHIFT;
 
 	if (data->status & DP_STATUS_HPD_STATE)
-		req.mode_data |= PMC_USB_DP_HPD_LVL <<
-				 PMC_USB_ALTMODE_DP_MODE_SHIFT;
+		req.mode_data |= PMC_USB_ALTMODE_HPD_HIGH;
 
 	return pmc_usb_command(port, (void *)&req, sizeof(req));
 }
-- 
2.26.2.645.ge9eca65c58-goog

