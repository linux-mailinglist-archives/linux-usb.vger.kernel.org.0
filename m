Return-Path: <linux-usb+bounces-38008-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHgXG3wWFGo4JgcAu9opvQ
	(envelope-from <linux-usb+bounces-38008-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:29:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D1F5C896B
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 11:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6061F300600C
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2026 09:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16FB3E5A3B;
	Mon, 25 May 2026 09:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGT201i7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826793E6DEB
	for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779701351; cv=none; b=sfrv+NpakpiLWLPUb7KMn3oZeaA/augXooz24kxHCqv2wMlx8MEqeNO48KMC2M41VypqSZTUUeiMag90cD/vPIE+lbk/+dWQyFeLbCakZoLqcxEIKVpsS8Fbeu/UtdE2PV42boQavChq/mY5YssXCU7JMAQmT7FSK5SmqPQGPQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779701351; c=relaxed/simple;
	bh=rIT61GM5oNN2rhJVeEs8hIYSGWUY3khADL2DBDHXiV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjH+pRF+5utw1s4sVBaHvQBlXyCL5b9a13dqIe8N6Gqg/9weAvktm+RB4W3uRmTDtD6mwXNc/AlYIq8gg0RkAXf5Otb9OTOU+Cm95pDsWKk8eTulyid93E5O/LgMqxqONmRd7hXdjQNj+7Zbh1hS3OIJMUVlidNt3yX/Ekvqp4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGT201i7; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b5cda2dab9so97196476d6.0
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2026 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701342; x=1780306142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtiLYHyRBPw0HAjBkMfw5Y+en0r+h/6dV9A2hz2IT/Q=;
        b=kGT201i7jgiKFTzF8KBK3TEXtod3LyTianQSQcmBW/ji3GdwWQzk2tV64yfKm/wqkB
         ApE5pM9OjqEjNSEm+cK9y0eEWdH/YW079ZakwwSa1/20CmPqu/3GpGEKOk7GfqUCxCw8
         KtSm2X6ViPXYBnPC21o4PDjYeAL50C43AZwIB+KWjBe53gMtb6DrPh4ro6QWs9UHF0v9
         Jqroy3R2R3Ro7DXjchoDIMLB8bf1qxMZuJTk0WHD77K0Uv02LlHnRHBhPMIMGdnSJj4Q
         SRiXZmOBijvR2qHJUB0YkYuf+Z8a/egc3NT+3skQEF0B10ufGHeVlytRqwF5VhA+IeUw
         9FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701342; x=1780306142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FtiLYHyRBPw0HAjBkMfw5Y+en0r+h/6dV9A2hz2IT/Q=;
        b=mw5dV1VrghSoUE0Np6/hUIZFKXpAQtH+OXPmGr6X6tWWNl8OcSdTe5/+foDolOiufo
         5R3KfC/uIS7UJQftQgtxcgC7OL559EixXLklsglcubjX6So7o72KezkB6P5xjAcTiaF4
         luPa3RPcJTRJQ/togaxTsVppr6gL4tdgvt2o81tKMyCqYWkpPMRCUM+4g+SeR3+P/avD
         XZ5yiZwF6SgU83VS8QRCvjOMUluq/E7KibriGI2+FdM6UozCiHpL+W6bE/J+gb7wHXwU
         xIQBjP87D4hvfgrPiqyt1bLzhrJRSbCtMe4F1bv1VhNXWqYPzAW3JWqEyLdRcqsWOT2m
         +ylQ==
X-Gm-Message-State: AOJu0YwxJoL5RnCQtaZAlBJXxx2wNsvBaP6JCvV+6dYBfp21GWyrcyEb
	krAkhgwVu+tVOZ7wyl6PIexcs39ixIyMp2EuICQK2yhv6P6s5IULzPMg
X-Gm-Gg: Acq92OHEZYDNphi5t77EUgWKrwITlA2S0XUum6vOrwNYt3cs3bpi8DUmXSBtHYwUk17
	uDGrqS8J94tD/6j1394hPRTlwA5/EzTXA5C4UW8MnWDYaB3E/TvxjnaeBUROaYChKQqgDEg/0Pa
	juJQQiV9a3keEDaScoxBku0wPaoyL6xcvB2MRa4vOTOq5EkNMGkjyzLelyxIVhDqVnRSkH3b02O
	kWaypfKlXZ8FbjycWo6CGJgXCgRCTHMyccREbfr6MmCoO6qDn+OcArruUJkmwwocVEtReE6SNEN
	o9KPZEXK8jLRZrpVDT0Zb9bH4c9TF3Cq9kEY4tcdioKMFqaOTTe+N9UQ94jzRGnI7Zun0hid/hC
	fnPCGgwqCC3Ix7MT+ALY3GZcNUpRHXcDMAfqG/G84kvvRzrawSOL1m1kUhdpEsxkEIn1sFGGQYf
	1NiC/HJbwCItVqF5keN2fLzyHik3/9APjbThrU2DfpSYT+lYHJQPNHzkGsKOQpcbK0TMNV7eaDK
	Wq6ABaPAF53EMOaO4fLa/IJcVqX7CGperAh8qBDmA34W3nce5lvEA==
X-Received: by 2002:ad4:576d:0:b0:8ac:a91c:c8d with SMTP id 6a1803df08f44-8cc7becc39emr183880176d6.14.1779701342486;
        Mon, 25 May 2026 02:29:02 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcf4a9sm104255826d6.2.2026.05.25.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:29:02 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] thunderbolt: validate XDomain request packet size before type cast
