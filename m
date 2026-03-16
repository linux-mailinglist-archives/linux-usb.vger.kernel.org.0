Return-Path: <linux-usb+bounces-34893-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIT8KlNKuGlTbgEAu9opvQ
	(envelope-from <linux-usb+bounces-34893-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 19:22:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402329EF93
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 19:22:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67D2E302DE3D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 18:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1183B3DB634;
	Mon, 16 Mar 2026 18:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gML1drS1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C133DA5CA
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 18:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773685299; cv=none; b=frGkL6PpZKyxJ3X9HibzRpN0J/EwKfT/FyV589/6M1036SfumjlAICHdw828WgDWcyHhMsWokNt2rgNeRkQ52gSmiEUjXDSOkzHboDOrJvPwW60UT6+pE+2BQM9oSUnWVOFKCng9jTOC8Uu9cFBHnE0vSmf6ouRwvFV1NCQsKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773685299; c=relaxed/simple;
	bh=wyoEhbH5vEmoe/FvNNWLblsq3Yj00zp3Hzhb8lN1S9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UpGADTMzHkLl71sebqFN4zGcFIZRbE802/hnPN2eFhuMgRpVogNJ3PY6mmuQEW47mGl32Cb8478F3HUA6aBND93I631ecrUO0GFJeUtNDTnHWAW3JcxPLfhs2hZ/eELgTQLOn3WOdOBRlHr1iUzHaKGFaCGSmrnTHZ6C7l+Ikdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gML1drS1; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-829abaaa92bso3188988b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773685290; x=1774290090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffmkfhN6IZVcQX8QYVniegQEwjGmXttuPdYtjponOMI=;
        b=gML1drS1cxujHW6+jEH+RoV9YKcV/WIyxim42MQEKud+pZQnCnvJexH9YEg7lQjfaM
         H9fNz9abjHJ+iSdftB3tr8q6yLQwH4+f3VXbLyXTkO87KmhXoenLFLiQ37wheXwRlQZA
         t3sLHKuuSypWuWpdn7XXuDK+dCpLEmi+KbdnhrH8tTgGNtJWb57lfLmVMgZiqFeAi+mj
         1l+OYPNfhoFcBUMbs5MUhtrGnV76e2zZ/RH5hrt3iHMTOlrJ6TFSVqkoZMa+ercvRb7L
         HBIcW5tkXBhEO5L2TMf01wgG8wB4jpKeeYI2haMYKojc9RdzFFlkXSiecOXxREitVSDu
         Kf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773685290; x=1774290090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffmkfhN6IZVcQX8QYVniegQEwjGmXttuPdYtjponOMI=;
        b=KBPAYF1FIsrwh7uO0pKZnhGYzg/Mn3a6+6DY2b3Jrl7gy1QLSFs6N66G06M/i9w6tc
         Fuhv1FXC/y8NKJZiFShp4r0lU9G2vsE7QfIVn/lWOpEajVc0eIiJis1Ct/NUkd/Ht51j
         FWOa/zgtnEHNQ2MLj7DhxI4cyFQs2JL2z4Lv6K/MALZJRQGPDSNoWnjTF4/0XKcD6ul+
         7pbr+uuOgdbI+8ZFFGPJR0U28YnSx0hhg7f5OsYPpd8LmqP8a3RHC9N7pPqbG5mTOMQB
         FQ8hdAPIxvEjtc+qxdsHpoKCj3eAvLedUrO4EZPO0T3CDZqXNqagQI6W8U/xk9q761hu
         SY+A==
X-Gm-Message-State: AOJu0Ywi2tlx9jfjIMFEQWiuYbbyrhniAYhdWjvPWHCGHj+W2hyUtiw9
	8h/LRWUDxAsZiW5pDx7UmCqpJZuNgQoQqpGe/8coK0NBUzz19a4J/QWOzdEjpv3X
X-Gm-Gg: ATEYQzyh9sCuXcnKYuyYSGsFJTpD+B5yYI7KNg4SlxdG6NpHj6ydCAwEVip8kzyxHZd
	sA5XVFG42aLEh14NNPzlTGvHZuAI/S8ZrImyzczAq7PGVnx/yn3P6BPM7CMTam+PmzNDD9rxyyY
	kYuglDoCzi7mbBGNHp5w/QJTwaDZOvPKg3j+jE8630WQcOyIabM1nf5jOmhttEm2Dft3wgVpQHL
	epl66sjNmaZv0Sh7lbkPjpjRj9oeF/CXkzWULi5xDx7YP5czBXEuKiTyMtmWtbeTyJU4gwQEyWU
	3DRePMdpOEAvJEel8s7IZySQ2cC0k0eXHfo7k5OBqVRInRW4Kw2f1uz1b/3ndWM0HGYJyOh2i74
	GPPFLmDws2EV0FiJuPnlPThQrxsdbDU5m2NTwIPBmE7WfTEJ89FYFusYrYZ7wqrVLdV9XSgSWWj
	+cBbRCe5BQauq2bFR+ttBboVO5TXkRBhu8QbUxZwW8JrXXS9vQ3k0cq6g=
X-Received: by 2002:a05:6a00:aa0a:b0:81f:394a:4897 with SMTP id d2e1a72fcca58-82a198fd351mr12387566b3a.44.1773685290281;
        Mon, 16 Mar 2026 11:21:30 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07341ed1sm13602575b3a.33.2026.03.16.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:21:29 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] thunderbolt: use kzalloc_flex
