Return-Path: <linux-usb+bounces-3816-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E4B8083D4
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 724D4B21E68
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747B3328CB;
	Thu,  7 Dec 2023 09:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qh+2EABL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F7910CB
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:08:10 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5c6065d5e1bso462386a12.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 01:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940089; x=1702544889; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=znqUQgbDyGs2yHI5XAyPSDU3w/SigHyVPnlMFTmu+CA=;
        b=qh+2EABLfQ/SreRZgAi9zfyFayYMHK29dzS2Wcl4dPfBNvLA5vMvSrTvNM6pxA/xnP
         su6m2keU4bcBjubCmLsRiwn3MvBtKH8tnvaHYcxPiDp8pmTghDFsi47fHP5cpXLcy3d4
         cDOmOy3i2tlY8OJ5iTgfZN+Z2eEZIg0p2sqz/3jPAIiX51JIGokaX03OIFMxK0vKGuTo
         VBBNR7Dul0l7iJfVAYH599HU1ybQKwd+9k4AWU/dmO5aLdwGiO9+vjYTvZ86uwMi4chk
         E6j845tgAkMlTvRSFvTdlHthO8glfbohV6Y8//LV/PkpW/WjK/k2sBjKpkWlKdyPRfdt
         OnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940089; x=1702544889;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znqUQgbDyGs2yHI5XAyPSDU3w/SigHyVPnlMFTmu+CA=;
        b=bJbjNmwd69ZJ4i6SSqhw0utQaqSROLVHWVcsCjWsJxXHeL/aW0EPKbQvUDlZfcISH8
         AIt0T7uBDI6lBB1H4DKycSiksFOqSaYZlVpLvj4RqS2JM7j3ZPD53DY+r3HR6I8O/gNZ
         HgM5/EIRjxrR1PNgYaKv5CjGu+E+s8OwCNiU7Z0xVsx8wnlV5b+bXBZ0skmgCrEKGLDF
         jyGJyWDQ9izwrpLqhTvrIZKtz0Y9SSRRfExFqWTYB5no5/BoI79T813LmnolE8+fFr+m
         yJgBq2peKKB1tmcCbl61dm1r2VwMxLdeMR7yaHdO1qiz+NIqG2iFhbLQ7ZqRM8f2iJ7p
         cq6w==
X-Gm-Message-State: AOJu0Yzs/lgdp6Q0rlRrv1GLoM9uom97ilGzqLuJLa74DUKyH5kDK+dU
	WskvnpKCqzro2yXSFEYIC3YdYYQUR9l7Cjo=
X-Google-Smtp-Source: AGHT+IGCK+2bl6ADzAUM/jG97tfMH17DmF8B9kJMt9q3pqUQJxliqtVIlm8QzihmYwo4Y16lhk33Af1c+GFCI9o=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a17:903:492:b0:1d0:559e:4130 with SMTP
 id jj18-20020a170903049200b001d0559e4130mr23446plb.9.1701940089680; Thu, 07
 Dec 2023 01:08:09 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:38 +0000
In-Reply-To: <20231207090738.15721-12-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4417; i=rdbabiera@google.com;
 h=from:subject; bh=PMhwKTq+HFv3EMRYrPK9u2LnZd//sBDn+vc2LOClaUo=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3bFSVneLzI5w/F5jtvleR0/HhXd/7m40O3OyOvvbH
 a43r9xkO0pZGMQ4GGTFFFl0/fMMblxJ3TKHs8YYZg4rE8gQBi5OAZjIQ1GG/x77D66fkBGqsOMZ
 63TjLZfeR4fKzFu9WEfbq4rho/Ol8oOMDCtWBO74vLbnfM0uX6/Eh6xrgr9M+nrqRtdOm3OT3tz tbuUDAA==
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-19-rdbabiera@google.com>
Subject: [PATCH v1 07/10] usb: typec: tcpm: add state machine support for SRC_VDM_IDENTITY_REQUEST
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add SRC_VDM_IDENTITY_REQUEST state which first enters after SRC_STARTUP.
The state sends Discover Identity on SOP' and transitions to
SRC_SEND_CAPABILITIES. SRC_SEND_CAPABILITIES will transition back into
SRC_VDM_IDENTITY_REQUEST instead of retrying immediately.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 44 ++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2b650b419421..f55bcbe6f031 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -146,7 +146,9 @@
 	S(PORT_RESET_WAIT_OFF),			\
 						\
 	S(AMS_START),				\
