Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1483758FA
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 19:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236223AbhEFRLt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 13:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236219AbhEFRLt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 13:11:49 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B5CC061761
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 10:10:50 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id k15-20020a056902070fb02904f8633d41c4so1075364ybt.23
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 10:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bJfhWmzCEqBf7RcCkH3EB8f08paJPyJ+O6NagWukv6U=;
        b=V5yFPBFWU/ofw5k+uRKoMu4NIcr+A/WTzrYffNWRjnEwCsSrl3isnoecMrGuEavL9h
         oR3iDGlWaeDDaU1TcxETQbIiK6GxkuoAvSpJZhg4m4M1Nl3NomfiDSb/fptNAHCvr3tz
         q1mEOfMlWrpHnoYAbZ/TleegRZg71ZGv3OEJLJ9wZDkvoniw+5JEF6XCoV2OkHP+lMGo
         ayd2Hq0VWh4vo7PubK+Ok21BMBXhuGYQSQkjsYOr1t++yzOR8Zn9aR7wKuRthPtfk9Uz
         MPJT3naf+SFLWKhHXZ09gIC64tQ03gCqAR9z1B8ZYpWBve/fRe8xVldeCD9PUtr/y2q8
         OH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bJfhWmzCEqBf7RcCkH3EB8f08paJPyJ+O6NagWukv6U=;
        b=K4fEHxg0N1a6htz/qm2gbm/05JOeXJpFhbkupldLtMja+RcWSOMhcG8knui5V46YQ3
         aD01FigCEHYAHKbWFWc6J/H7aabtlAm7+Fw6fsW9KbBxqNRIM53a2OaV0TiLNKYGiYJr
         nK8khAQt8xrWPn+/U53rFbtPWOUsNXCFIF/mgGGSEp2ZZKaqt64jmvPszhxR81cntYpz
         5O71+Uj6tzmoLOu7bLSQUBbor4pqqrqQQ9kUymaQGhBbsQUto6jM/OpMr53cnyjbfYS+
         wgtNX6Onops2cLGt+YUTb8vjMqToqVJI7FiXG42677Zl9MVKFmXuo+EN9mxfofu2oz+Z
         X1XQ==
X-Gm-Message-State: AOAM533yq+5a194W/qxIsllagtzlj/XIAPsCGnrZGwQIX71cHrW4XcXr
        9oHm41mXtiupnovLMNgy7Bf+gvm3VWXa
X-Google-Smtp-Source: ABdhPJwqcl2r+9STr96Pm6e9fSrlA9NZNqIU8pZCFUDTOsJbg4lXVx3E85jZh5f9FxVQ89q55YK4WhKQn/Ns
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:9a5c:8de0:4c79:ba52])
 (user=kyletso job=sendgmr) by 2002:a25:99c1:: with SMTP id
 q1mr6973855ybo.517.1620321050053; Thu, 06 May 2021 10:10:50 -0700 (PDT)
Date:   Fri,  7 May 2021 01:10:26 +0800
In-Reply-To: <20210506171026.1736828-1-kyletso@google.com>
Message-Id: <20210506171026.1736828-3-kyletso@google.com>
Mime-Version: 1.0
References: <20210506171026.1736828-1-kyletso@google.com>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
Subject: [PATCH v2 2/2] usb: typec: tcpm: Fix wrong handling for Not_Supported
 in VDM AMS
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Not_Supported Message is acceptable in VDM AMS. Redirect the VDM state
machine to VDM_STATE_DONE when receiving Not_Supported and finish the
VDM AMS.

Also, after the loop in vdm_state_machine_work, add more conditions of
VDM states to clear the vdm_sm_running flag because those are all
stopping states when leaving the loop.

In addition, finish the VDM AMS if the port partner responds BUSY.

Fixes: 8dea75e11380 ("usb: typec: tcpm: Protocol Error handling")
Fixes: 8d3a0578ad1a ("usb: typec: tcpm: Respond Wait if VDM state machine is running")
Signed-off-by: Kyle Tso <kyletso@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 07a449f0e8fa..bf97db232f09 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1897,7 +1897,6 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 
 			if (res < 0) {
 				port->vdm_state = VDM_STATE_ERR_BUSY;
-				port->vdm_sm_running = false;
 				return;
 			}
 		}
@@ -1913,6 +1912,7 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		port->vdo_data[0] = port->vdo_retry;
 		port->vdo_count = 1;
 		port->vdm_state = VDM_STATE_READY;
+		tcpm_ams_finish(port);
 		break;
 	case VDM_STATE_BUSY:
 		port->vdm_state = VDM_STATE_ERR_TMOUT;
@@ -1978,7 +1978,7 @@ static void vdm_state_machine_work(struct kthread_work *work)
 		 port->vdm_state != VDM_STATE_BUSY &&
 		 port->vdm_state != VDM_STATE_SEND_MESSAGE);
 
-	if (port->vdm_state == VDM_STATE_ERR_TMOUT)
+	if (port->vdm_state < VDM_STATE_READY)
 		port->vdm_sm_running = false;
 
 	mutex_unlock(&port->lock);
@@ -2569,6 +2569,16 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 			port->sink_cap_done = true;
 			tcpm_set_state(port, ready_state(port), 0);
 			break;
+		case SRC_READY:
+		case SNK_READY:
+			if (port->vdm_state > VDM_STATE_READY) {
+				port->vdm_state = VDM_STATE_DONE;
+				if (tcpm_vdm_ams(port))
+					tcpm_ams_finish(port);
+				mod_vdm_delayed_work(port, 0);
+				break;
+			}
+			fallthrough;
 		default:
 			tcpm_pd_handle_state(port,
 					     port->pwr_role == TYPEC_SOURCE ?
-- 
2.31.1.527.g47e6f16901-goog

