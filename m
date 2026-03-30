Return-Path: <linux-usb+bounces-35698-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNgmD9TmymkkBQYAu9opvQ
	(envelope-from <linux-usb+bounces-35698-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 23:10:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E93614B8
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 23:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 070423013C9F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 21:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308563A168C;
	Mon, 30 Mar 2026 21:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tc8aNM77"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A093D126C03
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 21:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774905034; cv=none; b=jiulciv2Itev2vi1xNzRBGKfOg52Qpt+csWarSCtxCQBQOW/P7PxEeNVXiAg60zKNZh/91udoteV8fVsHVwAywbiYFbHuO/JGG1h9ddRGClZGW7XNdM6wN34ugKyPH7ZvgiL/SQcdQYU7QzUJE11GQ1Z+KgJ/wENBOOgDFJX1QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774905034; c=relaxed/simple;
	bh=x6LZKPlnMnzPyi+3+BA5c9a8UQjqYHfNM8ypvVO0gGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s326Ho/PM689cWSmCDI9obepq2SGVV7uxr87VnEsGwdfzhcifWXk8SNoNyfyWAvfh7lA0etNHMlXHKfyI5iVdnXhvC3z/8u6YtVfieCNiqf5Gnva64K4yZ1ETxEtxgJ1BTG7RRvNm0BBYZtF+ENGbk4rht/LdSC6H3pksooyIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tc8aNM77; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d9f68d011so1282772a91.2
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 14:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774905032; x=1775509832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEP0zXDzOr+l04/srVbHJJ5LhsariHaPANvTrx9+dlM=;
        b=Tc8aNM77OyRo1sD0vl1pAu3ucB/tsDS+KJgvrs300wSwYyzPlqR6MATOZsP51upUUA
         0FRWboluYmEq8AbXGJLhhI/vpXskYKVil6WJ8L6nB7iEv6axFUjwo4DawUAKt/qPKH+/
         SDecJwJtYWxnjsXug5dG/VWevgjpMMlT+Oah9QK0iSm/N6Kd45hkzAhq5KJTl/ElRF0q
         wLzjKNvkpbHIo3zOBO+pAdKMuihpKnyL+/26s0uztS1DNBgH4k6b7I+Uopo2rZJEQ4R1
         kSB/Gsj0N5km/XEBIZB4GgZg7rT3wNDYUO9at4oaqi4p7s3oZ1nKpYJ7s0AJoLlPPplu
         WqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905032; x=1775509832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEP0zXDzOr+l04/srVbHJJ5LhsariHaPANvTrx9+dlM=;
        b=M+kHhXJaZhT+VT7gU5QCBW45Ck+w3qA5dDQpsXiuMBffLFFwHKm3edVW4MbyALim9j
         8NlOKkY1TzQf1Rs2st8FL+F6RDz45Wt6gNudXSM7gWZWUZSeIrRqyG8uB75cIBIkDrm1
         xItpNRVQXYe5JV50HBraG1cnFy+tINa9xw55eT2W061y7+LfgQ+fcBvMldwWbWMA4IqQ
         3aZ42ulDj5TOLlOOYMk7Kp7k7yZxjFEM8ad7RmcYfF7iqFCdhAkHm+bfRCAokrq1vLLN
         rrM2xoUaDHKlZn0fnufjlRcveO6cM0T2v6FsAtR8uxWZQ5yo5F1YVttpMXouV1IJ4son
         AXJQ==
X-Gm-Message-State: AOJu0YyZHmXT7tmzCyp+C7OZhOVWqgSCFT1u+CJ01FZ54uNk8NksY09R
	gg0WkUumRKiMHY3sqbmsl/zdyFkoC7++yJaMp1LYIhzrNClaLdE3ZoqKvRWEbA==
X-Gm-Gg: ATEYQzzbraLLXWRaIURj/Z696CdrrOT9iGczulYwwA2mkUP5OwxSM5fB2JSxzuRK0AJ
	crSl02n8u0oOoVpKEEqWFtgP6C09h91/t5YnVppgcD4A1D15bV3l3w6SU4ap2fd6HR0eUVoQq09
	5hYiDUwMfkEBBE+C++U/M0XrljNTqTVyaBYYG+N1DyZKKeA0bkJmOdUqb/YO/6gl2cATxdz+osl
	VfW0ZHUsK/udE09MAOdL+9LmCjMEx9fEpP3Jz38eNS0i1dRZbGRtWO4J6XhPFmy2vwOAwx8I2j6
	I3GGWCn60zY3MwVbZdJ99qFabeyZh9nDkPTL8GG6rnOABTFEm9A13NHZ2+ctkc0c5xOWGL8k8Sk
	/zYl0NCKmqjycdmpQ/6q0fcFqeIf8WurQKSiOCHjJhU/tRS5Ic47Zy9w/RfZV9tiftu2Y+vjYNu
	LfMLswvuBepLqSRBjsT2x2BQ8+4aeu3OwuiyR1maXyBdKT621ArkbBqtw=
X-Received: by 2002:a17:90b:164a:b0:359:f2e1:5906 with SMTP id 98e67ed59e1d1-35c2ffb6610mr12220806a91.4.1774905032521;
        Mon, 30 Mar 2026 14:10:32 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d94d289f5sm11648765a91.5.2026.03.30.14.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:10:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] thunderbolt: tunnel: simplify allocation