Date: Mon, 16 Mar 2026 11:21:12 -0700
Message-ID: <20260316182112.8682-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34893-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4402329EF93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplifies allocation by using a flexible arraay member.

Added __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: remove extra kfree to fix kernel test bot.
 drivers/thunderbolt/path.c | 28 +++++++---------------------
 drivers/thunderbolt/tb.h   |  3 ++-
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 22fb4a1e1acd..8713ea0f47c1 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -150,22 +150,17 @@ struct tb_path *tb_path_discover(struct tb_port *src, int src_hopid,
 		num_hops++;
 	}

-	path = kzalloc_obj(*path);
+	path = kzalloc_flex(*path, hops, num_hops);
 	if (!path)
 		return NULL;

+	path->path_length = num_hops;
+
 	path->name = name;
 	path->tb = src->sw->tb;
-	path->path_length = num_hops;
 	path->activated = true;
 	path->alloc_hopid = alloc_hopid;

-	path->hops = kzalloc_objs(*path->hops, num_hops);
-	if (!path->hops) {
-		kfree(path);
-		return NULL;
-	}
-
 	tb_dbg(path->tb, "discovering %s path starting from %llx:%u\n",
 	       path->name, tb_route(src->sw), src->port);

@@ -245,10 +240,6 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 	size_t num_hops;
 	int i, ret;

-	path = kzalloc_obj(*path);
-	if (!path)
-		return NULL;
-
 	first_port = last_port = NULL;
 	i = 0;
 	tb_for_each_port_on_path(src, dst, in_port) {
@@ -259,20 +250,17 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 	}

 	/* Check that src and dst are reachable */
-	if (first_port != src || last_port != dst) {
-		kfree(path);
+	if (first_port != src || last_port != dst)
 		return NULL;
-	}

 	/* Each hop takes two ports */
 	num_hops = i / 2;

-	path->hops = kzalloc_objs(*path->hops, num_hops);
-	if (!path->hops) {
-		kfree(path);
+	path = kzalloc_flex(*path, hops, num_hops);
+	if (!path)
 		return NULL;
-	}

+	path->path_length = num_hops;
 	path->alloc_hopid = true;

 	in_hopid = src_hopid;
@@ -339,7 +327,6 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 	}

 	path->tb = tb;
-	path->path_length = num_hops;
 	path->name = name;

 	return path;
@@ -372,7 +359,6 @@ void tb_path_free(struct tb_path *path)
 		}
 	}

-	kfree(path->hops);
 	kfree(path);
 }

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e96474f17067..4e66b53860dd 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -440,9 +440,10 @@ struct tb_path {
 	bool drop_packages;
 	bool activated;
 	bool clear_fc;
-	struct tb_path_hop *hops;
 	int path_length;
 	bool alloc_hopid;
+
+	struct tb_path_hop hops[] __counted_by(path_length);
 };

 /* HopIDs 0-7 are reserved by the Thunderbolt protocol */
--
2.53.0


