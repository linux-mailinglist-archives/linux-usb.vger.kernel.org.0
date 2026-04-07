Return-Path: <linux-usb+bounces-36041-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIwPOH7G1GlbxQcAu9opvQ
	(envelope-from <linux-usb+bounces-36041-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 10:55:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C3D3AB985
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 10:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 777AE300D0DA
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 08:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E72AE39B960;
	Tue,  7 Apr 2026 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dn9LnTiY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679E439B947;
	Tue,  7 Apr 2026 08:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775552109; cv=none; b=FbxD7aunUV6z07AX903DsU2Rdh5Y+MoQFyf1bgpp9BZmtX3e4v7XoONFqUgF5avAHw7dR2bgoc8WOP0f80Ri36eMo2o8PNFnEWjmFF0TWXwq5G5YSGHfgjYiTG5h6d2HPdlJ5yVcyuJV/gg7KqGOzRfx3QajUJjNxPWTEcRdBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775552109; c=relaxed/simple;
	bh=GuKln7VYxHIG8btwCkuLT0R/K1AI0ImWbV7M1cCDesI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=at50NUVFiDn9/5kc8VUKDeRsQd3szT1p7AvNhQy8riMm2ygVbivOVw/UeybVnMOI0Im48vZHLMyQeosa78duthZgkEC+v0YYINqsKiqeOvhjEnfgTDcWO+IimcF5/ifnMjug7hqbbnDBcrEttQdPtGd10LLToW0eSET6b0yz0jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dn9LnTiY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B857C2BCAF;
	Tue,  7 Apr 2026 08:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775552109;
	bh=GuKln7VYxHIG8btwCkuLT0R/K1AI0ImWbV7M1cCDesI=;
	h=From:To:Cc:Subject:Date:From;
	b=dn9LnTiYaVNnX+1p4Taeij1Wlx6Z3lZOxtArL/Sr8GAkRT7BAJ7k8xGzJngJ9juFP
	 1SP9kj0Vvo6E2RA+l82XFfhiS7DXVq+xXzhbA0/9GUiBUovI8dBxFX6gjMzm/Tszyw
	 3FHG2ciJAEXX7liWeFognn6E5zgPoFXktKyN4Gjg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable <stable@kernel.org>
Subject: [PATCH] usb: gadget: f_phonet: fix skb frags[] overflow in pn_rx_complete()
Date: Tue,  7 Apr 2026 10:55:05 +0200
Message-ID: <2026040705-fruit-unloved-0701@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 46
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=GuKln7VYxHIG8btwCkuLT0R/K1AI0ImWbV7M1cCDesI=; b=owGbwMvMwCRo6H6F97bub03G02pJDJlXjmWyspT0Htncnv8syvO9kozpq/Y9PW/n2wYt1Eit+ VKxd1dRRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAExkzX2GBddU/hVUbTxcy262 QCMwuZ+JadINeYYFPSb+rMzstuJGL+I2HGDekB/OJy8KAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-36041-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: A8C3D3AB985
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A broken/bored/mean USB host can overflow the skb_shared_info->frags[]
array on a Linux gadget exposing a Phonet function by sending an
unbounded sequence of full-page OUT transfers.

pn_rx_complete() finalizes the skb only when req->actual < req->length,
where req->length is set to PAGE_SIZE by the gadget.  If the host always
sends exactly PAGE_SIZE bytes per transfer, fp->rx.skb will never be
reset and each completion will add another fragment via
skb_add_rx_frag().  Once nr_frags exceeds MAX_SKB_FRAGS (default 17),
subsequent frag stores overwrite memory adjacent to the shinfo on the
heap.

Drop the skb and account a length error when the frag limit is reached,
matching the fix applied in t7xx by commit f0813bcd2d9d ("net: wwan:
t7xx: fix potential skb->frags overflow in RX path").

Fixes: 9732d5232335 ("Phonet: USB CDC Phonet function for gadget framework")
Cc: stable <stable@kernel.org>
Assisted-by: gregkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/f_phonet.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/gadget/function/f_phonet.c b/drivers/usb/gadget/function/f_phonet.c
index 2c007790ead2..b1ee9a7c2e94 100644
--- a/drivers/usb/gadget/function/f_phonet.c
+++ b/drivers/usb/gadget/function/f_phonet.c
@@ -333,6 +333,15 @@ static void pn_rx_complete(struct usb_ep *ep, struct usb_request *req)
 		if (unlikely(!skb))
 			break;
 
+		if (unlikely(skb_shinfo(skb)->nr_frags >= MAX_SKB_FRAGS)) {
+			/* Frame count from host exceeds frags[] capacity */
+			dev_kfree_skb_any(skb);
+			if (fp->rx.skb == skb)
+				fp->rx.skb = NULL;
+			dev->stats.rx_length_errors++;
+			break;
+		}
+
 		if (skb->len == 0) { /* First fragment */
 			skb->protocol = htons(ETH_P_PHONET);
 			skb_reset_mac_header(skb);
-- 
2.53.0


