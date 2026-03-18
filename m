Return-Path: <linux-usb+bounces-35073-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDR8Dqj0ummVdQIAu9opvQ
	(envelope-from <linux-usb+bounces-35073-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 19:53:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6092C1A43
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 19:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C483301D4E3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 18:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01273EAC7D;
	Wed, 18 Mar 2026 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbSuBvpc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E2F270545
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 18:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773859978; cv=none; b=n2QNr4FfowDdzIXaWSvq5oSbAhOD2AEWZ7/nivoPt6tKfEHiM3i0DLM5c4bVuGi2otXui7pnLy+QPXHInejnwzhvP0KC57BzAhAeBA9+Vh8cZ27aqL6JS8K3VW3weE5AaoWFFoxyLH5u5TL49rHWKkFvJ2tPa7Ao+lvzEmN2rwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773859978; c=relaxed/simple;
	bh=UCngcFeX5vh68hnFGhGjT/S5NFDy3cR2mGBh4g9ppOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sPKKxnglr5IiBFqYcIYu8GpBLbr8kn37aSW1zdB2cTIpUw4hbL//gOeUJp+OToJu3VCcVRn+pqL/Pdu571kAnF2BXowtEHCJdLi60ZPOGHYdplWS0M8QuWsijPAdkwKlMDLi6wqCwhtlecZPq6Zr+8ElEFZ1HlPzaGYxD5kAUD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbSuBvpc; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-797ab169454so2836307b3.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 11:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773859976; x=1774464776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EaAhVFjEj7aLMwcXOusWyl6mHSsBkmDOc0v8egWd334=;
        b=FbSuBvpcS1cHE8n6UItqpDFLCI0ZRp1S7V9Anf/zkZ867hMYVOAQPIfKmcGzgNNlIZ
         MxUBytZj4SnvNsCuaPPQqzG5BnFt6/v2urCOaN7RXN4+J1q5jw4geTN2NjffA1f+BsG1
         eJSebyNfWsoyU3gSQbfTuDmrGvohUx87pb+X3pBVxaKKS027nUhxTL433vwzC2uyFZgN
         klhLiZKEKqrcV6G5g+FO1+g/GmqjK63fcG0EK/pSh3rSBLNaXa3rSZYAdQ4Js8PBRO2j
         BYQ1Qojhesdc2GCL476C6phtigLW7WjPGoWzt9ycYql11hv3n67nd+MHQaWNGosObyx3
         s3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773859976; x=1774464776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaAhVFjEj7aLMwcXOusWyl6mHSsBkmDOc0v8egWd334=;
        b=rCisTQlSSpvqwTytdBjaq+unDkXV3fV07lqsK9jNEXUWd5vuswabGW/Ig9V5kIH+Az
         yDk5S2ZHSD2fOBk8Z28H3vLPnXQc1ihH5EbIVqiZjxBxMMDF5KHk01cz6dJRDgiMkXAm
         ou6tqDC5SMyJm672HLrkeO8zXtDUU3+AgCm+Cx5SGpOh/++UW1ID9tJNzlOB+WmbLYYp
         GDabdIE9evbwqIPgoKKAjrAzqmrLSCyvgT2EJYUHPf38wTzap2Z3Xnw6UJXXQRQLpTRf
         vfI4wBrfkF2556ALT7cbL7rf1FiFRzQkU+XGAVNtt+poKM5EpDbTR8HUb54MLnuZsSyh
         YH5A==
X-Gm-Message-State: AOJu0Yy9tyg842R6alqkNRLBNLxkOnrnEeMZTLkSvGF3A2haFlf/FlHW
	tpxCc7ccbP0rb4m3/x/nn+8kk3UJICtkLf968xmbkP+6ch9KTcebRviW5QIDpQ==
X-Gm-Gg: ATEYQzyPCtqtzbrqeS/EQvuHzHTO+tUe8WKs0cV4FLabI5dS+npHV9WSupNAm6pftJf
	3ayyggsHUZ8MDL9s8UYIrTCP2Lfb7IKYfGWsEy/JMF8H+W+hXnGLOC/87kIEJv8ccEZwpWntpyf
	kDu4ndRmqOc3AckANciYTlxeYo/ITFfuNWWZimeuKBmiU9yJJQA9Pb7rzgKDUqiAMI6xpiefGJV
	0u0s9e56gGCMYjscvVWIGrlsKf3+9vnECQoF3slCG/tkjGBMWaXY+9EN4YpUs52mrmNWfSIDsOA
	13mXLK5xXtkRxc5G9LMOOjXYUvFKmccHlNxEdpJtfsdvDrJDLlliHqfEZopH3HFP5HWXuWXuZn7
	xkxr9h62KMwAj5xwEfcitwBZwaP4YeQSNZ85ESh+Ic/32elnr5fXQ2HUrhiR74e0q+1oOLLeJ1o
	A68aUBjHJ/Zs4HWirdquxJjBAt2ksBGQPjKgpiz9op+ZpI5cFiHfTSlnc=
X-Received: by 2002:a05:690c:c4e3:b0:79a:7cf4:1a60 with SMTP id 00721157ae682-79a7cf420d2mr20355937b3.48.1773859975837;
        Wed, 18 Mar 2026 11:52:55 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a71593c08sm21689017b3.24.2026.03.18.11.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 11:52:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv3] thunderbolt: use kzalloc_flex
Date: Wed, 18 Mar 2026 11:52:37 -0700
Message-ID: <20260318185237.4742-1-rosenp@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35073-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.939];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AA6092C1A43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Simplifies allocation by using a flexible arraay member.

Added __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: fix kdoc
 v2: remove extra kfree to fix kernel test bot.
 drivers/thunderbolt/path.c | 28 +++++++---------------------
 drivers/thunderbolt/tb.h   |  5 +++--
 2 files changed, 10 insertions(+), 23 deletions(-)

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
index e96474f17067..217c3114bec8 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -419,9 +419,9 @@ enum tb_path_port {
  * @activated: Is the path active
  * @clear_fc: Clear all flow control from the path config space entries
  *	      when deactivating this path
- * @hops: Path hops
  * @path_length: How many hops the path uses
  * @alloc_hopid: Does this path consume port HopID
+ * @hops: Path hops
  *
  * A path consists of a number of hops (see &struct tb_path_hop). To
  * establish a PCIe tunnel two paths have to be created between the two
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


