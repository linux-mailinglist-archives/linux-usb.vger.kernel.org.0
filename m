Return-Path: <linux-usb+bounces-32689-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOniLz3WdWn0IwEAu9opvQ
	(envelope-from <linux-usb+bounces-32689-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 09:37:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742380081
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 09:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C9E630293D7
	for <lists+linux-usb@lfdr.de>; Sun, 25 Jan 2026 08:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA39318138;
	Sun, 25 Jan 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuQuDQh5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463F248F4E
	for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769330148; cv=none; b=rqWVF80pBEYff413diAUbgEGQcJMbwm/h8w9Ie1xJm42c7Mu6fLpT1WyLHDKXaaKDdw/209tj7nmgcTM9MLp5LLhq96QnHAWUzPqc4WqEaUFv6yxQ4x4Cx6gMhfxH8MduwTVYBh1W0C03jvbm/EORPe6SHW5jod86yhqZMb8jAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769330148; c=relaxed/simple;
	bh=Dmm1TRrBtpj/3umYgMC5hu0FZAAmIQxX4Eo+n50BuMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dbnr9AiqnxORFrcVnvS41uqydjicXEg+MdmIAIgqLI+gUXtzpqYYHf/2ualXf0nMCBsLowrFYDQFZ/Nh7x+uzOs1uzf2RegY5847pK+h3EYzAxULLf6zJj5339VkNU5DfzTFduZ2uev7qCTVc/GDk8ZULZwz7O33gA4DinHV6KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuQuDQh5; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-11f36012fb2so5277030c88.1
        for <linux-usb@vger.kernel.org>; Sun, 25 Jan 2026 00:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769330147; x=1769934947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Nn9yi5frFUwKKyJLlUjP9/sqJsKgrFiePLpLSnfMfw=;
        b=VuQuDQh5XItkZkBTO0ywduNOB6iaEzdIrhN7FNe7JjzeASmwvVQaq/acgsF3nF/zCo
         wxxNZAzbhq236VWH2842mwzXhqLgK+7hCf5Xkj5lg2xna4O00/JHS4TI6i+3epBVw8ox
         tHAAXay53PxotuI+AZll3LwkFjglRKmAmuN5P+f+FpAxsNBR+9PN0X+mZmhdVIkrLwdx
         QSaZslykCl1/4TVoYmRojc6d2jXPPHHCBpWofNc+6dYLTYSfBXdBfGnKyAPOSlRYK3wa
         MJGDzpddlpUmK2i3ytUuqLxyeFm1Z9+uEYWN9FnFFpetFBb+HlQy+9e32CbuO626VAMG
         5yzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769330147; x=1769934947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Nn9yi5frFUwKKyJLlUjP9/sqJsKgrFiePLpLSnfMfw=;
        b=KUn3jYfFGp92HUMVjiTqmcnsddU67cXKtRM8Tn1FLOzfK/YcRY5cfJg4+GsNl8JIsw
         ubN9fLpraOX5kjWKNL1xsqQbQjEAPKijBg5x8kKJs1I7bmQ18GbErwTogo6ZHenPP5du
         AlGKMHlrxY3kWfqfsaKuiwO+yBdEqytboYO2nrCbZpGa1CLjE6odg6hd+UilMOnpoJst
         pQTjTutiXPdM+Un0F2ZFbgo5zXEcwrjneWbhsPoDGS+nDo+lp0GMcjAcXVPVzdXZ3bGh
         21OWg72Wv+UqehnglKkKMSmAi4EzFsOxeUQFcTqi6jv+btS8uPwpXrmMh4P6mG2hUh8S
         pA9A==
X-Forwarded-Encrypted: i=1; AJvYcCVCyjrl1R7Y4AnPo8/8SKfFyUzdddQ0iJsaZAOAEZDyORj39Vi7pi4dbjr77g7y6k+yRbEMm3zD3lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ0xjlT/lepyfQOVzQrw/i9ZxZHRw2bQlJF3cqsrHEwmX1zpVQ
	V9n41ikkO6x2z9Ry450lvtX82aR+yVjIvA1rGWWjbNfKFKZgUEQiBZ6x
X-Gm-Gg: AZuq6aLnslIMCmQ4CxDNn+WG9XJOlrOkqeKgLmNcpUpe39r877huGBMlOcf57Z2PCyg
	VXPEg/4vLlDBpHtqiQbOqBa2Uyd071sqckc0Eg36Eb3nPakbRONexg5VUy6ZUYmSXCUCM4ivKy7
	x+sv67Fr27jyzAzAv352GF+hBCU3lABHut4Q+x1HFqHpz3bjBQW1J4xX71r/79G3O8qKJs5e3nk
	IhWzV0Zz/4NulA2vbRW8EBjn+Q6VFFUH4J8z1Bj3KvU64tozp//24THP55JUBT2sQgV09tSBj+A
	8iv6t+vXIhSt57CFtPQAr90ffUlVjc4OIZWQstiBwikFzPUNnGlRCA2lnYnbfHgC1T5m6pC2pxK
	YaPiyv9vyKGMLq2ogsbcsN2pQCJ3DS5v7RmaCJYWHUjKoDltrCgGIPaRvMtxBEiwMcawkrjGzkI
	vL1AU9qkYfpBbjHsnTB1SNTLRGpbYq6o50atDlOJyaDG1O/1CYXF7MXhxeVq5kqlQkog76idb5v
	UnxVYd9W0NmWDZNZiAPgbVDwdczKrUuEqbDQuXpvMI/HgNuFvsjtzfKh5zrfZMfuGKEgM7k5BK7
	SDdc
X-Received: by 2002:a05:7022:4385:b0:11a:2e9c:1130 with SMTP id a92af1059eb24-1248ebd10d4mr576281c88.7.1769330146742;
        Sun, 25 Jan 2026 00:35:46 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7410615c0sm7994977eec.0.2026.01.25.00.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 00:35:46 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 3/3] net: usb: kaweth: remove eth_addr_t typedef and bcast_addr definition
