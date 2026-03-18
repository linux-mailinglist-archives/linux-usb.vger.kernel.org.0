Return-Path: <linux-usb+bounces-35009-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLq+NdYkumk3SAIAu9opvQ
	(envelope-from <linux-usb+bounces-35009-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:06:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E75242B5A8A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 05:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E437D301CEC1
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 04:06:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D02933D6D6;
	Wed, 18 Mar 2026 04:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLHOntPQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958F9339872
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 04:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773806798; cv=none; b=PscmniuFEkWegqsD3x3gmTqtxddZKJVCAMk8m53ERmJqrRGYTWJC0SOnNMjYpd3nGb6DrdiDmbOOmzhwuhPSQB8u8T2QpG9P7LpvVzKhsGuqu1TTDl9fTFqpkUinA0w3w8/igm4kP/Ew+zz+A7GXUlpQgtLT9QO1asCa0fTeJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773806798; c=relaxed/simple;
	bh=6S8H3E+I5jrhkdb7Zg7GN9kN6TEFWvKeGaf2Fg5+mis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZsXzk5GHiP2c+vpy0+VO0Y7eZ9Suq9cFYn1Zc5zWav0XJnnzxYkV2FVyytqcOR78AQ4uIrF4RszbGxNPLyk7QWZEO0/KDQ6MTrx1CPfypeKn0vSJsI7F/b+hg3JTTIq7JdmX7eUY0zThiMnVrgfr1Wo9KMCMePNOZe7/hAvLLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLHOntPQ; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-79a5a37113aso25403447b3.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 21:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773806797; x=1774411597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5febONs6DrEdwVAiln+ffrvvThmSM7RqYP6DaP7WAg=;
        b=BLHOntPQIeUlN6ZOHySf4L2NbS5FMTENb9SSzjajP/FtAVBLmfbbmWf2YhfVrhTnUs
         a+SkAvSLEadbWK/Fjbrc6+lQ6TmGcNa8hDX/SYQmpCidK1S9bXUTl9Up1pCApW1hFN5H
         jUytPCMsDVeb2V65m+T6vl2XpAMcmd3vyCJCsvgPU+N8ofU93h4mAWMYr+atTzqtJkcQ
         FXzyRMe0nJHd9FdpXvadQJyOVQRWXgVJRVwYoOX7v5Vk+GgW4RBfpBjDDuWyZwOgvR8M
         1bAeL23R7TbGh57XNqMqUAUzRgXxqO7EEAdpO681CNAiz+7pPLHZV7lTDJJpAHcoCp3y
         RmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806797; x=1774411597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F5febONs6DrEdwVAiln+ffrvvThmSM7RqYP6DaP7WAg=;
        b=oLfPTAnU4g1LQLIGIbXa4yWaXhmXadB2FBzuTl+CJ1q5UuGPDHDIznF/QynNxoeX1B
         zWONuw5UGjpVe0s2Fd6yFqQZRskIP93dvfJV8YRjaSzOJnFrJX70jEHfSC/uzbHy2aan
         KVTsHiGKZrdZJefhp6C05N4XPUCRsNQVpevuhcUhnblvztl3MI6Z6BJ+356oH9VfVZWF
         tusC+ZuO2p0AQFzOCSbRgWUf8F5d8GojNpUs089l0bbz/ha53U4b33I4SPYG0iGE1kZP
         6cK8d/8VjKMZkJT6n3+VJ4cOVZpGQZLx+gzrj/r7U3m2K0n7MkG3cVaOdnsOET6V6ko4
         Yutg==
X-Forwarded-Encrypted: i=1; AJvYcCXWlNxr9rLrk2RrYBxYVU+jOHuJ1xNbztEsrbyR/z9Q/WJYVuCcogfZc5dejwBi+24luG6R4rFexvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBDkQF4Qx2C5Rnhy28HYOjCGEXOXGd/arMTRbYQ9wDP6AEhBqY
	4qQNDBdnHl0/AjwkfkWzkIzpT1ukSKvIqM5KXA/ox32YkepW4E4cogZ0
X-Gm-Gg: ATEYQzyb+Pk8MAOBIGyjeF5Z0kgoMT8YHp/gFzzcEjHwlWWnserlp8ljuwMREJ5lprq
	k76oyz3RTEIco6iAxEVUZV5DI+rgkzWJRq7buA+xFq7SWYhITIAJIPVLxyzVsXTxXFphfAU7xRg
	E46CZt1h0nZZ69LiT8BfMI+aMpFXKB0RBYzOZ6Pka3sKGBGXharwuDJj40Z8cJpyh9tBSgAfxZh
	OAZLomY/61Ap0jACHLMJIEiUqXpD1PPULBEkjAgfuR8EgJvdQVcbyMO6jVbi/jldq0qXFEXPJDw
	uvVy4V4ReWGqZwmrxj2jUEWQuBwWEbnWE9uYFAc7C/r4gO/V8k9XxZ0cciSVokGjD3KrajTfTQK
	TDQdmv/r/ZVH3mVW+yK16IxZy42IpNffaELtuTg/iVlc06ikgmIcGgTRyg9j9ONePaHXvdgSprL
	ox9rtC70uGA24D6sMbtkjk98jJsrfHFjw9lhdbsAs2L16SpikljJ/82mI2xXk=
X-Received: by 2002:a05:690c:e00e:10b0:797:f226:3a80 with SMTP id 00721157ae682-79a718cc7a0mr16015197b3.26.1773806796735;
        Tue, 17 Mar 2026 21:06:36 -0700 (PDT)
Received: from Computer.attlocal.net ([2600:1702:6f11:2d0:7876:bdab:8062:a5f9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a713fe5adsm10228307b3.19.2026.03.17.21.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 21:06:36 -0700 (PDT)
From: Omer Zalman <omerzalman42@gmail.com>
To: oliver@neukum.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	Omer Zalman <omerzalman42@gmail.com>
Subject: [PATCH 2/2] net: usb: cdc_ncm: prevent silent u16 truncation in min_tx_pkt_store()
Date: Tue, 17 Mar 2026 23:06:32 -0500
Message-Id: <20260318040632.69531-2-omerzalman42@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260318040632.69531-1-omerzalman42@gmail.com>
References: <20260318040632.69531-1-omerzalman42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35009-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[omerzalman42@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E75242B5A8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

min_tx_pkt is a u16 field but the sysfs store handler accepted any
unsigned long and assigned it directly. Values that do not fit in 16
bits silently truncate: writing 65537 wraps to 1, turning a
"never pad" intent into "always pad".

ctx->tx_max can itself reach 65537 because cdc_ncm_update_rxtx_max()
increments the negotiated NTB size by one pad byte when it is an exact
multiple of the USB maxpacket size.

Clamp the stored value to min(tx_max, U16_MAX). Any value above tx_max
is already semantically equivalent to tx_max since frame lengths never
exceed it; the U16_MAX cap ensures the result is always representable
in the u16 field without wrapping.

Fixes: 39eb7e0e8c88 ("net: cdc_ncm: allow tuning min_tx_pkt")
Signed-off-by: Omer Zalman <omerzalman42@gmail.com>
---
 drivers/net/usb/cdc_ncm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/cdc_ncm.c b/drivers/net/usb/cdc_ncm.c
index 6fcb4d711a64..edd69f4e1596 100644
--- a/drivers/net/usb/cdc_ncm.c
+++ b/drivers/net/usb/cdc_ncm.c
@@ -242,11 +242,17 @@ static ssize_t min_tx_pkt_store(struct device *d,
 	struct cdc_ncm_ctx *ctx = (struct cdc_ncm_ctx *)dev->data[0];
 	unsigned long val;
 
-	/* no need to restrict values - anything from 0 to infinity is OK */
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	ctx->min_tx_pkt = val;
+	/* Clamp to tx_max: the frame length can never exceed tx_max,
+	 * so any threshold above it has the same effect (padding is
+	 * never applied).  Also cap at U16_MAX since min_tx_pkt is
+	 * a u16 - without this, values like 65537 silently wrap to 1
+	 * and invert the intended behavior.
+	 */
+	ctx->min_tx_pkt = min_t(unsigned long, val,
+				min_t(u32, ctx->tx_max, U16_MAX));
 	return len;
 }
 
-- 
2.39.5 (Apple Git-154)


