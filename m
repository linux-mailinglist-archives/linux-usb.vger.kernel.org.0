Return-Path: <linux-usb+bounces-37663-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBNFM2UZDGrrVwUAu9opvQ
	(envelope-from <linux-usb+bounces-37663-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:03:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F36D5799C5
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 10:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFC7D3036726
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 08:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0793E008A;
	Tue, 19 May 2026 08:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knMF0rMG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8E3DFC82
	for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 08:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779177741; cv=none; b=Orft5BKLYD0It/XUH6txLdYzCO0eGMkZH/3+yBKKqRq2yQr+FgJr69EIXoJSjinQirbgwqhJY4v2GqUtHqAa/Bs+L5SATuzQtxwV7o+kd0yBmjgAXukazCSOp5WNqAOxNOA133VzsX/w6A29zNwwb0cjF95RSrFjAt6dloyvlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779177741; c=relaxed/simple;
	bh=TqLfvbGm6KWphZeDm5azOd7a/CiRfeYYJT4IxTyXTrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RyCBVb1uO+yb5Nmwu4K2Yh/oHrmbsjTqXHBnknxGQh13BfykPZmMZ9nDGF+lzLelPNpCcg5hw6bRluQ2wgmmzwo9XnDTq/AR4H6nOWSBF0fYnDNT/HGXQdk6P6eZL6di8hUCsvR2BjfGixOpQc3+gqe/SgN4HKRf3XD2Hjn6lNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knMF0rMG; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso1010509a12.3
        for <linux-usb@vger.kernel.org>; Tue, 19 May 2026 01:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779177740; x=1779782540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+hlBWVPQXy43hiRxqKhCnwnHHiHzFjw8+7rkTfE8vA=;
        b=knMF0rMGSeU76JLUq33zcd5U71jBT0p2yEYxSnuGqSKcXX7cHvaCDajri6A3Xp0u9f
         v7euF6XOqc96A+07/uJWyPEIE/RJXvRO7cBWi6a1+1F4q2i3au7zhIFAjbAGW++arUCj
         +EVuduPJcM8pYyXZNhsgBp8/9neLTlh63XOEiX3Jk+8atYy3HfT2LMfZCRfXyl487RO5
         qhAfCqha7pAjhTxOlp9JCQfZ/n1fIjZbupPgpq02YEDg+TXVVAOuEjsF6xTTkS3NMnnd
         gsEH5ry4JkhTJUpIlbPoP+Jrurk+x1Zte8zPfqj9WE59SwNhVeIwzLO7V+3pijU1VWQQ
         Q8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779177740; x=1779782540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+hlBWVPQXy43hiRxqKhCnwnHHiHzFjw8+7rkTfE8vA=;
        b=cL5sPOdhi5oRUol+CCL7cRzJDlSqiRYdnBUuTIh0FFgy66Ics0EEFaUtN7R8gVz7n6
         ec7LWFCrJXqjXsj2KRLb5COqCXZGC3UKGKxpiuIJwoSYwCfsm7fYXuwiv1nhruHUXQ9m
         s1UkIoXazf/Hh9u9LYeOerF0ZzEiaxomIf8ppdVPLHNwCkjVWPdUYse9hdiPdrPqjVjt
         aR0QLtdvNQ7KONO0+oXyYi+2ERU88XLY7S0vdVSM7jrVHmmbXchjcySsg6m8kw5LuNFJ
         2Jd+tLONerojOruMuhWBNcpwq8bae/blNwvwfBkRoSTNJjNjFOjE6GbYN/mx/6b9oa1s
         Vx/w==
X-Forwarded-Encrypted: i=1; AFNElJ9IiNm7uPlODd6YDKXBaA0u1oNKv6iCp69IS14H7Qs8aObkuc9ihiXBIdR8YVyr+5ADZcTYK0TQ9jQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+WT4/2j2BUUtno5Cfp9n/6sJP931imLA6mF483+1mAY4g7ns
	zv+68Rp3wG7JNH0A9SSk0E1MQBIwm1Jn+R0tlS1n9m+4cUHgIG0E6Cwi
X-Gm-Gg: Acq92OFZEMeC5/38WzUqt8BSIeqQbwMgts9oCguYEXs1TGFMy/HGnHyxkNjXElLTLrB
	OynhsVvRAfq6RaNk/umTVs9YOusUmilLc+cx82R8qLHOjlSLo1hWM2dhwsRcqx6cS+AMzs3m6rU
	KEOzokIjEt1JQBKQpgbyTcqr8kcEawDxLfiJZjrxwy4MCOrilaJV2sdp0J1dgnvdeF0kQ/Ssz3n
	TB0vbeK7VUyOCpQ++Kd/wwCTdTtFYS9gLJ+TGwwXf7MBIExy+0hDja64hEo0x9ibMhpsqCcj1i0
	UkGjWM10O5Ekda2XOPgsspL1sPoDLEgljkxFMHWfpSqtjhWkuz+a+WjSNtrN6QiW+1hFUk7z/7j
	EPzJ/lVMCcJph/qk7HtWad0Co01yk+ElDOUAAcWlocLR8eynSRNd4MtywXVEogbSu2uzLu96b08
	sPa/ODKDzb0PgLKqQTiumkX6ZGmgjnZSFhRm9PWadfWRweXU7z
X-Received: by 2002:a17:902:7206:b0:2b7:aa20:3c61 with SMTP id d9443c01a7336-2bd7e8cb16bmr129248565ad.33.1779177739786;
        Tue, 19 May 2026 01:02:19 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0f8efesm181857735ad.55.2026.05.19.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:02:18 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Neal Liu <neal_liu@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
Date: Tue, 19 May 2026 16:02:13 +0800
Message-Id: <20260519080213.1932516-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
References: <20260518073403.1285339-1-maoyi.xie@ntu.edu.sg>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37663-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6F36D5799C5
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

Walk the list with a separate `iter`. Set `req` only when a
request matches. After the loop, `req` is NULL if nothing
matched.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2: Switch the loop body to Alan Stern's shape: test inside
    the if, assign `req`, break. Same behaviour as v1.
v1: https://lore.kernel.org/linux-usb/20260518073403.1285339-1-maoyi.xie@ntu.edu.sg/

 drivers/usb/gadget/udc/aspeed_udc.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

--- a/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:28.690931576 +0800
+++ b/drivers/usb/gadget/udc/aspeed_udc.c	2026-05-19 15:29:59.482953528 +0800
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
+	list_for_each_entry(iter, &ep->queue, queue) {
+		if (&iter->req == _req) {
+			req = iter;
 			break;
 		}
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