Date: Sun, 25 Jan 2026 00:34:57 -0800
Message-ID: <20260125083501.34513-4-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260125083501.34513-1-enelsonmoore@gmail.com>
References: <20260125083501.34513-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32689-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2742380081
X-Rspamd-Action: no action

It violates kernel code style guidelines to define typedefs for
non-opaque types. Update kaweth to conform to these guidelines by
expanding the eth_addr_t typedef. Also replace the hardcoded MAC address
length of 6 bytes with ETH_ALEN, and use standard kernel APIs to assign
and compare against the broadcast address.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/net/usb/kaweth.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/kaweth.c b/drivers/net/usb/kaweth.c
index c9efb7df892e..f3fe76e46490 100644
--- a/drivers/net/usb/kaweth.c
+++ b/drivers/net/usb/kaweth.c
@@ -164,8 +164,6 @@ static struct usb_driver kaweth_driver = {
 	.disable_hub_initiated_lpm = 1,
 };
 
-typedef __u8 eth_addr_t[6];
-
 /****************************************************************
  *     usb_eth_dev
  ****************************************************************/
@@ -185,7 +183,7 @@ struct kaweth_ethernet_configuration
 	__u8 size;
 	__u8 reserved1;
 	__u8 reserved2;
-	eth_addr_t hw_addr;
+	u8 hw_addr[ETH_ALEN];
 	__u32 statistics_mask;
 	__le16 segment_size;
 	__u16 max_multicast_filters;
@@ -882,7 +880,6 @@ static int kaweth_probe(
 	struct usb_device *udev = interface_to_usbdev(intf);
 	struct kaweth_device *kaweth;
 	struct net_device *netdev;
-	const eth_addr_t bcast_addr = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
 	int result = 0;
 	int rv = -EIO;
 
@@ -991,9 +988,7 @@ static int kaweth_probe(
 	dev_info(dev, "MTU: %d\n", le16_to_cpu(kaweth->configuration.segment_size));
 	dev_info(dev, "Read MAC address %pM\n", kaweth->configuration.hw_addr);
 
-	if(!memcmp(&kaweth->configuration.hw_addr,
-                   &bcast_addr,
-		   sizeof(bcast_addr))) {
+	if (is_broadcast_ether_addr((const u8 *)&kaweth->configuration.hw_addr)) {
 		dev_err(dev, "Firmware not functioning properly, no net device created\n");
 		goto err_free_netdev;
 	}
@@ -1043,7 +1038,7 @@ static int kaweth_probe(
 	if (!kaweth->rx_buf)
 		goto err_all_but_rxbuf;
 
-	memcpy(netdev->broadcast, &bcast_addr, sizeof(bcast_addr));
+	eth_broadcast_addr(netdev->broadcast);
 	eth_hw_addr_set(netdev, (u8 *)&kaweth->configuration.hw_addr);
 
 	netdev->netdev_ops = &kaweth_netdev_ops;
-- 
2.43.0


