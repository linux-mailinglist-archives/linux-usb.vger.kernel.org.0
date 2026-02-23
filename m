Return-Path: <linux-usb+bounces-33557-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EOMDCJGnGk7CgQAu9opvQ
	(envelope-from <linux-usb+bounces-33557-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:20:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 440841760C4
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 13:20:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E82B5302641E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC60E365A02;
	Mon, 23 Feb 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QiNF4z0q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410743612E4;
	Mon, 23 Feb 2026 12:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771849199; cv=none; b=sXbTUhmrLzPWXlHQEIjTi8T8IpDg6TsnmtgElMvbVqySPtaetEWetbu/IiOPQ5+fZ2BPYNwL8BRgRIxSEs73fo/S+EsvfFKiu8eBEHvDLbKCnbhH5+9CA38NBmfHEcQNCTpr8TJpzaRdNVslB6dWwLUqhA9HIbWhn0cuOe4VoHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771849199; c=relaxed/simple;
	bh=9a6QzfT+S907FKeN4T36MrS2698Zp2Bqojq02FRqal8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5o4GYr5UuWujZ5QcwWCUoMeZs7MywvwiAgUABw1JzYF/Ye/okG1gehh+FGcsyU3eLzh20/idttbu8E1eMY96an8rWt1Pkj83C2tw+iPu6kJ8xMwc+83wcnpoLP2TqSzMX9BccmFbm3+lfgGoGrnuisxCLMdE+axHSazOL1hJvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QiNF4z0q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF898C116C6;
	Mon, 23 Feb 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771849198;
	bh=9a6QzfT+S907FKeN4T36MrS2698Zp2Bqojq02FRqal8=;
	h=From:To:Cc:Subject:Date:From;
	b=QiNF4z0qPMLlc7NHP8PrB8HhLFHqsgLDyvXvG/W3G1CqY6n/vs57Yz8sxEURDzfas
	 yuJL1qhO3Ev3qpH91oQncu6lgN8qz/ZlKsoUDo2ZQXDJVfPsdC1QhMujtKvcv3Yyhc
	 RLG68xtoGtSzxbNsCL/AW62eucmaGXQQQ0xOe/kk=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	oneukum@suse.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@kernel.org>
Subject: [PATCH v3] usb: misc: uss720: properly clean up reference in uss720_probe()
Date: Mon, 23 Feb 2026 13:19:43 +0100
Message-ID: <2026022342-smokiness-stove-d792@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 32
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=9a6QzfT+S907FKeN4T36MrS2698Zp2Bqojq02FRqal8=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlzXO+xH2z+qBjwvvVZY0YJ/6UjmrNkp/wXtCw3u+d9Q 3e+maNvRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzETJhhDo/JXf4/ao4VCxeE rtDuU/1y5lPaLKDofZeze1usnSxfXN/GxnPk/7ues/sB
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33557-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 440841760C4
X-Rspamd-Action: no action

If get_1284_register() fails, the usb device reference count is
incorrect and needs to be properly dropped before returning.  That will
happen when the kref is dropped in the call to destroy_priv(), so jump
to that error path instead of returning directly.

Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_2000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v3: don't drop the reference count manually, it will be done in
    destroy_priv() as pointed out by Oliver.
v2: properly clean up the previously allocated resources by jumping to
    the error path and not just retrning directly

 drivers/usb/misc/uss720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index ec8bd968c4de..a8af7615b1bf 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -736,7 +736,7 @@ static int uss720_probe(struct usb_interface *intf,
 	ret = get_1284_register(pp, 0, &reg, GFP_KERNEL);
 	dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
 	if (ret < 0)
-		return ret;
+		goto probe_abort;
 
 	ret = usb_find_last_int_in_endpoint(interface, &epd);
 	if (!ret) {
-- 
2.53.0


