Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DED431BD404
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 07:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgD2FeP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 01:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725861AbgD2FeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Apr 2020 01:34:15 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46999C03C1AC
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 22:34:15 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id p25so549990pfn.11
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 22:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=El+6gKx5Y3HIntvHMbow+1u5xZcps2vUNvwZMXLjgcQ=;
        b=WgpijuHEKn/8XXCzzKxzjWMCDJHm/DLuRj6MZ/rHiKxUcJuSIyiK0BDpt2/HYqhCyh
         k9nqegW7waD7R8F/AITNi4z6LLTB76q9WZ+x230J+MsJUb/efVXEzRnLAxc5RbPEPK1A
         RZCQKmCBefFLCH3CEI/OdCF4cEnENZmuf+hn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=El+6gKx5Y3HIntvHMbow+1u5xZcps2vUNvwZMXLjgcQ=;
        b=Y2PLZtXwGGLjGiIABoOvX66GmT37eGbNMZ7bOCP92QGtzDKIlGES+17WIjogvVqEmC
         mYiQ3ceqFRoUK4ww/fdjKGDVTifL7Lv2WKWCvfvbx89M54U6KF1luxe2YqwaqtpH1ndO
         G4q60uzkUgQbI/zsi1HLCsJZxM1ZEcOBiaaWi3mpVSAuTxcwR+DV9M5S70+tUqK/ch5H
         CtVGkVQicyuz959GxPWjcOHITfCDNhXhRJ9UtA8fkDXCx+lCSmMwQ3TxuOZX03RZYmle
         Iz1LNGXR1JPbvsyPdBA/kts5+tGBjw3DqYuHZ9x8roJtdReIhvm0rAaBrjgFqFepCv/r
         kh+Q==
X-Gm-Message-State: AGi0PuZZYds2PVHLkRAjq/hrds2lxiUlNlwX7WVwULagOxnpWWnfSvqA
        20cz4J/fKMzCgMhVlP4wkmY8hg==
X-Google-Smtp-Source: APiQypJsMcJxDW6S6sbWCGFKDdmh9p7KsDDtP9z+FRXOXB3y8ocnzGMoSuPivzCd9vTntoaNuVLFsQ==
X-Received: by 2002:a62:6dc3:: with SMTP id i186mr31454744pfc.273.1588138454630;
        Tue, 28 Apr 2020 22:34:14 -0700 (PDT)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id i18sm3588305pjx.33.2020.04.28.22.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 22:34:13 -0700 (PDT)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, bleung@chromium.org,
        Prashant Malani <pmalani@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org (open list:USB TYPEC CLASS)
Subject: [PATCH] usb: typec: mux: intel: Handle alt mode HPD_LVL
Date:   Tue, 28 Apr 2020 22:33:16 -0700
Message-Id: <20200429053319.113508-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

According to the PMC Type C Subsystem (TCSS) Mux programming guide rev
0.6, when a device is transitioning to DP Alternate Mode state, if the
HPD_LVL in the status update command VDO is set, the HPD_HIGH field in
the Alternate Mode request “mode_data” field (bit 14) should also be
set. Ensure the bit is correctly handled while issuing the Alternate
Mode request.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
Fixes: 6701adfa9693 ("usb: typec: driver for Intel PMC mux control")
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index f5c5e0aef66f..c599112559e7 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -157,6 +157,10 @@ pmc_usb_mux_dp(struct pmc_usb_port *port, struct typec_mux_state *state)
 	req.mode_data |= (state->mode - TYPEC_STATE_MODAL) <<
 			 PMC_USB_ALTMODE_DP_MODE_SHIFT;
 
+	if (data->status & DP_STATUS_HPD_STATE)
+		req.mode_data |= PMC_USB_DP_HPD_LVL <<
+				 PMC_USB_ALTMODE_DP_MODE_SHIFT;
+
 	return pmc_usb_command(port, (void *)&req, sizeof(req));
 }
 
-- 
2.26.2.303.gf8c07b1a785-goog

