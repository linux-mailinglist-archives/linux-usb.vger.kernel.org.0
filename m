Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2C33B914F
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 13:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236291AbhGALv0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 07:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236287AbhGALv0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 07:51:26 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 540D4C061756
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 04:48:56 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id g24so4074678pji.4
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 04:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=40hk2UKCucED2JvsthYv/hJYjyDf5D1LuQwzsb/vpGM=;
        b=KYCsnlyv7f6188gFGR2vyzcJ9civF4+0g6sv90xIgHzyzZkusKH4UUVs326FYgxmOi
         lf/faXDbuJtZS5jSoJ9tC3py3xc+FN9mDoDClaCnLKDjZQq2viZkto9u8VYK2uQ216K+
         u5cWCUgoA+/3lHh0F7d8qXnog03ZA3Oq8HBPaPIHl+/QDE++7/AkqVPagc/EbxXKTggt
         xA9eppj0yP/lxs/9kDQmPBkEMhOg++IIZ262T1SfK6nuHx/DDQVTwRdCamrHCzu70v/P
         1AlKB7H4MQVXMck08dhgQhGtVwYnIRCqEzTez8yKHmyHRpiGJmFq14zF3LPvQDlEk0lL
         5PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=40hk2UKCucED2JvsthYv/hJYjyDf5D1LuQwzsb/vpGM=;
        b=SiZjxcmpAAUQxiSFTed3CKFBWlTOH/69RIHcqzSh0UYR0EtjcmLPJWBVJ+wX//btpa
         zKn7ISJdcNfbcQ01ZCP4XuWgzmGyj/87cYK90+dXWKQIBPbIozIfQKENvG94FbrfoHiq
         aAaMVSIp8fwLFZdgLYaLj4OiTgm8FkamKrTpJcuRBRNUNaBknGPC0FBRr1iL2Ei8+fup
         bveAO1Q/doos+aa8yAvC+7U2xjdAQBTkYJ90MBj6UB0L6aB5d7E3BJS+aJ+QysfCMVsS
         g+GT/Il/1aDEXLvROwm7iTW/KQkT5vjiIuyKnw4Uv4xgFpBYdZcsQGhKHRbML9zF1wjS
         ih4A==
X-Gm-Message-State: AOAM5322gBokgXuWv43PoHpObhQahrQVblsvgbanl5CenbDzIhG56f6S
        Y3sl76AvMRViamIEuqoucyw=
X-Google-Smtp-Source: ABdhPJwFGuOpahXmkzNYOXHFx7Sw5C6xRn24GJaqPyxT0Xrn13Cki8ohhrQRn56UdNdNeYitwvrxVw==
X-Received: by 2002:a17:90a:be0e:: with SMTP id a14mr9516217pjs.43.1625140135889;
        Thu, 01 Jul 2021 04:48:55 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:200:6c1:7d8f:dfdc:fc1e])
        by smtp.gmail.com with ESMTPSA id w2sm24600601pjq.5.2021.07.01.04.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:48:55 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH 6/6] usb: gadget: u_ether: fix a potential null pointer dereference
Date:   Thu,  1 Jul 2021 04:48:34 -0700
Message-Id: <20210701114834.884597-6-zenczykowski@gmail.com>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210701114834.884597-1-zenczykowski@gmail.com>
References: <20210701114834.884597-1-zenczykowski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Maciej Żenczykowski <maze@google.com>

f_ncm tx timeout can call us with null skb to flush
a pending frame.  In this case skb is NULL to begin
with but ceases to be null after dev->wrap() completes.

In such a case in->maxpacket will be read, even though
we've failed to check that 'in' is not NULL.

Though I've never observed this fail in practice,
however the 'flush operation' simply does not make sense with
a null usb IN endpoint - there's nowhere to flush to...
(note that we're the gadget/device, and IN is from the point
 of view of the host, so here IN actually means outbound...)

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/u_ether.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index d1d044d9f859..85a3f6d4b5af 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -492,8 +492,9 @@ static netdev_tx_t eth_start_xmit(struct sk_buff *skb,
 	}
 	spin_unlock_irqrestore(&dev->lock, flags);
 
-	if (skb && !in) {
-		dev_kfree_skb_any(skb);
+	if (!in) {
+		if (skb)
+			dev_kfree_skb_any(skb);
 		return NETDEV_TX_OK;
 	}
 
-- 
2.32.0.93.g670b81a890-goog

