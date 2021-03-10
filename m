Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 755B7334BA2
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 23:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbhCJWfy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 17:35:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbhCJWfm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Mar 2021 17:35:42 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97923C061760
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 14:35:42 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id y7so23034594ybh.20
        for <linux-usb@vger.kernel.org>; Wed, 10 Mar 2021 14:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=jKCctkp41npEmYGaMid+GoHQ1jboW5jXBjadu8S78Eg=;
        b=LNGAhwSaw+X7d35VBWAjBBhYgWQxaoIreiUusF3wljDUXwaQSD3Kdh2rOH6ugzGF1E
         2N5Lfbn2T4/c+IZP00FN0s1qE/6royVKd9Qdad8D8sUgaI9xO6zjtqwK3/2Uvk132Fa6
         7qBjUIRMUiTbzSAx66IAmEWwuPrQe8gAdeu8F6n1MiIU4LrqioS1vebuBPcK0fj6RS3y
         NUnvBa9VgJa1lEVFD3LyDBWOTRVcUh2fUyhAnfSfVEu2rMu+0iurdu/QMK83xiibq78H
         G26419f/Snj4St0ElyzYbG6VYnkyo6MkTLdG/mD6ZIYNqoQ/rePRQdavVqENgthCzKp+
         HJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=jKCctkp41npEmYGaMid+GoHQ1jboW5jXBjadu8S78Eg=;
        b=nGCUNxGTX/OrgcALnYB4P+tjbTcXSHipCKgv8pKR5sVeJI6QwINSUCgGUV1qMFuQbR
         lvtUOA/y34wiwiJyV2NzLI6ZhFC5yOf/gBtje3IDjbkP7HiyEL8HTpR2BXkC63VjEYV1
         sblA6AKD3FC0Yya9V7MUpH7s3KHrnFfAeqFefqNnEcm4Kacj0FXFKvRyBaw8GshZhiz9
         0lzEA7N4eKHtGcj5cfCg+pZf+aqoYHvafkTzNZEzI5CSFqBGmw1SLKBYnSgG2US5NUMX
         qmiBebmQZgAJmrbvfiJxUJL6yuc7Xeacpzo7nLvEjjPaPWJO/zL06dqCESox1wv+q3Xj
         sKWQ==
X-Gm-Message-State: AOAM532gVzy2+loQuThwdITeDNr2i69YTlbJQ77VUNVUVLgM4AiC3cJ3
        jqZnFd/2Gu+F1btMKB1QmtKbr2ackbc=
X-Google-Smtp-Source: ABdhPJyQ7u+fzmbXi6rfMy5j8lYrt73ZjOUT0h2uqvs591Ag0EQiSa4ISiokH8Sa5djFnlC8GlEoFqJip/Y=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:2879:299f:c377:83c9])
 (user=badhri job=sendgmr) by 2002:a25:d1ca:: with SMTP id i193mr5335984ybg.355.1615415741693;
 Wed, 10 Mar 2021 14:35:41 -0800 (PST)
Date:   Wed, 10 Mar 2021 14:35:36 -0800
Message-Id: <20210310223536.3471243-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.rc1.246.gcd05c9c855-goog
Subject: [PATCH v1] usb: typec: tcpci: Refactor tcpc_presenting_cc1_rd macro
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kyle Tso <kyletso@google.com>, stable@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Defining one macro instead of two for tcpc_presenting_*_rd.
This is a follow up of the comment left by Heikki Krogerus.

https://patchwork.kernel.org/project/linux-usb/patch/
20210304070931.1947316-1-badhri@google.com/

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 027afd7dfdce..25b480752266 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -24,14 +24,10 @@
 #define	AUTO_DISCHARGE_PD_HEADROOM_MV		850
 #define	AUTO_DISCHARGE_PPS_HEADROOM_MV		1250
 
-#define tcpc_presenting_cc1_rd(reg) \
+#define tcpc_presenting_rd(reg, cc) \
 	(!(TCPC_ROLE_CTRL_DRP & (reg)) && \
-	 (((reg) & (TCPC_ROLE_CTRL_CC1_MASK << TCPC_ROLE_CTRL_CC1_SHIFT)) == \
-	  (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC1_SHIFT)))
-#define tcpc_presenting_cc2_rd(reg) \
-	(!(TCPC_ROLE_CTRL_DRP & (reg)) && \
-	 (((reg) & (TCPC_ROLE_CTRL_CC2_MASK << TCPC_ROLE_CTRL_CC2_SHIFT)) == \
-	  (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_CC2_SHIFT)))
+	 (((reg) & (TCPC_ROLE_CTRL_## cc ##_MASK << TCPC_ROLE_CTRL_## cc ##_SHIFT)) == \
+	  (TCPC_ROLE_CTRL_CC_RD << TCPC_ROLE_CTRL_## cc ##_SHIFT)))
 
 struct tcpci {
 	struct device *dev;
@@ -201,11 +197,11 @@ static int tcpci_get_cc(struct tcpc_dev *tcpc,
 	*cc1 = tcpci_to_typec_cc((reg >> TCPC_CC_STATUS_CC1_SHIFT) &
 				 TCPC_CC_STATUS_CC1_MASK,
 				 reg & TCPC_CC_STATUS_TERM ||
-				 tcpc_presenting_cc1_rd(role_control));
+				 tcpc_presenting_rd(role_control, CC1));
 	*cc2 = tcpci_to_typec_cc((reg >> TCPC_CC_STATUS_CC2_SHIFT) &
 				 TCPC_CC_STATUS_CC2_MASK,
 				 reg & TCPC_CC_STATUS_TERM ||
-				 tcpc_presenting_cc2_rd(role_control));
+				 tcpc_presenting_rd(role_control, CC2));
 
 	return 0;
 }
-- 
2.31.0.rc1.246.gcd05c9c855-goog