-	S(CHUNK_NOT_SUPP)
+	S(CHUNK_NOT_SUPP),			\
+						\
+	S(SRC_VDM_IDENTITY_REQUEST)
 
 #define FOREACH_AMS(S)				\
 	S(NONE_AMS),				\
@@ -1989,6 +1991,14 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 				 * the svdm_version for the cable moving forward.
 				 */
 				svdm_consume_identity_sop_prime(port, p, cnt);
+				/*
+				 * If received before explicit contract, continue
+				 * to SRC_SEND_CAPABILITIES
+				 */
+				if (port->state == SRC_VDM_IDENTITY_REQUEST) {
+					tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
+					return 0;
+				}
 				*response_tx_sop_type = TCPC_TX_SOP;
 				response[0] = VDO(USB_SID_PD, 1,
 						  typec_get_negotiated_svdm_version(typec),
@@ -2283,7 +2293,8 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 		 * if there's traffic or we're not in PDO ready state don't send
 		 * a VDM.
 		 */
-		if (port->state != SRC_READY && port->state != SNK_READY) {
+		if (port->state != SRC_READY && port->state != SNK_READY &&
+		    port->state != SRC_VDM_IDENTITY_REQUEST) {
 			port->vdm_sm_running = false;
 			break;
 		}
@@ -2359,13 +2370,22 @@ static void vdm_run_state_machine(struct tcpm_port *port)
 			tcpm_ams_finish(port);
 		break;
 	case VDM_STATE_ERR_SEND:
+		/*
+		 * When sending Discover Identity to SOP' before establishing an
+		 * explicit contract, do not retry. Instead, weave sending
+		 * Source_Capabilities over SOP and Discover Identity over SOP'.
+		 */
+		if (port->state == SRC_VDM_IDENTITY_REQUEST) {
+			tcpm_ams_finish(port);
+			port->vdm_state = VDM_STATE_DONE;
+			tcpm_set_state(port, SRC_SEND_CAPABILITIES, 0);
 		/*
 		 * A partner which does not support USB PD will not reply,
 		 * so this is not a fatal error. At the same time, some
 		 * devices may not return GoodCRC under some circumstances,
 		 * so we need to retry.
 		 */
-		if (port->vdm_retries < 3) {
+		} else if (port->vdm_retries < 3) {
 			tcpm_log(port, "VDM Tx error, retry");
 			port->vdm_retries++;
 			port->vdm_state = VDM_STATE_READY;
@@ -4483,8 +4503,12 @@ static void run_state_machine(struct tcpm_port *port)
 		}
 		ret = tcpm_pd_send_source_caps(port);
 		if (ret < 0) {
-			tcpm_set_state(port, SRC_SEND_CAPABILITIES,
-				       PD_T_SEND_SOURCE_CAP);
+			if (tcpm_can_communicate_sop_prime(port) &&
+			    IS_ERR_OR_NULL(port->cable))
+				tcpm_set_state(port, SRC_VDM_IDENTITY_REQUEST, 0);
+			else
+				tcpm_set_state(port, SRC_SEND_CAPABILITIES,
+					       PD_T_SEND_SOURCE_CAP);
 		} else {
 			/*
 			 * Per standard, we should clear the reset counter here.
@@ -5399,6 +5423,13 @@ static void run_state_machine(struct tcpm_port *port)
 		tcpm_pd_send_control(port, PD_CTRL_NOT_SUPP, TCPC_TX_SOP);
 		tcpm_set_state(port, port->pwr_role == TYPEC_SOURCE ? SRC_READY : SNK_READY, 0);
 		break;
+	/* Cable states */
+	case SRC_VDM_IDENTITY_REQUEST:
+		port->send_discover_prime = true;
+		port->tx_sop_type = TCPC_TX_SOP_PRIME;
+		mod_send_discover_delayed_work(port, 0);
+		port->upcoming_state = SRC_SEND_CAPABILITIES;
+		break;
 	default:
 		WARN(1, "Unexpected port state %d\n", port->state);
 		break;
@@ -6123,7 +6154,8 @@ static void tcpm_send_discover_work(struct kthread_work *work)
 	}
 
 	/* Retry if the port is not idle */
-	if ((port->state != SRC_READY && port->state != SNK_READY) || port->vdm_sm_running) {
+	if ((port->state != SRC_READY && port->state != SNK_READY &&
+	     port->state != SRC_VDM_IDENTITY_REQUEST) || port->vdm_sm_running) {
 		mod_send_discover_delayed_work(port, SEND_DISCOVER_RETRY_MS);
 		goto unlock;
 	}
-- 
2.43.0.rc2.451.g8631bc7472-goog


