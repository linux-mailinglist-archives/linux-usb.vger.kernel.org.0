Return-Path: <linux-usb+bounces-28603-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB6CB9A16D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 15:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B7C8324D7A
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 13:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0328D305E18;
	Wed, 24 Sep 2025 13:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkxO9eUm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D9305946
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758721450; cv=none; b=D16/2P74jnmZ2yb778TWvE5qPUNH8n/CrB3GZJndYELsrUh04YSz3OtWfpM9TMuNQspuycKQTeGdpQWXtbfHduKHdeqD/iHbOKCIET3gNqX3abLQ7C/F8ELh6z/FxHqNUREBF9BwLZUAPSdoWftjOMCkBoJkcJ6PFCMQKN7uuVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758721450; c=relaxed/simple;
	bh=4wLHZd33H8ehWtqgfz/soUMTx6YkXPchLkux0RhTQvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKjIbpWOPWuecaqmwdcHv/FEVvxrMLrHO717ziVoa/GvJOmhrHZNaZYu3KEDi43D3JGmKupQDLbDiDCLLLMQy4UXqffASqh1FSaNbSJxaEHxS9IHkXCQIapkqra+sInZjvRHMuUuOre1pqBZ5vUgixGfH+sFZv0ePCQb53VOzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkxO9eUm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32e74ae0306so822285a91.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 06:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758721448; x=1759326248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4ERu7wVLsz3ac7e7KRVwhrDHIHWN9PyFzkY9Sy5iLE=;
        b=kkxO9eUm2Ku2Qjpp8lbdcYaAvBnJIGyLS9CDBI7UA7+uOg0z3ro/1pVjObvJPpQ50r
         D5MwIV1FJaP8A03X+KdEksfQdr+jS24wSqKTw/yoaUc/WXFxG7tMnfSTfgYkSO8JQC+W
         ACKJMKomxTnx2mHCvGeTF2x4txyI+gllDSvZKN+bea1LHf/RKjLeGeWVn0+eifiH5ePK
         Z+CHBIJk3aSJEQUpC6rLrh4qXQ5etSErvpiRGfW94e1aMAcZUSUIlD0WAIKUd6xxxZU0
         I1chd7MmgkmvAceYl2pO3pQFC+DnAfncgDvWREXUwpGbX/7Ttu14lvp/0xoXRCstZzPm
         O/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758721448; x=1759326248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4ERu7wVLsz3ac7e7KRVwhrDHIHWN9PyFzkY9Sy5iLE=;
        b=gbdoIkolOtT18ud2Ko4cDgNBwT54LfDg2Q1P+daeBYAbmOcERjyLE4TvJErysYa9Zf
         P+LwWa7Rp0j+i09pExppOCxP07R+FSPKjSNnW2ZhyEA5DOoDJ3vouBuu47K17tBPFoAR
         KAguIbOE52bQQPRcnhmm+91WtRpZVSH/+8zyzVsHIXaUUB56ig8ExA9Vy4CLEkRw+2CI
         bsLggWXaxZ5BoZEiZQCrXlEgguo+zSyVX2nO4Rd9s//L10Nd/lxAsWM2usNTBPDxp0CA
         Accm+WCG/iNKKcO7iOiKikqswE57wqwZmiVoDudUpG5szePRj4yM58E+tv4r6dNHrCm+
         YK4A==
X-Gm-Message-State: AOJu0YxAlqY145FhPSiJKcGdeEwgjSr/J4FnXGtMXIruWTVG2GIirAWL
	bZl6DfLUBwPn+AAiZg06GFqZM0Fgs1R/Y6rvN8NfVc7yGx9nryh+ldKt
