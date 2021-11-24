Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E3445D027
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 23:40:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345798AbhKXWnx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 17:43:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345698AbhKXWnx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 17:43:53 -0500
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F38CAC061746
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 14:40:42 -0800 (PST)
Received: by mail-pl1-x64a.google.com with SMTP id h8-20020a170902f54800b001454402c33dso88830plf.5
        for <linux-usb@vger.kernel.org>; Wed, 24 Nov 2021 14:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=rbJ9JO3IuNN6r3UIfB5u88Bz2IUK6aXonS1RTuRnAxM=;
        b=DPNV8qDJ1EE0FeYK7irTV3MIdUWT3kaFlvTvXfmqq0eLDPdBfeQDaMsNvrM+4+LC+n
         Gi5qCDDkEnKqDpB4+YpoNMHSBbMKEEPeXOVNHMwbmcypCPowNj61m2aCibmhLqalqOcL
         tNtHS2yrvfprijNWNZh5q/vUkI2+GXK3TN06Y4vbij8FOq4xKgsWs1DPIrpLADeoA+cC
         +gcGweO1m57DVK/LOR4o+qGpBjKlfpT733uPdXjyHeIiU507vuFtYS6A6MCnr3llUqCO
         lJN9mg7D6tKoxR1+b3X4aBHH77B2uEHDnXqpqYfZ02rSElCKAzBWUTlkpbgBaFzuZNR3
         WRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=rbJ9JO3IuNN6r3UIfB5u88Bz2IUK6aXonS1RTuRnAxM=;
        b=wScuF4SnfIx7oj9Xi2wWTHeREFeMAVClOjCd4WvoNewix70kp4T7bHYU7e5/jCv0Vt
         PZzaMScP1emRTlOx/tJb3N3nmzodhax9tJRhaaSGyafV+yFJyoSz+zGvyZZ/XhZZ3x8C
         qCfRykwL+DN5o7bn0N5t6Qjz8ALpPMqQqwJes7M0tj4Jl4hWXPJCe25zp8rbmXoKcf52
         cpkBmkWZQo8anm7w8EgHNQ8ImOEX7E8/BTto/J+I4F8NRb2LYUun7QosxG+YaAmY4qFk
         7xVDOx+LdVozB8SGrWi/+dYRNGOq9cD1KzM9IxjqxZurZ0jkP1EPICYK0rI/mhDoPsdE
         OI9Q==
X-Gm-Message-State: AOAM531Hzg1f7vDAq7t4EEooH2tjWU5n8WR2aS0ePZqqGpE6uzDOJnHU
        pP9liw3a3drqnuk6zVwNgLHvsq0oKo0=
X-Google-Smtp-Source: ABdhPJwQjuN1Ii/V1y0uJ0mrubcan8tzthwSuRjHOasm3tRxdaoO5Qn+J0Jc8/G843jmWlq5GR1C8dpoyZM=
X-Received: from badhri.mtv.corp.google.com ([2620:15c:211:201:a4ad:5772:64a6:6abd])
 (user=badhri job=sendgmr) by 2002:a17:90a:1913:: with SMTP id
 19mr767222pjg.174.1637793642259; Wed, 24 Nov 2021 14:40:42 -0800 (PST)
Date:   Wed, 24 Nov 2021 14:40:36 -0800
Message-Id: <20211124224036.734679-1-badhri@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v1] usb: typec: tcpm: Wait in SNK_DEBOUNCED until disconnect
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

Stub from the spec:
"4.5.2.2.4.2 Exiting from AttachWait.SNK State
A Sink shall transition to Unattached.SNK when the state of both
the CC1 and CC2 pins is SNK.Open for at least tPDDebounce.
A DRP shall transition to Unattached.SRC when the state of both
the CC1 and CC2 pins is SNK.Open for at least tPDDebounce."

This change makes TCPM to wait in SNK_DEBOUNCED state until
CC1 and CC2 pins is SNK.Open for at least tPDDebounce. Previously,
TCPM resets the port if vbus is not present in PD_T_PS_SOURCE_ON.
This causes TCPM to loop continuously when connected to a
faulty power source that does not present vbus. Waiting in
SNK_DEBOUNCED also ensures that TCPM is adherant to
"4.5.2.2.4.2 Exiting from AttachWait.SNK State" requirements.

[ 6169.280751] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
[ 6169.280759] state change TOGGLING -> SNK_ATTACH_WAIT [rev2 NONE_AMS]
[ 6169.280771] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev2 NONE_AMS]
[ 6169.282427] CC1: 0 -> 0, CC2: 5 -> 5 [state SNK_ATTACH_WAIT, polarity 0, connected]
[ 6169.450825] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
[ 6169.450834] pending state change SNK_DEBOUNCED -> PORT_RESET @ 480 ms [rev2 NONE_AMS]
[ 6169.930892] state change SNK_DEBOUNCED -> PORT_RESET [delayed 480 ms]
[ 6169.931296] disable vbus discharge ret:0
[ 6169.931301] Setting usb_comm capable false
[ 6169.932783] Setting voltage/current limit 0 mV 0 mA
[ 6169.932802] polarity 0
[ 6169.933706] Requesting mux state 0, usb-role 0, orientation 0
[ 6169.936689] cc:=0
[ 6169.936812] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev2 NONE_AMS]
[ 6169.937157] CC1: 0 -> 0, CC2: 5 -> 0 [state PORT_RESET, polarity 0, disconnected]
[ 6170.036880] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
[ 6170.036890] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev2 NONE_AMS]
[ 6170.036896] Start toggling
[ 6170.041412] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
[ 6170.042973] CC1: 0 -> 0, CC2: 0 -> 5 [state TOGGLING, polarity 0, connected]
[ 6170.042976] state change TOGGLING -> SNK_ATTACH_WAIT [rev2 NONE_AMS]
[ 6170.042981] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev2 NONE_AMS]
[ 6170.213014] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
[ 6170.213019] pending state change SNK_DEBOUNCED -> PORT_RESET @ 480 ms [rev2 NONE_AMS]
[ 6170.693068] state change SNK_DEBOUNCED -> PORT_RESET [delayed 480 ms]
[ 6170.693304] disable vbus discharge ret:0
[ 6170.693308] Setting usb_comm capable false
[ 6170.695193] Setting voltage/current limit 0 mV 0 mA
[ 6170.695210] polarity 0
[ 6170.695990] Requesting mux state 0, usb-role 0, orientation 0
[ 6170.701896] cc:=0
[ 6170.702181] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev2 NONE_AMS]
[ 6170.703343] CC1: 0 -> 0, CC2: 5 -> 0 [state PORT_RESET, polarity 0, disconnected]

Fixes: f0690a25a140b8 ("staging: typec: USB Type-C Port Manager (tcpm)")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 7f2f3ff1b391..6010b9901126 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4110,11 +4110,7 @@ static void run_state_machine(struct tcpm_port *port)
 				       tcpm_try_src(port) ? SRC_TRY
 							  : SNK_ATTACHED,
 				       0);
-		else
-			/* Wait for VBUS, but not forever */
-			tcpm_set_state(port, PORT_RESET, PD_T_PS_SOURCE_ON);
 		break;
-
 	case SRC_TRY:
 		port->try_src_count++;
 		tcpm_set_cc(port, tcpm_rp_cc(port));
-- 
2.34.0.rc2.393.gf8c9666880-goog

