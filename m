Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26924762896
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 04:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjGZCJS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jul 2023 22:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjGZCJN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jul 2023 22:09:13 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83F102D45
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 19:09:10 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-563396c1299so5453296a12.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 19:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690337350; x=1690942150;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8LeyURJhAn2AzUQBzLso1xOEDBoev9e7HFXuCVjNovQ=;
        b=Hzvg48EZXi+Qn+Kn+L8rhB6LI49k7zWVxG4AdxNE6CMPZhZCYkoPltd4lay2eeSiX5
         +mJWj2FGm5pVOOLNBnwO279iAT1xkeCWdHfNz7eVsPTmj1RoGYlTm3z6I3RbB2Gv84Pn
         tnysZgJz1TVHOlHDXNH2bpHeLkwD9s5XAOy0YE1ZTJyc1VSqPOAEhEmH2uubfpaRui2u
         ErrABnuLYgi30FHIdkfaQQS06w3xWEPRZgV/aeG/GvIYV9kj6LIN7YFiOII2/AQ69MkM
         uMQHUIFSVegQdoS5rF3QPLBgO16ohLH1+aiJvHp94Wjyff3S0DA3TaQr52Rz7ebKqD8/
         hayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690337350; x=1690942150;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8LeyURJhAn2AzUQBzLso1xOEDBoev9e7HFXuCVjNovQ=;
        b=Xzdgf1inzaVm7fQ8NAmaVdZLpk5fkxNEkONc0UHjLzWkfbD/mdO+atgoWHh2hT/2bT
         kfIt1MvrSeaCslYUnG7UdPnAyGq624P2pjiPSKzh/fsQJEtoZbHJHXxlZoIsNlV9hSbH
         X5lAW+gwRSraeB6F1FzEKSdsQ0OVLX9szd4ZsJFnQy+pjsuNRX3JlQf9olvYS4yMxBty
         lX4V3tneCj4kUD5z3LTW9uyvOtpsgKUjm7AqAzXGvhjUCGKvPttSU6eUJvFxarKGUj9q
         28bHTSSUK8qYS+zvO0HZ4psUJf7s4iRXRUPOCQ8KbD6yc/u8o14bflXjfkR/bMy53MHC
         483A==
X-Gm-Message-State: ABy/qLbty7V8n2mKngrE28KdGq7hV/RSCXnyjvWq3m4A+ex3qenLVheg
        2vIO0MRzeyXjrWUZ6FrRzJayKaRyJaYRRQI=
X-Google-Smtp-Source: APBJJlGyEKOO9DWyzE41ZGfqP+2QT+1pDBaerSfzPVTbYOZqnKPITI7I9ng+JYY0Iuq5Eo2wWMVwUFbqwn6FAN0=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a17:903:32ce:b0:1b3:e4f1:1b3f with SMTP
 id i14-20020a17090332ce00b001b3e4f11b3fmr4335plr.2.1690337350022; Tue, 25 Jul
 2023 19:09:10 -0700 (PDT)
Date:   Wed, 26 Jul 2023 02:09:02 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230726020903.1409072-1-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: altmodes/displayport: Signal hpd when
 configuring pin assignment
From:   RD Babiera <rdbabiera@google.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_HEADERS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When connecting to some DisplayPort partners, the initial status update
after entering DisplayPort Alt Mode notifies that the DFP_D/UFP_D is not in
the connected state. This leads to sending a configure message that keeps
the device in USB mode. The port partner then sets DFP_D/UFP_D to the
connected state and HPD to high in the same Attention message. Currently,
the HPD signal is dropped in order to handle configuration.

This patch saves changes to the HPD signal when the device chooses to
configure during dp_altmode_status_update, and invokes sysfs_notify if
necessary for HPD after configuring.

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 66de880b28d0..cdf8261e22db 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -60,6 +60,7 @@ struct dp_altmode {
 
 	enum dp_state state;
 	bool hpd;
+	bool pending_hpd;
 
 	struct mutex lock; /* device lock */
 	struct work_struct work;
@@ -144,8 +145,13 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
 		dp->state = DP_STATE_EXIT;
 	} else if (!(con & DP_CONF_CURRENTLY(dp->data.conf))) {
 		ret = dp_altmode_configure(dp, con);
-		if (!ret)
+		if (!ret) {
 			dp->state = DP_STATE_CONFIGURE;
+			if (dp->hpd != hpd) {
+				dp->hpd = hpd;
+				dp->pending_hpd = true;
+			}
+		}
 	} else {
 		if (dp->hpd != hpd) {
 			drm_connector_oob_hotplug_event(dp->connector_fwnode);
@@ -161,6 +167,16 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 {
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "configuration");
 	sysfs_notify(&dp->alt->dev.kobj, "displayport", "pin_assignment");
+	/*
+	 * If the DFP_D/UFP_D sends a change in HPD when first notifying the
+	 * DisplayPort driver that it is connected, then we wait until
+	 * configuration is complete to signal HPD.
+	 */
+	if (dp->pending_hpd) {
+		drm_connector_oob_hotplug_event(dp->connector_fwnode);
+		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
+		dp->pending_hpd = false;
+	}
 
 	return dp_altmode_notify(dp);
 }

base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
-- 
2.41.0.487.g6d72f3e995-goog

