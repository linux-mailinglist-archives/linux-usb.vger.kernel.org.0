Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1182C966F
	for <lists+linux-usb@lfdr.de>; Tue,  1 Dec 2020 05:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgLAEXd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 23:23:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728222AbgLAEXc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 23:23:32 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7A8C0613D6
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 20:22:46 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id j138so843098ybg.20
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 20:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=bC8qMXf4pH6iBEVDPsaERolWnb2dJIL28RYsjRFL4/A=;
        b=OuGsA4bIHE5xZZ1z4RzofmK9egUx94o1mLQ5bpMdfkbNE7xKreyWzJk6j/9Mj5xbZb
         YWaNjZ1grDkIt9Wc8qZm3g3Veaten0YwFjrX53TnFUDOLlhtqKwBOgb5srL/VgyezwS0
         yh0H8NainQEcPowFXaiRD8SuXt4NQ82chBrewgQQzUya65WJrzge2sRniYZ6v+HyddOU
         vhVIz4Bezo5nSSOQlLi1Sy9NmBd642kqT3oOFbAHqHRBD1HoCDZLWEh+Hs1QGX/mKvxJ
         Dg5m9nYE59rmtVt1jZ1arK6gaPNFtD9gjNdFwNO+6evjZD6ugklTH/1HbCy0wtxhlbGK
         TjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bC8qMXf4pH6iBEVDPsaERolWnb2dJIL28RYsjRFL4/A=;
        b=V1T/DzMPskcJLzKqTDf0lCyVSmhEi3VCg+8tYVqOUXkwxWEjdPpy74tcds2JPuNEhf
         HUTIP7BzsVPVmgt17zHBET8KPO7cpU2ltg1pGI/Y109FJsrMvGuD7nUL1JCtv1yzxpiA
         a0cf+xtS+xWq4TsiPVIuWcLtl9U55tXdFrBwU2tv7gqJIk2l4ZnjQpyAa5/Tr+sIIC6a
         +ig2TVW1PIxkt99RBRQdd6km0luttdpvl05R17ccc791C0vZsmSA4XwG2bmjSBFKCmZO
         qjJU0BHbtlhmQqphSGI0xzuNrcIwh24n7d3EFnFvMiinqLivx55vGAvtzqFZkVGZeths
         ba2w==
X-Gm-Message-State: AOAM533ZvA9dTKZqtr6hSg6sMLm83kIlGcuSyU6bdraJFoULWFiigbxQ
        eIfGEV3Hl5FMnfVTwnlmGpJYylAEhSY=
X-Google-Smtp-Source: ABdhPJxCH5ojX6Uhs9hJnvfU6H42pJRzjAhULVlA1rHh9/GgO6bdgHO05pZcIcA7YYvBWpHwJxGlpSD3PGY=
Sender: "badhri via sendgmr" <badhri@badhri.mtv.corp.google.com>
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:f292:1cff:fee0:66cf])
 (user=badhri job=sendgmr) by 2002:a25:40c5:: with SMTP id n188mr1159179yba.116.1606796566005;
 Mon, 30 Nov 2020 20:22:46 -0800 (PST)
Date:   Mon, 30 Nov 2020 20:22:36 -0800
In-Reply-To: <20201201042237.414235-1-badhri@google.com>
Message-Id: <20201201042237.414235-3-badhri@google.com>
Mime-Version: 1.0
References: <20201201042237.414235-1-badhri@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH v1 3/4] usb: typec: tcpci: Update retry count based on the
 negotiated rev
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

By default the driver sets the retry count to 3 (Default for PD 2.0).
Update this to 2, if the negotiated rev is PD 3.0.

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpci.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 12d983a75510..98a2455f779f 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -18,7 +18,8 @@
 
 #include "tcpci.h"
 
-#define	PD_RETRY_COUNT				3
+#define	PD_RETRY_COUNT_DEFAULT			3
+#define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
 #define	AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV	3500
 #define	AUTO_DISCHARGE_PD_HEADROOM_MV		850
 #define	AUTO_DISCHARGE_PPS_HEADROOM_MV		1250
@@ -447,9 +448,8 @@ static int tcpci_set_vbus(struct tcpc_dev *tcpc, bool source, bool sink)
 	return 0;
 }
 
-static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
-			     enum tcpm_transmit_type type,
-			     const struct pd_message *msg)
+static int tcpci_pd_transmit(struct tcpc_dev *tcpc, enum tcpm_transmit_type type,
+			     const struct pd_message *msg, unsigned int negotiated_rev)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	u16 header = msg ? le16_to_cpu(msg->header) : 0;
@@ -497,7 +497,9 @@ static int tcpci_pd_transmit(struct tcpc_dev *tcpc,
 		}
 	}
 
-	reg = (PD_RETRY_COUNT << TCPC_TRANSMIT_RETRY_SHIFT) | (type << TCPC_TRANSMIT_TYPE_SHIFT);
+	/* nRetryCount is 3 in PD2.0 spec where 2 in PD3.0 spec */
+	reg = ((negotiated_rev > PD_REV20 ? PD_RETRY_COUNT_3_0_OR_HIGHER : PD_RETRY_COUNT_DEFAULT)
+	       << TCPC_TRANSMIT_RETRY_SHIFT) | (type << TCPC_TRANSMIT_TYPE_SHIFT);
 	ret = regmap_write(tcpci->regmap, TCPC_TRANSMIT, reg);
 	if (ret < 0)
 		return ret;
-- 
2.29.2.454.gaff20da3a2-goog

