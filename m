Return-Path: <linux-usb+bounces-37584-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMzNGw3aCmoA8wQAu9opvQ
	(envelope-from <linux-usb+bounces-37584-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:21:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88550569914
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 11:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C46F83034561
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 09:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E49D3E51F0;
	Mon, 18 May 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="e3mMS2Dn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D61D3E3146
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 09:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095896; cv=none; b=NRHTTvsOfc5EXfwDwwDENCDte/o+FN1vNXWNfk3x5JsAAgpRv6jFPzyRsp7cy1IlEr6OXNmw/0/mRj4vWksfnn/DSzPAUWZRP+0BH67WShR8dnuWKGY8Ek132Wus2ucKkJ8yNzCfVPIxVEKfPBIKgNYA+ydpI+9d7NlXF/ETcu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095896; c=relaxed/simple;
	bh=c8h+9kDObkiLnY1wbAG2dd3q6oLJ48n3SeWeK/fnWuY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoIkzOy6uXpkWX0tkVdIRg5+CTs1cGTDNg0Pyt8d1secedfSWlkU2skd4oUprOcfVr8bv9Klb55GtmWN1hJA+O3Ghpccl78Qq+76wgKaQ3fH7wts/QoGbP/KmbFFDOAdo8V0zoarmmWr17GE7qbFKBjx3OQrximK2lSimPNWGW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=e3mMS2Dn; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1779095891;
	bh=fxUF3k3WHCHt2g6izrWysKGKB1wcrJxtUSpatTt0aj4=; l=2931;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=e3mMS2DnL/rFPa/SCChbkGIuj3aUhkhSS1PX+wXnS8Rt4BZVGSJS+sasfZ22Lgc3u
	 8XfVr9952Tnw9o/TlsLr+k0K2i+Fa079eAVBAQHn5nL3OZa6z9mtQOqpq+QQGE+VJf
	 k6avPCnnVGEoxduKLnMtbXCX1RB9XlM1z9qdbTsvXKbVe7EomHcbOBUpZIFioE4ZA6
	 IukrKCgRhGVuf4dJODj3Zhegp2L8x3aU5RjXW1aFAlpS4LNBxq2Z/rSrtSjvSVCQbm
	 VdJOKU+Aw24Z5+rluf8ADADHTModw1Y+y0NCoMCz98woD51yDaoESV/nz/DEn6zZeX
	 DaYS4/WKAo0zg==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1227019:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 18 May 2026 17:18:09 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 18 May
 2026 17:18:08 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 18 May 2026 17:18:08 +0800
From: <cy_huang@richtek.com>
To: <linux-usb@vger.kernel.org>
CC: <badhri@google.com>, <heikki.krogerus@linux.intel.com>,
	<gregkh@linuxfoundation.org>, <lucas_tsai@richtek.com>,
	<cy_huang@richtek.com>, <ren_chen@richtek.com>, <kevin_hung@richtek.com>
Subject: [PATCH 1/3] usb: typec: tcpm: add low power mode support
Date: Mon, 18 May 2026 17:15:12 +0800
Message-ID: <20260518091513.3277975-3-cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260518091513.3277975-2-cy_huang@richtek.com>
References: <20260518091513.3277975-2-cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Rspamd-Queue-Id: 88550569914
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[richtek.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[richtek.com:s=richtek];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37584-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[cy_huang@richtek.com,linux-usb@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[richtek.com:+];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lucas Tsai <lucas_tsai@richtek.com>

Add low power mode support,
enter low power mode at detach,
exit low power mode at SRC_ATTACH_WAIT, SNK_ATTACH_WAIT and init.

Signed-off-by: Lucas Tsai <lucas_tsai@richtek.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 10 ++++++++++
 include/linux/usb/tcpm.h      |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 55fee96d3342..a4bde4c292e4 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4939,6 +4939,9 @@ static void tcpm_reset_port(struct tcpm_port *port)
 
 static void tcpm_detach(struct tcpm_port *port)
 {
+	if (port->tcpc->set_low_power_mode)
+		port->tcpc->set_low_power_mode(port->tcpc, true);
+
 	if (tcpm_port_is_disconnected(port))
 		port->hard_reset_count = 0;
 
@@ -5181,6 +5184,8 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, SNK_UNATTACHED, PD_T_DRP_SNK);
 		break;
 	case SRC_ATTACH_WAIT:
+		if (port->tcpc->set_low_power_mode)
+			port->tcpc->set_low_power_mode(port->tcpc, false);
 		if (tcpm_port_is_debug_source(port))
 			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
 				       port->timings.cc_debounce_time);
@@ -5439,6 +5444,8 @@ static void run_state_machine(struct tcpm_port *port)
 			tcpm_set_state(port, SRC_UNATTACHED, PD_T_DRP_SRC);
 		break;
 	case SNK_ATTACH_WAIT:
+		if (port->tcpc->set_low_power_mode)
+			port->tcpc->set_low_power_mode(port->tcpc, false);
 		if (tcpm_port_is_debug_sink(port))
 			tcpm_set_state(port, DEBUG_ACC_ATTACHED,
 				       PD_T_CC_DEBOUNCE);
@@ -7489,6 +7496,9 @@ static void tcpm_init(struct tcpm_port *port)
 {
 	enum typec_cc_status cc1, cc2;
 
+	if (port->tcpc->set_low_power_mode)
+		port->tcpc->set_low_power_mode(port->tcpc, false);
+
 	port->tcpc->init(port->tcpc);
 
 	tcpm_reset_port(port);
diff --git a/include/linux/usb/tcpm.h b/include/linux/usb/tcpm.h
index 93079450bba0..475c5d478c0e 100644
--- a/include/linux/usb/tcpm.h
+++ b/include/linux/usb/tcpm.h
@@ -82,6 +82,9 @@ enum tcpm_transmit_type {
  *		Optional; if supported by hardware, called to start dual-role
  *		toggling or single-role connection detection. Toggling stops
  *		automatically if a connection is established.
+ * @set_low_power_mode:
+ *		Optional; if supported by hardware, called to enter or exit
+ *		low power mode.
  * @try_role:	Optional; called to set a preferred role
  * @pd_transmit:Called to transmit PD message
  * @set_bist_data: Turn on/off bist data mode for compliance testing
@@ -155,6 +158,7 @@ struct tcpc_dev {
 	int (*start_toggling)(struct tcpc_dev *dev,
 			      enum typec_port_type port_type,
 			      enum typec_cc_status cc);
+	void (*set_low_power_mode)(struct tcpc_dev *dev, bool enable);
 	int (*try_role)(struct tcpc_dev *dev, int role);
 	int (*pd_transmit)(struct tcpc_dev *dev, enum tcpm_transmit_type type,
 			   const struct pd_message *msg, unsigned int negotiated_rev);
-- 
2.43.0