X-Gm-Gg: ASbGncvuexrHaauH93J2CTZfUBB4VSMKwpqid62Do1Mk9R4G5fK2kks1HQePuww2TP/
	4tDIJj3FNoKqVfRfLmjA0RD/zqJtiHNIsCFlZv/vMEscC7Bubl5OmVfW9u8iualtjl9klOWGDrO
	vV6oHLswuyOGBPXmlzHe0oDapWUaYJJBA1eRN3Ux3OE7K2yAYQ2vUfcxmA8tZRFiU7FOtPLwWil
	TJEsseT7N0omhbBjYBzhELX+J9aYqCo5RbEe7UayP3kM1I+MHAVCVSqzitaHnW1NKQ1POIaDxMd
	XQTdjutv7eU+70ZvA8byI2Hm0LreSw9aP09JxLs+gkjg4/OpP33uSPYOXBFx7RYgAsDVXzpIEb5
	2MGqLQiseMLzlXHv6qaC3jCw67D0ALujsD665jc7cgoC8LDN9Q31BFLLdstcZcBIOC+6S2CtAbj
	EuXNA+Ta+4JhM5
X-Google-Smtp-Source: AGHT+IE/4+SM58UU/wqTR/yIT31R0oJ4u37QZEN5c3JMJpyuvVeiCRq+ypyCOhvw3JyqJDdBS271KQ==
X-Received: by 2002:a17:90b:3fce:b0:32e:dcc6:cd3f with SMTP id 98e67ed59e1d1-3341bfeffbdmr2681721a91.14.1758721447987;
        Wed, 24 Sep 2025 06:44:07 -0700 (PDT)
Received: from debian.domain.name ([223.181.105.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341be45620sm2486219a91.29.2025.09.24.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:44:06 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: kuba@kernel.org,
	michal.pecio@gmail.com,
	edumazet@google.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	petkan@nucleusys.com,
	pabeni@redhat.com
Cc: linux-usb@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	I Viswanath <viswanathiyyappan@gmail.com>,
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Subject: [PATCH net v3] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
Date: Wed, 24 Sep 2025 19:13:50 +0530
Message-ID: <20250924134350.264597-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported WARNING in rtl8150_start_xmit/usb_submit_urb.
This is the sequence of events that leads to the warning:

rtl8150_start_xmit() {
	netif_stop_queue();
	usb_submit_urb(dev->tx_urb);
}

rtl8150_set_multicast() {
	netif_stop_queue();
	netif_wake_queue();		<-- wakes up TX queue before URB is done
}

rtl8150_start_xmit() {
	netif_stop_queue();
	usb_submit_urb(dev->tx_urb);	<-- double submission
}

rtl8150_set_multicast being the ndo_set_rx_mode callback should not be 
calling netif_stop_queue and notif_start_queue as these handle 
TX queue synchronization.

The net core function dev_set_rx_mode handles the synchronization
for rtl8150_set_multicast making it safe to remove these locks.

Reported-and-tested-by: syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=78cae3f37c62ad092caa
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Tested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
v1: 
Link: https://lore.kernel.org/netdev/20250920045059.48400-1-viswanathiyyappan@gmail.com/
 
v2:
- Add explanation why netif_stop_queue/netif_wake_queue can be safely removed
- Add the net prefix to the patch, designating it to the net tree
Link: https://lore.kernel.org/netdev/20250920181852.18164-1-viswanathiyyappan@gmail.com/
 
v3:
- Simplified the event sequence that lead to the warning
- Added Tested-by tag

 drivers/net/usb/rtl8150.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index ddff6f19ff98..92add3daadbb 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -664,7 +664,6 @@ static void rtl8150_set_multicast(struct net_device *netdev)
 	rtl8150_t *dev = netdev_priv(netdev);
 	u16 rx_creg = 0x9e;
 
-	netif_stop_queue(netdev);
 	if (netdev->flags & IFF_PROMISC) {
 		rx_creg |= 0x0001;
 		dev_info(&netdev->dev, "%s: promiscuous mode\n", netdev->name);
@@ -678,7 +677,6 @@ static void rtl8150_set_multicast(struct net_device *netdev)
 		rx_creg &= 0x00fc;
 	}
 	async_set_registers(dev, RCR, sizeof(rx_creg), rx_creg);
-	netif_wake_queue(netdev);
 }
 
 static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
-- 
2.47.3


