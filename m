Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBF624230F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Aug 2020 02:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHLAOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 20:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgHLAOn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 20:14:43 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AE4C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 17:14:43 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id n5so291069qvx.2
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 17:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hGJKteDFRvmAoB5QUn3ibeow19jlpU6dAFKbgXDL7Hg=;
        b=UJnDj1cP10bDZGsYcpJD/D9ftl4SJoVSzjN5Rctm40imEG+y111Ag8D0wRybxWR973
         MntcgYeJ2sM2a674k2a/GxwlPdbPGmmq7R4cFFoZhecnEtgydi6t1TzZpGUkmZUQp2vv
         aemYzVyjV3BEWIEPsuTadfo92pC0+jGRz/yrf255x2xXSjAiSoLK54k4sh/f7sgYnf3K
         gIJC/a7iwK+3WamIFqnFsqAAQ7wZXJNWS8EChXspXoaALq9J4OFCEZxgO1wjS/3G7X9a
         tnAPZvVseoBoLKPrv+LphFfiqBgYUt2fD+K4DFilcsgwfS+TepVUQ8Wo3tNRFa1i3kXI
         rX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hGJKteDFRvmAoB5QUn3ibeow19jlpU6dAFKbgXDL7Hg=;
        b=mDbOcOTcB1Xea/wojYKI7PwlEUcMaH0qeKmsYBpqsP6LQXoKn9zHeYBT9cr+qdFpfW
         56/lSJLYTvN0CgZEf3P50vuniJ6Mz5IzGNcd1aXKkJoHlkQyCd+DdR3/aMoY5doLrsHg
         GpQm5iiiUd6/0PkKBtVW7G9VFYB5N+6nYsLOTmcnUXFaBdTpd86wZVFIyZYqnt5/TN+w
         Ve3pE91GntM0i/as2KvsZZ3wcPmg9weSsZpxWzcmZxMuzoY66GO98ACi+HhZwU26kMl7
         ewTClXAI6KakZQbtZLb8dZj+Rj+NAwJYKk9vA2whGAq60LpuWugaQI/hLrd70oPkil/z
         oSig==
X-Gm-Message-State: AOAM533eh1pjCDuTX0TwS4L7Jicnv1rFkE30CiUXAJA/RHUpfSCsZrVn
        2lkaIAaNXzPAnv4Su2/UnRlxgkvZgu8=
X-Google-Smtp-Source: ABdhPJxKTXpolq6+IqC9ZDR48trH3huTbcnQfxPTsEi34Hb9n6iiXfgtn2elXy46WPCPliLwpOT7384PdFk=
X-Received: by 2002:ad4:46ad:: with SMTP id br13mr4141980qvb.234.1597191282436;
 Tue, 11 Aug 2020 17:14:42 -0700 (PDT)
Date:   Tue, 11 Aug 2020 17:14:39 -0700
Message-Id: <20200812001439.545655-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.236.gb10cc79966-goog
Subject: [PATCH v2] tcpm: During PR_SWAP, source caps should be sent only
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
Changes since V1:
- Comment on the permissible values of tSwapSourceStart
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
index b6c233e79bd4..ed5eed73ccf8 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -473,6 +473,7 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define PD_T_ERROR_RECOVERY	100	/* minimum 25 is insufficient */
 #define PD_T_SRCSWAPSTDBY      625     /* Maximum of 650ms */
 #define PD_T_NEWSRC            250     /* Maximum of 275ms */
+#define PD_T_SWAP_SRC_START	20     /* Minimum of 20ms */
 
 #define PD_T_DRP_TRY		100	/* 75 - 150 ms */
 #define PD_T_DRP_TRYWAIT	600	/* 400 - 800 ms */
-- 
2.28.0.236.gb10cc79966-goog

