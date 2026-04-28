Return-Path: <linux-usb+bounces-36586-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA5dB9cT8GnXOAEAu9opvQ
	(envelope-from <linux-usb+bounces-36586-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 03:56:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 964D147C8DE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 03:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 326AA304C104
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 01:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0707C2EBDDE;
	Tue, 28 Apr 2026 01:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WwWWmicU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3872DAFCC
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 01:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777341328; cv=none; b=hHsEEk6ko3h/36cHdqkac1d9U5h4g86e40rVgnPXPrezlI8SgMPdlUGTcSL+JNnkkwbcfOAcveTYJY9J+G/Zgf0QPVkyW+G3R3j6dO6vVmXevoozkhgouGMPTqvWkXG4hGY70VT+PH/NbfoSXqXkbZfvY00iBJu2vNOcAgdsAAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777341328; c=relaxed/simple;
	bh=pV74rYbo4PSnOntrueYInbZC2uJly5cb2kmGtmKzl6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S9njV0jXWeMpswQr84V5HOMtw3WQpTquYziWMEx3+n+vdNC62gmFA8o+EWwnEdrKTorqQTuRhljjtJixxe9Mw7ZAen8bIc37AyVlU0CUbd6mP6/ZJF3jbCsV0uNlZAycWwLhMhnTQDTsx7O2RKLKsB/jiTTpm+XUnCvcXffuKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WwWWmicU; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c15849aa2cso14555629eec.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 18:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777341326; x=1777946126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+7z2IOdn6pmZUm+ZpjK+hZD0XE6Xe2S5mjthipPTXY=;
        b=WwWWmicUwys5z2BOATb5HbsxIjU4+n++1V1B92iGfVOBkzawckPKXEydd/DW6oYwK4
         col/I9Wbs32Z9vFsLtZ9Qp3i+QZmyiWnFZ05MqVjjVnR47f1mvMoIXqNRiEzpcjEhVs2
         Kh+oTHvOA/x2aX0Lru1Wrk0pb0rADgOyKV65cs5hpojafz5mJwg1QfKIbCLj2jvtD8FP
         FwfF/GtH/f8bnf3AloESrkjTIk2n0yS2Ahq2m/NouMaKh64fRDtv3CmywxO/U1ewi+kt
         Btgx62FxHwCzjQKuMdZCc8TH4zxhjvexjSSvauhOzAWCHXbBIavNxeVvPoESptUOxdwK
         tUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777341326; x=1777946126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3+7z2IOdn6pmZUm+ZpjK+hZD0XE6Xe2S5mjthipPTXY=;
        b=VjVJg4j34UDY8SEv38VaS+XTz9DoTibKoh4F38owhhU5vjfvmF4ZmGv2Yu6s2cQLam
         LyatBr6U0xLmREzMW7cUCtlEscOPYsRgdgoPb3segiT2Oz/QETSvTv5dKxbmsGeAjCLL
         /4GIQmRpcWEDgw5RdyXQ0jFvuaxriO4QeLz3UdlPdq4oUiF0/lHLxeHhTsaNl/mA7qqD
         AdgNal/WOhxlpdE/ubZZxEjJ1Gx3yMypSnZeqWKQRJDPRWilFCF+yYOkcy7+l0iB69FR
         S26kfGa+M6/kgOZf/Kz6JnJtFeXL/FNGayD/7R5QWMUbBnHp512Im9q0yalql/yvO0TQ
         G/VA==
X-Forwarded-Encrypted: i=1; AFNElJ/hoZCWJANsbC+bhPiqi04qnqn1TSLs38SvIAov69mAm07X855F756++ntmdDaHvMooAgSJDP4FD9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YznFSSVhWSaUXfxpyXbeLZJT5k3gSTdBSz78iDQFENSHTx8PzeQ
	rdP1HQutDAroZDFdigeIxiK+2SoOV9Wsr+g7rNvxqKIWxpX50kP83MhA1AgL05tP
X-Gm-Gg: AeBDieuRAioxgFOD6eL/1sZyPk+naacNPiQs0FNrBERIMWCt9MQ6bKu3/Dsdkpd/jNF
	4mAFrcSElYHX0ITAk69rpghhkIjB6AWN7cernKDij+b4qq+V5AZzFOejKwtyriWWVIRRw08Eg6q
	oCQtRn3tX44E8IqCaxl4TZmDxZMs2FeSb9egy5Wkh8Yw8SCY0prm919Pc+5We5QokYguhsecxzE
	DNWAeuoZSfcW+zp2x8hFPkk6hqEQuvFYdcQTAGLm7xKEPResFMpZJXsoSybHs5rKMj7lvzJfZBh
	Qs+JhKbav2Q1uBsUc0TIJxVjhrytYMuW7fo8XTf1oGV5lm4gbOHDRdWqSWue15EmSsOimhoFiHb
	z7ujzPKlesdfhDeaUhLz8C4KmCd2JpTtAina4ynPCnsTeYkZ24orzKIUlBqQUxHsmdjYj1bvJ9c
	CcQ7P85rFd+S5spNRCPlNdhEVp3yZrbvbWCveJEVmuLnP+ZUdpz78+GTPneQzN6T9Wn7Wd6NSgZ
	EpwjuyP+JCkQJvS82MCr6TDpQj1TebkpZ6iyiZaAg6in6mZP62f2e9NcBcjCPT640ppuk2ccfG7
	Uv9TwRpzaknjX2OborvML8SqSebrz6di3Gjkkqs=
X-Received: by 2002:a05:7300:3b06:b0:2ed:935:aa33 with SMTP id 5a478bee46e88-2ed09fde4b5mr587329eec.5.1777341325650;
        Mon, 27 Apr 2026 18:55:25 -0700 (PDT)
Received: from appmana-001.i.appmana.com (23-93-84-4.dedicated.static.sonic.net. [23.93.84.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09f8a909sm1233947eec.4.2026.04.27.18.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:55:24 -0700 (PDT)
From: Benjamin Berman <benjamin.s.berman@gmail.com>
To: Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] thunderbolt: drop start_poll guard in tb_ring_poll_complete()
Date: Mon, 27 Apr 2026 18:55:20 -0700
Message-ID: <20260428015521.3454006-2-benjamin.s.berman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428015521.3454006-1-benjamin.s.berman@gmail.com>
References: <20260428015521.3454006-1-benjamin.s.berman@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 964D147C8DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36586-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[benjaminsberman@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,anthropic.com:email]

Under concurrent load on a single NHI with several rings simultaneously
in NAPI poll (e.g. a Maple Ridge TB4 transit forwarding tbnet traffic
between two peers), one ring's interrupt enable bit in
REG_RING_INTERRUPT_BASE can stay cleared.  MSI-X stops for that ring,
NAPI is never rescheduled, but carrier is reported up and no driver
event fires.  The ring stays masked until thunderbolt_net is reloaded.

tb_ring_poll_complete() gated the unmask on @start_poll:

	if (ring->start_poll)
		__ring_interrupt_mask(ring, false);

while the ISR path masks unconditionally via __ring_interrupt().  In a
window where @start_poll is observed as NULL by the unmask path while
the paired mask persists, the ring is left permanently masked.

Gate on @running instead and add an ioread32() barrier so the posted
enable reaches the device before the spinlock is dropped.

On NHIs without QUIRK_AUTO_CLEAR_INT a second issue compounds the
first: stale pending status in REG_RING_NOTIFY_BASE can prevent the
hardware from re-arming its MSI-X generator when the ring is
re-enabled.  Clear the ring's bit in REG_RING_INT_CLEAR before setting
the enable bit, mirroring what ring_msix() already does at ISR entry.

Verified on a Maple Ridge 4C transit and two TB3 Titan Ridge endpoints
running NCCL all-reduce over tb-lo: pre-patch the chain wedges in
under 1 GB; post-patch a 192 GB run (3000 iterations of a 64 MiB
all-reduce) completes with mask/unmask counters balanced.

Generated-by: Claude Opus 4.7 <claude-opus-4-7@anthropic.com>
Tested-by: Benjamin Berman <benjamin.s.berman@gmail.com>
Signed-off-by: Benjamin Berman <benjamin.s.berman@gmail.com>
---
 drivers/thunderbolt/nhi.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 2bb2e79ca..bba45ec36 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -389,10 +389,24 @@ static void __ring_interrupt_mask(struct tb_ring *ring, bool mask)
 	u32 val;
 
 	val = ioread32(ring->nhi->iobase + reg);
-	if (mask)
+	if (mask) {
 		val &= ~BIT(bit);
-	else
+	} else {
+		if (!(ring->nhi->quirks & QUIRK_AUTO_CLEAR_INT)) {
+			int cbit = ring_interrupt_index(ring) & 31;
+
+			if (ring->is_tx)
+				iowrite32(BIT(cbit),
+					  ring->nhi->iobase +
+					  REG_RING_INT_CLEAR);
+			else
+				iowrite32(BIT(cbit),
+					  ring->nhi->iobase +
+					  REG_RING_INT_CLEAR +
+					  4 * (ring->nhi->hop_count / 32));
+		}
 		val |= BIT(bit);
+	}
 	iowrite32(val, ring->nhi->iobase + reg);
 }
 
@@ -423,8 +437,10 @@ void tb_ring_poll_complete(struct tb_ring *ring)
 
 	spin_lock_irqsave(&ring->nhi->lock, flags);
 	spin_lock(&ring->lock);
-	if (ring->start_poll)
+	if (ring->running) {
 		__ring_interrupt_mask(ring, false);
+		(void)ioread32(ring->nhi->iobase + REG_RING_INTERRUPT_BASE);
+	}
 	spin_unlock(&ring->lock);
 	spin_unlock_irqrestore(&ring->nhi->lock, flags);
 }
-- 
2.43.0


