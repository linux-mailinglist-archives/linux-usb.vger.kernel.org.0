Return-Path: <linux-usb+bounces-37817-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKmCJXGtDmr6AwYAu9opvQ
	(envelope-from <linux-usb+bounces-37817-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:00:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096559FCBA
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 09:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CDB7A303FAA5
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 06:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5BA394463;
	Thu, 21 May 2026 06:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8ojeRhn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD84385D93
	for <linux-usb@vger.kernel.org>; Thu, 21 May 2026 06:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346475; cv=none; b=KEazWGlOGHfskFdw/SteDvj76hoCe5UvX1g8CRWE2Lz2ylfsE+bwZpEH132luqJnyodZfzUskwtyTYMQLm25QRO3EpthE9YHomo8SlMVaMzw/PmCEDxUjg7hEPEpSOtCBqzZ9iAvkd29hq9mlpXdW4stI3v0rfRbNkgH74K0oBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346475; c=relaxed/simple;
	bh=+jL4BkhdXzQXOi9JnNezDMwiYi2z52EuoWjOv6Hx23k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAu4kjQal1I2S7qBPIZRObnYLMJ9LhJs8bjq/oRlE1E4dbJJaZVL5QohtjdSFnPwUD4UpmaTZ0nUMxcee49IyA6Cd7NYbRBAh9tCGi6DODI09Yt7JTK7HF8pg7qFm8Y9cVzVXKpwM+Jjh0cZdSTWUVc0S4mEwHXESnR0NtsVNOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8ojeRhn; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ba4a1a0325so36263655ad.0
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779346474; x=1779951274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=;
        b=V8ojeRhnlUw393LuaiTwxVG71C6IjoXIH2QW+Ml8rSeUrkpnyCDYx65eKAY4ZUnNP0
         gk2IgdCMwu67nTVBRFwYZyufJ8rLE893QtAGmPCMsztb3651zOa42oZDxlEJIhJY6tWt
         PRRUg0JC1K4W0wweYZnS18f6jIvXYicmo5nZet7U6h8o+tvXdqfzYTfN9QTlFzfp5vLg
         XyoP/5IiI0HZzNdxfbcX0tx/apCV9EMVJqTxLgsZ5nvsGB4XSipJzL1UBClIqy96g1EI
         4Kl6ORFgwl3ohOtrJutVLGjW4CO+5/wqQADXssksjOrlnLyiypnlX9Se3EXvTR6t83L/
         kGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779346474; x=1779951274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AaciwSm1L46TIODxCA9aHpcFSHmqvrXKCz/1wzRVFx0=;
        b=M872nE/JT8n4mgN4x3+K9rzYFSkFfyHlMLhxJUKDFOIavoSZgaIrWVEqy4qickZYa4
         D3ozf0amAVKUwDYMowO1uS1PmWscvQQKTe55m4u9ycNTX6OhpGSUgFt6eLFXNZdT+1eE
         DMSCbycGUSVN7cs1RrDi7km96RjnJj0MOl3SdkdsIml3V814uPIk4jO/tUWcW37NUrYL
         QMTn7D3nb93//8Osxq7UbHqEwxa6mli8Hy/EISHeBrGLrHnk+geg4zfGpBIT8D5ZGjRQ
         MF0a3XUCnUB/9udQfwpQ3PtPo7ToIWVZjnxBdLFv+Ph/EvyQ2FzeFgWUPX4AhzUhksIi
         Wofw==
X-Forwarded-Encrypted: i=1; AFNElJ9zF+QvhtKuZ8DE8Pi2IA7c5HDi35oGpbQzHVHwV0bBp3AXYcqVW4TmyixiSrBGfJmvOggPOTdMMAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDMjWsj2LS3sw0MFonHHNmt3U67i5rSeNXmdIyHki/MqA9qMT8
	KIZMtw3xLJRICGYJva+qmlJ5QrFAztphsuMrEUcI8VHNI4H7zvccg0Ac
X-Gm-Gg: Acq92OEp2s0D52n0HMcbWCyi0zt0/xUMC0tMFS5VcEEcD4hsJ0Lm/UsvtMXoP1rp+KJ
	j2OL9JTz411hSVzVluD3qAmv/ucQ+GzZJKh9zCybWniswG/9Al6hOE6z17ydG27Vss7cjg5E4VB
	fWIijQ8KvyFt3cVPSRb/aAVdNIOrBqrO5U0UylvvyHicx1uzwXtuP3bPAmGOZzObbrsJygZESyD
	HTxPLIiNf1mRIz4qZJkN71DjsyNfqqAweHNza7Yf1yGw2o98k+8LDbTmtySgXPZbuQuVbxuFg7i
	8h+IP2yAbxRf/u95TQrSZzYU1k/W1cRA3u8cf4CDEslyV3jGN58IqcdZVvzB3PX9TeZJ1QE4VKw
	LAoNVZFcod1Xlfn47motuaC9cJwov0Ooyqsyw8FH55Cu0lUXKj0ZqP8m0kTX+AySwlqo0ev+Qxw
	hThH8F1ArBFpPFuAXe+YY8vxPCUgttEPLcbfacihDpLS3y6ZM4
X-Received: by 2002:a17:902:e750:b0:2bc:8ebd:af76 with SMTP id d9443c01a7336-2bea2fb709dmr15581365ad.0.1779346473759;
        Wed, 20 May 2026 23:54:33 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fd384sm241757715ad.65.2026.05.20.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 23:54:33 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Lunn <andrew@lunn.ch>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Thu, 21 May 2026 14:54:28 +0800
Message-Id: <20260521065428.3261238-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
References: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37817-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,codeconstruct.com.au:email,harvard.edu:email]
X-Rspamd-Queue-Id: 0096559FCBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

