Return-Path: <linux-usb+bounces-33543-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vQ5rMNEAnGn6+wMAu9opvQ
	(envelope-from <linux-usb+bounces-33543-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 08:25:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5168C1729D5
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 08:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A251300AB19
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 07:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC87E349B17;
	Mon, 23 Feb 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DHDIi2ch"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2911B78F3;
	Mon, 23 Feb 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831502; cv=none; b=FxryzeYKMcnTPCMIACVmM/hfa1W5HFmhDSiLXqmz/W9wL0mpmJzBNotudj/Mzpxhd1PE6CrJK5xshfaFz+TrrSWi5VTrI9525tzaHAeznIS04pjV9CLwDFY7wV7dmSWeSi3sPXLvBXbpI7vMs/Vc3/2gz6SpyTMdMe0th7OeZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831502; c=relaxed/simple;
	bh=hWIqW7jHJ2VQUUBr1GTcCPfrrQUzpLq/f/OjUWUeCe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAQRozk8oUzYXeYFXnusBjfwoxgC9+g5egszlNvTDXeo4zKaXduu0oQiFEmiQLpCKykFBexlgJe5SezN7kkN3KJi/PFIgFxCvKfIBF0nj9jyzuN2zyCIKCOUNNMncsmRU/M+97nLSKZqx/+2Tb1ZEYfx4Pm5Kr+btM4lUMl3J70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DHDIi2ch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78568C19423;
	Mon, 23 Feb 2026 07:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771831501;
	bh=hWIqW7jHJ2VQUUBr1GTcCPfrrQUzpLq/f/OjUWUeCe4=;
	h=From:To:Cc:Subject:Date:From;
	b=DHDIi2chypdDmuZZ48ox8r4UVz9a5hU5xX7zc3VBylZiC4qsnAMnN0y6D+20OG6VH
	 nZut0quRst/soznB2ukLEtXu5PbQRAue1995G/W93vjXaqtrwyuS7ab+O221/i99MH
	 ommxVkFoj0F4aTDVovA08wiOQIcHTBAiSCfz+4bw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@kernel.org>
Subject: [PATCH] usb: misc: uss720: properly clean up reference in uss720_probe()
Date: Mon, 23 Feb 2026 08:24:55 +0100
Message-ID: <2026022355-swaddling-cancel-0f3c@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 28
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=hWIqW7jHJ2VQUUBr1GTcCPfrrQUzpLq/f/OjUWUeCe4=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlzGI4nbO1/VNVqXihwPGeS6BtbB+vmv9bvt1homeT2N NikXD3TEcvCIMjEICumyPJlG8/R/RWHFL0MbU/DzGFlAhnCwMUpABM5/5lhwfT79c1vL4ub79t4 6tUDo3M7P8R8nsIwP0wpVMJpxZ3TtppLZztNNj/QtCaeEQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
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
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33543-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 5168C1729D5
X-Rspamd-Action: no action

If get_1284_register() fails, the usb device reference count is
incorrect and needs to be properly dropped before returning.

Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_2000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/misc/uss720.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
index ec8bd968c4de..2d681eee1f99 100644
--- a/drivers/usb/misc/uss720.c
+++ b/drivers/usb/misc/uss720.c
@@ -735,8 +735,10 @@ static int uss720_probe(struct usb_interface *intf,
 	 * here. */
 	ret = get_1284_register(pp, 0, &reg, GFP_KERNEL);
 	dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
-	if (ret < 0)
+	if (ret < 0) {
+		usb_put_dev(usbdev);
 		return ret;
+	}
 
 	ret = usb_find_last_int_in_endpoint(interface, &epd);
 	if (!ret) {
-- 
2.53.0


