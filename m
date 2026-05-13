Return-Path: <linux-usb+bounces-37396-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENBGAVKgBGqbMAIAu9opvQ
	(envelope-from <linux-usb+bounces-37396-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:01:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C3536ABB
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:01:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8010300B9D1
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 15:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13E2425CDF;
	Wed, 13 May 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T9M3BDHe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8084CA26A;
	Wed, 13 May 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687584; cv=none; b=R8L7O/R3FARIJSRRobpGLDBipKme7ZgdePUo4SdfbT8obKG/Fk7x/awFc/Vl00xuMykcOyXAkoRfOsDAbGH4RSkG3DxJ1ncCkT6VVNkGlj6eMUA6Q2NYBRDe07VEtRSEQmhfNnFSBvfdovJqgocGFemL6xi1TmOSx0SSsIk3QrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687584; c=relaxed/simple;
	bh=akf8xDcTf6ajKnNwVn/PvFJIgvoWufWJiAQPWRW9tJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=seYZylSCxRSQoUuVH4INqxlLGGU9E6CjHArBPdKsBbThRrvbEdSuQW2PPJcpDpIsz6OqR32YPiKpf3ms4OzF8VihLnj2b7PwVXxvaIhUrDAijOuaqG2+mBPVvDKTcrvULYxE8VqOH9QY1Xm8nctIz+le49/l9KFwmOyF8qZEOXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T9M3BDHe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8D2C2BCB7;
	Wed, 13 May 2026 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778687583;
	bh=akf8xDcTf6ajKnNwVn/PvFJIgvoWufWJiAQPWRW9tJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9M3BDHeg5fS7bFbzDl48om0uTDG8DWlZ4ByGUL74Ab7CrkPojkbbeV0Zs7abaoS2
	 cqrvIsIUSGFfMgABma9FDvSXkSbbC7yHG11R4xoAe/9o+UYo4XDmkB5agTRcOMQ5OP
	 pWfR3NACyK6vQretYxpPN/NADCS6NPKqFt7+QAvQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	stable <stable@kernel.org>
Subject: [PATCH 6/8] usb: typec: tcpm: bound altmode_desc[] per iteration in svdm_consume_modes()
Date: Wed, 13 May 2026 17:52:53 +0200
Message-ID: <2026051351-reshuffle-skillful-90af@gregkh>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026051347-clustered-deflected-9543@gregkh>
References: <2026051347-clustered-deflected-9543@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 65
X-Developer-Signature: v=1; a=openpgp-sha256; l=2581; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=akf8xDcTf6ajKnNwVn/PvFJIgvoWufWJiAQPWRW9tJI=; b=kA0DAAIRMUfUDdst+ykByyZiAGoEnlPIHSclk1biT1GizZkf/bYl7LVkT6//4M9XKGwhJUa+M ohdBAARAgAdFiEE9LYMxb94wiFKMT3LMUfUDdst+ykFAmoEnlMACgkQMUfUDdst+ym0zACdFNRn HyKfz+UfOFoigZqU3nIFlk0AoIbxR9zVoJtHj2bDWwp4iVR0sTgv
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 926C3536ABB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37396-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.959];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:email,linuxfoundation.org:dkim,intel.com:email]
X-Rspamd-Action: no action

svdm_consume_modes() checks pmdata->altmodes against the array size once
before the loop over the count, but forgot to check the bound at every
point in the loop.

In the well-behaved SVDM discovery flow this is harmless because each of
at most SVID_DISCOVERY_MAX SVIDs contributes at most MODE_DISCOVERY_MAX
modes, exactly filling altmode_desc[ALTMODE_DISCOVERY_MAX].  But the
CMDT_RSP_ACK handler in tcpm_pd_svdm() does not correlate an incoming
ACK with any request the port actually sent.  Once port->partner is set,
an unsolicited Discover Modes ACK is consumed unconditionally.  A broken
or malicious port partner can therefore drive altmodes to
ALTMODE_DISCOVERY_MAX - 1 via the normal flow, and then send one extra
Discover Modes ACK with seven VDOs.  Because the pre-loop check passes,
the loop could then writes up to five entries past altmode_desc[].  For
mode_data_prime the next field in struct tcpm_port is the
partner_altmode[] pointer array, which then receives partner-chosen
SVID/VDO bytes.

Move the bound check inside the loop so the array can never be indexed
past ALTMODE_DISCOVERY_MAX regardless of how many VDOs the partner
supplies or how the function was reached.

Assisted-by: gkh_clanker_t1000
Cc: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/typec/tcpm/tcpm.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 2cab74ed71a7..8d904a9013fb 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1992,23 +1992,19 @@ static void svdm_consume_modes(struct tcpm_port *port, const u32 *p, int cnt,
 	switch (rx_sop_type) {
 	case TCPC_TX_SOP_PRIME:
 		pmdata = &port->mode_data_prime;
-		if (pmdata->altmodes >= ARRAY_SIZE(port->plug_prime_altmode)) {
-			/* Already logged in svdm_consume_svids() */
-			return;
-		}
 		break;
 	case TCPC_TX_SOP:
 		pmdata = &port->mode_data;
-		if (pmdata->altmodes >= ARRAY_SIZE(port->partner_altmode)) {
-			/* Already logged in svdm_consume_svids() */
-			return;
-		}
 		break;
 	default:
 		return;
 	}
 
 	for (i = 1; i < cnt; i++) {
+		if (pmdata->altmodes >= ALTMODE_DISCOVERY_MAX) {
+			/* Already logged in svdm_consume_svids() */
+			return;
+		}
 		paltmode = &pmdata->altmode_desc[pmdata->altmodes];
 		memset(paltmode, 0, sizeof(*paltmode));
 
-- 
2.54.0


