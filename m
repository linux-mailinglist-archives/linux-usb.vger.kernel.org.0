Return-Path: <linux-usb+bounces-33345-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAa1GTaAj2kfRQEAu9opvQ
	(envelope-from <linux-usb+bounces-33345-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:49:10 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA0113945D
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 20:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7144F3030E91
	for <lists+linux-usb@lfdr.de>; Fri, 13 Feb 2026 19:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728F328D83E;
	Fri, 13 Feb 2026 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Hiflr1O2"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF9924DCF6;
	Fri, 13 Feb 2026 19:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771012132; cv=none; b=FDc4tBFwzEVwBNvsVqvBdwYTnniYVWA9sR7UqkzdiRTwLo2/kxLP45iqCzbBs1AqEzVCxaJwan1HxpOp/61T11tOI50oBIU2CgvAPFLPDqOoirZAFPTXLvg/9DD7jWY5rgLUc9McuTNCTG7CIRiVEhVTENbwfTCjMtTUqtRnRIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771012132; c=relaxed/simple;
	bh=YUaqb71jusyBC3+IgLMi2lBOpLNCkySQLseoFKGsKag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FP3xqMRehq+bPrh3QWs68nuM4Cgu7yUbripi42sdDvxQKo/gXJ71L0Dg6qjjbeb0ynEtpUAldem/MI2UUH/6xYYvZBVYnhR+FfQSn3DRZhxN8w2+CCNWVqmoepyagD6z1i/dXokcMiwA6LcrLlTd+CXI/V59PymIF6GPmwZwR4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Hiflr1O2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771012129;
	bh=YUaqb71jusyBC3+IgLMi2lBOpLNCkySQLseoFKGsKag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hiflr1O2NasbYk9bdVcIpXm91O5jeP5dhotOjcpqRK6d8YxSyFDtTdwcrq+6jvYY6
	 4aJzoDPix/J+aRvUcPkl7Y/4cTrXhPRlScQiHiW30qZ71OhjzxyJ+D4F+v95NjLI+4
	 WKgTxTmvSpdZMsX6W34TcvAh/cxsZY/fwhB7HEiNDudoAZrSxgo0Cbo6vE4TzT9nEC
	 G6cmWxeDWFaHGPQmpwOnlfCSp7MLU4hW7FKWK8X7lEC+uA4PCn+GOuOgRsvtUNj2bo
	 VR9tlubRjwbzJCMvETqYn2IflWflOTVOCtbXOIldXE8eFUY1nPzq9Vac9OJqkF4mLM
	 dfhfgI4WjvDaw==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 073C517E35CB;
	Fri, 13 Feb 2026 20:48:49 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 96CE8480023; Fri, 13 Feb 2026 20:48:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 20:48:44 +0100
Subject: [PATCH 1/2] usb: typec: tcpm: improve handling of DISCOVER_MODES
 failures
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-tcpm-discover-modes-nak-fix-v1-1-9bcb5adb4ef6@collabora.com>
References: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
In-Reply-To: <20260213-tcpm-discover-modes-nak-fix-v1-0-9bcb5adb4ef6@collabora.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=YUaqb71jusyBC3+IgLMi2lBOpLNCkySQLseoFKGsKag=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPgCAX3kzrq6Ji5xpsrkH7SxpjtXBNqPW2j
 8CA0fHemayVPIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpj4AgAAoJENju1/PI
 O/qa2yMP/2rtqw+fc7Jt+Q19HPp4Sccld2oEoerUevx/WSHo1tOPY9AopNeqWOdNO58hL8hD+pk
 vJ4LdtSOn3Bdu9BD0Rs7lDh4KqjBKDwqBguHpT8iXw7ZY86TJGDeuqTghyyLygsR8Rgge0ob1UU
 L43pyJqpZd4ByMLAqkxsn5fJKsQGVN2rDpIyhoiI1h9ZEW8WRc6mkjRlmK/z38A+xA+063Q0ni2
 19lwlY1BDnTB4VYYRQRtO8/eTWQusiCTGgbmbzovsuqPHPqlo33o/9+Xs4SKLAPYlMt/k8FWpx8
 ZA47pcx5z2URWd9OutCofHlCLLu0EoMZ7OBkCQBsxEvvegEHr9jrUQsy1eGY/jMjFRSoNT1Emcv
 /VwbKudKUTRZbJntnM86gr/n3CNeem+XCrCnRdnWqwmcGFiI30loHEAWSGVL36m+JdCSQNHiaar
 Un2mKW/Q6vhPh69Mgi7JhbK/Z53vZ6BxnpNSDur9e8+y4ZvFtSEDQv1UWSpHBET1QLSRhSjsHHn
 A82dP8by7RROAdMDRYJAY1pUyepCTSmC31Gq5AJ3+GlEV18sROQwYAJI5b9Mhr0SUVoznalaCC1
 LTK8I+zzAEuhCR+4czN1TZX0Rj2C7VdagLswXz3TG0lURT7oeJ+OddQZ2aWTQ+tPrGJnGZP4O0+
 ymZBB1d4v7n8kynvL4qcpWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
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
	TAGGED_FROM(0.00)[bounces-33345-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: DEA0113945D
X-Rspamd-Action: no action

UGREEN USB-C Multifunction Adapter Model CM512 (AKA "Revodok 107")
exposes two SVIDs: 0xff01 (DP Alt Mode) and 0x1d5c. The DISCOVER_MODES
step succeeds for 0xff01 and gets a NAK for 0x1d5c. Currently this
results in DP Alt Mode not being registered either, since the modes are
only registered once all of them have been discovered. The NAK results
in the processing being stopped and thus no Alt modes being registered.

Improve the situation by handling the NAK gracefully and continue
processing the other modes.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 40 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index be49a976428f..88cc27ad9514 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2329,8 +2329,46 @@ static int tcpm_pd_svdm(struct tcpm_port *port, struct typec_altmode *adev,
 		switch (cmd) {
 		case CMD_DISCOVER_IDENT:
 		case CMD_DISCOVER_SVID:
-		case CMD_DISCOVER_MODES:
 		case VDO_CMD_VENDOR(0) ... VDO_CMD_VENDOR(15):
+			break;
+		case CMD_DISCOVER_MODES:
+			tcpm_log(port, "Skip SVID 0x%04x (failed to discover mode)",
+				 PD_VDO_SVID_SVID0(p[0]));
+
+			if (rx_sop_type == TCPC_TX_SOP) {
+				/* 6.4.4.3.3 */
+				modep->svid_index++;
+				if (modep->svid_index < modep->nsvids) {
+					u16 svid = modep->svids[modep->svid_index];
+					*response_tx_sop_type = TCPC_TX_SOP;
+					response[0] = VDO(svid, 1, svdm_version,
+							  CMD_DISCOVER_MODES);
+					rlen = 1;
+				} else if (tcpm_cable_vdm_supported(port)) {
+					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
+					response[0] = VDO(USB_SID_PD, 1,
+							  typec_get_cable_svdm_version(typec),
+							  CMD_DISCOVER_SVID);
+					rlen = 1;
+				} else {
+					tcpm_register_partner_altmodes(port);
+				}
+			} else if (rx_sop_type == TCPC_TX_SOP_PRIME) {
+				/* 6.4.4.3.3 */
+				modep_prime->svid_index++;
+				if (modep_prime->svid_index < modep_prime->nsvids) {
+					u16 svid = modep_prime->svids[modep_prime->svid_index];
+					*response_tx_sop_type = TCPC_TX_SOP_PRIME;
+					response[0] = VDO(svid, 1,
+							  typec_get_cable_svdm_version(typec),
+							  CMD_DISCOVER_MODES);
+					rlen = 1;
+				} else {
+					tcpm_register_plug_altmodes(port);
+					tcpm_register_partner_altmodes(port);
+				}
+			}
+
 			break;
 		case CMD_ENTER_MODE:
 			/* Back to USB Operation */

-- 
2.51.0


