Return-Path: <linux-usb+bounces-38040-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGs/Fi+wFGrRPQcAu9opvQ
	(envelope-from <linux-usb+bounces-38040-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:25:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F405CE552
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 22:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE88B3031EB2
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 20:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C22AA29D29F;
	Mon, 25 May 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uc+4PkNi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F324B37F72A
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740664; cv=none; b=CcwbUiIILBaVaxR7sd4CpLlq5TgYo0N1dnWUp0pAKNYfz5k2BXYK2NtDhXFU6dNY/EIkNcL4bMcgVegvdn9/K6msU8aeG882fHM+mNbnz8YyrDPZVaJ7zH24bKRs6DZbbTjZ1wrqtsA0RBNyirWHO+g9a+pu/ua0rdnmwUlNV5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740664; c=relaxed/simple;
	bh=2z3nyKEVA3fX4RWIlRXG+J+3x5NijVYYAa2uEK6YBRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLLvy8njpkeCPkJvRMvsMPXlSSRPQ+wnlhFI72GDgK9ziI4A6ojLUbmFF3YRizm3RwFmrsWH959RpfPKJUSxfaCwUM1nCclklEvFuoXStAMTnbC6FVVnh/4NqBJ+5logeUECgytyuqq32xzqTY5L0zNHrrF19g+fFPhyyTUIcxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uc+4PkNi; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4855e69a4c0so2594529b6e.1
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 13:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779740662; x=1780345462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7r8RhsQYE6qApYlJu+dL8K8TLlcMeAFqJPIZDrl2xNw=;
        b=Uc+4PkNi3v7AjIGdDgRI6KJ29n4N1Ic8z0g3jkNQP6o2Ni+VPhi8C54dYlU1uY0xj9
         H3ApOhpI+AmKNthC2If1Rja6D1/8QAKaD0zbtV06CCBuw0qULrtTO1XU26RJ+n27SPPl
         K8PfTELUsQ5nb7Me0wLY9XJsDeP2NvAB/iHoH4P95NkwfjhPgKjWjsX43qhSXxeatD72
         NnDzQ08Mq2oRc/2KKkJ9hQ+XjTuZhjL+H3BwHA+Zrtj0Yf7mBYG6QG9J3FVgU7ZuUNf0
         McZw4uBmKcK+ZIsJD67hmD8Nc6Qf5nvndYMFRwjMqXkRvh2KSZbv5rp7lAEmZ0DHvvXI
         X5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779740662; x=1780345462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7r8RhsQYE6qApYlJu+dL8K8TLlcMeAFqJPIZDrl2xNw=;
        b=R2UNA/GOfn3y2yY0n7Mgt0fO9lC+C3fMoCsduxOBoEjw+nfX/oy0S18PaZK54cmmKk
         GKOLca8CjL6eTPGETnNh/kr9/as2gXuI8bTT+rUIWIfDwYG1cVp8by5JOgWXSI0HN1i/
         VaETVq+fH8hL6dDI6Nfdg8LU5ogyXaQOwNSqAmAAsbN8b3iXt5zfG2KmZldo8xtxa+fg
         r6GNFpoYIQRGQJybHLkXrRFEWLNqMPceFcjjEmOoprj+XxLr5Xs5oQ6pEeO3g8CCyKyj
         DKV/3323h5JHfs6JYRv7SlsJnDup1LFa5bLYrRPezPkPv0eRqg35cUE855NKA3dCmSby
         ZmMA==
X-Gm-Message-State: AOJu0Yyf82uRC8s7vEWM8LcBw00wfHzih+3nNLDs2WK6PuEhhyQ5OAyL
	kWZhl+iqStpesg9wOZKyLCCY/m5L7H8AiY8L00YFnKSUy3dzvVCpoBuk4z9b79fvXLI=
X-Gm-Gg: Acq92OGm9F9ZymIOLyRk43YW3ZCvIQSrj4R6f2Cz0RGqraLRNpo/zlcXnVuBD0h6Hnd
	V/y0137k4R49UFFAbG7xeIVLCtVDsimaeyRNzezLkUV9ZmJ89382I3jnuQQ6UQHDsTpZhviApIY
	YLAYEB/N6JXL9hh1HdCyvhzmMYB5+IlwabqC8BfsdRzx5O5HanwEbbUYQwKrgA/QUdPdMXTlpJ5
	qyHcNiQlAe3WCbgOlO8WS467C/vfE13KzSXdqOgmUZzyj+tlsULMpjkq+3+6ug3i8TFdlD+SkH7
	JiXaSejhkDXnc5zLT+/sRHHysTs8c9p2rgi202AIoX9QWoAf8o0qqbyzhLs4Kup8cwB+ev252MW
	jS1/k+zy5wLbv9sOs+yhY+yVerCdE/8HBV3U48AIi1blcKuj7s9Mxb23AxZD+ok0U8pHuS0Ku6h
	rcgfRUGk5Qgqx184CRF/XOWL8XACnNvr4YSVbsS/+ehe5uKvXQCdDQwchDFVUUK89zpqUrHO190
	5S0lHjrrz3L8wIui8B0/yUOlK7se5Os4T22D6+WGcWqkWM=
X-Received: by 2002:a05:6808:3086:b0:479:db65:8dbc with SMTP id 5614622812f47-4854a24dcdfmr9401296b6e.30.1779740662009;
        Mon, 25 May 2026 13:24:22 -0700 (PDT)
Received: from DESKTOP-J47FREO.mynetworksettings.com (171.sub-75-196-24.myvzw.com. [75.196.24.171])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-48554757d5dsm5204305b6e.15.2026.05.25.13.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 13:24:21 -0700 (PDT)
From: Adrian Korwel <adriank20047@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	heikki.krogerus@linux.intel.com,
	Adrian Korwel <adriank20047@gmail.com>
Subject: [PATCH 4/4] usb: gadget: f_uac1_legacy: cancel work in f_audio_disable()
Date: Mon, 25 May 2026 15:24:13 -0500
Message-ID: <20260525202414.602-7-adriank20047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525202414.602-1-adriank20047@gmail.com>
References: <2026052517-undergrad-reformat-44bc@gregkh>
 <20260525202414.602-1-adriank20047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,vger.kernel.org,linux.intel.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-38040-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adriank20047@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C4F405CE552
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

f_audio_disable() was an empty stub that simply returned without
cancelling the pending playback work item. The work function
f_audio_playback_work() accesses audio->lock, audio->play_queue and
audio->card which reside in the audio struct that is freed by
f_audio_free() after disable returns.

Fix by adding cancel_work_sync() to ensure the playback work item is
not in flight when the audio struct is freed.

Fixes: d355339eecd9 ("usb: gadget: function: make current f_uac1 implementation legacy")
Cc: stable@vger.kernel.org
Signed-off-by: Adrian Korwel <adriank20047@gmail.com>
---
 drivers/usb/gadget/function/f_uac1_legacy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac1_legacy.c b/drivers/usb/gadget/function/f_uac1_legacy.c
index 6ad4b16769b7..798fbb8550bc 100644
--- a/drivers/usb/gadget/function/f_uac1_legacy.c
+++ b/drivers/usb/gadget/function/f_uac1_legacy.c
@@ -697,7 +697,9 @@ static int f_audio_get_alt(struct usb_function *f, unsigned intf)
 
 static void f_audio_disable(struct usb_function *f)
 {
-	return;
+	struct f_audio *audio = func_to_audio(f);
+
+	cancel_work_sync(&audio->playback_work);
 }
 
 /*-------------------------------------------------------------------------*/
-- 
2.43.0


