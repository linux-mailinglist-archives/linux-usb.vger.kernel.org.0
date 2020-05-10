Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF851CCDE8
	for <lists+linux-usb@lfdr.de>; Sun, 10 May 2020 22:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbgEJUcA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 10 May 2020 16:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729365AbgEJUb7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 10 May 2020 16:31:59 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830B2C05BD09
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 13:31:59 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id b8so3542047pgi.11
        for <linux-usb@vger.kernel.org>; Sun, 10 May 2020 13:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KiTiJrfrc9OVCGuZbos3d47NLpXfJnte4vSA/u87SI=;
        b=A9gC3dB608EdDSmZiIs04DyzufuimTcBcTwntuIDBL7fRNDYiRum2ReDQQgmtsoABW
         ckocj4U/0MNHD1313IpNaF2kxU4zz3+jqLXcgSnVqpHCk7L5xfx67oW5cuky1x4i48+D
         hZhxpf+FPzamsqW7Km5npGqFwgUnoGP41i+8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0KiTiJrfrc9OVCGuZbos3d47NLpXfJnte4vSA/u87SI=;
        b=VoPgQitmuETX+1scs5MhZg9aCjES4kzCEs8Knet9xDAZNiJd8C3ttKi60T4uzDwvtx
         ULKYvZAvMpWj5krv8I+sEwVUuGGBIfytMGsXO83sfzZfjElyaRny0rkujq0xgiCA2oKc
         ZETlFW/9CkbVhi/aX60Q4JwJmnE+S0yTQERA3KhW2czAqTvTclsg0nnT5sXR8SwSXhSz
         WzK8kPDlxLISm19kYnNt71VsurWsto0EKsBrbfSftuoBcFaZN3TYNeWMsCWSDFkYgtLm
         idOMvefD1fF7YJtjaT9ciFk4cdPCXUPFIAF9rE92HqQCof7yyxo3EaPWXhTKf3EaxP37
         6ZeQ==
X-Gm-Message-State: AGi0PuYKm1Lu8FezOUjSRtXb4xyUwR0LwG1hw0uVfMeTFBfIInauPIeo
        lSgmJuQu7xeJQ+sXwW7Zm/Fc3l369s4=
X-Google-Smtp-Source: APiQypJCRQLdsw9Fe1HgOwYYJLrkhYfsqX1sxUkQfq3pTFPjcTycIcITLoMmcvS0/tuAMDUBYZhxUg==
X-Received: by 2002:aa7:8e8b:: with SMTP id a11mr12736041pfr.62.1589142718963;
        Sun, 10 May 2020 13:31:58 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id p7sm6189094pgg.91.2020.05.10.13.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 13:31:58 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Subject: [PATCH] usb: typec: mux: intel: Fix DP_HPD_LVL bit field
Date:   Sun, 10 May 2020 13:31:43 -0700
Message-Id: <20200510203148.122364-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to the PMC Type C Subsystem (TCSS) Mux programming guide rev
0.6, the PMC HPD request LVL bit field is bit 5.
Fix the definition here to match the programming guide.

Since this bit field is changing, explicitly define a field for the
HPD_HIGH mode data bit.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
---
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

