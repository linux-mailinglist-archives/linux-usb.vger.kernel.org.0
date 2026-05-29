Return-Path: <linux-usb+bounces-38155-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AVsMdpaGWoLvwgAu9opvQ
	(envelope-from <linux-usb+bounces-38155-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:22:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 893935FFDB7
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 11:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7B05304B55D
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2026 09:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE69D3B6C05;
	Fri, 29 May 2026 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuS/dHYU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9C830C35C
	for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046414; cv=none; b=ss3Z2HHm/ilyCSh78R5RrxAQWGwfwPeZWE46M7HX7YZXg8iRouV9riIcrJHakoJ/UqXbcgLdZQXCFxzC2PtReLA5hOum0F2BvUAVluUDkouMCnqlRA114RdiIY+YlXy6SbZ1kZ6N9CLZSE3ByBeaESg+AgYdKakimQ3Yd1OGFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046414; c=relaxed/simple;
	bh=SduXYvMOr1Mxdux0u6yEm1IWa1tHa3aHCtpIzAtQGYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pVVZpJPeHPRrqWaet7so3zGul3WnT2MjLhpUsOGCLC1twViTrG+HTcISAqgigiyP8hwG0RMGqqln9xnNP7bnbOOQnGjOdaNUlpQ79KUsEa9tFcOb3si9Tw8TKxudJBALdKaXaUYITXGLUdDnsa77aMQB79Bttolk/ITOvugMJy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuS/dHYU; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48fde648a71so91017215e9.0
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2026 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780046411; x=1780651211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OmpeXNIhZYHBBD+mRLzYPY1hvN7hTrOa9XMeYp63a7w=;
        b=iuS/dHYU99lJ4hcCgTgObIgs4cagbPc4MbaSkC1YYkY5AUDiHoBYzaAIMJqFFU6Bhm
         ycTRtujBe5xMRtnWY7bLei68uOibEJXWuYarKKagPSkZWT83W5k93E/k+z8MsvtdG58Z
         /jzLZ/JEDYeuBZ+QYhN8KbdlY2x4FtrDwiiFV4v0mw89nMwX6sm7ZdApMnYg2fC2EGFF
         G8e2lX964nXRFN0ZgqNxqz5iuMx2WqfhW5hlyJuqYu1Ym2WS48dbHPCohPOOztBKuquU
         pAnVjwpU6T/JFy32aKVaq/m//xDq7ozRG0Mi9wqfmEyall0t9uLa9mfrcdS1dRczTbrC
         DgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780046411; x=1780651211;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmpeXNIhZYHBBD+mRLzYPY1hvN7hTrOa9XMeYp63a7w=;
        b=ldp1Tx+ZYZtiWwhjUWtpKtW7cbdjpnhRaFi5ZxNAPxOLIO7M0R6rlQMDPjdE6yYNfr
         yGX5x2XPz4SE9lWuV5n4gIUnSpBHP2kUqxevoVROL6HyLemnoHijeXq70CjEpDUsnc9l
         hxHQprzqOfvtl9zwqDWpzR360KNXy/Y22yC0ttLNrdpWwsBCrQNbKoNyJTm2pZbmsQWd
         A5u/b07O6cTJJAPZ9oySu6KS8FmvXW8qqiMWGRpi9xMAUagIKqbYQ+f6He4DaSI/RFkT
         eXUzw59sI9lw0PfiNTsmosfs0ogvRXekDPF4igMjFtJmUHcDHNlnb+OglR+NlwpF9WyB
         Pecw==
X-Gm-Message-State: AOJu0YyuHCQPE5jmi8HJXGadDosmSNPYQptFxze/VlKifXpPtwVO3m+v
	Xlj0v++o/sItHAIpYKiqtxUGj9Nj51j8PaIpFFE/Bp7qX8CACg5xv4SsSDMyFA==
X-Gm-Gg: Acq92OFuqNEfKAjhvvX3Afk5ysZZTZs7NkFzcizwofOhYdGdDH+HGUum4GUEyotZbiq
	7jnukxNrw3Mbl7s4KrJwZNaToD4nPLjXZMKqmhIlM7DlqaCnKxETIfRZ02t7u/kJfBOvAuCQMu/
	cufNb7RA+D4Byo02yxfBd81M59kbGuWyoQbNnfP9LP+PwQ1hqoCBCw7wMrnFR97cQRLGFFEDTHV
	hDFezuJyQdE/swJkQM7bnXKVWCeDdZOCsaTnamIBYGbXE6YCuJNnO7eYZOKUz2XmwAZMrvpnTap
	w89386ppg/PN2FK+XpRor3oRoweZK6bMJAIb22ZDADFCXiolV0MChynO87FXUGoCi83fnkCzTfN
	/pl+57Fy/+t/fxc6Y/Pg9b1O2zqA99u+Hm9wiwliNE+iNSJJNYVnl1VUYC4C+Q8zXSQdQUz4JsW
	WA6/O8bdAZH6WuKYVGTwroBiPJh/jT2Z+QaM1J5U/5Z9jyDw==
X-Received: by 2002:a05:600c:3b18:b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-4909c62909bmr26319245e9.12.1780046411274;
        Fri, 29 May 2026 02:20:11 -0700 (PDT)
Received: from foxbook (bfe246.neoplus.adsl.tpnet.pl. [83.28.42.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0d5dc2sm13684505e9.2.2026.05.29.02.20.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 29 May 2026 02:20:11 -0700 (PDT)
Date: Fri, 29 May 2026 11:20:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: xhci: Improve Soft Retries after short transfers
Message-ID: <20260529112007.38091066.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38155-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 893935FFDB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A short transfer is a successful one, so reset the error count.
Otherwise, endpoints which always complete short are limited to
three retries per endpoint life rather than per URB.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci-ring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index f0f66e18f174..a067e56d720d 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2544,6 +2544,7 @@ static void process_bulk_intr_td(struct xhci_hcd *xhci, struct xhci_virt_ep *ep,
 		td->status = 0;
 		break;
 	case COMP_SHORT_PACKET:
+		ep->err_count = 0;
 		td->status = 0;
 		break;
 	case COMP_STOPPED_SHORT_PACKET:
-- 
2.48.1

