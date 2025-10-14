Return-Path: <linux-usb+bounces-29294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FF4BDAF51
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 20:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 61DAD352FFE
	for <lists+linux-usb@lfdr.de>; Tue, 14 Oct 2025 18:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 323322BF3E2;
	Tue, 14 Oct 2025 18:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fk9J+W+8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149BF27FB2A
	for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 18:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760466945; cv=none; b=DfXd0zqTMiaph87nyqW3x15jzmKCBNXH8ql4VIUzvUs/nAMbTjOfJ/322IOObWH8amBwS0KA0+BraulSaTQRcHBaccf9pIUAUq5nTxmwGpgH9PTkha7sVrrvRd782LZ8knQJEvrDrKdjgSo+9Ns9UyTf07+bDOdawYC3KsGfz34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760466945; c=relaxed/simple;
	bh=7ihomR4ZLmJ+D69l27qwDNTNJ7neWtqDmKaPsFaYGOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GwT7SEMSKKgyMxFPVfdi+O6dWUoGLRlLCurBYTwKD9JlNtCxcSTGofITLAMDZzYljT8K6Vh9X9NR1xkMehTOHidginpSm9KzLbHthHElVYWoA1l3kMgUnUcSdudFtip+TGSkr5fNRXCIhUGi/YFkQk2+4SyKLVWKosi/Tjs0Eo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fk9J+W+8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso12842053a12.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 11:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760466939; x=1761071739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vpww0uRzesUwhHo4ZMmhfa/PCAFNQaWjF5kzNzK8A/g=;
        b=Fk9J+W+8shRqakN3uXz+AP1nV5s3tknv2k3zSINIdHtw+x2Ge9kotcG8/F7LPYlONU
         QqimL9BqQDRYj2VguuW5u3a/0/bE4L/cRM6j1QdTGYV27FMrhalF4hyu6cCR1me3/ySw
         OBchhNDuKNHMp0BybH1gYwHaPQ2RVS7cLKlSU2i6O9N+TNDr/f0UjIdD4Ndtx2x0RChB
         SnYoGr/CB9JxttFQa1IFKIS4n9ifQnhkRn3a/RziIjUU/FwsGkpW01mcrDJ9NCVVYfDG
         hRq9eQvBsF31zlEKKG6vdJlUSeACbdHobFEY3CuWJE+lBXoS0mXniMfp7zWd9CqPTwqs
         iPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760466939; x=1761071739;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vpww0uRzesUwhHo4ZMmhfa/PCAFNQaWjF5kzNzK8A/g=;
        b=fCRYPNLeO5Hc0szQrq+huCDuMWjDKjD/bHVQ2Z9aH+EFDW6Oz2Bya8U4Q3KvA/IGl8
         jos5tbnBQbRx26eTJNdVwLGmoa3uYbcYngpauv/lTQTILyullcv42F1/Y3KOMFdZqMgZ
         CWGQ6XxsaUASCVr8wQ6nV00JG+g+cAofuZSFmE3cJiFDniwXJkqpf2dmFwyfMyvk2/eh
         eboLopdr4YfbN3LdbmEWWiKx54ILJPZendZP+/q54fXlg9LaJv9Iucjr8JrXYXG+RwAE
         rsTM004uXAEdIUYh7wQ6MMUR1q43b4U7meA3OYMD14YgqPlS4d5RUxswbMgHSEnd1LE8
         hT6w==
X-Gm-Message-State: AOJu0YwotEpxoGG6xNm8yLwgDwwGnYKSpnwiyl11GgwJTSg8cXT4CXKj
	M6xGHoMb+2z9T1QeO5QDAnO6r60+K4e2d6xBYNfWPXSyuFvRuI4MkQJ6
X-Gm-Gg: ASbGncs5CZPFEf9UZRi9RBcGcnW3YWE6O3+MJGwneeObvOslqUWm4d7hUvZ7G96Cr+9
	OXKOCxPRuwEJ03gpI/x1XH1o1ZADIunJd656JI427nhOeiJXN0Pm+fP/OiuHK1kWM/Qy3bYaPIU
	ncwMjVZkqyPgbo/+na0M+9xA9EPK9ZNinGKD8lQ4j4Rvh8q21FLPSY9ndkLt4Bm5ZbKnnZtgegQ
	QQnJBca05PDWBdjChp1sQXlanQ0q62kDhmY2IU+1Eh8facE9sebcHJoRNG+rL+pxZK5ytuxDvYq
	CMEZPmDxjIo2GmYrrmVgy509Ns22Ybxop4GpEy4zUH1FL9Pjd3qS/aFNN3WdDIpSOn0cVOLjEPf
	9YnttQYiAoCR1N52kUGcx1EX+Ri/MzsCza9euCTLrLRACYdYsNelbYLLldQ==
X-Google-Smtp-Source: AGHT+IHlOOKTCGXDba2LhUQoWTaxK6wMg6wcVm4ZzOdSoGJ1O9n6kWEoRui5yFsaklG9CzhbVP2v6g==
X-Received: by 2002:a17:907:da7:b0:b41:c602:c747 with SMTP id a640c23a62f3a-b50aa48d83dmr2606822766b.7.1760466939119;
        Tue, 14 Oct 2025 11:35:39 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb965ddf5sm38482566b.15.2025.10.14.11.35.37
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 14 Oct 2025 11:35:38 -0700 (PDT)
Date: Tue, 14 Oct 2025 20:35:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Petko Manolov <petkan@nucleusys.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: [PATCH net v2] net: usb: rtl8150: Fix frame padding
Message-ID: <20251014203528.3f9783c4.michal.pecio@gmail.com>
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

v2: update TX stats when dropping packets

v1: https://lore.kernel.org/netdev/20251012220042.4ca776b1.michal.pecio@gmail.com/

 drivers/net/usb/rtl8150.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index 92add3daadbb..278e6cb6f4d9 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -685,9 +685,16 @@ static netdev_tx_t rtl8150_start_xmit(struct sk_buff *skb,
 	rtl8150_t *dev = netdev_priv(netdev);
 	int count, res;
 
+	/* pad the frame and ensure terminating USB packet, datasheet 9.2.3 */
+	count = max(skb->len, ETH_ZLEN);
+	if (count % 64 == 0)
+		count++;
+	if (skb_padto(skb, count)) {
+		netdev->stats.tx_dropped++;
+		return NETDEV_TX_OK;
+	}
+
 	netif_stop_queue(netdev);
-	count = (skb->len < 60) ? 60 : skb->len;
-	count = (count & 0x3f) ? count : count + 1;
 	dev->tx_skb = skb;
 	usb_fill_bulk_urb(dev->tx_urb, dev->udev, usb_sndbulkpipe(dev->udev, 2),
 		      skb->data, count, write_bulk_callback, dev);
-- 
2.48.1

