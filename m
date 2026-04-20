Return-Path: <linux-usb+bounces-36357-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBD4F2pS5mkDuwEAu9opvQ
	(envelope-from <linux-usb+bounces-36357-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:20:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9B442F56B
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:20:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4A5A6303D373
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 16:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73715346771;
	Mon, 20 Apr 2026 16:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HzGsR6WT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF582FD1B1;
	Mon, 20 Apr 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776701706; cv=none; b=YCXQ7CIdKA0ivN04/InTyCsCGO7/DMtLa4CgdfpHDLRHFg4AVUA81RQcZUatY1/sZljiZRVbzJBWU3MJHVvqjCst1aUuq58PHH5LXNe73dLI57+zpB6RySPGB9ChdtAr4PmKr596FAt86aSvKgnTQFl9RkkOB8EHiFvs7ZUgg8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776701706; c=relaxed/simple;
	bh=yAClQ7viy0pdkoODuFLYVq+YeIsI6rgXW6pLrwHGXHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C0Idht3dHkW6oHLCoXCTvJRrp1LwFHXro6+O5lr7NTYs01Ow3WUD8N5rY4XGV/DfbhK08d699Iza28qm675Mx6eAbHiEmmwkHrWtwgmDfr8THT/fqQb5rXF59bS6lHAIpgBayISgxL7CYj3qwYECe5mPgUWiCAOCB4aoqvaliSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HzGsR6WT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8184CC19425;
	Mon, 20 Apr 2026 16:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776701705;
	bh=yAClQ7viy0pdkoODuFLYVq+YeIsI6rgXW6pLrwHGXHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HzGsR6WT63Bt0NCJHya7Trj5wv/qWK9hqKjfdGeunCVusXnuBz5es2XWPnioqC9Xg
	 Y4tv8VYG+Ma+NkUHDEee7rkJHNRAuWTk+MWpVWYiTPH5hL8hqC0MGfBHtZkUgnL6Y9
	 RbNmZDV69OoBFC1wTqpCSBUTbpLf2HD7QFU7bdCY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pete Zaitcev <zaitcev@redhat.com>,
	stable <stable@kernel.org>
Subject: [PATCH 2/2] usb: usblp: fix uninitialized heap leak via LPGETSTATUS ioctl
Date: Mon, 20 Apr 2026 18:11:04 +0200
Message-ID: <2026042011-shredder-savage-48c6@gregkh>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026042002-unicorn-greedily-3c63@gregkh>
References: <2026042002-unicorn-greedily-3c63@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 44
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=yAClQ7viy0pdkoODuFLYVq+YeIsI6rgXW6pLrwHGXHI=; b=owGbwMvMwCRo6H6F97bub03G02pJDJnPAuTrnnHPOnkzrKNbb3N2krHKz4CbkQY3XWeUln7SP 7CrwP9tRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzEto1hnlpfr5DHchlJ16jC JQX2W3m5as40M8wvnLdFZoHfyoqABpW7ZnaMtZe+fD8GAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36357-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 1E9B442F56B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Just like in a previous problem in this driver, usblp_ctrl_msg() will
collapse the usb_control_msg() return value to 0/-errno, discarding the
actual number of bytes transferred.

Ideally that short command should be detected and error out, but many
printers are known to send "incorrect" responses back so we can't just
do that.

statusbuf is kmalloc(8) at probe time and never filled before the first
LPGETSTATUS ioctl.

usblp_read_status() requests 1 byte. If a malicious printer responds
with zero bytes, *statusbuf is one byte of stale kmalloc heap,
sign-extended into the local int status, which the LPGETSTATUS path then
copy_to_user()s directly to the ioctl caller.

Fix this all by just zapping out the memory buffer when allocated at
probe time.  If a later call does a short read, the data will be
identical to what the device sent it the last time, so there is no
"leak" of information happening.

Cc: Pete Zaitcev <zaitcev@redhat.com>
Assisted-by: gkh_clanker_t1000
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/class/usblp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/class/usblp.c b/drivers/usb/class/usblp.c
index e9b848622a3a..746414763da5 100644
--- a/drivers/usb/class/usblp.c
+++ b/drivers/usb/class/usblp.c
@@ -1178,7 +1178,7 @@ static int usblp_probe(struct usb_interface *intf,
 	}
 
 	/* Allocate buffer for printer status */
-	usblp->statusbuf = kmalloc(STATUS_BUF_SIZE, GFP_KERNEL);
+	usblp->statusbuf = kzalloc(STATUS_BUF_SIZE, GFP_KERNEL);
 	if (!usblp->statusbuf) {
 		retval = -ENOMEM;
 		goto abort;
-- 
2.53.0