Date: Mon, 25 May 2026 05:28:28 -0400
Message-ID: <20260525092830.735472-5-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38008-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 70D1F5C896B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tb_xdp_handle_request() casts the received packet buffer to
protocol-specific structs without verifying that the allocation
is large enough for the target type.  A peer can send a minimal
XDomain packet that passes the generic header length check but is
shorter than the struct accessed after the cast, causing out-of-
bounds reads from the kmemdup allocation.

Plumb the packet length through xdomain_request_work and validate
it against the expected struct size before each cast.

Fixes: 8e1de7042596 ("thunderbolt: Add support for XDomain lane bonding")
Fixes: cdae7c07e3e3 ("thunderbolt: Add support for XDomain properties")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
Stock KASAN splat reproduced on QEMU (7.1.0-rc3).  A test module
allocates a 32-byte packet (tb_xdp_header only) and casts to
tb_xdp_link_state_change (36 bytes).  The read past the allocation
fires immediately:

  BUG: KASAN: slab-out-of-bounds in
       tb_test_xdp_short_packet_cast_trigger.cold+0x118/0x12d
  Read of size 1 at addr ffff888002110260
  located 0 bytes to the right of allocated 32-byte region

Also exercised over Thunderbolt 4 cable with 258 truncated-packet
injections (PROPERTIES_REQUEST 68 -> 32 bytes).

 drivers/thunderbolt/xdomain.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 4099419c74795..9d54e3ccc8278 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -55,6 +55,7 @@ static const char * const state_names[] = {
 struct xdomain_request_work {
 	struct work_struct work;
 	struct tb_xdp_header *pkg;
+	size_t pkg_len;
 	struct tb *tb;
 };
 
@@ -733,6 +734,7 @@ static void tb_xdp_handle_request(struct work_struct *work)
 	struct xdomain_request_work *xw = container_of(work, typeof(*xw), work);
 	const struct tb_xdp_header *pkg = xw->pkg;
 	const struct tb_xdomain_header *xhdr = &pkg->xd_hdr;
+	size_t pkg_len = xw->pkg_len;
 	struct tb *tb = xw->tb;
 	struct tb_ctl *ctl = tb->ctl;
 	struct tb_xdomain *xd;
@@ -764,7 +766,7 @@ static void tb_xdp_handle_request(struct work_struct *work)
 	switch (pkg->type) {
 	case PROPERTIES_REQUEST:
 		tb_dbg(tb, "%llx: received XDomain properties request\n", route);
-		if (xd) {
+		if (xd && pkg_len >= sizeof(struct tb_xdp_properties)) {
 			ret = tb_xdp_properties_response(tb, ctl, xd, sequence,
 				(const struct tb_xdp_properties *)pkg);
 		}
@@ -818,7 +820,8 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		tb_dbg(tb, "%llx: received XDomain link state change request\n",
 		       route);
 
-		if (xd && xd->state == XDOMAIN_STATE_BONDING_UUID_HIGH) {
+		if (xd && xd->state == XDOMAIN_STATE_BONDING_UUID_HIGH &&
+		    pkg_len >= sizeof(struct tb_xdp_link_state_change)) {
 			const struct tb_xdp_link_state_change *lsc =
 				(const struct tb_xdp_link_state_change *)pkg;
 
@@ -870,6 +873,7 @@ tb_xdp_schedule_request(struct tb *tb, const struct tb_xdp_header *hdr,
 		kfree(xw);
 		return false;
 	}
+	xw->pkg_len = size;
 	xw->tb = tb_domain_get(tb);
 
 	schedule_work(&xw->work);
-- 
2.53.0


