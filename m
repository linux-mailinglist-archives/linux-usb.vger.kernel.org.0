Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 759295A5AF5
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 07:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbiH3FAK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 01:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiH3FAI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 01:00:08 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92580F5B8
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 22:00:01 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id e28so7755425qts.1
        for <linux-usb@vger.kernel.org>; Mon, 29 Aug 2022 22:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=I53anoOXNt7rTHSRPo4j42KHm4z7y87xF4J5ljpGIqM=;
        b=Htu05WzvVRDm+Xumm+rHwVxvbnwoRA05W1J1mp3J6WLjalNXIoCQyffl+/icOznwrz
         WadY5GW0Pqy+ESMgOiztmpjcc4+UfK97vPA1lu52B2w1zZZc+qg/DOvrXh4SN53Sf666
         LS85RWAiXu6i0WFoePcb8C9Fy/S76+YdtvXUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=I53anoOXNt7rTHSRPo4j42KHm4z7y87xF4J5ljpGIqM=;
        b=AQWkIHRxDfzWVISb9x4gYYHGJP1N4zcOv867iM4VFQNJ4lp1cc6Vo3HOc002pfIldy
         KqbTFsAgnDZ1WMcOOgGuaEkOTabE8IZI0W7aGUP3hHBgrVZkXW6O9WRdWwPS0+g3x0I7
         Zd2fgsxflubZyLebLbC9WnKDh6DAoBUAqTbPTiInGvX8rBkzNwrmu0MPojzMU9hCuGzG
         0VKlI5tpE77kaRqiHioPpzeXu2lyjKH3ygC3J8VSlWUh6xNJ5v5Nn9WjtHeWK1+dIPEr
         +b22a3GQbvNfGnhazVFl7I6nSS243Yn98SkQ49p1sA0akSJrAqT1F8/kNjTkOYzG1f+U
         pxkA==
X-Gm-Message-State: ACgBeo3E2co1shEaF3LTYHpW/a/hHMrCEmruExjYe5gQxZ6WUzgIJjsI
        fn6nKFNkg+d+d2gJ/mhj+WCN3g==
X-Google-Smtp-Source: AA6agR71cY3PDc8ND17Ruv81ez8CXnnUQ0EHo2jFhVWRNeAlHJ0/IDfcL8p62fd0iPZ1EAxAmk+hoQ==
X-Received: by 2002:a05:622a:344:b0:343:6a5f:321 with SMTP id r4-20020a05622a034400b003436a5f0321mr12655063qtw.204.1661835600783;
        Mon, 29 Aug 2022 22:00:00 -0700 (PDT)
Received: from trappist.c.googlers.com.com (48.230.85.34.bc.googleusercontent.com. [34.85.230.48])
        by smtp.gmail.com with ESMTPSA id dm56-20020a05620a1d7800b006b941e994fasm6981047qkb.14.2022.08.29.22.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 22:00:00 -0700 (PDT)
From:   Sven van Ashbrook <svenva@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Alex Levin <levinale@google.com>,
        Chithra Annegowda <chithraa@google.com>,
        Frank Gorgenyi <frankgor@google.com>,
        Sven van Ashbrook <svenva@chromium.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        David Ober <dober6023@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Hao Chen <chenhao288@hisilicon.com>,
        Hayes Wang <hayeswang@realtek.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jean-Francois Le Fillatre <jflf_kernel@gmx.com>,
        Paolo Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH net-next v1] r8152: allow userland to disable multicast
Date:   Tue, 30 Aug 2022 04:59:39 +0000
Message-Id: <20220830045923.net-next.v1.1.I4fee0ac057083d4f848caf0fa3a9fd466fc374a0@changeid>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The rtl8152 driver does not disable multicasting when userspace asks
it to. For example:
 $ ifconfig eth0 -multicast -allmulti
 $ tcpdump -p -i eth0  # will still capture multicast frames

Fix by clearing the device multicast filter table when multicast and
allmulti are both unset.

Tested as follows:
- Set multicast on eth0 network interface
- verify that multicast packets are coming in:
  $ tcpdump -p -i eth0
- Clear multicast and allmulti on eth0 network interface
- verify that no more multicast packets are coming in:
  $ tcpdump -p -i eth0

Signed-off-by: Sven van Ashbrook <svenva@chromium.org>
---

 drivers/net/usb/r8152.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
index 688905ea0a6d..5e85b8bf9e87 100644
--- a/drivers/net/usb/r8152.c
+++ b/drivers/net/usb/r8152.c
@@ -2727,22 +2727,26 @@ static void _rtl8152_set_rx_mode(struct net_device *netdev)
 		ocp_data |= RCR_AM | RCR_AAP;
 		mc_filter[1] = 0xffffffff;
 		mc_filter[0] = 0xffffffff;
-	} else if ((netdev_mc_count(netdev) > multicast_filter_limit) ||
-		   (netdev->flags & IFF_ALLMULTI)) {
+	} else if ((netdev->flags & IFF_MULTICAST &&
+				netdev_mc_count(netdev) > multicast_filter_limit) ||
+			   (netdev->flags & IFF_ALLMULTI)) {
 		/* Too many to filter perfectly -- accept all multicasts. */
 		ocp_data |= RCR_AM;
 		mc_filter[1] = 0xffffffff;
 		mc_filter[0] = 0xffffffff;
 	} else {
-		struct netdev_hw_addr *ha;
-
 		mc_filter[1] = 0;
 		mc_filter[0] = 0;
-		netdev_for_each_mc_addr(ha, netdev) {
-			int bit_nr = ether_crc(ETH_ALEN, ha->addr) >> 26;
 
-			mc_filter[bit_nr >> 5] |= 1 << (bit_nr & 31);
-			ocp_data |= RCR_AM;
+		if (netdev->flags & IFF_MULTICAST) {
+			struct netdev_hw_addr *ha;
+
+			netdev_for_each_mc_addr(ha, netdev) {
+				int bit_nr = ether_crc(ETH_ALEN, ha->addr) >> 26;
+
+				mc_filter[bit_nr >> 5] |= 1 << (bit_nr & 31);
+				ocp_data |= RCR_AM;
+			}
 		}
 	}
 
-- 
2.37.2.672.g94769d06f0-goog

