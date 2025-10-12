Return-Path: <linux-usb+bounces-29180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F957BD0BE8
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 22:00:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 052704EA691
	for <lists+linux-usb@lfdr.de>; Sun, 12 Oct 2025 20:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A975A21FF30;
	Sun, 12 Oct 2025 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceYVgSEK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744373A8F7
	for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 20:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760299250; cv=none; b=qwSk/WFaidSG6RY311oNyn/609BMph6lnpqa4+7nfruXMIyf4ngg9YbUY4x5gLgGs3b8pVgmkefS3L20UqXcTMCvcOTXajc98gjOEW3rlri7F1wcOcjw/bvjGJVgQUJ9+x8c+FlNjB3egg7TZ11qJCV2y3qGW6xTzQh1HIGV0h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760299250; c=relaxed/simple;
	bh=gsR6VLtEWh7Ep7Ju4BrPFAE2zcsW59Ip654xHVUfQTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HsvTLKG63/Tiz/fnLlkoeE44xDCYBgePGwYXb3eArFEzQcJgOLHwFilAhGTV6eIvunq/J2xfgu5IcZ+knVe8KrPfq7HhQDbgYl9XDuYf2hM5R72tM3gaFcoN89gFSLmQS8ilmq6jn00IfW9f04+1sf0oKVrltcyPoq3nxdpRhVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceYVgSEK; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-639df8d869fso6744891a12.0
        for <linux-usb@vger.kernel.org>; Sun, 12 Oct 2025 13:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760299247; x=1760904047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qhBizdbTK0z+OclNT8Vb7bFkHGH494w/g8TAfLl99kc=;
        b=ceYVgSEKYo9HQ2EpicwV4tUvownrShgL9CFnw7TjLMqZVb4cVGmmsfXJ3ZL5hQ9EJ6
         UHOU7t1y9Pstw4nMMzD1Az7YfwdtZTJevI+DoAF0s4JA4hIZ7ud7p6I9N/G0pbUEvImr
         orpryvnIZB0VwJYvM2ku7dnLgH6KfuMkAKqaRyJ0EEX7TrSE7YEDgG6LEoMmlUE4MeZM
         m6Uhfrp+lbu//GPKKRqg/opq/KfJp3jJtgrZ7O/9FsN6yiRVCiiKnLjJq0BaAiUytpbG
         RuRP1T/r+rTiXTa8NS7VORrQLBMyyfdIk9FambNx+GtjBT3sydNVGLWZOTmqFMdxfljl
         dVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760299247; x=1760904047;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhBizdbTK0z+OclNT8Vb7bFkHGH494w/g8TAfLl99kc=;
        b=vYcCeejZ7FByzuGRUvylzJFSvTNCM7SNelM+HyJANUZPe817D0GkWAOYZhOJtAm4bz
         +055OTrFsVXE2gnRfRoyosKoSqLnmsPJ/AJCaNmLlEm2zSWXTIZtllCQKQarQdQb78dl
         9FFibVlqqyLvNWMP4sW9ttfeikwk9NDzcIKlH1/jYMpWWWvm3eiwFLQuF1DDTnfcemuI
         KKl/qJJGF1I5ttLwhyrWQe+C6D2rrosrNE65WlYCmTDbG6gtPqN+K/Upvcemg26rvQdY
         7tKfZR0EWWFWgOl+crn2a0dr9vToFgNukMNZw3C32gnz6bftgy9BCgQ/X96ctMAm1l4y
         CpJg==
X-Gm-Message-State: AOJu0Yxmnw8HIkSbrudgkcj5FAJX07VTXCIgY5njdEYCfkFhIJTtGeUo
	G1eL8UhfIgYj/n8KESUgELAvbpV4s/zIuQ3xRO9mBcmfFLC9KU71SEZv
X-Gm-Gg: ASbGncsr0caIX1+j64Ek0cl8W6EtmKprknL96KsWOoli0/TePGdkeBDVz2Bj162EcT8
	rl8oZ4ZnnfjjmxNdAR6G4+4B26WpIy5+JRGIoLrbBt2u1PnJCw40Bqaq9gaqly57iTW+0h2B9kH
	e2ycJ4pJwHI0HcpXFaSI7L7jtSS3LaU5qytoPdKdBm2VcNOcYGblHphUOQXt6nrXyKKw266uTRM
	rJCYD8BxFVPN1Z8sdmm5y1JPHWhCr3K0QoEGk6+9zeQu7Yt/BVv9TXRbN/MHIs78GY8QPvKgpp4
	M2EkRkeIsn6sfU4U9c+nINfz+W10JX06mBq7zk67cEx7H1qNqZi/+/deSaZG/ekTuWOHwRR6Yxl
	BaX45Nd8EBKDiEG6/j7yD7pqUdFYLazReOdAlxASvppCIV07nnrDviA==
X-Google-Smtp-Source: AGHT+IEuMwBGN8leVN09ZBnD48z+ZF3LbUxEgujm4n8TM9fKLeko+pSXEDUltw4QDk+L+Sj011ZL+w==
X-Received: by 2002:a05:6402:3510:b0:634:c4b5:5d7 with SMTP id 4fb4d7f45d1cf-639d5c6fadamr17675616a12.34.1760299246552;
        Sun, 12 Oct 2025 13:00:46 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c1348b2sm7454711a12.37.2025.10.12.13.00.44
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 12 Oct 2025 13:00:46 -0700 (PDT)
Date: Sun, 12 Oct 2025 22:00:42 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] net: usb: rtl8150: Fix frame padding
Message-ID: <20251012220042.4ca776b1.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

TX frames aren't padded and unknown memory is sent into the ether.

Theoretically, it isn't even guaranteed that the extra memory exists
and can be sent out, which could cause further problems. In practice,
I found that plenty of tailroom exists in the skb itself (in my test
with ping at least) and skb_padto() easily succeeds, so use it here.

In the event of -ENOMEM drop the frame like other drivers do.

The use of one more padding byte instead of a USB zero-length packet
is retained to avoid regression. I have a dodgy Etron xHCI controller
which doesn't seem to support sending ZLPs at all.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/net/usb/rtl8150.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 92add3daadbb..d6dce8babae0 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -685,9 +685,14 @@ static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
 	rtl8150_t *dev = netdev_priv(netdev);
 	int count, res;
 
+	/* pad the frame and ensure terminating USB packet, datasheet 9.2.3 */
+	count = max(skb->len, ETH_ZLEN);
+	if (count % 64 == 0)
+		count++;
+	if (skb_padto(skb, count))
+		return NETDEV_TX_OK;
+
 	netif_stop_queue(netdev);
-	count = (skb->len < 60) ? 60 : skb->len;
-	count = (count & 0x3f) ? count : count + 1;
 	dev->tx_skb = skb;
 	usb_fill_bulk_urb(dev->tx_urb, dev->udev, usb_sndbulkpipe(dev->udev, 2),
 		      skb->data, count, write_bulk_callback, dev);
-- 
2.48.1

