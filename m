Return-Path: <linux-usb+bounces-36043-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO1bMJ3I1Gk0xgcAu9opvQ
	(envelope-from <linux-usb+bounces-36043-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 11:04:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 235DD3ABB8E
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 11:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30069302ED6B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 09:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95FFF39C015;
	Tue,  7 Apr 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vrDVSkck"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1E239BFFA;
	Tue,  7 Apr 2026 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552578; cv=none; b=Nwio4sT5bHlDa+CUW/2xmi2mWCFmgIgirSCfpnJGz+Nm2+HU5+eZnSr80LVmdX2DND5EKeSxuSaS482FMpKAI6VYx6q/zp9/nvbor1l4TeQ4wMMnBqWGd0MFziji6yD6WPKCdv1LU6nEfnREBdx7v8kzpjyyW50MKg9VF9xvtGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552578; c=relaxed/simple;
	bh=4eCu6s3ylL4mxk7UgpvHvsBWStR0WmdKNJ7N+HlkCSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hkY+UpxkR1GYTM8YVAVum9S+VY1Q5tmgwDbbIpRWL2bFrLKePENq68TZ81BjW088fBp6/aBOuBPCRgHUTaLbfUrbD+jMpWfjsoQk2UXeClZkTdYgylJ76sy4JGk4mdF2uIlT40mWmV+e0DsLImYufvqXdVmFabO6wQx0Sv9kPS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vrDVSkck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28AAC116C6;
	Tue,  7 Apr 2026 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775552578;
	bh=4eCu6s3ylL4mxk7UgpvHvsBWStR0WmdKNJ7N+HlkCSo=;
	h=From:To:Cc:Subject:Date:From;
	b=vrDVSkck6Am6WK2Ry6TJzQIx5RgN+EEyhv4M4mwdhv8wViIm/R1nXvEom15cDpc9o
	 tg57r4pjcDkVo0FZ4g0/Vq9ZbZhy6Xngdxc2YXbFfSxgDp36DhsBDGEg2QVqtNF5B4
	 l5KsyDHSbthrLr2QX2nhSyHIlLa0tbE0h9Unf9VM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@kernel.org>
Subject: [PATCH] usb: gadget: f_ncm: validate minimum block_len in ncm_unwrap_ntb()
Date: Tue,  7 Apr 2026 11:02:54 +0200
Message-ID: <2026040753-baffle-handheld-624d@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 45
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=4eCu6s3ylL4mxk7UgpvHvsBWStR0WmdKNJ7N+HlkCSo=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlXTth1cW0XWnZkjs/Ps3OCTyZLyLpmLmx8x8gZ/8u/b pG9cmxYRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAExkpg3DgjNW6349CpZ7qOX5 Y3fWg4a8elddEYYFq5wCZW8J7ajWn6/oFhUqaf/iv9YnAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36043-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 235DD3ABB8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The block_len read from the host-supplied NTB header is checked against
ntb_max but has no lower bound. When block_len is smaller than
opts->ndp_size, the bounds check of:
	ndp_index > (block_len - opts->ndp_size)
will underflow producing a huge unsigned value that ndp_index can never
exceed, defeating the check entirely.

The same underflow occurs in the datagram index checks against block_len
- opts->dpe_size.  With those checks neutered, a malicious USB host can
choose ndp_index and datagram offsets that point past the actual
transfer, and the skb_put_data() copies adjacent kernel memory into the
network skb.

Fix this by rejecting block lengths that cannot hold at least the NTB
header plus one NDP.  This will make block_len - opts->ndp_size and
block_len - opts->dpe_size both well-defined.

Commit 8d2b1a1ec9f5 ("CDC-NCM: avoid overflow in sanity checking") fixed
a related class of issues on the host side of NCM.

Fixes: 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index a6fa5ed3d6cb..c5bf8a448d64 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1210,8 +1210,8 @@ static int ncm_unwrap_ntb(struct gether *port,
 
 	block_len = get_ncm(&tmp, opts->block_length);
 	/* (d)wBlockLength */
-	if (block_len > ntb_max) {
-		INFO(port->func.config->cdev, "OUT size exceeded\n");
+	if ((block_len < opts->nth_size + opts->ndp_size) || (block_len > ntb_max)) {
+		INFO(port->func.config->cdev, "Bad block length: %#X\n", block_len);
 		goto err;
 	}
 
-- 
2.53.0


