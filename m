Return-Path: <linux-usb+bounces-38006-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FbNBK8WFGo4JgcAu9opvQ
	(envelope-from <linux-usb+bounces-38006-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:30:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB835C89DB
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 630593024197
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940213E5A3B;
	Mon, 25 May 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bX46uY/x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADC720010A
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701343; cv=none; b=kTdScg8v1ZimyBoBueHPzwZoKRwFVm0+jfBEoXTacixS1RtIV6FCwSiEAcBY0+vCGuJlJS8XslFhMAutFhz9eJTG8w9YKmk7FmABAVY6vZz+IgByw0YwjwaL/InD7qrzM89IPMSujPMkz8FfHjx1tPSsGX+zyHDEPKmc7SLHYGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701343; c=relaxed/simple;
	bh=v/6rZ1VmN1v3nBRbzYBC6QI9R/AMWWmdAQWVgoLRewc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdsXGRGIIQwtWNdxHMY1hyzEwowdt/nqNXfLu66e81NHHf3poBH47IGSBaqSUOhWP5cFzCk0dwFPumIrLDQZ0L90UFcBrNRb7ZLH1YtCB23hMEbGR/mCpA65Ss69T9GtWNVybVRtJC+Ifr9mGLu1RVwNeeYDnTC/MaCxzj0qjyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bX46uY/x; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso170975926d6.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701341; x=1780306141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUgjwpPNQNXM4+anOpqwS/DzvwIVP/9fFHWONmUgMwY=;
        b=bX46uY/xcF9bBa16vsMQXdfpTUJ1XerdTV78tz3UH95GGtmQRtN7KGR14khc1yDS+k
         pw3pMdYLRMv2NS86vK4KD433BLWSE6uZt+dpzzkVVuYDotTXB6n/hdcIS9jIYKNpA6qv
         7/PVQ9yya6IATgehbqWmDSWM6FDTRjvPeGD/mp0FxrzkrUU5pk/gRxncAmPoiwNtQL16
         HBwIVHCqHcz0Ec75AxHuz4T1CEC4n8krmB4hn95OrYtEXZZCTF5LlfiRBP1YuovtQE8i
         cUiyD3hj1Y48MoTddmtBG7Nm3Pd6829XsIe7CpYpt7TRu7cfFl0TtBY7qjnQ6hWoG1Mu
         fLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701341; x=1780306141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nUgjwpPNQNXM4+anOpqwS/DzvwIVP/9fFHWONmUgMwY=;
        b=Eh3XXB4+T1MlwJ1R2315Tm7S0qAUMU3GI8JfBHjlxn1WmbaJn0L1/HJAPH3PdvLSKe
         TvtHvDKkBPynkR2bAZ1MdZLgvIetu7zfFIA0zH7jIw6p9J8W8mlo0J7BFRriyGyxcAVR
         iqVqoMAeP9LDdcK8gI6L/QQ0usBVRbl19kC4V3TPPqtmL3t/KdEkuUCyfMxsDJ+mVexB
         IypGhEXt6Ao1QCeJntPU1SNEFq0Q453Uh2mz3APGILF/SFJvNH+c2tgROPNPiGNXNNTP
         WKIXKpWV0fvRuiH9Al9W9LXMCsd1AHtLvD4zALTp0Ifx0JsKkt8vj2ZRuFj/OdHiwhzv
         +vgw==
X-Gm-Message-State: AOJu0Yz4FrqhAyg/yCnt/ikSxVH5A0l2XkIk643dYp6yKq7A+49OsXoV
	1OD3se6srRFBvG6DtIcl6TUWEzXz+DMGf0wqyT6qcM//uhJPPqw/7Vck
X-Gm-Gg: Acq92OGTmiKkyHMSM+hYNyVxSTB6HEKG0UgQoRUvAKD7AG5Xp3sxHYprA51lkbKPIIQ
	IiMKhNLe/9xnYpizpa4h840102eWftGaNWxbeCkis2oVroPtzQ5/EkWyw7qDHeQ6jyM4zmfurNz
	vl0YPuRbEwAQ/ecJejOGT6GxWYFZ6hb4NLPsMEaBEUQ9EtqH3QzmaZ6xAP0LjO/Nhik9h3lRmgj
	3TloISsqI5w3cxivv/lvuyl5ZXeKzbLAt0lW1N1Jz5PUwOyqbyJ+HvdaHNHltchGdwWyHetCiH/
	lG0NloigrFbMx4jPYratZ4sRl/oCXQ/6tc6z3rKLu+a5JucHHZh+tHJ/mgLlmwXkxPr4DY8JSRW
	sxZyvyfI3uU7LPuHYBV1vrLifH35HrzBUnkmkAsDhXqonFO+OJn5OpUasu4VyRK+0Wlb2vSks+I
	/f05RuKhE74we3pSrlCT3y/eC5QZySDCryfWf4KuH4cV9tGGG33TMTmcsECc8JsO/mWYY3xG9/8
	2s0LUgLgYTiBCPBDirJo+HXSLtMY/pECaCK92RYgMs=
X-Received: by 2002:a05:6214:242c:b0:8bf:6a92:84b2 with SMTP id 6a1803df08f44-8cc7b620b40mr227647156d6.13.1779701340666;
        Mon, 25 May 2026 02:29:00 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:00 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] thunderbolt: bound root directory content to block size
Date: Mon, 25 May 2026 05:28:26 -0400
Message-ID: <20260525092830.735472-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260525092830.735472-1-michael.bommarito@gmail.com>
References: <20260525092830.735472-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38006-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: BDB835C89DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

__tb_property_parse_dir() does not check that content_offset +
content_len fits within block_len for the root directory case.
When rootdir->length equals or exceeds block_len - 2, the entry
loop reads past the allocated property block.

Add a bounds check after computing content_offset and content_len
to reject directories whose content extends past the block.

Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/thunderbolt/property.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thunderbolt/property.c b/drivers/thunderbolt/property.c
index 5cbc1c4f159c2..59beab43f90a6 100644
--- a/drivers/thunderbolt/property.c
+++ b/drivers/thunderbolt/property.c
@@ -187,6 +187,10 @@ static struct tb_property_dir *__tb_property_parse_dir(const u32 *block,
 	if (is_root) {
 		content_offset = dir_offset + 2;
 		content_len = dir_len;
+		if (content_offset + content_len > block_len) {
+			tb_property_free_dir(dir);
+			return NULL;
+		}
 	} else {
 		if (dir_len < 4) {
 			tb_property_free_dir(dir);
-- 
2.53.0


