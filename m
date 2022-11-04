Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECF16197DC
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 14:28:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbiKDN2k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 09:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbiKDN1a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 09:27:30 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7DF2EF77
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 06:25:51 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id m14-20020a17090a3f8e00b00212dab39bcdso8234148pjc.0
        for <linux-usb@vger.kernel.org>; Fri, 04 Nov 2022 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3o5onhu2h+EBortzNBW4avrwkQNwITmrCAW7eMArF9k=;
        b=a4AMDVrzwKyTXEwmdP1hFV5autumUDkjlZiNwpkrfjwyOyMx8zytLwWVpBP6Aei5mB
         vmUAiWSn4BHtRP3VPT3cQeOgR7Y8ln/ewp5hNSkIuPbMOkzMUt0ACauq2pFfALJEn5Zw
         9OubjbAps1z/EmEB8KTURaOPNeeX4Jzukp6XJ1Yxjy8hIv6t44w9KnOx3K2mGAZJgXXD
         65RyDRWeN4jrxUyoDDyU+UXYN8DDXQ7K7Qlrqy+9TrBe+0fJm8TU92DLtXORMekCQ5WA
         mBvsZCtLnijt+JUADH2Y2ABLEdjc2PqDH/VOSYy7tGp5pB/P+wXyQyJRT1a6u7w9sOBn
         3Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o5onhu2h+EBortzNBW4avrwkQNwITmrCAW7eMArF9k=;
        b=h0m7fS3fTzFW5zSwb4/FDZymYXdHmysLEbdkDu+MCfM6uz0b0urCMIjqF6XzU5S2ng
         E3HbLOKLr5roye8ZoK/f0Ck7lN8OLdj3e/gSGkR5zaGUhuaImYsl9zwyaXnLsAdJB/8Q
         Q3meGYcyF6iQFdPgAUBcPzV9svw/tckbX7vnfucWhn/sxqbRRJ5rN9oyQswJBnczTswB
         Z7htqFpUzRpPQMam+4GF3fTUa3KmXlP569X0L6Axq9xqfWZwAWYXKrSQCQmK3+IMG18v
         vyWboBGUY+nAvmbBMR1evQtMJpoM0may2HN3IVToPppDeRS6DaThAPCNS6gzJefcTaZ5
         kBVA==
X-Gm-Message-State: ACrzQf0Na3x2oFIZ03lLVt1GsgvUkROe1ZSiiis94Ioc7rRkHml/MUB1
        RoiUT3NPY5v7+7C6c4N2XPXIIrZCH36Rsf9I
X-Google-Smtp-Source: AMsMyM6Dhjep9dXwgnE9RpDR3lCfYBejybArZt2vGGRR7YZAWj5+Iq8u5T/dxyKb0wTV5nwh7qZX8w==
X-Received: by 2002:a17:902:aa02:b0:186:9395:4e82 with SMTP id be2-20020a170902aa0200b0018693954e82mr36292986plb.5.1667568350265;
        Fri, 04 Nov 2022 06:25:50 -0700 (PDT)
Received: from albert-XPS-13-9360.. ([2405:6e00:490:8cdf:ad7d:ac3d:d463:5046])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b0017b264a2d4asm2655828pld.44.2022.11.04.06.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:25:49 -0700 (PDT)
From:   Albert Zhou <albert.zhou.50@gmail.com>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, nic_swsd@realtek.com,
        Albert Zhou <albert.zhou.50@gmail.com>
Subject: [PATCH net-next 1/2] Reverse 744d49daf8bd3b17b345c836f2e6f97d49fa6ae8 so that the v2 r8152 driver can use netif_set_gso_max_*
Date:   Sat,  5 Nov 2022 00:25:25 +1100
Message-Id: <20221104132526.64530-2-albert.zhou.50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104132526.64530-1-albert.zhou.50@gmail.com>
References: <20221104132526.64530-1-albert.zhou.50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

---
 include/linux/netdevice.h | 21 +++++++++++++++++++++
 net/core/dev.h            | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index eddf8ee270e7..8fa98c67a466 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -4952,6 +4952,27 @@ static inline bool netif_needs_gso(struct sk_buff *skb,
 			 (skb->ip_summed != CHECKSUM_UNNECESSARY)));
 }
 
+static inline void netif_set_gso_max_size(struct net_device *dev,
+					  unsigned int size)
+{
+	/* dev->gso_max_size is read locklessly from sk_setup_caps() */
+	WRITE_ONCE(dev->gso_max_size, size);
+}
+
+static inline void netif_set_gso_max_segs(struct net_device *dev,
+					  unsigned int segs)
+{
+	/* dev->gso_max_segs is read locklessly from sk_setup_caps() */
+	WRITE_ONCE(dev->gso_max_segs, segs);
+}
+
+static inline void netif_set_gro_max_size(struct net_device *dev,
+					  unsigned int size)
+{
+	/* This pairs with the READ_ONCE() in skb_gro_receive() */
+	WRITE_ONCE(dev->gro_max_size, size);
+}
+
 void netif_set_tso_max_size(struct net_device *dev, unsigned int size);
 void netif_set_tso_max_segs(struct net_device *dev, unsigned int segs);
 void netif_inherit_tso_max(struct net_device *to,
diff --git a/net/core/dev.h b/net/core/dev.h
index cbb8a925175a..c3a4dc66e4b3 100644
--- a/net/core/dev.h
+++ b/net/core/dev.h
@@ -88,25 +88,4 @@ int dev_change_carrier(struct net_device *dev, bool new_carrier);
 
 void __dev_set_rx_mode(struct net_device *dev);
 
-static inline void netif_set_gso_max_size(struct net_device *dev,
-					  unsigned int size)
-{
-	/* dev->gso_max_size is read locklessly from sk_setup_caps() */
-	WRITE_ONCE(dev->gso_max_size, size);
-}
-
-static inline void netif_set_gso_max_segs(struct net_device *dev,
-					  unsigned int segs)
-{
-	/* dev->gso_max_segs is read locklessly from sk_setup_caps() */
-	WRITE_ONCE(dev->gso_max_segs, segs);
-}
-
-static inline void netif_set_gro_max_size(struct net_device *dev,
-					  unsigned int size)
-{
-	/* This pairs with the READ_ONCE() in skb_gro_receive() */
-	WRITE_ONCE(dev->gro_max_size, size);
-}
-
 #endif
-- 
2.34.1