ast_udc_ep_dequeue() declares the loop cursor `req` outside the
list_for_each_entry(). After the loop it tests `&req->req != _req`
to decide whether the request was found. If the queue holds no
match, `req` is past-the-end. It then aliases
container_of(&ep->queue, struct ast_udc_request, queue) via offset
cancellation. Whether that synthetic address equals `_req` depends
on heap layout. The function can return 0 without dequeueing
anything.

Default `rc` to -EINVAL and set it to 0 only inside the match
branch. `req` is no longer read after the loop, so the past-the-end
dereference goes away. No extra cursor variable or post-loop test
is needed.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v3: Switch to Andrew Jeffery's shape: default rc to -EINVAL, set
    rc=0 inside the match branch, drop the post-loop check. Smaller
    diff, no extra cursor variable, no goto. Same semantic fix as v2.
v2: https://lore.kernel.org/linux-usb/20260519080213.1932516-1-maoyixie.tju@gmail.com/
v1: https://lore.kernel.org/linux-usb/20260518073403.1285339-1-maoyi.xie@ntu.edu.sg/

 drivers/usb/gadget/udc/aspeed_udc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 7fc6696b7694..75f9c831b21a 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -694,7 +694,7 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 	struct ast_udc_dev *udc = ep->udc;
 	struct ast_udc_request *req;
 	unsigned long flags;
-	int rc = 0;
+	int rc = -EINVAL;
 
 	spin_lock_irqsave(&udc->lock, flags);
 
@@ -704,14 +704,11 @@ static int ast_udc_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 			list_del_init(&req->queue);
 			ast_udc_done(ep, req, -ESHUTDOWN);
 			_req->status = -ECONNRESET;
+			rc = 0;
 			break;
 		}
 	}
 
-	/* dequeue request not found */
-	if (&req->req != _req)
-		rc = -EINVAL;
-
 	spin_unlock_irqrestore(&udc->lock, flags);
 
 	return rc;
-- 
2.34.1


