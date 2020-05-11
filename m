Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C96701CD4B8
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2020 11:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgEKJTI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 May 2020 05:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729207AbgEKJTI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 May 2020 05:19:08 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26FFDC061A0C
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 02:19:07 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id fu13so7489658pjb.5
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2020 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ppxdbt3wg6MpIF6v81oAC87+g3QZ9WcD03ZvmbvZ7jo=;
        b=KooBIrBrKy2TJB19MW7e2qsWNTWX0dA100ZlIF0uciPLcyEUIJSs5f8ZptI3u3/f4X
         Q24IjVNjCwceInSJapWSqkGySEbcZXtbXccRUT+2/9jpb+1slxRqqDOOVGKMHMfHYmcy
         /G61tkg2Bf5s+qSA3A9YBqj2O49eh9L2nmDow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ppxdbt3wg6MpIF6v81oAC87+g3QZ9WcD03ZvmbvZ7jo=;
        b=pSHTVLkCh5ATmfV5NRjh5us8qKM2ptpj2jlVWqpj8jei0HsUyeNLZZs0ycZYMueT8E
         Z74PmSuXuP+20ZTmyDJj1YamINHQvCkYFgvxF7eTJAe+3ukhHbYxBmi4pqDrE6HYeXne
         RIIRPghxceMMlsBAWNphCR+SsVoRhwGzXIuJJ7gY49RW/xCC50Zl4QjRIqA8DmuCuXMz
         lPx2l/2XSguUhjaflYeQrmEdvtaiCRyycA/GwLjO493ueeoGFeryOQRxbtbjHHrNYdYi
         TuJ3ENRZGcH2+iV17jUW2+HgJ2zfiWMhIgGdlXxfMVJhdC8mTW/OMObN0ekLEhqACiwp
         r0GQ==
X-Gm-Message-State: AGi0Pua4FSraC+JlWj6YBqZgIJvYGlTJm/bxzuC9OpC/a7dYSoJy9TL4
        S78vNO3OyuWW7muru9exOjrDIA==
X-Google-Smtp-Source: APiQypIKCKIALdTDo0hz8f0hTlj7IJPYcUvpahUaYzvMCI2N6KnD5vj3bMeXrtdgvZfoKMXX13Wf4g==
X-Received: by 2002:a17:902:9b8f:: with SMTP id y15mr14078504plp.148.1589188746465;
        Mon, 11 May 2020 02:19:06 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id x19sm8678535pfq.137.2020.05.11.02.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 02:19:06 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     bleung@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Subject: [PATCH v3] usb: typec: mux: intel: Fix DP_HPD_LVL bit field
Date:   Mon, 11 May 2020 02:18:34 -0700
Message-Id: <20200511091837.102508-1-pmalani@chromium.org>
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

Changes in v3:
- Fixed sorting of the bit field after modification.

Changes in v2:
- Fixed bit error in commit message.

 drivers/usb/typec/mux/intel_pmc_mux.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index 67c5139cfa0d..c22e5c4bbf1a 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -63,6 +63,7 @@ enum {
 #define PMC_USB_ALTMODE_DP_MODE_SHIFT	8
 
 /* TBT specific Mode Data bits */
+#define PMC_USB_ALTMODE_HPD_HIGH	BIT(14)
 #define PMC_USB_ALTMODE_TBT_TYPE	BIT(17)
 #define PMC_USB_ALTMODE_CABLE_TYPE	BIT(18)
 #define PMC_USB_ALTMODE_ACTIVE_LINK	BIT(20)
@@ -74,8 +75,8 @@ enum {
 #define PMC_USB_ALTMODE_TBT_GEN(_g_)	(((_g_) & GENMASK(1, 0)) << 28)
 
 /* Display HPD Request bits */
+#define PMC_USB_DP_HPD_LVL		BIT(4)
 #define PMC_USB_DP_HPD_IRQ		BIT(5)
-#define PMC_USB_DP_HPD_LVL		BIT(6)
 
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

