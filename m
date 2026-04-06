Return-Path: <linux-usb+bounces-36014-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOstFevA02kalgcAu9opvQ
	(envelope-from <linux-usb+bounces-36014-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 16:19:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F463A3E36
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 16:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1AD1C30087FB
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 14:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7AD37E317;
	Mon,  6 Apr 2026 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ca+3+nMa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC3337DEAF
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775485121; cv=none; b=YNVDAt9CbARFNVlk1b76DdeimZLAzGZN/2WpwsgmmeoW+GnewmShOKEr1wluSWEvedtmBwLeA8KNrScuFqEWLGbvQtrheAHXDsKxECUlLFj2ToWziWdvdp0guPdFC+sNndivQ1A5R+pmOfe9UQXOroZ4QV/dvNd2ofnOxY5K2f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775485121; c=relaxed/simple;
	bh=GeYJ2+Z7mpUM6e9HLyPtuChxjms4WWXJNLx2zcAogXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdDbuSCONTtPZnHJiWhUtculjUf6BncUwiEObNWtrhCyd27XaqkA+KeV0VozHyl5x74Y9xoGTXD5wgvAOif/NhCosOdBX0Jc4fnz3LYRylB62tjPLuX6pQcfRNVZq8AY+Mq2ylfUb4WBtWpZ06OYQ0qa0VBcP4BCMHfYboE1TIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ca+3+nMa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9EAC2BCB0;
	Mon,  6 Apr 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775485121;
	bh=GeYJ2+Z7mpUM6e9HLyPtuChxjms4WWXJNLx2zcAogXo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ca+3+nMaLWG66WjjNhi3shwAWv+RK/u8WMcI/vh+lqoCTiQ+0/IDPSt3jAOP20I9d
	 1e7FMIZChDZfTpsyW0AqbtLVMZ6QVNse4zL3jrhPRQ7kRTSeVNYmYh4cSxr9qd7q86
	 /qgzrQC4ZeoAKGKdWMxxKrzpdMfueHhnnTfb2CL4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] usb: core: config: reverse the size check of the SSP isoc endpoint descriptor
Date: Mon,  6 Apr 2026 16:18:31 +0200
Message-ID: <2026040630-graded-postwar-760f@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Lines: 32
X-Developer-Signature: v=1; a=openpgp-sha256; l=1481; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=GeYJ2+Z7mpUM6e9HLyPtuChxjms4WWXJNLx2zcAogXo=; b=owGbwMvMwCRo6H6F97bub03G02pJDJmXD2xbosRyh9G6ds7m1as/qG89ll+zI5Z/TqiMp2j3+ saljf1ZHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjARy3sM84MNVGJm5G+Y+Hu/ v5HEVl3GaTm12xnmSluKHA3aJBb4N7vnQPe2R/IvXFpCAQ==
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
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-36014-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F2F463A3E36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Reverse the check of the size of the usb_ssp_isoc_ep_comp_descriptor
structure to be done before accessing the structure itself.
Functionally, this doesn't really do anything as the buffer is all
internal to the kernel, and reading off the end is just fine, but static
checking tools get picky when noticing that a potential read could be
made "outside" of an allocated buffer.

Not a bugfix, but a cleanup to keep tools from tripping over this
constantly and annoying me with their pointless reports.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/config.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 6a1fd967e0a6..417140b012bb 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -54,8 +54,8 @@ static void usb_parse_ssp_isoc_endpoint_companion(struct device *ddev,
 	 * follows the SuperSpeed Endpoint Companion descriptor
 	 */
 	desc = (struct usb_ssp_isoc_ep_comp_descriptor *) buffer;
-	if (desc->bDescriptorType != USB_DT_SSP_ISOC_ENDPOINT_COMP ||
-	    size < USB_DT_SSP_ISOC_EP_COMP_SIZE) {
+	if (size < USB_DT_SSP_ISOC_EP_COMP_SIZE ||
+	    desc->bDescriptorType != USB_DT_SSP_ISOC_ENDPOINT_COMP) {
 		dev_notice(ddev, "Invalid SuperSpeedPlus isoc endpoint companion"
 			 "for config %d interface %d altsetting %d ep %d.\n",
 			 cfgno, inum, asnum, ep->desc.bEndpointAddress);
-- 
2.53.0


