Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A8A3B914E
	for <lists+linux-usb@lfdr.de>; Thu,  1 Jul 2021 13:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236282AbhGALvZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Jul 2021 07:51:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236276AbhGALvZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Jul 2021 07:51:25 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4055C061756
        for <linux-usb@vger.kernel.org>; Thu,  1 Jul 2021 04:48:54 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id y17so5802546pgf.12
        for <linux-usb@vger.kernel.org>; Thu, 01 Jul 2021 04:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C8QQefVmPh6Ww9YMKvzZ1aOkDSNkE5hbfZJo6u+uddE=;
        b=LCrGq+hGC0bjX+AgeBvCFisf19+LvL3LJhZ36T9Ww4Mc+cbHAANL3NUv7+PnzbRcMu
         tCl3FmX/B1yAYgHUt6SBOQUaPAmQWAC22s09pwyt7noTgL+i5anMr+B/97r70lnrXhwW
         fH262u9D08u8deOij+t25VmQxvpprPbjkMW80WXQ3YoLS+gcMEUtY3Q85tnwe+5uikpM
         9WoAtgRxxr7IMVNAVaHRKc51slAbRSM+XnKbCGZ2RF69i9RwoGi4WVIvY27BYXjcP/pK
         VsxHmWTxwwV/SGtFOlBM+sBajK9j1WL/eOWTVb2RLw8Wkm+iCjDv9vpJr6SgokC1idsu
         OOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C8QQefVmPh6Ww9YMKvzZ1aOkDSNkE5hbfZJo6u+uddE=;
        b=rWe5ZMYiQrkwXh1s4FGktoVrhoW2OXiR0kdpRIoBbOXr7sr3Q01AyVF4pNU9z/KK9E
         756nvuW63YFtsPljM6gkrIZUZu9Kqw/RO+yzbjH+pDUvr08zbzP4/ijVIOBK7uT9TBXg
         Irc2hXD4UsKHiCCiISXkJS9jE4VieyhJ5pGjLOLXkaMhEL3mclsUZ/UIOFPKoIbdTHjp
         yYk7pkQblxXf0L1S/Ojd0jADDmU62KsL3MelAhYputiVhNJR3Eq4fpZwO4mwJLk0KITI
         P7W+GmGZvyrVa2R+hA1DJ8QtrVOGKXWeWjhE/ByaqDhhdP+wecZqsqB5gFQ+0xWZaq5m
         fKzA==
X-Gm-Message-State: AOAM533iDmNiTH7wvvdX9NR816knsrl2wsRubKxDcRkaIznHLvu1Z63g
        EL2kZ0n2JBbyUUIoW188BwI=
X-Google-Smtp-Source: ABdhPJynjuT8F0v30Yh/VdeMkVjtXK/Exl0zbkzWscJRvWJZVdLMJ0OzcAatm7MKFBVNG7b258PUuw==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr38877782pgt.307.1625140134396;
        Thu, 01 Jul 2021 04:48:54 -0700 (PDT)
Received: from athina.mtv.corp.google.com ([2620:15c:211:200:6c1:7d8f:dfdc:fc1e])
        by smtp.gmail.com with ESMTPSA id w2sm24600601pjq.5.2021.07.01.04.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:48:53 -0700 (PDT)
From:   =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <zenczykowski@gmail.com>
To:     =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Brooke Basile <brookebasile@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lorenzo Colitti <lorenzo@google.com>
Subject: [PATCH 5/6] usb: gadget: f_ncm: ncm_wrap_ntb - move var definitions into if statement
Date:   Thu,  1 Jul 2021 04:48:33 -0700
Message-Id: <20210701114834.884597-5-zenczykowski@gmail.com>
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

Since they're only used if there's an skb.

Cc: Brooke Basile <brookebasile@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lorenzo Colitti <lorenzo@google.com>
Signed-off-by: Maciej Żenczykowski <maze@google.com>
---
 drivers/usb/gadget/function/f_ncm.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index cab17ae4fa34..dc8f078f918c 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1013,19 +1013,20 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
 {
 	struct f_ncm	*ncm = func_to_ncm(&port->func);
 	struct sk_buff	*skb2 = NULL;
-	int		ncb_len = 0;
-	__le16		*ntb_data;
-	__le16		*ntb_ndp;
-	int		dgram_pad;
-
-	unsigned	max_size = ncm->port.fixed_in_len;
-	const struct ndp_parser_opts *opts = ncm->parser_opts;
-	const int ndp_align = le16_to_cpu(ntb_parameters.wNdpInAlignment);
-	const int div = le16_to_cpu(ntb_parameters.wNdpInDivisor);
-	const int rem = le16_to_cpu(ntb_parameters.wNdpInPayloadRemainder);
-	const int dgram_idx_len = 2 * 2 * opts->dgram_item_len;
 
 	if (skb) {
+		int		ncb_len = 0;
+		__le16		*ntb_data;
+		__le16		*ntb_ndp;
+		int		dgram_pad;
+
+		unsigned	max_size = ncm->port.fixed_in_len;
+		const struct ndp_parser_opts *opts = ncm->parser_opts;
+		const int ndp_align = le16_to_cpu(ntb_parameters.wNdpInAlignment);
+		const int div = le16_to_cpu(ntb_parameters.wNdpInDivisor);
+		const int rem = le16_to_cpu(ntb_parameters.wNdpInPayloadRemainder);
+		const int dgram_idx_len = 2 * 2 * opts->dgram_item_len;
+
 		/* Add the CRC if required up front */
 		if (ncm->is_crc) {
 			uint32_t	crc;
-- 
2.32.0.93.g670b81a890-goog

