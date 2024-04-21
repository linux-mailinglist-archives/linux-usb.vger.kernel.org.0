Return-Path: <linux-usb+bounces-9544-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F20A18AC0FB
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 21:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5D042811E2
	for <lists+linux-usb@lfdr.de>; Sun, 21 Apr 2024 19:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528923FBA4;
	Sun, 21 Apr 2024 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bGLGpp3j"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8879FD
	for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 19:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713728312; cv=none; b=E5nciZWvbyXGICq66w1AAaRkC3BcJj0MP+X/YthC/281UFW5rGKtUgcg53Tur2YxTEW+LZE67X9hm6rNy/VBgbPnHdNsdpkVuw7TyQxm//Lfmlds7jacrroULD3HgUXCnexxGIEM22R8aiSnjfEVl6qmkZYldM8oTiOYX8AOK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713728312; c=relaxed/simple;
	bh=NQ6jGcuJeh/p/1L3JgZ7DNU+1Z6CWWrISyazrIPTAcc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PiVCpQpwY8mOtCAWBi3dSA2sVtpaxT/1TZa575VkRK11MgaYU8CGS5tAFaiiiUUtYah/QYXk1tF7M978KQU33hUt5DAVSYNJwQTDQnCtefOJMpg1t+eUYZrDMCelhg0w4d+tkRXSJjwtnuCLTJu6lqktvPHM/U5aRYfUqUZKc2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bGLGpp3j; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edumazet.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de46f4eacd3so6965219276.3
        for <linux-usb@vger.kernel.org>; Sun, 21 Apr 2024 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713728310; x=1714333110; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9+SDkMfwULRoZeQrUX2iv0BBJGBbsaFvsR3oFiKSjB4=;
        b=bGLGpp3joZK7lCxrUorDp7c4xyxE0UD0NpdTlPSP+G1HqhKJPZdS5d4xV0QZ2tNP3X
         JgSNa2E0N239q1N4tqR0a9lqAuqsVsBjoovoRSGTXDr8M/xgDEYZjgD+0l01LlK9EIku
         fPfI9SZDXRYZDpXEssIHM8h+Skx2f6518HInfErzoB47KJFasRl5OGcTSIN+xwnYHgfr
         vHux1SNcSewBKzi72uoOfAvv8fItdugu0KoGbdGNGnrL6dAogKhXz5E7sV3PSvov8wop
         qmsT20yykvlnN32YNZSIYOt+qUf1znvpNRBVN44P7j15HO/XEvxdCLTvGy5BWD9XVxQr
         nDWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713728310; x=1714333110;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+SDkMfwULRoZeQrUX2iv0BBJGBbsaFvsR3oFiKSjB4=;
        b=SNvzAoI1U+3y2/GQC0X2XtY3DV1Fa2aqRSHmEU8zQww4oXnQ51+1aWThoXiOyeOMLu
         FU0BCGOmrJ+ZKEJYsteYlOCKLGEKGD54Wlc1wC1l+jAZ0z4vPJ5lWh/JMKoUKqRUVXeY
         YIIzAV08Wj9+L4asEoowmD1g0FfCcgB4NoKH9f8hsazNBfsBMXRhGHapf685LqDm16qa
         I2eyNo2Vek2zYszdvzBz+SuQ+6LouvY/utpyHLL5pExpB/AMDHyJ4ZOkuCY2MkLq3M2r
         7IBtVzEnDfR58oRqW9GXm5Gtq5h5Rax1pobdpiIlL3BO0YHkNYEGQsMlEqJRCxRdN33z
         Jacg==
X-Forwarded-Encrypted: i=1; AJvYcCWif5kpsNyvOjL94+wJ6vajIt6j43YV+Y19sSImyZNHGQi4ogAKuqnVTUvQdH4FO+t5Lj8q9WcFcCm8SPTbI1TOT82yYWQvURrY
X-Gm-Message-State: AOJu0YwP6GR7imp1y0nN0ck2TB8kq6pa0bJZ9rRe6qsJlnPMuvgwl5ra
	uRpD/90na5kJl7mxOZiDbbePDA3xI5Sh/zTEMnv7aeatOQfon1iBgLjz2urjmZr7Ufuu2YziWor
	6Oozor/LczQ==
X-Google-Smtp-Source: AGHT+IHL2C5MoyxhTwKcYbvzD7oOcmK2st6QSqadSAT5HJwQyi578v50yeaUVlRt+geimqSc549RQ7Ldb7a5iw==
X-Received: from edumazet1.c.googlers.com ([fda3:e722:ac3:cc00:2b:7d90:c0a8:395a])
 (user=edumazet job=sendgmr) by 2002:a05:6902:100e:b0:de4:c2d4:e14f with SMTP
 id w14-20020a056902100e00b00de4c2d4e14fmr2528790ybt.11.1713728310568; Sun, 21
 Apr 2024 12:38:30 -0700 (PDT)
Date: Sun, 21 Apr 2024 19:38:28 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240421193828.1966195-1-edumazet@google.com>
Subject: [PATCH net] net: usb: ax88179_178a: stop lying about skb->truesize
From: Eric Dumazet <edumazet@google.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, eric.dumazet@gmail.com, 
	Eric Dumazet <edumazet@google.com>, shironeko <shironeko@tesaguri.club>, 
	Jose Alonso <joalonsof@gmail.com>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Some usb drivers try to set small skb->truesize and break
core networking stacks.

In this patch, I removed one of the skb->truesize overide.

I also replaced one skb_clone() by an allocation of a fresh
and small skb, to get minimally sized skbs, like we did
in commit 1e2c61172342 ("net: cdc_ncm: reduce skb truesize
in rx path")

Fixes: f8ebb3ac881b ("net: usb: ax88179_178a: Fix packet receiving")
Reported-by: shironeko <shironeko@tesaguri.club>
Closes: https://lore.kernel.org/netdev/c110f41a0d2776b525930f213ca9715c@tesaguri.club/
Signed-off-by: Eric Dumazet <edumazet@google.com>
Cc: Jose Alonso <joalonsof@gmail.com>
Cc: linux-usb@vger.kernel.org
---
 drivers/net/usb/ax88179_178a.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
index 752f821a19901f313a1aca51fe332539ce82385b..df9d767cb524241848c744504d6e2999efc42ed5 100644
--- a/drivers/net/usb/ax88179_178a.c
+++ b/drivers/net/usb/ax88179_178a.c
@@ -1456,21 +1456,16 @@ static int ax88179_rx_fixup(struct usbnet *dev, struct sk_buff *skb)
 			/* Skip IP alignment pseudo header */
 			skb_pull(skb, 2);
 
-			skb->truesize = SKB_TRUESIZE(pkt_len_plus_padd);
 			ax88179_rx_checksum(skb, pkt_hdr);
 			return 1;
 		}
 
-		ax_skb = skb_clone(skb, GFP_ATOMIC);
+		ax_skb = netdev_alloc_skb_ip_align(dev->net, pkt_len);
 		if (!ax_skb)
 			return 0;
-		skb_trim(ax_skb, pkt_len);
+		skb_put(ax_skb, pkt_len);
+		memcpy(ax_skb->data, skb->data + 2, pkt_len);
 
-		/* Skip IP alignment pseudo header */
-		skb_pull(ax_skb, 2);
-
-		skb->truesize = pkt_len_plus_padd +
-				SKB_DATA_ALIGN(sizeof(struct sk_buff));
 		ax88179_rx_checksum(ax_skb, pkt_hdr);
 		usbnet_skb_return(dev, ax_skb);
 
-- 
2.44.0.769.g3c40516874-goog


