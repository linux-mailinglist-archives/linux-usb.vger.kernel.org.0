Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FF33A9577
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 11:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhFPJDS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Jun 2021 05:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbhFPJDR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Jun 2021 05:03:17 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95640C061574
        for <linux-usb@vger.kernel.org>; Wed, 16 Jun 2021 02:01:11 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id e78-20020a25d3510000b029054f20395eddso1547218ybf.13
        for <linux-usb@vger.kernel.org>; Wed, 16 Jun 2021 02:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3M0UKlv9SOpLXUL9qCPgM2BG4Do5o9apkVkW/TG2GZY=;
        b=XUUaWCKmiuW4vDogg4QoHBx8qvu2ygQ5gyuUydllq4h5NX0BZFN3ZgFb/opCPL9Haq
         JWmayPho/GZFgz9Da110xPx/UXrlBT/2W80DWm3Lb8pmJ0ODrvmwwwRmPVEF/2XuLb+E
         sJImWCIX0ilq5YpZFF1sRelBfRbtaOlp30NwzxS1BwxWOazp3oZGGxBKJR8F+/rrv6dy
         2bsAvAVWCAXPDokwd7GHCN+4rRJLH4qOMXEan6oF8RrxSaTv0wm7OimbmFCtvHHvTWxY
         9oEAshM/jUwG3Mfi4n7EluXJhOXsl4KY7JAIsTfypH9Et8TubFZwwLGdxGGKCcQPk0JR
         YNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3M0UKlv9SOpLXUL9qCPgM2BG4Do5o9apkVkW/TG2GZY=;
        b=EYxu1a0Utu22MHyn2ZNltqK5rMYIUWmfob6Thpj8yxKhHxgIOwGTQ+0z+Hrmzn/Rmz
         t4PpMIcM0Q6h4WF1Sy+oj5FIpDiGD+HdhiGFfMKbPzXYTcmq4sqY+FowDM3zF6jm4mnu
         MrVfbK424kEmNwo+kd5+bE8JK6JUTBS9s5n7C5GtN8lmA9nfbn6pgrgZ1t1SW7Z+i3x3
         tu+E2UDVm+8FrI1dCn8nRo2p8seXkEXZQ1YTw20kG11uN26J3TVotaO+MRrLxgdpZoFr
         wkjHe3NkLX5j6/cFIroJNA14/olFG5yC5Pu+8x7Rm3MRVZ0QTLzNP0iW1VCwuPl21Dgi
         SPvA==
X-Gm-Message-State: AOAM532XszBIY96cAk44fqcFTHV4xu0gFpKa4Ry559Ed659yQAnPpJQy
        Ue+OUbtWSDV7J8FTVDKGVhOvzUml/9Zw
X-Google-Smtp-Source: ABdhPJwng0J1nrvO5rVrzAydm5TO3Oi6kIALs3pguNbRP6QqiQuA2oZhFG6nu3vAmNLpZ4Br5VgOMwi/Ic6Q
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:490b:5c68:72a5:d6d7])
 (user=kyletso job=sendgmr) by 2002:a25:9bc4:: with SMTP id
 w4mr4516910ybo.168.1623834067902; Wed, 16 Jun 2021 02:01:07 -0700 (PDT)
Date:   Wed, 16 Jun 2021 17:01:02 +0800
Message-Id: <20210616090102.1897674-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH v3] usb: typec: tcpm: Relax disconnect threshold during power negotiation
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the voltage is being decreased in power negotiation, the Source will
set the power supply to operate at the new voltage level before sending
PS_RDY. Relax the threshold before sending Request Message so that it
will not race with Source which begins to adjust the voltage right after
it sends Accept Message (PPS) or tSrcTransition (25~35ms) after it sends
Accept Message (non-PPS).

The real threshold will be set after Sink receives PS_RDY Message.

Fixes: f321a02caebd ("usb: typec: tcpm: Implement enabling Auto Discharge disconnect support")
Cc: Badhri Jagan Sridharan <badhri@google.com>
Signed-off-by: Kyle Tso <kyletso@google.com>
---
Changes in v3:
- move the timing of setting threshold for Fixed RDO as I did for PPS in
  v2, i.e. move it to tcpm_pd_send_request.
- add Cc: tag for Badhri
- update the commit message for the above changes

Changes in v2:
- move the timing of setting threshold up to "before sending Request"
  for PPS power negotiation so that it won't race with the Source.
- PPS: if it fails to send the Request, fallback to previous threshold
- PPS: if the Source doesn't respond Accept, fallback to previous
  threshold
- update the commit message for above changes

 drivers/usb/typec/tcpm/tcpm.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 197556038ba4..b1d310ab84c4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2604,6 +2604,11 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 			} else {
 				next_state = SNK_WAIT_CAPABILITIES;
 			}
+
+			/* Threshold was relaxed before sending Request. Restore it back. */
+			tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_PD,
+							       port->pps_data.active,
+							       port->supply_voltage);
 			tcpm_set_state(port, next_state, 0);
 			break;
 		case SNK_NEGOTIATE_PPS_CAPABILITIES:
@@ -2617,6 +2622,11 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 			    port->send_discover)
 				port->vdm_sm_running = true;
 
+			/* Threshold was relaxed before sending Request. Restore it back. */
+			tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_PD,
+							       port->pps_data.active,
+							       port->supply_voltage);
+
 			tcpm_set_state(port, SNK_READY, 0);
 			break;
 		case DR_SWAP_SEND:
@@ -3336,6 +3346,12 @@ static int tcpm_pd_send_request(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
+	/*
+	 * Relax the threshold as voltage will be adjusted after Accept Message plus tSrcTransition.
+	 * It is safer to modify the threshold here.
+	 */
+	tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, 0);
+
 	memset(&msg, 0, sizeof(msg));
 	msg.header = PD_HEADER_LE(PD_DATA_REQUEST,
 				  port->pwr_role,
@@ -3433,6 +3449,9 @@ static int tcpm_pd_send_pps_request(struct tcpm_port *port)
 	if (ret < 0)
 		return ret;
 
+	/* Relax the threshold as voltage will be adjusted right after Accept Message. */
+	tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_USB, false, 0);
+
 	memset(&msg, 0, sizeof(msg));
 	msg.header = PD_HEADER_LE(PD_DATA_REQUEST,
 				  port->pwr_role,
@@ -4196,6 +4215,10 @@ static void run_state_machine(struct tcpm_port *port)
 		port->hard_reset_count = 0;
 		ret = tcpm_pd_send_request(port);
 		if (ret < 0) {
+			/* Restore back to the original state */
+			tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_PD,
+							       port->pps_data.active,
+							       port->supply_voltage);
 			/* Let the Source send capabilities again. */
 			tcpm_set_state(port, SNK_WAIT_CAPABILITIES, 0);
 		} else {
@@ -4206,6 +4229,10 @@ static void run_state_machine(struct tcpm_port *port)
 	case SNK_NEGOTIATE_PPS_CAPABILITIES:
 		ret = tcpm_pd_send_pps_request(port);
 		if (ret < 0) {
+			/* Restore back to the original state */
+			tcpm_set_auto_vbus_discharge_threshold(port, TYPEC_PWR_MODE_PD,
+							       port->pps_data.active,
+							       port->supply_voltage);
 			port->pps_status = ret;
 			/*
 			 * If this was called due to updates to sink
-- 
2.32.0.272.g935e593368-goog

