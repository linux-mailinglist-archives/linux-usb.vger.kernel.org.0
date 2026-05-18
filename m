Return-Path: <linux-usb+bounces-37579-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP/8GqrCCmoI7gQAu9opvQ
	(envelope-from <linux-usb+bounces-37579-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 09:41:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D430567EBF
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 09:41:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FBEA307D795
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 07:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF563E0C75;
	Mon, 18 May 2026 07:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0cMeAlT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224683DDDD8
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 07:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089651; cv=none; b=RA1Usr4TBZrXeYbr1LotfakoFLIshb7CA1X39MugbxpJNlO26C6Qr6iW0K0Ngu0RyA/zO1vtusuMufv07IDJjW937T71fAYAxk7aBSS/RwYvluUBs8U9qsyR+fHYeHdevGX9PMo0Bo/2L9bUqEJ0Rszr1HbAfaugdTVqtfYfqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089651; c=relaxed/simple;
	bh=dANvS/gBKyv4N9UelCDiQXk+Xnfh5orZMtFTpg4cCCo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U5vO5ysQpFkaaINDWwp8P8z15PnRtQMWWx+tXFW0K9rAx0MLkBVRFf9qFygHfkFtJ25UZop1h5QYaQRfFq2FWDzmx+ccPa/ZpUNCe7FQvOeQ32UcF+nQzWh/gzX6VYUeNlC+PQCGvWaY7jO4bMLnaSbjADAUAGpXhzgmjRbV7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0cMeAlT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-83537a80ab6so1326683b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 00:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779089649; x=1779694449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=;
        b=I0cMeAlTiGsTQQyL3bp7Tgj7V94i1wy1uIkyrNEPAJeRQ4jI5h0DUVVdEZxqoncQkY
         a6KUkv4hAuSsXeI+W7MIUTp8sbOZ/KITTYv9fCSThGesWpUrInB02Ws6yAo4g5XEKI+Y
         G3zoubSLK7Q48uVrPSOVCXxPsQ0P0QRFuUMK9bS3wW36hxffkENN842H3ESynpiCTTZ2
         WhffX8CP/A1GUB/iwme4FLgVCNtM1PBsqIeyIU+/+OGSJRT2kpZHNPEyDq9UK2sEW3mU
         EPrnbK3sbhnqzE6E8J+Krz19xrYoHIJRktvlfIQ1rlZhP9nfEyS0LgH2+axGI9h3ouzD
         p6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089649; x=1779694449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feqASc44QbNe6VCpQPPDc88UHJTnZ4FT1o849ySLP3c=;
        b=kyMFs7M+zMoeYhITfUEdadjOfCLDBzJDSNcifxdzJxoCzJp2v8Hz7tbkeNj2NFUUl2
         jLSljk4qJ+660XIAY+72LfjexaIXHNFTEfuc8UDGHacK+Hud+nvXpwKtZyK9uucbCPVe
         JvTwpPYB7n6sx8TEPQ9XvgAMss+bAu1QBoJtzhOdpEu5HSmYjmN5XD1fXilG51Xp/0/B
         Xbjqa+ThJglGqEHUYbKjcOAbGbBAjJMS2BuY3yfLDc7CyAsac6dkM6r2ClV8hlIV0ALT
         V7/zG6KiY/8GecIDRBuVN7YBtVFEHLKXfR+Q1Z9xf+2NtF1kXMNXgBQTMbw1aCPbYinq
         eVaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2Uku6bd0ggFb2NMBWxB50iNaelYnzTNZjOKTWwQfZeyXHbsEcjPl08+DCU/zt48K+JVCxlKAAuFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YytfVeu+8C2rKAIUtbcTSIDTBaV6iiBv+Tv5ltMAcBAJDCuaJPD
	wgIcx5Ib7TaqwmcrMtxDJHRkdDoUO2lmCuaB78cX4IX4ZJo/67zgADIh
X-Gm-Gg: Acq92OE/lk29Jrn5e9RpcAp0uvhByv5WzpyZ4dqpD/Om1Bzerbr/5YkxojQrxCdxwxJ
	Jtwoxqw2/tBnQM9rEaPv7Q/WLpFL+L1lJBqbZuAWMloFqu++xVgCVOyhQvp18cDgic9zwU3Owp/
	/ADfoKIfODH8dnNlrmZS1P8o56YMwjHfZxaFZCz83CfX7dgfg9x/9dDbX7OnSZTVvNz97GOKx63
	IFdYEuJvIP0WY98Xvo8RDIBu3dIZzBAr2U9iIAaJYTSKPajo/Pg9263dzHq3XFyMmy5KO6s/yLf
	4Fv150OW+o2pI6rifc8kO5vNA0/kGxlL1f5YWTIGNBtqWaf2j5UAgnQ+jo4ZcQq9aW4cDfYh8ct
	y3fytYkEDMSIFdrdL+e4vPEoScD4tY+/E7NmeKCKew4IndnZCWl5wx/oxsyqnV4nXslhA2IZZ6B
	8yFUXqOmxZliL/DVt8NDajuCGQN2M7ZzNpbbiQwU8uqHWNBg==
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr13925885b3a.1.1779089649248;
        Mon, 18 May 2026 00:34:09 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775ca3sm14500746b3a.14.2026.05.18.00.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:34:08 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
X-Google-Original-From: Maoyi Xie <maoyi.xie@ntu.edu.sg>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Mon, 18 May 2026 15:34:03 +0800
Message-Id: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2D430567EBF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37579-lists,linux-usb=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[ntu.edu.sg:server fail,sto.lore.kernel.org:server fail];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-usb@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ntu.edu.sg:mid]
X-Rspamd-Action: no action

