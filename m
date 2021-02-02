Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 841B830BB8E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 10:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhBBJ4y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 04:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbhBBJ40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 04:56:26 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C582AC0613D6
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 01:55:45 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id ba10so11434890plb.11
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 01:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=/woBNkPyfXPtz4J97ZLqnvUhpU4+65VNdf461PNMr+Y=;
        b=iuHnPKYRQFO4Ev9Hl4nSpqskb+hHDTNFd0RvDgvajNk3jf02FPwo8bdymkTGF43KJt
         NV1sN/9ASB+NipnHeGMZ1rvtwjDDsiplQYYuifOThJX7wr4RHhWSI7gKmAGvecNO6mHg
         z6mps+0aX0yeEDkIqXl/VZhLV2O1KF1D6g2q8XsEdTViK86l7LuqeJvj2MiCbpHCfQG6
         Ugn5hyGCWS8h1g7Hbk+TdbkAHq+224UX6YMqzT7hbphG9pA96Or8wV9ggIGpKpTHMnhj
         MuN7kbFb2IoSbODTaUg7yQyIw6neUm/oLw480v7uJfH82XnxTeJ3fB0B5mwqtvbdebnz
         msrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=/woBNkPyfXPtz4J97ZLqnvUhpU4+65VNdf461PNMr+Y=;
        b=Xmgh2wwvoSJF9SHjDtOKFqzjgBbrtwS6J2wCBs2Bu78e3pvGRzIIS/RDJQpeiSe4Ba
         rvnVpXld5nqCY1Ndj4TCsULmlhbHcPEvFQ3+ij3VVlq4xZ0nuLMEik91pV9iJMlm1QGU
         ExDIC6/GBULyVWOZVsKtl3BryGkcRSXlvJFis0CoVy51NGFFg9oIXdRLKmds+lFU3tFw
         xe470/jhgZGJ31ACYzaW6GJzij9nFG+8Raan+77cvHamRSCOQCs4tF3O7ZPbffII14zI
         RDe4hq3ptubyKoDNLoOR1KC90MKRqtAfAmZ+N18rEYixaQ8PKSy1NjVymGxwBaRn1Ibv
         MTTg==
X-Gm-Message-State: AOAM530nxFWhKaScOmGm5t3PvEZKCfs0IdL0CreSee8q232OsbopFuC/
        eedDHt9cH/9B3dxcIjUchn/1tX8LQKFs
X-Google-Smtp-Source: ABdhPJxJCicdafW+g5T8+94AHXI8qFLeRK6IMc+oMSzUtqK3EHOHPsRX1DgvxCCXLrveM11matXnWO85XsJ2
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a17:902:bd97:b029:de:abc4:fec7 with SMTP
 id q23-20020a170902bd97b02900deabc4fec7mr21506129pls.7.1612259745282; Tue, 02
 Feb 2021 01:55:45 -0800 (PST)
Date:   Tue,  2 Feb 2021 17:55:12 +0800
Message-Id: <20210202095512.761214-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH] usb: typec: Return void in typec_partner_set_pd_revision
From:   Kyle Tso <kyletso@google.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     bleung@chromium.org, badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

typec_partner_set_pd_revision doesn't need any return value.

Fixes: 29b01295a829 ("usb: typec: Add typec_partner_set_pd_revision")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/class.c | 10 ++--------
 include/linux/usb/typec.h |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index b6ceab3dc16b..a7d1bc83c2d4 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -755,15 +755,11 @@ EXPORT_SYMBOL_GPL(typec_partner_set_identity);
  *
  * This routine is used to report that the PD revision of the port partner has
  * become available.
- *
- * Returns 0 on success or negative error number on failure.
  */
-int typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision)
+void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision)
 {
-	int ret;
-
 	if (partner->pd_revision == pd_revision)
-		return 0;
+		return;
 
 	partner->pd_revision = pd_revision;
 	sysfs_notify(&partner->dev.kobj, NULL, "usb_power_delivery_revision");
@@ -773,8 +769,6 @@ int typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision
 			     "supports_usb_power_delivery");
 	}
 	kobject_uevent(&partner->dev.kobj, KOBJ_CHANGE);
-
-	return 0;
 }
 EXPORT_SYMBOL_GPL(typec_partner_set_pd_revision);
 
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 4946eca742d5..a94df82ab62f 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -126,7 +126,7 @@ struct typec_altmode_desc {
 	enum typec_port_data	roles;
 };
 
-int typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
+void typec_partner_set_pd_revision(struct typec_partner *partner, u16 pd_revision);
 int typec_partner_set_num_altmodes(struct typec_partner *partner, int num_altmodes);
 struct typec_altmode
 *typec_partner_register_altmode(struct typec_partner *partner,
-- 
2.30.0.365.g02bc693789-goog

