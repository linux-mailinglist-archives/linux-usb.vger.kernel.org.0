Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520D43DE98E
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 11:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235018AbhHCJNe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 05:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234709AbhHCJNb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Aug 2021 05:13:31 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEA7C061764
        for <linux-usb@vger.kernel.org>; Tue,  3 Aug 2021 02:13:21 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id g11-20020a25ae4b0000b02905792fb55b0bso22136613ybe.9
        for <linux-usb@vger.kernel.org>; Tue, 03 Aug 2021 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=EyxbSnCrZkW0D1s78hoRTHvz/RIPrLxVkHp3d0qMYgk=;
        b=Tip0r9HZ671jd/AbUl0qtLrYjIM8OpobmN6ubxWvSCfyGqfVj22QX+PlODtilbf1n0
         tS9OXdzgxqqXTdXvYtJUMtktil0qOkeVid1+sQnY8w2rTdIR+PvU7xBi3l31o+xQ4Pu2
         L3rJX0F4oPLugu8oRh6XDu7jc1w7261jW5FNlSdPxhS1sxsnGTSMFH4A5jywV3Wt7EUA
         KIsOUF2xY+EGNsD/gEJxs63Vcrah1/pfwYa1KpkHVri9QMsI13spa60/drhxx+r54oEB
         AEvLFKbn/NNAG1/mAwoCj0rmmeYXllnxNibL+wg3rPSh/bwzwGuF1f/y9gyrJ37VQ1Dk
         SZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=EyxbSnCrZkW0D1s78hoRTHvz/RIPrLxVkHp3d0qMYgk=;
        b=nCUTM5oSRCXczoOIt5/HB5lGuMT8uDmKNIaMjpyvny40Bcf2nthT5WfepBiELS1JSX
         /Zq2oFAt7UTceFyDcavSKrFhDc1duAINL4WdnNLKBfyU3mgU8Je+fkCA9fHJmI9HMFvc
         +aNualYyQjJ5Vtzcf2Ja7fuoFVazH2rxcr+mDF2H2QcchOSM0VPIemd+Fa4w+yPCHR2E
         +yM6tONEOv5PxPOhlGOhRqpY9ysrNfjZSVU3kbyddIjNMkKsnZsx1791GxyV1Iq72ENV
         uiaJKgaaBUjBRWF61bHYpm598cAhFh/30kIz0S8iO0cnyaJVtdcbZ1MY5LwPO3omD4Hv
         T+gA==
X-Gm-Message-State: AOAM531rVWxRi/nuwRfDt18u8Z70K5hWsDeMV9ObJQxHIcO8HzP+D8si
        njGFNx5Ub/OopU6mBG1f7g3FVTrIqgp0
X-Google-Smtp-Source: ABdhPJyhMAsZAhTtNcT8YEFz6by+CTq1x8B6Q2rumYtSxq9s5GjGUf7228/L1NrdbR4kuIl4GvvZ8fQzSioz
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:2c1f:318f:d55f:e51b])
 (user=kyletso job=sendgmr) by 2002:a5b:58e:: with SMTP id l14mr27198466ybp.143.1627982000390;
 Tue, 03 Aug 2021 02:13:20 -0700 (PDT)
Date:   Tue,  3 Aug 2021 17:13:14 +0800
Message-Id: <20210803091314.3051302-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
Subject: [PATCH] usb: typec: tcpm: Keep other events when receiving FRS and
 Sourcing_vbus events
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When receiving FRS and Sourcing_Vbus events from low-level drivers, keep
other events which come a bit earlier so that they will not be ignored
in the event handler.

Fixes: 8dc4bd073663 ("usb: typec: tcpm: Add support for Sink Fast Role SWAP(FRS)")
Cc: Badhri Jagan Sridharan <badhri@google.com>
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5b22a1c931a9..b9bb63d749ec 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5369,7 +5369,7 @@ EXPORT_SYMBOL_GPL(tcpm_pd_hard_reset);
 void tcpm_sink_frs(struct tcpm_port *port)
 {
 	spin_lock(&port->pd_event_lock);
-	port->pd_events = TCPM_FRS_EVENT;
+	port->pd_events |= TCPM_FRS_EVENT;
 	spin_unlock(&port->pd_event_lock);
 	kthread_queue_work(port->wq, &port->event_work);
 }
@@ -5378,7 +5378,7 @@ EXPORT_SYMBOL_GPL(tcpm_sink_frs);
 void tcpm_sourcing_vbus(struct tcpm_port *port)
 {
 	spin_lock(&port->pd_event_lock);
-	port->pd_events = TCPM_SOURCING_VBUS;
+	port->pd_events |= TCPM_SOURCING_VBUS;
 	spin_unlock(&port->pd_event_lock);
 	kthread_queue_work(port->wq, &port->event_work);
 }
-- 
2.32.0.554.ge1b32706d8-goog

