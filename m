Return-Path: <linux-usb+bounces-33346-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBO6BiyAj2kfRQEAu9opvQ
	(envelope-from <linux-usb+bounces-33346-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:49:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530813943E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 243013014041
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F3928DF07;
	Fri, 13 Feb 2026 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UaUYjdn2"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08932773EE;
	Fri, 13 Feb 2026 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771012132; cv=none; b=omLv+vNfT2tKVGSM8gLLJqnJjlh+TTyfpKnZBETJFRmR/GxXmtlJMqRZcUagIL3noSfyY1dhuNAo3zfAOFN/0n46su196Vm4KTVV3852HyRKpMcMqU93d7dDO+aP+bFSu34buUY6lK0HG3/cXxu9y6qbmzYANzRYvUp0qxfCVFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771012132; c=relaxed/simple;
	bh=meuP6gxKTqFT3ealhNZwKKg1S7fUmPZIfIPiv1LoVbw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oCs9kVcvPSS7vPxdro8F0oxKXfg3M9seK2Jm7anYOJEjc6T8MLszBJLrFMmrgBTliTALm13RBXpu0yMXbiFc54oHZ3kZLFz1G2S4Zed/7xqyRcJWkEzzU0XQeyXPIOuGxvEqxUHCpOiNatBGW1+dtzneG3d6z6kvxDjv/LIBLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UaUYjdn2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771012129;
	bh=meuP6gxKTqFT3ealhNZwKKg1S7fUmPZIfIPiv1LoVbw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UaUYjdn2nJX90ysST6mv6S27OrnMqGk3blj78y5rt/2WVFLHAz92uZ0Q9eJemmP9Z
	 nubKS0rs+RhflqLNrJnnzvzN67puEw8DaqG70oFrXFMkyJQT2ow27t/LpIc1mzGQ7E
	 ModbQdryOjROQH5klbtZ3PyLkvnznyUqpiAD3mt7Hs7tp0Qx6fs+xMPYsO1KqOB8OA
	 arWKa+I6cQArnHo2xaWXV5P+qXYXJe30mX2fVqJe+WkTFlvSofU74lh/MR75HxKNbR
	 4f7iJf9XLvUKXX0zZA9n4dhUCdlbZbRNHFsasQi/rU6LPoNomfIJNPRbaz1s3HIwzJ
	 1SgoAsQLkO73Q==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 025C117E35C4;
	Fri, 13 Feb 2026 20:48:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 97D46480027; Fri, 13 Feb 2026 20:48:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 20:48:45 +0100
Subject: [PATCH 2/2] usb: typec: tcpm: create helper function for
 DISCOVER_MODES
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-tcpm-discover-modes-nak-fix-v1-2-9bcb5adb4ef6@collabora.com>
References: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
In-Reply-To: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5818;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=meuP6gxKTqFT3ealhNZwKKg1S7fUmPZIfIPiv1LoVbw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPgCCJbzxvuaPsNs1FUUvU0/0WRVvZbnsCm
 0eB3oaYofDT4okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpj4AgAAoJENju1/PI
 O/qaaMgP/iT1bdMy0RqYwsIU0LK/18hjos0CEDteWBqHaVqCCYmzl3bAcrrmKjHC+0VaggMOPDE
 IjH2Xl6nXjWLG1RAgtCLDZ2tyM2jIzO8Q+3mE98WQHj5dpoQpYYaLQYVoHT36Bzx6ZwAhsCC240
 5GvSdkdl/+HYMooLckcvK7vTWcqPBmqJ9iH5vazN+TvbUh5kTxfuFLr6hUKJ5vwgD8JNHh31oZJ
 t8TNK0UadwINvn/Jn0XTfbGV+4D1C1NfjA4pZzmF5oiWhzHr4ZMxq6CMUfP4IBbXQEGHhIouZvL
 mpHsz9rVWL3k+ogoVgzGGc89MRk/ZiLYatasHdGBpd1f4BA0w9vLccF0t9G05OT0PjHBqqJ+nct
 4JYiAOYMRbkII5KInHpjJeWbhBJiH5WidB1f/2LyNltxDm1FqGu8ZDzGXgOcOtSQxauGLvp9E4k
 aAvUC85UAxrhvMd0IIIBnhlVKtPk9QnluouiRo0coyDhDBhhPTqegVlWFmIwZQXCC3QkEt0AhsC
 Wx2/ui3jmAcxAZ8r+bcgOGwr1e4qo4QgZ3eF6hA7UBSLruXdXk7fyqKswO1/pYBkn6BgIv3GLRP
 FeLjGxl+oa+COpWfvF+PCxhZzZ6UhQjlT/iOwKROGMbw4F6hqDIfor4KI7lla//VpVP5RH3rJ7O
 oaNU2MleZcWRntPpHyOws7w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33346-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: 3530813943E
X-Rspamd-Action: no action

The ACK and NAK response handling for DISCOVER_MODES is almost exactly
the same. Create a helper function to reduce code duplication.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 129 +++++++++++++++++++-----------------------
 1 file changed, 59 insertions(+), 70 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 88cc27ad9514..dd4e7cd2db9e 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1995,6 +1995,57 @@ static bool tcpm_cable_vdm_supported(struct tcpm_port *port)
 	       tcpm_can_communicate_sop_prime(port);
 }
 
