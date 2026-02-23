Return-Path: <linux-usb+bounces-33546-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEoHHV43nGnsBQQAu9opvQ
	(envelope-from <linux-usb+bounces-33546-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:17:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F101755C4
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07D13303980D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66E235DD1C;
	Mon, 23 Feb 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="n/gSy/W+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8C2DB78E;
	Mon, 23 Feb 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845460; cv=none; b=CRqqUClpopA7mHBd7yQXJCop9S2RXqioI/b2wjywX7Cjxrp3+n4o0qumcT8j3QJv+Z7xDbCpyWDEB9R7sz09M0lrzueDNdcvL8AxwhNQ+jvhdkjr12u4ZbxXKzvyw4+1dt07SWMaMks/aNIJOxWlYzLaBhIz2NF5EtwJ7rfgrmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845460; c=relaxed/simple;
	bh=OEhR7fs7Ght3DkeUoZ9h9YopFiYrGR95NurfdI4BB/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvWgcRRAH6BpUAmhtysa9rMXbmu0w+WOYhf18RBbBlIFsMKSsB7ZQfGAq8+wI0Oekxh8iJj8OYO0NHvr5ivzMsujZGVsEqIquMArvXzXOwDuhRvRpL5xYaArpWTaL+AteUuAbat2KCu7K5guOveBrd+7jj/UH5t7Q4tQYJhgVuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=n/gSy/W+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D20C116C6;
	Mon, 23 Feb 2026 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771845459;
	bh=OEhR7fs7Ght3DkeUoZ9h9YopFiYrGR95NurfdI4BB/I=;
	h=From:To:Cc:Subject:Date:From;
	b=n/gSy/W+Y4ULFZazi1spq3ilEImPTnVa49z+FHPCG9/OAyZ5L58Y5En83HQjyvZgA
	 iiWzc1gMbK2Xp7km8DOkH1JmDZG/zEvyLn2Gzcyzbavk/O4EOO9NSRxtBemFLWqZ48
	 f8WB9+gKqgaPK2lLSOJmqvzVgjyM0gKPXtDbwGW0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@kernel.org>
Subject: [PATCH v2] usb: misc: uss720: properly clean up reference in uss720_probe()
Date: Mon, 23 Feb 2026 12:17:27 +0100
Message-ID: <2026022327-exhaust-constrain-e21d@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 32
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=OEhR7fs7Ght3DkeUoZ9h9YopFiYrGR95NurfdI4BB/I=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlzzN1nKd5MVVh1uvzji0WneydI+InZxvjo3ry2KGX3z zX8XF3KHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARJzGGORwHqy9+iUhnq3m+ Z4HrdW/eZxMFdRnm1/5ukdFnTY9wdV3bK3jyusyLzxuVAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33546-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17F101755C4
X-Rspamd-Action: no action

If get_1284_register() fails, the usb device reference count is
incorrect and needs to be properly dropped before returning.

Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_2000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 v2: properly clean up the previously allocated resources by jumping to
     the error path and not just retrning directly

 drivers/usb/misc/uss720.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index ec8bd968c4de..54107bf280df 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -735,8 +735,10 @@ static int uss720_probe(struct usb_interface *intf,
 	 * here. */
 	ret = get_1284_register(pp, 0, &reg, GFP_KERNEL);
 	dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
-	if (ret < 0)
-		return ret;
+	if (ret < 0) {
+		usb_put_dev(usbdev);
+		goto probe_abort;
+	}
 
 	ret = usb_find_last_int_in_endpoint(interface, &epd);
 	if (!ret) {
-- 
2.53.0


