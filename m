Return-Path: <linux-usb+bounces-33413-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG1rNmiqlGl7GQIAu9opvQ
	(envelope-from <linux-usb+bounces-33413-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 18:50:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F88214EBDE
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 18:50:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F1293036384
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 17:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5008372B23;
	Tue, 17 Feb 2026 17:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b="ooIlxA//"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A7B35D5E2
	for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350618; cv=none; b=Vpj4+paQjdlr7Ci/AYbANPHjO3KlnAfW4RDEwDmaah1BV1YRHFiHe8GapGpKKsUXXMlKtRjPqAgLPB+jqdL+OkWH2c62v6tUp2q4jQ8PaP9TDb5vUxmhGl1zeH6LhmNnlcP5qNIiicJoMqlOhQKtpdB/NZ4qbtcezOYRN9Z2TJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350618; c=relaxed/simple;
	bh=IJAhYnN8LRPGZyhkVx59hrOzpdCmz9BMmhTWUhgh22o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rAN8W66jAqxpfLslgTLzwtgrJe8u60uOy6k1OQx/5j6NBU+HCoJnnGRd+QuaAl5v7bJcGP/nc7yzqdjNvKWJ/SvlOJ32ChDkzZ/y6oAqxLqIu3WYQX9b4HxkiFJsSPc1p4ZfP79RHFOss/NmoUJFqQblx8butbo0nZDXk3JFQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu; spf=pass smtp.mailfrom=u.northwestern.edu; dkim=pass (2048-bit key) header.d=u-northwestern-edu.20230601.gappssmtp.com header.i=@u-northwestern-edu.20230601.gappssmtp.com header.b=ooIlxA//; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=u.northwestern.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=u.northwestern.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506bcb23a78so24883281cf.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Feb 2026 09:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1771350615; x=1771955415; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tg4p4mgVuyaqYrmRkJ0CRO2fk4lsHW/JKl6dW870fR0=;
        b=ooIlxA//Od+3hxkecOWHnTyl4pYvWkY/cwH4IDod5CQd4/bT3hRwRgqZt4aTNvLIuQ
         X+3Qv7eTu6en1BYAavLRNRzP4pe3DVhVkoIO/dcUTGTaI4dF/apYDzW4eq9ilzvQqJDo
         nPNB9MY/8MnGQDJPRhjAb96+vGfFne99Ei0NXL1l136KdXCa3egd+qKoLICnVTOPYlsP
         DCAL97/FOcgslq5DZHY8+nLItFmW4VXQLXxLS9CbWPb9QmygZtnjwrCXXuwI7898rIB6
         Ki/ypNU40N5Hw1OUfs+iOUNjHKDQjLq5iM28waFY1czu9mS3xxmAynTMlw0t8ZVWKO9h
         LM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771350615; x=1771955415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tg4p4mgVuyaqYrmRkJ0CRO2fk4lsHW/JKl6dW870fR0=;
        b=Tq/mLPJfDG7pQsgSr23yEP1y37UqUMiysJvMQErjG7TSl1NdGmz3r+OPAgAlVWBT79
         3hA6qb9p2eRXu/p4tOd23ezwiJIg/e7khzuZTLNo1kumiwreyba9alA2TlmmKDWEfXvV
         SYms5hONTw+RdfdGkpWwMF+0pR4AoY6ZL+LnjloOEYm89Zmr30j7cNhEviDXFjJRKvmn
         siPhbrPXGzWhtxFzFWgQ8+PNlgcobYedjpte2cyhSS/GEG9b6B+DMkU2nOElJlbtk+qo
         U+qhUEzGy+fAZVA4JYc3pBq2zfR8/sMroz9Vq9X+X6mjxvZ7Yw8jZcqqwTdEjjUelahK
         FMrA==
X-Gm-Message-State: AOJu0YzsHEXUIzYrKiXua/MgMUWtAR8yVPFqe+uS52X8acdRk7eCjxtZ
	pl2XAYjKFHxkGKOPaenwscwt1xfV3I+G6u/A/lPQthKjMw+yNmPoqyyFd0V8x6MLr+4=
X-Gm-Gg: AZuq6aJ7WWYTrKztm76NbbpPok3RzvFa8aWSR90bXUA+O4luR92o59XdGd95MXO1jP2
	hMvmaOAyg7ccxe/2VoZnNF3kwu716qPKPOJPIBUc9Z7aarYr6SSllnorayQ6eqLgQ8sBMZJtL8k
	Uhdlu0h+BiYvlOicaYWeRSS1KnGH96hB1ErgR4btNfmJ1TqqHU04phSFDPkXzjEzSP4mTFpF8LF
	bm+dM2dO1RTfvbtygIGGRBwFRNV4BRKlV5hvm2YDLA1wQXafPwmySNuz+RoONQOY4ywZXPOnOJg
	U+sEZfBtL6YbHEIKMbilwYfDmXpmQ7aBlxsoMuI4P8NodimzyrEF2f/bfJzvlq0yLUsj7zL62bM
	IhqGvVyTnRQ/BDOb/FkW/h65OB+oMcWUCpRZ7Anjyz2tG7iZ243xz1ARncnL85yym22zx9XD0Pt
	ASvjmz8gkOgIV5WpUq/UEoid02POoCkhC2PidT0LoxPupu9ohOoDUpc5bOmhS/F+jgYADXZk44V
	9Ad/PNo3NrnCtzBFRVvNUOYJ0LMEGDvgqjgHGLmSU4=
X-Received: by 2002:ac8:7f44:0:b0:500:d108:275b with SMTP id d75a77b69052e-506a8261401mr189490801cf.5.1771350615435;
        Tue, 17 Feb 2026 09:50:15 -0800 (PST)
Received: from security.cs.northwestern.edu (security.cs.northwestern.edu. [165.124.184.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506847d9852sm186225731cf.7.2026.02.17.09.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 09:50:14 -0800 (PST)
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
To: Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ziyi Guo <n7l8m4@u.northwestern.edu>
Subject: [PATCH net v2] net: usb: kaweth: remove TX queue manipulation in kaweth_set_rx_mode
Date: Tue, 17 Feb 2026 17:50:12 +0000
Message-Id: <20260217175012.1234494-1-n7l8m4@u.northwestern.edu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[u-northwestern-edu.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[northwestern.edu : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33413-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[n7l8m4@u.northwestern.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[u-northwestern-edu.20230601.gappssmtp.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[u-northwestern-edu.20230601.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,northwestern.edu:email,u.northwestern.edu:mid]
X-Rspamd-Queue-Id: 3F88214EBDE
X-Rspamd-Action: no action

kaweth_set_rx_mode(), the ndo_set_rx_mode callback, calls
netif_stop_queue() and netif_wake_queue(). These are TX queue flow
control functions unrelated to RX multicast configuration.

The premature netif_wake_queue() can re-enable TX while tx_urb is still
in-flight, leading to a double usb_submit_urb() on the same URB:

kaweth_start_xmit() {
    netif_stop_queue();
    usb_submit_urb(kaweth->tx_urb);
}

kaweth_set_rx_mode() {
    netif_stop_queue();
    netif_wake_queue();             // wakes TX queue before URB is done
}

kaweth_start_xmit() {
    netif_stop_queue();
    usb_submit_urb(kaweth->tx_urb); // URB submitted while active
}

This triggers the WARN in usb_submit_urb():

  "URB submitted while active"

This is a similar class of bug fixed in rtl8150 by

- commit 958baf5eaee3 ("net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast").

Also kaweth_set_rx_mode() is already functionally broken, the
real set_rx_mode action is performed by kaweth_async_set_rx_mode(),
which in turn is not a no-op only at ndo_open() time.

Suggested-by: Paolo Abeni <pabeni@redhat.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
---
v2:
 - Add fixes tag, net prefix and Suggested-by tag.
 - Add explanation of safety of removing netif_stop_queue().

 drivers/net/usb/kaweth.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/kaweth.c b/drivers/net/usb/kaweth.c
index c9efb7df892e..e01d14f6c366 100644
--- a/drivers/net/usb/kaweth.c
+++ b/drivers/net/usb/kaweth.c
@@ -765,7 +765,6 @@ static void kaweth_set_rx_mode(struct net_device *net)
 
 	netdev_dbg(net, "Setting Rx mode to %d\n", packet_filter_bitmap);
 
-	netif_stop_queue(net);
 
 	if (net->flags & IFF_PROMISC) {
 		packet_filter_bitmap |= KAWETH_PACKET_FILTER_PROMISCUOUS;
@@ -775,7 +774,6 @@ static void kaweth_set_rx_mode(struct net_device *net)
 	}
 
 	kaweth->packet_filter_bitmap = packet_filter_bitmap;
-	netif_wake_queue(net);
 }
 
 /****************************************************************
-- 
2.34.1


