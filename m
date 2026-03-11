Return-Path: <linux-usb+bounces-34626-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qO5tHj75sWl3HgAAu9opvQ
	(envelope-from <linux-usb+bounces-34626-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:22:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AFD26B560
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A870C307218D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A010A3A4F35;
	Wed, 11 Mar 2026 23:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ij2E9rIO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C4324B2D
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773271346; cv=none; b=brncbX7Rf7D3hLgUzA98WY8YpsRj9+ONTyj4YWedYw3i1kW9VA2+b29vfH6Cj0snuYrmTZQgxLkle9Laj8oP3hTl00H1p+qf4loykXxvyq4zGq7IHHA8O7cSIoAiHQi+EWGfhqNkv1syhomuwrqKL0iWv5SvUfVA/PK86GoXVz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773271346; c=relaxed/simple;
	bh=3b/UX2M7aFcJWInuUSq55ZwYF94bNSeG7Wja6ecHKnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=un0ZbDtquin7k3Q4GlvBHIS5xWP2lYcQaa/o9dD3hoGPMC9100RbXWaLl9qx15bFFr8leOzb5HpNWZRtMvHGDrxAUmcVh3ukpOek9tLO4HQk4QneTeJfez46SgTM2QSYr7T6rR4dRwJyeVn5MFFZsJbyQtMLc5S2aTaUIMfctR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ij2E9rIO; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so329236a91.1
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271344; x=1773876144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/y9dleBR2reXEEDZPM2b1qrma+w8Y5dsVKybDsJlCkg=;
        b=ij2E9rIOE3cyTQ1BBG/rXGGHkdfv4vGCnm9tmxa5aX9g7FqyCKdiiWcVtC5wnw4dj1
         V+nqnMvIedzyhd9DCeX4duCGPGXxPp8Dtak7Kdps05Bx97vmZvsOTNXy/NzKBy7Se0xO
         aCmbhV4MylpY6YJIN+hQeU9VbC2eoPN+gckYeuZAwFk2hDblaTkhoMChG1JX5Yb//ikN
         gAK7dMyoXp/OnnZVIhclm7qqtLvCvnu7+HPG1YJvgTsSTB9nv84pB/7EJm6L5fI64K0o
         w9JPNrg/rGr18h9PVrDHnzZOLAIz9YT1t++3nfPZnGwbzx4vlHu0cJLJPm7x3Ehxu+YW
         htYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271344; x=1773876144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y9dleBR2reXEEDZPM2b1qrma+w8Y5dsVKybDsJlCkg=;
        b=NImqUMvOYgUoE6P9Yyrldb4qFfmAKAK1zDG3tRm9lOlNC/b+zU7Xn53ijc/KAr8pgl
         5UC2m4NWiIsaIywKr8tzjeFW4A9YyVwrf5W5wb3uNVGATcb1EePZEace3MtuaFpn2M44
         YR2WiIb3Uz5yuiwNojM7WdvBoqUlHd84AbBQeIRGao3PvmOulsP+GN01WK9RsXuxdMll
         c1/7R4F2ERyawoy1PjZILkxH28rARjVafXTkp0gRmrxmbJVw1yzdctczS5PgskE7y3VE
         +p8PnJ7n+L9iTL6dLPsvcp8n+ZoL7YX2lKYeL/75e6nbwITtsBifXJgFMdEr67aTuXI1
         /2aA==
X-Gm-Message-State: AOJu0Yx/DAv/z5Aip7Emn3/Zhre7xVhSDkGzIFxTc5m9vn9P9uZZbcRt
	9TduO57r9+Xznl0HfIKf3gjfqWB4kG37GkgNiQToUxGhaalEqL21XSbUTOOlGk2P
X-Gm-Gg: ATEYQzyD8D55xb5swlebqoMD0GIlv/obxONJj1fGHcw8j0aFtqJTfsw/kXj8HrMFLx+
	t/Ex49e0L1lPEITHV5YN1EdwOrbj33KytX6IrXE3JM54lY/B7p4TuXJAkku0c9D6Y1GfYjwlO+0
	Tv5h1PIiN2qKr0kFqTnicC+bpbcpowMBnYo8joib40EIV1meCt3JYntLairMVBDUGGhg/fcAIbb
	m0KgWrOlt0UFfYzY+XCebr03ul1WesBeQxTj3RSvlSXQAlsX04UAy0xE6rW3n6PZrimput2bc3C
	QbIZRb1dJgNiEkJ0VpycHLHcnMD5Kr8PSBDoOGCUBEcO1PCPFZKvC/YeBRtqYI62R+ZaxceLUs1
	CSVRLD6kL4N1/cFgW4RNWXfciTOFqRiPpPqBmvXb/R5D6Eg+RqS1v/NUz7enbJM/uwpPNQCpViX
	FuA7lxtbRzXJ1Df4pyTWNCS0SFoKTkRT76f0ylOecoykHEY8RFtysLBg==
X-Received: by 2002:a17:90a:d446:b0:356:2c7b:c026 with SMTP id 98e67ed59e1d1-35a01301cf1mr3659933a91.23.1773271343988;
        Wed, 11 Mar 2026 16:22:23 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a031aa12dsm1290014a91.10.2026.03.11.16.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:22:23 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] thunderbolt: use kzalloc_flex
Date: Wed, 11 Mar 2026 16:22:05 -0700
Message-ID: <20260311232205.18137-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-34626-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19AFD26B560
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplifies allocation by using a flexible arraay member.

Added __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/thunderbolt/path.c | 24 ++++++------------------
 drivers/thunderbolt/tb.h   |  3 ++-
 2 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 22fb4a1e1acd..3af5d263ac74 100644
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
@@ -267,12 +258,11 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
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
@@ -339,7 +329,6 @@ struct tb_path *tb_path_alloc(struct tb *tb, struct tb_port *src, int src_hopid,
 	}
 
 	path->tb = tb;
-	path->path_length = num_hops;
 	path->name = name;
 
 	return path;
@@ -372,7 +361,6 @@ void tb_path_free(struct tb_path *path)
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


