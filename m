Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC382422FD
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 02:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHLAJF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 20:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbgHLAJE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 20:09:04 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B075C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 17:09:04 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id e30so497617pfj.0
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 17:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=ZpqanX1uekkaNMZ08yYFYDvc0CW2tgz+aClfGg1TO1g=;
        b=D8glpmb5WqJz7ppDPauIiHX6IcmeWzaqOufV1M73cok0q632O2khgu2afnO+tDpuKI
         YnRmw4Q3IxOKQNkRoy99lB8vIL3ciQj7ygU8jmEsiper0TzL4eHrK+a/ywAmhGPgUdf1
         aAoMU5nbhCCgf9hAPNk8dNTQKf6bbnUf4UNEJJVxAK8KrK1Cs16pbwhnkIfTipfExPXZ
         UYiB2prYhq6Tz6X9h5QnkRjpCxDGIyHzMzCk4GyRppltjHedFla51yaa3Dg9Rzo66zCP
         y67nw+WrWxTExSFmHgtGu/uE7jnDIwuRKqJRcpWoLLIGLccEmssdKzQTToPMgII8usiz
         lHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=ZpqanX1uekkaNMZ08yYFYDvc0CW2tgz+aClfGg1TO1g=;
        b=QYK/Zw4xZ7KLYFcfT2QZqrijvdb/CpXCLQpA6m+mchBhqj5sAMjt1Or6jNK1gBhq/K
         ewpzol43OMpZkpWss2tgsjoSXYiq6tTXIMgomw2x4ECpx3H8osNLOmV6byZyBYXzysp+
         bNl+S1uWw2iSeyBYKWMcZM8N+XTkBMjq2/cySVVrDEPk05dnLdg4P6CFGMWDgw2mG6GX
         +R/eejqsmDfkqCTT8ju7sGGnw/rYaxNltxsLPy09joZGQenh9XhYffkU1Xoji27ph3uY
         VluaY62ucbJVAHki6dzO6z9J1oNDLEAs229EUWcEz32Gzosa9iALrthI0YxVo7DqigFm
         J9Ow==
X-Gm-Message-State: AOAM532D5Qpz0fzrmR4tcHBAbTjZigJcnLSOfWGKHneIOrzISk/IJpBU
        SWv3vUbmJdLdGkln8j6JVQI16K3wWzk=
X-Google-Smtp-Source: ABdhPJyAoAFNgGqRiTvKp/WURNjiv5ZkyaVdAQV0Gtf9rEJk3MICDNXW1ef5laLWh37ybsijrLOThls1zbg=
X-Received: by 2002:a17:90a:f014:: with SMTP id bt20mr365422pjb.0.1597190943694;
 Tue, 11 Aug 2020 17:09:03 -0700 (PDT)
Date:   Tue, 11 Aug 2020 17:08:59 -0700
Message-Id: <20200812000859.542332-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v1] tcpm: During PR_SWAP, source caps should be sent only
 after tSwapSourceStart
From:   Badhri Jagan Sridharan <badhri@google.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From the spec:
"6.6.8.1 SwapSourceStartTimer
The SwapSourceStartTimer Shall be used by the new Source, after a Power
Role Swap or Fast Role Swap, to ensure that it does not send
Source_Capabilities Message before the new Sink is ready to receive the
Source_Capabilities Message. The new Source Shall Not send the
Source_Capabilities Message earlier than tSwapSourceStart after the
last bit of the EOP of GoodCRC Message sent in response to the PS_RDY
Message sent by the new Source indicating that its power supply is
ready."

This fixes TD.PD.CP.E3, TD.PD.CP.E4, TD.PD.CP.E5 failures

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 +-
 include/linux/usb/pd.h        | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 3ef37202ee37..d38347bd3335 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3555,7 +3555,7 @@ static void run_state_machine(struct tcpm_port *port)
 		 */
 		tcpm_set_pwr_role(port, TYPEC_SOURCE);
 		tcpm_pd_send_control(port, PD_CTRL_PS_RDY);
-		tcpm_set_state(port, SRC_STARTUP, 0);
+		tcpm_set_state(port, SRC_STARTUP, PD_T_SWAP_SRC_START);
 		break;
 
 	case VCONN_SWAP_ACCEPT:
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index b6c233e79bd4..ea842ae862d4 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -473,6 +473,7 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_T_ERROR_RECOVERY	100	/* minimum 25 is insufficient */
 #define PD_T_SRCSWAPSTDBY      625     /* Maximum of 650ms */
 #define PD_T_NEWSRC            250     /* Maximum of 275ms */
+#define PD_T_SWAP_SRC_START	20
 
 #define PD_T_DRP_TRY		100	/* 75 - 150 ms */
 #define PD_T_DRP_TRYWAIT	600	/* 400 - 800 ms */
-- 
2.28.0.236.gb10cc79966-goog

