Return-Path: <linux-usb+bounces-33587-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNs6JC+cnGmhJgQAu9opvQ
	(envelope-from <linux-usb+bounces-33587-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 19:27:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B2717B7A0
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 19:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B17430498E3
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 18:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961A3341041;
	Mon, 23 Feb 2026 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MmF4Zosd"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC1933B6C9;
	Mon, 23 Feb 2026 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771871274; cv=none; b=BJGxAaYQPvuJRv5FQNDgWe0YXkcpNd51gTrIw8gGX1EKskjBrQsxNxXMLQeW1uiFY182N8QtXa3j9WxJOs1F2haE2s3jd5FVbKI8zZskDR1RrQv8RuxkKPqUqTt1jn48lRLmqa/GZo0qwTT+/q3ppt9186uQ0Sf976ZEk0jmrRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771871274; c=relaxed/simple;
	bh=IE3CDoGvS1e1ziRaLdXOuivPtrDnoJiPNBALZlwZclw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SDNZDZnZHB2GdAtaWaNq0STWQu0rjQuGnE5og4fjrG9E+4exGGRi1Mi3lVgvRp/gPUsazrD6uQsMlS15SgCRwqObWb7XFqpNXquQ6ktOceWyG7YskaAjf/qmdh0xatwuHJS5PvzWnR/i66rZcRRmeoSrr5/CeKFedFIWL3TNrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MmF4Zosd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771871271;
	bh=IE3CDoGvS1e1ziRaLdXOuivPtrDnoJiPNBALZlwZclw=;
	h=From:Subject:Date:To:Cc:From;
	b=MmF4Zosd7LLRCW2R8gLgW+kI8s6lXtSI4zVlPGlR/n1Ntfhfmjj3vbaEhbCvDDHyT
	 YJymhcIaR/zMON+C3x5A1fzh41O4U8HmmFKXRM48gH5paeWDh/AKPbTDv7QJDnMjXS
	 XdUo2LlUaVDnH6xaUUaBD34SXZl22QoGCqQmaY7yxoizvpGDFK8zkkl4mTregiHBfi
	 dOLfi5faDPcP6Bl8mCGjhWVS5pW2Kal0uH5HmPP96emlyO3kNE8SXVeGt9338NpwDY
	 gzFxX/IAWQ4j5AFDzAowioO2xpdp/aBqkFRCUi2beXZZpb4iCFYZopKWjjftze3W2w
	 UjHhDXSMuizcQ==
Received: from jupiter.universe (dyndsl-091-248-208-033.ewe-ip-backbone.de [91.248.208.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43CD717E069A;
	Mon, 23 Feb 2026 19:27:51 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E3659480024; Mon, 23 Feb 2026 19:27:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v2 0/2] usb: typec: mux: avoid duplicated mux switches
Date: Mon, 23 Feb 2026 19:27:37 +0100
Message-Id: <20260223-typec-mux-duplication-fix-v2-0-0402fefc222e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABmcnGkC/42NQQ6CMBBFr0K6dkxb06KuvIdhUcogkwBtWiAQw
 t0dOYHL95L//i4yJsIsnsUuEi6UKYwM+lII37nxg0ANs9BSW6nVDaYtoodhXqGZY0/eTbyAlla
 onUFzb60prRO8jwlZn+13xdxRnkLazqtF/ew/1UWBhFJKjpbe2Id6+dD3rg7JXX0YRHUcxxfBa
 Em3xgAAAA==
X-Change-ID: 20260213-typec-mux-duplication-fix-ba5e58f6576a
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=IE3CDoGvS1e1ziRaLdXOuivPtrDnoJiPNBALZlwZclw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmcnCbpEtNIRhMXwyPQwppKb25UhMTInVSA8
 ZBb9NVBJ4KQxIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpnJwmAAoJENju1/PI
 O/qaty4P/A0CPG8UT80MqDn/+NYTsJo+IQvqSQOZbk0vpWWAv8b8NCVcAJc5jIe3WIGuedETR/h
 SpFAwflYge6HBIRZE/1PHvK5TATPRhhb9RNv9bASBqcLJW0ZAlrqgN9jciKFOqslsWWEXkyLC23
 3fZIxEO9XiZ6xUhlm5nzwUQyU2xSWs/4ajIxbG4Ho95yPR7A8XcXmqAMc3R4Qucv3eXRSWdbSGx
 GuYpfO+2s7fxVcQcrOIfeV/f9E2rj0u2sDfGgbbRAsMYYZ0QM1Iim4JuWwsbwNsdTmUnSD3J6tB
 Y+enuGeiLFNQEbEm2xDY3NLWEd4sSUu0NtLE6sBWlVYgh0kkATO2HapkrUifL6/uGm6MpzWSsg3
 eqUDBGDX4PFUYIxDihq8pf0qbttB0k7ceGIzKI8YFGofyQmCb6CsnHG2gHO+L0BnPocwHN1STad
 78QVEmsyyJKTTDCw9NQUNkpZrQ0KLvm+5HBmHjGbOSZwfwOQJpV12/UET9opGF6aLkIYVVRklJG
 +U8nI9sx2PEDTAR8WgdssXYhm3k1DxI0f7VdWWq8ZY5yLwh9D5mOJa7DD/rHEZKehADWz0P46K0
 gpE5yWSBnWFj2u9sYh0e9dNhzAyZl9pOTgs2HcXYpe0qtJk7G3fwdUhjQ0qlHbOoZvFwVdzXf7Q
 8eJ5apFcG/ESmYFtiaNskWQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33587-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 13B2717B7A0
X-Rspamd-Action: no action

Recent Rockchip SoCs (e.g. RK3588, RK3576) have a PHY, which
handles USB3 and DisplayPort as well as orientation and lane
muxing. By setting up the DT graph from the USB-C connector
for the SuperSpeed and SBU lanes to the PHY all mux/orientation
operations are applied twice.

I did not add any Fixes tag, since applying the settings twice
is not breaking anything. But it's confusing when debugging
USB-C issues and obviously wastes some CPU cycles.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260213-typec-mux-duplication-fix-v1-0-70076a7c5691@collabora.com
- move the dropping logic into typec_*_match() functions (Heikki Krogerus)
- rebase to v7.0-rc1

---
Sebastian Reichel (2):
      usb: typec: mux: avoid duplicated orientation switches
      usb: typec: mux: avoid duplicated mux switches

 drivers/usb/typec/mux.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260213-typec-mux-duplication-fix-ba5e58f6576a

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


