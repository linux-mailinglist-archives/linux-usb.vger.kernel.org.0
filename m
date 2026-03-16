Return-Path: <linux-usb+bounces-34849-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJ1fMrPMt2kRVQEAu9opvQ
	(envelope-from <linux-usb+bounces-34849-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:26:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A784296F22
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 10:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 904DA3022549
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 09:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 127F7387347;
	Mon, 16 Mar 2026 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqxlVZKB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5698D3859D1
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 09:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653128; cv=none; b=mJcZZUR+pddtw4t0xTHYE5Dl5z7/0G1DQywa+EX+BqS7++lU0RXOhjc2Smf05jKgSm0tPcaoY8gOHwca9BG5veu7yZ3qnXj9NbLFg+nx7dpTzWThu9ikmTEFJXiOX+o5QstXP2MkOZa8LLnjWY2OLCbu9At2A2Is63NEHZyDbwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653128; c=relaxed/simple;
	bh=pi+ayVlM0fmP34dV7LMX9dejqOC3+LeMvhEbz1xgFcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJcjvp4MOA8EBkKBx1Doi/m+82IAUc8sS3mV5ReXEe4PYEz0f67+Sz3R+z/oHhxSj18GctojOd5v9BrOkHUT5c2v7ICjMI1h3/9KnErXPuViiXtRXQDxtjG8VUwEvgyGC/vaOcfvk5rGJJD/M7Njb7m3ZlE9quj8ToLDk/8YwJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqxlVZKB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a12c19affeso5789649e87.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 02:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773653125; x=1774257925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLPcyzMjn+OqUElT+9goM6CbYT83ilrpu5qFDKO0qo=;
        b=SqxlVZKBMRcsZbEzIQEbxgzP/jy7t7ZCTK7nIknIOXBUkw/6c9bgWWXU/8NQXv33GD
         tEyDwFLkn0ZXAy4Fumh0noTYxobr1mNnbT/3U/i0b/Crn9s1bxFeNGskQLwp2D1u/zmV
         GqAGyQ+3NdvCOZ7RQkdX1yPXyF2hYV0ko8mFL22wBQsxbaznoI0nm6hFR5AmImSTuYXN
         KvjeUkC+r6MeIct1jvi4hm4vOYcBVPE33o38ZYh1P9cqeaHyIoZP3WUvLL71myU0PB47
         cLbA9FpwiSjHgbmHnLKCWsTKnl7qEkQBSnRNTi7jWNz6LHrFhgsvXyh3DGSsz/HMUtce
         m1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653125; x=1774257925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMLPcyzMjn+OqUElT+9goM6CbYT83ilrpu5qFDKO0qo=;
        b=o1+jcp8LuW7LazXSQDpz1h2uivhut4MwbAFL4XOG9HHOyM1IbkSF1fCzNB4DRBH9T0
         F/2ckIM2koD02AFjFgF061hQSoXeO78wDh+lly/x4cOnKnoiVcisC4yjndOcrP/xRR9b
         LNNauqSnwZ215Hgu9pnR40kxszgNJ+ExyBOD5FdpVXwMjXz5d95o3Da5JPCoZKbdOifZ
         woOeLsoSbQqZnKByowrNhSFEiKjjQyAcoFOrhD2P+oBB80p8tYMfosGTqtvk4haBOcp7
         horEAyFbF3wBJ9Y8f+ZYFYAwL7zkCrD1MMqZT29vxTBBvXBen0fEnfworv9nW6itquux
         YO4A==
X-Gm-Message-State: AOJu0YyweAiS/FC1DNqM38wotIY1rpwbu8xUer8nKZd9KLl0j8qkz66G
	A9zotV0apLRRBnyPe/03jZBoELQUABAE/Msp7t3cj4JPaTavjzkgSsnvzBw7KKsi
X-Gm-Gg: ATEYQzyIITfgZgWQbvb03zDHKY4eN6yuDX0ZSRm621BJBCZVHyeu8WiMlR+dL4ncoQQ
	glPxw0Iu8ob1+5WNT3jD39a+ukw+94WCuzBh0Q5BrmLWxBVF5TPKOFTsKezzzTpMlpwJhOgD7/0
	gN5vbKXmnf2NYCbVoR6bBgpEgyAGNmENFnQia0Az8Ife/QmjpACNRTuWOOt8SVZnlAC5t2/TmAc
	pcoLdMruE0dewxAtAxLxEfBNtcmLp7ALMhbau4dk7TWz7Pv8XUj9jo2U0AKhIcOxJsW8PrFzYdn
	9wbQ/oyKI6eigYLz2KL/1ptrBj4AVGdMHgH7yd/fe2zneILTnPhsgvLvnhw+mHCGEtbyrV8Pve0
	ts3n2a6LuCdR9QC0KwkvQ2WlcNeRYi940gxxT2YIQ/nUyZes2dfz+3kwvrgAHuA4o0F/zQRo+Lr
	gSi3A3pBno5XZkb+Pl4vGgrzaLGuMjjTeNnJ/0vF6Kiz3vUvg+S/ghX980ev4n+PxWGszeu54Q7
	ht0i0NwVKch62t2gyptJYcOUGJG
X-Received: by 2002:a05:6512:24cc:10b0:5a1:2c19:4e83 with SMTP id 2adb3069b0e04-5a15a4c7a4dmr3924001e87.20.1773653124808;
        Mon, 16 Mar 2026 02:25:24 -0700 (PDT)
Received: from lawki (h-155-4-172-88.A1139.priv.bahnhof.se. [155.4.172.88])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6dd87sm32693271fa.35.2026.03.16.02.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:25:24 -0700 (PDT)
From: Loke Forsberg <loke.forsberg@gmail.com>
X-Google-Original-From: Loke Forsberg <Loke.Forsberg@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	khtsai@google.com,
	raubcameo@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	Loke Forsberg <Loke.Forsberg@gmail.com>
Subject: [PATCH v2] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Date: Mon, 16 Mar 2026 10:25:05 +0100
Message-ID: <20260316092505.8841-1-Loke.Forsberg@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34849-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linuxfoundation.org,google.com,gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lokeforsberg@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4A784296F22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace kzalloc(sizeof(*ptr)) with kzalloc_obj(), to improve type safety.

Signed-off-by: Loke Forsberg <Loke.Forsberg@gmail.com>
---
Changes in v2:
  - Remove GFP_KERNEL flag as kzalloc_obj() defaults to it

 drivers/usb/gadget/function/f_ncm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index 14fc7dce6f39..1bec7e99b04f 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1456,7 +1456,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
 		return -EINVAL;
 
 	if (cdev->use_os_string) {
-		os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);
+		os_desc_table = kzalloc_obj(os_desc_table);
 		if (!os_desc_table)
 			return -ENOMEM;
 	}
@@ -1753,7 +1753,7 @@ static struct usb_function *ncm_alloc(struct usb_function_instance *fi)
 	struct f_ncm_opts	*opts;
 
 	/* allocate and initialize one new instance */
-	ncm = kzalloc(sizeof(*ncm), GFP_KERNEL);
+	ncm = kzalloc_obj(ncm);
 	if (!ncm)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.53.0