+static void tcpm_handle_discover_mode(struct tcpm_port *port,
+				      const u32 *p, int cnt, u32 *response,
+				      enum tcpm_transmit_type rx_sop_type,
+				      enum tcpm_transmit_type *response_tx_sop_type,
+				      struct pd_mode_data *modep,
+				      struct pd_mode_data *modep_prime,
+				      int svdm_version, int *rlen,
+				      bool success)
+
+{
+	struct typec_port *typec = port->typec_port;
+
+	if (rx_sop_type == TCPC_TX_SOP) {
+		/* 6.4.4.3.3 */
+		if (success)
+			svdm_consume_modes(port, p, cnt, rx_sop_type);
+		modep->svid_index++;
+		if (modep->svid_index < modep->nsvids) {
+			u16 svid = modep->svids[modep->svid_index];
+			*response_tx_sop_type = TCPC_TX_SOP;
+			response[0] = VDO(svid, 1, svdm_version,
+					  CMD_DISCOVER_MODES);
+			*rlen = 1;
+		} else if (tcpm_cable_vdm_supported(port)) {
+			*response_tx_sop_type = TCPC_TX_SOP_PRIME;
+			response[0] = VDO(USB_SID_PD, 1,
+					  typec_get_cable_svdm_version(typec),
+					  CMD_DISCOVER_SVID);
+			*rlen = 1;
+		} else {
+			tcpm_register_partner_altmodes(port);
+		}
+	} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+		/* 6.4.4.3.3 */
+		if (success)
+			svdm_consume_modes(port, p, cnt, rx_sop_type);
+		modep_prime->svid_index++;
+		if (modep_prime->svid_index < modep_prime->nsvids) {
+			u16 svid = modep_prime->svids[modep_prime->svid_index];
+			*response_tx_sop_type = TCPC_TX_SOP_PRIME;
+			response[0] = VDO(svid, 1,
+					  typec_get_cable_svdm_version(typec),
+					  CMD_DISCOVER_MODES);
+			*rlen = 1;
+		} else {
+			tcpm_register_plug_altmodes(port);
+			tcpm_register_partner_altmodes(port);
+		}
+	}
+}
+
 static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			const u32 *p, int cnt, u32 *response,
 			enum adev_actions *adev_action,
@@ -2252,41 +2303,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 			}
 			break;
 		case CMD_DISCOVER_MODES:
-			if (rx_sop_type == TCPC_TX_SOP) {
-				/* 6.4.4.3.3 */
-				svdm_consume_modes(port, p, cnt, rx_sop_type);
-				modep->svid_index++;
-				if (modep->svid_index < modep->nsvids) {
-					u16 svid = modep->svids[modep->svid_index];
-					*response_tx_sop_type = TCPC_TX_SOP;
-					response[0] = VDO(svid, 1, svdm_version,
-							  CMD_DISCOVER_MODES);
-					rlen = 1;
-				} else if (tcpm_cable_vdm_supported(port)) {
-					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
-					response[0] = VDO(USB_SID_PD, 1,
-							  typec_get_cable_svdm_version(typec),
-							  CMD_DISCOVER_SVID);
-					rlen = 1;
-				} else {
-					tcpm_register_partner_altmodes(port);
-				}
-			} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
-				/* 6.4.4.3.3 */
-				svdm_consume_modes(port, p, cnt, rx_sop_type);
-				modep_prime->svid_index++;
-				if (modep_prime->svid_index < modep_prime->nsvids) {
-					u16 svid = modep_prime->svids[modep_prime->svid_index];
-					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
-					response[0] = VDO(svid, 1,
-							  typec_get_cable_svdm_version(typec),
-							  CMD_DISCOVER_MODES);
-					rlen = 1;
-				} else {
-					tcpm_register_plug_altmodes(port);
-					tcpm_register_partner_altmodes(port);
-				}
-			}
+			tcpm_handle_discover_mode(port, p, cnt, response,
+						  rx_sop_type, response_tx_sop_type,
+						  modep, modep_prime, svdm_version,
+						  &rlen, true);
 			break;
 		case CMD_ENTER_MODE:
 			*response_tx_sop_type = rx_sop_type;
@@ -2334,41 +2354,10 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 		case CMD_DISCOVER_MODES:
 			tcpm_log(port, "Skip SVID 0x%04x (failed to discover mode)",
 				 PD_VDO_SVID_SVID0(p[0]));
-
-			if (rx_sop_type == TCPC_TX_SOP) {
-				/* 6.4.4.3.3 */
-				modep->svid_index++;
-				if (modep->svid_index < modep->nsvids) {
-					u16 svid = modep->svids[modep->svid_index];
-					*response_tx_sop_type = TCPC_TX_SOP;
-					response[0] = VDO(svid, 1, svdm_version,
-							  CMD_DISCOVER_MODES);
-					rlen = 1;
-				} else if (tcpm_cable_vdm_supported(port)) {
-					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
-					response[0] = VDO(USB_SID_PD, 1,
-							  typec_get_cable_svdm_version(typec),
-							  CMD_DISCOVER_SVID);
-					rlen = 1;
-				} else {
-					tcpm_register_partner_altmodes(port);
-				}
-			} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
-				/* 6.4.4.3.3 */
-				modep_prime->svid_index++;
-				if (modep_prime->svid_index < modep_prime->nsvids) {
-					u16 svid = modep_prime->svids[modep_prime->svid_index];
-					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
-					response[0] = VDO(svid, 1,
-							  typec_get_cable_svdm_version(typec),
-							  CMD_DISCOVER_MODES);
-					rlen = 1;
-				} else {
-					tcpm_register_plug_altmodes(port);
-					tcpm_register_partner_altmodes(port);
-				}
-			}
-
+			tcpm_handle_discover_mode(port, p, cnt, response,
+						  rx_sop_type, response_tx_sop_type,
+						  modep, modep_prime, svdm_version,
+						  &rlen, false);
 			break;
 		case CMD_ENTER_MODE:
 			/* Back to USB Operation */

-- 
2.51.0