Date: Mon, 30 Mar 2026 14:10:14 -0700
Message-ID: <20260330211014.12121-1-rosenp@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-35698-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 466E93614B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use a flexible array member and kzalloc_flex to combine allocations.

Add __counted_by for extra runtime analysis. Move counting variable
assignment after allocation as required by __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/thunderbolt/tunnel.c | 10 ++--------
 drivers/thunderbolt/tunnel.h |  3 ++-
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 89676acf1290..f38f7753b6e4 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -180,19 +180,14 @@ static struct tb_tunnel *tb_tunnel_alloc(struct tb *tb, size_t npaths,
 {
 	struct tb_tunnel *tunnel;
 
-	tunnel = kzalloc_obj(*tunnel);
+	tunnel = kzalloc_flex(*tunnel, paths, npaths);
 	if (!tunnel)
 		return NULL;
 
-	tunnel->paths = kzalloc_objs(tunnel->paths[0], npaths);
-	if (!tunnel->paths) {
-		kfree(tunnel);
-		return NULL;
-	}
+	tunnel->npaths = npaths;
 
 	INIT_LIST_HEAD(&tunnel->list);
 	tunnel->tb = tb;
-	tunnel->npaths = npaths;
 	tunnel->type = type;
 	kref_init(&tunnel->kref);
 
@@ -219,7 +214,6 @@ static void tb_tunnel_destroy(struct kref *kref)
 			tb_path_free(tunnel->paths[i]);
 	}
 
-	kfree(tunnel->paths);
 	kfree(tunnel);
 }
 
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 2c44fc8a10bc..55eb83900a2f 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -75,7 +75,6 @@ struct tb_tunnel {
 	struct tb *tb;
 	struct tb_port *src_port;
 	struct tb_port *dst_port;
-	struct tb_path **paths;
 	size_t npaths;
 	int (*pre_activate)(struct tb_tunnel *tunnel);
 	int (*activate)(struct tb_tunnel *tunnel, bool activate);
@@ -107,6 +106,8 @@ struct tb_tunnel {
 	struct delayed_work dprx_work;
 	void (*callback)(struct tb_tunnel *tunnel, void *data);
 	void *callback_data;
+
+	struct tb_path *paths[] __counted_by(npaths);
 };
 
 struct tb_tunnel *tb_tunnel_discover_pci(struct tb *tb, struct tb_port *down,
-- 
2.53.0