From: Maoyi Xie <maoyixie.tju@gmail.com>

ast_udc_ep_dequeue() declares the loop cursor `req` outside the
list_for_each_entry(). After the loop it tests `&req->req != _req`
to decide whether the request was found. If the queue holds no
match, `req` is past-the-end. It then aliases
container_of(&ep->queue, struct ast_udc_request, queue) via offset
cancellation. Whether that synthetic address equals `_req` depends
on heap layout. The function can return 0 without dequeueing
anything.

Use the cursor-vs-result idiom from the sibling aspeed-vhub driver,
ast_vhub_epn_dequeue() in drivers/usb/gadget/udc/aspeed-vhub/epn.c.
A separate `iter` walks the list. `req` is set only when a request
matches. After the loop, `req` is NULL if nothing matched.

The same idiom is used by the other UDC drivers in
drivers/usb/gadget/udc/ (at91_udc, atmel_usba_udc, dummy_hcd,
fsl_qe_udc, fsl_udc_core, goku_udc, gr_udc, lpc32xx_udc,
max3420_udc, net2280, omap_udc, pxa25x_udc, pxa27x_udc, udc-xilinx,
bcm63xx_udc).

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/usb/gadget/udc/aspeed_udc.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -692,26 +692,30 @@
 {
 	struct ast_udc_ep *ep = to_ast_ep(_ep);
 	struct ast_udc_dev *udc = ep->udc;
-	struct ast_udc_request *req;
+	struct ast_udc_request *req = NULL, *iter;
 	unsigned long flags;
 	int rc = 0;
 
 	spin_lock_irqsave(&udc->lock, flags);
 
 	/* make sure it's actually queued on this endpoint */
-	list_for_each_entry(req, &ep->queue, queue) {
-		if (&req->req == _req) {
-			list_del_init(&req->queue);
-			ast_udc_done(ep, req, -ESHUTDOWN);
-			_req->status = -ECONNRESET;
-			break;
-		}
+	list_for_each_entry(iter, &ep->queue, queue) {
+		if (&iter->req != _req)
+			continue;
+		req = iter;
+		break;
 	}
 
-	/* dequeue request not found */
-	if (&req->req != _req)
+	if (!req) {
 		rc = -EINVAL;
+		goto out;
+	}
+
+	list_del_init(&req->queue);
+	ast_udc_done(ep, req, -ESHUTDOWN);
+	_req->status = -ECONNRESET;
 
+out:
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return rc;
-- 
2.34.1

