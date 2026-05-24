Return-Path: <linux-usb+bounces-37987-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDWhLiP4Emob5wYAu9opvQ
	(envelope-from <linux-usb+bounces-37987-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5845C2770
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 15:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0C893016803
	for <lists+linux-usb@lfdr.de>; Sun, 24 May 2026 13:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B530397E96;
	Sun, 24 May 2026 13:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LMnDuvJJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F22882D7;
	Sun, 24 May 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628015; cv=none; b=R+SHbkKcVroiJNyTEeanlYx6xCWoURHGuRZKvaIxeVi8uFbJ/BETdN93sVKBPpZYhes/RD3LsmjQ0IJPLTeGj6nxK+9Y8B7F/ySAxUS+TiDoEQqOsCq0UoHqvDSmzwCiJNtatuQTgtmXhUA3jimD0kygPbh0U55NnpoQCfpSr3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628015; c=relaxed/simple;
	bh=Yfig0k7nKW0N6HBRsxhHpMOsuoaIRG7ptc6kwrciiZ8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CPwZW8T4EhxfmUbXTVzGVoy3KnFjyFGi/A/jySfSZXO2/eQJUr9FpaDeZh/ZQTamdjg5rl41rHBzotDT7cT+56csRXBiYpwL4w65i9sPcaKjhTaQPhDK0RIo+OKx+RTVETR/TRU05V7SB/sVvz6Qkpt99SqXDBQIgKq8h4Ni1XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LMnDuvJJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1779628008;
	bh=Yfig0k7nKW0N6HBRsxhHpMOsuoaIRG7ptc6kwrciiZ8=;
	h=From:Subject:Date:To:Cc:From;
	b=LMnDuvJJn+BD90RANNEmZ8ylb4Oz9za3gxMPEmQp1EhD0lc/ms/q082wCb5cBBnyK
	 2KKMPaBm21/KaFYEzpCsAd9/BP5KY5YLsYQ1Z2E+S372FOoDTgW1taeimdpLat9Ci0
	 h8LN4Rq8zgjAblefHLnJTsHzD9JSBzU3ri1M3GKc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/6] thunderbolt: property: Fix property parsing on
 big-endian
Date: Sun, 24 May 2026 15:06:42 +0200
Message-Id: <20260524-thunderbolt-big-endian-v1-0-6044edca78e7@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFr1Jm7UAatKBXERdNMmlHZKqTpAild
 zetXT54//0FEilTgluzgNLMiSep0J4a8GMvAyGHymCN7czFnjGPRQKpm14ZHQ9IErgXvEbTWh+
 96ayDOn4rRf7u4fvjz6m4J/m81Q5D6VPqYz60df0BPpQtuY8AAAA=
X-Change-ID: 20260524-thunderbolt-big-endian-9f012cfc062b
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yehezkel Bernat <yehezkel.bernat@intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779628007; l=1170;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Yfig0k7nKW0N6HBRsxhHpMOsuoaIRG7ptc6kwrciiZ8=;
 b=N99IHWzqB/+gVIroVtVpb3EXOBRxqSeX1kRdxv0jKx+XW+qdaF/SzwZkc2hMj//YOHKaXqWZD
 t6EOft1dt7xCAzPD+GheJelo9A4DrOyzs120X/XQ6T4xdSwDn0RtW7f
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37987-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,davemloft.net,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6F5845C2770
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The parsing logic currently only works on little-endian.
Also make it work on big-endian.

The first four patches are necessary to make the parsing work on
big-endian machines. The remaining ones are some trivial cleanups.

Based on thunderbolt/fixes.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (6):
      thunderbolt: test: Make root_directory independent of host byte order
      thunderbolt: property: Unify format_dwdata()/parse_dwdata()
      thunderbolt: property: Make format_dwdata() work on big-endian systems
      thunderbolt: property: Convert byte order of numeric fields
      thunderbolt: property: Unify parse_dwdata()/format_dwdata()
      thunderbolt: property: Make entry key modifications more visible

 drivers/thunderbolt/property.c |  93 ++++++++++++++++++------------------
 drivers/thunderbolt/test.c     | 106 ++++++++++++++++++++---------------------
 2 files changed, 100 insertions(+), 99 deletions(-)
---
base-commit: 6ff00aaa856d16015e5bafbcf89e3998fd4a7c2b
change-id: 20260524-thunderbolt-big-endian-9f012cfc062b

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>


