Return-Path: <linux-usb+bounces-36585-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPaIHJsT8GnXOAEAu9opvQ
	(envelope-from <linux-usb+bounces-36585-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 03:55:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB747C8B7
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 03:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EF95301DAF4
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 01:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB772DEA6E;
	Tue, 28 Apr 2026 01:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m26eo4X/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FC72D6E5C
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777341326; cv=none; b=Ra8VhKtmyO6V48UviQfD1aAy9+mSGhJnP1sQdoOzpYKID8usCX+vXUkKVCxVBkCqAaZgUdVbbY3TIfD3UOCfOrY9UPes4G3N5S4T+hP4Dr5oSLGPbSijjY5IzXua3bZhUWiD5PHzG1Px+E54V2bxv2r0xgF2zMLb6w02t9X4M6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777341326; c=relaxed/simple;
	bh=Lp4FgAS5IXrLpC+iwjVCifRhAKPBEknYqsntLZxXErc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EHPoi/yeLY6NF1sRjJDwYCh7nsLXfq23+RiwRdsq77TKPRPpt5Eb9WWKBzVExbcmoLX8qo5z4M+L+5jsCH+AxY+UnClEgmJytRy8ucp3jwsynhME4EuqMf5NumzrGcy8/wlhAdz6DkQBv+CioSHYLM2hangL7jMy3+8vkZo3VtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m26eo4X/; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso8894692eec.0
        for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 18:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777341324; x=1777946124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1mCgWFWudVfBQtdDsUREHZ7Syu7GCFnDU4PVfnBvZk=;
        b=m26eo4X/hfhzyNDa3F0C5ud1PpOZDmKzk0DdF5If8/YqtGTPIr9Gcvkvda/b/v24bh
         1shMhAhrXfSonssEMWxB4vNcc+TCkdCsPeizc97JP3o+hAQt2rl/4E1Fdc7mKtBG5tLz
         IbFHXlzVzZMY/kaulEacOpssGhciHW8Eajx/7LCsQ+ZTLfXcCaLxySBUOL3MmICAx07t
         H8k0Z2tXEgBcrKNroQCFMaxGxSacg1lRhz5/iqp7j+Wz+cMWC6rrlL6vBAyKoi0r/kQN
         FbS03n7x6gBYiZpTSqOSSiX4dcaOCf4RJjmxa57K5h46geKkUEUg1v76nuXu7llAzcOc
         Iufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777341324; x=1777946124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1mCgWFWudVfBQtdDsUREHZ7Syu7GCFnDU4PVfnBvZk=;
        b=Y90P+IpxMYj9orNMUDIsDQBEmm2RVz97p90XfRjF2o/yNYU7r+/4o/NBvdi/2CRutF
         DRJFoMdhky219ZA/g8x2f8dI6jlvV0RfuuTsbielUXpojokqr6adH5XaQhEnnIngVofP
         5whwSTgDq2YlSLE6I34T0sHQvAZsW39RnY3gGGzzQ4Pu2x7Lw8FU9UyUZE+bgtsxP2Dv
         3sopDmpPHEHhc9bhmGk28PR/tmnz5tNhxQK732+L3YjIzk/PQS7SQrcVS3bDQHMiXtDb
         oYed9OTk+WqPT8McIYlvDmkwBnm90HUkr7/OUkZ16FzNoFPRAAZY9ShwrcHsv5rno4AT
         67iA==
X-Forwarded-Encrypted: i=1; AFNElJ/UIG1CgB+aDg/jPk7XcwUhmg8etqfuXRtgVJBSlc8npK2Eg2y3ZbsDBJCUQMx+Ic8E+fV3sjArm1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YygFOwetN/lUeL0iEBshuwSRnkAnOevtm7fVjCz81muzT9cDsM/
	/P+tY+MXiGp5a6yUFsQ4hfdi4yIgi4BxmSbysSwh7mWD5bWb/qutR2QX
X-Gm-Gg: AeBDiet0SbiNOqcwcAdGIBb5bJzSW8GxcgMn63UffLPvyzf4IPqfaowQCpFxKPWkSnO
	MG8YGMbfnSqOBloP/jTR2VUH96zEP08cj4cmTSRXcGAP06z6js9+Weq6EylXQ8FaOh/i0uTo+4q
	R7XpRiNx96cReD1rsS1IhXLYZf+pauA6vsyX3bu9/1CVT+vn2vuIpfULFgehYiW7hbLtsgFikDp
	VXEYfzXX33efiTgjhALHDYuTj2RRKQU3JcEqnDY4g7m6fRJUzcP2BYO9LHScEsPrhoktgn0Ry4V
	aDTiXGPsjtG+giYPiwLkYVP9qVD8wcTnFZy0Fin39EqsFLb3bhjA8aX4fxNx1PV+pG/ZUVoWk4B
	wkGdfYUtkxGI8sp6mT6s3zKzgQxBGvJMNna/TkAJRqItcetPoN949hdHjoeWLtsxLf/juPwazrS
	yonGCdAaExM4Xq16ZO6AhJTUT5AdxQTTDt/2iN2GEZrJYhkrtmUNiyM0Lt7wdSt+sNl6rynBYck
	rtzPJuyyTaB9TAwNuKPN9pEPeQ3f51Z0asti5hEss+XY0d3+fCj0Mw5ie6sTP6f0qgQSQJLzaz0
	VThpPQ4vz//ZY+5+4bgbI1oTAWsMwUpifHXtbvc=
X-Received: by 2002:a05:7300:2d22:b0:2c5:6140:54d6 with SMTP id 5a478bee46e88-2ed0a3e8087mr459756eec.1.1777341324033;
        Mon, 27 Apr 2026 18:55:24 -0700 (PDT)
Received: from appmana-001.i.appmana.com (23-93-84-4.dedicated.static.sonic.net. [23.93.84.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed09f8a909sm1233947eec.4.2026.04.27.18.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 18:55:23 -0700 (PDT)
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
Subject: [PATCH 0/2] thunderbolt: fix wedge under sustained tbnet load on AM4 and AM5
Date: Mon, 27 Apr 2026 18:55:19 -0700
Message-ID: <20260428015521.3454006-1-benjamin.s.berman@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 06DB747C8B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36585-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjaminsberman@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Greetings Thunderbolt maintainers,

These patches for drivers were tested by me, Benjamin Berman, a
software developer, but they were authored by a coding agent that
had access to and ran the patches against real hardware.

The purpose of these patches was to fix Thunderbolt networking between
Thunderbolt 3 and Thunderbolt 4 (USB4) hosts on AM4 and AM5. I observed
these issues when using nccl across a Thunderbolt daisy chain: the
connection would drop abruptly, and performance was poorer than
expected. In any instance, I had to also update the NVM by exotic
methods on the TB3 controllers for AM4; AM5 generally ships the
Thunderbolt controller NVM in its UEFI patches.

Please advise on next steps for how to improve the patches. I can also
make my testing environment available, since it has a bunch of random
but useful Thunderbolt hardware.

Below is the generatively-authored explanation of the patch, and the
patch itself:

---

Two changes.

1. drivers/thunderbolt/nhi.c — tb_ring_poll_complete() gates the
   unmask on @start_poll rather than @running. Under load on NHIs
   with several rings in NAPI poll, a race with __ring_interrupt()'s
   unconditional mask leaves the ring masked: MSI-X stops, NAPI is
   not rescheduled, carrier stays up, no driver event fires. On NHIs
   without QUIRK_AUTO_CLEAR_INT, stale REG_RING_NOTIFY_BASE state
   blocks MSI-X re-arm. The patch gates on @running, adds a posted-
   write barrier, and clears the ring's pending bit before re-enable.

2. drivers/net/thunderbolt/main.c — TBNET_RING_SIZE=256 and the
   netif_napi_add() weight of 64 produce ~1 % rx_missed_errors on a
   TB4 transit under sustained tbnet bulk traffic. The patch raises
   ring size to 2048 and the NAPI weight to 256.

Hardware tested:
  ASRock X570 Phantom Gaming-ITX/TB3 (AM4), Intel JHL7540 2C TB3
    controller, NVM 50.0
  ASUS ROG STRIX X670E-I GAMING WIFI (AM5), Maple Ridge 4C TB4
    controller, NVM 43.83
  Monoprice USB4 Gen 3 40 Gb/s passive cables
  Linux 6.17.0-22-generic (Ubuntu HWE)

Workload: NCCL 2.28.9 all-reduce over tb-lo, NCCL_ALGO=Tree,
NCCL_PROTO=Simple, three ranks. Pre-patch the connection wedges
under 1 GB transferred. Post-patch a 192 GB run (3000 iterations
of a 64 MiB all-reduce) completes with mask/unmask counters
balanced and rx_missed_errors under 0.005 %.

Built clean against linux.git commit 3b3bea6d4b9c.

Benjamin Berman (2):
  thunderbolt: drop start_poll guard in tb_ring_poll_complete()
  net: thunderbolt: enlarge RX/TX ring and set NAPI weight for sustained
    load

 drivers/net/thunderbolt/main.c |  4 ++--
 drivers/thunderbolt/nhi.c      | 22 +++++++++++++++++++---
 2 files changed, 21 insertions(+), 5 deletions(-)


base-commit: 3b3bea6d4b9c162f9e555905d96b8c1da67ecd5b
--
2.43.0

