Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B33376030
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 08:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbhEGGYR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 02:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233360AbhEGGYO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 May 2021 02:24:14 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F82BC061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 23:23:14 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id v12-20020a25848c0000b02904f30b36aebfso9002984ybk.1
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 23:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=057HsphvG01JlzoVdz0KlQlwLZqc+KcyJXEoUPEQFTE=;
        b=nvDWwzEJCBU+I9nYLyFo/kzudwIXUS2orHoCti1uMt7DSsYK/hBoT1KPIdNWCQUJ8A
         wARLJT4E9KKBXEdLqLDsFa62siOdFVkMrBr/7j4Gd1yhxNiv/IQB45lTK7J3ZPZZT+W/
         Qp6gaDp6UBH5K/AF4gFwcZxRutE2mUT0q0/ikdbrJqPq4GpxXMjf/fybxeH/lCIyuxRK
         6PYliEgU0G7CobalK5XlzYvn6bwsqtHUCE6MIOh3/HlvbzAcJ1bpwqABPYX7bx9uUSWc
         4HlgWmJpSdX82YjazbBp1Iz0tLtxiHIOaUKLG68Ya97kjiVlWHYHl7T3y5sAhCa+hEt9
         afvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=057HsphvG01JlzoVdz0KlQlwLZqc+KcyJXEoUPEQFTE=;
        b=ZYyKBLbpJq1pECdM/aXoKnNYqe6kCJTE+xH25mPphAq2MkVkUL2gJC1F3OJfM1aDyQ
         TqvI2CoY6bF1EjpbBXbf5Zjaub5Ke1/5zMW2AhQ5bGf6X6gzKfb9z/Q0g5SQ41lFvqSi
         Cuy9PIpduv20HJwDr+hEf/5Qp9qk9/OBG3HAKoMModBo59RMM4VHlu4Yrfv1docR6sH1
         9tQ53Hm+QsoxI6aAQs6YcoIiF/4MnjqVhZGDTNeeLG9dIUKCex/AAZBfWeZlhzxmi54g
         9oC6XD3H+LuwAIWaMqZoEgJ5lADdHkf1CnUfdKb7IUHjxKOVunt3kWZ5jCijSymfoLC/
         BKPA==
X-Gm-Message-State: AOAM532zJLQWIzmPVmoR7z3gWsAp5bJoW+tDvXTNpUZNjgr4zXO0O90i
        YquXhvGqlY+64doKUsQItpE7mC991Jx7
X-Google-Smtp-Source: ABdhPJxD3kUy1DBMlXwR59N2/HsFKNIHErwdUviHx3DuQUW+LOAK9E4P/3pRMtT+b8sl5Q1OFRSANl3Pqi7X
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:9a5c:8de0:4c79:ba52])
 (user=kyletso job=sendgmr) by 2002:a25:bb08:: with SMTP id
 z8mr11153246ybg.188.1620368593913; Thu, 06 May 2021 23:23:13 -0700 (PDT)
Date:   Fri,  7 May 2021 14:23:00 +0800
In-Reply-To: <20210507062300.1945009-1-kyletso@google.com>
Message-Id: <20210507062300.1945009-3-kyletso@google.com>
Mime-Version: 1.0
References: <20210507062300.1945009-1-kyletso@google.com>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
Subject: [PATCH v3 2/2] usb: typec: tcpm: Fix wrong handling for Not_Supported
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
Changes since v2:
- no changes

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

