Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745F22A8C15
	for <lists+linux-usb@lfdr.de>; Fri,  6 Nov 2020 02:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732782AbgKFB2n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Nov 2020 20:28:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732701AbgKFB2n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Nov 2020 20:28:43 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83627C0613CF
        for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2020 17:28:43 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id o129so2841146pfb.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2020 17:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GKXVsKVnKD7fqfNWGDcS/zXjw44CADDVmHlExUpnMvQ=;
        b=BIFQ/MX5LV63TUUN5zq2ge6nSCXPSUEYTi50u0uHH+8uqA9CZTKiUsKudeh7yhSBg+
         dzagMO1T73RXVVcAS17NqPlKgGfvY17LtVyY5q3neIoEmUvWChTBNEbe4myyRaQjWPe6
         jujZOKR497rZTsIzsAh1nokXXTzuc5SGMjkaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GKXVsKVnKD7fqfNWGDcS/zXjw44CADDVmHlExUpnMvQ=;
        b=JZ3iwotu2sHq+BfcGoxV+ZLu4JDr0hMTWhhG6kNFkFPD4SDHgf2QzqoDUE006FzTi7
         ppByXfRaQFQ1KFZcv/sSvgOsjkwa8scFrzn/g+dTI9PJqjn7PMG0aj4Pyq2QUp20EyGC
         ZrIsY+iY3ustjZtJwd8xD/Jj6UjVmDMdhiggW9ZrVkx4uFxCTCnRcdFbfisu4efP5kxv
         urFBI9Z1H5nyxnCnfZETD6M8u86i8gBQaOKoiaGjhLaH06hMUV2FN5Oal4S+0oQ9xVIp
         yAwXqrZyMWML+6DH2wvkwUOZ8MrtzryA1e8Won18cZHkcjXRPIomplsEbuBVjLpZ9hEY
         2jGA==
X-Gm-Message-State: AOAM530zuyNwigFGvTa8SS1DGs3UvXmtn0hX+NR3H9+aniODeTTxa8ut
        0Syq7+Av2MU0xrLFuqWablJy7A==
X-Google-Smtp-Source: ABdhPJyJRifPxAumyV2XSUvYywaOBU4JVPwpJ89jNBfZYFANicmmku18h9usUQNW8Kvk//BBmFKYVg==
X-Received: by 2002:a17:90a:3e09:: with SMTP id j9mr5481822pjc.192.1604626123078;
        Thu, 05 Nov 2020 17:28:43 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id e2sm3567887pgd.27.2020.11.05.17.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 17:28:42 -0800 (PST)
From:   Prashant Malani <pmalani@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, dzigterman@chromium.org,
        alevkoy@chromium.org, Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        linux-usb@vger.kernel.org (open list:USB SUBSYSTEM)
Subject: [PATCH 2/6] platform/chrome: cros_ec_typec: Factor out PD identity parsing
Date:   Thu,  5 Nov 2020 17:27:55 -0800
Message-Id: <20201106012758.525472-3-pmalani@chromium.org>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201106012758.525472-1-pmalani@chromium.org>
References: <20201106012758.525472-1-pmalani@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Factor out the PD identity parsing code into a separate function. This
way it can be re-used for Cable PD identity parsing in future patches.

No functional changes are introduced by this patch.

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 35 ++++++++++++++++---------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 801c3d2c1fbd..f6d3c37c2c27 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -657,6 +657,28 @@ static int cros_typec_register_altmodes(struct cros_typec_data *typec, int port_
 	return ret;
 }
 
+/*
+ * Parse the PD identity data from the EC PD discovery responses and copy that to the supplied
+ * PD identity struct.
+ */
+static void cros_typec_parse_pd_identity(struct usb_pd_identity *id,
+					 struct ec_response_typec_discovery *disc)
+{
+	int i;
+
+	/* First, update the PD identity VDOs for the partner. */
+	if (disc->identity_count > 0)
+		id->id_header = disc->discovery_vdo[0];
+	if (disc->identity_count > 1)
+		id->cert_stat = disc->discovery_vdo[1];
+	if (disc->identity_count > 2)
+		id->product = disc->discovery_vdo[2];
+
+	/* Copy the remaining identity VDOs till a maximum of 6. */
+	for (i = 3; i < disc->identity_count && i < VDO_MAX_OBJECTS; i++)
+		id->vdo[i - 3] = disc->discovery_vdo[i];
+}
+
 static int cros_typec_handle_sop_disc(struct cros_typec_data *typec, int port_num)
 {
 	struct cros_typec_port *port = typec->ports[port_num];
@@ -666,7 +688,6 @@ static int cros_typec_handle_sop_disc(struct cros_typec_data *typec, int port_nu
 		.partner_type = TYPEC_PARTNER_SOP,
 	};
 	int ret = 0;
-	int i;
 
 	if (!port->partner) {
 		dev_err(typec->dev,
@@ -684,17 +705,7 @@ static int cros_typec_handle_sop_disc(struct cros_typec_data *typec, int port_nu
 		goto disc_exit;
 	}
 
-	/* First, update the PD identity VDOs for the partner. */
-	if (sop_disc->identity_count > 0)
-		port->p_identity.id_header = sop_disc->discovery_vdo[0];
-	if (sop_disc->identity_count > 1)
-		port->p_identity.cert_stat = sop_disc->discovery_vdo[1];
-	if (sop_disc->identity_count > 2)
-		port->p_identity.product = sop_disc->discovery_vdo[2];
-
-	/* Copy the remaining identity VDOs till a maximum of 6. */
-	for (i = 3; i < sop_disc->identity_count && i < VDO_MAX_OBJECTS; i++)
-		port->p_identity.vdo[i - 3] = sop_disc->discovery_vdo[i];
+	cros_typec_parse_pd_identity(&port->p_identity, sop_disc);
 
 	ret = typec_partner_set_identity(port->partner);
 	if (ret < 0) {
-- 
2.29.1.341.ge80a0c044ae-goog

